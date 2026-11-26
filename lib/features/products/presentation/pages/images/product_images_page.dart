
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../domain/entities/product/product_image.dart';
import '../../bloc/product_images/product_images_bloc.dart';
import '../../bloc/product_images/product_images_event.dart';
import '../../bloc/product_images/product_images_state.dart';

class ProductImagesPage extends StatefulWidget {
  final int productId;
  final String? productName;

  const ProductImagesPage({
    super.key,
    required this.productId,
    this.productName,
  });

  @override
  State<ProductImagesPage> createState() =>
      _ProductImagesPageState();
}

class _ProductImagesPageState extends State<ProductImagesPage> {
  final ImagePicker _picker = ImagePicker();

  static const Color primaryColor = Color(0xFF287E5D);
  static const Color darkGreen = Color(0xFF07513F);
  static const Color backgroundColor = Color(0xFFF5F8F6);

  @override
  void initState() {
    super.initState();

    final bloc = context.read<ProductImagesBloc>();

    bloc.add(ProductImagesEvent.load(
      productId: widget.productId,
    ));

    bloc.add(ProductImagesEvent.watch(
      productId: widget.productId,
    ));
  }

  // =========================================================
  // PICK IMAGE
  // =========================================================

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
        imageQuality: 85,
        maxWidth: 1600,
      );

      if (!mounted || pickedFile == null) return;

      await _previewAndSave(pickedFile);
    } catch (e) {
      if (!mounted) return;

      _showMessage(
        'تعذر اختيار الصورة: $e',
        isError: true,
      );
    }
  }

  // =========================================================
  // PREVIEW IMAGE
  // =========================================================

  Future<void> _previewAndSave(XFile file) async {
    final shouldSave = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                color: backgroundColor,
                child: const Text(
                  'معاينة الصورة',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: darkGreen,
                  ),
                ),
              ),

              AspectRatio(
                aspectRatio: 1,
                child: Image.file(
                  File(file.path),
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) =>
                      const Icon(Icons.broken_image, size: 60),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () =>
                            Navigator.pop(dialogContext, false),
                        child: const Text('إلغاء'),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () =>
                            Navigator.pop(dialogContext, true),
                        icon: const Icon(Icons.check),
                        label: const Text('إضافة الصورة'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );

    if (!mounted || shouldSave != true) return;

    final images = context.read<ProductImagesBloc>().state.images;

    final int nextSortOrder = images.isEmpty
        ? 0
        : images
                .map((e) => e.sortOrder)
                .reduce((a, b) => a > b ? a : b) +
            1;

    final image = ProductImage(
      id: 0,
      productId: widget.productId,
      imagePath: file.path,
      imageName: file.name,
      isPrimary: images.isEmpty,
      sortOrder: nextSortOrder,
    );

    context.read<ProductImagesBloc>().add(
      ProductImagesEvent.insert(image: image),
    );
  }

  // =========================================================
  // IMAGE SOURCE BOTTOM SHEET
  // =========================================================

  void _showImageSourceSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      builder: (sheetContext) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 45,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 20),

                const Text(
                  'إضافة صورة للمنتج',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: darkGreen,
                  ),
                ),

                const SizedBox(height: 20),

                _sourceOption(
                  icon: Icons.photo_library_outlined,
                  title: 'اختيار من المعرض',
                  subtitle: 'اختر صورة محفوظة على جهازك',
                  onTap: () {
                    Navigator.pop(sheetContext);
                    _pickImage(ImageSource.gallery);
                  },
                ),

                const SizedBox(height: 12),

                _sourceOption(
                  icon: Icons.camera_alt_outlined,
                  title: 'التقاط صورة بالكاميرا',
                  subtitle: 'التقط صورة جديدة للمنتج',
                  onTap: () {
                    Navigator.pop(sheetContext);
                    _pickImage(ImageSource.camera);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _sourceOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: primaryColor.withValues(alpha: 0.10),
                borderRadius: BorderRadius.circular(13),
              ),
              child: Icon(icon, color: primaryColor),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 15),
          ],
        ),
      ),
    );
  }

  // =========================================================
  // SET PRIMARY
  // =========================================================

  void _setPrimary(ProductImage image) {
    if (image.isPrimary) return;

    context.read<ProductImagesBloc>().add(
      ProductImagesEvent.setPrimary(
        productId: widget.productId,
        imageId: image.id,
      ),
    );
  }

  // =========================================================
  // DELETE IMAGE
  // =========================================================

  Future<void> _deleteImage(ProductImage image) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          title: const Text('حذف الصورة'),
          content: const Text(
            'هل أنت متأكد من حذف هذه الصورة؟ لا يمكن التراجع عن هذه العملية.',
          ),
          actions: [
            TextButton(
              onPressed: () =>
                  Navigator.pop(dialogContext, false),
              child: const Text('إلغاء'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              onPressed: () =>
                  Navigator.pop(dialogContext, true),
              child: const Text('حذف'),
            ),
          ],
        );
      },
    );

    if (!mounted || confirmed != true) return;

    context.read<ProductImagesBloc>().add(
      ProductImagesEvent.delete(id: image.id),
    );
  }

  // =========================================================
  // IMAGE VIEWER
  // =========================================================

  void _openImage(ProductImage image) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return Dialog(
          backgroundColor: Colors.black,
          insetPadding: const EdgeInsets.all(12),
          child: Stack(
            children: [
              InteractiveViewer(
                minScale: 0.5,
                maxScale: 4,
                child: Center(
                  child: _buildImage(
                    image.imagePath,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  onPressed: () =>
                      Navigator.pop(dialogContext),
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // =========================================================
  // IMAGE WIDGET
  // =========================================================

  Widget _buildImage(
    String path, {
    BoxFit fit = BoxFit.cover,
  }) {
    if (path.startsWith('http://') ||
        path.startsWith('https://')) {
      return Image.network(
        path,
        fit: fit,
        errorBuilder: (_, __, ___) => _imagePlaceholder(),
      );
    }

    return Image.file(
      File(path),
      fit: fit,
      errorBuilder: (_, __, ___) => _imagePlaceholder(),
    );
  }

  Widget _imagePlaceholder() {
    return Container(
      color: Colors.grey.shade100,
      alignment: Alignment.center,
      child: Icon(
        Icons.broken_image_outlined,
        size: 40,
        color: Colors.grey.shade400,
      ),
    );
  }

  // =========================================================
  // SNACKBAR
  // =========================================================

  void _showMessage(
    String message, {
    bool isError = false,
  }) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor:
              isError ? Colors.red.shade700 : darkGreen,
          behavior: SnackBarBehavior.floating,
        ),
      );
  }

  // =========================================================
  // BUILD
  // =========================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: darkGreen,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'صور المنتج',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            if (widget.productName != null)
              Text(
                widget.productName!,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                ),
              ),
          ],
        ),
        actions: [
          BlocBuilder<ProductImagesBloc, ProductImagesState>(
            builder: (context, state) {
              return IconButton(
                tooltip: 'تحديث الصور',
                onPressed: () {
                  context.read<ProductImagesBloc>().add(
                    ProductImagesEvent.load(
                      productId: widget.productId,
                    ),
                  );
                },
                icon: const Icon(Icons.refresh),
              );
            },
          ),
        ],
      ),

      body: BlocConsumer<ProductImagesBloc, ProductImagesState>(
        listenWhen: (previous, current) =>
            previous.successMessage != current.successMessage ||
            previous.errorMessage != current.errorMessage,

        listener: (context, state) {
          if (state.successMessage != null) {
            _showMessage(state.successMessage!);
            context.read<ProductImagesBloc>().add(
              const ProductImagesEvent.clearMessages(),
            );
          }

          if (state.errorMessage != null) {
            _showMessage(
              state.errorMessage!,
              isError: true,
            );
            context.read<ProductImagesBloc>().add(
              const ProductImagesEvent.clearMessages(),
            );
          }
        },

        builder: (context, state) {
          return Stack(
            children: [
              RefreshIndicator(
                color: primaryColor,
                onRefresh: () async {
                  context.read<ProductImagesBloc>().add(
                    ProductImagesEvent.load(
                      productId: widget.productId,
                    ),
                  );
                  await Future.delayed(
                    const Duration(milliseconds: 500),
                  );
                },
                child: CustomScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: [
                    SliverToBoxAdapter(
                      child: _buildHeader(state),
                    ),

                    SliverToBoxAdapter(
                      child: _buildStats(state),
                    ),

                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(
                          16, 20, 16, 12,
                        ),
                        child: Row(
                          children: [
                            const Expanded(
                              child: Text(
                                'معرض الصور',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: darkGreen,
                                ),
                              ),
                            ),
                            Text(
                              '${state.images.length} صورة',
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    if (state.isLoading && state.images.isEmpty)
                      const SliverFillRemaining(
                        hasScrollBody: false,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: primaryColor,
                          ),
                        ),
                      )
                    else if (state.images.isEmpty)
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: _buildEmptyState(),
                      )
                    else
                      SliverPadding(
                        padding: const EdgeInsets.fromLTRB(
                          16, 0, 16, 100,
                        ),
                        sliver: SliverGrid(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              final image = state.images[index];

                              return _buildImageCard(
                                image,
                                state,
                              );
                            },
                            childCount: state.images.length,
                          ),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 0.82,
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              if (state.isOperationInProgress)
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: LinearProgressIndicator(
                    color: primaryColor,
                    backgroundColor: primaryColor.withValues(alpha: 0.1),
                  ),
                ),
            ],
          );
        },
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showImageSourceSheet,
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add_photo_alternate_outlined),
        label: const Text(
          'إضافة صورة',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  // =========================================================
  // HEADER
  // =========================================================

  Widget _buildHeader(ProductImagesState state) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [darkGreen, primaryColor],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: darkGreen.withValues(alpha: 0.15),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.photo_library_outlined,
              color: Colors.white,
              size: 29,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'إدارة صور المنتج',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'أضف صوراً متعددة وحدد الصورة الرئيسية للمنتج',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.85),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // =========================================================
  // STATISTICS
  // =========================================================

  Widget _buildStats(ProductImagesState state) {
    final primaryCount =
        state.images.where((e) => e.isPrimary).length;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: _statCard(
              icon: Icons.photo_library_outlined,
              title: 'إجمالي الصور',
              value: '${state.images.length}',
              color: primaryColor,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _statCard(
              icon: Icons.star,
              title: 'الصورة الرئيسية',
              value: '$primaryCount',
              color: Colors.amber.shade700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _statCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 26),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: darkGreen,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // =========================================================
  // IMAGE CARD
  // =========================================================

  Widget _buildImageCard(
    ProductImage image,
    ProductImagesState state,
  ) {
    return InkWell(
      onTap: () => _openImage(image),
      borderRadius: BorderRadius.circular(17),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(17),
          border: Border.all(
            color: image.isPrimary
                ? primaryColor
                : Colors.grey.shade200,
            width: image.isPrimary ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.035),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  _buildImage(image.imagePath),

                  if (image.isPrimary)
                    Positioned(
                      top: 9,
                      right: 9,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 9,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 13,
                            ),
                            SizedBox(width: 4),
                            Text(
                              'رئيسية',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  Positioned(
                    top: 5,
                    left: 5,
                    child: PopupMenuButton<String>(
                      icon: const CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.more_vert,
                          color: darkGreen,
                          size: 19,
                        ),
                      ),
                      onSelected: (value) {
                        if (value == 'primary') {
                          _setPrimary(image);
                        } else if (value == 'delete') {
                          _deleteImage(image);
                        }
                      },
                      itemBuilder: (context) => [
                        if (!image.isPrimary)
                          const PopupMenuItem(
                            value: 'primary',
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star_outline,
                                  color: Colors.amber,
                                ),
                                SizedBox(width: 10),
                                Text('تعيين كصورة رئيسية'),
                              ],
                            ),
                          ),
                        const PopupMenuItem(
                          value: 'delete',
                          child: Row(
                            children: [
                              Icon(
                                Icons.delete_outline,
                                color: Colors.red,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'حذف الصورة',
                                style: TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.image_outlined,
                    size: 16,
                    color: primaryColor,
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      image.imageName ?? 'صورة المنتج',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // =========================================================
  // EMPTY STATE
  // =========================================================

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                color: primaryColor.withValues(alpha: 0.08),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.add_photo_alternate_outlined,
                size: 55,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'لا توجد صور لهذا المنتج',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: darkGreen,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'ابدأ بإضافة صور المنتج لعرضه بشكل أفضل',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _showImageSourceSheet,
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 13,
                ),
              ),
              icon: const Icon(Icons.add),
              label: const Text('إضافة أول صورة'),
            ),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';

class ProductsSearchField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const ProductsSearchField({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return TextField(
      controller: controller,
      onChanged: onChanged,

      textInputAction: TextInputAction.search,

      decoration: InputDecoration(
        hintText: 'ابحث باسم المنتج أو الباركود...',
        prefixIcon: const Icon(Icons.search_rounded),

        suffixIcon: ValueListenableBuilder<TextEditingValue>(
          valueListenable: controller,
          builder: (context, value, child) {
            if (value.text.isEmpty) {
              return const SizedBox.shrink();
            }

            return IconButton(
              tooltip: 'مسح البحث',
              onPressed: () {
                controller.clear();
                onChanged('');
              },
              icon: const Icon(Icons.close_rounded),
            );
          },
        ),

        filled: true,
        fillColor: scheme.surface,

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 16,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: scheme.outlineVariant,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: scheme.primary,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}

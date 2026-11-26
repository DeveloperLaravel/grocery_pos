import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/parties/category.dart';

part 'categories_state.freezed.dart';

enum CategoriesStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
abstract class CategoriesState with _$CategoriesState {
  const factory CategoriesState({
    // حالة تحميل البيانات
    @Default(CategoriesStatus.initial)
    CategoriesStatus status,

    // جميع التصنيفات القادمة من قاعدة البيانات
    @Default(<Category>[])
    List<Category> allCategories,

    // التصنيفات المعروضة بعد تطبيق البحث
    @Default(<Category>[])
    List<Category> categories,

    // التصنيفات الرئيسية
    @Default(<Category>[])
    List<Category> rootCategories,

    // التصنيفات الفرعية للأب المحدد
    @Default(<Category>[])
    List<Category> childCategories,

    // التصنيف الأب المحدد حالياً
    int? selectedParentId,

    // نص البحث
    @Default('')
    String searchQuery,

    // حالة تنفيذ عمليات الإضافة والتعديل والحذف
    @Default(false)
    bool isOperationInProgress,

    // هل Stream المراقبة يعمل؟
    @Default(false)
    bool isWatching,

    // رسالة الخطأ
    String? errorMessage,

    // رسالة النجاح
    String? successMessage,

    // آخر تصنيف تم تنفيذ عملية عليه
    int? lastAffectedCategoryId,
  }) = _CategoriesState;

  const CategoriesState._();

  // حالات عامة
  bool get isInitial => status == CategoriesStatus.initial;

  bool get isLoading => status == CategoriesStatus.loading;

  bool get isSuccess => status == CategoriesStatus.success;

  bool get isFailure => status == CategoriesStatus.failure;

  // الأخطاء والرسائل
  bool get hasError => errorMessage != null;

  bool get hasSuccessMessage => successMessage != null;

  // التصنيفات
  bool get hasCategories => categories.isNotEmpty;

  bool get isEmpty =>
      status == CategoriesStatus.success && categories.isEmpty;

  bool get hasRootCategories => rootCategories.isNotEmpty;

  bool get hasChildCategories => childCategories.isNotEmpty;

  // الأعداد
  int get categoriesCount => categories.length;

  int get allCategoriesCount => allCategories.length;

  int get rootCategoriesCount => rootCategories.length;

  int get childCategoriesCount => childCategories.length;

  // البحث
  bool get hasSearchQuery => searchQuery.trim().isNotEmpty;
}
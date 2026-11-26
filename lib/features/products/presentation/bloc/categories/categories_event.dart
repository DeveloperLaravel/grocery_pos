import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/parties/category.dart';

part 'categories_event.freezed.dart';

@freezed
sealed class CategoriesEvent with _$CategoriesEvent {
  // تحميل جميع التصنيفات
  const factory CategoriesEvent.load() = LoadCategories;

  // مراقبة التصنيفات بشكل مباشر
  const factory CategoriesEvent.watch() = WatchCategories;

  // استقبال تحديثات قاعدة البيانات من Stream
  const factory CategoriesEvent.categoriesUpdated(
    List<Category> categories,
  ) = CategoriesUpdated;

  // استقبال أخطاء Stream
  const factory CategoriesEvent.watchFailed(
    String message,
  ) = CategoriesWatchFailed;

  // تحميل التصنيفات الرئيسية
  const factory CategoriesEvent.loadRoots() = LoadRootCategories;

  // تحميل التصنيفات الفرعية
  const factory CategoriesEvent.loadChildren(
    int parentId,
  ) = LoadChildCategories;

  // البحث
  const factory CategoriesEvent.search(
    String query,
  ) = SearchCategories;

  // مسح البحث
  const factory CategoriesEvent.clearSearch() = ClearCategorySearch;

  // إضافة تصنيف
  const factory CategoriesEvent.create(
    Category category,
  ) = CreateCategory;

  // تعديل تصنيف
  const factory CategoriesEvent.update({
    required int id,
    required Category category,
  }) = UpdateCategory;

  // حذف تصنيف
  const factory CategoriesEvent.delete(
    int id,
  ) = DeleteCategory;
}
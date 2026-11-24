
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/category.dart';

part 'category_state.freezed.dart';

enum CategoryStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
abstract class CategoryState with _$CategoryState {
  const factory CategoryState({
    @Default(CategoryStatus.initial)
    CategoryStatus status,

    @Default([])
    List<Category> categories,

    @Default([])
    List<Category> children,

    @Default([])
    List<Category> searchResults,

    @Default([])
    List<Category> activeCategories,

    Category? selectedCategory,

    @Default(false)
    bool isSaving,

    @Default(false)
    bool isDeleting,

    String? errorMessage,

    String? successMessage,
  }) = _CategoryState;
}

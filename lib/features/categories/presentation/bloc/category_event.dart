
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/category.dart';

part 'category_event.freezed.dart';

@freezed
sealed class CategoryEvent with _$CategoryEvent {
  const factory CategoryEvent.loadRequested() =
      CategoryLoadRequested;

  const factory CategoryEvent.watchRequested() =
      CategoryWatchRequested;

  const factory CategoryEvent.categoriesUpdated(
    List<Category> categories,
  ) = CategoriesUpdated;

  const factory CategoryEvent.watchFailed(String message) =
      CategoryWatchFailed;

  const factory CategoryEvent.getByIdRequested(int id) =
      CategoryGetByIdRequested;

  const factory CategoryEvent.childrenRequested(int? parentId) =
      CategoryChildrenRequested;

  const factory CategoryEvent.searchRequested(String keyword) =
      CategorySearchRequested;

  const factory CategoryEvent.activeRequested() =
      CategoryActiveRequested;

  const factory CategoryEvent.addRequested(Category category) =
      CategoryAddRequested;

  const factory CategoryEvent.updateRequested(Category category) =
      CategoryUpdateRequested;

  const factory CategoryEvent.deleteRequested(int id) =
      CategoryDeleteRequested;

  const factory CategoryEvent.toggleStatusRequested(
    Category category,
  ) = CategoryToggleStatusRequested;

  const factory CategoryEvent.selectionCleared() =
      CategorySelectionCleared;

  const factory CategoryEvent.watchStopped() =
      CategoryWatchStopped;
}


import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/brand.dart';

part 'brand_event.freezed.dart';

@freezed
sealed class BrandEvent with _$BrandEvent {
  const factory BrandEvent.loadBrandsRequested({
    @Default(false) bool activeOnly,
  }) = LoadBrandsRequested;

  const factory BrandEvent.watchBrandsRequested({
    @Default(false) bool activeOnly,
  }) = WatchBrandsRequested;

  const factory BrandEvent.searchBrandsRequested({
    required String query,
  }) = SearchBrandsRequested;

  const factory BrandEvent.getBrandByIdRequested({
    required int id,
  }) = GetBrandByIdRequested;

  const factory BrandEvent.createBrandRequested({
    required String name,
    String? description,
    String? imagePath,
    @Default(true) bool isActive,
  }) = CreateBrandRequested;

  const factory BrandEvent.updateBrandRequested({
    required Brand brand,
  }) = UpdateBrandRequested;

  const factory BrandEvent.deleteBrandRequested({
    required int id,
  }) = DeleteBrandRequested;

  const factory BrandEvent.toggleBrandStatusRequested({
    required int id,
  }) = ToggleBrandStatusRequested;

  const factory BrandEvent.checkBrandNameRequested({
    required String name,
    int? excludeId,
  }) = CheckBrandNameRequested;

  const factory BrandEvent.loadBrandsStatisticsRequested() =
      LoadBrandsStatisticsRequested;

  const factory BrandEvent.clearBrandMessagesRequested() =
      ClearBrandMessagesRequested;

  const factory BrandEvent.clearBrandSearchRequested() =
      ClearBrandSearchRequested;

  // Internal stream events

  const factory BrandEvent.internalBrandsUpdated({
    required List<Brand> brands,
  }) = InternalBrandsUpdated;

  const factory BrandEvent.internalBrandsError({
    required String message,
  }) = InternalBrandsError;
}

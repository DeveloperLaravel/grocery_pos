import 'package:flutter/foundation.dart';

import '../../../domain/entities/parties/brand.dart';

@immutable
sealed class BrandsEvent {
  const BrandsEvent();
}

/// تحميل جميع العلامات التجارية
final class LoadBrands extends BrandsEvent {
  const LoadBrands();
}

/// مراقبة العلامات التجارية
final class WatchBrands extends BrandsEvent {
  const WatchBrands();
}

/// استقبال البيانات من Stream
final class BrandsChanged extends BrandsEvent {
  final List<Brand> brands;

  const BrandsChanged(this.brands);
}

/// إضافة علامة تجارية
final class CreateBrand extends BrandsEvent {
  final Brand brand;

  const CreateBrand(this.brand);
}

/// تحديث علامة تجارية
final class UpdateBrand extends BrandsEvent {
  final int id;
  final Brand brand;

  const UpdateBrand({
    required this.id,
    required this.brand,
  });
}

/// حذف علامة تجارية
final class DeleteBrand extends BrandsEvent {
  final int id;

  const DeleteBrand(this.id);
}
final class BrandsWatchFailed extends BrandsEvent {
  final String message;

  const BrandsWatchFailed(this.message);
}
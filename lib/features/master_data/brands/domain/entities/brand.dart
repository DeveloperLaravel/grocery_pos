import 'package:freezed_annotation/freezed_annotation.dart';

part 'brand.freezed.dart';

@freezed
abstract class Brand with _$Brand {
  const factory Brand({
    int? id,
    required String name,
    String? description,
    String? imagePath,
    @Default(true) bool isActive,
   required DateTime createdAt,
   required DateTime updatedAt,
  }) = _Brand;
}
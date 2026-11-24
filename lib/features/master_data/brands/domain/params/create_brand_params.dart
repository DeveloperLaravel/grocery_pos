
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_brand_params.freezed.dart';

@freezed
abstract class CreateBrandParams with _$CreateBrandParams {
  const factory CreateBrandParams({
    required String name,
    String? description,
    String? imagePath,
    @Default(true) bool isActive,
  }) = _CreateBrandParams;
}

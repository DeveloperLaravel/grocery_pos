import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_model.freezed.dart';
part 'customer_model.g.dart';

@freezed
abstract class CustomerModel with _$CustomerModel {
  const factory CustomerModel({
    int? id,
    String? customerCode,

    @Default('individual')
    String customerType,

    required String name,
    String? companyName,
    String? contactPerson,
    String? imagePath,

    String? phone,
    String? secondaryPhone,
    String? whatsapp,
    String? email,
    String? website,

    String? nationalId,
    String? taxNumber,
    String? commercialRegister,

    String? address,
    String? country,
    String? city,
    String? region,
    String? street,
    String? buildingNumber,
    String? postalCode,
    String? billingAddress,
    String? shippingAddress,

    @Default('normal')
    String customerCategory,

    @Default('retail')
    String priceLevel,

    @Default(false)
    bool allowCredit,

    @Default(0.0)
    double creditLimit,

    @Default(0.0)
    double openingBalance,

    @Default(0)
    int paymentTermsDays,

    @Default(0.0)
    double defaultDiscount,

    @Default('cash')
    String preferredPaymentMethod,

    @Default(0)
    int loyaltyPoints,

    DateTime? lastPurchaseAt,

    @Default(true)
    bool isActive,

    String? notes,

    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _CustomerModel;

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);
}
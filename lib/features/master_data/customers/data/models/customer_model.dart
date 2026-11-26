
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_model.freezed.dart';
part 'customer_model.g.dart';

@freezed
abstract class CustomerModel with _$CustomerModel {
  const factory CustomerModel({
    required int id,
    String? customerCode,
    @Default('individual') String customerType,

    // Basic Information
    required String name,
    String? companyName,
    String? contactPerson,
    String? imagePath,

    // Contact Information
    String? phone,
    String? secondaryPhone,
    String? whatsapp,
    String? email,
    String? website,

    // Legal Information
    String? nationalId,
    String? taxNumber,
    String? commercialRegister,

    // Address Information
    String? address,
    String? country,
    String? city,
    String? region,
    String? street,
    String? buildingNumber,
    String? postalCode,
    String? billingAddress,
    String? shippingAddress,

    // Classification
    @Default('normal') String customerCategory,
    @Default('retail') String priceLevel,

    // Financial Information
    @Default(false) bool allowCredit,
    @Default(0.0) double creditLimit,
    @Default(0.0) double openingBalance,
    @Default(0.0) double currentBalance,
    @Default(0) int paymentTermsDays,
    @Default(0.0) double defaultDiscount,
    @Default('cash') String preferredPaymentMethod,

    // Loyalty
    @Default(0) int loyaltyPoints,

    // Activity
    DateTime? lastSaleAt,
    DateTime? lastPaymentAt,
    @Default(true) bool isActive,

    // Notes
    String? notes,

    // Timestamps
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _CustomerModel;

  factory CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);
}

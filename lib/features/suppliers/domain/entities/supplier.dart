
import 'package:freezed_annotation/freezed_annotation.dart';

part 'supplier.freezed.dart';

@freezed
abstract class Supplier with _$Supplier {
  const factory Supplier({
    int? id,

    // Basic information
    String? supplierCode,
    @Default('company') String supplierType,
    required String name,
    String? companyName,
    String? contactPerson,
    String? imagePath,

    // Contact
    String? phone,
    String? secondaryPhone,
    String? whatsapp,
    String? email,
    String? website,

    // Legal
    String? nationalId,
    String? taxNumber,
    String? commercialRegister,

    // Address
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
    @Default('wholesaler') String supplierCategory,
    @Default('normal') String supplierLevel,
    @Default(0.0) double rating,
    @Default(false) bool isPreferred,

    // Financial
    @Default(true) bool allowCredit,
    @Default(0.0) double creditLimit,
    @Default(0.0) double openingBalance,
    @Default(0) int paymentTermsDays,
    @Default('bank_transfer') String preferredPaymentMethod,

    // Banking
    String? bankName,
    String? bankBranch,
    String? bankAccountName,
    String? bankAccountNumber,
    String? iban,
    String? swiftCode,

    // Activity
    DateTime? lastPurchaseAt,
    DateTime? lastPaymentAt,
    @Default(true) bool isActive,
    String? notes,

    // Timestamps
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Supplier;
}

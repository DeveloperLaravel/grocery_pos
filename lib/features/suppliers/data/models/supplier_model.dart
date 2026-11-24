
import 'package:freezed_annotation/freezed_annotation.dart';

part 'supplier_model.freezed.dart';

@freezed
abstract class SupplierModel with _$SupplierModel {
  const factory SupplierModel({
    int? id,

    String? supplierCode,
    @Default('company') String supplierType,
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

    @Default('wholesaler') String supplierCategory,
    @Default('normal') String supplierLevel,
    @Default(0.0) double rating,
    @Default(false) bool isPreferred,

    @Default(true) bool allowCredit,
    @Default(0.0) double creditLimit,
    @Default(0.0) double openingBalance,
    @Default(0) int paymentTermsDays,
    @Default('bank_transfer') String preferredPaymentMethod,

    String? bankName,
    String? bankBranch,
    String? bankAccountName,
    String? bankAccountNumber,
    String? iban,
    String? swiftCode,

    DateTime? lastPurchaseAt,
    DateTime? lastPaymentAt,
    @Default(true) bool isActive,
    String? notes,

    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _SupplierModel;
}

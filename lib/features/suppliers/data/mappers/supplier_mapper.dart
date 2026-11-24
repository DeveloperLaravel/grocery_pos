
import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../domain/entities/supplier.dart';
import '../models/supplier_model.dart';

class SupplierMapper {
  const SupplierMapper._();

  // Database -> Model
  static SupplierModel fromDatabase(SupplierDb db) {
    return SupplierModel(
      id: db.id,
      supplierCode: db.supplierCode,
      supplierType: db.supplierType,
      name: db.name,
      companyName: db.companyName,
      contactPerson: db.contactPerson,
      imagePath: db.imagePath,
      phone: db.phone,
      secondaryPhone: db.secondaryPhone,
      whatsapp: db.whatsapp,
      email: db.email,
      website: db.website,
      nationalId: db.nationalId,
      taxNumber: db.taxNumber,
      commercialRegister: db.commercialRegister,
      address: db.address,
      country: db.country,
      city: db.city,
      region: db.region,
      street: db.street,
      buildingNumber: db.buildingNumber,
      postalCode: db.postalCode,
      billingAddress: db.billingAddress,
      shippingAddress: db.shippingAddress,
      supplierCategory: db.supplierCategory,
      supplierLevel: db.supplierLevel,
      rating: db.rating,
      isPreferred: db.isPreferred,
      allowCredit: db.allowCredit,
      creditLimit: db.creditLimit,
      openingBalance: db.openingBalance,
      paymentTermsDays: db.paymentTermsDays,
      preferredPaymentMethod: db.preferredPaymentMethod,
      bankName: db.bankName,
      bankBranch: db.bankBranch,
      bankAccountName: db.bankAccountName,
      bankAccountNumber: db.bankAccountNumber,
      iban: db.iban,
      swiftCode: db.swiftCode,
      lastPurchaseAt: db.lastPurchaseAt,
      lastPaymentAt: db.lastPaymentAt,
      isActive: db.isActive,
      notes: db.notes,
      createdAt: db.createdAt,
      updatedAt: db.updatedAt,
    );
  }

  // Model -> Domain
  static Supplier toEntity(SupplierModel model) {
    return Supplier(
      id: model.id,
      supplierCode: model.supplierCode,
      supplierType: model.supplierType,
      name: model.name,
      companyName: model.companyName,
      contactPerson: model.contactPerson,
      imagePath: model.imagePath,
      phone: model.phone,
      secondaryPhone: model.secondaryPhone,
      whatsapp: model.whatsapp,
      email: model.email,
      website: model.website,
      nationalId: model.nationalId,
      taxNumber: model.taxNumber,
      commercialRegister: model.commercialRegister,
      address: model.address,
      country: model.country,
      city: model.city,
      region: model.region,
      street: model.street,
      buildingNumber: model.buildingNumber,
      postalCode: model.postalCode,
      billingAddress: model.billingAddress,
      shippingAddress: model.shippingAddress,
      supplierCategory: model.supplierCategory,
      supplierLevel: model.supplierLevel,
      rating: model.rating,
      isPreferred: model.isPreferred,
      allowCredit: model.allowCredit,
      creditLimit: model.creditLimit,
      openingBalance: model.openingBalance,
      paymentTermsDays: model.paymentTermsDays,
      preferredPaymentMethod: model.preferredPaymentMethod,
      bankName: model.bankName,
      bankBranch: model.bankBranch,
      bankAccountName: model.bankAccountName,
      bankAccountNumber: model.bankAccountNumber,
      iban: model.iban,
      swiftCode: model.swiftCode,
      lastPurchaseAt: model.lastPurchaseAt,
      lastPaymentAt: model.lastPaymentAt,
      isActive: model.isActive,
      notes: model.notes,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  // Domain -> Model
  static SupplierModel fromEntity(Supplier entity) {
    return SupplierModel(
      id: entity.id,
      supplierCode: _clean(entity.supplierCode),
      supplierType: entity.supplierType,
      name: entity.name.trim(),
      companyName: _clean(entity.companyName),
      contactPerson: _clean(entity.contactPerson),
      imagePath: _clean(entity.imagePath),
      phone: _clean(entity.phone),
      secondaryPhone: _clean(entity.secondaryPhone),
      whatsapp: _clean(entity.whatsapp),
      email: _clean(entity.email)?.toLowerCase(),
      website: _clean(entity.website),
      nationalId: _clean(entity.nationalId),
      taxNumber: _clean(entity.taxNumber),
      commercialRegister: _clean(entity.commercialRegister),
      address: _clean(entity.address),
      country: _clean(entity.country),
      city: _clean(entity.city),
      region: _clean(entity.region),
      street: _clean(entity.street),
      buildingNumber: _clean(entity.buildingNumber),
      postalCode: _clean(entity.postalCode),
      billingAddress: _clean(entity.billingAddress),
      shippingAddress: _clean(entity.shippingAddress),
      supplierCategory: entity.supplierCategory,
      supplierLevel: entity.supplierLevel,
      rating: entity.rating,
      isPreferred: entity.isPreferred,
      allowCredit: entity.allowCredit,
      creditLimit: entity.creditLimit,
      openingBalance: entity.openingBalance,
      paymentTermsDays: entity.paymentTermsDays,
      preferredPaymentMethod: entity.preferredPaymentMethod,
      bankName: _clean(entity.bankName),
      bankBranch: _clean(entity.bankBranch),
      bankAccountName: _clean(entity.bankAccountName),
      bankAccountNumber: _clean(entity.bankAccountNumber),
      iban: _clean(entity.iban),
      swiftCode: _clean(entity.swiftCode),
      lastPurchaseAt: entity.lastPurchaseAt,
      lastPaymentAt: entity.lastPaymentAt,
      isActive: entity.isActive,
      notes: _clean(entity.notes),
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  // Database -> Domain
  static Supplier fromDatabaseToEntity(SupplierDb db) {
    return toEntity(fromDatabase(db));
  }

  // Model -> Drift Companion
  static SuppliersCompanion toCompanion(
    SupplierModel model, {
    bool forUpdate = false,
  }) {
    return SuppliersCompanion(
      id: model.id == null
          ? const Value.absent()
          : Value(model.id!),

      supplierCode: Value(_clean(model.supplierCode)),
      supplierType: Value(model.supplierType),
      name: Value(model.name.trim()),
      companyName: Value(_clean(model.companyName)),
      contactPerson: Value(_clean(model.contactPerson)),
      imagePath: Value(_clean(model.imagePath)),

      phone: Value(_clean(model.phone)),
      secondaryPhone: Value(_clean(model.secondaryPhone)),
      whatsapp: Value(_clean(model.whatsapp)),
      email: Value(_clean(model.email)?.toLowerCase()),
      website: Value(_clean(model.website)),

      nationalId: Value(_clean(model.nationalId)),
      taxNumber: Value(_clean(model.taxNumber)),
      commercialRegister: Value(_clean(model.commercialRegister)),

      address: Value(_clean(model.address)),
      country: Value(_clean(model.country)),
      city: Value(_clean(model.city)),
      region: Value(_clean(model.region)),
      street: Value(_clean(model.street)),
      buildingNumber: Value(_clean(model.buildingNumber)),
      postalCode: Value(_clean(model.postalCode)),
      billingAddress: Value(_clean(model.billingAddress)),
      shippingAddress: Value(_clean(model.shippingAddress)),

      supplierCategory: Value(model.supplierCategory),
      supplierLevel: Value(model.supplierLevel),
      rating: Value(model.rating),
      isPreferred: Value(model.isPreferred),

      allowCredit: Value(model.allowCredit),
      creditLimit: Value(model.creditLimit),
      openingBalance: Value(model.openingBalance),
      paymentTermsDays: Value(model.paymentTermsDays),
      preferredPaymentMethod: Value(model.preferredPaymentMethod),

      bankName: Value(_clean(model.bankName)),
      bankBranch: Value(_clean(model.bankBranch)),
      bankAccountName: Value(_clean(model.bankAccountName)),
      bankAccountNumber: Value(_clean(model.bankAccountNumber)),
      iban: Value(_clean(model.iban)),
      swiftCode: Value(_clean(model.swiftCode)),

      lastPurchaseAt: Value(model.lastPurchaseAt),
      lastPaymentAt: Value(model.lastPaymentAt),
      isActive: Value(model.isActive),
      notes: Value(_clean(model.notes)),

      createdAt: model.createdAt == null
          ? const Value.absent()
          : Value(model.createdAt!),

      updatedAt: forUpdate
          ? Value(DateTime.now())
          : model.updatedAt == null
              ? const Value.absent()
              : Value(model.updatedAt!),
    );
  }

  static String? _clean(String? value) {
    final result = value?.trim();
    return result == null || result.isEmpty ? null : result;
  }
}

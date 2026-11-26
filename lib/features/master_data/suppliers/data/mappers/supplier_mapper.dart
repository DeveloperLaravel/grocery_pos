import 'package:drift/drift.dart';

import '../../../../../../core/database/app_database.dart';
import '../../domain/entities/supplier.dart';
import '../models/supplier_model.dart';

class SupplierMapper {
  const SupplierMapper();

  // =====================================================
  // 1. Database → Model
  // =====================================================

  SupplierModel fromDb(SupplierDb db) {
    return SupplierModel(
      supplier: Supplier(
        id: db.id,
        supplierCode: db.supplierCode,
        supplierType: db.supplierType,

        // Basic Information
        name: db.name,
        companyName: db.companyName,
        contactPerson: db.contactPerson,
        imagePath: db.imagePath,

        // Contact Information
        phone: db.phone,
        secondaryPhone: db.secondaryPhone,
        whatsapp: db.whatsapp,
        email: db.email,
        website: db.website,

        // Legal Information
        nationalId: db.nationalId,
        taxNumber: db.taxNumber,
        commercialRegister: db.commercialRegister,

        // Address
        address: db.address,
        country: db.country,
        city: db.city,
        region: db.region,
        street: db.street,
        buildingNumber: db.buildingNumber,
        postalCode: db.postalCode,
        billingAddress: db.billingAddress,
        shippingAddress: db.shippingAddress,

        // Classification
        supplierCategory: db.supplierCategory,
        supplierLevel: db.supplierLevel,
        rating: db.rating,
        isPreferred: db.isPreferred,

        // Financial
        allowCredit: db.allowCredit,
        creditLimit: db.creditLimit,
        openingBalance: db.openingBalance,
        currentBalance: db.currentBalance,
        paymentTermsDays: db.paymentTermsDays,
        preferredPaymentMethod: db.preferredPaymentMethod,

        // Banking
        bankName: db.bankName,
        bankBranch: db.bankBranch,
        bankAccountName: db.bankAccountName,
        bankAccountNumber: db.bankAccountNumber,
        iban: db.iban,
        swiftCode: db.swiftCode,

        // Activity
        lastPurchaseAt: db.lastPurchaseAt,
        lastPaymentAt: db.lastPaymentAt,
        isActive: db.isActive,

        // Notes
        notes: db.notes,

        // Timestamps
        createdAt: db.createdAt,
        updatedAt: db.updatedAt,
      ),
    );
  }

  // =====================================================
  // 2. Model → Entity
  // =====================================================

  Supplier toEntity(SupplierModel model) {
    return model.supplier;
  }

  // =====================================================
  // 3. Entity → Model
  // =====================================================

  SupplierModel fromEntity(Supplier entity) {
    return SupplierModel.fromEntity(entity);
  }

  // =====================================================
  // 4. Entity → Database Companion
  // =====================================================

  SuppliersCompanion toCompanion(Supplier entity) {
    return SuppliersCompanion(
      // Primary Key
      id: Value(entity.id),

      // Code
      supplierCode: Value(entity.supplierCode),
      supplierType: Value(entity.supplierType),

      // Basic Information
      name: Value(entity.name),
      companyName: Value(entity.companyName),
      contactPerson: Value(entity.contactPerson),
      imagePath: Value(entity.imagePath),

      // Contact
      phone: Value(entity.phone),
      secondaryPhone: Value(entity.secondaryPhone),
      whatsapp: Value(entity.whatsapp),
      email: Value(entity.email),
      website: Value(entity.website),

      // Legal
      nationalId: Value(entity.nationalId),
      taxNumber: Value(entity.taxNumber),
      commercialRegister: Value(entity.commercialRegister),

      // Address
      address: Value(entity.address),
      country: Value(entity.country),
      city: Value(entity.city),
      region: Value(entity.region),
      street: Value(entity.street),
      buildingNumber: Value(entity.buildingNumber),
      postalCode: Value(entity.postalCode),
      billingAddress: Value(entity.billingAddress),
      shippingAddress: Value(entity.shippingAddress),

      // Classification
      supplierCategory: Value(entity.supplierCategory),
      supplierLevel: Value(entity.supplierLevel),
      rating: Value(entity.rating),
      isPreferred: Value(entity.isPreferred),

      // Financial
      allowCredit: Value(entity.allowCredit),
      creditLimit: Value(entity.creditLimit),
      openingBalance: Value(entity.openingBalance),
      currentBalance: Value(entity.currentBalance),
      paymentTermsDays: Value(entity.paymentTermsDays),
      preferredPaymentMethod: Value(entity.preferredPaymentMethod),

      // Banking
      bankName: Value(entity.bankName),
      bankBranch: Value(entity.bankBranch),
      bankAccountName: Value(entity.bankAccountName),
      bankAccountNumber: Value(entity.bankAccountNumber),
      iban: Value(entity.iban),
      swiftCode: Value(entity.swiftCode),

      // Activity
      lastPurchaseAt: Value(entity.lastPurchaseAt),
      lastPaymentAt: Value(entity.lastPaymentAt),
      isActive: Value(entity.isActive),

      // Notes
      notes: Value(entity.notes),

      // Timestamps
      createdAt: Value(entity.createdAt),
      updatedAt: Value(DateTime.now()),
    );
  }

  // =====================================================
  // 5. Database List → Entity List
  // =====================================================

  List<Supplier> fromDbList(List<SupplierDb> rows) {
    return rows.map((row) => fromDb(row).toEntity()).toList();
  }

  // =====================================================
  // 6. Database Stream → Entity Stream
  // =====================================================

  Stream<List<Supplier>> fromDbStream(
    Stream<List<SupplierDb>> stream,
  ) {
    return stream.map(fromDbList);
  }

  Stream<Supplier?> fromDbSingleStream(
    Stream<SupplierDb?> stream,
  ) {
    return stream.map(
      (row) => row == null ? null : fromDb(row).toEntity(),
    );
  }
}
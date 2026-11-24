import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';

import '../../domain/entities/customer.dart';
import '../models/customer_model.dart';

class CustomerMapper {
  const CustomerMapper._();

  // =====================================================
  // Drift -> Model
  // =====================================================

  static CustomerModel fromDb(CustomerDb db) {
    return CustomerModel(
      id: db.id,
      customerCode: db.customerCode,
      customerType: db.customerType,
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
      customerCategory: db.customerCategory,
      priceLevel: db.priceLevel,
      allowCredit: db.allowCredit,
      creditLimit: db.creditLimit,
      openingBalance: db.openingBalance,
      paymentTermsDays: db.paymentTermsDays,
      defaultDiscount: db.defaultDiscount,
      preferredPaymentMethod: db.preferredPaymentMethod,
      loyaltyPoints: db.loyaltyPoints,
      lastPurchaseAt: db.lastPurchaseAt,
      isActive: db.isActive,
      notes: db.notes,
      createdAt: db.createdAt,
      updatedAt: db.updatedAt,
    );
  }

  // =====================================================
  // Model -> Domain
  // =====================================================

  static Customer toEntity(CustomerModel model) {
    return Customer(
      id: model.id,
      customerCode: model.customerCode,
      customerType: model.customerType,
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
      customerCategory: model.customerCategory,
      priceLevel: model.priceLevel,
      allowCredit: model.allowCredit,
      creditLimit: model.creditLimit,
      openingBalance: model.openingBalance,
      paymentTermsDays: model.paymentTermsDays,
      defaultDiscount: model.defaultDiscount,
      preferredPaymentMethod: model.preferredPaymentMethod,
      loyaltyPoints: model.loyaltyPoints,
      lastPurchaseAt: model.lastPurchaseAt,
      isActive: model.isActive,
      notes: model.notes,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  // =====================================================
  // Domain -> Model
  // =====================================================

  static CustomerModel fromEntity(Customer entity) {
    return CustomerModel(
      id: entity.id,
      customerCode: entity.customerCode,
      customerType: entity.customerType,
      name: entity.name,
      companyName: entity.companyName,
      contactPerson: entity.contactPerson,
      imagePath: entity.imagePath,
      phone: entity.phone,
      secondaryPhone: entity.secondaryPhone,
      whatsapp: entity.whatsapp,
      email: entity.email,
      website: entity.website,
      nationalId: entity.nationalId,
      taxNumber: entity.taxNumber,
      commercialRegister: entity.commercialRegister,
      address: entity.address,
      country: entity.country,
      city: entity.city,
      region: entity.region,
      street: entity.street,
      buildingNumber: entity.buildingNumber,
      postalCode: entity.postalCode,
      billingAddress: entity.billingAddress,
      shippingAddress: entity.shippingAddress,
      customerCategory: entity.customerCategory,
      priceLevel: entity.priceLevel,
      allowCredit: entity.allowCredit,
      creditLimit: entity.creditLimit,
      openingBalance: entity.openingBalance,
      paymentTermsDays: entity.paymentTermsDays,
      defaultDiscount: entity.defaultDiscount,
      preferredPaymentMethod: entity.preferredPaymentMethod,
      loyaltyPoints: entity.loyaltyPoints,
      lastPurchaseAt: entity.lastPurchaseAt,
      isActive: entity.isActive,
      notes: entity.notes,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  // =====================================================
  // Model -> Drift Companion
  // =====================================================

  static CustomersCompanion toCompanion(
    CustomerModel model, {
    bool includeId = false,
  }) {
    return CustomersCompanion(
      id: includeId && model.id != null
          ? Value(model.id!)
          : const Value.absent(),

      customerCode: Value(model.customerCode),
      customerType: Value(model.customerType),
      name: Value(model.name),
      companyName: Value(model.companyName),
      contactPerson: Value(model.contactPerson),
      imagePath: Value(model.imagePath),

      phone: Value(model.phone),
      secondaryPhone: Value(model.secondaryPhone),
      whatsapp: Value(model.whatsapp),
      email: Value(model.email),
      website: Value(model.website),

      nationalId: Value(model.nationalId),
      taxNumber: Value(model.taxNumber),
      commercialRegister: Value(model.commercialRegister),

      address: Value(model.address),
      country: Value(model.country),
      city: Value(model.city),
      region: Value(model.region),
      street: Value(model.street),
      buildingNumber: Value(model.buildingNumber),
      postalCode: Value(model.postalCode),
      billingAddress: Value(model.billingAddress),
      shippingAddress: Value(model.shippingAddress),

      customerCategory: Value(model.customerCategory),
      priceLevel: Value(model.priceLevel),

      allowCredit: Value(model.allowCredit),
      creditLimit: Value(model.creditLimit),
      openingBalance: Value(model.openingBalance),
      paymentTermsDays: Value(model.paymentTermsDays),
      defaultDiscount: Value(model.defaultDiscount),
      preferredPaymentMethod: Value(
        model.preferredPaymentMethod,
      ),

      loyaltyPoints: Value(model.loyaltyPoints),
      lastPurchaseAt: Value(model.lastPurchaseAt),

      isActive: Value(model.isActive),
      notes: Value(model.notes),

      createdAt: model.createdAt == null
          ? const Value.absent()
          : Value(model.createdAt!),

      updatedAt: model.updatedAt == null
          ? const Value.absent()
          : Value(model.updatedAt!),
    );
  }
}
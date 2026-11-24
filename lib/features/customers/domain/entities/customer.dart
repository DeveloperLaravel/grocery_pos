import 'package:equatable/equatable.dart';

class Customer extends Equatable {
  final int? id;
  final String? customerCode;
  final String customerType;

  final String name;
  final String? companyName;
  final String? contactPerson;
  final String? imagePath;

  final String? phone;
  final String? secondaryPhone;
  final String? whatsapp;
  final String? email;
  final String? website;

  final String? nationalId;
  final String? taxNumber;
  final String? commercialRegister;

  final String? address;
  final String? country;
  final String? city;
  final String? region;
  final String? street;
  final String? buildingNumber;
  final String? postalCode;
  final String? billingAddress;
  final String? shippingAddress;

  final String customerCategory;
  final String priceLevel;

  final bool allowCredit;
  final double creditLimit;
  final double openingBalance;
  final int paymentTermsDays;
  final double defaultDiscount;
  final String preferredPaymentMethod;

  final int loyaltyPoints;
  final DateTime? lastPurchaseAt;

  final bool isActive;
  final String? notes;

  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Customer({
    this.id,
    this.customerCode,
    this.customerType = 'individual',
    required this.name,
    this.companyName,
    this.contactPerson,
    this.imagePath,
    this.phone,
    this.secondaryPhone,
    this.whatsapp,
    this.email,
    this.website,
    this.nationalId,
    this.taxNumber,
    this.commercialRegister,
    this.address,
    this.country,
    this.city,
    this.region,
    this.street,
    this.buildingNumber,
    this.postalCode,
    this.billingAddress,
    this.shippingAddress,
    this.customerCategory = 'normal',
    this.priceLevel = 'retail',
    this.allowCredit = false,
    this.creditLimit = 0,
    this.openingBalance = 0,
    this.paymentTermsDays = 0,
    this.defaultDiscount = 0,
    this.preferredPaymentMethod = 'cash',
    this.loyaltyPoints = 0,
    this.lastPurchaseAt,
    this.isActive = true,
    this.notes,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        customerCode,
        customerType,
        name,
        companyName,
        contactPerson,
        imagePath,
        phone,
        secondaryPhone,
        whatsapp,
        email,
        website,
        nationalId,
        taxNumber,
        commercialRegister,
        address,
        country,
        city,
        region,
        street,
        buildingNumber,
        postalCode,
        billingAddress,
        shippingAddress,
        customerCategory,
        priceLevel,
        allowCredit,
        creditLimit,
        openingBalance,
        paymentTermsDays,
        defaultDiscount,
        preferredPaymentMethod,
        loyaltyPoints,
        lastPurchaseAt,
        isActive,
        notes,
        createdAt,
        updatedAt,
      ];
}
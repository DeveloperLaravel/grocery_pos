
class Customer {
  // =====================================================
  // 1. Primary Key & Code
  // =====================================================

  final int id;
  final String? customerCode;
  final String customerType;

  // =====================================================
  // 2. Basic Information
  // =====================================================

  final String name;
  final String? companyName;
  final String? contactPerson;
  final String? imagePath;

  // =====================================================
  // 3. Contact Information
  // =====================================================

  final String? phone;
  final String? secondaryPhone;
  final String? whatsapp;
  final String? email;
  final String? website;

  // =====================================================
  // 4. Legal Information
  // =====================================================

  final String? nationalId;
  final String? taxNumber;
  final String? commercialRegister;

  // =====================================================
  // 5. Address Information
  // =====================================================

  final String? address;
  final String? country;
  final String? city;
  final String? region;
  final String? street;
  final String? buildingNumber;
  final String? postalCode;
  final String? billingAddress;
  final String? shippingAddress;

  // =====================================================
  // 6. Customer Classification
  // =====================================================

  final String customerCategory;
  final String priceLevel;

  // =====================================================
  // 7. Financial Information
  // =====================================================

  final bool allowCredit;
  final double creditLimit;
  final double openingBalance;
  final double currentBalance;
  final int paymentTermsDays;
  final double defaultDiscount;
  final String preferredPaymentMethod;

  // =====================================================
  // 8. Loyalty Program
  // =====================================================

  final int loyaltyPoints;

  // =====================================================
  // 9. Customer Activity
  // =====================================================

  final DateTime? lastSaleAt;
  final DateTime? lastPaymentAt;
  final bool isActive;

  // =====================================================
  // 10. Notes
  // =====================================================

  final String? notes;

  // =====================================================
  // 11. Timestamps
  // =====================================================

  final DateTime createdAt;
  final DateTime updatedAt;

  // =====================================================
  // Constructor
  // =====================================================

  const Customer({
    required this.id,
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
    this.creditLimit = 0.0,
    this.openingBalance = 0.0,
    this.currentBalance = 0.0,
    this.paymentTermsDays = 0,
    this.defaultDiscount = 0.0,
    this.preferredPaymentMethod = 'cash',

    this.loyaltyPoints = 0,

    this.lastSaleAt,
    this.lastPaymentAt,
    this.isActive = true,

    this.notes,

    required this.createdAt,
    required this.updatedAt,
  });
}

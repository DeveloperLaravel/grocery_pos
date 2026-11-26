// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomerModel _$CustomerModelFromJson(Map<String, dynamic> json) =>
    _CustomerModel(
      id: (json['id'] as num).toInt(),
      customerCode: json['customerCode'] as String?,
      customerType: json['customerType'] as String? ?? 'individual',
      name: json['name'] as String,
      companyName: json['companyName'] as String?,
      contactPerson: json['contactPerson'] as String?,
      imagePath: json['imagePath'] as String?,
      phone: json['phone'] as String?,
      secondaryPhone: json['secondaryPhone'] as String?,
      whatsapp: json['whatsapp'] as String?,
      email: json['email'] as String?,
      website: json['website'] as String?,
      nationalId: json['nationalId'] as String?,
      taxNumber: json['taxNumber'] as String?,
      commercialRegister: json['commercialRegister'] as String?,
      address: json['address'] as String?,
      country: json['country'] as String?,
      city: json['city'] as String?,
      region: json['region'] as String?,
      street: json['street'] as String?,
      buildingNumber: json['buildingNumber'] as String?,
      postalCode: json['postalCode'] as String?,
      billingAddress: json['billingAddress'] as String?,
      shippingAddress: json['shippingAddress'] as String?,
      customerCategory: json['customerCategory'] as String? ?? 'normal',
      priceLevel: json['priceLevel'] as String? ?? 'retail',
      allowCredit: json['allowCredit'] as bool? ?? false,
      creditLimit: (json['creditLimit'] as num?)?.toDouble() ?? 0.0,
      openingBalance: (json['openingBalance'] as num?)?.toDouble() ?? 0.0,
      currentBalance: (json['currentBalance'] as num?)?.toDouble() ?? 0.0,
      paymentTermsDays: (json['paymentTermsDays'] as num?)?.toInt() ?? 0,
      defaultDiscount: (json['defaultDiscount'] as num?)?.toDouble() ?? 0.0,
      preferredPaymentMethod:
          json['preferredPaymentMethod'] as String? ?? 'cash',
      loyaltyPoints: (json['loyaltyPoints'] as num?)?.toInt() ?? 0,
      lastSaleAt: json['lastSaleAt'] == null
          ? null
          : DateTime.parse(json['lastSaleAt'] as String),
      lastPaymentAt: json['lastPaymentAt'] == null
          ? null
          : DateTime.parse(json['lastPaymentAt'] as String),
      isActive: json['isActive'] as bool? ?? true,
      notes: json['notes'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$CustomerModelToJson(_CustomerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customerCode': instance.customerCode,
      'customerType': instance.customerType,
      'name': instance.name,
      'companyName': instance.companyName,
      'contactPerson': instance.contactPerson,
      'imagePath': instance.imagePath,
      'phone': instance.phone,
      'secondaryPhone': instance.secondaryPhone,
      'whatsapp': instance.whatsapp,
      'email': instance.email,
      'website': instance.website,
      'nationalId': instance.nationalId,
      'taxNumber': instance.taxNumber,
      'commercialRegister': instance.commercialRegister,
      'address': instance.address,
      'country': instance.country,
      'city': instance.city,
      'region': instance.region,
      'street': instance.street,
      'buildingNumber': instance.buildingNumber,
      'postalCode': instance.postalCode,
      'billingAddress': instance.billingAddress,
      'shippingAddress': instance.shippingAddress,
      'customerCategory': instance.customerCategory,
      'priceLevel': instance.priceLevel,
      'allowCredit': instance.allowCredit,
      'creditLimit': instance.creditLimit,
      'openingBalance': instance.openingBalance,
      'currentBalance': instance.currentBalance,
      'paymentTermsDays': instance.paymentTermsDays,
      'defaultDiscount': instance.defaultDiscount,
      'preferredPaymentMethod': instance.preferredPaymentMethod,
      'loyaltyPoints': instance.loyaltyPoints,
      'lastSaleAt': instance.lastSaleAt?.toIso8601String(),
      'lastPaymentAt': instance.lastPaymentAt?.toIso8601String(),
      'isActive': instance.isActive,
      'notes': instance.notes,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

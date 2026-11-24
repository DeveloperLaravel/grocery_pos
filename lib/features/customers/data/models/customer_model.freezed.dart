// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomerModel {
  int? get id;
  String? get customerCode;
  String get customerType;
  String get name;
  String? get companyName;
  String? get contactPerson;
  String? get imagePath;
  String? get phone;
  String? get secondaryPhone;
  String? get whatsapp;
  String? get email;
  String? get website;
  String? get nationalId;
  String? get taxNumber;
  String? get commercialRegister;
  String? get address;
  String? get country;
  String? get city;
  String? get region;
  String? get street;
  String? get buildingNumber;
  String? get postalCode;
  String? get billingAddress;
  String? get shippingAddress;
  String get customerCategory;
  String get priceLevel;
  bool get allowCredit;
  double get creditLimit;
  double get openingBalance;
  int get paymentTermsDays;
  double get defaultDiscount;
  String get preferredPaymentMethod;
  int get loyaltyPoints;
  DateTime? get lastPurchaseAt;
  bool get isActive;
  String? get notes;
  DateTime? get createdAt;
  DateTime? get updatedAt;

  /// Create a copy of CustomerModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomerModelCopyWith<CustomerModel> get copyWith =>
      _$CustomerModelCopyWithImpl<CustomerModel>(
          this as CustomerModel, _$identity);

  /// Serializes this CustomerModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomerModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.customerCode, customerCode) ||
                other.customerCode == customerCode) &&
            (identical(other.customerType, customerType) ||
                other.customerType == customerType) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.contactPerson, contactPerson) ||
                other.contactPerson == contactPerson) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.secondaryPhone, secondaryPhone) ||
                other.secondaryPhone == secondaryPhone) &&
            (identical(other.whatsapp, whatsapp) ||
                other.whatsapp == whatsapp) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.nationalId, nationalId) ||
                other.nationalId == nationalId) &&
            (identical(other.taxNumber, taxNumber) ||
                other.taxNumber == taxNumber) &&
            (identical(other.commercialRegister, commercialRegister) ||
                other.commercialRegister == commercialRegister) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.buildingNumber, buildingNumber) ||
                other.buildingNumber == buildingNumber) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.billingAddress, billingAddress) ||
                other.billingAddress == billingAddress) &&
            (identical(other.shippingAddress, shippingAddress) ||
                other.shippingAddress == shippingAddress) &&
            (identical(other.customerCategory, customerCategory) ||
                other.customerCategory == customerCategory) &&
            (identical(other.priceLevel, priceLevel) ||
                other.priceLevel == priceLevel) &&
            (identical(other.allowCredit, allowCredit) ||
                other.allowCredit == allowCredit) &&
            (identical(other.creditLimit, creditLimit) ||
                other.creditLimit == creditLimit) &&
            (identical(other.openingBalance, openingBalance) ||
                other.openingBalance == openingBalance) &&
            (identical(other.paymentTermsDays, paymentTermsDays) ||
                other.paymentTermsDays == paymentTermsDays) &&
            (identical(other.defaultDiscount, defaultDiscount) ||
                other.defaultDiscount == defaultDiscount) &&
            (identical(other.preferredPaymentMethod, preferredPaymentMethod) ||
                other.preferredPaymentMethod == preferredPaymentMethod) &&
            (identical(other.loyaltyPoints, loyaltyPoints) ||
                other.loyaltyPoints == loyaltyPoints) &&
            (identical(other.lastPurchaseAt, lastPurchaseAt) ||
                other.lastPurchaseAt == lastPurchaseAt) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
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
        updatedAt
      ]);

  @override
  String toString() {
    return 'CustomerModel(id: $id, customerCode: $customerCode, customerType: $customerType, name: $name, companyName: $companyName, contactPerson: $contactPerson, imagePath: $imagePath, phone: $phone, secondaryPhone: $secondaryPhone, whatsapp: $whatsapp, email: $email, website: $website, nationalId: $nationalId, taxNumber: $taxNumber, commercialRegister: $commercialRegister, address: $address, country: $country, city: $city, region: $region, street: $street, buildingNumber: $buildingNumber, postalCode: $postalCode, billingAddress: $billingAddress, shippingAddress: $shippingAddress, customerCategory: $customerCategory, priceLevel: $priceLevel, allowCredit: $allowCredit, creditLimit: $creditLimit, openingBalance: $openingBalance, paymentTermsDays: $paymentTermsDays, defaultDiscount: $defaultDiscount, preferredPaymentMethod: $preferredPaymentMethod, loyaltyPoints: $loyaltyPoints, lastPurchaseAt: $lastPurchaseAt, isActive: $isActive, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $CustomerModelCopyWith<$Res> {
  factory $CustomerModelCopyWith(
          CustomerModel value, $Res Function(CustomerModel) _then) =
      _$CustomerModelCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      String? customerCode,
      String customerType,
      String name,
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
      String customerCategory,
      String priceLevel,
      bool allowCredit,
      double creditLimit,
      double openingBalance,
      int paymentTermsDays,
      double defaultDiscount,
      String preferredPaymentMethod,
      int loyaltyPoints,
      DateTime? lastPurchaseAt,
      bool isActive,
      String? notes,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$CustomerModelCopyWithImpl<$Res>
    implements $CustomerModelCopyWith<$Res> {
  _$CustomerModelCopyWithImpl(this._self, this._then);

  final CustomerModel _self;
  final $Res Function(CustomerModel) _then;

  /// Create a copy of CustomerModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? customerCode = freezed,
    Object? customerType = null,
    Object? name = null,
    Object? companyName = freezed,
    Object? contactPerson = freezed,
    Object? imagePath = freezed,
    Object? phone = freezed,
    Object? secondaryPhone = freezed,
    Object? whatsapp = freezed,
    Object? email = freezed,
    Object? website = freezed,
    Object? nationalId = freezed,
    Object? taxNumber = freezed,
    Object? commercialRegister = freezed,
    Object? address = freezed,
    Object? country = freezed,
    Object? city = freezed,
    Object? region = freezed,
    Object? street = freezed,
    Object? buildingNumber = freezed,
    Object? postalCode = freezed,
    Object? billingAddress = freezed,
    Object? shippingAddress = freezed,
    Object? customerCategory = null,
    Object? priceLevel = null,
    Object? allowCredit = null,
    Object? creditLimit = null,
    Object? openingBalance = null,
    Object? paymentTermsDays = null,
    Object? defaultDiscount = null,
    Object? preferredPaymentMethod = null,
    Object? loyaltyPoints = null,
    Object? lastPurchaseAt = freezed,
    Object? isActive = null,
    Object? notes = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      customerCode: freezed == customerCode
          ? _self.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String?,
      customerType: null == customerType
          ? _self.customerType
          : customerType // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: freezed == companyName
          ? _self.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      contactPerson: freezed == contactPerson
          ? _self.contactPerson
          : contactPerson // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePath: freezed == imagePath
          ? _self.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      secondaryPhone: freezed == secondaryPhone
          ? _self.secondaryPhone
          : secondaryPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      whatsapp: freezed == whatsapp
          ? _self.whatsapp
          : whatsapp // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _self.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      nationalId: freezed == nationalId
          ? _self.nationalId
          : nationalId // ignore: cast_nullable_to_non_nullable
              as String?,
      taxNumber: freezed == taxNumber
          ? _self.taxNumber
          : taxNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      commercialRegister: freezed == commercialRegister
          ? _self.commercialRegister
          : commercialRegister // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      region: freezed == region
          ? _self.region
          : region // ignore: cast_nullable_to_non_nullable
              as String?,
      street: freezed == street
          ? _self.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
      buildingNumber: freezed == buildingNumber
          ? _self.buildingNumber
          : buildingNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _self.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      billingAddress: freezed == billingAddress
          ? _self.billingAddress
          : billingAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingAddress: freezed == shippingAddress
          ? _self.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      customerCategory: null == customerCategory
          ? _self.customerCategory
          : customerCategory // ignore: cast_nullable_to_non_nullable
              as String,
      priceLevel: null == priceLevel
          ? _self.priceLevel
          : priceLevel // ignore: cast_nullable_to_non_nullable
              as String,
      allowCredit: null == allowCredit
          ? _self.allowCredit
          : allowCredit // ignore: cast_nullable_to_non_nullable
              as bool,
      creditLimit: null == creditLimit
          ? _self.creditLimit
          : creditLimit // ignore: cast_nullable_to_non_nullable
              as double,
      openingBalance: null == openingBalance
          ? _self.openingBalance
          : openingBalance // ignore: cast_nullable_to_non_nullable
              as double,
      paymentTermsDays: null == paymentTermsDays
          ? _self.paymentTermsDays
          : paymentTermsDays // ignore: cast_nullable_to_non_nullable
              as int,
      defaultDiscount: null == defaultDiscount
          ? _self.defaultDiscount
          : defaultDiscount // ignore: cast_nullable_to_non_nullable
              as double,
      preferredPaymentMethod: null == preferredPaymentMethod
          ? _self.preferredPaymentMethod
          : preferredPaymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      loyaltyPoints: null == loyaltyPoints
          ? _self.loyaltyPoints
          : loyaltyPoints // ignore: cast_nullable_to_non_nullable
              as int,
      lastPurchaseAt: freezed == lastPurchaseAt
          ? _self.lastPurchaseAt
          : lastPurchaseAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [CustomerModel].
extension CustomerModelPatterns on CustomerModel {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CustomerModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomerModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CustomerModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerModel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CustomerModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            int? id,
            String? customerCode,
            String customerType,
            String name,
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
            String customerCategory,
            String priceLevel,
            bool allowCredit,
            double creditLimit,
            double openingBalance,
            int paymentTermsDays,
            double defaultDiscount,
            String preferredPaymentMethod,
            int loyaltyPoints,
            DateTime? lastPurchaseAt,
            bool isActive,
            String? notes,
            DateTime? createdAt,
            DateTime? updatedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CustomerModel() when $default != null:
        return $default(
            _that.id,
            _that.customerCode,
            _that.customerType,
            _that.name,
            _that.companyName,
            _that.contactPerson,
            _that.imagePath,
            _that.phone,
            _that.secondaryPhone,
            _that.whatsapp,
            _that.email,
            _that.website,
            _that.nationalId,
            _that.taxNumber,
            _that.commercialRegister,
            _that.address,
            _that.country,
            _that.city,
            _that.region,
            _that.street,
            _that.buildingNumber,
            _that.postalCode,
            _that.billingAddress,
            _that.shippingAddress,
            _that.customerCategory,
            _that.priceLevel,
            _that.allowCredit,
            _that.creditLimit,
            _that.openingBalance,
            _that.paymentTermsDays,
            _that.defaultDiscount,
            _that.preferredPaymentMethod,
            _that.loyaltyPoints,
            _that.lastPurchaseAt,
            _that.isActive,
            _that.notes,
            _that.createdAt,
            _that.updatedAt);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            int? id,
            String? customerCode,
            String customerType,
            String name,
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
            String customerCategory,
            String priceLevel,
            bool allowCredit,
            double creditLimit,
            double openingBalance,
            int paymentTermsDays,
            double defaultDiscount,
            String preferredPaymentMethod,
            int loyaltyPoints,
            DateTime? lastPurchaseAt,
            bool isActive,
            String? notes,
            DateTime? createdAt,
            DateTime? updatedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerModel():
        return $default(
            _that.id,
            _that.customerCode,
            _that.customerType,
            _that.name,
            _that.companyName,
            _that.contactPerson,
            _that.imagePath,
            _that.phone,
            _that.secondaryPhone,
            _that.whatsapp,
            _that.email,
            _that.website,
            _that.nationalId,
            _that.taxNumber,
            _that.commercialRegister,
            _that.address,
            _that.country,
            _that.city,
            _that.region,
            _that.street,
            _that.buildingNumber,
            _that.postalCode,
            _that.billingAddress,
            _that.shippingAddress,
            _that.customerCategory,
            _that.priceLevel,
            _that.allowCredit,
            _that.creditLimit,
            _that.openingBalance,
            _that.paymentTermsDays,
            _that.defaultDiscount,
            _that.preferredPaymentMethod,
            _that.loyaltyPoints,
            _that.lastPurchaseAt,
            _that.isActive,
            _that.notes,
            _that.createdAt,
            _that.updatedAt);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            int? id,
            String? customerCode,
            String customerType,
            String name,
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
            String customerCategory,
            String priceLevel,
            bool allowCredit,
            double creditLimit,
            double openingBalance,
            int paymentTermsDays,
            double defaultDiscount,
            String preferredPaymentMethod,
            int loyaltyPoints,
            DateTime? lastPurchaseAt,
            bool isActive,
            String? notes,
            DateTime? createdAt,
            DateTime? updatedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CustomerModel() when $default != null:
        return $default(
            _that.id,
            _that.customerCode,
            _that.customerType,
            _that.name,
            _that.companyName,
            _that.contactPerson,
            _that.imagePath,
            _that.phone,
            _that.secondaryPhone,
            _that.whatsapp,
            _that.email,
            _that.website,
            _that.nationalId,
            _that.taxNumber,
            _that.commercialRegister,
            _that.address,
            _that.country,
            _that.city,
            _that.region,
            _that.street,
            _that.buildingNumber,
            _that.postalCode,
            _that.billingAddress,
            _that.shippingAddress,
            _that.customerCategory,
            _that.priceLevel,
            _that.allowCredit,
            _that.creditLimit,
            _that.openingBalance,
            _that.paymentTermsDays,
            _that.defaultDiscount,
            _that.preferredPaymentMethod,
            _that.loyaltyPoints,
            _that.lastPurchaseAt,
            _that.isActive,
            _that.notes,
            _that.createdAt,
            _that.updatedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _CustomerModel implements CustomerModel {
  const _CustomerModel(
      {this.id,
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
      this.paymentTermsDays = 0,
      this.defaultDiscount = 0.0,
      this.preferredPaymentMethod = 'cash',
      this.loyaltyPoints = 0,
      this.lastPurchaseAt,
      this.isActive = true,
      this.notes,
      this.createdAt,
      this.updatedAt});
  factory _CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);

  @override
  final int? id;
  @override
  final String? customerCode;
  @override
  @JsonKey()
  final String customerType;
  @override
  final String name;
  @override
  final String? companyName;
  @override
  final String? contactPerson;
  @override
  final String? imagePath;
  @override
  final String? phone;
  @override
  final String? secondaryPhone;
  @override
  final String? whatsapp;
  @override
  final String? email;
  @override
  final String? website;
  @override
  final String? nationalId;
  @override
  final String? taxNumber;
  @override
  final String? commercialRegister;
  @override
  final String? address;
  @override
  final String? country;
  @override
  final String? city;
  @override
  final String? region;
  @override
  final String? street;
  @override
  final String? buildingNumber;
  @override
  final String? postalCode;
  @override
  final String? billingAddress;
  @override
  final String? shippingAddress;
  @override
  @JsonKey()
  final String customerCategory;
  @override
  @JsonKey()
  final String priceLevel;
  @override
  @JsonKey()
  final bool allowCredit;
  @override
  @JsonKey()
  final double creditLimit;
  @override
  @JsonKey()
  final double openingBalance;
  @override
  @JsonKey()
  final int paymentTermsDays;
  @override
  @JsonKey()
  final double defaultDiscount;
  @override
  @JsonKey()
  final String preferredPaymentMethod;
  @override
  @JsonKey()
  final int loyaltyPoints;
  @override
  final DateTime? lastPurchaseAt;
  @override
  @JsonKey()
  final bool isActive;
  @override
  final String? notes;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  /// Create a copy of CustomerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CustomerModelCopyWith<_CustomerModel> get copyWith =>
      __$CustomerModelCopyWithImpl<_CustomerModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CustomerModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CustomerModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.customerCode, customerCode) ||
                other.customerCode == customerCode) &&
            (identical(other.customerType, customerType) ||
                other.customerType == customerType) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.contactPerson, contactPerson) ||
                other.contactPerson == contactPerson) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.secondaryPhone, secondaryPhone) ||
                other.secondaryPhone == secondaryPhone) &&
            (identical(other.whatsapp, whatsapp) ||
                other.whatsapp == whatsapp) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.nationalId, nationalId) ||
                other.nationalId == nationalId) &&
            (identical(other.taxNumber, taxNumber) ||
                other.taxNumber == taxNumber) &&
            (identical(other.commercialRegister, commercialRegister) ||
                other.commercialRegister == commercialRegister) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.buildingNumber, buildingNumber) ||
                other.buildingNumber == buildingNumber) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.billingAddress, billingAddress) ||
                other.billingAddress == billingAddress) &&
            (identical(other.shippingAddress, shippingAddress) ||
                other.shippingAddress == shippingAddress) &&
            (identical(other.customerCategory, customerCategory) ||
                other.customerCategory == customerCategory) &&
            (identical(other.priceLevel, priceLevel) ||
                other.priceLevel == priceLevel) &&
            (identical(other.allowCredit, allowCredit) ||
                other.allowCredit == allowCredit) &&
            (identical(other.creditLimit, creditLimit) ||
                other.creditLimit == creditLimit) &&
            (identical(other.openingBalance, openingBalance) ||
                other.openingBalance == openingBalance) &&
            (identical(other.paymentTermsDays, paymentTermsDays) ||
                other.paymentTermsDays == paymentTermsDays) &&
            (identical(other.defaultDiscount, defaultDiscount) ||
                other.defaultDiscount == defaultDiscount) &&
            (identical(other.preferredPaymentMethod, preferredPaymentMethod) ||
                other.preferredPaymentMethod == preferredPaymentMethod) &&
            (identical(other.loyaltyPoints, loyaltyPoints) ||
                other.loyaltyPoints == loyaltyPoints) &&
            (identical(other.lastPurchaseAt, lastPurchaseAt) ||
                other.lastPurchaseAt == lastPurchaseAt) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
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
        updatedAt
      ]);

  @override
  String toString() {
    return 'CustomerModel(id: $id, customerCode: $customerCode, customerType: $customerType, name: $name, companyName: $companyName, contactPerson: $contactPerson, imagePath: $imagePath, phone: $phone, secondaryPhone: $secondaryPhone, whatsapp: $whatsapp, email: $email, website: $website, nationalId: $nationalId, taxNumber: $taxNumber, commercialRegister: $commercialRegister, address: $address, country: $country, city: $city, region: $region, street: $street, buildingNumber: $buildingNumber, postalCode: $postalCode, billingAddress: $billingAddress, shippingAddress: $shippingAddress, customerCategory: $customerCategory, priceLevel: $priceLevel, allowCredit: $allowCredit, creditLimit: $creditLimit, openingBalance: $openingBalance, paymentTermsDays: $paymentTermsDays, defaultDiscount: $defaultDiscount, preferredPaymentMethod: $preferredPaymentMethod, loyaltyPoints: $loyaltyPoints, lastPurchaseAt: $lastPurchaseAt, isActive: $isActive, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$CustomerModelCopyWith<$Res>
    implements $CustomerModelCopyWith<$Res> {
  factory _$CustomerModelCopyWith(
          _CustomerModel value, $Res Function(_CustomerModel) _then) =
      __$CustomerModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      String? customerCode,
      String customerType,
      String name,
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
      String customerCategory,
      String priceLevel,
      bool allowCredit,
      double creditLimit,
      double openingBalance,
      int paymentTermsDays,
      double defaultDiscount,
      String preferredPaymentMethod,
      int loyaltyPoints,
      DateTime? lastPurchaseAt,
      bool isActive,
      String? notes,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$CustomerModelCopyWithImpl<$Res>
    implements _$CustomerModelCopyWith<$Res> {
  __$CustomerModelCopyWithImpl(this._self, this._then);

  final _CustomerModel _self;
  final $Res Function(_CustomerModel) _then;

  /// Create a copy of CustomerModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? customerCode = freezed,
    Object? customerType = null,
    Object? name = null,
    Object? companyName = freezed,
    Object? contactPerson = freezed,
    Object? imagePath = freezed,
    Object? phone = freezed,
    Object? secondaryPhone = freezed,
    Object? whatsapp = freezed,
    Object? email = freezed,
    Object? website = freezed,
    Object? nationalId = freezed,
    Object? taxNumber = freezed,
    Object? commercialRegister = freezed,
    Object? address = freezed,
    Object? country = freezed,
    Object? city = freezed,
    Object? region = freezed,
    Object? street = freezed,
    Object? buildingNumber = freezed,
    Object? postalCode = freezed,
    Object? billingAddress = freezed,
    Object? shippingAddress = freezed,
    Object? customerCategory = null,
    Object? priceLevel = null,
    Object? allowCredit = null,
    Object? creditLimit = null,
    Object? openingBalance = null,
    Object? paymentTermsDays = null,
    Object? defaultDiscount = null,
    Object? preferredPaymentMethod = null,
    Object? loyaltyPoints = null,
    Object? lastPurchaseAt = freezed,
    Object? isActive = null,
    Object? notes = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_CustomerModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      customerCode: freezed == customerCode
          ? _self.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String?,
      customerType: null == customerType
          ? _self.customerType
          : customerType // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: freezed == companyName
          ? _self.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      contactPerson: freezed == contactPerson
          ? _self.contactPerson
          : contactPerson // ignore: cast_nullable_to_non_nullable
              as String?,
      imagePath: freezed == imagePath
          ? _self.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      secondaryPhone: freezed == secondaryPhone
          ? _self.secondaryPhone
          : secondaryPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      whatsapp: freezed == whatsapp
          ? _self.whatsapp
          : whatsapp // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _self.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      nationalId: freezed == nationalId
          ? _self.nationalId
          : nationalId // ignore: cast_nullable_to_non_nullable
              as String?,
      taxNumber: freezed == taxNumber
          ? _self.taxNumber
          : taxNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      commercialRegister: freezed == commercialRegister
          ? _self.commercialRegister
          : commercialRegister // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      region: freezed == region
          ? _self.region
          : region // ignore: cast_nullable_to_non_nullable
              as String?,
      street: freezed == street
          ? _self.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
      buildingNumber: freezed == buildingNumber
          ? _self.buildingNumber
          : buildingNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _self.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      billingAddress: freezed == billingAddress
          ? _self.billingAddress
          : billingAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingAddress: freezed == shippingAddress
          ? _self.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      customerCategory: null == customerCategory
          ? _self.customerCategory
          : customerCategory // ignore: cast_nullable_to_non_nullable
              as String,
      priceLevel: null == priceLevel
          ? _self.priceLevel
          : priceLevel // ignore: cast_nullable_to_non_nullable
              as String,
      allowCredit: null == allowCredit
          ? _self.allowCredit
          : allowCredit // ignore: cast_nullable_to_non_nullable
              as bool,
      creditLimit: null == creditLimit
          ? _self.creditLimit
          : creditLimit // ignore: cast_nullable_to_non_nullable
              as double,
      openingBalance: null == openingBalance
          ? _self.openingBalance
          : openingBalance // ignore: cast_nullable_to_non_nullable
              as double,
      paymentTermsDays: null == paymentTermsDays
          ? _self.paymentTermsDays
          : paymentTermsDays // ignore: cast_nullable_to_non_nullable
              as int,
      defaultDiscount: null == defaultDiscount
          ? _self.defaultDiscount
          : defaultDiscount // ignore: cast_nullable_to_non_nullable
              as double,
      preferredPaymentMethod: null == preferredPaymentMethod
          ? _self.preferredPaymentMethod
          : preferredPaymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      loyaltyPoints: null == loyaltyPoints
          ? _self.loyaltyPoints
          : loyaltyPoints // ignore: cast_nullable_to_non_nullable
              as int,
      lastPurchaseAt: freezed == lastPurchaseAt
          ? _self.lastPurchaseAt
          : lastPurchaseAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on

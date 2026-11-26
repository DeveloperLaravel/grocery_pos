// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supplier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Supplier {
  int get id;
  String? get supplierCode;
  String get supplierType;
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
  String get supplierCategory;
  String get supplierLevel;
  double get rating;
  bool get isPreferred;
  bool get allowCredit;
  double get creditLimit;
  double get openingBalance;
  double get currentBalance;
  int get paymentTermsDays;
  String get preferredPaymentMethod;
  String? get bankName;
  String? get bankBranch;
  String? get bankAccountName;
  String? get bankAccountNumber;
  String? get iban;
  String? get swiftCode;
  DateTime? get lastPurchaseAt;
  DateTime? get lastPaymentAt;
  bool get isActive;
  String? get notes;
  DateTime get createdAt;
  DateTime get updatedAt;

  /// Create a copy of Supplier
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SupplierCopyWith<Supplier> get copyWith =>
      _$SupplierCopyWithImpl<Supplier>(this as Supplier, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Supplier &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.supplierCode, supplierCode) ||
                other.supplierCode == supplierCode) &&
            (identical(other.supplierType, supplierType) ||
                other.supplierType == supplierType) &&
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
            (identical(other.supplierCategory, supplierCategory) ||
                other.supplierCategory == supplierCategory) &&
            (identical(other.supplierLevel, supplierLevel) ||
                other.supplierLevel == supplierLevel) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.isPreferred, isPreferred) ||
                other.isPreferred == isPreferred) &&
            (identical(other.allowCredit, allowCredit) ||
                other.allowCredit == allowCredit) &&
            (identical(other.creditLimit, creditLimit) ||
                other.creditLimit == creditLimit) &&
            (identical(other.openingBalance, openingBalance) ||
                other.openingBalance == openingBalance) &&
            (identical(other.currentBalance, currentBalance) ||
                other.currentBalance == currentBalance) &&
            (identical(other.paymentTermsDays, paymentTermsDays) ||
                other.paymentTermsDays == paymentTermsDays) &&
            (identical(other.preferredPaymentMethod, preferredPaymentMethod) ||
                other.preferredPaymentMethod == preferredPaymentMethod) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.bankBranch, bankBranch) ||
                other.bankBranch == bankBranch) &&
            (identical(other.bankAccountName, bankAccountName) ||
                other.bankAccountName == bankAccountName) &&
            (identical(other.bankAccountNumber, bankAccountNumber) ||
                other.bankAccountNumber == bankAccountNumber) &&
            (identical(other.iban, iban) || other.iban == iban) &&
            (identical(other.swiftCode, swiftCode) ||
                other.swiftCode == swiftCode) &&
            (identical(other.lastPurchaseAt, lastPurchaseAt) ||
                other.lastPurchaseAt == lastPurchaseAt) &&
            (identical(other.lastPaymentAt, lastPaymentAt) ||
                other.lastPaymentAt == lastPaymentAt) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        supplierCode,
        supplierType,
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
        supplierCategory,
        supplierLevel,
        rating,
        isPreferred,
        allowCredit,
        creditLimit,
        openingBalance,
        currentBalance,
        paymentTermsDays,
        preferredPaymentMethod,
        bankName,
        bankBranch,
        bankAccountName,
        bankAccountNumber,
        iban,
        swiftCode,
        lastPurchaseAt,
        lastPaymentAt,
        isActive,
        notes,
        createdAt,
        updatedAt
      ]);

  @override
  String toString() {
    return 'Supplier(id: $id, supplierCode: $supplierCode, supplierType: $supplierType, name: $name, companyName: $companyName, contactPerson: $contactPerson, imagePath: $imagePath, phone: $phone, secondaryPhone: $secondaryPhone, whatsapp: $whatsapp, email: $email, website: $website, nationalId: $nationalId, taxNumber: $taxNumber, commercialRegister: $commercialRegister, address: $address, country: $country, city: $city, region: $region, street: $street, buildingNumber: $buildingNumber, postalCode: $postalCode, billingAddress: $billingAddress, shippingAddress: $shippingAddress, supplierCategory: $supplierCategory, supplierLevel: $supplierLevel, rating: $rating, isPreferred: $isPreferred, allowCredit: $allowCredit, creditLimit: $creditLimit, openingBalance: $openingBalance, currentBalance: $currentBalance, paymentTermsDays: $paymentTermsDays, preferredPaymentMethod: $preferredPaymentMethod, bankName: $bankName, bankBranch: $bankBranch, bankAccountName: $bankAccountName, bankAccountNumber: $bankAccountNumber, iban: $iban, swiftCode: $swiftCode, lastPurchaseAt: $lastPurchaseAt, lastPaymentAt: $lastPaymentAt, isActive: $isActive, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $SupplierCopyWith<$Res> {
  factory $SupplierCopyWith(Supplier value, $Res Function(Supplier) _then) =
      _$SupplierCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String? supplierCode,
      String supplierType,
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
      String supplierCategory,
      String supplierLevel,
      double rating,
      bool isPreferred,
      bool allowCredit,
      double creditLimit,
      double openingBalance,
      double currentBalance,
      int paymentTermsDays,
      String preferredPaymentMethod,
      String? bankName,
      String? bankBranch,
      String? bankAccountName,
      String? bankAccountNumber,
      String? iban,
      String? swiftCode,
      DateTime? lastPurchaseAt,
      DateTime? lastPaymentAt,
      bool isActive,
      String? notes,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$SupplierCopyWithImpl<$Res> implements $SupplierCopyWith<$Res> {
  _$SupplierCopyWithImpl(this._self, this._then);

  final Supplier _self;
  final $Res Function(Supplier) _then;

  /// Create a copy of Supplier
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? supplierCode = freezed,
    Object? supplierType = null,
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
    Object? supplierCategory = null,
    Object? supplierLevel = null,
    Object? rating = null,
    Object? isPreferred = null,
    Object? allowCredit = null,
    Object? creditLimit = null,
    Object? openingBalance = null,
    Object? currentBalance = null,
    Object? paymentTermsDays = null,
    Object? preferredPaymentMethod = null,
    Object? bankName = freezed,
    Object? bankBranch = freezed,
    Object? bankAccountName = freezed,
    Object? bankAccountNumber = freezed,
    Object? iban = freezed,
    Object? swiftCode = freezed,
    Object? lastPurchaseAt = freezed,
    Object? lastPaymentAt = freezed,
    Object? isActive = null,
    Object? notes = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      supplierCode: freezed == supplierCode
          ? _self.supplierCode
          : supplierCode // ignore: cast_nullable_to_non_nullable
              as String?,
      supplierType: null == supplierType
          ? _self.supplierType
          : supplierType // ignore: cast_nullable_to_non_nullable
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
      supplierCategory: null == supplierCategory
          ? _self.supplierCategory
          : supplierCategory // ignore: cast_nullable_to_non_nullable
              as String,
      supplierLevel: null == supplierLevel
          ? _self.supplierLevel
          : supplierLevel // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      isPreferred: null == isPreferred
          ? _self.isPreferred
          : isPreferred // ignore: cast_nullable_to_non_nullable
              as bool,
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
      currentBalance: null == currentBalance
          ? _self.currentBalance
          : currentBalance // ignore: cast_nullable_to_non_nullable
              as double,
      paymentTermsDays: null == paymentTermsDays
          ? _self.paymentTermsDays
          : paymentTermsDays // ignore: cast_nullable_to_non_nullable
              as int,
      preferredPaymentMethod: null == preferredPaymentMethod
          ? _self.preferredPaymentMethod
          : preferredPaymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      bankName: freezed == bankName
          ? _self.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
      bankBranch: freezed == bankBranch
          ? _self.bankBranch
          : bankBranch // ignore: cast_nullable_to_non_nullable
              as String?,
      bankAccountName: freezed == bankAccountName
          ? _self.bankAccountName
          : bankAccountName // ignore: cast_nullable_to_non_nullable
              as String?,
      bankAccountNumber: freezed == bankAccountNumber
          ? _self.bankAccountNumber
          : bankAccountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      iban: freezed == iban
          ? _self.iban
          : iban // ignore: cast_nullable_to_non_nullable
              as String?,
      swiftCode: freezed == swiftCode
          ? _self.swiftCode
          : swiftCode // ignore: cast_nullable_to_non_nullable
              as String?,
      lastPurchaseAt: freezed == lastPurchaseAt
          ? _self.lastPurchaseAt
          : lastPurchaseAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastPaymentAt: freezed == lastPaymentAt
          ? _self.lastPaymentAt
          : lastPaymentAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [Supplier].
extension SupplierPatterns on Supplier {
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
    TResult Function(_Supplier value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Supplier() when $default != null:
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
    TResult Function(_Supplier value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Supplier():
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
    TResult? Function(_Supplier value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Supplier() when $default != null:
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
            int id,
            String? supplierCode,
            String supplierType,
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
            String supplierCategory,
            String supplierLevel,
            double rating,
            bool isPreferred,
            bool allowCredit,
            double creditLimit,
            double openingBalance,
            double currentBalance,
            int paymentTermsDays,
            String preferredPaymentMethod,
            String? bankName,
            String? bankBranch,
            String? bankAccountName,
            String? bankAccountNumber,
            String? iban,
            String? swiftCode,
            DateTime? lastPurchaseAt,
            DateTime? lastPaymentAt,
            bool isActive,
            String? notes,
            DateTime createdAt,
            DateTime updatedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Supplier() when $default != null:
        return $default(
            _that.id,
            _that.supplierCode,
            _that.supplierType,
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
            _that.supplierCategory,
            _that.supplierLevel,
            _that.rating,
            _that.isPreferred,
            _that.allowCredit,
            _that.creditLimit,
            _that.openingBalance,
            _that.currentBalance,
            _that.paymentTermsDays,
            _that.preferredPaymentMethod,
            _that.bankName,
            _that.bankBranch,
            _that.bankAccountName,
            _that.bankAccountNumber,
            _that.iban,
            _that.swiftCode,
            _that.lastPurchaseAt,
            _that.lastPaymentAt,
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
            int id,
            String? supplierCode,
            String supplierType,
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
            String supplierCategory,
            String supplierLevel,
            double rating,
            bool isPreferred,
            bool allowCredit,
            double creditLimit,
            double openingBalance,
            double currentBalance,
            int paymentTermsDays,
            String preferredPaymentMethod,
            String? bankName,
            String? bankBranch,
            String? bankAccountName,
            String? bankAccountNumber,
            String? iban,
            String? swiftCode,
            DateTime? lastPurchaseAt,
            DateTime? lastPaymentAt,
            bool isActive,
            String? notes,
            DateTime createdAt,
            DateTime updatedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Supplier():
        return $default(
            _that.id,
            _that.supplierCode,
            _that.supplierType,
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
            _that.supplierCategory,
            _that.supplierLevel,
            _that.rating,
            _that.isPreferred,
            _that.allowCredit,
            _that.creditLimit,
            _that.openingBalance,
            _that.currentBalance,
            _that.paymentTermsDays,
            _that.preferredPaymentMethod,
            _that.bankName,
            _that.bankBranch,
            _that.bankAccountName,
            _that.bankAccountNumber,
            _that.iban,
            _that.swiftCode,
            _that.lastPurchaseAt,
            _that.lastPaymentAt,
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
            int id,
            String? supplierCode,
            String supplierType,
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
            String supplierCategory,
            String supplierLevel,
            double rating,
            bool isPreferred,
            bool allowCredit,
            double creditLimit,
            double openingBalance,
            double currentBalance,
            int paymentTermsDays,
            String preferredPaymentMethod,
            String? bankName,
            String? bankBranch,
            String? bankAccountName,
            String? bankAccountNumber,
            String? iban,
            String? swiftCode,
            DateTime? lastPurchaseAt,
            DateTime? lastPaymentAt,
            bool isActive,
            String? notes,
            DateTime createdAt,
            DateTime updatedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Supplier() when $default != null:
        return $default(
            _that.id,
            _that.supplierCode,
            _that.supplierType,
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
            _that.supplierCategory,
            _that.supplierLevel,
            _that.rating,
            _that.isPreferred,
            _that.allowCredit,
            _that.creditLimit,
            _that.openingBalance,
            _that.currentBalance,
            _that.paymentTermsDays,
            _that.preferredPaymentMethod,
            _that.bankName,
            _that.bankBranch,
            _that.bankAccountName,
            _that.bankAccountNumber,
            _that.iban,
            _that.swiftCode,
            _that.lastPurchaseAt,
            _that.lastPaymentAt,
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

class _Supplier implements Supplier {
  const _Supplier(
      {required this.id,
      this.supplierCode,
      required this.supplierType,
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
      required this.supplierCategory,
      required this.supplierLevel,
      required this.rating,
      required this.isPreferred,
      required this.allowCredit,
      required this.creditLimit,
      required this.openingBalance,
      required this.currentBalance,
      required this.paymentTermsDays,
      required this.preferredPaymentMethod,
      this.bankName,
      this.bankBranch,
      this.bankAccountName,
      this.bankAccountNumber,
      this.iban,
      this.swiftCode,
      this.lastPurchaseAt,
      this.lastPaymentAt,
      required this.isActive,
      this.notes,
      required this.createdAt,
      required this.updatedAt});

  @override
  final int id;
  @override
  final String? supplierCode;
  @override
  final String supplierType;
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
  final String supplierCategory;
  @override
  final String supplierLevel;
  @override
  final double rating;
  @override
  final bool isPreferred;
  @override
  final bool allowCredit;
  @override
  final double creditLimit;
  @override
  final double openingBalance;
  @override
  final double currentBalance;
  @override
  final int paymentTermsDays;
  @override
  final String preferredPaymentMethod;
  @override
  final String? bankName;
  @override
  final String? bankBranch;
  @override
  final String? bankAccountName;
  @override
  final String? bankAccountNumber;
  @override
  final String? iban;
  @override
  final String? swiftCode;
  @override
  final DateTime? lastPurchaseAt;
  @override
  final DateTime? lastPaymentAt;
  @override
  final bool isActive;
  @override
  final String? notes;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  /// Create a copy of Supplier
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SupplierCopyWith<_Supplier> get copyWith =>
      __$SupplierCopyWithImpl<_Supplier>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Supplier &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.supplierCode, supplierCode) ||
                other.supplierCode == supplierCode) &&
            (identical(other.supplierType, supplierType) ||
                other.supplierType == supplierType) &&
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
            (identical(other.supplierCategory, supplierCategory) ||
                other.supplierCategory == supplierCategory) &&
            (identical(other.supplierLevel, supplierLevel) ||
                other.supplierLevel == supplierLevel) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.isPreferred, isPreferred) ||
                other.isPreferred == isPreferred) &&
            (identical(other.allowCredit, allowCredit) ||
                other.allowCredit == allowCredit) &&
            (identical(other.creditLimit, creditLimit) ||
                other.creditLimit == creditLimit) &&
            (identical(other.openingBalance, openingBalance) ||
                other.openingBalance == openingBalance) &&
            (identical(other.currentBalance, currentBalance) ||
                other.currentBalance == currentBalance) &&
            (identical(other.paymentTermsDays, paymentTermsDays) ||
                other.paymentTermsDays == paymentTermsDays) &&
            (identical(other.preferredPaymentMethod, preferredPaymentMethod) ||
                other.preferredPaymentMethod == preferredPaymentMethod) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.bankBranch, bankBranch) ||
                other.bankBranch == bankBranch) &&
            (identical(other.bankAccountName, bankAccountName) ||
                other.bankAccountName == bankAccountName) &&
            (identical(other.bankAccountNumber, bankAccountNumber) ||
                other.bankAccountNumber == bankAccountNumber) &&
            (identical(other.iban, iban) || other.iban == iban) &&
            (identical(other.swiftCode, swiftCode) ||
                other.swiftCode == swiftCode) &&
            (identical(other.lastPurchaseAt, lastPurchaseAt) ||
                other.lastPurchaseAt == lastPurchaseAt) &&
            (identical(other.lastPaymentAt, lastPaymentAt) ||
                other.lastPaymentAt == lastPaymentAt) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        supplierCode,
        supplierType,
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
        supplierCategory,
        supplierLevel,
        rating,
        isPreferred,
        allowCredit,
        creditLimit,
        openingBalance,
        currentBalance,
        paymentTermsDays,
        preferredPaymentMethod,
        bankName,
        bankBranch,
        bankAccountName,
        bankAccountNumber,
        iban,
        swiftCode,
        lastPurchaseAt,
        lastPaymentAt,
        isActive,
        notes,
        createdAt,
        updatedAt
      ]);

  @override
  String toString() {
    return 'Supplier(id: $id, supplierCode: $supplierCode, supplierType: $supplierType, name: $name, companyName: $companyName, contactPerson: $contactPerson, imagePath: $imagePath, phone: $phone, secondaryPhone: $secondaryPhone, whatsapp: $whatsapp, email: $email, website: $website, nationalId: $nationalId, taxNumber: $taxNumber, commercialRegister: $commercialRegister, address: $address, country: $country, city: $city, region: $region, street: $street, buildingNumber: $buildingNumber, postalCode: $postalCode, billingAddress: $billingAddress, shippingAddress: $shippingAddress, supplierCategory: $supplierCategory, supplierLevel: $supplierLevel, rating: $rating, isPreferred: $isPreferred, allowCredit: $allowCredit, creditLimit: $creditLimit, openingBalance: $openingBalance, currentBalance: $currentBalance, paymentTermsDays: $paymentTermsDays, preferredPaymentMethod: $preferredPaymentMethod, bankName: $bankName, bankBranch: $bankBranch, bankAccountName: $bankAccountName, bankAccountNumber: $bankAccountNumber, iban: $iban, swiftCode: $swiftCode, lastPurchaseAt: $lastPurchaseAt, lastPaymentAt: $lastPaymentAt, isActive: $isActive, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$SupplierCopyWith<$Res>
    implements $SupplierCopyWith<$Res> {
  factory _$SupplierCopyWith(_Supplier value, $Res Function(_Supplier) _then) =
      __$SupplierCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String? supplierCode,
      String supplierType,
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
      String supplierCategory,
      String supplierLevel,
      double rating,
      bool isPreferred,
      bool allowCredit,
      double creditLimit,
      double openingBalance,
      double currentBalance,
      int paymentTermsDays,
      String preferredPaymentMethod,
      String? bankName,
      String? bankBranch,
      String? bankAccountName,
      String? bankAccountNumber,
      String? iban,
      String? swiftCode,
      DateTime? lastPurchaseAt,
      DateTime? lastPaymentAt,
      bool isActive,
      String? notes,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$SupplierCopyWithImpl<$Res> implements _$SupplierCopyWith<$Res> {
  __$SupplierCopyWithImpl(this._self, this._then);

  final _Supplier _self;
  final $Res Function(_Supplier) _then;

  /// Create a copy of Supplier
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? supplierCode = freezed,
    Object? supplierType = null,
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
    Object? supplierCategory = null,
    Object? supplierLevel = null,
    Object? rating = null,
    Object? isPreferred = null,
    Object? allowCredit = null,
    Object? creditLimit = null,
    Object? openingBalance = null,
    Object? currentBalance = null,
    Object? paymentTermsDays = null,
    Object? preferredPaymentMethod = null,
    Object? bankName = freezed,
    Object? bankBranch = freezed,
    Object? bankAccountName = freezed,
    Object? bankAccountNumber = freezed,
    Object? iban = freezed,
    Object? swiftCode = freezed,
    Object? lastPurchaseAt = freezed,
    Object? lastPaymentAt = freezed,
    Object? isActive = null,
    Object? notes = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_Supplier(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      supplierCode: freezed == supplierCode
          ? _self.supplierCode
          : supplierCode // ignore: cast_nullable_to_non_nullable
              as String?,
      supplierType: null == supplierType
          ? _self.supplierType
          : supplierType // ignore: cast_nullable_to_non_nullable
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
      supplierCategory: null == supplierCategory
          ? _self.supplierCategory
          : supplierCategory // ignore: cast_nullable_to_non_nullable
              as String,
      supplierLevel: null == supplierLevel
          ? _self.supplierLevel
          : supplierLevel // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      isPreferred: null == isPreferred
          ? _self.isPreferred
          : isPreferred // ignore: cast_nullable_to_non_nullable
              as bool,
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
      currentBalance: null == currentBalance
          ? _self.currentBalance
          : currentBalance // ignore: cast_nullable_to_non_nullable
              as double,
      paymentTermsDays: null == paymentTermsDays
          ? _self.paymentTermsDays
          : paymentTermsDays // ignore: cast_nullable_to_non_nullable
              as int,
      preferredPaymentMethod: null == preferredPaymentMethod
          ? _self.preferredPaymentMethod
          : preferredPaymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      bankName: freezed == bankName
          ? _self.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
      bankBranch: freezed == bankBranch
          ? _self.bankBranch
          : bankBranch // ignore: cast_nullable_to_non_nullable
              as String?,
      bankAccountName: freezed == bankAccountName
          ? _self.bankAccountName
          : bankAccountName // ignore: cast_nullable_to_non_nullable
              as String?,
      bankAccountNumber: freezed == bankAccountNumber
          ? _self.bankAccountNumber
          : bankAccountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      iban: freezed == iban
          ? _self.iban
          : iban // ignore: cast_nullable_to_non_nullable
              as String?,
      swiftCode: freezed == swiftCode
          ? _self.swiftCode
          : swiftCode // ignore: cast_nullable_to_non_nullable
              as String?,
      lastPurchaseAt: freezed == lastPurchaseAt
          ? _self.lastPurchaseAt
          : lastPurchaseAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastPaymentAt: freezed == lastPaymentAt
          ? _self.lastPaymentAt
          : lastPaymentAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      notes: freezed == notes
          ? _self.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on

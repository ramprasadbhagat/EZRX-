// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_product_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CartProductDto _$CartProductDtoFromJson(Map<String, dynamic> json) {
  return _CartProductDto.fromJson(json);
}

/// @nodoc
mixin _$CartProductDto {
  @JsonKey(name: 'productID', defaultValue: '')
  String get productID => throw _privateConstructorUsedError;
  @JsonKey(name: 'parentID', defaultValue: '')
  String get parentID => throw _privateConstructorUsedError;
  @JsonKey(name: 'type', defaultValue: '')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity', defaultValue: 0)
  int get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'materialNumber', defaultValue: '')
  String get materialNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'materialDescription', defaultValue: '')
  String get materialDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'therapeuticClass', defaultValue: '')
  String get therapeuticClass => throw _privateConstructorUsedError;
  @JsonKey(name: 'taxClassification', defaultValue: '')
  String get taxClassification => throw _privateConstructorUsedError;
  @JsonKey(name: 'isFOCMaterial', defaultValue: false)
  bool get isFOCMaterial => throw _privateConstructorUsedError;
  @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
  String get itemRegistrationNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'genericMaterialName', defaultValue: '')
  String get genericMaterialName => throw _privateConstructorUsedError;
  @JsonKey(name: 'principalName', defaultValue: '')
  String get principalName => throw _privateConstructorUsedError;
  @JsonKey(name: 'principalCode', defaultValue: '')
  String get principalCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'counterOfferPrice', defaultValue: 0)
  double get counterOfferPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'discountOverridePercentage', defaultValue: 0)
  double get counterOfferDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: 'counterOfferCurrency', defaultValue: '')
  String get counterOfferCurrency => throw _privateConstructorUsedError;
  @JsonKey(name: 'comment', defaultValue: '')
  String get remarks => throw _privateConstructorUsedError;
  @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
  String get governmentMaterialCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'bundleDetails')
  BundleDetailsDto get bundleDetails => throw _privateConstructorUsedError;
  @JsonKey(name: 'bundleMaterials', defaultValue: <MaterialDto>[])
  List<MaterialDto> get bundleMaterials => throw _privateConstructorUsedError;
  @JsonKey(name: 'bonusMaterials', defaultValue: <BonusSampleItemDto>[])
  List<BonusSampleItemDto> get bonusMaterials =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'taxes', readValue: handleTax)
  double get tax => throw _privateConstructorUsedError;
  @JsonKey(name: 'hidePrice', defaultValue: false)
  bool get hidePrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'suspensionStatus', defaultValue: false)
  bool get isSuspended => throw _privateConstructorUsedError;
  @JsonKey(name: 'principalCutoffStatus', defaultValue: false)
  bool get isPrincipalSuspended => throw _privateConstructorUsedError;
  @JsonKey(name: 'comboDeals')
  PriceComboDealDto get comboDeal => throw _privateConstructorUsedError;
  @JsonKey(name: 'comboMaterials', defaultValue: [])
  List<ComboMaterialItemDto> get comboMaterials =>
      throw _privateConstructorUsedError; //maximumQty auto set to maximum limit if we get null from response
  @JsonKey(name: 'maximumQty', defaultValue: 99999)
  int get maximumQty => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: false, readValue: mappingIsMarketPlace)
  bool get isMarketPlace => throw _privateConstructorUsedError;
  @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
  String get defaultMaterialDescription => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartProductDtoCopyWith<CartProductDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartProductDtoCopyWith<$Res> {
  factory $CartProductDtoCopyWith(
          CartProductDto value, $Res Function(CartProductDto) then) =
      _$CartProductDtoCopyWithImpl<$Res, CartProductDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'productID', defaultValue: '')
          String productID,
      @JsonKey(name: 'parentID', defaultValue: '')
          String parentID,
      @JsonKey(name: 'type', defaultValue: '')
          String type,
      @JsonKey(name: 'quantity', defaultValue: 0)
          int quantity,
      @JsonKey(name: 'materialNumber', defaultValue: '')
          String materialNumber,
      @JsonKey(name: 'materialDescription', defaultValue: '')
          String materialDescription,
      @JsonKey(name: 'therapeuticClass', defaultValue: '')
          String therapeuticClass,
      @JsonKey(name: 'taxClassification', defaultValue: '')
          String taxClassification,
      @JsonKey(name: 'isFOCMaterial', defaultValue: false)
          bool isFOCMaterial,
      @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
          String itemRegistrationNumber,
      @JsonKey(name: 'genericMaterialName', defaultValue: '')
          String genericMaterialName,
      @JsonKey(name: 'principalName', defaultValue: '')
          String principalName,
      @JsonKey(name: 'principalCode', defaultValue: '')
          String principalCode,
      @JsonKey(name: 'counterOfferPrice', defaultValue: 0)
          double counterOfferPrice,
      @JsonKey(name: 'discountOverridePercentage', defaultValue: 0)
          double counterOfferDiscount,
      @JsonKey(name: 'counterOfferCurrency', defaultValue: '')
          String counterOfferCurrency,
      @JsonKey(name: 'comment', defaultValue: '')
          String remarks,
      @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
          String governmentMaterialCode,
      @JsonKey(name: 'bundleDetails')
          BundleDetailsDto bundleDetails,
      @JsonKey(name: 'bundleMaterials', defaultValue: <MaterialDto>[])
          List<MaterialDto> bundleMaterials,
      @JsonKey(name: 'bonusMaterials', defaultValue: <BonusSampleItemDto>[])
          List<BonusSampleItemDto> bonusMaterials,
      @JsonKey(name: 'taxes', readValue: handleTax)
          double tax,
      @JsonKey(name: 'hidePrice', defaultValue: false)
          bool hidePrice,
      @JsonKey(name: 'suspensionStatus', defaultValue: false)
          bool isSuspended,
      @JsonKey(name: 'principalCutoffStatus', defaultValue: false)
          bool isPrincipalSuspended,
      @JsonKey(name: 'comboDeals')
          PriceComboDealDto comboDeal,
      @JsonKey(name: 'comboMaterials', defaultValue: [])
          List<ComboMaterialItemDto> comboMaterials,
      @JsonKey(name: 'maximumQty', defaultValue: 99999)
          int maximumQty,
      @JsonKey(defaultValue: false, readValue: mappingIsMarketPlace)
          bool isMarketPlace,
      @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
          String defaultMaterialDescription});

  $BundleDetailsDtoCopyWith<$Res> get bundleDetails;
  $PriceComboDealDtoCopyWith<$Res> get comboDeal;
}

/// @nodoc
class _$CartProductDtoCopyWithImpl<$Res, $Val extends CartProductDto>
    implements $CartProductDtoCopyWith<$Res> {
  _$CartProductDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productID = null,
    Object? parentID = null,
    Object? type = null,
    Object? quantity = null,
    Object? materialNumber = null,
    Object? materialDescription = null,
    Object? therapeuticClass = null,
    Object? taxClassification = null,
    Object? isFOCMaterial = null,
    Object? itemRegistrationNumber = null,
    Object? genericMaterialName = null,
    Object? principalName = null,
    Object? principalCode = null,
    Object? counterOfferPrice = null,
    Object? counterOfferDiscount = null,
    Object? counterOfferCurrency = null,
    Object? remarks = null,
    Object? governmentMaterialCode = null,
    Object? bundleDetails = null,
    Object? bundleMaterials = null,
    Object? bonusMaterials = null,
    Object? tax = null,
    Object? hidePrice = null,
    Object? isSuspended = null,
    Object? isPrincipalSuspended = null,
    Object? comboDeal = null,
    Object? comboMaterials = null,
    Object? maximumQty = null,
    Object? isMarketPlace = null,
    Object? defaultMaterialDescription = null,
  }) {
    return _then(_value.copyWith(
      productID: null == productID
          ? _value.productID
          : productID // ignore: cast_nullable_to_non_nullable
              as String,
      parentID: null == parentID
          ? _value.parentID
          : parentID // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      materialDescription: null == materialDescription
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      therapeuticClass: null == therapeuticClass
          ? _value.therapeuticClass
          : therapeuticClass // ignore: cast_nullable_to_non_nullable
              as String,
      taxClassification: null == taxClassification
          ? _value.taxClassification
          : taxClassification // ignore: cast_nullable_to_non_nullable
              as String,
      isFOCMaterial: null == isFOCMaterial
          ? _value.isFOCMaterial
          : isFOCMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
      itemRegistrationNumber: null == itemRegistrationNumber
          ? _value.itemRegistrationNumber
          : itemRegistrationNumber // ignore: cast_nullable_to_non_nullable
              as String,
      genericMaterialName: null == genericMaterialName
          ? _value.genericMaterialName
          : genericMaterialName // ignore: cast_nullable_to_non_nullable
              as String,
      principalName: null == principalName
          ? _value.principalName
          : principalName // ignore: cast_nullable_to_non_nullable
              as String,
      principalCode: null == principalCode
          ? _value.principalCode
          : principalCode // ignore: cast_nullable_to_non_nullable
              as String,
      counterOfferPrice: null == counterOfferPrice
          ? _value.counterOfferPrice
          : counterOfferPrice // ignore: cast_nullable_to_non_nullable
              as double,
      counterOfferDiscount: null == counterOfferDiscount
          ? _value.counterOfferDiscount
          : counterOfferDiscount // ignore: cast_nullable_to_non_nullable
              as double,
      counterOfferCurrency: null == counterOfferCurrency
          ? _value.counterOfferCurrency
          : counterOfferCurrency // ignore: cast_nullable_to_non_nullable
              as String,
      remarks: null == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String,
      governmentMaterialCode: null == governmentMaterialCode
          ? _value.governmentMaterialCode
          : governmentMaterialCode // ignore: cast_nullable_to_non_nullable
              as String,
      bundleDetails: null == bundleDetails
          ? _value.bundleDetails
          : bundleDetails // ignore: cast_nullable_to_non_nullable
              as BundleDetailsDto,
      bundleMaterials: null == bundleMaterials
          ? _value.bundleMaterials
          : bundleMaterials // ignore: cast_nullable_to_non_nullable
              as List<MaterialDto>,
      bonusMaterials: null == bonusMaterials
          ? _value.bonusMaterials
          : bonusMaterials // ignore: cast_nullable_to_non_nullable
              as List<BonusSampleItemDto>,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      hidePrice: null == hidePrice
          ? _value.hidePrice
          : hidePrice // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuspended: null == isSuspended
          ? _value.isSuspended
          : isSuspended // ignore: cast_nullable_to_non_nullable
              as bool,
      isPrincipalSuspended: null == isPrincipalSuspended
          ? _value.isPrincipalSuspended
          : isPrincipalSuspended // ignore: cast_nullable_to_non_nullable
              as bool,
      comboDeal: null == comboDeal
          ? _value.comboDeal
          : comboDeal // ignore: cast_nullable_to_non_nullable
              as PriceComboDealDto,
      comboMaterials: null == comboMaterials
          ? _value.comboMaterials
          : comboMaterials // ignore: cast_nullable_to_non_nullable
              as List<ComboMaterialItemDto>,
      maximumQty: null == maximumQty
          ? _value.maximumQty
          : maximumQty // ignore: cast_nullable_to_non_nullable
              as int,
      isMarketPlace: null == isMarketPlace
          ? _value.isMarketPlace
          : isMarketPlace // ignore: cast_nullable_to_non_nullable
              as bool,
      defaultMaterialDescription: null == defaultMaterialDescription
          ? _value.defaultMaterialDescription
          : defaultMaterialDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BundleDetailsDtoCopyWith<$Res> get bundleDetails {
    return $BundleDetailsDtoCopyWith<$Res>(_value.bundleDetails, (value) {
      return _then(_value.copyWith(bundleDetails: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceComboDealDtoCopyWith<$Res> get comboDeal {
    return $PriceComboDealDtoCopyWith<$Res>(_value.comboDeal, (value) {
      return _then(_value.copyWith(comboDeal: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CartProductDtoCopyWith<$Res>
    implements $CartProductDtoCopyWith<$Res> {
  factory _$$_CartProductDtoCopyWith(
          _$_CartProductDto value, $Res Function(_$_CartProductDto) then) =
      __$$_CartProductDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'productID', defaultValue: '')
          String productID,
      @JsonKey(name: 'parentID', defaultValue: '')
          String parentID,
      @JsonKey(name: 'type', defaultValue: '')
          String type,
      @JsonKey(name: 'quantity', defaultValue: 0)
          int quantity,
      @JsonKey(name: 'materialNumber', defaultValue: '')
          String materialNumber,
      @JsonKey(name: 'materialDescription', defaultValue: '')
          String materialDescription,
      @JsonKey(name: 'therapeuticClass', defaultValue: '')
          String therapeuticClass,
      @JsonKey(name: 'taxClassification', defaultValue: '')
          String taxClassification,
      @JsonKey(name: 'isFOCMaterial', defaultValue: false)
          bool isFOCMaterial,
      @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
          String itemRegistrationNumber,
      @JsonKey(name: 'genericMaterialName', defaultValue: '')
          String genericMaterialName,
      @JsonKey(name: 'principalName', defaultValue: '')
          String principalName,
      @JsonKey(name: 'principalCode', defaultValue: '')
          String principalCode,
      @JsonKey(name: 'counterOfferPrice', defaultValue: 0)
          double counterOfferPrice,
      @JsonKey(name: 'discountOverridePercentage', defaultValue: 0)
          double counterOfferDiscount,
      @JsonKey(name: 'counterOfferCurrency', defaultValue: '')
          String counterOfferCurrency,
      @JsonKey(name: 'comment', defaultValue: '')
          String remarks,
      @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
          String governmentMaterialCode,
      @JsonKey(name: 'bundleDetails')
          BundleDetailsDto bundleDetails,
      @JsonKey(name: 'bundleMaterials', defaultValue: <MaterialDto>[])
          List<MaterialDto> bundleMaterials,
      @JsonKey(name: 'bonusMaterials', defaultValue: <BonusSampleItemDto>[])
          List<BonusSampleItemDto> bonusMaterials,
      @JsonKey(name: 'taxes', readValue: handleTax)
          double tax,
      @JsonKey(name: 'hidePrice', defaultValue: false)
          bool hidePrice,
      @JsonKey(name: 'suspensionStatus', defaultValue: false)
          bool isSuspended,
      @JsonKey(name: 'principalCutoffStatus', defaultValue: false)
          bool isPrincipalSuspended,
      @JsonKey(name: 'comboDeals')
          PriceComboDealDto comboDeal,
      @JsonKey(name: 'comboMaterials', defaultValue: [])
          List<ComboMaterialItemDto> comboMaterials,
      @JsonKey(name: 'maximumQty', defaultValue: 99999)
          int maximumQty,
      @JsonKey(defaultValue: false, readValue: mappingIsMarketPlace)
          bool isMarketPlace,
      @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
          String defaultMaterialDescription});

  @override
  $BundleDetailsDtoCopyWith<$Res> get bundleDetails;
  @override
  $PriceComboDealDtoCopyWith<$Res> get comboDeal;
}

/// @nodoc
class __$$_CartProductDtoCopyWithImpl<$Res>
    extends _$CartProductDtoCopyWithImpl<$Res, _$_CartProductDto>
    implements _$$_CartProductDtoCopyWith<$Res> {
  __$$_CartProductDtoCopyWithImpl(
      _$_CartProductDto _value, $Res Function(_$_CartProductDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productID = null,
    Object? parentID = null,
    Object? type = null,
    Object? quantity = null,
    Object? materialNumber = null,
    Object? materialDescription = null,
    Object? therapeuticClass = null,
    Object? taxClassification = null,
    Object? isFOCMaterial = null,
    Object? itemRegistrationNumber = null,
    Object? genericMaterialName = null,
    Object? principalName = null,
    Object? principalCode = null,
    Object? counterOfferPrice = null,
    Object? counterOfferDiscount = null,
    Object? counterOfferCurrency = null,
    Object? remarks = null,
    Object? governmentMaterialCode = null,
    Object? bundleDetails = null,
    Object? bundleMaterials = null,
    Object? bonusMaterials = null,
    Object? tax = null,
    Object? hidePrice = null,
    Object? isSuspended = null,
    Object? isPrincipalSuspended = null,
    Object? comboDeal = null,
    Object? comboMaterials = null,
    Object? maximumQty = null,
    Object? isMarketPlace = null,
    Object? defaultMaterialDescription = null,
  }) {
    return _then(_$_CartProductDto(
      productID: null == productID
          ? _value.productID
          : productID // ignore: cast_nullable_to_non_nullable
              as String,
      parentID: null == parentID
          ? _value.parentID
          : parentID // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      materialDescription: null == materialDescription
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      therapeuticClass: null == therapeuticClass
          ? _value.therapeuticClass
          : therapeuticClass // ignore: cast_nullable_to_non_nullable
              as String,
      taxClassification: null == taxClassification
          ? _value.taxClassification
          : taxClassification // ignore: cast_nullable_to_non_nullable
              as String,
      isFOCMaterial: null == isFOCMaterial
          ? _value.isFOCMaterial
          : isFOCMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
      itemRegistrationNumber: null == itemRegistrationNumber
          ? _value.itemRegistrationNumber
          : itemRegistrationNumber // ignore: cast_nullable_to_non_nullable
              as String,
      genericMaterialName: null == genericMaterialName
          ? _value.genericMaterialName
          : genericMaterialName // ignore: cast_nullable_to_non_nullable
              as String,
      principalName: null == principalName
          ? _value.principalName
          : principalName // ignore: cast_nullable_to_non_nullable
              as String,
      principalCode: null == principalCode
          ? _value.principalCode
          : principalCode // ignore: cast_nullable_to_non_nullable
              as String,
      counterOfferPrice: null == counterOfferPrice
          ? _value.counterOfferPrice
          : counterOfferPrice // ignore: cast_nullable_to_non_nullable
              as double,
      counterOfferDiscount: null == counterOfferDiscount
          ? _value.counterOfferDiscount
          : counterOfferDiscount // ignore: cast_nullable_to_non_nullable
              as double,
      counterOfferCurrency: null == counterOfferCurrency
          ? _value.counterOfferCurrency
          : counterOfferCurrency // ignore: cast_nullable_to_non_nullable
              as String,
      remarks: null == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String,
      governmentMaterialCode: null == governmentMaterialCode
          ? _value.governmentMaterialCode
          : governmentMaterialCode // ignore: cast_nullable_to_non_nullable
              as String,
      bundleDetails: null == bundleDetails
          ? _value.bundleDetails
          : bundleDetails // ignore: cast_nullable_to_non_nullable
              as BundleDetailsDto,
      bundleMaterials: null == bundleMaterials
          ? _value._bundleMaterials
          : bundleMaterials // ignore: cast_nullable_to_non_nullable
              as List<MaterialDto>,
      bonusMaterials: null == bonusMaterials
          ? _value._bonusMaterials
          : bonusMaterials // ignore: cast_nullable_to_non_nullable
              as List<BonusSampleItemDto>,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      hidePrice: null == hidePrice
          ? _value.hidePrice
          : hidePrice // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuspended: null == isSuspended
          ? _value.isSuspended
          : isSuspended // ignore: cast_nullable_to_non_nullable
              as bool,
      isPrincipalSuspended: null == isPrincipalSuspended
          ? _value.isPrincipalSuspended
          : isPrincipalSuspended // ignore: cast_nullable_to_non_nullable
              as bool,
      comboDeal: null == comboDeal
          ? _value.comboDeal
          : comboDeal // ignore: cast_nullable_to_non_nullable
              as PriceComboDealDto,
      comboMaterials: null == comboMaterials
          ? _value._comboMaterials
          : comboMaterials // ignore: cast_nullable_to_non_nullable
              as List<ComboMaterialItemDto>,
      maximumQty: null == maximumQty
          ? _value.maximumQty
          : maximumQty // ignore: cast_nullable_to_non_nullable
              as int,
      isMarketPlace: null == isMarketPlace
          ? _value.isMarketPlace
          : isMarketPlace // ignore: cast_nullable_to_non_nullable
              as bool,
      defaultMaterialDescription: null == defaultMaterialDescription
          ? _value.defaultMaterialDescription
          : defaultMaterialDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CartProductDto extends _CartProductDto {
  const _$_CartProductDto(
      {@JsonKey(name: 'productID', defaultValue: '')
          required this.productID,
      @JsonKey(name: 'parentID', defaultValue: '')
          required this.parentID,
      @JsonKey(name: 'type', defaultValue: '')
          required this.type,
      @JsonKey(name: 'quantity', defaultValue: 0)
          required this.quantity,
      @JsonKey(name: 'materialNumber', defaultValue: '')
          required this.materialNumber,
      @JsonKey(name: 'materialDescription', defaultValue: '')
          required this.materialDescription,
      @JsonKey(name: 'therapeuticClass', defaultValue: '')
          required this.therapeuticClass,
      @JsonKey(name: 'taxClassification', defaultValue: '')
          required this.taxClassification,
      @JsonKey(name: 'isFOCMaterial', defaultValue: false)
          required this.isFOCMaterial,
      @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
          required this.itemRegistrationNumber,
      @JsonKey(name: 'genericMaterialName', defaultValue: '')
          required this.genericMaterialName,
      @JsonKey(name: 'principalName', defaultValue: '')
          required this.principalName,
      @JsonKey(name: 'principalCode', defaultValue: '')
          required this.principalCode,
      @JsonKey(name: 'counterOfferPrice', defaultValue: 0)
          required this.counterOfferPrice,
      @JsonKey(name: 'discountOverridePercentage', defaultValue: 0)
          required this.counterOfferDiscount,
      @JsonKey(name: 'counterOfferCurrency', defaultValue: '')
          required this.counterOfferCurrency,
      @JsonKey(name: 'comment', defaultValue: '')
          required this.remarks,
      @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
          required this.governmentMaterialCode,
      @JsonKey(name: 'bundleDetails')
          this.bundleDetails = BundleDetailsDto.empty,
      @JsonKey(name: 'bundleMaterials', defaultValue: <MaterialDto>[])
          required final List<MaterialDto> bundleMaterials,
      @JsonKey(name: 'bonusMaterials', defaultValue: <BonusSampleItemDto>[])
          required final List<BonusSampleItemDto> bonusMaterials,
      @JsonKey(name: 'taxes', readValue: handleTax)
          required this.tax,
      @JsonKey(name: 'hidePrice', defaultValue: false)
          required this.hidePrice,
      @JsonKey(name: 'suspensionStatus', defaultValue: false)
          required this.isSuspended,
      @JsonKey(name: 'principalCutoffStatus', defaultValue: false)
          required this.isPrincipalSuspended,
      @JsonKey(name: 'comboDeals')
          this.comboDeal = PriceComboDealDto.empty,
      @JsonKey(name: 'comboMaterials', defaultValue: [])
          required final List<ComboMaterialItemDto> comboMaterials,
      @JsonKey(name: 'maximumQty', defaultValue: 99999)
          required this.maximumQty,
      @JsonKey(defaultValue: false, readValue: mappingIsMarketPlace)
          required this.isMarketPlace,
      @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
          required this.defaultMaterialDescription})
      : _bundleMaterials = bundleMaterials,
        _bonusMaterials = bonusMaterials,
        _comboMaterials = comboMaterials,
        super._();

  factory _$_CartProductDto.fromJson(Map<String, dynamic> json) =>
      _$$_CartProductDtoFromJson(json);

  @override
  @JsonKey(name: 'productID', defaultValue: '')
  final String productID;
  @override
  @JsonKey(name: 'parentID', defaultValue: '')
  final String parentID;
  @override
  @JsonKey(name: 'type', defaultValue: '')
  final String type;
  @override
  @JsonKey(name: 'quantity', defaultValue: 0)
  final int quantity;
  @override
  @JsonKey(name: 'materialNumber', defaultValue: '')
  final String materialNumber;
  @override
  @JsonKey(name: 'materialDescription', defaultValue: '')
  final String materialDescription;
  @override
  @JsonKey(name: 'therapeuticClass', defaultValue: '')
  final String therapeuticClass;
  @override
  @JsonKey(name: 'taxClassification', defaultValue: '')
  final String taxClassification;
  @override
  @JsonKey(name: 'isFOCMaterial', defaultValue: false)
  final bool isFOCMaterial;
  @override
  @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
  final String itemRegistrationNumber;
  @override
  @JsonKey(name: 'genericMaterialName', defaultValue: '')
  final String genericMaterialName;
  @override
  @JsonKey(name: 'principalName', defaultValue: '')
  final String principalName;
  @override
  @JsonKey(name: 'principalCode', defaultValue: '')
  final String principalCode;
  @override
  @JsonKey(name: 'counterOfferPrice', defaultValue: 0)
  final double counterOfferPrice;
  @override
  @JsonKey(name: 'discountOverridePercentage', defaultValue: 0)
  final double counterOfferDiscount;
  @override
  @JsonKey(name: 'counterOfferCurrency', defaultValue: '')
  final String counterOfferCurrency;
  @override
  @JsonKey(name: 'comment', defaultValue: '')
  final String remarks;
  @override
  @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
  final String governmentMaterialCode;
  @override
  @JsonKey(name: 'bundleDetails')
  final BundleDetailsDto bundleDetails;
  final List<MaterialDto> _bundleMaterials;
  @override
  @JsonKey(name: 'bundleMaterials', defaultValue: <MaterialDto>[])
  List<MaterialDto> get bundleMaterials {
    if (_bundleMaterials is EqualUnmodifiableListView) return _bundleMaterials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bundleMaterials);
  }

  final List<BonusSampleItemDto> _bonusMaterials;
  @override
  @JsonKey(name: 'bonusMaterials', defaultValue: <BonusSampleItemDto>[])
  List<BonusSampleItemDto> get bonusMaterials {
    if (_bonusMaterials is EqualUnmodifiableListView) return _bonusMaterials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bonusMaterials);
  }

  @override
  @JsonKey(name: 'taxes', readValue: handleTax)
  final double tax;
  @override
  @JsonKey(name: 'hidePrice', defaultValue: false)
  final bool hidePrice;
  @override
  @JsonKey(name: 'suspensionStatus', defaultValue: false)
  final bool isSuspended;
  @override
  @JsonKey(name: 'principalCutoffStatus', defaultValue: false)
  final bool isPrincipalSuspended;
  @override
  @JsonKey(name: 'comboDeals')
  final PriceComboDealDto comboDeal;
  final List<ComboMaterialItemDto> _comboMaterials;
  @override
  @JsonKey(name: 'comboMaterials', defaultValue: [])
  List<ComboMaterialItemDto> get comboMaterials {
    if (_comboMaterials is EqualUnmodifiableListView) return _comboMaterials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comboMaterials);
  }

//maximumQty auto set to maximum limit if we get null from response
  @override
  @JsonKey(name: 'maximumQty', defaultValue: 99999)
  final int maximumQty;
  @override
  @JsonKey(defaultValue: false, readValue: mappingIsMarketPlace)
  final bool isMarketPlace;
  @override
  @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
  final String defaultMaterialDescription;

  @override
  String toString() {
    return 'CartProductDto(productID: $productID, parentID: $parentID, type: $type, quantity: $quantity, materialNumber: $materialNumber, materialDescription: $materialDescription, therapeuticClass: $therapeuticClass, taxClassification: $taxClassification, isFOCMaterial: $isFOCMaterial, itemRegistrationNumber: $itemRegistrationNumber, genericMaterialName: $genericMaterialName, principalName: $principalName, principalCode: $principalCode, counterOfferPrice: $counterOfferPrice, counterOfferDiscount: $counterOfferDiscount, counterOfferCurrency: $counterOfferCurrency, remarks: $remarks, governmentMaterialCode: $governmentMaterialCode, bundleDetails: $bundleDetails, bundleMaterials: $bundleMaterials, bonusMaterials: $bonusMaterials, tax: $tax, hidePrice: $hidePrice, isSuspended: $isSuspended, isPrincipalSuspended: $isPrincipalSuspended, comboDeal: $comboDeal, comboMaterials: $comboMaterials, maximumQty: $maximumQty, isMarketPlace: $isMarketPlace, defaultMaterialDescription: $defaultMaterialDescription)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CartProductDto &&
            (identical(other.productID, productID) ||
                other.productID == productID) &&
            (identical(other.parentID, parentID) ||
                other.parentID == parentID) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.materialDescription, materialDescription) ||
                other.materialDescription == materialDescription) &&
            (identical(other.therapeuticClass, therapeuticClass) ||
                other.therapeuticClass == therapeuticClass) &&
            (identical(other.taxClassification, taxClassification) ||
                other.taxClassification == taxClassification) &&
            (identical(other.isFOCMaterial, isFOCMaterial) ||
                other.isFOCMaterial == isFOCMaterial) &&
            (identical(other.itemRegistrationNumber, itemRegistrationNumber) ||
                other.itemRegistrationNumber == itemRegistrationNumber) &&
            (identical(other.genericMaterialName, genericMaterialName) ||
                other.genericMaterialName == genericMaterialName) &&
            (identical(other.principalName, principalName) ||
                other.principalName == principalName) &&
            (identical(other.principalCode, principalCode) ||
                other.principalCode == principalCode) &&
            (identical(other.counterOfferPrice, counterOfferPrice) ||
                other.counterOfferPrice == counterOfferPrice) &&
            (identical(other.counterOfferDiscount, counterOfferDiscount) ||
                other.counterOfferDiscount == counterOfferDiscount) &&
            (identical(other.counterOfferCurrency, counterOfferCurrency) ||
                other.counterOfferCurrency == counterOfferCurrency) &&
            (identical(other.remarks, remarks) || other.remarks == remarks) &&
            (identical(other.governmentMaterialCode, governmentMaterialCode) ||
                other.governmentMaterialCode == governmentMaterialCode) &&
            (identical(other.bundleDetails, bundleDetails) ||
                other.bundleDetails == bundleDetails) &&
            const DeepCollectionEquality()
                .equals(other._bundleMaterials, _bundleMaterials) &&
            const DeepCollectionEquality()
                .equals(other._bonusMaterials, _bonusMaterials) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.hidePrice, hidePrice) ||
                other.hidePrice == hidePrice) &&
            (identical(other.isSuspended, isSuspended) ||
                other.isSuspended == isSuspended) &&
            (identical(other.isPrincipalSuspended, isPrincipalSuspended) ||
                other.isPrincipalSuspended == isPrincipalSuspended) &&
            (identical(other.comboDeal, comboDeal) ||
                other.comboDeal == comboDeal) &&
            const DeepCollectionEquality()
                .equals(other._comboMaterials, _comboMaterials) &&
            (identical(other.maximumQty, maximumQty) ||
                other.maximumQty == maximumQty) &&
            (identical(other.isMarketPlace, isMarketPlace) ||
                other.isMarketPlace == isMarketPlace) &&
            (identical(other.defaultMaterialDescription,
                    defaultMaterialDescription) ||
                other.defaultMaterialDescription ==
                    defaultMaterialDescription));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        productID,
        parentID,
        type,
        quantity,
        materialNumber,
        materialDescription,
        therapeuticClass,
        taxClassification,
        isFOCMaterial,
        itemRegistrationNumber,
        genericMaterialName,
        principalName,
        principalCode,
        counterOfferPrice,
        counterOfferDiscount,
        counterOfferCurrency,
        remarks,
        governmentMaterialCode,
        bundleDetails,
        const DeepCollectionEquality().hash(_bundleMaterials),
        const DeepCollectionEquality().hash(_bonusMaterials),
        tax,
        hidePrice,
        isSuspended,
        isPrincipalSuspended,
        comboDeal,
        const DeepCollectionEquality().hash(_comboMaterials),
        maximumQty,
        isMarketPlace,
        defaultMaterialDescription
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CartProductDtoCopyWith<_$_CartProductDto> get copyWith =>
      __$$_CartProductDtoCopyWithImpl<_$_CartProductDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CartProductDtoToJson(
      this,
    );
  }
}

abstract class _CartProductDto extends CartProductDto {
  const factory _CartProductDto(
          {@JsonKey(name: 'productID', defaultValue: '')
              required final String productID,
          @JsonKey(name: 'parentID', defaultValue: '')
              required final String parentID,
          @JsonKey(name: 'type', defaultValue: '')
              required final String type,
          @JsonKey(name: 'quantity', defaultValue: 0)
              required final int quantity,
          @JsonKey(name: 'materialNumber', defaultValue: '')
              required final String materialNumber,
          @JsonKey(name: 'materialDescription', defaultValue: '')
              required final String materialDescription,
          @JsonKey(name: 'therapeuticClass', defaultValue: '')
              required final String therapeuticClass,
          @JsonKey(name: 'taxClassification', defaultValue: '')
              required final String taxClassification,
          @JsonKey(name: 'isFOCMaterial', defaultValue: false)
              required final bool isFOCMaterial,
          @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
              required final String itemRegistrationNumber,
          @JsonKey(name: 'genericMaterialName', defaultValue: '')
              required final String genericMaterialName,
          @JsonKey(name: 'principalName', defaultValue: '')
              required final String principalName,
          @JsonKey(name: 'principalCode', defaultValue: '')
              required final String principalCode,
          @JsonKey(name: 'counterOfferPrice', defaultValue: 0)
              required final double counterOfferPrice,
          @JsonKey(name: 'discountOverridePercentage', defaultValue: 0)
              required final double counterOfferDiscount,
          @JsonKey(name: 'counterOfferCurrency', defaultValue: '')
              required final String counterOfferCurrency,
          @JsonKey(name: 'comment', defaultValue: '')
              required final String remarks,
          @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
              required final String governmentMaterialCode,
          @JsonKey(name: 'bundleDetails')
              final BundleDetailsDto bundleDetails,
          @JsonKey(name: 'bundleMaterials', defaultValue: <MaterialDto>[])
              required final List<MaterialDto> bundleMaterials,
          @JsonKey(name: 'bonusMaterials', defaultValue: <BonusSampleItemDto>[])
              required final List<BonusSampleItemDto> bonusMaterials,
          @JsonKey(name: 'taxes', readValue: handleTax)
              required final double tax,
          @JsonKey(name: 'hidePrice', defaultValue: false)
              required final bool hidePrice,
          @JsonKey(name: 'suspensionStatus', defaultValue: false)
              required final bool isSuspended,
          @JsonKey(name: 'principalCutoffStatus', defaultValue: false)
              required final bool isPrincipalSuspended,
          @JsonKey(name: 'comboDeals')
              final PriceComboDealDto comboDeal,
          @JsonKey(name: 'comboMaterials', defaultValue: [])
              required final List<ComboMaterialItemDto> comboMaterials,
          @JsonKey(name: 'maximumQty', defaultValue: 99999)
              required final int maximumQty,
          @JsonKey(defaultValue: false, readValue: mappingIsMarketPlace)
              required final bool isMarketPlace,
          @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
              required final String defaultMaterialDescription}) =
      _$_CartProductDto;
  const _CartProductDto._() : super._();

  factory _CartProductDto.fromJson(Map<String, dynamic> json) =
      _$_CartProductDto.fromJson;

  @override
  @JsonKey(name: 'productID', defaultValue: '')
  String get productID;
  @override
  @JsonKey(name: 'parentID', defaultValue: '')
  String get parentID;
  @override
  @JsonKey(name: 'type', defaultValue: '')
  String get type;
  @override
  @JsonKey(name: 'quantity', defaultValue: 0)
  int get quantity;
  @override
  @JsonKey(name: 'materialNumber', defaultValue: '')
  String get materialNumber;
  @override
  @JsonKey(name: 'materialDescription', defaultValue: '')
  String get materialDescription;
  @override
  @JsonKey(name: 'therapeuticClass', defaultValue: '')
  String get therapeuticClass;
  @override
  @JsonKey(name: 'taxClassification', defaultValue: '')
  String get taxClassification;
  @override
  @JsonKey(name: 'isFOCMaterial', defaultValue: false)
  bool get isFOCMaterial;
  @override
  @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
  String get itemRegistrationNumber;
  @override
  @JsonKey(name: 'genericMaterialName', defaultValue: '')
  String get genericMaterialName;
  @override
  @JsonKey(name: 'principalName', defaultValue: '')
  String get principalName;
  @override
  @JsonKey(name: 'principalCode', defaultValue: '')
  String get principalCode;
  @override
  @JsonKey(name: 'counterOfferPrice', defaultValue: 0)
  double get counterOfferPrice;
  @override
  @JsonKey(name: 'discountOverridePercentage', defaultValue: 0)
  double get counterOfferDiscount;
  @override
  @JsonKey(name: 'counterOfferCurrency', defaultValue: '')
  String get counterOfferCurrency;
  @override
  @JsonKey(name: 'comment', defaultValue: '')
  String get remarks;
  @override
  @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
  String get governmentMaterialCode;
  @override
  @JsonKey(name: 'bundleDetails')
  BundleDetailsDto get bundleDetails;
  @override
  @JsonKey(name: 'bundleMaterials', defaultValue: <MaterialDto>[])
  List<MaterialDto> get bundleMaterials;
  @override
  @JsonKey(name: 'bonusMaterials', defaultValue: <BonusSampleItemDto>[])
  List<BonusSampleItemDto> get bonusMaterials;
  @override
  @JsonKey(name: 'taxes', readValue: handleTax)
  double get tax;
  @override
  @JsonKey(name: 'hidePrice', defaultValue: false)
  bool get hidePrice;
  @override
  @JsonKey(name: 'suspensionStatus', defaultValue: false)
  bool get isSuspended;
  @override
  @JsonKey(name: 'principalCutoffStatus', defaultValue: false)
  bool get isPrincipalSuspended;
  @override
  @JsonKey(name: 'comboDeals')
  PriceComboDealDto get comboDeal;
  @override
  @JsonKey(name: 'comboMaterials', defaultValue: [])
  List<ComboMaterialItemDto> get comboMaterials;
  @override //maximumQty auto set to maximum limit if we get null from response
  @JsonKey(name: 'maximumQty', defaultValue: 99999)
  int get maximumQty;
  @override
  @JsonKey(defaultValue: false, readValue: mappingIsMarketPlace)
  bool get isMarketPlace;
  @override
  @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
  String get defaultMaterialDescription;
  @override
  @JsonKey(ignore: true)
  _$$_CartProductDtoCopyWith<_$_CartProductDto> get copyWith =>
      throw _privateConstructorUsedError;
}

BundleDetailsDto _$BundleDetailsDtoFromJson(Map<String, dynamic> json) {
  return _BundleDetailsDto.fromJson(json);
}

/// @nodoc
mixin _$BundleDetailsDto {
  @JsonKey(name: 'bundleName', defaultValue: '')
  String get bundleName => throw _privateConstructorUsedError;
  @JsonKey(name: 'bundleCode', defaultValue: '')
  String get bundleCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'bundleInformation', defaultValue: <BundleInfoDto>[])
  List<BundleInfoDto> get bundleInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BundleDetailsDtoCopyWith<BundleDetailsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BundleDetailsDtoCopyWith<$Res> {
  factory $BundleDetailsDtoCopyWith(
          BundleDetailsDto value, $Res Function(BundleDetailsDto) then) =
      _$BundleDetailsDtoCopyWithImpl<$Res, BundleDetailsDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'bundleName', defaultValue: '')
          String bundleName,
      @JsonKey(name: 'bundleCode', defaultValue: '')
          String bundleCode,
      @JsonKey(name: 'bundleInformation', defaultValue: <BundleInfoDto>[])
          List<BundleInfoDto> bundleInfo});
}

/// @nodoc
class _$BundleDetailsDtoCopyWithImpl<$Res, $Val extends BundleDetailsDto>
    implements $BundleDetailsDtoCopyWith<$Res> {
  _$BundleDetailsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bundleName = null,
    Object? bundleCode = null,
    Object? bundleInfo = null,
  }) {
    return _then(_value.copyWith(
      bundleName: null == bundleName
          ? _value.bundleName
          : bundleName // ignore: cast_nullable_to_non_nullable
              as String,
      bundleCode: null == bundleCode
          ? _value.bundleCode
          : bundleCode // ignore: cast_nullable_to_non_nullable
              as String,
      bundleInfo: null == bundleInfo
          ? _value.bundleInfo
          : bundleInfo // ignore: cast_nullable_to_non_nullable
              as List<BundleInfoDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BundleDetailsDtoCopyWith<$Res>
    implements $BundleDetailsDtoCopyWith<$Res> {
  factory _$$_BundleDetailsDtoCopyWith(
          _$_BundleDetailsDto value, $Res Function(_$_BundleDetailsDto) then) =
      __$$_BundleDetailsDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'bundleName', defaultValue: '')
          String bundleName,
      @JsonKey(name: 'bundleCode', defaultValue: '')
          String bundleCode,
      @JsonKey(name: 'bundleInformation', defaultValue: <BundleInfoDto>[])
          List<BundleInfoDto> bundleInfo});
}

/// @nodoc
class __$$_BundleDetailsDtoCopyWithImpl<$Res>
    extends _$BundleDetailsDtoCopyWithImpl<$Res, _$_BundleDetailsDto>
    implements _$$_BundleDetailsDtoCopyWith<$Res> {
  __$$_BundleDetailsDtoCopyWithImpl(
      _$_BundleDetailsDto _value, $Res Function(_$_BundleDetailsDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bundleName = null,
    Object? bundleCode = null,
    Object? bundleInfo = null,
  }) {
    return _then(_$_BundleDetailsDto(
      bundleName: null == bundleName
          ? _value.bundleName
          : bundleName // ignore: cast_nullable_to_non_nullable
              as String,
      bundleCode: null == bundleCode
          ? _value.bundleCode
          : bundleCode // ignore: cast_nullable_to_non_nullable
              as String,
      bundleInfo: null == bundleInfo
          ? _value._bundleInfo
          : bundleInfo // ignore: cast_nullable_to_non_nullable
              as List<BundleInfoDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BundleDetailsDto extends _BundleDetailsDto {
  const _$_BundleDetailsDto(
      {@JsonKey(name: 'bundleName', defaultValue: '')
          required this.bundleName,
      @JsonKey(name: 'bundleCode', defaultValue: '')
          required this.bundleCode,
      @JsonKey(name: 'bundleInformation', defaultValue: <BundleInfoDto>[])
          required final List<BundleInfoDto> bundleInfo})
      : _bundleInfo = bundleInfo,
        super._();

  factory _$_BundleDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$$_BundleDetailsDtoFromJson(json);

  @override
  @JsonKey(name: 'bundleName', defaultValue: '')
  final String bundleName;
  @override
  @JsonKey(name: 'bundleCode', defaultValue: '')
  final String bundleCode;
  final List<BundleInfoDto> _bundleInfo;
  @override
  @JsonKey(name: 'bundleInformation', defaultValue: <BundleInfoDto>[])
  List<BundleInfoDto> get bundleInfo {
    if (_bundleInfo is EqualUnmodifiableListView) return _bundleInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bundleInfo);
  }

  @override
  String toString() {
    return 'BundleDetailsDto(bundleName: $bundleName, bundleCode: $bundleCode, bundleInfo: $bundleInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BundleDetailsDto &&
            (identical(other.bundleName, bundleName) ||
                other.bundleName == bundleName) &&
            (identical(other.bundleCode, bundleCode) ||
                other.bundleCode == bundleCode) &&
            const DeepCollectionEquality()
                .equals(other._bundleInfo, _bundleInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, bundleName, bundleCode,
      const DeepCollectionEquality().hash(_bundleInfo));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BundleDetailsDtoCopyWith<_$_BundleDetailsDto> get copyWith =>
      __$$_BundleDetailsDtoCopyWithImpl<_$_BundleDetailsDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BundleDetailsDtoToJson(
      this,
    );
  }
}

abstract class _BundleDetailsDto extends BundleDetailsDto {
  const factory _BundleDetailsDto(
      {@JsonKey(name: 'bundleName', defaultValue: '')
          required final String bundleName,
      @JsonKey(name: 'bundleCode', defaultValue: '')
          required final String bundleCode,
      @JsonKey(name: 'bundleInformation', defaultValue: <BundleInfoDto>[])
          required final List<BundleInfoDto> bundleInfo}) = _$_BundleDetailsDto;
  const _BundleDetailsDto._() : super._();

  factory _BundleDetailsDto.fromJson(Map<String, dynamic> json) =
      _$_BundleDetailsDto.fromJson;

  @override
  @JsonKey(name: 'bundleName', defaultValue: '')
  String get bundleName;
  @override
  @JsonKey(name: 'bundleCode', defaultValue: '')
  String get bundleCode;
  @override
  @JsonKey(name: 'bundleInformation', defaultValue: <BundleInfoDto>[])
  List<BundleInfoDto> get bundleInfo;
  @override
  @JsonKey(ignore: true)
  _$$_BundleDetailsDtoCopyWith<_$_BundleDetailsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

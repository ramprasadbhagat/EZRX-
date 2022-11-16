// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sales_organisation_configs_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SalesOrganisationConfigsDto _$SalesOrganisationConfigsDtoFromJson(
    Map<String, dynamic> json) {
  return _SalesOrganisationConfigsDto.fromJson(json);
}

/// @nodoc
mixin _$SalesOrganisationConfigsDto {
  @JsonKey(name: 'disableProcessingStatus')
  @HiveField(100, defaultValue: false)
  bool get disableProcessingStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'currency')
  @HiveField(101, defaultValue: '')
  String get currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'hideCustomer', defaultValue: false)
  @HiveField(102, defaultValue: false)
  bool get hideCustomer => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableGimmickMaterial', defaultValue: false)
  @HiveField(103, defaultValue: false)
  bool get enableGimmickMaterial => throw _privateConstructorUsedError;
  @JsonKey(name: 'languageFilter', defaultValue: false)
  @HiveField(104, defaultValue: false)
  bool get languageFilter => throw _privateConstructorUsedError;
  @JsonKey(name: 'languageValue', defaultValue: '')
  @HiveField(105, defaultValue: '')
  String get languageValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'disablePrincipals', defaultValue: false)
  @HiveField(106, defaultValue: false)
  bool get disablePrincipals => throw _privateConstructorUsedError;
  @_PrincipalListConverter()
  @JsonKey(name: 'principalList')
  @HiveField(7, defaultValue: [])
  List<dynamic> get principalList => throw _privateConstructorUsedError;
  @JsonKey(name: 'disableOrderType', defaultValue: false)
  @HiveField(108, defaultValue: false)
  bool get disableOrderType => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableBatchNumber', defaultValue: false)
  @HiveField(109, defaultValue: false)
  bool get enableBatchNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'disableBundles', defaultValue: false)
  @HiveField(110, defaultValue: false)
  bool get disableBundles => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableZDP5', defaultValue: false)
  @HiveField(111, defaultValue: false)
  bool get enableZDP5 => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableTaxClassification', defaultValue: false)
  @HiveField(112, defaultValue: false)
  bool get enableTaxClassification => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableVat', defaultValue: false)
  @HiveField(113, defaultValue: false)
  bool get enableVat => throw _privateConstructorUsedError;
  @JsonKey(name: 'vatValue', defaultValue: 0)
  @HiveField(114, defaultValue: 0)
  int get vatValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'materialWithoutPrice', defaultValue: false)
  @HiveField(115, defaultValue: false)
  bool get materialWithoutPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableSpecialInstructions', defaultValue: false)
  @HiveField(116, defaultValue: false)
  bool get enableSpecialInstructions => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableReferenceNote', defaultValue: false)
  @HiveField(117, defaultValue: false)
  bool get enableReferenceNote => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableCollectiveNumber', defaultValue: false)
  @HiveField(118, defaultValue: false)
  bool get enableCollectiveNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableMobileNumber', defaultValue: false)
  @HiveField(119, defaultValue: false)
  bool get enableMobileNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableFutureDeliveryDay', defaultValue: false)
  @HiveField(120, defaultValue: false)
  bool get enableFutureDeliveryDay => throw _privateConstructorUsedError;
  @JsonKey(name: 'enablePaymentTerms', defaultValue: false)
  @HiveField(121, defaultValue: false)
  bool get enablePaymentTerms => throw _privateConstructorUsedError;
  @JsonKey(name: 'futureDeliveryDay', defaultValue: '')
  @HiveField(122, defaultValue: '')
  String get futureDeliveryDay => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableGMC', defaultValue: false)
  @HiveField(123, defaultValue: false)
  bool get enableGMC => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableListPrice', defaultValue: false)
  @HiveField(124, defaultValue: false)
  bool get enableListPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableDefaultMD', defaultValue: false)
  @HiveField(125, defaultValue: false)
  bool get enableDefaultMD => throw _privateConstructorUsedError;
  @JsonKey(name: 'priceOverride', defaultValue: false)
  @HiveField(126, defaultValue: false)
  bool get priceOverride => throw _privateConstructorUsedError;
  @JsonKey(name: 'disablePaymentTermsDisplay', defaultValue: false)
  @HiveField(127, defaultValue: false)
  bool get disablePaymentTermsDisplay => throw _privateConstructorUsedError;
  @JsonKey(name: 'disableDeliveryDate', defaultValue: false)
  @HiveField(128, defaultValue: false)
  bool get disableDeliveryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableBillTo', defaultValue: false)
  @HiveField(129, defaultValue: false)
  bool get enableBillTo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SalesOrganisationConfigsDtoCopyWith<SalesOrganisationConfigsDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesOrganisationConfigsDtoCopyWith<$Res> {
  factory $SalesOrganisationConfigsDtoCopyWith(
          SalesOrganisationConfigsDto value,
          $Res Function(SalesOrganisationConfigsDto) then) =
      _$SalesOrganisationConfigsDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'disableProcessingStatus')
      @HiveField(100, defaultValue: false)
          bool disableProcessingStatus,
      @JsonKey(name: 'currency')
      @HiveField(101, defaultValue: '')
          String currency,
      @JsonKey(name: 'hideCustomer', defaultValue: false)
      @HiveField(102, defaultValue: false)
          bool hideCustomer,
      @JsonKey(name: 'enableGimmickMaterial', defaultValue: false)
      @HiveField(103, defaultValue: false)
          bool enableGimmickMaterial,
      @JsonKey(name: 'languageFilter', defaultValue: false)
      @HiveField(104, defaultValue: false)
          bool languageFilter,
      @JsonKey(name: 'languageValue', defaultValue: '')
      @HiveField(105, defaultValue: '')
          String languageValue,
      @JsonKey(name: 'disablePrincipals', defaultValue: false)
      @HiveField(106, defaultValue: false)
          bool disablePrincipals,
      @_PrincipalListConverter()
      @JsonKey(name: 'principalList')
      @HiveField(7, defaultValue: [])
          List<dynamic> principalList,
      @JsonKey(name: 'disableOrderType', defaultValue: false)
      @HiveField(108, defaultValue: false)
          bool disableOrderType,
      @JsonKey(name: 'enableBatchNumber', defaultValue: false)
      @HiveField(109, defaultValue: false)
          bool enableBatchNumber,
      @JsonKey(name: 'disableBundles', defaultValue: false)
      @HiveField(110, defaultValue: false)
          bool disableBundles,
      @JsonKey(name: 'enableZDP5', defaultValue: false)
      @HiveField(111, defaultValue: false)
          bool enableZDP5,
      @JsonKey(name: 'enableTaxClassification', defaultValue: false)
      @HiveField(112, defaultValue: false)
          bool enableTaxClassification,
      @JsonKey(name: 'enableVat', defaultValue: false)
      @HiveField(113, defaultValue: false)
          bool enableVat,
      @JsonKey(name: 'vatValue', defaultValue: 0)
      @HiveField(114, defaultValue: 0)
          int vatValue,
      @JsonKey(name: 'materialWithoutPrice', defaultValue: false)
      @HiveField(115, defaultValue: false)
          bool materialWithoutPrice,
      @JsonKey(name: 'enableSpecialInstructions', defaultValue: false)
      @HiveField(116, defaultValue: false)
          bool enableSpecialInstructions,
      @JsonKey(name: 'enableReferenceNote', defaultValue: false)
      @HiveField(117, defaultValue: false)
          bool enableReferenceNote,
      @JsonKey(name: 'enableCollectiveNumber', defaultValue: false)
      @HiveField(118, defaultValue: false)
          bool enableCollectiveNumber,
      @JsonKey(name: 'enableMobileNumber', defaultValue: false)
      @HiveField(119, defaultValue: false)
          bool enableMobileNumber,
      @JsonKey(name: 'enableFutureDeliveryDay', defaultValue: false)
      @HiveField(120, defaultValue: false)
          bool enableFutureDeliveryDay,
      @JsonKey(name: 'enablePaymentTerms', defaultValue: false)
      @HiveField(121, defaultValue: false)
          bool enablePaymentTerms,
      @JsonKey(name: 'futureDeliveryDay', defaultValue: '')
      @HiveField(122, defaultValue: '')
          String futureDeliveryDay,
      @JsonKey(name: 'enableGMC', defaultValue: false)
      @HiveField(123, defaultValue: false)
          bool enableGMC,
      @JsonKey(name: 'enableListPrice', defaultValue: false)
      @HiveField(124, defaultValue: false)
          bool enableListPrice,
      @JsonKey(name: 'enableDefaultMD', defaultValue: false)
      @HiveField(125, defaultValue: false)
          bool enableDefaultMD,
      @JsonKey(name: 'priceOverride', defaultValue: false)
      @HiveField(126, defaultValue: false)
          bool priceOverride,
      @JsonKey(name: 'disablePaymentTermsDisplay', defaultValue: false)
      @HiveField(127, defaultValue: false)
          bool disablePaymentTermsDisplay,
      @JsonKey(name: 'disableDeliveryDate', defaultValue: false)
      @HiveField(128, defaultValue: false)
          bool disableDeliveryDate,
      @JsonKey(name: 'enableBillTo', defaultValue: false)
      @HiveField(129, defaultValue: false)
          bool enableBillTo});
}

/// @nodoc
class _$SalesOrganisationConfigsDtoCopyWithImpl<$Res>
    implements $SalesOrganisationConfigsDtoCopyWith<$Res> {
  _$SalesOrganisationConfigsDtoCopyWithImpl(this._value, this._then);

  final SalesOrganisationConfigsDto _value;
  // ignore: unused_field
  final $Res Function(SalesOrganisationConfigsDto) _then;

  @override
  $Res call({
    Object? disableProcessingStatus = freezed,
    Object? currency = freezed,
    Object? hideCustomer = freezed,
    Object? enableGimmickMaterial = freezed,
    Object? languageFilter = freezed,
    Object? languageValue = freezed,
    Object? disablePrincipals = freezed,
    Object? principalList = freezed,
    Object? disableOrderType = freezed,
    Object? enableBatchNumber = freezed,
    Object? disableBundles = freezed,
    Object? enableZDP5 = freezed,
    Object? enableTaxClassification = freezed,
    Object? enableVat = freezed,
    Object? vatValue = freezed,
    Object? materialWithoutPrice = freezed,
    Object? enableSpecialInstructions = freezed,
    Object? enableReferenceNote = freezed,
    Object? enableCollectiveNumber = freezed,
    Object? enableMobileNumber = freezed,
    Object? enableFutureDeliveryDay = freezed,
    Object? enablePaymentTerms = freezed,
    Object? futureDeliveryDay = freezed,
    Object? enableGMC = freezed,
    Object? enableListPrice = freezed,
    Object? enableDefaultMD = freezed,
    Object? priceOverride = freezed,
    Object? disablePaymentTermsDisplay = freezed,
    Object? disableDeliveryDate = freezed,
    Object? enableBillTo = freezed,
  }) {
    return _then(_value.copyWith(
      disableProcessingStatus: disableProcessingStatus == freezed
          ? _value.disableProcessingStatus
          : disableProcessingStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      currency: currency == freezed
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      hideCustomer: hideCustomer == freezed
          ? _value.hideCustomer
          : hideCustomer // ignore: cast_nullable_to_non_nullable
              as bool,
      enableGimmickMaterial: enableGimmickMaterial == freezed
          ? _value.enableGimmickMaterial
          : enableGimmickMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
      languageFilter: languageFilter == freezed
          ? _value.languageFilter
          : languageFilter // ignore: cast_nullable_to_non_nullable
              as bool,
      languageValue: languageValue == freezed
          ? _value.languageValue
          : languageValue // ignore: cast_nullable_to_non_nullable
              as String,
      disablePrincipals: disablePrincipals == freezed
          ? _value.disablePrincipals
          : disablePrincipals // ignore: cast_nullable_to_non_nullable
              as bool,
      principalList: principalList == freezed
          ? _value.principalList
          : principalList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      disableOrderType: disableOrderType == freezed
          ? _value.disableOrderType
          : disableOrderType // ignore: cast_nullable_to_non_nullable
              as bool,
      enableBatchNumber: enableBatchNumber == freezed
          ? _value.enableBatchNumber
          : enableBatchNumber // ignore: cast_nullable_to_non_nullable
              as bool,
      disableBundles: disableBundles == freezed
          ? _value.disableBundles
          : disableBundles // ignore: cast_nullable_to_non_nullable
              as bool,
      enableZDP5: enableZDP5 == freezed
          ? _value.enableZDP5
          : enableZDP5 // ignore: cast_nullable_to_non_nullable
              as bool,
      enableTaxClassification: enableTaxClassification == freezed
          ? _value.enableTaxClassification
          : enableTaxClassification // ignore: cast_nullable_to_non_nullable
              as bool,
      enableVat: enableVat == freezed
          ? _value.enableVat
          : enableVat // ignore: cast_nullable_to_non_nullable
              as bool,
      vatValue: vatValue == freezed
          ? _value.vatValue
          : vatValue // ignore: cast_nullable_to_non_nullable
              as int,
      materialWithoutPrice: materialWithoutPrice == freezed
          ? _value.materialWithoutPrice
          : materialWithoutPrice // ignore: cast_nullable_to_non_nullable
              as bool,
      enableSpecialInstructions: enableSpecialInstructions == freezed
          ? _value.enableSpecialInstructions
          : enableSpecialInstructions // ignore: cast_nullable_to_non_nullable
              as bool,
      enableReferenceNote: enableReferenceNote == freezed
          ? _value.enableReferenceNote
          : enableReferenceNote // ignore: cast_nullable_to_non_nullable
              as bool,
      enableCollectiveNumber: enableCollectiveNumber == freezed
          ? _value.enableCollectiveNumber
          : enableCollectiveNumber // ignore: cast_nullable_to_non_nullable
              as bool,
      enableMobileNumber: enableMobileNumber == freezed
          ? _value.enableMobileNumber
          : enableMobileNumber // ignore: cast_nullable_to_non_nullable
              as bool,
      enableFutureDeliveryDay: enableFutureDeliveryDay == freezed
          ? _value.enableFutureDeliveryDay
          : enableFutureDeliveryDay // ignore: cast_nullable_to_non_nullable
              as bool,
      enablePaymentTerms: enablePaymentTerms == freezed
          ? _value.enablePaymentTerms
          : enablePaymentTerms // ignore: cast_nullable_to_non_nullable
              as bool,
      futureDeliveryDay: futureDeliveryDay == freezed
          ? _value.futureDeliveryDay
          : futureDeliveryDay // ignore: cast_nullable_to_non_nullable
              as String,
      enableGMC: enableGMC == freezed
          ? _value.enableGMC
          : enableGMC // ignore: cast_nullable_to_non_nullable
              as bool,
      enableListPrice: enableListPrice == freezed
          ? _value.enableListPrice
          : enableListPrice // ignore: cast_nullable_to_non_nullable
              as bool,
      enableDefaultMD: enableDefaultMD == freezed
          ? _value.enableDefaultMD
          : enableDefaultMD // ignore: cast_nullable_to_non_nullable
              as bool,
      priceOverride: priceOverride == freezed
          ? _value.priceOverride
          : priceOverride // ignore: cast_nullable_to_non_nullable
              as bool,
      disablePaymentTermsDisplay: disablePaymentTermsDisplay == freezed
          ? _value.disablePaymentTermsDisplay
          : disablePaymentTermsDisplay // ignore: cast_nullable_to_non_nullable
              as bool,
      disableDeliveryDate: disableDeliveryDate == freezed
          ? _value.disableDeliveryDate
          : disableDeliveryDate // ignore: cast_nullable_to_non_nullable
              as bool,
      enableBillTo: enableBillTo == freezed
          ? _value.enableBillTo
          : enableBillTo // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_SalesOrganisationConfigsDtoCopyWith<$Res>
    implements $SalesOrganisationConfigsDtoCopyWith<$Res> {
  factory _$$_SalesOrganisationConfigsDtoCopyWith(
          _$_SalesOrganisationConfigsDto value,
          $Res Function(_$_SalesOrganisationConfigsDto) then) =
      __$$_SalesOrganisationConfigsDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'disableProcessingStatus')
      @HiveField(100, defaultValue: false)
          bool disableProcessingStatus,
      @JsonKey(name: 'currency')
      @HiveField(101, defaultValue: '')
          String currency,
      @JsonKey(name: 'hideCustomer', defaultValue: false)
      @HiveField(102, defaultValue: false)
          bool hideCustomer,
      @JsonKey(name: 'enableGimmickMaterial', defaultValue: false)
      @HiveField(103, defaultValue: false)
          bool enableGimmickMaterial,
      @JsonKey(name: 'languageFilter', defaultValue: false)
      @HiveField(104, defaultValue: false)
          bool languageFilter,
      @JsonKey(name: 'languageValue', defaultValue: '')
      @HiveField(105, defaultValue: '')
          String languageValue,
      @JsonKey(name: 'disablePrincipals', defaultValue: false)
      @HiveField(106, defaultValue: false)
          bool disablePrincipals,
      @_PrincipalListConverter()
      @JsonKey(name: 'principalList')
      @HiveField(7, defaultValue: [])
          List<dynamic> principalList,
      @JsonKey(name: 'disableOrderType', defaultValue: false)
      @HiveField(108, defaultValue: false)
          bool disableOrderType,
      @JsonKey(name: 'enableBatchNumber', defaultValue: false)
      @HiveField(109, defaultValue: false)
          bool enableBatchNumber,
      @JsonKey(name: 'disableBundles', defaultValue: false)
      @HiveField(110, defaultValue: false)
          bool disableBundles,
      @JsonKey(name: 'enableZDP5', defaultValue: false)
      @HiveField(111, defaultValue: false)
          bool enableZDP5,
      @JsonKey(name: 'enableTaxClassification', defaultValue: false)
      @HiveField(112, defaultValue: false)
          bool enableTaxClassification,
      @JsonKey(name: 'enableVat', defaultValue: false)
      @HiveField(113, defaultValue: false)
          bool enableVat,
      @JsonKey(name: 'vatValue', defaultValue: 0)
      @HiveField(114, defaultValue: 0)
          int vatValue,
      @JsonKey(name: 'materialWithoutPrice', defaultValue: false)
      @HiveField(115, defaultValue: false)
          bool materialWithoutPrice,
      @JsonKey(name: 'enableSpecialInstructions', defaultValue: false)
      @HiveField(116, defaultValue: false)
          bool enableSpecialInstructions,
      @JsonKey(name: 'enableReferenceNote', defaultValue: false)
      @HiveField(117, defaultValue: false)
          bool enableReferenceNote,
      @JsonKey(name: 'enableCollectiveNumber', defaultValue: false)
      @HiveField(118, defaultValue: false)
          bool enableCollectiveNumber,
      @JsonKey(name: 'enableMobileNumber', defaultValue: false)
      @HiveField(119, defaultValue: false)
          bool enableMobileNumber,
      @JsonKey(name: 'enableFutureDeliveryDay', defaultValue: false)
      @HiveField(120, defaultValue: false)
          bool enableFutureDeliveryDay,
      @JsonKey(name: 'enablePaymentTerms', defaultValue: false)
      @HiveField(121, defaultValue: false)
          bool enablePaymentTerms,
      @JsonKey(name: 'futureDeliveryDay', defaultValue: '')
      @HiveField(122, defaultValue: '')
          String futureDeliveryDay,
      @JsonKey(name: 'enableGMC', defaultValue: false)
      @HiveField(123, defaultValue: false)
          bool enableGMC,
      @JsonKey(name: 'enableListPrice', defaultValue: false)
      @HiveField(124, defaultValue: false)
          bool enableListPrice,
      @JsonKey(name: 'enableDefaultMD', defaultValue: false)
      @HiveField(125, defaultValue: false)
          bool enableDefaultMD,
      @JsonKey(name: 'priceOverride', defaultValue: false)
      @HiveField(126, defaultValue: false)
          bool priceOverride,
      @JsonKey(name: 'disablePaymentTermsDisplay', defaultValue: false)
      @HiveField(127, defaultValue: false)
          bool disablePaymentTermsDisplay,
      @JsonKey(name: 'disableDeliveryDate', defaultValue: false)
      @HiveField(128, defaultValue: false)
          bool disableDeliveryDate,
      @JsonKey(name: 'enableBillTo', defaultValue: false)
      @HiveField(129, defaultValue: false)
          bool enableBillTo});
}

/// @nodoc
class __$$_SalesOrganisationConfigsDtoCopyWithImpl<$Res>
    extends _$SalesOrganisationConfigsDtoCopyWithImpl<$Res>
    implements _$$_SalesOrganisationConfigsDtoCopyWith<$Res> {
  __$$_SalesOrganisationConfigsDtoCopyWithImpl(
      _$_SalesOrganisationConfigsDto _value,
      $Res Function(_$_SalesOrganisationConfigsDto) _then)
      : super(_value, (v) => _then(v as _$_SalesOrganisationConfigsDto));

  @override
  _$_SalesOrganisationConfigsDto get _value =>
      super._value as _$_SalesOrganisationConfigsDto;

  @override
  $Res call({
    Object? disableProcessingStatus = freezed,
    Object? currency = freezed,
    Object? hideCustomer = freezed,
    Object? enableGimmickMaterial = freezed,
    Object? languageFilter = freezed,
    Object? languageValue = freezed,
    Object? disablePrincipals = freezed,
    Object? principalList = freezed,
    Object? disableOrderType = freezed,
    Object? enableBatchNumber = freezed,
    Object? disableBundles = freezed,
    Object? enableZDP5 = freezed,
    Object? enableTaxClassification = freezed,
    Object? enableVat = freezed,
    Object? vatValue = freezed,
    Object? materialWithoutPrice = freezed,
    Object? enableSpecialInstructions = freezed,
    Object? enableReferenceNote = freezed,
    Object? enableCollectiveNumber = freezed,
    Object? enableMobileNumber = freezed,
    Object? enableFutureDeliveryDay = freezed,
    Object? enablePaymentTerms = freezed,
    Object? futureDeliveryDay = freezed,
    Object? enableGMC = freezed,
    Object? enableListPrice = freezed,
    Object? enableDefaultMD = freezed,
    Object? priceOverride = freezed,
    Object? disablePaymentTermsDisplay = freezed,
    Object? disableDeliveryDate = freezed,
    Object? enableBillTo = freezed,
  }) {
    return _then(_$_SalesOrganisationConfigsDto(
      disableProcessingStatus: disableProcessingStatus == freezed
          ? _value.disableProcessingStatus
          : disableProcessingStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      currency: currency == freezed
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      hideCustomer: hideCustomer == freezed
          ? _value.hideCustomer
          : hideCustomer // ignore: cast_nullable_to_non_nullable
              as bool,
      enableGimmickMaterial: enableGimmickMaterial == freezed
          ? _value.enableGimmickMaterial
          : enableGimmickMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
      languageFilter: languageFilter == freezed
          ? _value.languageFilter
          : languageFilter // ignore: cast_nullable_to_non_nullable
              as bool,
      languageValue: languageValue == freezed
          ? _value.languageValue
          : languageValue // ignore: cast_nullable_to_non_nullable
              as String,
      disablePrincipals: disablePrincipals == freezed
          ? _value.disablePrincipals
          : disablePrincipals // ignore: cast_nullable_to_non_nullable
              as bool,
      principalList: principalList == freezed
          ? _value._principalList
          : principalList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      disableOrderType: disableOrderType == freezed
          ? _value.disableOrderType
          : disableOrderType // ignore: cast_nullable_to_non_nullable
              as bool,
      enableBatchNumber: enableBatchNumber == freezed
          ? _value.enableBatchNumber
          : enableBatchNumber // ignore: cast_nullable_to_non_nullable
              as bool,
      disableBundles: disableBundles == freezed
          ? _value.disableBundles
          : disableBundles // ignore: cast_nullable_to_non_nullable
              as bool,
      enableZDP5: enableZDP5 == freezed
          ? _value.enableZDP5
          : enableZDP5 // ignore: cast_nullable_to_non_nullable
              as bool,
      enableTaxClassification: enableTaxClassification == freezed
          ? _value.enableTaxClassification
          : enableTaxClassification // ignore: cast_nullable_to_non_nullable
              as bool,
      enableVat: enableVat == freezed
          ? _value.enableVat
          : enableVat // ignore: cast_nullable_to_non_nullable
              as bool,
      vatValue: vatValue == freezed
          ? _value.vatValue
          : vatValue // ignore: cast_nullable_to_non_nullable
              as int,
      materialWithoutPrice: materialWithoutPrice == freezed
          ? _value.materialWithoutPrice
          : materialWithoutPrice // ignore: cast_nullable_to_non_nullable
              as bool,
      enableSpecialInstructions: enableSpecialInstructions == freezed
          ? _value.enableSpecialInstructions
          : enableSpecialInstructions // ignore: cast_nullable_to_non_nullable
              as bool,
      enableReferenceNote: enableReferenceNote == freezed
          ? _value.enableReferenceNote
          : enableReferenceNote // ignore: cast_nullable_to_non_nullable
              as bool,
      enableCollectiveNumber: enableCollectiveNumber == freezed
          ? _value.enableCollectiveNumber
          : enableCollectiveNumber // ignore: cast_nullable_to_non_nullable
              as bool,
      enableMobileNumber: enableMobileNumber == freezed
          ? _value.enableMobileNumber
          : enableMobileNumber // ignore: cast_nullable_to_non_nullable
              as bool,
      enableFutureDeliveryDay: enableFutureDeliveryDay == freezed
          ? _value.enableFutureDeliveryDay
          : enableFutureDeliveryDay // ignore: cast_nullable_to_non_nullable
              as bool,
      enablePaymentTerms: enablePaymentTerms == freezed
          ? _value.enablePaymentTerms
          : enablePaymentTerms // ignore: cast_nullable_to_non_nullable
              as bool,
      futureDeliveryDay: futureDeliveryDay == freezed
          ? _value.futureDeliveryDay
          : futureDeliveryDay // ignore: cast_nullable_to_non_nullable
              as String,
      enableGMC: enableGMC == freezed
          ? _value.enableGMC
          : enableGMC // ignore: cast_nullable_to_non_nullable
              as bool,
      enableListPrice: enableListPrice == freezed
          ? _value.enableListPrice
          : enableListPrice // ignore: cast_nullable_to_non_nullable
              as bool,
      enableDefaultMD: enableDefaultMD == freezed
          ? _value.enableDefaultMD
          : enableDefaultMD // ignore: cast_nullable_to_non_nullable
              as bool,
      priceOverride: priceOverride == freezed
          ? _value.priceOverride
          : priceOverride // ignore: cast_nullable_to_non_nullable
              as bool,
      disablePaymentTermsDisplay: disablePaymentTermsDisplay == freezed
          ? _value.disablePaymentTermsDisplay
          : disablePaymentTermsDisplay // ignore: cast_nullable_to_non_nullable
              as bool,
      disableDeliveryDate: disableDeliveryDate == freezed
          ? _value.disableDeliveryDate
          : disableDeliveryDate // ignore: cast_nullable_to_non_nullable
              as bool,
      enableBillTo: enableBillTo == freezed
          ? _value.enableBillTo
          : enableBillTo // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 5, adapterName: 'SalesOrganisationConfigsDtoAdapter')
class _$_SalesOrganisationConfigsDto extends _SalesOrganisationConfigsDto {
  const _$_SalesOrganisationConfigsDto(
      {@JsonKey(name: 'disableProcessingStatus')
      @HiveField(100, defaultValue: false)
          required this.disableProcessingStatus,
      @JsonKey(name: 'currency')
      @HiveField(101, defaultValue: '')
          required this.currency,
      @JsonKey(name: 'hideCustomer', defaultValue: false)
      @HiveField(102, defaultValue: false)
          required this.hideCustomer,
      @JsonKey(name: 'enableGimmickMaterial', defaultValue: false)
      @HiveField(103, defaultValue: false)
          required this.enableGimmickMaterial,
      @JsonKey(name: 'languageFilter', defaultValue: false)
      @HiveField(104, defaultValue: false)
          required this.languageFilter,
      @JsonKey(name: 'languageValue', defaultValue: '')
      @HiveField(105, defaultValue: '')
          required this.languageValue,
      @JsonKey(name: 'disablePrincipals', defaultValue: false)
      @HiveField(106, defaultValue: false)
          required this.disablePrincipals,
      @_PrincipalListConverter()
      @JsonKey(name: 'principalList')
      @HiveField(7, defaultValue: [])
          required final List<dynamic> principalList,
      @JsonKey(name: 'disableOrderType', defaultValue: false)
      @HiveField(108, defaultValue: false)
          required this.disableOrderType,
      @JsonKey(name: 'enableBatchNumber', defaultValue: false)
      @HiveField(109, defaultValue: false)
          required this.enableBatchNumber,
      @JsonKey(name: 'disableBundles', defaultValue: false)
      @HiveField(110, defaultValue: false)
          required this.disableBundles,
      @JsonKey(name: 'enableZDP5', defaultValue: false)
      @HiveField(111, defaultValue: false)
          required this.enableZDP5,
      @JsonKey(name: 'enableTaxClassification', defaultValue: false)
      @HiveField(112, defaultValue: false)
          required this.enableTaxClassification,
      @JsonKey(name: 'enableVat', defaultValue: false)
      @HiveField(113, defaultValue: false)
          required this.enableVat,
      @JsonKey(name: 'vatValue', defaultValue: 0)
      @HiveField(114, defaultValue: 0)
          required this.vatValue,
      @JsonKey(name: 'materialWithoutPrice', defaultValue: false)
      @HiveField(115, defaultValue: false)
          required this.materialWithoutPrice,
      @JsonKey(name: 'enableSpecialInstructions', defaultValue: false)
      @HiveField(116, defaultValue: false)
          required this.enableSpecialInstructions,
      @JsonKey(name: 'enableReferenceNote', defaultValue: false)
      @HiveField(117, defaultValue: false)
          required this.enableReferenceNote,
      @JsonKey(name: 'enableCollectiveNumber', defaultValue: false)
      @HiveField(118, defaultValue: false)
          required this.enableCollectiveNumber,
      @JsonKey(name: 'enableMobileNumber', defaultValue: false)
      @HiveField(119, defaultValue: false)
          required this.enableMobileNumber,
      @JsonKey(name: 'enableFutureDeliveryDay', defaultValue: false)
      @HiveField(120, defaultValue: false)
          required this.enableFutureDeliveryDay,
      @JsonKey(name: 'enablePaymentTerms', defaultValue: false)
      @HiveField(121, defaultValue: false)
          required this.enablePaymentTerms,
      @JsonKey(name: 'futureDeliveryDay', defaultValue: '')
      @HiveField(122, defaultValue: '')
          required this.futureDeliveryDay,
      @JsonKey(name: 'enableGMC', defaultValue: false)
      @HiveField(123, defaultValue: false)
          required this.enableGMC,
      @JsonKey(name: 'enableListPrice', defaultValue: false)
      @HiveField(124, defaultValue: false)
          required this.enableListPrice,
      @JsonKey(name: 'enableDefaultMD', defaultValue: false)
      @HiveField(125, defaultValue: false)
          required this.enableDefaultMD,
      @JsonKey(name: 'priceOverride', defaultValue: false)
      @HiveField(126, defaultValue: false)
          required this.priceOverride,
      @JsonKey(name: 'disablePaymentTermsDisplay', defaultValue: false)
      @HiveField(127, defaultValue: false)
          required this.disablePaymentTermsDisplay,
      @JsonKey(name: 'disableDeliveryDate', defaultValue: false)
      @HiveField(128, defaultValue: false)
          required this.disableDeliveryDate,
      @JsonKey(name: 'enableBillTo', defaultValue: false)
      @HiveField(129, defaultValue: false)
          required this.enableBillTo})
      : _principalList = principalList,
        super._();

  factory _$_SalesOrganisationConfigsDto.fromJson(Map<String, dynamic> json) =>
      _$$_SalesOrganisationConfigsDtoFromJson(json);

  @override
  @JsonKey(name: 'disableProcessingStatus')
  @HiveField(100, defaultValue: false)
  final bool disableProcessingStatus;
  @override
  @JsonKey(name: 'currency')
  @HiveField(101, defaultValue: '')
  final String currency;
  @override
  @JsonKey(name: 'hideCustomer', defaultValue: false)
  @HiveField(102, defaultValue: false)
  final bool hideCustomer;
  @override
  @JsonKey(name: 'enableGimmickMaterial', defaultValue: false)
  @HiveField(103, defaultValue: false)
  final bool enableGimmickMaterial;
  @override
  @JsonKey(name: 'languageFilter', defaultValue: false)
  @HiveField(104, defaultValue: false)
  final bool languageFilter;
  @override
  @JsonKey(name: 'languageValue', defaultValue: '')
  @HiveField(105, defaultValue: '')
  final String languageValue;
  @override
  @JsonKey(name: 'disablePrincipals', defaultValue: false)
  @HiveField(106, defaultValue: false)
  final bool disablePrincipals;
  final List<dynamic> _principalList;
  @override
  @_PrincipalListConverter()
  @JsonKey(name: 'principalList')
  @HiveField(7, defaultValue: [])
  List<dynamic> get principalList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_principalList);
  }

  @override
  @JsonKey(name: 'disableOrderType', defaultValue: false)
  @HiveField(108, defaultValue: false)
  final bool disableOrderType;
  @override
  @JsonKey(name: 'enableBatchNumber', defaultValue: false)
  @HiveField(109, defaultValue: false)
  final bool enableBatchNumber;
  @override
  @JsonKey(name: 'disableBundles', defaultValue: false)
  @HiveField(110, defaultValue: false)
  final bool disableBundles;
  @override
  @JsonKey(name: 'enableZDP5', defaultValue: false)
  @HiveField(111, defaultValue: false)
  final bool enableZDP5;
  @override
  @JsonKey(name: 'enableTaxClassification', defaultValue: false)
  @HiveField(112, defaultValue: false)
  final bool enableTaxClassification;
  @override
  @JsonKey(name: 'enableVat', defaultValue: false)
  @HiveField(113, defaultValue: false)
  final bool enableVat;
  @override
  @JsonKey(name: 'vatValue', defaultValue: 0)
  @HiveField(114, defaultValue: 0)
  final int vatValue;
  @override
  @JsonKey(name: 'materialWithoutPrice', defaultValue: false)
  @HiveField(115, defaultValue: false)
  final bool materialWithoutPrice;
  @override
  @JsonKey(name: 'enableSpecialInstructions', defaultValue: false)
  @HiveField(116, defaultValue: false)
  final bool enableSpecialInstructions;
  @override
  @JsonKey(name: 'enableReferenceNote', defaultValue: false)
  @HiveField(117, defaultValue: false)
  final bool enableReferenceNote;
  @override
  @JsonKey(name: 'enableCollectiveNumber', defaultValue: false)
  @HiveField(118, defaultValue: false)
  final bool enableCollectiveNumber;
  @override
  @JsonKey(name: 'enableMobileNumber', defaultValue: false)
  @HiveField(119, defaultValue: false)
  final bool enableMobileNumber;
  @override
  @JsonKey(name: 'enableFutureDeliveryDay', defaultValue: false)
  @HiveField(120, defaultValue: false)
  final bool enableFutureDeliveryDay;
  @override
  @JsonKey(name: 'enablePaymentTerms', defaultValue: false)
  @HiveField(121, defaultValue: false)
  final bool enablePaymentTerms;
  @override
  @JsonKey(name: 'futureDeliveryDay', defaultValue: '')
  @HiveField(122, defaultValue: '')
  final String futureDeliveryDay;
  @override
  @JsonKey(name: 'enableGMC', defaultValue: false)
  @HiveField(123, defaultValue: false)
  final bool enableGMC;
  @override
  @JsonKey(name: 'enableListPrice', defaultValue: false)
  @HiveField(124, defaultValue: false)
  final bool enableListPrice;
  @override
  @JsonKey(name: 'enableDefaultMD', defaultValue: false)
  @HiveField(125, defaultValue: false)
  final bool enableDefaultMD;
  @override
  @JsonKey(name: 'priceOverride', defaultValue: false)
  @HiveField(126, defaultValue: false)
  final bool priceOverride;
  @override
  @JsonKey(name: 'disablePaymentTermsDisplay', defaultValue: false)
  @HiveField(127, defaultValue: false)
  final bool disablePaymentTermsDisplay;
  @override
  @JsonKey(name: 'disableDeliveryDate', defaultValue: false)
  @HiveField(128, defaultValue: false)
  final bool disableDeliveryDate;
  @override
  @JsonKey(name: 'enableBillTo', defaultValue: false)
  @HiveField(129, defaultValue: false)
  final bool enableBillTo;

  @override
  String toString() {
    return 'SalesOrganisationConfigsDto(disableProcessingStatus: $disableProcessingStatus, currency: $currency, hideCustomer: $hideCustomer, enableGimmickMaterial: $enableGimmickMaterial, languageFilter: $languageFilter, languageValue: $languageValue, disablePrincipals: $disablePrincipals, principalList: $principalList, disableOrderType: $disableOrderType, enableBatchNumber: $enableBatchNumber, disableBundles: $disableBundles, enableZDP5: $enableZDP5, enableTaxClassification: $enableTaxClassification, enableVat: $enableVat, vatValue: $vatValue, materialWithoutPrice: $materialWithoutPrice, enableSpecialInstructions: $enableSpecialInstructions, enableReferenceNote: $enableReferenceNote, enableCollectiveNumber: $enableCollectiveNumber, enableMobileNumber: $enableMobileNumber, enableFutureDeliveryDay: $enableFutureDeliveryDay, enablePaymentTerms: $enablePaymentTerms, futureDeliveryDay: $futureDeliveryDay, enableGMC: $enableGMC, enableListPrice: $enableListPrice, enableDefaultMD: $enableDefaultMD, priceOverride: $priceOverride, disablePaymentTermsDisplay: $disablePaymentTermsDisplay, disableDeliveryDate: $disableDeliveryDate, enableBillTo: $enableBillTo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SalesOrganisationConfigsDto &&
            const DeepCollectionEquality().equals(
                other.disableProcessingStatus, disableProcessingStatus) &&
            const DeepCollectionEquality().equals(other.currency, currency) &&
            const DeepCollectionEquality()
                .equals(other.hideCustomer, hideCustomer) &&
            const DeepCollectionEquality()
                .equals(other.enableGimmickMaterial, enableGimmickMaterial) &&
            const DeepCollectionEquality()
                .equals(other.languageFilter, languageFilter) &&
            const DeepCollectionEquality()
                .equals(other.languageValue, languageValue) &&
            const DeepCollectionEquality()
                .equals(other.disablePrincipals, disablePrincipals) &&
            const DeepCollectionEquality()
                .equals(other._principalList, _principalList) &&
            const DeepCollectionEquality()
                .equals(other.disableOrderType, disableOrderType) &&
            const DeepCollectionEquality()
                .equals(other.enableBatchNumber, enableBatchNumber) &&
            const DeepCollectionEquality()
                .equals(other.disableBundles, disableBundles) &&
            const DeepCollectionEquality()
                .equals(other.enableZDP5, enableZDP5) &&
            const DeepCollectionEquality().equals(
                other.enableTaxClassification, enableTaxClassification) &&
            const DeepCollectionEquality().equals(other.enableVat, enableVat) &&
            const DeepCollectionEquality().equals(other.vatValue, vatValue) &&
            const DeepCollectionEquality()
                .equals(other.materialWithoutPrice, materialWithoutPrice) &&
            const DeepCollectionEquality().equals(
                other.enableSpecialInstructions, enableSpecialInstructions) &&
            const DeepCollectionEquality()
                .equals(other.enableReferenceNote, enableReferenceNote) &&
            const DeepCollectionEquality()
                .equals(other.enableCollectiveNumber, enableCollectiveNumber) &&
            const DeepCollectionEquality()
                .equals(other.enableMobileNumber, enableMobileNumber) &&
            const DeepCollectionEquality().equals(
                other.enableFutureDeliveryDay, enableFutureDeliveryDay) &&
            const DeepCollectionEquality()
                .equals(other.enablePaymentTerms, enablePaymentTerms) &&
            const DeepCollectionEquality()
                .equals(other.futureDeliveryDay, futureDeliveryDay) &&
            const DeepCollectionEquality().equals(other.enableGMC, enableGMC) &&
            const DeepCollectionEquality()
                .equals(other.enableListPrice, enableListPrice) &&
            const DeepCollectionEquality()
                .equals(other.enableDefaultMD, enableDefaultMD) &&
            const DeepCollectionEquality()
                .equals(other.priceOverride, priceOverride) &&
            const DeepCollectionEquality().equals(
                other.disablePaymentTermsDisplay, disablePaymentTermsDisplay) &&
            const DeepCollectionEquality()
                .equals(other.disableDeliveryDate, disableDeliveryDate) &&
            const DeepCollectionEquality()
                .equals(other.enableBillTo, enableBillTo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(disableProcessingStatus),
        const DeepCollectionEquality().hash(currency),
        const DeepCollectionEquality().hash(hideCustomer),
        const DeepCollectionEquality().hash(enableGimmickMaterial),
        const DeepCollectionEquality().hash(languageFilter),
        const DeepCollectionEquality().hash(languageValue),
        const DeepCollectionEquality().hash(disablePrincipals),
        const DeepCollectionEquality().hash(_principalList),
        const DeepCollectionEquality().hash(disableOrderType),
        const DeepCollectionEquality().hash(enableBatchNumber),
        const DeepCollectionEquality().hash(disableBundles),
        const DeepCollectionEquality().hash(enableZDP5),
        const DeepCollectionEquality().hash(enableTaxClassification),
        const DeepCollectionEquality().hash(enableVat),
        const DeepCollectionEquality().hash(vatValue),
        const DeepCollectionEquality().hash(materialWithoutPrice),
        const DeepCollectionEquality().hash(enableSpecialInstructions),
        const DeepCollectionEquality().hash(enableReferenceNote),
        const DeepCollectionEquality().hash(enableCollectiveNumber),
        const DeepCollectionEquality().hash(enableMobileNumber),
        const DeepCollectionEquality().hash(enableFutureDeliveryDay),
        const DeepCollectionEquality().hash(enablePaymentTerms),
        const DeepCollectionEquality().hash(futureDeliveryDay),
        const DeepCollectionEquality().hash(enableGMC),
        const DeepCollectionEquality().hash(enableListPrice),
        const DeepCollectionEquality().hash(enableDefaultMD),
        const DeepCollectionEquality().hash(priceOverride),
        const DeepCollectionEquality().hash(disablePaymentTermsDisplay),
        const DeepCollectionEquality().hash(disableDeliveryDate),
        const DeepCollectionEquality().hash(enableBillTo)
      ]);

  @JsonKey(ignore: true)
  @override
  _$$_SalesOrganisationConfigsDtoCopyWith<_$_SalesOrganisationConfigsDto>
      get copyWith => __$$_SalesOrganisationConfigsDtoCopyWithImpl<
          _$_SalesOrganisationConfigsDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SalesOrganisationConfigsDtoToJson(
      this,
    );
  }
}

abstract class _SalesOrganisationConfigsDto
    extends SalesOrganisationConfigsDto {
  const factory _SalesOrganisationConfigsDto(
      {@JsonKey(name: 'disableProcessingStatus')
      @HiveField(100, defaultValue: false)
          required final bool disableProcessingStatus,
      @JsonKey(name: 'currency')
      @HiveField(101, defaultValue: '')
          required final String currency,
      @JsonKey(name: 'hideCustomer', defaultValue: false)
      @HiveField(102, defaultValue: false)
          required final bool hideCustomer,
      @JsonKey(name: 'enableGimmickMaterial', defaultValue: false)
      @HiveField(103, defaultValue: false)
          required final bool enableGimmickMaterial,
      @JsonKey(name: 'languageFilter', defaultValue: false)
      @HiveField(104, defaultValue: false)
          required final bool languageFilter,
      @JsonKey(name: 'languageValue', defaultValue: '')
      @HiveField(105, defaultValue: '')
          required final String languageValue,
      @JsonKey(name: 'disablePrincipals', defaultValue: false)
      @HiveField(106, defaultValue: false)
          required final bool disablePrincipals,
      @_PrincipalListConverter()
      @JsonKey(name: 'principalList')
      @HiveField(7, defaultValue: [])
          required final List<dynamic> principalList,
      @JsonKey(name: 'disableOrderType', defaultValue: false)
      @HiveField(108, defaultValue: false)
          required final bool disableOrderType,
      @JsonKey(name: 'enableBatchNumber', defaultValue: false)
      @HiveField(109, defaultValue: false)
          required final bool enableBatchNumber,
      @JsonKey(name: 'disableBundles', defaultValue: false)
      @HiveField(110, defaultValue: false)
          required final bool disableBundles,
      @JsonKey(name: 'enableZDP5', defaultValue: false)
      @HiveField(111, defaultValue: false)
          required final bool enableZDP5,
      @JsonKey(name: 'enableTaxClassification', defaultValue: false)
      @HiveField(112, defaultValue: false)
          required final bool enableTaxClassification,
      @JsonKey(name: 'enableVat', defaultValue: false)
      @HiveField(113, defaultValue: false)
          required final bool enableVat,
      @JsonKey(name: 'vatValue', defaultValue: 0)
      @HiveField(114, defaultValue: 0)
          required final int vatValue,
      @JsonKey(name: 'materialWithoutPrice', defaultValue: false)
      @HiveField(115, defaultValue: false)
          required final bool materialWithoutPrice,
      @JsonKey(name: 'enableSpecialInstructions', defaultValue: false)
      @HiveField(116, defaultValue: false)
          required final bool enableSpecialInstructions,
      @JsonKey(name: 'enableReferenceNote', defaultValue: false)
      @HiveField(117, defaultValue: false)
          required final bool enableReferenceNote,
      @JsonKey(name: 'enableCollectiveNumber', defaultValue: false)
      @HiveField(118, defaultValue: false)
          required final bool enableCollectiveNumber,
      @JsonKey(name: 'enableMobileNumber', defaultValue: false)
      @HiveField(119, defaultValue: false)
          required final bool enableMobileNumber,
      @JsonKey(name: 'enableFutureDeliveryDay', defaultValue: false)
      @HiveField(120, defaultValue: false)
          required final bool enableFutureDeliveryDay,
      @JsonKey(name: 'enablePaymentTerms', defaultValue: false)
      @HiveField(121, defaultValue: false)
          required final bool enablePaymentTerms,
      @JsonKey(name: 'futureDeliveryDay', defaultValue: '')
      @HiveField(122, defaultValue: '')
          required final String futureDeliveryDay,
      @JsonKey(name: 'enableGMC', defaultValue: false)
      @HiveField(123, defaultValue: false)
          required final bool enableGMC,
      @JsonKey(name: 'enableListPrice', defaultValue: false)
      @HiveField(124, defaultValue: false)
          required final bool enableListPrice,
      @JsonKey(name: 'enableDefaultMD', defaultValue: false)
      @HiveField(125, defaultValue: false)
          required final bool enableDefaultMD,
      @JsonKey(name: 'priceOverride', defaultValue: false)
      @HiveField(126, defaultValue: false)
          required final bool priceOverride,
      @JsonKey(name: 'disablePaymentTermsDisplay', defaultValue: false)
      @HiveField(127, defaultValue: false)
          required final bool disablePaymentTermsDisplay,
      @JsonKey(name: 'disableDeliveryDate', defaultValue: false)
      @HiveField(128, defaultValue: false)
          required final bool disableDeliveryDate,
      @JsonKey(name: 'enableBillTo', defaultValue: false)
      @HiveField(129, defaultValue: false)
          required final bool enableBillTo}) = _$_SalesOrganisationConfigsDto;
  const _SalesOrganisationConfigsDto._() : super._();

  factory _SalesOrganisationConfigsDto.fromJson(Map<String, dynamic> json) =
      _$_SalesOrganisationConfigsDto.fromJson;

  @override
  @JsonKey(name: 'disableProcessingStatus')
  @HiveField(100, defaultValue: false)
  bool get disableProcessingStatus;
  @override
  @JsonKey(name: 'currency')
  @HiveField(101, defaultValue: '')
  String get currency;
  @override
  @JsonKey(name: 'hideCustomer', defaultValue: false)
  @HiveField(102, defaultValue: false)
  bool get hideCustomer;
  @override
  @JsonKey(name: 'enableGimmickMaterial', defaultValue: false)
  @HiveField(103, defaultValue: false)
  bool get enableGimmickMaterial;
  @override
  @JsonKey(name: 'languageFilter', defaultValue: false)
  @HiveField(104, defaultValue: false)
  bool get languageFilter;
  @override
  @JsonKey(name: 'languageValue', defaultValue: '')
  @HiveField(105, defaultValue: '')
  String get languageValue;
  @override
  @JsonKey(name: 'disablePrincipals', defaultValue: false)
  @HiveField(106, defaultValue: false)
  bool get disablePrincipals;
  @override
  @_PrincipalListConverter()
  @JsonKey(name: 'principalList')
  @HiveField(7, defaultValue: [])
  List<dynamic> get principalList;
  @override
  @JsonKey(name: 'disableOrderType', defaultValue: false)
  @HiveField(108, defaultValue: false)
  bool get disableOrderType;
  @override
  @JsonKey(name: 'enableBatchNumber', defaultValue: false)
  @HiveField(109, defaultValue: false)
  bool get enableBatchNumber;
  @override
  @JsonKey(name: 'disableBundles', defaultValue: false)
  @HiveField(110, defaultValue: false)
  bool get disableBundles;
  @override
  @JsonKey(name: 'enableZDP5', defaultValue: false)
  @HiveField(111, defaultValue: false)
  bool get enableZDP5;
  @override
  @JsonKey(name: 'enableTaxClassification', defaultValue: false)
  @HiveField(112, defaultValue: false)
  bool get enableTaxClassification;
  @override
  @JsonKey(name: 'enableVat', defaultValue: false)
  @HiveField(113, defaultValue: false)
  bool get enableVat;
  @override
  @JsonKey(name: 'vatValue', defaultValue: 0)
  @HiveField(114, defaultValue: 0)
  int get vatValue;
  @override
  @JsonKey(name: 'materialWithoutPrice', defaultValue: false)
  @HiveField(115, defaultValue: false)
  bool get materialWithoutPrice;
  @override
  @JsonKey(name: 'enableSpecialInstructions', defaultValue: false)
  @HiveField(116, defaultValue: false)
  bool get enableSpecialInstructions;
  @override
  @JsonKey(name: 'enableReferenceNote', defaultValue: false)
  @HiveField(117, defaultValue: false)
  bool get enableReferenceNote;
  @override
  @JsonKey(name: 'enableCollectiveNumber', defaultValue: false)
  @HiveField(118, defaultValue: false)
  bool get enableCollectiveNumber;
  @override
  @JsonKey(name: 'enableMobileNumber', defaultValue: false)
  @HiveField(119, defaultValue: false)
  bool get enableMobileNumber;
  @override
  @JsonKey(name: 'enableFutureDeliveryDay', defaultValue: false)
  @HiveField(120, defaultValue: false)
  bool get enableFutureDeliveryDay;
  @override
  @JsonKey(name: 'enablePaymentTerms', defaultValue: false)
  @HiveField(121, defaultValue: false)
  bool get enablePaymentTerms;
  @override
  @JsonKey(name: 'futureDeliveryDay', defaultValue: '')
  @HiveField(122, defaultValue: '')
  String get futureDeliveryDay;
  @override
  @JsonKey(name: 'enableGMC', defaultValue: false)
  @HiveField(123, defaultValue: false)
  bool get enableGMC;
  @override
  @JsonKey(name: 'enableListPrice', defaultValue: false)
  @HiveField(124, defaultValue: false)
  bool get enableListPrice;
  @override
  @JsonKey(name: 'enableDefaultMD', defaultValue: false)
  @HiveField(125, defaultValue: false)
  bool get enableDefaultMD;
  @override
  @JsonKey(name: 'priceOverride', defaultValue: false)
  @HiveField(126, defaultValue: false)
  bool get priceOverride;
  @override
  @JsonKey(name: 'disablePaymentTermsDisplay', defaultValue: false)
  @HiveField(127, defaultValue: false)
  bool get disablePaymentTermsDisplay;
  @override
  @JsonKey(name: 'disableDeliveryDate', defaultValue: false)
  @HiveField(128, defaultValue: false)
  bool get disableDeliveryDate;
  @override
  @JsonKey(name: 'enableBillTo', defaultValue: false)
  @HiveField(129, defaultValue: false)
  bool get enableBillTo;
  @override
  @JsonKey(ignore: true)
  _$$_SalesOrganisationConfigsDtoCopyWith<_$_SalesOrganisationConfigsDto>
      get copyWith => throw _privateConstructorUsedError;
}

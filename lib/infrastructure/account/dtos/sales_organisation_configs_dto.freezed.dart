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
      _$SalesOrganisationConfigsDtoCopyWithImpl<$Res,
          SalesOrganisationConfigsDto>;
  @useResult
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
          bool enableDefaultMD});
}

/// @nodoc
class _$SalesOrganisationConfigsDtoCopyWithImpl<$Res,
        $Val extends SalesOrganisationConfigsDto>
    implements $SalesOrganisationConfigsDtoCopyWith<$Res> {
  _$SalesOrganisationConfigsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? disableProcessingStatus = null,
    Object? currency = null,
    Object? hideCustomer = null,
    Object? enableGimmickMaterial = null,
    Object? languageFilter = null,
    Object? languageValue = null,
    Object? disablePrincipals = null,
    Object? principalList = null,
    Object? disableOrderType = null,
    Object? enableBatchNumber = null,
    Object? disableBundles = null,
    Object? enableZDP5 = null,
    Object? enableTaxClassification = null,
    Object? enableVat = null,
    Object? vatValue = null,
    Object? materialWithoutPrice = null,
    Object? enableSpecialInstructions = null,
    Object? enableReferenceNote = null,
    Object? enableCollectiveNumber = null,
    Object? enableMobileNumber = null,
    Object? enableFutureDeliveryDay = null,
    Object? enablePaymentTerms = null,
    Object? futureDeliveryDay = null,
    Object? enableGMC = null,
    Object? enableListPrice = null,
    Object? enableDefaultMD = null,
  }) {
    return _then(_value.copyWith(
      disableProcessingStatus: null == disableProcessingStatus
          ? _value.disableProcessingStatus
          : disableProcessingStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      hideCustomer: null == hideCustomer
          ? _value.hideCustomer
          : hideCustomer // ignore: cast_nullable_to_non_nullable
              as bool,
      enableGimmickMaterial: null == enableGimmickMaterial
          ? _value.enableGimmickMaterial
          : enableGimmickMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
      languageFilter: null == languageFilter
          ? _value.languageFilter
          : languageFilter // ignore: cast_nullable_to_non_nullable
              as bool,
      languageValue: null == languageValue
          ? _value.languageValue
          : languageValue // ignore: cast_nullable_to_non_nullable
              as String,
      disablePrincipals: null == disablePrincipals
          ? _value.disablePrincipals
          : disablePrincipals // ignore: cast_nullable_to_non_nullable
              as bool,
      principalList: null == principalList
          ? _value.principalList
          : principalList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      disableOrderType: null == disableOrderType
          ? _value.disableOrderType
          : disableOrderType // ignore: cast_nullable_to_non_nullable
              as bool,
      enableBatchNumber: null == enableBatchNumber
          ? _value.enableBatchNumber
          : enableBatchNumber // ignore: cast_nullable_to_non_nullable
              as bool,
      disableBundles: null == disableBundles
          ? _value.disableBundles
          : disableBundles // ignore: cast_nullable_to_non_nullable
              as bool,
      enableZDP5: null == enableZDP5
          ? _value.enableZDP5
          : enableZDP5 // ignore: cast_nullable_to_non_nullable
              as bool,
      enableTaxClassification: null == enableTaxClassification
          ? _value.enableTaxClassification
          : enableTaxClassification // ignore: cast_nullable_to_non_nullable
              as bool,
      enableVat: null == enableVat
          ? _value.enableVat
          : enableVat // ignore: cast_nullable_to_non_nullable
              as bool,
      vatValue: null == vatValue
          ? _value.vatValue
          : vatValue // ignore: cast_nullable_to_non_nullable
              as int,
      materialWithoutPrice: null == materialWithoutPrice
          ? _value.materialWithoutPrice
          : materialWithoutPrice // ignore: cast_nullable_to_non_nullable
              as bool,
      enableSpecialInstructions: null == enableSpecialInstructions
          ? _value.enableSpecialInstructions
          : enableSpecialInstructions // ignore: cast_nullable_to_non_nullable
              as bool,
      enableReferenceNote: null == enableReferenceNote
          ? _value.enableReferenceNote
          : enableReferenceNote // ignore: cast_nullable_to_non_nullable
              as bool,
      enableCollectiveNumber: null == enableCollectiveNumber
          ? _value.enableCollectiveNumber
          : enableCollectiveNumber // ignore: cast_nullable_to_non_nullable
              as bool,
      enableMobileNumber: null == enableMobileNumber
          ? _value.enableMobileNumber
          : enableMobileNumber // ignore: cast_nullable_to_non_nullable
              as bool,
      enableFutureDeliveryDay: null == enableFutureDeliveryDay
          ? _value.enableFutureDeliveryDay
          : enableFutureDeliveryDay // ignore: cast_nullable_to_non_nullable
              as bool,
      enablePaymentTerms: null == enablePaymentTerms
          ? _value.enablePaymentTerms
          : enablePaymentTerms // ignore: cast_nullable_to_non_nullable
              as bool,
      futureDeliveryDay: null == futureDeliveryDay
          ? _value.futureDeliveryDay
          : futureDeliveryDay // ignore: cast_nullable_to_non_nullable
              as String,
      enableGMC: null == enableGMC
          ? _value.enableGMC
          : enableGMC // ignore: cast_nullable_to_non_nullable
              as bool,
      enableListPrice: null == enableListPrice
          ? _value.enableListPrice
          : enableListPrice // ignore: cast_nullable_to_non_nullable
              as bool,
      enableDefaultMD: null == enableDefaultMD
          ? _value.enableDefaultMD
          : enableDefaultMD // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
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
  @useResult
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
          bool enableDefaultMD});
}

/// @nodoc
class __$$_SalesOrganisationConfigsDtoCopyWithImpl<$Res>
    extends _$SalesOrganisationConfigsDtoCopyWithImpl<$Res,
        _$_SalesOrganisationConfigsDto>
    implements _$$_SalesOrganisationConfigsDtoCopyWith<$Res> {
  __$$_SalesOrganisationConfigsDtoCopyWithImpl(
      _$_SalesOrganisationConfigsDto _value,
      $Res Function(_$_SalesOrganisationConfigsDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? disableProcessingStatus = null,
    Object? currency = null,
    Object? hideCustomer = null,
    Object? enableGimmickMaterial = null,
    Object? languageFilter = null,
    Object? languageValue = null,
    Object? disablePrincipals = null,
    Object? principalList = null,
    Object? disableOrderType = null,
    Object? enableBatchNumber = null,
    Object? disableBundles = null,
    Object? enableZDP5 = null,
    Object? enableTaxClassification = null,
    Object? enableVat = null,
    Object? vatValue = null,
    Object? materialWithoutPrice = null,
    Object? enableSpecialInstructions = null,
    Object? enableReferenceNote = null,
    Object? enableCollectiveNumber = null,
    Object? enableMobileNumber = null,
    Object? enableFutureDeliveryDay = null,
    Object? enablePaymentTerms = null,
    Object? futureDeliveryDay = null,
    Object? enableGMC = null,
    Object? enableListPrice = null,
    Object? enableDefaultMD = null,
  }) {
    return _then(_$_SalesOrganisationConfigsDto(
      disableProcessingStatus: null == disableProcessingStatus
          ? _value.disableProcessingStatus
          : disableProcessingStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      hideCustomer: null == hideCustomer
          ? _value.hideCustomer
          : hideCustomer // ignore: cast_nullable_to_non_nullable
              as bool,
      enableGimmickMaterial: null == enableGimmickMaterial
          ? _value.enableGimmickMaterial
          : enableGimmickMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
      languageFilter: null == languageFilter
          ? _value.languageFilter
          : languageFilter // ignore: cast_nullable_to_non_nullable
              as bool,
      languageValue: null == languageValue
          ? _value.languageValue
          : languageValue // ignore: cast_nullable_to_non_nullable
              as String,
      disablePrincipals: null == disablePrincipals
          ? _value.disablePrincipals
          : disablePrincipals // ignore: cast_nullable_to_non_nullable
              as bool,
      principalList: null == principalList
          ? _value._principalList
          : principalList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      disableOrderType: null == disableOrderType
          ? _value.disableOrderType
          : disableOrderType // ignore: cast_nullable_to_non_nullable
              as bool,
      enableBatchNumber: null == enableBatchNumber
          ? _value.enableBatchNumber
          : enableBatchNumber // ignore: cast_nullable_to_non_nullable
              as bool,
      disableBundles: null == disableBundles
          ? _value.disableBundles
          : disableBundles // ignore: cast_nullable_to_non_nullable
              as bool,
      enableZDP5: null == enableZDP5
          ? _value.enableZDP5
          : enableZDP5 // ignore: cast_nullable_to_non_nullable
              as bool,
      enableTaxClassification: null == enableTaxClassification
          ? _value.enableTaxClassification
          : enableTaxClassification // ignore: cast_nullable_to_non_nullable
              as bool,
      enableVat: null == enableVat
          ? _value.enableVat
          : enableVat // ignore: cast_nullable_to_non_nullable
              as bool,
      vatValue: null == vatValue
          ? _value.vatValue
          : vatValue // ignore: cast_nullable_to_non_nullable
              as int,
      materialWithoutPrice: null == materialWithoutPrice
          ? _value.materialWithoutPrice
          : materialWithoutPrice // ignore: cast_nullable_to_non_nullable
              as bool,
      enableSpecialInstructions: null == enableSpecialInstructions
          ? _value.enableSpecialInstructions
          : enableSpecialInstructions // ignore: cast_nullable_to_non_nullable
              as bool,
      enableReferenceNote: null == enableReferenceNote
          ? _value.enableReferenceNote
          : enableReferenceNote // ignore: cast_nullable_to_non_nullable
              as bool,
      enableCollectiveNumber: null == enableCollectiveNumber
          ? _value.enableCollectiveNumber
          : enableCollectiveNumber // ignore: cast_nullable_to_non_nullable
              as bool,
      enableMobileNumber: null == enableMobileNumber
          ? _value.enableMobileNumber
          : enableMobileNumber // ignore: cast_nullable_to_non_nullable
              as bool,
      enableFutureDeliveryDay: null == enableFutureDeliveryDay
          ? _value.enableFutureDeliveryDay
          : enableFutureDeliveryDay // ignore: cast_nullable_to_non_nullable
              as bool,
      enablePaymentTerms: null == enablePaymentTerms
          ? _value.enablePaymentTerms
          : enablePaymentTerms // ignore: cast_nullable_to_non_nullable
              as bool,
      futureDeliveryDay: null == futureDeliveryDay
          ? _value.futureDeliveryDay
          : futureDeliveryDay // ignore: cast_nullable_to_non_nullable
              as String,
      enableGMC: null == enableGMC
          ? _value.enableGMC
          : enableGMC // ignore: cast_nullable_to_non_nullable
              as bool,
      enableListPrice: null == enableListPrice
          ? _value.enableListPrice
          : enableListPrice // ignore: cast_nullable_to_non_nullable
              as bool,
      enableDefaultMD: null == enableDefaultMD
          ? _value.enableDefaultMD
          : enableDefaultMD // ignore: cast_nullable_to_non_nullable
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
          required this.enableDefaultMD})
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
  String toString() {
    return 'SalesOrganisationConfigsDto(disableProcessingStatus: $disableProcessingStatus, currency: $currency, hideCustomer: $hideCustomer, enableGimmickMaterial: $enableGimmickMaterial, languageFilter: $languageFilter, languageValue: $languageValue, disablePrincipals: $disablePrincipals, principalList: $principalList, disableOrderType: $disableOrderType, enableBatchNumber: $enableBatchNumber, disableBundles: $disableBundles, enableZDP5: $enableZDP5, enableTaxClassification: $enableTaxClassification, enableVat: $enableVat, vatValue: $vatValue, materialWithoutPrice: $materialWithoutPrice, enableSpecialInstructions: $enableSpecialInstructions, enableReferenceNote: $enableReferenceNote, enableCollectiveNumber: $enableCollectiveNumber, enableMobileNumber: $enableMobileNumber, enableFutureDeliveryDay: $enableFutureDeliveryDay, enablePaymentTerms: $enablePaymentTerms, futureDeliveryDay: $futureDeliveryDay, enableGMC: $enableGMC, enableListPrice: $enableListPrice, enableDefaultMD: $enableDefaultMD)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SalesOrganisationConfigsDto &&
            (identical(other.disableProcessingStatus, disableProcessingStatus) ||
                other.disableProcessingStatus == disableProcessingStatus) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.hideCustomer, hideCustomer) ||
                other.hideCustomer == hideCustomer) &&
            (identical(other.enableGimmickMaterial, enableGimmickMaterial) ||
                other.enableGimmickMaterial == enableGimmickMaterial) &&
            (identical(other.languageFilter, languageFilter) ||
                other.languageFilter == languageFilter) &&
            (identical(other.languageValue, languageValue) ||
                other.languageValue == languageValue) &&
            (identical(other.disablePrincipals, disablePrincipals) ||
                other.disablePrincipals == disablePrincipals) &&
            const DeepCollectionEquality()
                .equals(other._principalList, _principalList) &&
            (identical(other.disableOrderType, disableOrderType) ||
                other.disableOrderType == disableOrderType) &&
            (identical(other.enableBatchNumber, enableBatchNumber) ||
                other.enableBatchNumber == enableBatchNumber) &&
            (identical(other.disableBundles, disableBundles) ||
                other.disableBundles == disableBundles) &&
            (identical(other.enableZDP5, enableZDP5) ||
                other.enableZDP5 == enableZDP5) &&
            (identical(other.enableTaxClassification, enableTaxClassification) ||
                other.enableTaxClassification == enableTaxClassification) &&
            (identical(other.enableVat, enableVat) ||
                other.enableVat == enableVat) &&
            (identical(other.vatValue, vatValue) ||
                other.vatValue == vatValue) &&
            (identical(other.materialWithoutPrice, materialWithoutPrice) ||
                other.materialWithoutPrice == materialWithoutPrice) &&
            (identical(other.enableSpecialInstructions,
                    enableSpecialInstructions) ||
                other.enableSpecialInstructions == enableSpecialInstructions) &&
            (identical(other.enableReferenceNote, enableReferenceNote) ||
                other.enableReferenceNote == enableReferenceNote) &&
            (identical(other.enableCollectiveNumber, enableCollectiveNumber) ||
                other.enableCollectiveNumber == enableCollectiveNumber) &&
            (identical(other.enableMobileNumber, enableMobileNumber) ||
                other.enableMobileNumber == enableMobileNumber) &&
            (identical(other.enableFutureDeliveryDay, enableFutureDeliveryDay) ||
                other.enableFutureDeliveryDay == enableFutureDeliveryDay) &&
            (identical(other.enablePaymentTerms, enablePaymentTerms) ||
                other.enablePaymentTerms == enablePaymentTerms) &&
            (identical(other.futureDeliveryDay, futureDeliveryDay) ||
                other.futureDeliveryDay == futureDeliveryDay) &&
            (identical(other.enableGMC, enableGMC) ||
                other.enableGMC == enableGMC) &&
            (identical(other.enableListPrice, enableListPrice) ||
                other.enableListPrice == enableListPrice) &&
            (identical(other.enableDefaultMD, enableDefaultMD) ||
                other.enableDefaultMD == enableDefaultMD));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        disableProcessingStatus,
        currency,
        hideCustomer,
        enableGimmickMaterial,
        languageFilter,
        languageValue,
        disablePrincipals,
        const DeepCollectionEquality().hash(_principalList),
        disableOrderType,
        enableBatchNumber,
        disableBundles,
        enableZDP5,
        enableTaxClassification,
        enableVat,
        vatValue,
        materialWithoutPrice,
        enableSpecialInstructions,
        enableReferenceNote,
        enableCollectiveNumber,
        enableMobileNumber,
        enableFutureDeliveryDay,
        enablePaymentTerms,
        futureDeliveryDay,
        enableGMC,
        enableListPrice,
        enableDefaultMD
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
              required final bool enableDefaultMD}) =
      _$_SalesOrganisationConfigsDto;
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
  @JsonKey(ignore: true)
  _$$_SalesOrganisationConfigsDtoCopyWith<_$_SalesOrganisationConfigsDto>
      get copyWith => throw _privateConstructorUsedError;
}

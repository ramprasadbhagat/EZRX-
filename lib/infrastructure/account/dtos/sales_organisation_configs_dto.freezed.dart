// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  @JsonKey(name: 'languageValue', readValue: handleEmptyLanguageValue)
  @HiveField(105, defaultValue: ApiLanguageCode.english)
  String get languageValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'disablePrincipals', defaultValue: false)
  @HiveField(106, defaultValue: false)
  bool get disablePrincipals => throw _privateConstructorUsedError;
  @JsonKey(name: 'principalList')
  @_PrincipalListConverter()
  @HiveField(7, defaultValue: [])
  List<SalesOrganisationConfigsPrincipalDto> get principalList =>
      throw _privateConstructorUsedError;
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
  @JsonKey(name: 'showPOAttachment', defaultValue: false)
  @HiveField(130, defaultValue: false)
  bool get showPOAttachment => throw _privateConstructorUsedError;
  @JsonKey(name: 'expiryDateDisplay', defaultValue: false)
  @HiveField(131, defaultValue: false)
  bool get expiryDateDisplay => throw _privateConstructorUsedError;
  @JsonKey(name: 'hideStockDisplay', defaultValue: false)
  @HiveField(132, defaultValue: false)
  bool get hideStockDisplay => throw _privateConstructorUsedError;
  @JsonKey(name: 'addOosMaterials', defaultValue: false)
  @HiveField(133, defaultValue: false)
  bool get addOosMaterials => throw _privateConstructorUsedError;
  @JsonKey(name: 'oosValue', defaultValue: 0)
  @HiveField(134, defaultValue: 0)
  int get oosValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableRemarks', defaultValue: false)
  @HiveField(135, defaultValue: false)
  bool get enableRemarks => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableOHPrice', defaultValue: true)
  @HiveField(136, defaultValue: true)
  bool get enableOHPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'ponRequired', defaultValue: false)
  @HiveField(137, defaultValue: false)
  bool get poNumberRequired => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableIRN', defaultValue: false)
  @HiveField(138, defaultValue: false)
  bool get enableIRN => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableTaxDisplay', defaultValue: false)
  @HiveField(139, defaultValue: false)
  bool get enableTaxDisplay => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableTaxAtTotalLevelOnly', defaultValue: false)
  @HiveField(140, defaultValue: false)
  bool get enableTaxAtTotalLevelOnly => throw _privateConstructorUsedError;
  @JsonKey(name: 'netPriceOverride', defaultValue: false)
  @HiveField(141, defaultValue: false)
  bool get netPriceOverride => throw _privateConstructorUsedError;
  @JsonKey(name: 'batchNumDisplay', defaultValue: false)
  @HiveField(142, defaultValue: false)
  bool get batchNumDisplay => throw _privateConstructorUsedError;
  @JsonKey(name: 'displayOrderDiscount', defaultValue: false)
  @HiveField(143, defaultValue: false)
  bool get displayOrderDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: 'minOrderAmount', defaultValue: '0')
  @HiveField(144, defaultValue: '0')
  String get minOrderAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'salesOrgCode', defaultValue: '0')
  @HiveField(145, defaultValue: '0')
  String get salesOrg => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableZDP8Override', defaultValue: false)
  @HiveField(146, defaultValue: false)
  bool get enableZDP8Override => throw _privateConstructorUsedError;
  @JsonKey(name: 'disableReturnsAccessSR', defaultValue: false)
  @HiveField(147, defaultValue: false)
  bool get disableReturnsAccessSR => throw _privateConstructorUsedError;
  @JsonKey(name: 'disableReturnsAccess', defaultValue: false)
  @HiveField(148, defaultValue: false)
  bool get disableReturnsAccess => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableGreenDelivery', defaultValue: false)
  @HiveField(149, defaultValue: false)
  bool get enableGreenDelivery => throw _privateConstructorUsedError;
  @JsonKey(name: 'greenDeliveryDelayInDays', defaultValue: 2)
  @HiveField(150, defaultValue: 2)
  int get greenDeliveryDelayInDays => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableComboDeals', defaultValue: false)
  @HiveField(151, defaultValue: false)
  bool get enableComboDeals => throw _privateConstructorUsedError;
  @JsonKey(name: 'greenDeliveryUserRole', defaultValue: 0)
  @HiveField(152, defaultValue: 0)
  int get greenDeliveryUserRole => throw _privateConstructorUsedError;
  @JsonKey(name: 'comboDealsUserRole', defaultValue: 0)
  @HiveField(153, defaultValue: 0)
  int get comboDealsUserRole => throw _privateConstructorUsedError;
  @JsonKey(name: 'enableGMN', defaultValue: false)
  @HiveField(154, defaultValue: false)
  bool get enableGMN => throw _privateConstructorUsedError;
  @JsonKey(name: 'displayItemTaxBreakdown', defaultValue: false)
  @HiveField(155, defaultValue: false)
  bool get displayItemTaxBreakdown => throw _privateConstructorUsedError;
  @JsonKey(name: 'displaySubtotalTaxBreakdown', defaultValue: false)
  @HiveField(156, defaultValue: false)
  bool get displaySubtotalTaxBreakdown => throw _privateConstructorUsedError;
  @JsonKey(name: 'disablePayment', defaultValue: false)
  @HiveField(157, defaultValue: false)
  bool get disablePayment => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'languageValue', readValue: handleEmptyLanguageValue)
      @HiveField(105, defaultValue: ApiLanguageCode.english)
      String languageValue,
      @JsonKey(name: 'disablePrincipals', defaultValue: false)
      @HiveField(106, defaultValue: false)
      bool disablePrincipals,
      @JsonKey(name: 'principalList')
      @_PrincipalListConverter()
      @HiveField(7, defaultValue: [])
      List<SalesOrganisationConfigsPrincipalDto> principalList,
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
      bool enableBillTo,
      @JsonKey(name: 'showPOAttachment', defaultValue: false)
      @HiveField(130, defaultValue: false)
      bool showPOAttachment,
      @JsonKey(name: 'expiryDateDisplay', defaultValue: false)
      @HiveField(131, defaultValue: false)
      bool expiryDateDisplay,
      @JsonKey(name: 'hideStockDisplay', defaultValue: false)
      @HiveField(132, defaultValue: false)
      bool hideStockDisplay,
      @JsonKey(name: 'addOosMaterials', defaultValue: false)
      @HiveField(133, defaultValue: false)
      bool addOosMaterials,
      @JsonKey(name: 'oosValue', defaultValue: 0)
      @HiveField(134, defaultValue: 0)
      int oosValue,
      @JsonKey(name: 'enableRemarks', defaultValue: false)
      @HiveField(135, defaultValue: false)
      bool enableRemarks,
      @JsonKey(name: 'enableOHPrice', defaultValue: true)
      @HiveField(136, defaultValue: true)
      bool enableOHPrice,
      @JsonKey(name: 'ponRequired', defaultValue: false)
      @HiveField(137, defaultValue: false)
      bool poNumberRequired,
      @JsonKey(name: 'enableIRN', defaultValue: false)
      @HiveField(138, defaultValue: false)
      bool enableIRN,
      @JsonKey(name: 'enableTaxDisplay', defaultValue: false)
      @HiveField(139, defaultValue: false)
      bool enableTaxDisplay,
      @JsonKey(name: 'enableTaxAtTotalLevelOnly', defaultValue: false)
      @HiveField(140, defaultValue: false)
      bool enableTaxAtTotalLevelOnly,
      @JsonKey(name: 'netPriceOverride', defaultValue: false)
      @HiveField(141, defaultValue: false)
      bool netPriceOverride,
      @JsonKey(name: 'batchNumDisplay', defaultValue: false)
      @HiveField(142, defaultValue: false)
      bool batchNumDisplay,
      @JsonKey(name: 'displayOrderDiscount', defaultValue: false)
      @HiveField(143, defaultValue: false)
      bool displayOrderDiscount,
      @JsonKey(name: 'minOrderAmount', defaultValue: '0')
      @HiveField(144, defaultValue: '0')
      String minOrderAmount,
      @JsonKey(name: 'salesOrgCode', defaultValue: '0')
      @HiveField(145, defaultValue: '0')
      String salesOrg,
      @JsonKey(name: 'enableZDP8Override', defaultValue: false)
      @HiveField(146, defaultValue: false)
      bool enableZDP8Override,
      @JsonKey(name: 'disableReturnsAccessSR', defaultValue: false)
      @HiveField(147, defaultValue: false)
      bool disableReturnsAccessSR,
      @JsonKey(name: 'disableReturnsAccess', defaultValue: false)
      @HiveField(148, defaultValue: false)
      bool disableReturnsAccess,
      @JsonKey(name: 'enableGreenDelivery', defaultValue: false)
      @HiveField(149, defaultValue: false)
      bool enableGreenDelivery,
      @JsonKey(name: 'greenDeliveryDelayInDays', defaultValue: 2)
      @HiveField(150, defaultValue: 2)
      int greenDeliveryDelayInDays,
      @JsonKey(name: 'enableComboDeals', defaultValue: false)
      @HiveField(151, defaultValue: false)
      bool enableComboDeals,
      @JsonKey(name: 'greenDeliveryUserRole', defaultValue: 0)
      @HiveField(152, defaultValue: 0)
      int greenDeliveryUserRole,
      @JsonKey(name: 'comboDealsUserRole', defaultValue: 0)
      @HiveField(153, defaultValue: 0)
      int comboDealsUserRole,
      @JsonKey(name: 'enableGMN', defaultValue: false)
      @HiveField(154, defaultValue: false)
      bool enableGMN,
      @JsonKey(name: 'displayItemTaxBreakdown', defaultValue: false)
      @HiveField(155, defaultValue: false)
      bool displayItemTaxBreakdown,
      @JsonKey(name: 'displaySubtotalTaxBreakdown', defaultValue: false)
      @HiveField(156, defaultValue: false)
      bool displaySubtotalTaxBreakdown,
      @JsonKey(name: 'disablePayment', defaultValue: false)
      @HiveField(157, defaultValue: false)
      bool disablePayment});
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
    Object? priceOverride = null,
    Object? disablePaymentTermsDisplay = null,
    Object? disableDeliveryDate = null,
    Object? enableBillTo = null,
    Object? showPOAttachment = null,
    Object? expiryDateDisplay = null,
    Object? hideStockDisplay = null,
    Object? addOosMaterials = null,
    Object? oosValue = null,
    Object? enableRemarks = null,
    Object? enableOHPrice = null,
    Object? poNumberRequired = null,
    Object? enableIRN = null,
    Object? enableTaxDisplay = null,
    Object? enableTaxAtTotalLevelOnly = null,
    Object? netPriceOverride = null,
    Object? batchNumDisplay = null,
    Object? displayOrderDiscount = null,
    Object? minOrderAmount = null,
    Object? salesOrg = null,
    Object? enableZDP8Override = null,
    Object? disableReturnsAccessSR = null,
    Object? disableReturnsAccess = null,
    Object? enableGreenDelivery = null,
    Object? greenDeliveryDelayInDays = null,
    Object? enableComboDeals = null,
    Object? greenDeliveryUserRole = null,
    Object? comboDealsUserRole = null,
    Object? enableGMN = null,
    Object? displayItemTaxBreakdown = null,
    Object? displaySubtotalTaxBreakdown = null,
    Object? disablePayment = null,
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
              as List<SalesOrganisationConfigsPrincipalDto>,
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
      priceOverride: null == priceOverride
          ? _value.priceOverride
          : priceOverride // ignore: cast_nullable_to_non_nullable
              as bool,
      disablePaymentTermsDisplay: null == disablePaymentTermsDisplay
          ? _value.disablePaymentTermsDisplay
          : disablePaymentTermsDisplay // ignore: cast_nullable_to_non_nullable
              as bool,
      disableDeliveryDate: null == disableDeliveryDate
          ? _value.disableDeliveryDate
          : disableDeliveryDate // ignore: cast_nullable_to_non_nullable
              as bool,
      enableBillTo: null == enableBillTo
          ? _value.enableBillTo
          : enableBillTo // ignore: cast_nullable_to_non_nullable
              as bool,
      showPOAttachment: null == showPOAttachment
          ? _value.showPOAttachment
          : showPOAttachment // ignore: cast_nullable_to_non_nullable
              as bool,
      expiryDateDisplay: null == expiryDateDisplay
          ? _value.expiryDateDisplay
          : expiryDateDisplay // ignore: cast_nullable_to_non_nullable
              as bool,
      hideStockDisplay: null == hideStockDisplay
          ? _value.hideStockDisplay
          : hideStockDisplay // ignore: cast_nullable_to_non_nullable
              as bool,
      addOosMaterials: null == addOosMaterials
          ? _value.addOosMaterials
          : addOosMaterials // ignore: cast_nullable_to_non_nullable
              as bool,
      oosValue: null == oosValue
          ? _value.oosValue
          : oosValue // ignore: cast_nullable_to_non_nullable
              as int,
      enableRemarks: null == enableRemarks
          ? _value.enableRemarks
          : enableRemarks // ignore: cast_nullable_to_non_nullable
              as bool,
      enableOHPrice: null == enableOHPrice
          ? _value.enableOHPrice
          : enableOHPrice // ignore: cast_nullable_to_non_nullable
              as bool,
      poNumberRequired: null == poNumberRequired
          ? _value.poNumberRequired
          : poNumberRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      enableIRN: null == enableIRN
          ? _value.enableIRN
          : enableIRN // ignore: cast_nullable_to_non_nullable
              as bool,
      enableTaxDisplay: null == enableTaxDisplay
          ? _value.enableTaxDisplay
          : enableTaxDisplay // ignore: cast_nullable_to_non_nullable
              as bool,
      enableTaxAtTotalLevelOnly: null == enableTaxAtTotalLevelOnly
          ? _value.enableTaxAtTotalLevelOnly
          : enableTaxAtTotalLevelOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      netPriceOverride: null == netPriceOverride
          ? _value.netPriceOverride
          : netPriceOverride // ignore: cast_nullable_to_non_nullable
              as bool,
      batchNumDisplay: null == batchNumDisplay
          ? _value.batchNumDisplay
          : batchNumDisplay // ignore: cast_nullable_to_non_nullable
              as bool,
      displayOrderDiscount: null == displayOrderDiscount
          ? _value.displayOrderDiscount
          : displayOrderDiscount // ignore: cast_nullable_to_non_nullable
              as bool,
      minOrderAmount: null == minOrderAmount
          ? _value.minOrderAmount
          : minOrderAmount // ignore: cast_nullable_to_non_nullable
              as String,
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as String,
      enableZDP8Override: null == enableZDP8Override
          ? _value.enableZDP8Override
          : enableZDP8Override // ignore: cast_nullable_to_non_nullable
              as bool,
      disableReturnsAccessSR: null == disableReturnsAccessSR
          ? _value.disableReturnsAccessSR
          : disableReturnsAccessSR // ignore: cast_nullable_to_non_nullable
              as bool,
      disableReturnsAccess: null == disableReturnsAccess
          ? _value.disableReturnsAccess
          : disableReturnsAccess // ignore: cast_nullable_to_non_nullable
              as bool,
      enableGreenDelivery: null == enableGreenDelivery
          ? _value.enableGreenDelivery
          : enableGreenDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      greenDeliveryDelayInDays: null == greenDeliveryDelayInDays
          ? _value.greenDeliveryDelayInDays
          : greenDeliveryDelayInDays // ignore: cast_nullable_to_non_nullable
              as int,
      enableComboDeals: null == enableComboDeals
          ? _value.enableComboDeals
          : enableComboDeals // ignore: cast_nullable_to_non_nullable
              as bool,
      greenDeliveryUserRole: null == greenDeliveryUserRole
          ? _value.greenDeliveryUserRole
          : greenDeliveryUserRole // ignore: cast_nullable_to_non_nullable
              as int,
      comboDealsUserRole: null == comboDealsUserRole
          ? _value.comboDealsUserRole
          : comboDealsUserRole // ignore: cast_nullable_to_non_nullable
              as int,
      enableGMN: null == enableGMN
          ? _value.enableGMN
          : enableGMN // ignore: cast_nullable_to_non_nullable
              as bool,
      displayItemTaxBreakdown: null == displayItemTaxBreakdown
          ? _value.displayItemTaxBreakdown
          : displayItemTaxBreakdown // ignore: cast_nullable_to_non_nullable
              as bool,
      displaySubtotalTaxBreakdown: null == displaySubtotalTaxBreakdown
          ? _value.displaySubtotalTaxBreakdown
          : displaySubtotalTaxBreakdown // ignore: cast_nullable_to_non_nullable
              as bool,
      disablePayment: null == disablePayment
          ? _value.disablePayment
          : disablePayment // ignore: cast_nullable_to_non_nullable
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
      @JsonKey(name: 'languageValue', readValue: handleEmptyLanguageValue)
      @HiveField(105, defaultValue: ApiLanguageCode.english)
      String languageValue,
      @JsonKey(name: 'disablePrincipals', defaultValue: false)
      @HiveField(106, defaultValue: false)
      bool disablePrincipals,
      @JsonKey(name: 'principalList')
      @_PrincipalListConverter()
      @HiveField(7, defaultValue: [])
      List<SalesOrganisationConfigsPrincipalDto> principalList,
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
      bool enableBillTo,
      @JsonKey(name: 'showPOAttachment', defaultValue: false)
      @HiveField(130, defaultValue: false)
      bool showPOAttachment,
      @JsonKey(name: 'expiryDateDisplay', defaultValue: false)
      @HiveField(131, defaultValue: false)
      bool expiryDateDisplay,
      @JsonKey(name: 'hideStockDisplay', defaultValue: false)
      @HiveField(132, defaultValue: false)
      bool hideStockDisplay,
      @JsonKey(name: 'addOosMaterials', defaultValue: false)
      @HiveField(133, defaultValue: false)
      bool addOosMaterials,
      @JsonKey(name: 'oosValue', defaultValue: 0)
      @HiveField(134, defaultValue: 0)
      int oosValue,
      @JsonKey(name: 'enableRemarks', defaultValue: false)
      @HiveField(135, defaultValue: false)
      bool enableRemarks,
      @JsonKey(name: 'enableOHPrice', defaultValue: true)
      @HiveField(136, defaultValue: true)
      bool enableOHPrice,
      @JsonKey(name: 'ponRequired', defaultValue: false)
      @HiveField(137, defaultValue: false)
      bool poNumberRequired,
      @JsonKey(name: 'enableIRN', defaultValue: false)
      @HiveField(138, defaultValue: false)
      bool enableIRN,
      @JsonKey(name: 'enableTaxDisplay', defaultValue: false)
      @HiveField(139, defaultValue: false)
      bool enableTaxDisplay,
      @JsonKey(name: 'enableTaxAtTotalLevelOnly', defaultValue: false)
      @HiveField(140, defaultValue: false)
      bool enableTaxAtTotalLevelOnly,
      @JsonKey(name: 'netPriceOverride', defaultValue: false)
      @HiveField(141, defaultValue: false)
      bool netPriceOverride,
      @JsonKey(name: 'batchNumDisplay', defaultValue: false)
      @HiveField(142, defaultValue: false)
      bool batchNumDisplay,
      @JsonKey(name: 'displayOrderDiscount', defaultValue: false)
      @HiveField(143, defaultValue: false)
      bool displayOrderDiscount,
      @JsonKey(name: 'minOrderAmount', defaultValue: '0')
      @HiveField(144, defaultValue: '0')
      String minOrderAmount,
      @JsonKey(name: 'salesOrgCode', defaultValue: '0')
      @HiveField(145, defaultValue: '0')
      String salesOrg,
      @JsonKey(name: 'enableZDP8Override', defaultValue: false)
      @HiveField(146, defaultValue: false)
      bool enableZDP8Override,
      @JsonKey(name: 'disableReturnsAccessSR', defaultValue: false)
      @HiveField(147, defaultValue: false)
      bool disableReturnsAccessSR,
      @JsonKey(name: 'disableReturnsAccess', defaultValue: false)
      @HiveField(148, defaultValue: false)
      bool disableReturnsAccess,
      @JsonKey(name: 'enableGreenDelivery', defaultValue: false)
      @HiveField(149, defaultValue: false)
      bool enableGreenDelivery,
      @JsonKey(name: 'greenDeliveryDelayInDays', defaultValue: 2)
      @HiveField(150, defaultValue: 2)
      int greenDeliveryDelayInDays,
      @JsonKey(name: 'enableComboDeals', defaultValue: false)
      @HiveField(151, defaultValue: false)
      bool enableComboDeals,
      @JsonKey(name: 'greenDeliveryUserRole', defaultValue: 0)
      @HiveField(152, defaultValue: 0)
      int greenDeliveryUserRole,
      @JsonKey(name: 'comboDealsUserRole', defaultValue: 0)
      @HiveField(153, defaultValue: 0)
      int comboDealsUserRole,
      @JsonKey(name: 'enableGMN', defaultValue: false)
      @HiveField(154, defaultValue: false)
      bool enableGMN,
      @JsonKey(name: 'displayItemTaxBreakdown', defaultValue: false)
      @HiveField(155, defaultValue: false)
      bool displayItemTaxBreakdown,
      @JsonKey(name: 'displaySubtotalTaxBreakdown', defaultValue: false)
      @HiveField(156, defaultValue: false)
      bool displaySubtotalTaxBreakdown,
      @JsonKey(name: 'disablePayment', defaultValue: false)
      @HiveField(157, defaultValue: false)
      bool disablePayment});
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
    Object? priceOverride = null,
    Object? disablePaymentTermsDisplay = null,
    Object? disableDeliveryDate = null,
    Object? enableBillTo = null,
    Object? showPOAttachment = null,
    Object? expiryDateDisplay = null,
    Object? hideStockDisplay = null,
    Object? addOosMaterials = null,
    Object? oosValue = null,
    Object? enableRemarks = null,
    Object? enableOHPrice = null,
    Object? poNumberRequired = null,
    Object? enableIRN = null,
    Object? enableTaxDisplay = null,
    Object? enableTaxAtTotalLevelOnly = null,
    Object? netPriceOverride = null,
    Object? batchNumDisplay = null,
    Object? displayOrderDiscount = null,
    Object? minOrderAmount = null,
    Object? salesOrg = null,
    Object? enableZDP8Override = null,
    Object? disableReturnsAccessSR = null,
    Object? disableReturnsAccess = null,
    Object? enableGreenDelivery = null,
    Object? greenDeliveryDelayInDays = null,
    Object? enableComboDeals = null,
    Object? greenDeliveryUserRole = null,
    Object? comboDealsUserRole = null,
    Object? enableGMN = null,
    Object? displayItemTaxBreakdown = null,
    Object? displaySubtotalTaxBreakdown = null,
    Object? disablePayment = null,
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
              as List<SalesOrganisationConfigsPrincipalDto>,
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
      priceOverride: null == priceOverride
          ? _value.priceOverride
          : priceOverride // ignore: cast_nullable_to_non_nullable
              as bool,
      disablePaymentTermsDisplay: null == disablePaymentTermsDisplay
          ? _value.disablePaymentTermsDisplay
          : disablePaymentTermsDisplay // ignore: cast_nullable_to_non_nullable
              as bool,
      disableDeliveryDate: null == disableDeliveryDate
          ? _value.disableDeliveryDate
          : disableDeliveryDate // ignore: cast_nullable_to_non_nullable
              as bool,
      enableBillTo: null == enableBillTo
          ? _value.enableBillTo
          : enableBillTo // ignore: cast_nullable_to_non_nullable
              as bool,
      showPOAttachment: null == showPOAttachment
          ? _value.showPOAttachment
          : showPOAttachment // ignore: cast_nullable_to_non_nullable
              as bool,
      expiryDateDisplay: null == expiryDateDisplay
          ? _value.expiryDateDisplay
          : expiryDateDisplay // ignore: cast_nullable_to_non_nullable
              as bool,
      hideStockDisplay: null == hideStockDisplay
          ? _value.hideStockDisplay
          : hideStockDisplay // ignore: cast_nullable_to_non_nullable
              as bool,
      addOosMaterials: null == addOosMaterials
          ? _value.addOosMaterials
          : addOosMaterials // ignore: cast_nullable_to_non_nullable
              as bool,
      oosValue: null == oosValue
          ? _value.oosValue
          : oosValue // ignore: cast_nullable_to_non_nullable
              as int,
      enableRemarks: null == enableRemarks
          ? _value.enableRemarks
          : enableRemarks // ignore: cast_nullable_to_non_nullable
              as bool,
      enableOHPrice: null == enableOHPrice
          ? _value.enableOHPrice
          : enableOHPrice // ignore: cast_nullable_to_non_nullable
              as bool,
      poNumberRequired: null == poNumberRequired
          ? _value.poNumberRequired
          : poNumberRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      enableIRN: null == enableIRN
          ? _value.enableIRN
          : enableIRN // ignore: cast_nullable_to_non_nullable
              as bool,
      enableTaxDisplay: null == enableTaxDisplay
          ? _value.enableTaxDisplay
          : enableTaxDisplay // ignore: cast_nullable_to_non_nullable
              as bool,
      enableTaxAtTotalLevelOnly: null == enableTaxAtTotalLevelOnly
          ? _value.enableTaxAtTotalLevelOnly
          : enableTaxAtTotalLevelOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      netPriceOverride: null == netPriceOverride
          ? _value.netPriceOverride
          : netPriceOverride // ignore: cast_nullable_to_non_nullable
              as bool,
      batchNumDisplay: null == batchNumDisplay
          ? _value.batchNumDisplay
          : batchNumDisplay // ignore: cast_nullable_to_non_nullable
              as bool,
      displayOrderDiscount: null == displayOrderDiscount
          ? _value.displayOrderDiscount
          : displayOrderDiscount // ignore: cast_nullable_to_non_nullable
              as bool,
      minOrderAmount: null == minOrderAmount
          ? _value.minOrderAmount
          : minOrderAmount // ignore: cast_nullable_to_non_nullable
              as String,
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as String,
      enableZDP8Override: null == enableZDP8Override
          ? _value.enableZDP8Override
          : enableZDP8Override // ignore: cast_nullable_to_non_nullable
              as bool,
      disableReturnsAccessSR: null == disableReturnsAccessSR
          ? _value.disableReturnsAccessSR
          : disableReturnsAccessSR // ignore: cast_nullable_to_non_nullable
              as bool,
      disableReturnsAccess: null == disableReturnsAccess
          ? _value.disableReturnsAccess
          : disableReturnsAccess // ignore: cast_nullable_to_non_nullable
              as bool,
      enableGreenDelivery: null == enableGreenDelivery
          ? _value.enableGreenDelivery
          : enableGreenDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      greenDeliveryDelayInDays: null == greenDeliveryDelayInDays
          ? _value.greenDeliveryDelayInDays
          : greenDeliveryDelayInDays // ignore: cast_nullable_to_non_nullable
              as int,
      enableComboDeals: null == enableComboDeals
          ? _value.enableComboDeals
          : enableComboDeals // ignore: cast_nullable_to_non_nullable
              as bool,
      greenDeliveryUserRole: null == greenDeliveryUserRole
          ? _value.greenDeliveryUserRole
          : greenDeliveryUserRole // ignore: cast_nullable_to_non_nullable
              as int,
      comboDealsUserRole: null == comboDealsUserRole
          ? _value.comboDealsUserRole
          : comboDealsUserRole // ignore: cast_nullable_to_non_nullable
              as int,
      enableGMN: null == enableGMN
          ? _value.enableGMN
          : enableGMN // ignore: cast_nullable_to_non_nullable
              as bool,
      displayItemTaxBreakdown: null == displayItemTaxBreakdown
          ? _value.displayItemTaxBreakdown
          : displayItemTaxBreakdown // ignore: cast_nullable_to_non_nullable
              as bool,
      displaySubtotalTaxBreakdown: null == displaySubtotalTaxBreakdown
          ? _value.displaySubtotalTaxBreakdown
          : displaySubtotalTaxBreakdown // ignore: cast_nullable_to_non_nullable
              as bool,
      disablePayment: null == disablePayment
          ? _value.disablePayment
          : disablePayment // ignore: cast_nullable_to_non_nullable
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
      @JsonKey(name: 'languageValue', readValue: handleEmptyLanguageValue)
      @HiveField(105, defaultValue: ApiLanguageCode.english)
      required this.languageValue,
      @JsonKey(name: 'disablePrincipals', defaultValue: false)
      @HiveField(106, defaultValue: false)
      required this.disablePrincipals,
      @JsonKey(name: 'principalList')
      @_PrincipalListConverter()
      @HiveField(7, defaultValue: [])
      required final List<SalesOrganisationConfigsPrincipalDto> principalList,
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
      required this.enableBillTo,
      @JsonKey(name: 'showPOAttachment', defaultValue: false)
      @HiveField(130, defaultValue: false)
      required this.showPOAttachment,
      @JsonKey(name: 'expiryDateDisplay', defaultValue: false)
      @HiveField(131, defaultValue: false)
      required this.expiryDateDisplay,
      @JsonKey(name: 'hideStockDisplay', defaultValue: false)
      @HiveField(132, defaultValue: false)
      required this.hideStockDisplay,
      @JsonKey(name: 'addOosMaterials', defaultValue: false)
      @HiveField(133, defaultValue: false)
      required this.addOosMaterials,
      @JsonKey(name: 'oosValue', defaultValue: 0)
      @HiveField(134, defaultValue: 0)
      required this.oosValue,
      @JsonKey(name: 'enableRemarks', defaultValue: false)
      @HiveField(135, defaultValue: false)
      required this.enableRemarks,
      @JsonKey(name: 'enableOHPrice', defaultValue: true)
      @HiveField(136, defaultValue: true)
      required this.enableOHPrice,
      @JsonKey(name: 'ponRequired', defaultValue: false)
      @HiveField(137, defaultValue: false)
      required this.poNumberRequired,
      @JsonKey(name: 'enableIRN', defaultValue: false)
      @HiveField(138, defaultValue: false)
      required this.enableIRN,
      @JsonKey(name: 'enableTaxDisplay', defaultValue: false)
      @HiveField(139, defaultValue: false)
      required this.enableTaxDisplay,
      @JsonKey(name: 'enableTaxAtTotalLevelOnly', defaultValue: false)
      @HiveField(140, defaultValue: false)
      required this.enableTaxAtTotalLevelOnly,
      @JsonKey(name: 'netPriceOverride', defaultValue: false)
      @HiveField(141, defaultValue: false)
      required this.netPriceOverride,
      @JsonKey(name: 'batchNumDisplay', defaultValue: false)
      @HiveField(142, defaultValue: false)
      required this.batchNumDisplay,
      @JsonKey(name: 'displayOrderDiscount', defaultValue: false)
      @HiveField(143, defaultValue: false)
      required this.displayOrderDiscount,
      @JsonKey(name: 'minOrderAmount', defaultValue: '0')
      @HiveField(144, defaultValue: '0')
      required this.minOrderAmount,
      @JsonKey(name: 'salesOrgCode', defaultValue: '0')
      @HiveField(145, defaultValue: '0')
      required this.salesOrg,
      @JsonKey(name: 'enableZDP8Override', defaultValue: false)
      @HiveField(146, defaultValue: false)
      required this.enableZDP8Override,
      @JsonKey(name: 'disableReturnsAccessSR', defaultValue: false)
      @HiveField(147, defaultValue: false)
      required this.disableReturnsAccessSR,
      @JsonKey(name: 'disableReturnsAccess', defaultValue: false)
      @HiveField(148, defaultValue: false)
      required this.disableReturnsAccess,
      @JsonKey(name: 'enableGreenDelivery', defaultValue: false)
      @HiveField(149, defaultValue: false)
      required this.enableGreenDelivery,
      @JsonKey(name: 'greenDeliveryDelayInDays', defaultValue: 2)
      @HiveField(150, defaultValue: 2)
      required this.greenDeliveryDelayInDays,
      @JsonKey(name: 'enableComboDeals', defaultValue: false)
      @HiveField(151, defaultValue: false)
      required this.enableComboDeals,
      @JsonKey(name: 'greenDeliveryUserRole', defaultValue: 0)
      @HiveField(152, defaultValue: 0)
      required this.greenDeliveryUserRole,
      @JsonKey(name: 'comboDealsUserRole', defaultValue: 0)
      @HiveField(153, defaultValue: 0)
      required this.comboDealsUserRole,
      @JsonKey(name: 'enableGMN', defaultValue: false)
      @HiveField(154, defaultValue: false)
      required this.enableGMN,
      @JsonKey(name: 'displayItemTaxBreakdown', defaultValue: false)
      @HiveField(155, defaultValue: false)
      required this.displayItemTaxBreakdown,
      @JsonKey(name: 'displaySubtotalTaxBreakdown', defaultValue: false)
      @HiveField(156, defaultValue: false)
      required this.displaySubtotalTaxBreakdown,
      @JsonKey(name: 'disablePayment', defaultValue: false)
      @HiveField(157, defaultValue: false)
      required this.disablePayment})
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
  @JsonKey(name: 'languageValue', readValue: handleEmptyLanguageValue)
  @HiveField(105, defaultValue: ApiLanguageCode.english)
  final String languageValue;
  @override
  @JsonKey(name: 'disablePrincipals', defaultValue: false)
  @HiveField(106, defaultValue: false)
  final bool disablePrincipals;
  final List<SalesOrganisationConfigsPrincipalDto> _principalList;
  @override
  @JsonKey(name: 'principalList')
  @_PrincipalListConverter()
  @HiveField(7, defaultValue: [])
  List<SalesOrganisationConfigsPrincipalDto> get principalList {
    if (_principalList is EqualUnmodifiableListView) return _principalList;
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
  @JsonKey(name: 'showPOAttachment', defaultValue: false)
  @HiveField(130, defaultValue: false)
  final bool showPOAttachment;
  @override
  @JsonKey(name: 'expiryDateDisplay', defaultValue: false)
  @HiveField(131, defaultValue: false)
  final bool expiryDateDisplay;
  @override
  @JsonKey(name: 'hideStockDisplay', defaultValue: false)
  @HiveField(132, defaultValue: false)
  final bool hideStockDisplay;
  @override
  @JsonKey(name: 'addOosMaterials', defaultValue: false)
  @HiveField(133, defaultValue: false)
  final bool addOosMaterials;
  @override
  @JsonKey(name: 'oosValue', defaultValue: 0)
  @HiveField(134, defaultValue: 0)
  final int oosValue;
  @override
  @JsonKey(name: 'enableRemarks', defaultValue: false)
  @HiveField(135, defaultValue: false)
  final bool enableRemarks;
  @override
  @JsonKey(name: 'enableOHPrice', defaultValue: true)
  @HiveField(136, defaultValue: true)
  final bool enableOHPrice;
  @override
  @JsonKey(name: 'ponRequired', defaultValue: false)
  @HiveField(137, defaultValue: false)
  final bool poNumberRequired;
  @override
  @JsonKey(name: 'enableIRN', defaultValue: false)
  @HiveField(138, defaultValue: false)
  final bool enableIRN;
  @override
  @JsonKey(name: 'enableTaxDisplay', defaultValue: false)
  @HiveField(139, defaultValue: false)
  final bool enableTaxDisplay;
  @override
  @JsonKey(name: 'enableTaxAtTotalLevelOnly', defaultValue: false)
  @HiveField(140, defaultValue: false)
  final bool enableTaxAtTotalLevelOnly;
  @override
  @JsonKey(name: 'netPriceOverride', defaultValue: false)
  @HiveField(141, defaultValue: false)
  final bool netPriceOverride;
  @override
  @JsonKey(name: 'batchNumDisplay', defaultValue: false)
  @HiveField(142, defaultValue: false)
  final bool batchNumDisplay;
  @override
  @JsonKey(name: 'displayOrderDiscount', defaultValue: false)
  @HiveField(143, defaultValue: false)
  final bool displayOrderDiscount;
  @override
  @JsonKey(name: 'minOrderAmount', defaultValue: '0')
  @HiveField(144, defaultValue: '0')
  final String minOrderAmount;
  @override
  @JsonKey(name: 'salesOrgCode', defaultValue: '0')
  @HiveField(145, defaultValue: '0')
  final String salesOrg;
  @override
  @JsonKey(name: 'enableZDP8Override', defaultValue: false)
  @HiveField(146, defaultValue: false)
  final bool enableZDP8Override;
  @override
  @JsonKey(name: 'disableReturnsAccessSR', defaultValue: false)
  @HiveField(147, defaultValue: false)
  final bool disableReturnsAccessSR;
  @override
  @JsonKey(name: 'disableReturnsAccess', defaultValue: false)
  @HiveField(148, defaultValue: false)
  final bool disableReturnsAccess;
  @override
  @JsonKey(name: 'enableGreenDelivery', defaultValue: false)
  @HiveField(149, defaultValue: false)
  final bool enableGreenDelivery;
  @override
  @JsonKey(name: 'greenDeliveryDelayInDays', defaultValue: 2)
  @HiveField(150, defaultValue: 2)
  final int greenDeliveryDelayInDays;
  @override
  @JsonKey(name: 'enableComboDeals', defaultValue: false)
  @HiveField(151, defaultValue: false)
  final bool enableComboDeals;
  @override
  @JsonKey(name: 'greenDeliveryUserRole', defaultValue: 0)
  @HiveField(152, defaultValue: 0)
  final int greenDeliveryUserRole;
  @override
  @JsonKey(name: 'comboDealsUserRole', defaultValue: 0)
  @HiveField(153, defaultValue: 0)
  final int comboDealsUserRole;
  @override
  @JsonKey(name: 'enableGMN', defaultValue: false)
  @HiveField(154, defaultValue: false)
  final bool enableGMN;
  @override
  @JsonKey(name: 'displayItemTaxBreakdown', defaultValue: false)
  @HiveField(155, defaultValue: false)
  final bool displayItemTaxBreakdown;
  @override
  @JsonKey(name: 'displaySubtotalTaxBreakdown', defaultValue: false)
  @HiveField(156, defaultValue: false)
  final bool displaySubtotalTaxBreakdown;
  @override
  @JsonKey(name: 'disablePayment', defaultValue: false)
  @HiveField(157, defaultValue: false)
  final bool disablePayment;

  @override
  String toString() {
    return 'SalesOrganisationConfigsDto(disableProcessingStatus: $disableProcessingStatus, currency: $currency, hideCustomer: $hideCustomer, enableGimmickMaterial: $enableGimmickMaterial, languageFilter: $languageFilter, languageValue: $languageValue, disablePrincipals: $disablePrincipals, principalList: $principalList, disableOrderType: $disableOrderType, enableBatchNumber: $enableBatchNumber, disableBundles: $disableBundles, enableZDP5: $enableZDP5, enableTaxClassification: $enableTaxClassification, enableVat: $enableVat, vatValue: $vatValue, materialWithoutPrice: $materialWithoutPrice, enableSpecialInstructions: $enableSpecialInstructions, enableReferenceNote: $enableReferenceNote, enableCollectiveNumber: $enableCollectiveNumber, enableMobileNumber: $enableMobileNumber, enableFutureDeliveryDay: $enableFutureDeliveryDay, enablePaymentTerms: $enablePaymentTerms, futureDeliveryDay: $futureDeliveryDay, enableGMC: $enableGMC, enableListPrice: $enableListPrice, enableDefaultMD: $enableDefaultMD, priceOverride: $priceOverride, disablePaymentTermsDisplay: $disablePaymentTermsDisplay, disableDeliveryDate: $disableDeliveryDate, enableBillTo: $enableBillTo, showPOAttachment: $showPOAttachment, expiryDateDisplay: $expiryDateDisplay, hideStockDisplay: $hideStockDisplay, addOosMaterials: $addOosMaterials, oosValue: $oosValue, enableRemarks: $enableRemarks, enableOHPrice: $enableOHPrice, poNumberRequired: $poNumberRequired, enableIRN: $enableIRN, enableTaxDisplay: $enableTaxDisplay, enableTaxAtTotalLevelOnly: $enableTaxAtTotalLevelOnly, netPriceOverride: $netPriceOverride, batchNumDisplay: $batchNumDisplay, displayOrderDiscount: $displayOrderDiscount, minOrderAmount: $minOrderAmount, salesOrg: $salesOrg, enableZDP8Override: $enableZDP8Override, disableReturnsAccessSR: $disableReturnsAccessSR, disableReturnsAccess: $disableReturnsAccess, enableGreenDelivery: $enableGreenDelivery, greenDeliveryDelayInDays: $greenDeliveryDelayInDays, enableComboDeals: $enableComboDeals, greenDeliveryUserRole: $greenDeliveryUserRole, comboDealsUserRole: $comboDealsUserRole, enableGMN: $enableGMN, displayItemTaxBreakdown: $displayItemTaxBreakdown, displaySubtotalTaxBreakdown: $displaySubtotalTaxBreakdown, disablePayment: $disablePayment)';
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
            (identical(other.enableSpecialInstructions, enableSpecialInstructions) ||
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
                other.enableDefaultMD == enableDefaultMD) &&
            (identical(other.priceOverride, priceOverride) ||
                other.priceOverride == priceOverride) &&
            (identical(other.disablePaymentTermsDisplay, disablePaymentTermsDisplay) ||
                other.disablePaymentTermsDisplay ==
                    disablePaymentTermsDisplay) &&
            (identical(other.disableDeliveryDate, disableDeliveryDate) || other.disableDeliveryDate == disableDeliveryDate) &&
            (identical(other.enableBillTo, enableBillTo) || other.enableBillTo == enableBillTo) &&
            (identical(other.showPOAttachment, showPOAttachment) || other.showPOAttachment == showPOAttachment) &&
            (identical(other.expiryDateDisplay, expiryDateDisplay) || other.expiryDateDisplay == expiryDateDisplay) &&
            (identical(other.hideStockDisplay, hideStockDisplay) || other.hideStockDisplay == hideStockDisplay) &&
            (identical(other.addOosMaterials, addOosMaterials) || other.addOosMaterials == addOosMaterials) &&
            (identical(other.oosValue, oosValue) || other.oosValue == oosValue) &&
            (identical(other.enableRemarks, enableRemarks) || other.enableRemarks == enableRemarks) &&
            (identical(other.enableOHPrice, enableOHPrice) || other.enableOHPrice == enableOHPrice) &&
            (identical(other.poNumberRequired, poNumberRequired) || other.poNumberRequired == poNumberRequired) &&
            (identical(other.enableIRN, enableIRN) || other.enableIRN == enableIRN) &&
            (identical(other.enableTaxDisplay, enableTaxDisplay) || other.enableTaxDisplay == enableTaxDisplay) &&
            (identical(other.enableTaxAtTotalLevelOnly, enableTaxAtTotalLevelOnly) || other.enableTaxAtTotalLevelOnly == enableTaxAtTotalLevelOnly) &&
            (identical(other.netPriceOverride, netPriceOverride) || other.netPriceOverride == netPriceOverride) &&
            (identical(other.batchNumDisplay, batchNumDisplay) || other.batchNumDisplay == batchNumDisplay) &&
            (identical(other.displayOrderDiscount, displayOrderDiscount) || other.displayOrderDiscount == displayOrderDiscount) &&
            (identical(other.minOrderAmount, minOrderAmount) || other.minOrderAmount == minOrderAmount) &&
            (identical(other.salesOrg, salesOrg) || other.salesOrg == salesOrg) &&
            (identical(other.enableZDP8Override, enableZDP8Override) || other.enableZDP8Override == enableZDP8Override) &&
            (identical(other.disableReturnsAccessSR, disableReturnsAccessSR) || other.disableReturnsAccessSR == disableReturnsAccessSR) &&
            (identical(other.disableReturnsAccess, disableReturnsAccess) || other.disableReturnsAccess == disableReturnsAccess) &&
            (identical(other.enableGreenDelivery, enableGreenDelivery) || other.enableGreenDelivery == enableGreenDelivery) &&
            (identical(other.greenDeliveryDelayInDays, greenDeliveryDelayInDays) || other.greenDeliveryDelayInDays == greenDeliveryDelayInDays) &&
            (identical(other.enableComboDeals, enableComboDeals) || other.enableComboDeals == enableComboDeals) &&
            (identical(other.greenDeliveryUserRole, greenDeliveryUserRole) || other.greenDeliveryUserRole == greenDeliveryUserRole) &&
            (identical(other.comboDealsUserRole, comboDealsUserRole) || other.comboDealsUserRole == comboDealsUserRole) &&
            (identical(other.enableGMN, enableGMN) || other.enableGMN == enableGMN) &&
            (identical(other.displayItemTaxBreakdown, displayItemTaxBreakdown) || other.displayItemTaxBreakdown == displayItemTaxBreakdown) &&
            (identical(other.displaySubtotalTaxBreakdown, displaySubtotalTaxBreakdown) || other.displaySubtotalTaxBreakdown == displaySubtotalTaxBreakdown) &&
            (identical(other.disablePayment, disablePayment) || other.disablePayment == disablePayment));
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
        enableDefaultMD,
        priceOverride,
        disablePaymentTermsDisplay,
        disableDeliveryDate,
        enableBillTo,
        showPOAttachment,
        expiryDateDisplay,
        hideStockDisplay,
        addOosMaterials,
        oosValue,
        enableRemarks,
        enableOHPrice,
        poNumberRequired,
        enableIRN,
        enableTaxDisplay,
        enableTaxAtTotalLevelOnly,
        netPriceOverride,
        batchNumDisplay,
        displayOrderDiscount,
        minOrderAmount,
        salesOrg,
        enableZDP8Override,
        disableReturnsAccessSR,
        disableReturnsAccess,
        enableGreenDelivery,
        greenDeliveryDelayInDays,
        enableComboDeals,
        greenDeliveryUserRole,
        comboDealsUserRole,
        enableGMN,
        displayItemTaxBreakdown,
        displaySubtotalTaxBreakdown,
        disablePayment
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
      @JsonKey(name: 'languageValue', readValue: handleEmptyLanguageValue)
      @HiveField(105, defaultValue: ApiLanguageCode.english)
      required final String languageValue,
      @JsonKey(name: 'disablePrincipals', defaultValue: false)
      @HiveField(106, defaultValue: false)
      required final bool disablePrincipals,
      @JsonKey(name: 'principalList')
      @_PrincipalListConverter()
      @HiveField(7, defaultValue: [])
      required final List<SalesOrganisationConfigsPrincipalDto> principalList,
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
      required final bool enableBillTo,
      @JsonKey(name: 'showPOAttachment', defaultValue: false)
      @HiveField(130, defaultValue: false)
      required final bool showPOAttachment,
      @JsonKey(name: 'expiryDateDisplay', defaultValue: false)
      @HiveField(131, defaultValue: false)
      required final bool expiryDateDisplay,
      @JsonKey(name: 'hideStockDisplay', defaultValue: false)
      @HiveField(132, defaultValue: false)
      required final bool hideStockDisplay,
      @JsonKey(name: 'addOosMaterials', defaultValue: false)
      @HiveField(133, defaultValue: false)
      required final bool addOosMaterials,
      @JsonKey(name: 'oosValue', defaultValue: 0)
      @HiveField(134, defaultValue: 0)
      required final int oosValue,
      @JsonKey(name: 'enableRemarks', defaultValue: false)
      @HiveField(135, defaultValue: false)
      required final bool enableRemarks,
      @JsonKey(name: 'enableOHPrice', defaultValue: true)
      @HiveField(136, defaultValue: true)
      required final bool enableOHPrice,
      @JsonKey(name: 'ponRequired', defaultValue: false)
      @HiveField(137, defaultValue: false)
      required final bool poNumberRequired,
      @JsonKey(name: 'enableIRN', defaultValue: false)
      @HiveField(138, defaultValue: false)
      required final bool enableIRN,
      @JsonKey(name: 'enableTaxDisplay', defaultValue: false)
      @HiveField(139, defaultValue: false)
      required final bool enableTaxDisplay,
      @JsonKey(name: 'enableTaxAtTotalLevelOnly', defaultValue: false)
      @HiveField(140, defaultValue: false)
      required final bool enableTaxAtTotalLevelOnly,
      @JsonKey(name: 'netPriceOverride', defaultValue: false)
      @HiveField(141, defaultValue: false)
      required final bool netPriceOverride,
      @JsonKey(name: 'batchNumDisplay', defaultValue: false)
      @HiveField(142, defaultValue: false)
      required final bool batchNumDisplay,
      @JsonKey(name: 'displayOrderDiscount', defaultValue: false)
      @HiveField(143, defaultValue: false)
      required final bool displayOrderDiscount,
      @JsonKey(name: 'minOrderAmount', defaultValue: '0')
      @HiveField(144, defaultValue: '0')
      required final String minOrderAmount,
      @JsonKey(name: 'salesOrgCode', defaultValue: '0')
      @HiveField(145, defaultValue: '0')
      required final String salesOrg,
      @JsonKey(name: 'enableZDP8Override', defaultValue: false)
      @HiveField(146, defaultValue: false)
      required final bool enableZDP8Override,
      @JsonKey(name: 'disableReturnsAccessSR', defaultValue: false)
      @HiveField(147, defaultValue: false)
      required final bool disableReturnsAccessSR,
      @JsonKey(name: 'disableReturnsAccess', defaultValue: false)
      @HiveField(148, defaultValue: false)
      required final bool disableReturnsAccess,
      @JsonKey(name: 'enableGreenDelivery', defaultValue: false)
      @HiveField(149, defaultValue: false)
      required final bool enableGreenDelivery,
      @JsonKey(name: 'greenDeliveryDelayInDays', defaultValue: 2)
      @HiveField(150, defaultValue: 2)
      required final int greenDeliveryDelayInDays,
      @JsonKey(name: 'enableComboDeals', defaultValue: false)
      @HiveField(151, defaultValue: false)
      required final bool enableComboDeals,
      @JsonKey(name: 'greenDeliveryUserRole', defaultValue: 0)
      @HiveField(152, defaultValue: 0)
      required final int greenDeliveryUserRole,
      @JsonKey(name: 'comboDealsUserRole', defaultValue: 0)
      @HiveField(153, defaultValue: 0)
      required final int comboDealsUserRole,
      @JsonKey(name: 'enableGMN', defaultValue: false)
      @HiveField(154, defaultValue: false)
      required final bool enableGMN,
      @JsonKey(name: 'displayItemTaxBreakdown', defaultValue: false)
      @HiveField(155, defaultValue: false)
      required final bool displayItemTaxBreakdown,
      @JsonKey(name: 'displaySubtotalTaxBreakdown', defaultValue: false)
      @HiveField(156, defaultValue: false)
      required final bool displaySubtotalTaxBreakdown,
      @JsonKey(name: 'disablePayment', defaultValue: false)
      @HiveField(157, defaultValue: false)
      required final bool disablePayment}) = _$_SalesOrganisationConfigsDto;
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
  @JsonKey(name: 'languageValue', readValue: handleEmptyLanguageValue)
  @HiveField(105, defaultValue: ApiLanguageCode.english)
  String get languageValue;
  @override
  @JsonKey(name: 'disablePrincipals', defaultValue: false)
  @HiveField(106, defaultValue: false)
  bool get disablePrincipals;
  @override
  @JsonKey(name: 'principalList')
  @_PrincipalListConverter()
  @HiveField(7, defaultValue: [])
  List<SalesOrganisationConfigsPrincipalDto> get principalList;
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
  @JsonKey(name: 'showPOAttachment', defaultValue: false)
  @HiveField(130, defaultValue: false)
  bool get showPOAttachment;
  @override
  @JsonKey(name: 'expiryDateDisplay', defaultValue: false)
  @HiveField(131, defaultValue: false)
  bool get expiryDateDisplay;
  @override
  @JsonKey(name: 'hideStockDisplay', defaultValue: false)
  @HiveField(132, defaultValue: false)
  bool get hideStockDisplay;
  @override
  @JsonKey(name: 'addOosMaterials', defaultValue: false)
  @HiveField(133, defaultValue: false)
  bool get addOosMaterials;
  @override
  @JsonKey(name: 'oosValue', defaultValue: 0)
  @HiveField(134, defaultValue: 0)
  int get oosValue;
  @override
  @JsonKey(name: 'enableRemarks', defaultValue: false)
  @HiveField(135, defaultValue: false)
  bool get enableRemarks;
  @override
  @JsonKey(name: 'enableOHPrice', defaultValue: true)
  @HiveField(136, defaultValue: true)
  bool get enableOHPrice;
  @override
  @JsonKey(name: 'ponRequired', defaultValue: false)
  @HiveField(137, defaultValue: false)
  bool get poNumberRequired;
  @override
  @JsonKey(name: 'enableIRN', defaultValue: false)
  @HiveField(138, defaultValue: false)
  bool get enableIRN;
  @override
  @JsonKey(name: 'enableTaxDisplay', defaultValue: false)
  @HiveField(139, defaultValue: false)
  bool get enableTaxDisplay;
  @override
  @JsonKey(name: 'enableTaxAtTotalLevelOnly', defaultValue: false)
  @HiveField(140, defaultValue: false)
  bool get enableTaxAtTotalLevelOnly;
  @override
  @JsonKey(name: 'netPriceOverride', defaultValue: false)
  @HiveField(141, defaultValue: false)
  bool get netPriceOverride;
  @override
  @JsonKey(name: 'batchNumDisplay', defaultValue: false)
  @HiveField(142, defaultValue: false)
  bool get batchNumDisplay;
  @override
  @JsonKey(name: 'displayOrderDiscount', defaultValue: false)
  @HiveField(143, defaultValue: false)
  bool get displayOrderDiscount;
  @override
  @JsonKey(name: 'minOrderAmount', defaultValue: '0')
  @HiveField(144, defaultValue: '0')
  String get minOrderAmount;
  @override
  @JsonKey(name: 'salesOrgCode', defaultValue: '0')
  @HiveField(145, defaultValue: '0')
  String get salesOrg;
  @override
  @JsonKey(name: 'enableZDP8Override', defaultValue: false)
  @HiveField(146, defaultValue: false)
  bool get enableZDP8Override;
  @override
  @JsonKey(name: 'disableReturnsAccessSR', defaultValue: false)
  @HiveField(147, defaultValue: false)
  bool get disableReturnsAccessSR;
  @override
  @JsonKey(name: 'disableReturnsAccess', defaultValue: false)
  @HiveField(148, defaultValue: false)
  bool get disableReturnsAccess;
  @override
  @JsonKey(name: 'enableGreenDelivery', defaultValue: false)
  @HiveField(149, defaultValue: false)
  bool get enableGreenDelivery;
  @override
  @JsonKey(name: 'greenDeliveryDelayInDays', defaultValue: 2)
  @HiveField(150, defaultValue: 2)
  int get greenDeliveryDelayInDays;
  @override
  @JsonKey(name: 'enableComboDeals', defaultValue: false)
  @HiveField(151, defaultValue: false)
  bool get enableComboDeals;
  @override
  @JsonKey(name: 'greenDeliveryUserRole', defaultValue: 0)
  @HiveField(152, defaultValue: 0)
  int get greenDeliveryUserRole;
  @override
  @JsonKey(name: 'comboDealsUserRole', defaultValue: 0)
  @HiveField(153, defaultValue: 0)
  int get comboDealsUserRole;
  @override
  @JsonKey(name: 'enableGMN', defaultValue: false)
  @HiveField(154, defaultValue: false)
  bool get enableGMN;
  @override
  @JsonKey(name: 'displayItemTaxBreakdown', defaultValue: false)
  @HiveField(155, defaultValue: false)
  bool get displayItemTaxBreakdown;
  @override
  @JsonKey(name: 'displaySubtotalTaxBreakdown', defaultValue: false)
  @HiveField(156, defaultValue: false)
  bool get displaySubtotalTaxBreakdown;
  @override
  @JsonKey(name: 'disablePayment', defaultValue: false)
  @HiveField(157, defaultValue: false)
  bool get disablePayment;
  @override
  @JsonKey(ignore: true)
  _$$_SalesOrganisationConfigsDtoCopyWith<_$_SalesOrganisationConfigsDto>
      get copyWith => throw _privateConstructorUsedError;
}

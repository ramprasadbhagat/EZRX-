// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tender_contract_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TenderContractDto _$TenderContractDtoFromJson(Map<String, dynamic> json) {
  return _TenderContractDto.fromJson(json);
}

/// @nodoc
mixin _$TenderContractDto {
  @HiveField(0, defaultValue: '')
  @JsonKey(name: 'contractNumber')
  String get contractNumber => throw _privateConstructorUsedError;
  @HiveField(1, defaultValue: '')
  @JsonKey(name: 'contractItemNumber')
  String get contractItemNumber => throw _privateConstructorUsedError;
  @HiveField(2, defaultValue: '')
  @JsonKey(name: 'contractReference')
  String get contractReference => throw _privateConstructorUsedError;
  @HiveField(3, defaultValue: '')
  @JsonKey(name: 'tenderOrderReason')
  String get tenderOrderReason => throw _privateConstructorUsedError;
  @HiveField(4, defaultValue: '')
  @JsonKey(name: 'tenderVisaNumber')
  String get tenderVisaNumber => throw _privateConstructorUsedError;
  @HiveField(5, defaultValue: '')
  @JsonKey(name: 'salesDistrict')
  String get salesDistrict => throw _privateConstructorUsedError;
  @HiveField(6, defaultValue: '')
  @JsonKey(name: 'tenderPackageDescription')
  String get tenderPackageDescription => throw _privateConstructorUsedError;
  @HiveField(7, defaultValue: '')
  @JsonKey(name: 'tenderPrice')
  String get tenderPrice => throw _privateConstructorUsedError;
  @HiveField(8, defaultValue: 0)
  @JsonKey(name: 'pricingUnit')
  int get pricingUnit => throw _privateConstructorUsedError;
  @HiveField(9, defaultValue: 0)
  @JsonKey(name: 'remainingTenderQuantity')
  int get remainingTenderQuantity => throw _privateConstructorUsedError;
  @HiveField(10, defaultValue: 0)
  @JsonKey(name: 'contractQuantity')
  int get contractQuantity => throw _privateConstructorUsedError;
  @HiveField(11, defaultValue: '')
  @JsonKey(name: 'contractExpiryDate')
  String get contractExpiryDate => throw _privateConstructorUsedError;
  @HiveField(12, defaultValue: '')
  @JsonKey(name: 'announcementLetterNumber')
  String get announcementLetterNumber => throw _privateConstructorUsedError;
  @HiveField(13, defaultValue: false)
  @JsonKey(name: 'isNearToExpire')
  bool get isNearToExpire => throw _privateConstructorUsedError;
  @HiveField(14, defaultValue: '')
  @JsonKey(name: 'contractPaymentTerm')
  String get contractPaymentTerm => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TenderContractDtoCopyWith<TenderContractDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TenderContractDtoCopyWith<$Res> {
  factory $TenderContractDtoCopyWith(
          TenderContractDto value, $Res Function(TenderContractDto) then) =
      _$TenderContractDtoCopyWithImpl<$Res, TenderContractDto>;
  @useResult
  $Res call(
      {@HiveField(0, defaultValue: '')
      @JsonKey(name: 'contractNumber')
          String contractNumber,
      @HiveField(1, defaultValue: '')
      @JsonKey(name: 'contractItemNumber')
          String contractItemNumber,
      @HiveField(2, defaultValue: '')
      @JsonKey(name: 'contractReference')
          String contractReference,
      @HiveField(3, defaultValue: '')
      @JsonKey(name: 'tenderOrderReason')
          String tenderOrderReason,
      @HiveField(4, defaultValue: '')
      @JsonKey(name: 'tenderVisaNumber')
          String tenderVisaNumber,
      @HiveField(5, defaultValue: '')
      @JsonKey(name: 'salesDistrict')
          String salesDistrict,
      @HiveField(6, defaultValue: '')
      @JsonKey(name: 'tenderPackageDescription')
          String tenderPackageDescription,
      @HiveField(7, defaultValue: '')
      @JsonKey(name: 'tenderPrice')
          String tenderPrice,
      @HiveField(8, defaultValue: 0)
      @JsonKey(name: 'pricingUnit')
          int pricingUnit,
      @HiveField(9, defaultValue: 0)
      @JsonKey(name: 'remainingTenderQuantity')
          int remainingTenderQuantity,
      @HiveField(10, defaultValue: 0)
      @JsonKey(name: 'contractQuantity')
          int contractQuantity,
      @HiveField(11, defaultValue: '')
      @JsonKey(name: 'contractExpiryDate')
          String contractExpiryDate,
      @HiveField(12, defaultValue: '')
      @JsonKey(name: 'announcementLetterNumber')
          String announcementLetterNumber,
      @HiveField(13, defaultValue: false)
      @JsonKey(name: 'isNearToExpire')
          bool isNearToExpire,
      @HiveField(14, defaultValue: '')
      @JsonKey(name: 'contractPaymentTerm')
          String contractPaymentTerm});
}

/// @nodoc
class _$TenderContractDtoCopyWithImpl<$Res, $Val extends TenderContractDto>
    implements $TenderContractDtoCopyWith<$Res> {
  _$TenderContractDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contractNumber = null,
    Object? contractItemNumber = null,
    Object? contractReference = null,
    Object? tenderOrderReason = null,
    Object? tenderVisaNumber = null,
    Object? salesDistrict = null,
    Object? tenderPackageDescription = null,
    Object? tenderPrice = null,
    Object? pricingUnit = null,
    Object? remainingTenderQuantity = null,
    Object? contractQuantity = null,
    Object? contractExpiryDate = null,
    Object? announcementLetterNumber = null,
    Object? isNearToExpire = null,
    Object? contractPaymentTerm = null,
  }) {
    return _then(_value.copyWith(
      contractNumber: null == contractNumber
          ? _value.contractNumber
          : contractNumber // ignore: cast_nullable_to_non_nullable
              as String,
      contractItemNumber: null == contractItemNumber
          ? _value.contractItemNumber
          : contractItemNumber // ignore: cast_nullable_to_non_nullable
              as String,
      contractReference: null == contractReference
          ? _value.contractReference
          : contractReference // ignore: cast_nullable_to_non_nullable
              as String,
      tenderOrderReason: null == tenderOrderReason
          ? _value.tenderOrderReason
          : tenderOrderReason // ignore: cast_nullable_to_non_nullable
              as String,
      tenderVisaNumber: null == tenderVisaNumber
          ? _value.tenderVisaNumber
          : tenderVisaNumber // ignore: cast_nullable_to_non_nullable
              as String,
      salesDistrict: null == salesDistrict
          ? _value.salesDistrict
          : salesDistrict // ignore: cast_nullable_to_non_nullable
              as String,
      tenderPackageDescription: null == tenderPackageDescription
          ? _value.tenderPackageDescription
          : tenderPackageDescription // ignore: cast_nullable_to_non_nullable
              as String,
      tenderPrice: null == tenderPrice
          ? _value.tenderPrice
          : tenderPrice // ignore: cast_nullable_to_non_nullable
              as String,
      pricingUnit: null == pricingUnit
          ? _value.pricingUnit
          : pricingUnit // ignore: cast_nullable_to_non_nullable
              as int,
      remainingTenderQuantity: null == remainingTenderQuantity
          ? _value.remainingTenderQuantity
          : remainingTenderQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      contractQuantity: null == contractQuantity
          ? _value.contractQuantity
          : contractQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      contractExpiryDate: null == contractExpiryDate
          ? _value.contractExpiryDate
          : contractExpiryDate // ignore: cast_nullable_to_non_nullable
              as String,
      announcementLetterNumber: null == announcementLetterNumber
          ? _value.announcementLetterNumber
          : announcementLetterNumber // ignore: cast_nullable_to_non_nullable
              as String,
      isNearToExpire: null == isNearToExpire
          ? _value.isNearToExpire
          : isNearToExpire // ignore: cast_nullable_to_non_nullable
              as bool,
      contractPaymentTerm: null == contractPaymentTerm
          ? _value.contractPaymentTerm
          : contractPaymentTerm // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TenderContractDtoCopyWith<$Res>
    implements $TenderContractDtoCopyWith<$Res> {
  factory _$$_TenderContractDtoCopyWith(_$_TenderContractDto value,
          $Res Function(_$_TenderContractDto) then) =
      __$$_TenderContractDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0, defaultValue: '')
      @JsonKey(name: 'contractNumber')
          String contractNumber,
      @HiveField(1, defaultValue: '')
      @JsonKey(name: 'contractItemNumber')
          String contractItemNumber,
      @HiveField(2, defaultValue: '')
      @JsonKey(name: 'contractReference')
          String contractReference,
      @HiveField(3, defaultValue: '')
      @JsonKey(name: 'tenderOrderReason')
          String tenderOrderReason,
      @HiveField(4, defaultValue: '')
      @JsonKey(name: 'tenderVisaNumber')
          String tenderVisaNumber,
      @HiveField(5, defaultValue: '')
      @JsonKey(name: 'salesDistrict')
          String salesDistrict,
      @HiveField(6, defaultValue: '')
      @JsonKey(name: 'tenderPackageDescription')
          String tenderPackageDescription,
      @HiveField(7, defaultValue: '')
      @JsonKey(name: 'tenderPrice')
          String tenderPrice,
      @HiveField(8, defaultValue: 0)
      @JsonKey(name: 'pricingUnit')
          int pricingUnit,
      @HiveField(9, defaultValue: 0)
      @JsonKey(name: 'remainingTenderQuantity')
          int remainingTenderQuantity,
      @HiveField(10, defaultValue: 0)
      @JsonKey(name: 'contractQuantity')
          int contractQuantity,
      @HiveField(11, defaultValue: '')
      @JsonKey(name: 'contractExpiryDate')
          String contractExpiryDate,
      @HiveField(12, defaultValue: '')
      @JsonKey(name: 'announcementLetterNumber')
          String announcementLetterNumber,
      @HiveField(13, defaultValue: false)
      @JsonKey(name: 'isNearToExpire')
          bool isNearToExpire,
      @HiveField(14, defaultValue: '')
      @JsonKey(name: 'contractPaymentTerm')
          String contractPaymentTerm});
}

/// @nodoc
class __$$_TenderContractDtoCopyWithImpl<$Res>
    extends _$TenderContractDtoCopyWithImpl<$Res, _$_TenderContractDto>
    implements _$$_TenderContractDtoCopyWith<$Res> {
  __$$_TenderContractDtoCopyWithImpl(
      _$_TenderContractDto _value, $Res Function(_$_TenderContractDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contractNumber = null,
    Object? contractItemNumber = null,
    Object? contractReference = null,
    Object? tenderOrderReason = null,
    Object? tenderVisaNumber = null,
    Object? salesDistrict = null,
    Object? tenderPackageDescription = null,
    Object? tenderPrice = null,
    Object? pricingUnit = null,
    Object? remainingTenderQuantity = null,
    Object? contractQuantity = null,
    Object? contractExpiryDate = null,
    Object? announcementLetterNumber = null,
    Object? isNearToExpire = null,
    Object? contractPaymentTerm = null,
  }) {
    return _then(_$_TenderContractDto(
      contractNumber: null == contractNumber
          ? _value.contractNumber
          : contractNumber // ignore: cast_nullable_to_non_nullable
              as String,
      contractItemNumber: null == contractItemNumber
          ? _value.contractItemNumber
          : contractItemNumber // ignore: cast_nullable_to_non_nullable
              as String,
      contractReference: null == contractReference
          ? _value.contractReference
          : contractReference // ignore: cast_nullable_to_non_nullable
              as String,
      tenderOrderReason: null == tenderOrderReason
          ? _value.tenderOrderReason
          : tenderOrderReason // ignore: cast_nullable_to_non_nullable
              as String,
      tenderVisaNumber: null == tenderVisaNumber
          ? _value.tenderVisaNumber
          : tenderVisaNumber // ignore: cast_nullable_to_non_nullable
              as String,
      salesDistrict: null == salesDistrict
          ? _value.salesDistrict
          : salesDistrict // ignore: cast_nullable_to_non_nullable
              as String,
      tenderPackageDescription: null == tenderPackageDescription
          ? _value.tenderPackageDescription
          : tenderPackageDescription // ignore: cast_nullable_to_non_nullable
              as String,
      tenderPrice: null == tenderPrice
          ? _value.tenderPrice
          : tenderPrice // ignore: cast_nullable_to_non_nullable
              as String,
      pricingUnit: null == pricingUnit
          ? _value.pricingUnit
          : pricingUnit // ignore: cast_nullable_to_non_nullable
              as int,
      remainingTenderQuantity: null == remainingTenderQuantity
          ? _value.remainingTenderQuantity
          : remainingTenderQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      contractQuantity: null == contractQuantity
          ? _value.contractQuantity
          : contractQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      contractExpiryDate: null == contractExpiryDate
          ? _value.contractExpiryDate
          : contractExpiryDate // ignore: cast_nullable_to_non_nullable
              as String,
      announcementLetterNumber: null == announcementLetterNumber
          ? _value.announcementLetterNumber
          : announcementLetterNumber // ignore: cast_nullable_to_non_nullable
              as String,
      isNearToExpire: null == isNearToExpire
          ? _value.isNearToExpire
          : isNearToExpire // ignore: cast_nullable_to_non_nullable
              as bool,
      contractPaymentTerm: null == contractPaymentTerm
          ? _value.contractPaymentTerm
          : contractPaymentTerm // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 20, adapterName: 'TenderContractDtoAdapter')
class _$_TenderContractDto extends _TenderContractDto {
  const _$_TenderContractDto(
      {@HiveField(0, defaultValue: '')
      @JsonKey(name: 'contractNumber')
          required this.contractNumber,
      @HiveField(1, defaultValue: '')
      @JsonKey(name: 'contractItemNumber')
          required this.contractItemNumber,
      @HiveField(2, defaultValue: '')
      @JsonKey(name: 'contractReference')
          required this.contractReference,
      @HiveField(3, defaultValue: '')
      @JsonKey(name: 'tenderOrderReason')
          required this.tenderOrderReason,
      @HiveField(4, defaultValue: '')
      @JsonKey(name: 'tenderVisaNumber')
          required this.tenderVisaNumber,
      @HiveField(5, defaultValue: '')
      @JsonKey(name: 'salesDistrict')
          required this.salesDistrict,
      @HiveField(6, defaultValue: '')
      @JsonKey(name: 'tenderPackageDescription')
          required this.tenderPackageDescription,
      @HiveField(7, defaultValue: '')
      @JsonKey(name: 'tenderPrice')
          required this.tenderPrice,
      @HiveField(8, defaultValue: 0)
      @JsonKey(name: 'pricingUnit')
          required this.pricingUnit,
      @HiveField(9, defaultValue: 0)
      @JsonKey(name: 'remainingTenderQuantity')
          required this.remainingTenderQuantity,
      @HiveField(10, defaultValue: 0)
      @JsonKey(name: 'contractQuantity')
          required this.contractQuantity,
      @HiveField(11, defaultValue: '')
      @JsonKey(name: 'contractExpiryDate')
          required this.contractExpiryDate,
      @HiveField(12, defaultValue: '')
      @JsonKey(name: 'announcementLetterNumber')
          required this.announcementLetterNumber,
      @HiveField(13, defaultValue: false)
      @JsonKey(name: 'isNearToExpire')
          required this.isNearToExpire,
      @HiveField(14, defaultValue: '')
      @JsonKey(name: 'contractPaymentTerm')
          required this.contractPaymentTerm})
      : super._();

  factory _$_TenderContractDto.fromJson(Map<String, dynamic> json) =>
      _$$_TenderContractDtoFromJson(json);

  @override
  @HiveField(0, defaultValue: '')
  @JsonKey(name: 'contractNumber')
  final String contractNumber;
  @override
  @HiveField(1, defaultValue: '')
  @JsonKey(name: 'contractItemNumber')
  final String contractItemNumber;
  @override
  @HiveField(2, defaultValue: '')
  @JsonKey(name: 'contractReference')
  final String contractReference;
  @override
  @HiveField(3, defaultValue: '')
  @JsonKey(name: 'tenderOrderReason')
  final String tenderOrderReason;
  @override
  @HiveField(4, defaultValue: '')
  @JsonKey(name: 'tenderVisaNumber')
  final String tenderVisaNumber;
  @override
  @HiveField(5, defaultValue: '')
  @JsonKey(name: 'salesDistrict')
  final String salesDistrict;
  @override
  @HiveField(6, defaultValue: '')
  @JsonKey(name: 'tenderPackageDescription')
  final String tenderPackageDescription;
  @override
  @HiveField(7, defaultValue: '')
  @JsonKey(name: 'tenderPrice')
  final String tenderPrice;
  @override
  @HiveField(8, defaultValue: 0)
  @JsonKey(name: 'pricingUnit')
  final int pricingUnit;
  @override
  @HiveField(9, defaultValue: 0)
  @JsonKey(name: 'remainingTenderQuantity')
  final int remainingTenderQuantity;
  @override
  @HiveField(10, defaultValue: 0)
  @JsonKey(name: 'contractQuantity')
  final int contractQuantity;
  @override
  @HiveField(11, defaultValue: '')
  @JsonKey(name: 'contractExpiryDate')
  final String contractExpiryDate;
  @override
  @HiveField(12, defaultValue: '')
  @JsonKey(name: 'announcementLetterNumber')
  final String announcementLetterNumber;
  @override
  @HiveField(13, defaultValue: false)
  @JsonKey(name: 'isNearToExpire')
  final bool isNearToExpire;
  @override
  @HiveField(14, defaultValue: '')
  @JsonKey(name: 'contractPaymentTerm')
  final String contractPaymentTerm;

  @override
  String toString() {
    return 'TenderContractDto(contractNumber: $contractNumber, contractItemNumber: $contractItemNumber, contractReference: $contractReference, tenderOrderReason: $tenderOrderReason, tenderVisaNumber: $tenderVisaNumber, salesDistrict: $salesDistrict, tenderPackageDescription: $tenderPackageDescription, tenderPrice: $tenderPrice, pricingUnit: $pricingUnit, remainingTenderQuantity: $remainingTenderQuantity, contractQuantity: $contractQuantity, contractExpiryDate: $contractExpiryDate, announcementLetterNumber: $announcementLetterNumber, isNearToExpire: $isNearToExpire, contractPaymentTerm: $contractPaymentTerm)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TenderContractDto &&
            (identical(other.contractNumber, contractNumber) ||
                other.contractNumber == contractNumber) &&
            (identical(other.contractItemNumber, contractItemNumber) ||
                other.contractItemNumber == contractItemNumber) &&
            (identical(other.contractReference, contractReference) ||
                other.contractReference == contractReference) &&
            (identical(other.tenderOrderReason, tenderOrderReason) ||
                other.tenderOrderReason == tenderOrderReason) &&
            (identical(other.tenderVisaNumber, tenderVisaNumber) ||
                other.tenderVisaNumber == tenderVisaNumber) &&
            (identical(other.salesDistrict, salesDistrict) ||
                other.salesDistrict == salesDistrict) &&
            (identical(
                    other.tenderPackageDescription, tenderPackageDescription) ||
                other.tenderPackageDescription == tenderPackageDescription) &&
            (identical(other.tenderPrice, tenderPrice) ||
                other.tenderPrice == tenderPrice) &&
            (identical(other.pricingUnit, pricingUnit) ||
                other.pricingUnit == pricingUnit) &&
            (identical(
                    other.remainingTenderQuantity, remainingTenderQuantity) ||
                other.remainingTenderQuantity == remainingTenderQuantity) &&
            (identical(other.contractQuantity, contractQuantity) ||
                other.contractQuantity == contractQuantity) &&
            (identical(other.contractExpiryDate, contractExpiryDate) ||
                other.contractExpiryDate == contractExpiryDate) &&
            (identical(
                    other.announcementLetterNumber, announcementLetterNumber) ||
                other.announcementLetterNumber == announcementLetterNumber) &&
            (identical(other.isNearToExpire, isNearToExpire) ||
                other.isNearToExpire == isNearToExpire) &&
            (identical(other.contractPaymentTerm, contractPaymentTerm) ||
                other.contractPaymentTerm == contractPaymentTerm));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      contractNumber,
      contractItemNumber,
      contractReference,
      tenderOrderReason,
      tenderVisaNumber,
      salesDistrict,
      tenderPackageDescription,
      tenderPrice,
      pricingUnit,
      remainingTenderQuantity,
      contractQuantity,
      contractExpiryDate,
      announcementLetterNumber,
      isNearToExpire,
      contractPaymentTerm);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TenderContractDtoCopyWith<_$_TenderContractDto> get copyWith =>
      __$$_TenderContractDtoCopyWithImpl<_$_TenderContractDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TenderContractDtoToJson(
      this,
    );
  }
}

abstract class _TenderContractDto extends TenderContractDto {
  const factory _TenderContractDto(
      {@HiveField(0, defaultValue: '')
      @JsonKey(name: 'contractNumber')
          required final String contractNumber,
      @HiveField(1, defaultValue: '')
      @JsonKey(name: 'contractItemNumber')
          required final String contractItemNumber,
      @HiveField(2, defaultValue: '')
      @JsonKey(name: 'contractReference')
          required final String contractReference,
      @HiveField(3, defaultValue: '')
      @JsonKey(name: 'tenderOrderReason')
          required final String tenderOrderReason,
      @HiveField(4, defaultValue: '')
      @JsonKey(name: 'tenderVisaNumber')
          required final String tenderVisaNumber,
      @HiveField(5, defaultValue: '')
      @JsonKey(name: 'salesDistrict')
          required final String salesDistrict,
      @HiveField(6, defaultValue: '')
      @JsonKey(name: 'tenderPackageDescription')
          required final String tenderPackageDescription,
      @HiveField(7, defaultValue: '')
      @JsonKey(name: 'tenderPrice')
          required final String tenderPrice,
      @HiveField(8, defaultValue: 0)
      @JsonKey(name: 'pricingUnit')
          required final int pricingUnit,
      @HiveField(9, defaultValue: 0)
      @JsonKey(name: 'remainingTenderQuantity')
          required final int remainingTenderQuantity,
      @HiveField(10, defaultValue: 0)
      @JsonKey(name: 'contractQuantity')
          required final int contractQuantity,
      @HiveField(11, defaultValue: '')
      @JsonKey(name: 'contractExpiryDate')
          required final String contractExpiryDate,
      @HiveField(12, defaultValue: '')
      @JsonKey(name: 'announcementLetterNumber')
          required final String announcementLetterNumber,
      @HiveField(13, defaultValue: false)
      @JsonKey(name: 'isNearToExpire')
          required final bool isNearToExpire,
      @HiveField(14, defaultValue: '')
      @JsonKey(name: 'contractPaymentTerm')
          required final String contractPaymentTerm}) = _$_TenderContractDto;
  const _TenderContractDto._() : super._();

  factory _TenderContractDto.fromJson(Map<String, dynamic> json) =
      _$_TenderContractDto.fromJson;

  @override
  @HiveField(0, defaultValue: '')
  @JsonKey(name: 'contractNumber')
  String get contractNumber;
  @override
  @HiveField(1, defaultValue: '')
  @JsonKey(name: 'contractItemNumber')
  String get contractItemNumber;
  @override
  @HiveField(2, defaultValue: '')
  @JsonKey(name: 'contractReference')
  String get contractReference;
  @override
  @HiveField(3, defaultValue: '')
  @JsonKey(name: 'tenderOrderReason')
  String get tenderOrderReason;
  @override
  @HiveField(4, defaultValue: '')
  @JsonKey(name: 'tenderVisaNumber')
  String get tenderVisaNumber;
  @override
  @HiveField(5, defaultValue: '')
  @JsonKey(name: 'salesDistrict')
  String get salesDistrict;
  @override
  @HiveField(6, defaultValue: '')
  @JsonKey(name: 'tenderPackageDescription')
  String get tenderPackageDescription;
  @override
  @HiveField(7, defaultValue: '')
  @JsonKey(name: 'tenderPrice')
  String get tenderPrice;
  @override
  @HiveField(8, defaultValue: 0)
  @JsonKey(name: 'pricingUnit')
  int get pricingUnit;
  @override
  @HiveField(9, defaultValue: 0)
  @JsonKey(name: 'remainingTenderQuantity')
  int get remainingTenderQuantity;
  @override
  @HiveField(10, defaultValue: 0)
  @JsonKey(name: 'contractQuantity')
  int get contractQuantity;
  @override
  @HiveField(11, defaultValue: '')
  @JsonKey(name: 'contractExpiryDate')
  String get contractExpiryDate;
  @override
  @HiveField(12, defaultValue: '')
  @JsonKey(name: 'announcementLetterNumber')
  String get announcementLetterNumber;
  @override
  @HiveField(13, defaultValue: false)
  @JsonKey(name: 'isNearToExpire')
  bool get isNearToExpire;
  @override
  @HiveField(14, defaultValue: '')
  @JsonKey(name: 'contractPaymentTerm')
  String get contractPaymentTerm;
  @override
  @JsonKey(ignore: true)
  _$$_TenderContractDtoCopyWith<_$_TenderContractDto> get copyWith =>
      throw _privateConstructorUsedError;
}

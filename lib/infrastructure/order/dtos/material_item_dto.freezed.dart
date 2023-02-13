// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'material_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MaterialItemDto _$MaterialItemDtoFromJson(Map<String, dynamic> json) {
  return _MaterialItemDto.fromJson(json);
}

/// @nodoc
mixin _$MaterialItemDto {
  @JsonKey(name: 'bundleName', defaultValue: '')
  String get bundleName => throw _privateConstructorUsedError;
  @JsonKey(name: 'bundleCode', defaultValue: '')
  String get bundleCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'materials', defaultValue: <MaterialDto>[])
  List<MaterialDto> get materials => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty', defaultValue: 0)
  int get qty => throw _privateConstructorUsedError;
  @JsonKey(name: 'hidePrice', defaultValue: false)
  bool get hidePrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'additionalBonus', defaultValue: <MaterialItemBonusDto>[])
  List<MaterialItemBonusDto> get bonuses => throw _privateConstructorUsedError;
  @JsonKey(name: 'materialGroup2', defaultValue: '')
  String get materialGroup2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'materialGroup4', defaultValue: '')
  String get materialGroup4 => throw _privateConstructorUsedError;
  @JsonKey(name: 'materialNumber', defaultValue: '')
  String get materialNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'tenderContract', readValue: tenderContractOverride)
  TenderContractDto get tenderContractDto => throw _privateConstructorUsedError;
  @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
  bool get hasValidTenderContract => throw _privateConstructorUsedError;
  @JsonKey(name: 'tenderOrderReason', defaultValue: '')
  String get tenderOrderReason => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'priceOverride',
      defaultValue: 0,
      readValue: doubleFormatCheck,
      includeIfNull: false,
      toJson: overrideTojson)
  double get overridenPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'unitOfMeasurement', defaultValue: '')
  String get unitOfMeasurement => throw _privateConstructorUsedError;
  @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
  String get itemRegistrationNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
  String get defaultMaterialDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'materialDescription', defaultValue: '')
  String get materialDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'type', defaultValue: '')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'comment', defaultValue: '')
  String get comment => throw _privateConstructorUsedError;
  @JsonKey(name: 'batchNumber', defaultValue: '')
  String get batchNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'zdp8Override', readValue: doubleFormatCheck, defaultValue: 0)
  double get zdp8Override => throw _privateConstructorUsedError;
  @JsonKey(name: 'remarks', defaultValue: '')
  String get remarks => throw _privateConstructorUsedError;
  @JsonKey(name: 'bundleInformation', defaultValue: [])
  List<BundleInfoDto> get bundleInformation =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'totalQuantity', defaultValue: 0)
  int get totalQuantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaterialItemDtoCopyWith<MaterialItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialItemDtoCopyWith<$Res> {
  factory $MaterialItemDtoCopyWith(
          MaterialItemDto value, $Res Function(MaterialItemDto) then) =
      _$MaterialItemDtoCopyWithImpl<$Res, MaterialItemDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'bundleName', defaultValue: '')
          String bundleName,
      @JsonKey(name: 'bundleCode', defaultValue: '')
          String bundleCode,
      @JsonKey(name: 'materials', defaultValue: <MaterialDto>[])
          List<MaterialDto> materials,
      @JsonKey(name: 'qty', defaultValue: 0)
          int qty,
      @JsonKey(name: 'hidePrice', defaultValue: false)
          bool hidePrice,
      @JsonKey(name: 'additionalBonus', defaultValue: <MaterialItemBonusDto>[])
          List<MaterialItemBonusDto> bonuses,
      @JsonKey(name: 'materialGroup2', defaultValue: '')
          String materialGroup2,
      @JsonKey(name: 'materialGroup4', defaultValue: '')
          String materialGroup4,
      @JsonKey(name: 'materialNumber', defaultValue: '')
          String materialNumber,
      @JsonKey(name: 'tenderContract', readValue: tenderContractOverride)
          TenderContractDto tenderContractDto,
      @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
          bool hasValidTenderContract,
      @JsonKey(name: 'tenderOrderReason', defaultValue: '')
          String tenderOrderReason,
      @JsonKey(name: 'priceOverride', defaultValue: 0, readValue: doubleFormatCheck, includeIfNull: false, toJson: overrideTojson)
          double overridenPrice,
      @JsonKey(name: 'unitOfMeasurement', defaultValue: '')
          String unitOfMeasurement,
      @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
          String itemRegistrationNumber,
      @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
          String defaultMaterialDescription,
      @JsonKey(name: 'materialDescription', defaultValue: '')
          String materialDescription,
      @JsonKey(name: 'type', defaultValue: '')
          String type,
      @JsonKey(name: 'comment', defaultValue: '')
          String comment,
      @JsonKey(name: 'batchNumber', defaultValue: '')
          String batchNumber,
      @JsonKey(name: 'zdp8Override', readValue: doubleFormatCheck, defaultValue: 0)
          double zdp8Override,
      @JsonKey(name: 'remarks', defaultValue: '')
          String remarks,
      @JsonKey(name: 'bundleInformation', defaultValue: [])
          List<BundleInfoDto> bundleInformation,
      @JsonKey(name: 'totalQuantity', defaultValue: 0)
          int totalQuantity});

  $TenderContractDtoCopyWith<$Res> get tenderContractDto;
}

/// @nodoc
class _$MaterialItemDtoCopyWithImpl<$Res, $Val extends MaterialItemDto>
    implements $MaterialItemDtoCopyWith<$Res> {
  _$MaterialItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bundleName = null,
    Object? bundleCode = null,
    Object? materials = null,
    Object? qty = null,
    Object? hidePrice = null,
    Object? bonuses = null,
    Object? materialGroup2 = null,
    Object? materialGroup4 = null,
    Object? materialNumber = null,
    Object? tenderContractDto = null,
    Object? hasValidTenderContract = null,
    Object? tenderOrderReason = null,
    Object? overridenPrice = null,
    Object? unitOfMeasurement = null,
    Object? itemRegistrationNumber = null,
    Object? defaultMaterialDescription = null,
    Object? materialDescription = null,
    Object? type = null,
    Object? comment = null,
    Object? batchNumber = null,
    Object? zdp8Override = null,
    Object? remarks = null,
    Object? bundleInformation = null,
    Object? totalQuantity = null,
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
      materials: null == materials
          ? _value.materials
          : materials // ignore: cast_nullable_to_non_nullable
              as List<MaterialDto>,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      hidePrice: null == hidePrice
          ? _value.hidePrice
          : hidePrice // ignore: cast_nullable_to_non_nullable
              as bool,
      bonuses: null == bonuses
          ? _value.bonuses
          : bonuses // ignore: cast_nullable_to_non_nullable
              as List<MaterialItemBonusDto>,
      materialGroup2: null == materialGroup2
          ? _value.materialGroup2
          : materialGroup2 // ignore: cast_nullable_to_non_nullable
              as String,
      materialGroup4: null == materialGroup4
          ? _value.materialGroup4
          : materialGroup4 // ignore: cast_nullable_to_non_nullable
              as String,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      tenderContractDto: null == tenderContractDto
          ? _value.tenderContractDto
          : tenderContractDto // ignore: cast_nullable_to_non_nullable
              as TenderContractDto,
      hasValidTenderContract: null == hasValidTenderContract
          ? _value.hasValidTenderContract
          : hasValidTenderContract // ignore: cast_nullable_to_non_nullable
              as bool,
      tenderOrderReason: null == tenderOrderReason
          ? _value.tenderOrderReason
          : tenderOrderReason // ignore: cast_nullable_to_non_nullable
              as String,
      overridenPrice: null == overridenPrice
          ? _value.overridenPrice
          : overridenPrice // ignore: cast_nullable_to_non_nullable
              as double,
      unitOfMeasurement: null == unitOfMeasurement
          ? _value.unitOfMeasurement
          : unitOfMeasurement // ignore: cast_nullable_to_non_nullable
              as String,
      itemRegistrationNumber: null == itemRegistrationNumber
          ? _value.itemRegistrationNumber
          : itemRegistrationNumber // ignore: cast_nullable_to_non_nullable
              as String,
      defaultMaterialDescription: null == defaultMaterialDescription
          ? _value.defaultMaterialDescription
          : defaultMaterialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      materialDescription: null == materialDescription
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      batchNumber: null == batchNumber
          ? _value.batchNumber
          : batchNumber // ignore: cast_nullable_to_non_nullable
              as String,
      zdp8Override: null == zdp8Override
          ? _value.zdp8Override
          : zdp8Override // ignore: cast_nullable_to_non_nullable
              as double,
      remarks: null == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String,
      bundleInformation: null == bundleInformation
          ? _value.bundleInformation
          : bundleInformation // ignore: cast_nullable_to_non_nullable
              as List<BundleInfoDto>,
      totalQuantity: null == totalQuantity
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TenderContractDtoCopyWith<$Res> get tenderContractDto {
    return $TenderContractDtoCopyWith<$Res>(_value.tenderContractDto, (value) {
      return _then(_value.copyWith(tenderContractDto: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MaterialItemDtoCopyWith<$Res>
    implements $MaterialItemDtoCopyWith<$Res> {
  factory _$$_MaterialItemDtoCopyWith(
          _$_MaterialItemDto value, $Res Function(_$_MaterialItemDto) then) =
      __$$_MaterialItemDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'bundleName', defaultValue: '')
          String bundleName,
      @JsonKey(name: 'bundleCode', defaultValue: '')
          String bundleCode,
      @JsonKey(name: 'materials', defaultValue: <MaterialDto>[])
          List<MaterialDto> materials,
      @JsonKey(name: 'qty', defaultValue: 0)
          int qty,
      @JsonKey(name: 'hidePrice', defaultValue: false)
          bool hidePrice,
      @JsonKey(name: 'additionalBonus', defaultValue: <MaterialItemBonusDto>[])
          List<MaterialItemBonusDto> bonuses,
      @JsonKey(name: 'materialGroup2', defaultValue: '')
          String materialGroup2,
      @JsonKey(name: 'materialGroup4', defaultValue: '')
          String materialGroup4,
      @JsonKey(name: 'materialNumber', defaultValue: '')
          String materialNumber,
      @JsonKey(name: 'tenderContract', readValue: tenderContractOverride)
          TenderContractDto tenderContractDto,
      @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
          bool hasValidTenderContract,
      @JsonKey(name: 'tenderOrderReason', defaultValue: '')
          String tenderOrderReason,
      @JsonKey(name: 'priceOverride', defaultValue: 0, readValue: doubleFormatCheck, includeIfNull: false, toJson: overrideTojson)
          double overridenPrice,
      @JsonKey(name: 'unitOfMeasurement', defaultValue: '')
          String unitOfMeasurement,
      @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
          String itemRegistrationNumber,
      @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
          String defaultMaterialDescription,
      @JsonKey(name: 'materialDescription', defaultValue: '')
          String materialDescription,
      @JsonKey(name: 'type', defaultValue: '')
          String type,
      @JsonKey(name: 'comment', defaultValue: '')
          String comment,
      @JsonKey(name: 'batchNumber', defaultValue: '')
          String batchNumber,
      @JsonKey(name: 'zdp8Override', readValue: doubleFormatCheck, defaultValue: 0)
          double zdp8Override,
      @JsonKey(name: 'remarks', defaultValue: '')
          String remarks,
      @JsonKey(name: 'bundleInformation', defaultValue: [])
          List<BundleInfoDto> bundleInformation,
      @JsonKey(name: 'totalQuantity', defaultValue: 0)
          int totalQuantity});

  @override
  $TenderContractDtoCopyWith<$Res> get tenderContractDto;
}

/// @nodoc
class __$$_MaterialItemDtoCopyWithImpl<$Res>
    extends _$MaterialItemDtoCopyWithImpl<$Res, _$_MaterialItemDto>
    implements _$$_MaterialItemDtoCopyWith<$Res> {
  __$$_MaterialItemDtoCopyWithImpl(
      _$_MaterialItemDto _value, $Res Function(_$_MaterialItemDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bundleName = null,
    Object? bundleCode = null,
    Object? materials = null,
    Object? qty = null,
    Object? hidePrice = null,
    Object? bonuses = null,
    Object? materialGroup2 = null,
    Object? materialGroup4 = null,
    Object? materialNumber = null,
    Object? tenderContractDto = null,
    Object? hasValidTenderContract = null,
    Object? tenderOrderReason = null,
    Object? overridenPrice = null,
    Object? unitOfMeasurement = null,
    Object? itemRegistrationNumber = null,
    Object? defaultMaterialDescription = null,
    Object? materialDescription = null,
    Object? type = null,
    Object? comment = null,
    Object? batchNumber = null,
    Object? zdp8Override = null,
    Object? remarks = null,
    Object? bundleInformation = null,
    Object? totalQuantity = null,
  }) {
    return _then(_$_MaterialItemDto(
      bundleName: null == bundleName
          ? _value.bundleName
          : bundleName // ignore: cast_nullable_to_non_nullable
              as String,
      bundleCode: null == bundleCode
          ? _value.bundleCode
          : bundleCode // ignore: cast_nullable_to_non_nullable
              as String,
      materials: null == materials
          ? _value._materials
          : materials // ignore: cast_nullable_to_non_nullable
              as List<MaterialDto>,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      hidePrice: null == hidePrice
          ? _value.hidePrice
          : hidePrice // ignore: cast_nullable_to_non_nullable
              as bool,
      bonuses: null == bonuses
          ? _value._bonuses
          : bonuses // ignore: cast_nullable_to_non_nullable
              as List<MaterialItemBonusDto>,
      materialGroup2: null == materialGroup2
          ? _value.materialGroup2
          : materialGroup2 // ignore: cast_nullable_to_non_nullable
              as String,
      materialGroup4: null == materialGroup4
          ? _value.materialGroup4
          : materialGroup4 // ignore: cast_nullable_to_non_nullable
              as String,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      tenderContractDto: null == tenderContractDto
          ? _value.tenderContractDto
          : tenderContractDto // ignore: cast_nullable_to_non_nullable
              as TenderContractDto,
      hasValidTenderContract: null == hasValidTenderContract
          ? _value.hasValidTenderContract
          : hasValidTenderContract // ignore: cast_nullable_to_non_nullable
              as bool,
      tenderOrderReason: null == tenderOrderReason
          ? _value.tenderOrderReason
          : tenderOrderReason // ignore: cast_nullable_to_non_nullable
              as String,
      overridenPrice: null == overridenPrice
          ? _value.overridenPrice
          : overridenPrice // ignore: cast_nullable_to_non_nullable
              as double,
      unitOfMeasurement: null == unitOfMeasurement
          ? _value.unitOfMeasurement
          : unitOfMeasurement // ignore: cast_nullable_to_non_nullable
              as String,
      itemRegistrationNumber: null == itemRegistrationNumber
          ? _value.itemRegistrationNumber
          : itemRegistrationNumber // ignore: cast_nullable_to_non_nullable
              as String,
      defaultMaterialDescription: null == defaultMaterialDescription
          ? _value.defaultMaterialDescription
          : defaultMaterialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      materialDescription: null == materialDescription
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      batchNumber: null == batchNumber
          ? _value.batchNumber
          : batchNumber // ignore: cast_nullable_to_non_nullable
              as String,
      zdp8Override: null == zdp8Override
          ? _value.zdp8Override
          : zdp8Override // ignore: cast_nullable_to_non_nullable
              as double,
      remarks: null == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String,
      bundleInformation: null == bundleInformation
          ? _value._bundleInformation
          : bundleInformation // ignore: cast_nullable_to_non_nullable
              as List<BundleInfoDto>,
      totalQuantity: null == totalQuantity
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MaterialItemDto extends _MaterialItemDto {
  const _$_MaterialItemDto(
      {@JsonKey(name: 'bundleName', defaultValue: '')
          required this.bundleName,
      @JsonKey(name: 'bundleCode', defaultValue: '')
          required this.bundleCode,
      @JsonKey(name: 'materials', defaultValue: <MaterialDto>[])
          required final List<MaterialDto> materials,
      @JsonKey(name: 'qty', defaultValue: 0)
          required this.qty,
      @JsonKey(name: 'hidePrice', defaultValue: false)
          required this.hidePrice,
      @JsonKey(name: 'additionalBonus', defaultValue: <MaterialItemBonusDto>[])
          required final List<MaterialItemBonusDto> bonuses,
      @JsonKey(name: 'materialGroup2', defaultValue: '')
          required this.materialGroup2,
      @JsonKey(name: 'materialGroup4', defaultValue: '')
          required this.materialGroup4,
      @JsonKey(name: 'materialNumber', defaultValue: '')
          required this.materialNumber,
      @JsonKey(name: 'tenderContract', readValue: tenderContractOverride)
          required this.tenderContractDto,
      @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
          required this.hasValidTenderContract,
      @JsonKey(name: 'tenderOrderReason', defaultValue: '')
          required this.tenderOrderReason,
      @JsonKey(name: 'priceOverride', defaultValue: 0, readValue: doubleFormatCheck, includeIfNull: false, toJson: overrideTojson)
          required this.overridenPrice,
      @JsonKey(name: 'unitOfMeasurement', defaultValue: '')
          required this.unitOfMeasurement,
      @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
          required this.itemRegistrationNumber,
      @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
          required this.defaultMaterialDescription,
      @JsonKey(name: 'materialDescription', defaultValue: '')
          required this.materialDescription,
      @JsonKey(name: 'type', defaultValue: '')
          required this.type,
      @JsonKey(name: 'comment', defaultValue: '')
          required this.comment,
      @JsonKey(name: 'batchNumber', defaultValue: '')
          required this.batchNumber,
      @JsonKey(name: 'zdp8Override', readValue: doubleFormatCheck, defaultValue: 0)
          required this.zdp8Override,
      @JsonKey(name: 'remarks', defaultValue: '')
          required this.remarks,
      @JsonKey(name: 'bundleInformation', defaultValue: [])
          required final List<BundleInfoDto> bundleInformation,
      @JsonKey(name: 'totalQuantity', defaultValue: 0)
          required this.totalQuantity})
      : _materials = materials,
        _bonuses = bonuses,
        _bundleInformation = bundleInformation,
        super._();

  factory _$_MaterialItemDto.fromJson(Map<String, dynamic> json) =>
      _$$_MaterialItemDtoFromJson(json);

  @override
  @JsonKey(name: 'bundleName', defaultValue: '')
  final String bundleName;
  @override
  @JsonKey(name: 'bundleCode', defaultValue: '')
  final String bundleCode;
  final List<MaterialDto> _materials;
  @override
  @JsonKey(name: 'materials', defaultValue: <MaterialDto>[])
  List<MaterialDto> get materials {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_materials);
  }

  @override
  @JsonKey(name: 'qty', defaultValue: 0)
  final int qty;
  @override
  @JsonKey(name: 'hidePrice', defaultValue: false)
  final bool hidePrice;
  final List<MaterialItemBonusDto> _bonuses;
  @override
  @JsonKey(name: 'additionalBonus', defaultValue: <MaterialItemBonusDto>[])
  List<MaterialItemBonusDto> get bonuses {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bonuses);
  }

  @override
  @JsonKey(name: 'materialGroup2', defaultValue: '')
  final String materialGroup2;
  @override
  @JsonKey(name: 'materialGroup4', defaultValue: '')
  final String materialGroup4;
  @override
  @JsonKey(name: 'materialNumber', defaultValue: '')
  final String materialNumber;
  @override
  @JsonKey(name: 'tenderContract', readValue: tenderContractOverride)
  final TenderContractDto tenderContractDto;
  @override
  @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
  final bool hasValidTenderContract;
  @override
  @JsonKey(name: 'tenderOrderReason', defaultValue: '')
  final String tenderOrderReason;
  @override
  @JsonKey(
      name: 'priceOverride',
      defaultValue: 0,
      readValue: doubleFormatCheck,
      includeIfNull: false,
      toJson: overrideTojson)
  final double overridenPrice;
  @override
  @JsonKey(name: 'unitOfMeasurement', defaultValue: '')
  final String unitOfMeasurement;
  @override
  @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
  final String itemRegistrationNumber;
  @override
  @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
  final String defaultMaterialDescription;
  @override
  @JsonKey(name: 'materialDescription', defaultValue: '')
  final String materialDescription;
  @override
  @JsonKey(name: 'type', defaultValue: '')
  final String type;
  @override
  @JsonKey(name: 'comment', defaultValue: '')
  final String comment;
  @override
  @JsonKey(name: 'batchNumber', defaultValue: '')
  final String batchNumber;
  @override
  @JsonKey(name: 'zdp8Override', readValue: doubleFormatCheck, defaultValue: 0)
  final double zdp8Override;
  @override
  @JsonKey(name: 'remarks', defaultValue: '')
  final String remarks;
  final List<BundleInfoDto> _bundleInformation;
  @override
  @JsonKey(name: 'bundleInformation', defaultValue: [])
  List<BundleInfoDto> get bundleInformation {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bundleInformation);
  }

  @override
  @JsonKey(name: 'totalQuantity', defaultValue: 0)
  final int totalQuantity;

  @override
  String toString() {
    return 'MaterialItemDto(bundleName: $bundleName, bundleCode: $bundleCode, materials: $materials, qty: $qty, hidePrice: $hidePrice, bonuses: $bonuses, materialGroup2: $materialGroup2, materialGroup4: $materialGroup4, materialNumber: $materialNumber, tenderContractDto: $tenderContractDto, hasValidTenderContract: $hasValidTenderContract, tenderOrderReason: $tenderOrderReason, overridenPrice: $overridenPrice, unitOfMeasurement: $unitOfMeasurement, itemRegistrationNumber: $itemRegistrationNumber, defaultMaterialDescription: $defaultMaterialDescription, materialDescription: $materialDescription, type: $type, comment: $comment, batchNumber: $batchNumber, zdp8Override: $zdp8Override, remarks: $remarks, bundleInformation: $bundleInformation, totalQuantity: $totalQuantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MaterialItemDto &&
            (identical(other.bundleName, bundleName) ||
                other.bundleName == bundleName) &&
            (identical(other.bundleCode, bundleCode) ||
                other.bundleCode == bundleCode) &&
            const DeepCollectionEquality()
                .equals(other._materials, _materials) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.hidePrice, hidePrice) ||
                other.hidePrice == hidePrice) &&
            const DeepCollectionEquality().equals(other._bonuses, _bonuses) &&
            (identical(other.materialGroup2, materialGroup2) ||
                other.materialGroup2 == materialGroup2) &&
            (identical(other.materialGroup4, materialGroup4) ||
                other.materialGroup4 == materialGroup4) &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.tenderContractDto, tenderContractDto) ||
                other.tenderContractDto == tenderContractDto) &&
            (identical(other.hasValidTenderContract, hasValidTenderContract) ||
                other.hasValidTenderContract == hasValidTenderContract) &&
            (identical(other.tenderOrderReason, tenderOrderReason) ||
                other.tenderOrderReason == tenderOrderReason) &&
            (identical(other.overridenPrice, overridenPrice) ||
                other.overridenPrice == overridenPrice) &&
            (identical(other.unitOfMeasurement, unitOfMeasurement) ||
                other.unitOfMeasurement == unitOfMeasurement) &&
            (identical(other.itemRegistrationNumber, itemRegistrationNumber) ||
                other.itemRegistrationNumber == itemRegistrationNumber) &&
            (identical(other.defaultMaterialDescription,
                    defaultMaterialDescription) ||
                other.defaultMaterialDescription ==
                    defaultMaterialDescription) &&
            (identical(other.materialDescription, materialDescription) ||
                other.materialDescription == materialDescription) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.batchNumber, batchNumber) ||
                other.batchNumber == batchNumber) &&
            (identical(other.zdp8Override, zdp8Override) ||
                other.zdp8Override == zdp8Override) &&
            (identical(other.remarks, remarks) || other.remarks == remarks) &&
            const DeepCollectionEquality()
                .equals(other._bundleInformation, _bundleInformation) &&
            (identical(other.totalQuantity, totalQuantity) ||
                other.totalQuantity == totalQuantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        bundleName,
        bundleCode,
        const DeepCollectionEquality().hash(_materials),
        qty,
        hidePrice,
        const DeepCollectionEquality().hash(_bonuses),
        materialGroup2,
        materialGroup4,
        materialNumber,
        tenderContractDto,
        hasValidTenderContract,
        tenderOrderReason,
        overridenPrice,
        unitOfMeasurement,
        itemRegistrationNumber,
        defaultMaterialDescription,
        materialDescription,
        type,
        comment,
        batchNumber,
        zdp8Override,
        remarks,
        const DeepCollectionEquality().hash(_bundleInformation),
        totalQuantity
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MaterialItemDtoCopyWith<_$_MaterialItemDto> get copyWith =>
      __$$_MaterialItemDtoCopyWithImpl<_$_MaterialItemDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MaterialItemDtoToJson(
      this,
    );
  }
}

abstract class _MaterialItemDto extends MaterialItemDto {
  const factory _MaterialItemDto(
      {@JsonKey(name: 'bundleName', defaultValue: '')
          required final String bundleName,
      @JsonKey(name: 'bundleCode', defaultValue: '')
          required final String bundleCode,
      @JsonKey(name: 'materials', defaultValue: <MaterialDto>[])
          required final List<MaterialDto> materials,
      @JsonKey(name: 'qty', defaultValue: 0)
          required final int qty,
      @JsonKey(name: 'hidePrice', defaultValue: false)
          required final bool hidePrice,
      @JsonKey(name: 'additionalBonus', defaultValue: <MaterialItemBonusDto>[])
          required final List<MaterialItemBonusDto> bonuses,
      @JsonKey(name: 'materialGroup2', defaultValue: '')
          required final String materialGroup2,
      @JsonKey(name: 'materialGroup4', defaultValue: '')
          required final String materialGroup4,
      @JsonKey(name: 'materialNumber', defaultValue: '')
          required final String materialNumber,
      @JsonKey(name: 'tenderContract', readValue: tenderContractOverride)
          required final TenderContractDto tenderContractDto,
      @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
          required final bool hasValidTenderContract,
      @JsonKey(name: 'tenderOrderReason', defaultValue: '')
          required final String tenderOrderReason,
      @JsonKey(name: 'priceOverride', defaultValue: 0, readValue: doubleFormatCheck, includeIfNull: false, toJson: overrideTojson)
          required final double overridenPrice,
      @JsonKey(name: 'unitOfMeasurement', defaultValue: '')
          required final String unitOfMeasurement,
      @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
          required final String itemRegistrationNumber,
      @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
          required final String defaultMaterialDescription,
      @JsonKey(name: 'materialDescription', defaultValue: '')
          required final String materialDescription,
      @JsonKey(name: 'type', defaultValue: '')
          required final String type,
      @JsonKey(name: 'comment', defaultValue: '')
          required final String comment,
      @JsonKey(name: 'batchNumber', defaultValue: '')
          required final String batchNumber,
      @JsonKey(name: 'zdp8Override', readValue: doubleFormatCheck, defaultValue: 0)
          required final double zdp8Override,
      @JsonKey(name: 'remarks', defaultValue: '')
          required final String remarks,
      @JsonKey(name: 'bundleInformation', defaultValue: [])
          required final List<BundleInfoDto> bundleInformation,
      @JsonKey(name: 'totalQuantity', defaultValue: 0)
          required final int totalQuantity}) = _$_MaterialItemDto;
  const _MaterialItemDto._() : super._();

  factory _MaterialItemDto.fromJson(Map<String, dynamic> json) =
      _$_MaterialItemDto.fromJson;

  @override
  @JsonKey(name: 'bundleName', defaultValue: '')
  String get bundleName;
  @override
  @JsonKey(name: 'bundleCode', defaultValue: '')
  String get bundleCode;
  @override
  @JsonKey(name: 'materials', defaultValue: <MaterialDto>[])
  List<MaterialDto> get materials;
  @override
  @JsonKey(name: 'qty', defaultValue: 0)
  int get qty;
  @override
  @JsonKey(name: 'hidePrice', defaultValue: false)
  bool get hidePrice;
  @override
  @JsonKey(name: 'additionalBonus', defaultValue: <MaterialItemBonusDto>[])
  List<MaterialItemBonusDto> get bonuses;
  @override
  @JsonKey(name: 'materialGroup2', defaultValue: '')
  String get materialGroup2;
  @override
  @JsonKey(name: 'materialGroup4', defaultValue: '')
  String get materialGroup4;
  @override
  @JsonKey(name: 'materialNumber', defaultValue: '')
  String get materialNumber;
  @override
  @JsonKey(name: 'tenderContract', readValue: tenderContractOverride)
  TenderContractDto get tenderContractDto;
  @override
  @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
  bool get hasValidTenderContract;
  @override
  @JsonKey(name: 'tenderOrderReason', defaultValue: '')
  String get tenderOrderReason;
  @override
  @JsonKey(
      name: 'priceOverride',
      defaultValue: 0,
      readValue: doubleFormatCheck,
      includeIfNull: false,
      toJson: overrideTojson)
  double get overridenPrice;
  @override
  @JsonKey(name: 'unitOfMeasurement', defaultValue: '')
  String get unitOfMeasurement;
  @override
  @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
  String get itemRegistrationNumber;
  @override
  @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
  String get defaultMaterialDescription;
  @override
  @JsonKey(name: 'materialDescription', defaultValue: '')
  String get materialDescription;
  @override
  @JsonKey(name: 'type', defaultValue: '')
  String get type;
  @override
  @JsonKey(name: 'comment', defaultValue: '')
  String get comment;
  @override
  @JsonKey(name: 'batchNumber', defaultValue: '')
  String get batchNumber;
  @override
  @JsonKey(name: 'zdp8Override', readValue: doubleFormatCheck, defaultValue: 0)
  double get zdp8Override;
  @override
  @JsonKey(name: 'remarks', defaultValue: '')
  String get remarks;
  @override
  @JsonKey(name: 'bundleInformation', defaultValue: [])
  List<BundleInfoDto> get bundleInformation;
  @override
  @JsonKey(name: 'totalQuantity', defaultValue: 0)
  int get totalQuantity;
  @override
  @JsonKey(ignore: true)
  _$$_MaterialItemDtoCopyWith<_$_MaterialItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

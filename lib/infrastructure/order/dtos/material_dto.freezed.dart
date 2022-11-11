// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'material_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MaterialDto _$MaterialDtoFromJson(Map<String, dynamic> json) {
  return _MaterialDto.fromJson(json);
}

/// @nodoc
mixin _$MaterialDto {
  @JsonKey(name: 'materialNumber', defaultValue: '')
  @HiveField(0, defaultValue: '')
  String get materialNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'materialDescription', defaultValue: '')
  @HiveField(1, defaultValue: '')
  String get materialDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
  @HiveField(2, defaultValue: '')
  String get governmentMaterialCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'therapeuticClass', defaultValue: '')
  @HiveField(3, defaultValue: '')
  String get therapeuticClass => throw _privateConstructorUsedError;
  @JsonKey(name: 'itemBrand', defaultValue: '')
  @HiveField(4, defaultValue: '')
  String get itemBrand => throw _privateConstructorUsedError;
  @JsonKey(name: 'principalName', defaultValue: '')
  @HiveField(5, defaultValue: '')
  String get principalName => throw _privateConstructorUsedError;
  @JsonKey(name: 'principalCode', defaultValue: '')
  @HiveField(6, defaultValue: '')
  String get principalCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'taxClassification', defaultValue: '')
  @HiveField(7, defaultValue: '')
  String get taxClassification => throw _privateConstructorUsedError;
  @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
  @HiveField(8, defaultValue: '')
  String get itemRegistrationNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'unitOfMeasurement', defaultValue: '')
  @HiveField(9, defaultValue: '')
  String get unitOfMeasurement => throw _privateConstructorUsedError;
  @JsonKey(name: 'materialGroup2', defaultValue: '')
  @HiveField(10, defaultValue: '')
  String get materialGroup2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'materialGroup4', defaultValue: '')
  @HiveField(11, defaultValue: '')
  String get materialGroup4 => throw _privateConstructorUsedError;
  @JsonKey(name: 'isSampleMaterial', defaultValue: false)
  @HiveField(12, defaultValue: false)
  bool get isSampleMaterial => throw _privateConstructorUsedError;
  @JsonKey(name: 'hidePrice', defaultValue: false)
  @HiveField(13, defaultValue: false)
  bool get hidePrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
  @HiveField(14, defaultValue: false)
  bool get hasValidTenderContract => throw _privateConstructorUsedError;
  @JsonKey(name: 'hasMandatoryTenderContract', defaultValue: false)
  @HiveField(15, defaultValue: false)
  bool get hasMandatoryTenderContract => throw _privateConstructorUsedError;
  @JsonKey(name: 'taxes', defaultValue: ['0'], readValue: handleEmptyTaxList)
  @HiveField(16, defaultValue: ['0'])
  List<String> get taxes => throw _privateConstructorUsedError;
  @JsonKey(name: 'bundles', defaultValue: <BundleDto>[])
  @HiveField(17, defaultValue: <BundleDto>[])
  List<BundleDto> get bundles => throw _privateConstructorUsedError;
  @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
  @HiveField(18, defaultValue: '')
  String get defaultMaterialDescription => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaterialDtoCopyWith<MaterialDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialDtoCopyWith<$Res> {
  factory $MaterialDtoCopyWith(
          MaterialDto value, $Res Function(MaterialDto) then) =
      _$MaterialDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'materialNumber', defaultValue: '')
      @HiveField(0, defaultValue: '')
          String materialNumber,
      @JsonKey(name: 'materialDescription', defaultValue: '')
      @HiveField(1, defaultValue: '')
          String materialDescription,
      @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
      @HiveField(2, defaultValue: '')
          String governmentMaterialCode,
      @JsonKey(name: 'therapeuticClass', defaultValue: '')
      @HiveField(3, defaultValue: '')
          String therapeuticClass,
      @JsonKey(name: 'itemBrand', defaultValue: '')
      @HiveField(4, defaultValue: '')
          String itemBrand,
      @JsonKey(name: 'principalName', defaultValue: '')
      @HiveField(5, defaultValue: '')
          String principalName,
      @JsonKey(name: 'principalCode', defaultValue: '')
      @HiveField(6, defaultValue: '')
          String principalCode,
      @JsonKey(name: 'taxClassification', defaultValue: '')
      @HiveField(7, defaultValue: '')
          String taxClassification,
      @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
      @HiveField(8, defaultValue: '')
          String itemRegistrationNumber,
      @JsonKey(name: 'unitOfMeasurement', defaultValue: '')
      @HiveField(9, defaultValue: '')
          String unitOfMeasurement,
      @JsonKey(name: 'materialGroup2', defaultValue: '')
      @HiveField(10, defaultValue: '')
          String materialGroup2,
      @JsonKey(name: 'materialGroup4', defaultValue: '')
      @HiveField(11, defaultValue: '')
          String materialGroup4,
      @JsonKey(name: 'isSampleMaterial', defaultValue: false)
      @HiveField(12, defaultValue: false)
          bool isSampleMaterial,
      @JsonKey(name: 'hidePrice', defaultValue: false)
      @HiveField(13, defaultValue: false)
          bool hidePrice,
      @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
      @HiveField(14, defaultValue: false)
          bool hasValidTenderContract,
      @JsonKey(name: 'hasMandatoryTenderContract', defaultValue: false)
      @HiveField(15, defaultValue: false)
          bool hasMandatoryTenderContract,
      @JsonKey(
          name: 'taxes', defaultValue: ['0'], readValue: handleEmptyTaxList)
      @HiveField(16, defaultValue: ['0'])
          List<String> taxes,
      @JsonKey(name: 'bundles', defaultValue: <BundleDto>[])
      @HiveField(17, defaultValue: <BundleDto>[])
          List<BundleDto> bundles,
      @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
      @HiveField(18, defaultValue: '')
          String defaultMaterialDescription});
}

/// @nodoc
class _$MaterialDtoCopyWithImpl<$Res> implements $MaterialDtoCopyWith<$Res> {
  _$MaterialDtoCopyWithImpl(this._value, this._then);

  final MaterialDto _value;
  // ignore: unused_field
  final $Res Function(MaterialDto) _then;

  @override
  $Res call({
    Object? materialNumber = freezed,
    Object? materialDescription = freezed,
    Object? governmentMaterialCode = freezed,
    Object? therapeuticClass = freezed,
    Object? itemBrand = freezed,
    Object? principalName = freezed,
    Object? principalCode = freezed,
    Object? taxClassification = freezed,
    Object? itemRegistrationNumber = freezed,
    Object? unitOfMeasurement = freezed,
    Object? materialGroup2 = freezed,
    Object? materialGroup4 = freezed,
    Object? isSampleMaterial = freezed,
    Object? hidePrice = freezed,
    Object? hasValidTenderContract = freezed,
    Object? hasMandatoryTenderContract = freezed,
    Object? taxes = freezed,
    Object? bundles = freezed,
    Object? defaultMaterialDescription = freezed,
  }) {
    return _then(_value.copyWith(
      materialNumber: materialNumber == freezed
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      materialDescription: materialDescription == freezed
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      governmentMaterialCode: governmentMaterialCode == freezed
          ? _value.governmentMaterialCode
          : governmentMaterialCode // ignore: cast_nullable_to_non_nullable
              as String,
      therapeuticClass: therapeuticClass == freezed
          ? _value.therapeuticClass
          : therapeuticClass // ignore: cast_nullable_to_non_nullable
              as String,
      itemBrand: itemBrand == freezed
          ? _value.itemBrand
          : itemBrand // ignore: cast_nullable_to_non_nullable
              as String,
      principalName: principalName == freezed
          ? _value.principalName
          : principalName // ignore: cast_nullable_to_non_nullable
              as String,
      principalCode: principalCode == freezed
          ? _value.principalCode
          : principalCode // ignore: cast_nullable_to_non_nullable
              as String,
      taxClassification: taxClassification == freezed
          ? _value.taxClassification
          : taxClassification // ignore: cast_nullable_to_non_nullable
              as String,
      itemRegistrationNumber: itemRegistrationNumber == freezed
          ? _value.itemRegistrationNumber
          : itemRegistrationNumber // ignore: cast_nullable_to_non_nullable
              as String,
      unitOfMeasurement: unitOfMeasurement == freezed
          ? _value.unitOfMeasurement
          : unitOfMeasurement // ignore: cast_nullable_to_non_nullable
              as String,
      materialGroup2: materialGroup2 == freezed
          ? _value.materialGroup2
          : materialGroup2 // ignore: cast_nullable_to_non_nullable
              as String,
      materialGroup4: materialGroup4 == freezed
          ? _value.materialGroup4
          : materialGroup4 // ignore: cast_nullable_to_non_nullable
              as String,
      isSampleMaterial: isSampleMaterial == freezed
          ? _value.isSampleMaterial
          : isSampleMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
      hidePrice: hidePrice == freezed
          ? _value.hidePrice
          : hidePrice // ignore: cast_nullable_to_non_nullable
              as bool,
      hasValidTenderContract: hasValidTenderContract == freezed
          ? _value.hasValidTenderContract
          : hasValidTenderContract // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMandatoryTenderContract: hasMandatoryTenderContract == freezed
          ? _value.hasMandatoryTenderContract
          : hasMandatoryTenderContract // ignore: cast_nullable_to_non_nullable
              as bool,
      taxes: taxes == freezed
          ? _value.taxes
          : taxes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      bundles: bundles == freezed
          ? _value.bundles
          : bundles // ignore: cast_nullable_to_non_nullable
              as List<BundleDto>,
      defaultMaterialDescription: defaultMaterialDescription == freezed
          ? _value.defaultMaterialDescription
          : defaultMaterialDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_MaterialDtoCopyWith<$Res>
    implements $MaterialDtoCopyWith<$Res> {
  factory _$$_MaterialDtoCopyWith(
          _$_MaterialDto value, $Res Function(_$_MaterialDto) then) =
      __$$_MaterialDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'materialNumber', defaultValue: '')
      @HiveField(0, defaultValue: '')
          String materialNumber,
      @JsonKey(name: 'materialDescription', defaultValue: '')
      @HiveField(1, defaultValue: '')
          String materialDescription,
      @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
      @HiveField(2, defaultValue: '')
          String governmentMaterialCode,
      @JsonKey(name: 'therapeuticClass', defaultValue: '')
      @HiveField(3, defaultValue: '')
          String therapeuticClass,
      @JsonKey(name: 'itemBrand', defaultValue: '')
      @HiveField(4, defaultValue: '')
          String itemBrand,
      @JsonKey(name: 'principalName', defaultValue: '')
      @HiveField(5, defaultValue: '')
          String principalName,
      @JsonKey(name: 'principalCode', defaultValue: '')
      @HiveField(6, defaultValue: '')
          String principalCode,
      @JsonKey(name: 'taxClassification', defaultValue: '')
      @HiveField(7, defaultValue: '')
          String taxClassification,
      @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
      @HiveField(8, defaultValue: '')
          String itemRegistrationNumber,
      @JsonKey(name: 'unitOfMeasurement', defaultValue: '')
      @HiveField(9, defaultValue: '')
          String unitOfMeasurement,
      @JsonKey(name: 'materialGroup2', defaultValue: '')
      @HiveField(10, defaultValue: '')
          String materialGroup2,
      @JsonKey(name: 'materialGroup4', defaultValue: '')
      @HiveField(11, defaultValue: '')
          String materialGroup4,
      @JsonKey(name: 'isSampleMaterial', defaultValue: false)
      @HiveField(12, defaultValue: false)
          bool isSampleMaterial,
      @JsonKey(name: 'hidePrice', defaultValue: false)
      @HiveField(13, defaultValue: false)
          bool hidePrice,
      @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
      @HiveField(14, defaultValue: false)
          bool hasValidTenderContract,
      @JsonKey(name: 'hasMandatoryTenderContract', defaultValue: false)
      @HiveField(15, defaultValue: false)
          bool hasMandatoryTenderContract,
      @JsonKey(
          name: 'taxes', defaultValue: ['0'], readValue: handleEmptyTaxList)
      @HiveField(16, defaultValue: ['0'])
          List<String> taxes,
      @JsonKey(name: 'bundles', defaultValue: <BundleDto>[])
      @HiveField(17, defaultValue: <BundleDto>[])
          List<BundleDto> bundles,
      @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
      @HiveField(18, defaultValue: '')
          String defaultMaterialDescription});
}

/// @nodoc
class __$$_MaterialDtoCopyWithImpl<$Res> extends _$MaterialDtoCopyWithImpl<$Res>
    implements _$$_MaterialDtoCopyWith<$Res> {
  __$$_MaterialDtoCopyWithImpl(
      _$_MaterialDto _value, $Res Function(_$_MaterialDto) _then)
      : super(_value, (v) => _then(v as _$_MaterialDto));

  @override
  _$_MaterialDto get _value => super._value as _$_MaterialDto;

  @override
  $Res call({
    Object? materialNumber = freezed,
    Object? materialDescription = freezed,
    Object? governmentMaterialCode = freezed,
    Object? therapeuticClass = freezed,
    Object? itemBrand = freezed,
    Object? principalName = freezed,
    Object? principalCode = freezed,
    Object? taxClassification = freezed,
    Object? itemRegistrationNumber = freezed,
    Object? unitOfMeasurement = freezed,
    Object? materialGroup2 = freezed,
    Object? materialGroup4 = freezed,
    Object? isSampleMaterial = freezed,
    Object? hidePrice = freezed,
    Object? hasValidTenderContract = freezed,
    Object? hasMandatoryTenderContract = freezed,
    Object? taxes = freezed,
    Object? bundles = freezed,
    Object? defaultMaterialDescription = freezed,
  }) {
    return _then(_$_MaterialDto(
      materialNumber: materialNumber == freezed
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      materialDescription: materialDescription == freezed
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      governmentMaterialCode: governmentMaterialCode == freezed
          ? _value.governmentMaterialCode
          : governmentMaterialCode // ignore: cast_nullable_to_non_nullable
              as String,
      therapeuticClass: therapeuticClass == freezed
          ? _value.therapeuticClass
          : therapeuticClass // ignore: cast_nullable_to_non_nullable
              as String,
      itemBrand: itemBrand == freezed
          ? _value.itemBrand
          : itemBrand // ignore: cast_nullable_to_non_nullable
              as String,
      principalName: principalName == freezed
          ? _value.principalName
          : principalName // ignore: cast_nullable_to_non_nullable
              as String,
      principalCode: principalCode == freezed
          ? _value.principalCode
          : principalCode // ignore: cast_nullable_to_non_nullable
              as String,
      taxClassification: taxClassification == freezed
          ? _value.taxClassification
          : taxClassification // ignore: cast_nullable_to_non_nullable
              as String,
      itemRegistrationNumber: itemRegistrationNumber == freezed
          ? _value.itemRegistrationNumber
          : itemRegistrationNumber // ignore: cast_nullable_to_non_nullable
              as String,
      unitOfMeasurement: unitOfMeasurement == freezed
          ? _value.unitOfMeasurement
          : unitOfMeasurement // ignore: cast_nullable_to_non_nullable
              as String,
      materialGroup2: materialGroup2 == freezed
          ? _value.materialGroup2
          : materialGroup2 // ignore: cast_nullable_to_non_nullable
              as String,
      materialGroup4: materialGroup4 == freezed
          ? _value.materialGroup4
          : materialGroup4 // ignore: cast_nullable_to_non_nullable
              as String,
      isSampleMaterial: isSampleMaterial == freezed
          ? _value.isSampleMaterial
          : isSampleMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
      hidePrice: hidePrice == freezed
          ? _value.hidePrice
          : hidePrice // ignore: cast_nullable_to_non_nullable
              as bool,
      hasValidTenderContract: hasValidTenderContract == freezed
          ? _value.hasValidTenderContract
          : hasValidTenderContract // ignore: cast_nullable_to_non_nullable
              as bool,
      hasMandatoryTenderContract: hasMandatoryTenderContract == freezed
          ? _value.hasMandatoryTenderContract
          : hasMandatoryTenderContract // ignore: cast_nullable_to_non_nullable
              as bool,
      taxes: taxes == freezed
          ? _value._taxes
          : taxes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      bundles: bundles == freezed
          ? _value._bundles
          : bundles // ignore: cast_nullable_to_non_nullable
              as List<BundleDto>,
      defaultMaterialDescription: defaultMaterialDescription == freezed
          ? _value.defaultMaterialDescription
          : defaultMaterialDescription // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 3, adapterName: 'MaterialDtoAdapter')
class _$_MaterialDto extends _MaterialDto {
  const _$_MaterialDto(
      {@JsonKey(name: 'materialNumber', defaultValue: '')
      @HiveField(0, defaultValue: '')
          required this.materialNumber,
      @JsonKey(name: 'materialDescription', defaultValue: '')
      @HiveField(1, defaultValue: '')
          required this.materialDescription,
      @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
      @HiveField(2, defaultValue: '')
          required this.governmentMaterialCode,
      @JsonKey(name: 'therapeuticClass', defaultValue: '')
      @HiveField(3, defaultValue: '')
          required this.therapeuticClass,
      @JsonKey(name: 'itemBrand', defaultValue: '')
      @HiveField(4, defaultValue: '')
          required this.itemBrand,
      @JsonKey(name: 'principalName', defaultValue: '')
      @HiveField(5, defaultValue: '')
          required this.principalName,
      @JsonKey(name: 'principalCode', defaultValue: '')
      @HiveField(6, defaultValue: '')
          required this.principalCode,
      @JsonKey(name: 'taxClassification', defaultValue: '')
      @HiveField(7, defaultValue: '')
          required this.taxClassification,
      @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
      @HiveField(8, defaultValue: '')
          required this.itemRegistrationNumber,
      @JsonKey(name: 'unitOfMeasurement', defaultValue: '')
      @HiveField(9, defaultValue: '')
          required this.unitOfMeasurement,
      @JsonKey(name: 'materialGroup2', defaultValue: '')
      @HiveField(10, defaultValue: '')
          required this.materialGroup2,
      @JsonKey(name: 'materialGroup4', defaultValue: '')
      @HiveField(11, defaultValue: '')
          required this.materialGroup4,
      @JsonKey(name: 'isSampleMaterial', defaultValue: false)
      @HiveField(12, defaultValue: false)
          required this.isSampleMaterial,
      @JsonKey(name: 'hidePrice', defaultValue: false)
      @HiveField(13, defaultValue: false)
          required this.hidePrice,
      @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
      @HiveField(14, defaultValue: false)
          required this.hasValidTenderContract,
      @JsonKey(name: 'hasMandatoryTenderContract', defaultValue: false)
      @HiveField(15, defaultValue: false)
          required this.hasMandatoryTenderContract,
      @JsonKey(
          name: 'taxes', defaultValue: ['0'], readValue: handleEmptyTaxList)
      @HiveField(16, defaultValue: ['0'])
          required final List<String> taxes,
      @JsonKey(name: 'bundles', defaultValue: <BundleDto>[])
      @HiveField(17, defaultValue: <BundleDto>[])
          required final List<BundleDto> bundles,
      @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
      @HiveField(18, defaultValue: '')
          required this.defaultMaterialDescription})
      : _taxes = taxes,
        _bundles = bundles,
        super._();

  factory _$_MaterialDto.fromJson(Map<String, dynamic> json) =>
      _$$_MaterialDtoFromJson(json);

  @override
  @JsonKey(name: 'materialNumber', defaultValue: '')
  @HiveField(0, defaultValue: '')
  final String materialNumber;
  @override
  @JsonKey(name: 'materialDescription', defaultValue: '')
  @HiveField(1, defaultValue: '')
  final String materialDescription;
  @override
  @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
  @HiveField(2, defaultValue: '')
  final String governmentMaterialCode;
  @override
  @JsonKey(name: 'therapeuticClass', defaultValue: '')
  @HiveField(3, defaultValue: '')
  final String therapeuticClass;
  @override
  @JsonKey(name: 'itemBrand', defaultValue: '')
  @HiveField(4, defaultValue: '')
  final String itemBrand;
  @override
  @JsonKey(name: 'principalName', defaultValue: '')
  @HiveField(5, defaultValue: '')
  final String principalName;
  @override
  @JsonKey(name: 'principalCode', defaultValue: '')
  @HiveField(6, defaultValue: '')
  final String principalCode;
  @override
  @JsonKey(name: 'taxClassification', defaultValue: '')
  @HiveField(7, defaultValue: '')
  final String taxClassification;
  @override
  @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
  @HiveField(8, defaultValue: '')
  final String itemRegistrationNumber;
  @override
  @JsonKey(name: 'unitOfMeasurement', defaultValue: '')
  @HiveField(9, defaultValue: '')
  final String unitOfMeasurement;
  @override
  @JsonKey(name: 'materialGroup2', defaultValue: '')
  @HiveField(10, defaultValue: '')
  final String materialGroup2;
  @override
  @JsonKey(name: 'materialGroup4', defaultValue: '')
  @HiveField(11, defaultValue: '')
  final String materialGroup4;
  @override
  @JsonKey(name: 'isSampleMaterial', defaultValue: false)
  @HiveField(12, defaultValue: false)
  final bool isSampleMaterial;
  @override
  @JsonKey(name: 'hidePrice', defaultValue: false)
  @HiveField(13, defaultValue: false)
  final bool hidePrice;
  @override
  @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
  @HiveField(14, defaultValue: false)
  final bool hasValidTenderContract;
  @override
  @JsonKey(name: 'hasMandatoryTenderContract', defaultValue: false)
  @HiveField(15, defaultValue: false)
  final bool hasMandatoryTenderContract;
  final List<String> _taxes;
  @override
  @JsonKey(name: 'taxes', defaultValue: ['0'], readValue: handleEmptyTaxList)
  @HiveField(16, defaultValue: ['0'])
  List<String> get taxes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_taxes);
  }

  final List<BundleDto> _bundles;
  @override
  @JsonKey(name: 'bundles', defaultValue: <BundleDto>[])
  @HiveField(17, defaultValue: <BundleDto>[])
  List<BundleDto> get bundles {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bundles);
  }

  @override
  @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
  @HiveField(18, defaultValue: '')
  final String defaultMaterialDescription;

  @override
  String toString() {
    return 'MaterialDto(materialNumber: $materialNumber, materialDescription: $materialDescription, governmentMaterialCode: $governmentMaterialCode, therapeuticClass: $therapeuticClass, itemBrand: $itemBrand, principalName: $principalName, principalCode: $principalCode, taxClassification: $taxClassification, itemRegistrationNumber: $itemRegistrationNumber, unitOfMeasurement: $unitOfMeasurement, materialGroup2: $materialGroup2, materialGroup4: $materialGroup4, isSampleMaterial: $isSampleMaterial, hidePrice: $hidePrice, hasValidTenderContract: $hasValidTenderContract, hasMandatoryTenderContract: $hasMandatoryTenderContract, taxes: $taxes, bundles: $bundles, defaultMaterialDescription: $defaultMaterialDescription)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MaterialDto &&
            const DeepCollectionEquality()
                .equals(other.materialNumber, materialNumber) &&
            const DeepCollectionEquality()
                .equals(other.materialDescription, materialDescription) &&
            const DeepCollectionEquality()
                .equals(other.governmentMaterialCode, governmentMaterialCode) &&
            const DeepCollectionEquality()
                .equals(other.therapeuticClass, therapeuticClass) &&
            const DeepCollectionEquality().equals(other.itemBrand, itemBrand) &&
            const DeepCollectionEquality()
                .equals(other.principalName, principalName) &&
            const DeepCollectionEquality()
                .equals(other.principalCode, principalCode) &&
            const DeepCollectionEquality()
                .equals(other.taxClassification, taxClassification) &&
            const DeepCollectionEquality()
                .equals(other.itemRegistrationNumber, itemRegistrationNumber) &&
            const DeepCollectionEquality()
                .equals(other.unitOfMeasurement, unitOfMeasurement) &&
            const DeepCollectionEquality()
                .equals(other.materialGroup2, materialGroup2) &&
            const DeepCollectionEquality()
                .equals(other.materialGroup4, materialGroup4) &&
            const DeepCollectionEquality()
                .equals(other.isSampleMaterial, isSampleMaterial) &&
            const DeepCollectionEquality().equals(other.hidePrice, hidePrice) &&
            const DeepCollectionEquality()
                .equals(other.hasValidTenderContract, hasValidTenderContract) &&
            const DeepCollectionEquality().equals(
                other.hasMandatoryTenderContract, hasMandatoryTenderContract) &&
            const DeepCollectionEquality().equals(other._taxes, _taxes) &&
            const DeepCollectionEquality().equals(other._bundles, _bundles) &&
            const DeepCollectionEquality().equals(
                other.defaultMaterialDescription, defaultMaterialDescription));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(materialNumber),
        const DeepCollectionEquality().hash(materialDescription),
        const DeepCollectionEquality().hash(governmentMaterialCode),
        const DeepCollectionEquality().hash(therapeuticClass),
        const DeepCollectionEquality().hash(itemBrand),
        const DeepCollectionEquality().hash(principalName),
        const DeepCollectionEquality().hash(principalCode),
        const DeepCollectionEquality().hash(taxClassification),
        const DeepCollectionEquality().hash(itemRegistrationNumber),
        const DeepCollectionEquality().hash(unitOfMeasurement),
        const DeepCollectionEquality().hash(materialGroup2),
        const DeepCollectionEquality().hash(materialGroup4),
        const DeepCollectionEquality().hash(isSampleMaterial),
        const DeepCollectionEquality().hash(hidePrice),
        const DeepCollectionEquality().hash(hasValidTenderContract),
        const DeepCollectionEquality().hash(hasMandatoryTenderContract),
        const DeepCollectionEquality().hash(_taxes),
        const DeepCollectionEquality().hash(_bundles),
        const DeepCollectionEquality().hash(defaultMaterialDescription)
      ]);

  @JsonKey(ignore: true)
  @override
  _$$_MaterialDtoCopyWith<_$_MaterialDto> get copyWith =>
      __$$_MaterialDtoCopyWithImpl<_$_MaterialDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MaterialDtoToJson(
      this,
    );
  }
}

abstract class _MaterialDto extends MaterialDto {
  const factory _MaterialDto(
      {@JsonKey(name: 'materialNumber', defaultValue: '')
      @HiveField(0, defaultValue: '')
          required final String materialNumber,
      @JsonKey(name: 'materialDescription', defaultValue: '')
      @HiveField(1, defaultValue: '')
          required final String materialDescription,
      @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
      @HiveField(2, defaultValue: '')
          required final String governmentMaterialCode,
      @JsonKey(name: 'therapeuticClass', defaultValue: '')
      @HiveField(3, defaultValue: '')
          required final String therapeuticClass,
      @JsonKey(name: 'itemBrand', defaultValue: '')
      @HiveField(4, defaultValue: '')
          required final String itemBrand,
      @JsonKey(name: 'principalName', defaultValue: '')
      @HiveField(5, defaultValue: '')
          required final String principalName,
      @JsonKey(name: 'principalCode', defaultValue: '')
      @HiveField(6, defaultValue: '')
          required final String principalCode,
      @JsonKey(name: 'taxClassification', defaultValue: '')
      @HiveField(7, defaultValue: '')
          required final String taxClassification,
      @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
      @HiveField(8, defaultValue: '')
          required final String itemRegistrationNumber,
      @JsonKey(name: 'unitOfMeasurement', defaultValue: '')
      @HiveField(9, defaultValue: '')
          required final String unitOfMeasurement,
      @JsonKey(name: 'materialGroup2', defaultValue: '')
      @HiveField(10, defaultValue: '')
          required final String materialGroup2,
      @JsonKey(name: 'materialGroup4', defaultValue: '')
      @HiveField(11, defaultValue: '')
          required final String materialGroup4,
      @JsonKey(name: 'isSampleMaterial', defaultValue: false)
      @HiveField(12, defaultValue: false)
          required final bool isSampleMaterial,
      @JsonKey(name: 'hidePrice', defaultValue: false)
      @HiveField(13, defaultValue: false)
          required final bool hidePrice,
      @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
      @HiveField(14, defaultValue: false)
          required final bool hasValidTenderContract,
      @JsonKey(name: 'hasMandatoryTenderContract', defaultValue: false)
      @HiveField(15, defaultValue: false)
          required final bool hasMandatoryTenderContract,
      @JsonKey(
          name: 'taxes', defaultValue: ['0'], readValue: handleEmptyTaxList)
      @HiveField(16, defaultValue: ['0'])
          required final List<String> taxes,
      @JsonKey(name: 'bundles', defaultValue: <BundleDto>[])
      @HiveField(17, defaultValue: <BundleDto>[])
          required final List<BundleDto> bundles,
      @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
      @HiveField(18, defaultValue: '')
          required final String defaultMaterialDescription}) = _$_MaterialDto;
  const _MaterialDto._() : super._();

  factory _MaterialDto.fromJson(Map<String, dynamic> json) =
      _$_MaterialDto.fromJson;

  @override
  @JsonKey(name: 'materialNumber', defaultValue: '')
  @HiveField(0, defaultValue: '')
  String get materialNumber;
  @override
  @JsonKey(name: 'materialDescription', defaultValue: '')
  @HiveField(1, defaultValue: '')
  String get materialDescription;
  @override
  @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
  @HiveField(2, defaultValue: '')
  String get governmentMaterialCode;
  @override
  @JsonKey(name: 'therapeuticClass', defaultValue: '')
  @HiveField(3, defaultValue: '')
  String get therapeuticClass;
  @override
  @JsonKey(name: 'itemBrand', defaultValue: '')
  @HiveField(4, defaultValue: '')
  String get itemBrand;
  @override
  @JsonKey(name: 'principalName', defaultValue: '')
  @HiveField(5, defaultValue: '')
  String get principalName;
  @override
  @JsonKey(name: 'principalCode', defaultValue: '')
  @HiveField(6, defaultValue: '')
  String get principalCode;
  @override
  @JsonKey(name: 'taxClassification', defaultValue: '')
  @HiveField(7, defaultValue: '')
  String get taxClassification;
  @override
  @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
  @HiveField(8, defaultValue: '')
  String get itemRegistrationNumber;
  @override
  @JsonKey(name: 'unitOfMeasurement', defaultValue: '')
  @HiveField(9, defaultValue: '')
  String get unitOfMeasurement;
  @override
  @JsonKey(name: 'materialGroup2', defaultValue: '')
  @HiveField(10, defaultValue: '')
  String get materialGroup2;
  @override
  @JsonKey(name: 'materialGroup4', defaultValue: '')
  @HiveField(11, defaultValue: '')
  String get materialGroup4;
  @override
  @JsonKey(name: 'isSampleMaterial', defaultValue: false)
  @HiveField(12, defaultValue: false)
  bool get isSampleMaterial;
  @override
  @JsonKey(name: 'hidePrice', defaultValue: false)
  @HiveField(13, defaultValue: false)
  bool get hidePrice;
  @override
  @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
  @HiveField(14, defaultValue: false)
  bool get hasValidTenderContract;
  @override
  @JsonKey(name: 'hasMandatoryTenderContract', defaultValue: false)
  @HiveField(15, defaultValue: false)
  bool get hasMandatoryTenderContract;
  @override
  @JsonKey(name: 'taxes', defaultValue: ['0'], readValue: handleEmptyTaxList)
  @HiveField(16, defaultValue: ['0'])
  List<String> get taxes;
  @override
  @JsonKey(name: 'bundles', defaultValue: <BundleDto>[])
  @HiveField(17, defaultValue: <BundleDto>[])
  List<BundleDto> get bundles;
  @override
  @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
  @HiveField(18, defaultValue: '')
  String get defaultMaterialDescription;
  @override
  @JsonKey(ignore: true)
  _$$_MaterialDtoCopyWith<_$_MaterialDto> get copyWith =>
      throw _privateConstructorUsedError;
}

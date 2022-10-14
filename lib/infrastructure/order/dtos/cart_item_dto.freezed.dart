// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cart_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CartItemDto _$CartItemDtoFromJson(Map<String, dynamic> json) {
  return _CartItemDto.fromJson(json);
}

/// @nodoc
mixin _$CartItemDto {
  @JsonKey(name: 'materialNumber', defaultValue: '')
  String get materialNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'materialDescription', defaultValue: '')
  String get materialDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'type', defaultValue: '')
  String get materialType => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty', defaultValue: 0)
  int get materialQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'principalName', defaultValue: '')
  String get principalName => throw _privateConstructorUsedError;
  @JsonKey(name: 'taxClassification', defaultValue: '')
  String get taxClassification => throw _privateConstructorUsedError;
  @JsonKey(name: 'hidePrice', defaultValue: false)
  bool get hidePrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
  bool get hasValidTenderContract => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartItemDtoCopyWith<CartItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemDtoCopyWith<$Res> {
  factory $CartItemDtoCopyWith(
          CartItemDto value, $Res Function(CartItemDto) then) =
      _$CartItemDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'materialNumber', defaultValue: '')
          String materialNumber,
      @JsonKey(name: 'materialDescription', defaultValue: '')
          String materialDescription,
      @JsonKey(name: 'type', defaultValue: '')
          String materialType,
      @JsonKey(name: 'qty', defaultValue: 0)
          int materialQuantity,
      @JsonKey(name: 'principalName', defaultValue: '')
          String principalName,
      @JsonKey(name: 'taxClassification', defaultValue: '')
          String taxClassification,
      @JsonKey(name: 'hidePrice', defaultValue: false)
          bool hidePrice,
      @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
          bool hasValidTenderContract});
}

/// @nodoc
class _$CartItemDtoCopyWithImpl<$Res> implements $CartItemDtoCopyWith<$Res> {
  _$CartItemDtoCopyWithImpl(this._value, this._then);

  final CartItemDto _value;
  // ignore: unused_field
  final $Res Function(CartItemDto) _then;

  @override
  $Res call({
    Object? materialNumber = freezed,
    Object? materialDescription = freezed,
    Object? materialType = freezed,
    Object? materialQuantity = freezed,
    Object? principalName = freezed,
    Object? taxClassification = freezed,
    Object? hidePrice = freezed,
    Object? hasValidTenderContract = freezed,
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
      materialType: materialType == freezed
          ? _value.materialType
          : materialType // ignore: cast_nullable_to_non_nullable
              as String,
      materialQuantity: materialQuantity == freezed
          ? _value.materialQuantity
          : materialQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      principalName: principalName == freezed
          ? _value.principalName
          : principalName // ignore: cast_nullable_to_non_nullable
              as String,
      taxClassification: taxClassification == freezed
          ? _value.taxClassification
          : taxClassification // ignore: cast_nullable_to_non_nullable
              as String,
      hidePrice: hidePrice == freezed
          ? _value.hidePrice
          : hidePrice // ignore: cast_nullable_to_non_nullable
              as bool,
      hasValidTenderContract: hasValidTenderContract == freezed
          ? _value.hasValidTenderContract
          : hasValidTenderContract // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_CartItemDtoCopyWith<$Res>
    implements $CartItemDtoCopyWith<$Res> {
  factory _$$_CartItemDtoCopyWith(
          _$_CartItemDto value, $Res Function(_$_CartItemDto) then) =
      __$$_CartItemDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'materialNumber', defaultValue: '')
          String materialNumber,
      @JsonKey(name: 'materialDescription', defaultValue: '')
          String materialDescription,
      @JsonKey(name: 'type', defaultValue: '')
          String materialType,
      @JsonKey(name: 'qty', defaultValue: 0)
          int materialQuantity,
      @JsonKey(name: 'principalName', defaultValue: '')
          String principalName,
      @JsonKey(name: 'taxClassification', defaultValue: '')
          String taxClassification,
      @JsonKey(name: 'hidePrice', defaultValue: false)
          bool hidePrice,
      @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
          bool hasValidTenderContract});
}

/// @nodoc
class __$$_CartItemDtoCopyWithImpl<$Res> extends _$CartItemDtoCopyWithImpl<$Res>
    implements _$$_CartItemDtoCopyWith<$Res> {
  __$$_CartItemDtoCopyWithImpl(
      _$_CartItemDto _value, $Res Function(_$_CartItemDto) _then)
      : super(_value, (v) => _then(v as _$_CartItemDto));

  @override
  _$_CartItemDto get _value => super._value as _$_CartItemDto;

  @override
  $Res call({
    Object? materialNumber = freezed,
    Object? materialDescription = freezed,
    Object? materialType = freezed,
    Object? materialQuantity = freezed,
    Object? principalName = freezed,
    Object? taxClassification = freezed,
    Object? hidePrice = freezed,
    Object? hasValidTenderContract = freezed,
  }) {
    return _then(_$_CartItemDto(
      materialNumber: materialNumber == freezed
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      materialDescription: materialDescription == freezed
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      materialType: materialType == freezed
          ? _value.materialType
          : materialType // ignore: cast_nullable_to_non_nullable
              as String,
      materialQuantity: materialQuantity == freezed
          ? _value.materialQuantity
          : materialQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      principalName: principalName == freezed
          ? _value.principalName
          : principalName // ignore: cast_nullable_to_non_nullable
              as String,
      taxClassification: taxClassification == freezed
          ? _value.taxClassification
          : taxClassification // ignore: cast_nullable_to_non_nullable
              as String,
      hidePrice: hidePrice == freezed
          ? _value.hidePrice
          : hidePrice // ignore: cast_nullable_to_non_nullable
              as bool,
      hasValidTenderContract: hasValidTenderContract == freezed
          ? _value.hasValidTenderContract
          : hasValidTenderContract // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CartItemDto extends _CartItemDto {
  const _$_CartItemDto(
      {@JsonKey(name: 'materialNumber', defaultValue: '')
          required this.materialNumber,
      @JsonKey(name: 'materialDescription', defaultValue: '')
          required this.materialDescription,
      @JsonKey(name: 'type', defaultValue: '')
          required this.materialType,
      @JsonKey(name: 'qty', defaultValue: 0)
          required this.materialQuantity,
      @JsonKey(name: 'principalName', defaultValue: '')
          required this.principalName,
      @JsonKey(name: 'taxClassification', defaultValue: '')
          required this.taxClassification,
      @JsonKey(name: 'hidePrice', defaultValue: false)
          required this.hidePrice,
      @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
          required this.hasValidTenderContract})
      : super._();

  factory _$_CartItemDto.fromJson(Map<String, dynamic> json) =>
      _$$_CartItemDtoFromJson(json);

  @override
  @JsonKey(name: 'materialNumber', defaultValue: '')
  final String materialNumber;
  @override
  @JsonKey(name: 'materialDescription', defaultValue: '')
  final String materialDescription;
  @override
  @JsonKey(name: 'type', defaultValue: '')
  final String materialType;
  @override
  @JsonKey(name: 'qty', defaultValue: 0)
  final int materialQuantity;
  @override
  @JsonKey(name: 'principalName', defaultValue: '')
  final String principalName;
  @override
  @JsonKey(name: 'taxClassification', defaultValue: '')
  final String taxClassification;
  @override
  @JsonKey(name: 'hidePrice', defaultValue: false)
  final bool hidePrice;
  @override
  @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
  final bool hasValidTenderContract;

  @override
  String toString() {
    return 'CartItemDto(materialNumber: $materialNumber, materialDescription: $materialDescription, materialType: $materialType, materialQuantity: $materialQuantity, principalName: $principalName, taxClassification: $taxClassification, hidePrice: $hidePrice, hasValidTenderContract: $hasValidTenderContract)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CartItemDto &&
            const DeepCollectionEquality()
                .equals(other.materialNumber, materialNumber) &&
            const DeepCollectionEquality()
                .equals(other.materialDescription, materialDescription) &&
            const DeepCollectionEquality()
                .equals(other.materialType, materialType) &&
            const DeepCollectionEquality()
                .equals(other.materialQuantity, materialQuantity) &&
            const DeepCollectionEquality()
                .equals(other.principalName, principalName) &&
            const DeepCollectionEquality()
                .equals(other.taxClassification, taxClassification) &&
            const DeepCollectionEquality().equals(other.hidePrice, hidePrice) &&
            const DeepCollectionEquality()
                .equals(other.hasValidTenderContract, hasValidTenderContract));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(materialNumber),
      const DeepCollectionEquality().hash(materialDescription),
      const DeepCollectionEquality().hash(materialType),
      const DeepCollectionEquality().hash(materialQuantity),
      const DeepCollectionEquality().hash(principalName),
      const DeepCollectionEquality().hash(taxClassification),
      const DeepCollectionEquality().hash(hidePrice),
      const DeepCollectionEquality().hash(hasValidTenderContract));

  @JsonKey(ignore: true)
  @override
  _$$_CartItemDtoCopyWith<_$_CartItemDto> get copyWith =>
      __$$_CartItemDtoCopyWithImpl<_$_CartItemDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CartItemDtoToJson(
      this,
    );
  }
}

abstract class _CartItemDto extends CartItemDto {
  const factory _CartItemDto(
      {@JsonKey(name: 'materialNumber', defaultValue: '')
          required final String materialNumber,
      @JsonKey(name: 'materialDescription', defaultValue: '')
          required final String materialDescription,
      @JsonKey(name: 'type', defaultValue: '')
          required final String materialType,
      @JsonKey(name: 'qty', defaultValue: 0)
          required final int materialQuantity,
      @JsonKey(name: 'principalName', defaultValue: '')
          required final String principalName,
      @JsonKey(name: 'taxClassification', defaultValue: '')
          required final String taxClassification,
      @JsonKey(name: 'hidePrice', defaultValue: false)
          required final bool hidePrice,
      @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
          required final bool hasValidTenderContract}) = _$_CartItemDto;
  const _CartItemDto._() : super._();

  factory _CartItemDto.fromJson(Map<String, dynamic> json) =
      _$_CartItemDto.fromJson;

  @override
  @JsonKey(name: 'materialNumber', defaultValue: '')
  String get materialNumber;
  @override
  @JsonKey(name: 'materialDescription', defaultValue: '')
  String get materialDescription;
  @override
  @JsonKey(name: 'type', defaultValue: '')
  String get materialType;
  @override
  @JsonKey(name: 'qty', defaultValue: 0)
  int get materialQuantity;
  @override
  @JsonKey(name: 'principalName', defaultValue: '')
  String get principalName;
  @override
  @JsonKey(name: 'taxClassification', defaultValue: '')
  String get taxClassification;
  @override
  @JsonKey(name: 'hidePrice', defaultValue: false)
  bool get hidePrice;
  @override
  @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
  bool get hasValidTenderContract;
  @override
  @JsonKey(ignore: true)
  _$$_CartItemDtoCopyWith<_$_CartItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

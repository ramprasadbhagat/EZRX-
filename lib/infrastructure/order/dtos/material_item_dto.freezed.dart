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
  @JsonKey(name: 'overridenPrice', defaultValue: 0)
  double get overridenPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'unitOfMeasurement', defaultValue: '')
  String get unitOfMeasurement => throw _privateConstructorUsedError;
  @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
  String get itemRegistrationNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
  String get materialDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'type', defaultValue: '')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'comment', defaultValue: '')
  String get comment => throw _privateConstructorUsedError;
  @JsonKey(name: 'batchNumber', defaultValue: '')
  String get batchNumber => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'zdp8Override',
      defaultValue: false,
      readValue: boolStringFormatCheck)
  bool get zdp8Override => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaterialItemDtoCopyWith<MaterialItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialItemDtoCopyWith<$Res> {
  factory $MaterialItemDtoCopyWith(
          MaterialItemDto value, $Res Function(MaterialItemDto) then) =
      _$MaterialItemDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'qty', defaultValue: 0)
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
      @JsonKey(name: 'overridenPrice', defaultValue: 0)
          double overridenPrice,
      @JsonKey(name: 'unitOfMeasurement', defaultValue: '')
          String unitOfMeasurement,
      @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
          String itemRegistrationNumber,
      @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
          String materialDescription,
      @JsonKey(name: 'type', defaultValue: '')
          String type,
      @JsonKey(name: 'comment', defaultValue: '')
          String comment,
      @JsonKey(name: 'batchNumber', defaultValue: '')
          String batchNumber,
      @JsonKey(name: 'zdp8Override', defaultValue: false, readValue: boolStringFormatCheck)
          bool zdp8Override});
}

/// @nodoc
class _$MaterialItemDtoCopyWithImpl<$Res>
    implements $MaterialItemDtoCopyWith<$Res> {
  _$MaterialItemDtoCopyWithImpl(this._value, this._then);

  final MaterialItemDto _value;
  // ignore: unused_field
  final $Res Function(MaterialItemDto) _then;

  @override
  $Res call({
    Object? qty = freezed,
    Object? hidePrice = freezed,
    Object? bonuses = freezed,
    Object? materialGroup2 = freezed,
    Object? materialGroup4 = freezed,
    Object? materialNumber = freezed,
    Object? overridenPrice = freezed,
    Object? unitOfMeasurement = freezed,
    Object? itemRegistrationNumber = freezed,
    Object? materialDescription = freezed,
    Object? type = freezed,
    Object? comment = freezed,
    Object? batchNumber = freezed,
    Object? zdp8Override = freezed,
  }) {
    return _then(_value.copyWith(
      qty: qty == freezed
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      hidePrice: hidePrice == freezed
          ? _value.hidePrice
          : hidePrice // ignore: cast_nullable_to_non_nullable
              as bool,
      bonuses: bonuses == freezed
          ? _value.bonuses
          : bonuses // ignore: cast_nullable_to_non_nullable
              as List<MaterialItemBonusDto>,
      materialGroup2: materialGroup2 == freezed
          ? _value.materialGroup2
          : materialGroup2 // ignore: cast_nullable_to_non_nullable
              as String,
      materialGroup4: materialGroup4 == freezed
          ? _value.materialGroup4
          : materialGroup4 // ignore: cast_nullable_to_non_nullable
              as String,
      materialNumber: materialNumber == freezed
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      overridenPrice: overridenPrice == freezed
          ? _value.overridenPrice
          : overridenPrice // ignore: cast_nullable_to_non_nullable
              as double,
      unitOfMeasurement: unitOfMeasurement == freezed
          ? _value.unitOfMeasurement
          : unitOfMeasurement // ignore: cast_nullable_to_non_nullable
              as String,
      itemRegistrationNumber: itemRegistrationNumber == freezed
          ? _value.itemRegistrationNumber
          : itemRegistrationNumber // ignore: cast_nullable_to_non_nullable
              as String,
      materialDescription: materialDescription == freezed
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      batchNumber: batchNumber == freezed
          ? _value.batchNumber
          : batchNumber // ignore: cast_nullable_to_non_nullable
              as String,
      zdp8Override: zdp8Override == freezed
          ? _value.zdp8Override
          : zdp8Override // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_MaterialItemDtoCopyWith<$Res>
    implements $MaterialItemDtoCopyWith<$Res> {
  factory _$$_MaterialItemDtoCopyWith(
          _$_MaterialItemDto value, $Res Function(_$_MaterialItemDto) then) =
      __$$_MaterialItemDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'qty', defaultValue: 0)
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
      @JsonKey(name: 'overridenPrice', defaultValue: 0)
          double overridenPrice,
      @JsonKey(name: 'unitOfMeasurement', defaultValue: '')
          String unitOfMeasurement,
      @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
          String itemRegistrationNumber,
      @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
          String materialDescription,
      @JsonKey(name: 'type', defaultValue: '')
          String type,
      @JsonKey(name: 'comment', defaultValue: '')
          String comment,
      @JsonKey(name: 'batchNumber', defaultValue: '')
          String batchNumber,
      @JsonKey(name: 'zdp8Override', defaultValue: false, readValue: boolStringFormatCheck)
          bool zdp8Override});
}

/// @nodoc
class __$$_MaterialItemDtoCopyWithImpl<$Res>
    extends _$MaterialItemDtoCopyWithImpl<$Res>
    implements _$$_MaterialItemDtoCopyWith<$Res> {
  __$$_MaterialItemDtoCopyWithImpl(
      _$_MaterialItemDto _value, $Res Function(_$_MaterialItemDto) _then)
      : super(_value, (v) => _then(v as _$_MaterialItemDto));

  @override
  _$_MaterialItemDto get _value => super._value as _$_MaterialItemDto;

  @override
  $Res call({
    Object? qty = freezed,
    Object? hidePrice = freezed,
    Object? bonuses = freezed,
    Object? materialGroup2 = freezed,
    Object? materialGroup4 = freezed,
    Object? materialNumber = freezed,
    Object? overridenPrice = freezed,
    Object? unitOfMeasurement = freezed,
    Object? itemRegistrationNumber = freezed,
    Object? materialDescription = freezed,
    Object? type = freezed,
    Object? comment = freezed,
    Object? batchNumber = freezed,
    Object? zdp8Override = freezed,
  }) {
    return _then(_$_MaterialItemDto(
      qty: qty == freezed
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      hidePrice: hidePrice == freezed
          ? _value.hidePrice
          : hidePrice // ignore: cast_nullable_to_non_nullable
              as bool,
      bonuses: bonuses == freezed
          ? _value._bonuses
          : bonuses // ignore: cast_nullable_to_non_nullable
              as List<MaterialItemBonusDto>,
      materialGroup2: materialGroup2 == freezed
          ? _value.materialGroup2
          : materialGroup2 // ignore: cast_nullable_to_non_nullable
              as String,
      materialGroup4: materialGroup4 == freezed
          ? _value.materialGroup4
          : materialGroup4 // ignore: cast_nullable_to_non_nullable
              as String,
      materialNumber: materialNumber == freezed
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      overridenPrice: overridenPrice == freezed
          ? _value.overridenPrice
          : overridenPrice // ignore: cast_nullable_to_non_nullable
              as double,
      unitOfMeasurement: unitOfMeasurement == freezed
          ? _value.unitOfMeasurement
          : unitOfMeasurement // ignore: cast_nullable_to_non_nullable
              as String,
      itemRegistrationNumber: itemRegistrationNumber == freezed
          ? _value.itemRegistrationNumber
          : itemRegistrationNumber // ignore: cast_nullable_to_non_nullable
              as String,
      materialDescription: materialDescription == freezed
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      batchNumber: batchNumber == freezed
          ? _value.batchNumber
          : batchNumber // ignore: cast_nullable_to_non_nullable
              as String,
      zdp8Override: zdp8Override == freezed
          ? _value.zdp8Override
          : zdp8Override // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MaterialItemDto extends _MaterialItemDto {
  const _$_MaterialItemDto(
      {@JsonKey(name: 'qty', defaultValue: 0)
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
      @JsonKey(name: 'overridenPrice', defaultValue: 0)
          required this.overridenPrice,
      @JsonKey(name: 'unitOfMeasurement', defaultValue: '')
          required this.unitOfMeasurement,
      @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
          required this.itemRegistrationNumber,
      @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
          required this.materialDescription,
      @JsonKey(name: 'type', defaultValue: '')
          required this.type,
      @JsonKey(name: 'comment', defaultValue: '')
          required this.comment,
      @JsonKey(name: 'batchNumber', defaultValue: '')
          required this.batchNumber,
      @JsonKey(name: 'zdp8Override', defaultValue: false, readValue: boolStringFormatCheck)
          required this.zdp8Override})
      : _bonuses = bonuses,
        super._();

  factory _$_MaterialItemDto.fromJson(Map<String, dynamic> json) =>
      _$$_MaterialItemDtoFromJson(json);

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
  @JsonKey(name: 'overridenPrice', defaultValue: 0)
  final double overridenPrice;
  @override
  @JsonKey(name: 'unitOfMeasurement', defaultValue: '')
  final String unitOfMeasurement;
  @override
  @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
  final String itemRegistrationNumber;
  @override
  @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
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
  @JsonKey(
      name: 'zdp8Override',
      defaultValue: false,
      readValue: boolStringFormatCheck)
  final bool zdp8Override;

  @override
  String toString() {
    return 'MaterialItemDto(qty: $qty, hidePrice: $hidePrice, bonuses: $bonuses, materialGroup2: $materialGroup2, materialGroup4: $materialGroup4, materialNumber: $materialNumber, overridenPrice: $overridenPrice, unitOfMeasurement: $unitOfMeasurement, itemRegistrationNumber: $itemRegistrationNumber, materialDescription: $materialDescription, type: $type, comment: $comment, batchNumber: $batchNumber, zdp8Override: $zdp8Override)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MaterialItemDto &&
            const DeepCollectionEquality().equals(other.qty, qty) &&
            const DeepCollectionEquality().equals(other.hidePrice, hidePrice) &&
            const DeepCollectionEquality().equals(other._bonuses, _bonuses) &&
            const DeepCollectionEquality()
                .equals(other.materialGroup2, materialGroup2) &&
            const DeepCollectionEquality()
                .equals(other.materialGroup4, materialGroup4) &&
            const DeepCollectionEquality()
                .equals(other.materialNumber, materialNumber) &&
            const DeepCollectionEquality()
                .equals(other.overridenPrice, overridenPrice) &&
            const DeepCollectionEquality()
                .equals(other.unitOfMeasurement, unitOfMeasurement) &&
            const DeepCollectionEquality()
                .equals(other.itemRegistrationNumber, itemRegistrationNumber) &&
            const DeepCollectionEquality()
                .equals(other.materialDescription, materialDescription) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.comment, comment) &&
            const DeepCollectionEquality()
                .equals(other.batchNumber, batchNumber) &&
            const DeepCollectionEquality()
                .equals(other.zdp8Override, zdp8Override));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(qty),
      const DeepCollectionEquality().hash(hidePrice),
      const DeepCollectionEquality().hash(_bonuses),
      const DeepCollectionEquality().hash(materialGroup2),
      const DeepCollectionEquality().hash(materialGroup4),
      const DeepCollectionEquality().hash(materialNumber),
      const DeepCollectionEquality().hash(overridenPrice),
      const DeepCollectionEquality().hash(unitOfMeasurement),
      const DeepCollectionEquality().hash(itemRegistrationNumber),
      const DeepCollectionEquality().hash(materialDescription),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(comment),
      const DeepCollectionEquality().hash(batchNumber),
      const DeepCollectionEquality().hash(zdp8Override));

  @JsonKey(ignore: true)
  @override
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
      {@JsonKey(name: 'qty', defaultValue: 0)
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
      @JsonKey(name: 'overridenPrice', defaultValue: 0)
          required final double overridenPrice,
      @JsonKey(name: 'unitOfMeasurement', defaultValue: '')
          required final String unitOfMeasurement,
      @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
          required final String itemRegistrationNumber,
      @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
          required final String materialDescription,
      @JsonKey(name: 'type', defaultValue: '')
          required final String type,
      @JsonKey(name: 'comment', defaultValue: '')
          required final String comment,
      @JsonKey(name: 'batchNumber', defaultValue: '')
          required final String batchNumber,
      @JsonKey(name: 'zdp8Override', defaultValue: false, readValue: boolStringFormatCheck)
          required final bool zdp8Override}) = _$_MaterialItemDto;
  const _MaterialItemDto._() : super._();

  factory _MaterialItemDto.fromJson(Map<String, dynamic> json) =
      _$_MaterialItemDto.fromJson;

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
  @JsonKey(name: 'overridenPrice', defaultValue: 0)
  double get overridenPrice;
  @override
  @JsonKey(name: 'unitOfMeasurement', defaultValue: '')
  String get unitOfMeasurement;
  @override
  @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
  String get itemRegistrationNumber;
  @override
  @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
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
  @JsonKey(
      name: 'zdp8Override',
      defaultValue: false,
      readValue: boolStringFormatCheck)
  bool get zdp8Override;
  @override
  @JsonKey(ignore: true)
  _$$_MaterialItemDtoCopyWith<_$_MaterialItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

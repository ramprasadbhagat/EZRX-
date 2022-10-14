// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'price_bonus_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PriceBonusDto _$PriceBonusDtoFromJson(Map<String, dynamic> json) {
  return _PriceBonusDto.fromJson(json);
}

/// @nodoc
mixin _$PriceBonusDto {
  @JsonKey(name: 'Calculation', defaultValue: '')
  String get calculation => throw _privateConstructorUsedError;
  @JsonKey(name: 'QualifyingQuantity', defaultValue: 0)
  int get qualifyingQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'BonusMaterial', defaultValue: <PriceBonusItemDto>[])
  List<PriceBonusItemDto> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PriceBonusDtoCopyWith<PriceBonusDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceBonusDtoCopyWith<$Res> {
  factory $PriceBonusDtoCopyWith(
          PriceBonusDto value, $Res Function(PriceBonusDto) then) =
      _$PriceBonusDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'Calculation', defaultValue: '')
          String calculation,
      @JsonKey(name: 'QualifyingQuantity', defaultValue: 0)
          int qualifyingQuantity,
      @JsonKey(name: 'BonusMaterial', defaultValue: <PriceBonusItemDto>[])
          List<PriceBonusItemDto> items});
}

/// @nodoc
class _$PriceBonusDtoCopyWithImpl<$Res>
    implements $PriceBonusDtoCopyWith<$Res> {
  _$PriceBonusDtoCopyWithImpl(this._value, this._then);

  final PriceBonusDto _value;
  // ignore: unused_field
  final $Res Function(PriceBonusDto) _then;

  @override
  $Res call({
    Object? calculation = freezed,
    Object? qualifyingQuantity = freezed,
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      calculation: calculation == freezed
          ? _value.calculation
          : calculation // ignore: cast_nullable_to_non_nullable
              as String,
      qualifyingQuantity: qualifyingQuantity == freezed
          ? _value.qualifyingQuantity
          : qualifyingQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PriceBonusItemDto>,
    ));
  }
}

/// @nodoc
abstract class _$$_PriceBonusDtoCopyWith<$Res>
    implements $PriceBonusDtoCopyWith<$Res> {
  factory _$$_PriceBonusDtoCopyWith(
          _$_PriceBonusDto value, $Res Function(_$_PriceBonusDto) then) =
      __$$_PriceBonusDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'Calculation', defaultValue: '')
          String calculation,
      @JsonKey(name: 'QualifyingQuantity', defaultValue: 0)
          int qualifyingQuantity,
      @JsonKey(name: 'BonusMaterial', defaultValue: <PriceBonusItemDto>[])
          List<PriceBonusItemDto> items});
}

/// @nodoc
class __$$_PriceBonusDtoCopyWithImpl<$Res>
    extends _$PriceBonusDtoCopyWithImpl<$Res>
    implements _$$_PriceBonusDtoCopyWith<$Res> {
  __$$_PriceBonusDtoCopyWithImpl(
      _$_PriceBonusDto _value, $Res Function(_$_PriceBonusDto) _then)
      : super(_value, (v) => _then(v as _$_PriceBonusDto));

  @override
  _$_PriceBonusDto get _value => super._value as _$_PriceBonusDto;

  @override
  $Res call({
    Object? calculation = freezed,
    Object? qualifyingQuantity = freezed,
    Object? items = freezed,
  }) {
    return _then(_$_PriceBonusDto(
      calculation: calculation == freezed
          ? _value.calculation
          : calculation // ignore: cast_nullable_to_non_nullable
              as String,
      qualifyingQuantity: qualifyingQuantity == freezed
          ? _value.qualifyingQuantity
          : qualifyingQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      items: items == freezed
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PriceBonusItemDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PriceBonusDto extends _PriceBonusDto {
  const _$_PriceBonusDto(
      {@JsonKey(name: 'Calculation', defaultValue: '')
          required this.calculation,
      @JsonKey(name: 'QualifyingQuantity', defaultValue: 0)
          required this.qualifyingQuantity,
      @JsonKey(name: 'BonusMaterial', defaultValue: <PriceBonusItemDto>[])
          required final List<PriceBonusItemDto> items})
      : _items = items,
        super._();

  factory _$_PriceBonusDto.fromJson(Map<String, dynamic> json) =>
      _$$_PriceBonusDtoFromJson(json);

  @override
  @JsonKey(name: 'Calculation', defaultValue: '')
  final String calculation;
  @override
  @JsonKey(name: 'QualifyingQuantity', defaultValue: 0)
  final int qualifyingQuantity;
  final List<PriceBonusItemDto> _items;
  @override
  @JsonKey(name: 'BonusMaterial', defaultValue: <PriceBonusItemDto>[])
  List<PriceBonusItemDto> get items {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'PriceBonusDto(calculation: $calculation, qualifyingQuantity: $qualifyingQuantity, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PriceBonusDto &&
            const DeepCollectionEquality()
                .equals(other.calculation, calculation) &&
            const DeepCollectionEquality()
                .equals(other.qualifyingQuantity, qualifyingQuantity) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(calculation),
      const DeepCollectionEquality().hash(qualifyingQuantity),
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  _$$_PriceBonusDtoCopyWith<_$_PriceBonusDto> get copyWith =>
      __$$_PriceBonusDtoCopyWithImpl<_$_PriceBonusDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PriceBonusDtoToJson(
      this,
    );
  }
}

abstract class _PriceBonusDto extends PriceBonusDto {
  const factory _PriceBonusDto(
      {@JsonKey(name: 'Calculation', defaultValue: '')
          required final String calculation,
      @JsonKey(name: 'QualifyingQuantity', defaultValue: 0)
          required final int qualifyingQuantity,
      @JsonKey(name: 'BonusMaterial', defaultValue: <PriceBonusItemDto>[])
          required final List<PriceBonusItemDto> items}) = _$_PriceBonusDto;
  const _PriceBonusDto._() : super._();

  factory _PriceBonusDto.fromJson(Map<String, dynamic> json) =
      _$_PriceBonusDto.fromJson;

  @override
  @JsonKey(name: 'Calculation', defaultValue: '')
  String get calculation;
  @override
  @JsonKey(name: 'QualifyingQuantity', defaultValue: 0)
  int get qualifyingQuantity;
  @override
  @JsonKey(name: 'BonusMaterial', defaultValue: <PriceBonusItemDto>[])
  List<PriceBonusItemDto> get items;
  @override
  @JsonKey(ignore: true)
  _$$_PriceBonusDtoCopyWith<_$_PriceBonusDto> get copyWith =>
      throw _privateConstructorUsedError;
}

PriceBonusItemDto _$PriceBonusItemDtoFromJson(Map<String, dynamic> json) {
  return _PriceBonusItemDto.fromJson(json);
}

/// @nodoc
mixin _$PriceBonusItemDto {
  @JsonKey(name: 'MaterialNumber', defaultValue: '')
  String get materialNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'MaterialDescription', defaultValue: '')
  String get materialDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'Calculation', defaultValue: '')
  String get calculation => throw _privateConstructorUsedError;
  @JsonKey(name: 'BonusRatio', defaultValue: 0)
  int get bonusRatio => throw _privateConstructorUsedError;
  @JsonKey(name: 'QualifyingQuantity', defaultValue: 0)
  int get qualifyingQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'BonusQuantity', defaultValue: 0)
  int get bonusQuantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PriceBonusItemDtoCopyWith<PriceBonusItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceBonusItemDtoCopyWith<$Res> {
  factory $PriceBonusItemDtoCopyWith(
          PriceBonusItemDto value, $Res Function(PriceBonusItemDto) then) =
      _$PriceBonusItemDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'MaterialNumber', defaultValue: '')
          String materialNumber,
      @JsonKey(name: 'MaterialDescription', defaultValue: '')
          String materialDescription,
      @JsonKey(name: 'Calculation', defaultValue: '')
          String calculation,
      @JsonKey(name: 'BonusRatio', defaultValue: 0)
          int bonusRatio,
      @JsonKey(name: 'QualifyingQuantity', defaultValue: 0)
          int qualifyingQuantity,
      @JsonKey(name: 'BonusQuantity', defaultValue: 0)
          int bonusQuantity});
}

/// @nodoc
class _$PriceBonusItemDtoCopyWithImpl<$Res>
    implements $PriceBonusItemDtoCopyWith<$Res> {
  _$PriceBonusItemDtoCopyWithImpl(this._value, this._then);

  final PriceBonusItemDto _value;
  // ignore: unused_field
  final $Res Function(PriceBonusItemDto) _then;

  @override
  $Res call({
    Object? materialNumber = freezed,
    Object? materialDescription = freezed,
    Object? calculation = freezed,
    Object? bonusRatio = freezed,
    Object? qualifyingQuantity = freezed,
    Object? bonusQuantity = freezed,
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
      calculation: calculation == freezed
          ? _value.calculation
          : calculation // ignore: cast_nullable_to_non_nullable
              as String,
      bonusRatio: bonusRatio == freezed
          ? _value.bonusRatio
          : bonusRatio // ignore: cast_nullable_to_non_nullable
              as int,
      qualifyingQuantity: qualifyingQuantity == freezed
          ? _value.qualifyingQuantity
          : qualifyingQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      bonusQuantity: bonusQuantity == freezed
          ? _value.bonusQuantity
          : bonusQuantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_PriceBonusItemDtoCopyWith<$Res>
    implements $PriceBonusItemDtoCopyWith<$Res> {
  factory _$$_PriceBonusItemDtoCopyWith(_$_PriceBonusItemDto value,
          $Res Function(_$_PriceBonusItemDto) then) =
      __$$_PriceBonusItemDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'MaterialNumber', defaultValue: '')
          String materialNumber,
      @JsonKey(name: 'MaterialDescription', defaultValue: '')
          String materialDescription,
      @JsonKey(name: 'Calculation', defaultValue: '')
          String calculation,
      @JsonKey(name: 'BonusRatio', defaultValue: 0)
          int bonusRatio,
      @JsonKey(name: 'QualifyingQuantity', defaultValue: 0)
          int qualifyingQuantity,
      @JsonKey(name: 'BonusQuantity', defaultValue: 0)
          int bonusQuantity});
}

/// @nodoc
class __$$_PriceBonusItemDtoCopyWithImpl<$Res>
    extends _$PriceBonusItemDtoCopyWithImpl<$Res>
    implements _$$_PriceBonusItemDtoCopyWith<$Res> {
  __$$_PriceBonusItemDtoCopyWithImpl(
      _$_PriceBonusItemDto _value, $Res Function(_$_PriceBonusItemDto) _then)
      : super(_value, (v) => _then(v as _$_PriceBonusItemDto));

  @override
  _$_PriceBonusItemDto get _value => super._value as _$_PriceBonusItemDto;

  @override
  $Res call({
    Object? materialNumber = freezed,
    Object? materialDescription = freezed,
    Object? calculation = freezed,
    Object? bonusRatio = freezed,
    Object? qualifyingQuantity = freezed,
    Object? bonusQuantity = freezed,
  }) {
    return _then(_$_PriceBonusItemDto(
      materialNumber: materialNumber == freezed
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      materialDescription: materialDescription == freezed
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      calculation: calculation == freezed
          ? _value.calculation
          : calculation // ignore: cast_nullable_to_non_nullable
              as String,
      bonusRatio: bonusRatio == freezed
          ? _value.bonusRatio
          : bonusRatio // ignore: cast_nullable_to_non_nullable
              as int,
      qualifyingQuantity: qualifyingQuantity == freezed
          ? _value.qualifyingQuantity
          : qualifyingQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      bonusQuantity: bonusQuantity == freezed
          ? _value.bonusQuantity
          : bonusQuantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PriceBonusItemDto extends _PriceBonusItemDto {
  const _$_PriceBonusItemDto(
      {@JsonKey(name: 'MaterialNumber', defaultValue: '')
          required this.materialNumber,
      @JsonKey(name: 'MaterialDescription', defaultValue: '')
          required this.materialDescription,
      @JsonKey(name: 'Calculation', defaultValue: '')
          required this.calculation,
      @JsonKey(name: 'BonusRatio', defaultValue: 0)
          required this.bonusRatio,
      @JsonKey(name: 'QualifyingQuantity', defaultValue: 0)
          required this.qualifyingQuantity,
      @JsonKey(name: 'BonusQuantity', defaultValue: 0)
          required this.bonusQuantity})
      : super._();

  factory _$_PriceBonusItemDto.fromJson(Map<String, dynamic> json) =>
      _$$_PriceBonusItemDtoFromJson(json);

  @override
  @JsonKey(name: 'MaterialNumber', defaultValue: '')
  final String materialNumber;
  @override
  @JsonKey(name: 'MaterialDescription', defaultValue: '')
  final String materialDescription;
  @override
  @JsonKey(name: 'Calculation', defaultValue: '')
  final String calculation;
  @override
  @JsonKey(name: 'BonusRatio', defaultValue: 0)
  final int bonusRatio;
  @override
  @JsonKey(name: 'QualifyingQuantity', defaultValue: 0)
  final int qualifyingQuantity;
  @override
  @JsonKey(name: 'BonusQuantity', defaultValue: 0)
  final int bonusQuantity;

  @override
  String toString() {
    return 'PriceBonusItemDto(materialNumber: $materialNumber, materialDescription: $materialDescription, calculation: $calculation, bonusRatio: $bonusRatio, qualifyingQuantity: $qualifyingQuantity, bonusQuantity: $bonusQuantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PriceBonusItemDto &&
            const DeepCollectionEquality()
                .equals(other.materialNumber, materialNumber) &&
            const DeepCollectionEquality()
                .equals(other.materialDescription, materialDescription) &&
            const DeepCollectionEquality()
                .equals(other.calculation, calculation) &&
            const DeepCollectionEquality()
                .equals(other.bonusRatio, bonusRatio) &&
            const DeepCollectionEquality()
                .equals(other.qualifyingQuantity, qualifyingQuantity) &&
            const DeepCollectionEquality()
                .equals(other.bonusQuantity, bonusQuantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(materialNumber),
      const DeepCollectionEquality().hash(materialDescription),
      const DeepCollectionEquality().hash(calculation),
      const DeepCollectionEquality().hash(bonusRatio),
      const DeepCollectionEquality().hash(qualifyingQuantity),
      const DeepCollectionEquality().hash(bonusQuantity));

  @JsonKey(ignore: true)
  @override
  _$$_PriceBonusItemDtoCopyWith<_$_PriceBonusItemDto> get copyWith =>
      __$$_PriceBonusItemDtoCopyWithImpl<_$_PriceBonusItemDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PriceBonusItemDtoToJson(
      this,
    );
  }
}

abstract class _PriceBonusItemDto extends PriceBonusItemDto {
  const factory _PriceBonusItemDto(
      {@JsonKey(name: 'MaterialNumber', defaultValue: '')
          required final String materialNumber,
      @JsonKey(name: 'MaterialDescription', defaultValue: '')
          required final String materialDescription,
      @JsonKey(name: 'Calculation', defaultValue: '')
          required final String calculation,
      @JsonKey(name: 'BonusRatio', defaultValue: 0)
          required final int bonusRatio,
      @JsonKey(name: 'QualifyingQuantity', defaultValue: 0)
          required final int qualifyingQuantity,
      @JsonKey(name: 'BonusQuantity', defaultValue: 0)
          required final int bonusQuantity}) = _$_PriceBonusItemDto;
  const _PriceBonusItemDto._() : super._();

  factory _PriceBonusItemDto.fromJson(Map<String, dynamic> json) =
      _$_PriceBonusItemDto.fromJson;

  @override
  @JsonKey(name: 'MaterialNumber', defaultValue: '')
  String get materialNumber;
  @override
  @JsonKey(name: 'MaterialDescription', defaultValue: '')
  String get materialDescription;
  @override
  @JsonKey(name: 'Calculation', defaultValue: '')
  String get calculation;
  @override
  @JsonKey(name: 'BonusRatio', defaultValue: 0)
  int get bonusRatio;
  @override
  @JsonKey(name: 'QualifyingQuantity', defaultValue: 0)
  int get qualifyingQuantity;
  @override
  @JsonKey(name: 'BonusQuantity', defaultValue: 0)
  int get bonusQuantity;
  @override
  @JsonKey(ignore: true)
  _$$_PriceBonusItemDtoCopyWith<_$_PriceBonusItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

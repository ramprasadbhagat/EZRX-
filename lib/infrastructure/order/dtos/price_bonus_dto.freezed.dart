// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  @JsonKey(name: 'BonusTiers', defaultValue: <PriceBonusItemDto>[])
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
      _$PriceBonusDtoCopyWithImpl<$Res, PriceBonusDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'BonusTiers', defaultValue: <PriceBonusItemDto>[])
      List<PriceBonusItemDto> items});
}

/// @nodoc
class _$PriceBonusDtoCopyWithImpl<$Res, $Val extends PriceBonusDto>
    implements $PriceBonusDtoCopyWith<$Res> {
  _$PriceBonusDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PriceBonusItemDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PriceBonusDtoCopyWith<$Res>
    implements $PriceBonusDtoCopyWith<$Res> {
  factory _$$_PriceBonusDtoCopyWith(
          _$_PriceBonusDto value, $Res Function(_$_PriceBonusDto) then) =
      __$$_PriceBonusDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'BonusTiers', defaultValue: <PriceBonusItemDto>[])
      List<PriceBonusItemDto> items});
}

/// @nodoc
class __$$_PriceBonusDtoCopyWithImpl<$Res>
    extends _$PriceBonusDtoCopyWithImpl<$Res, _$_PriceBonusDto>
    implements _$$_PriceBonusDtoCopyWith<$Res> {
  __$$_PriceBonusDtoCopyWithImpl(
      _$_PriceBonusDto _value, $Res Function(_$_PriceBonusDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
  }) {
    return _then(_$_PriceBonusDto(
      items: null == items
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
      {@JsonKey(name: 'BonusTiers', defaultValue: <PriceBonusItemDto>[])
      required final List<PriceBonusItemDto> items})
      : _items = items,
        super._();

  factory _$_PriceBonusDto.fromJson(Map<String, dynamic> json) =>
      _$$_PriceBonusDtoFromJson(json);

  final List<PriceBonusItemDto> _items;
  @override
  @JsonKey(name: 'BonusTiers', defaultValue: <PriceBonusItemDto>[])
  List<PriceBonusItemDto> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'PriceBonusDto(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PriceBonusDto &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
      {@JsonKey(name: 'BonusTiers', defaultValue: <PriceBonusItemDto>[])
      required final List<PriceBonusItemDto> items}) = _$_PriceBonusDto;
  const _PriceBonusDto._() : super._();

  factory _PriceBonusDto.fromJson(Map<String, dynamic> json) =
      _$_PriceBonusDto.fromJson;

  @override
  @JsonKey(name: 'BonusTiers', defaultValue: <PriceBonusItemDto>[])
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
  @JsonKey(name: 'Calculation', defaultValue: '')
  String get calculation => throw _privateConstructorUsedError;
  @JsonKey(name: 'QualifyingQuantity', defaultValue: 0)
  int get qualifyingQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'BonusMaterial', defaultValue: <BonusMaterialDto>[])
  List<BonusMaterialDto> get bonusMaterials =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PriceBonusItemDtoCopyWith<PriceBonusItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceBonusItemDtoCopyWith<$Res> {
  factory $PriceBonusItemDtoCopyWith(
          PriceBonusItemDto value, $Res Function(PriceBonusItemDto) then) =
      _$PriceBonusItemDtoCopyWithImpl<$Res, PriceBonusItemDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Calculation', defaultValue: '') String calculation,
      @JsonKey(name: 'QualifyingQuantity', defaultValue: 0)
      int qualifyingQuantity,
      @JsonKey(name: 'BonusMaterial', defaultValue: <BonusMaterialDto>[])
      List<BonusMaterialDto> bonusMaterials});
}

/// @nodoc
class _$PriceBonusItemDtoCopyWithImpl<$Res, $Val extends PriceBonusItemDto>
    implements $PriceBonusItemDtoCopyWith<$Res> {
  _$PriceBonusItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? calculation = null,
    Object? qualifyingQuantity = null,
    Object? bonusMaterials = null,
  }) {
    return _then(_value.copyWith(
      calculation: null == calculation
          ? _value.calculation
          : calculation // ignore: cast_nullable_to_non_nullable
              as String,
      qualifyingQuantity: null == qualifyingQuantity
          ? _value.qualifyingQuantity
          : qualifyingQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      bonusMaterials: null == bonusMaterials
          ? _value.bonusMaterials
          : bonusMaterials // ignore: cast_nullable_to_non_nullable
              as List<BonusMaterialDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PriceBonusItemDtoCopyWith<$Res>
    implements $PriceBonusItemDtoCopyWith<$Res> {
  factory _$$_PriceBonusItemDtoCopyWith(_$_PriceBonusItemDto value,
          $Res Function(_$_PriceBonusItemDto) then) =
      __$$_PriceBonusItemDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Calculation', defaultValue: '') String calculation,
      @JsonKey(name: 'QualifyingQuantity', defaultValue: 0)
      int qualifyingQuantity,
      @JsonKey(name: 'BonusMaterial', defaultValue: <BonusMaterialDto>[])
      List<BonusMaterialDto> bonusMaterials});
}

/// @nodoc
class __$$_PriceBonusItemDtoCopyWithImpl<$Res>
    extends _$PriceBonusItemDtoCopyWithImpl<$Res, _$_PriceBonusItemDto>
    implements _$$_PriceBonusItemDtoCopyWith<$Res> {
  __$$_PriceBonusItemDtoCopyWithImpl(
      _$_PriceBonusItemDto _value, $Res Function(_$_PriceBonusItemDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? calculation = null,
    Object? qualifyingQuantity = null,
    Object? bonusMaterials = null,
  }) {
    return _then(_$_PriceBonusItemDto(
      calculation: null == calculation
          ? _value.calculation
          : calculation // ignore: cast_nullable_to_non_nullable
              as String,
      qualifyingQuantity: null == qualifyingQuantity
          ? _value.qualifyingQuantity
          : qualifyingQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      bonusMaterials: null == bonusMaterials
          ? _value._bonusMaterials
          : bonusMaterials // ignore: cast_nullable_to_non_nullable
              as List<BonusMaterialDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PriceBonusItemDto extends _PriceBonusItemDto {
  const _$_PriceBonusItemDto(
      {@JsonKey(name: 'Calculation', defaultValue: '')
      required this.calculation,
      @JsonKey(name: 'QualifyingQuantity', defaultValue: 0)
      required this.qualifyingQuantity,
      @JsonKey(name: 'BonusMaterial', defaultValue: <BonusMaterialDto>[])
      required final List<BonusMaterialDto> bonusMaterials})
      : _bonusMaterials = bonusMaterials,
        super._();

  factory _$_PriceBonusItemDto.fromJson(Map<String, dynamic> json) =>
      _$$_PriceBonusItemDtoFromJson(json);

  @override
  @JsonKey(name: 'Calculation', defaultValue: '')
  final String calculation;
  @override
  @JsonKey(name: 'QualifyingQuantity', defaultValue: 0)
  final int qualifyingQuantity;
  final List<BonusMaterialDto> _bonusMaterials;
  @override
  @JsonKey(name: 'BonusMaterial', defaultValue: <BonusMaterialDto>[])
  List<BonusMaterialDto> get bonusMaterials {
    if (_bonusMaterials is EqualUnmodifiableListView) return _bonusMaterials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bonusMaterials);
  }

  @override
  String toString() {
    return 'PriceBonusItemDto(calculation: $calculation, qualifyingQuantity: $qualifyingQuantity, bonusMaterials: $bonusMaterials)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PriceBonusItemDto &&
            (identical(other.calculation, calculation) ||
                other.calculation == calculation) &&
            (identical(other.qualifyingQuantity, qualifyingQuantity) ||
                other.qualifyingQuantity == qualifyingQuantity) &&
            const DeepCollectionEquality()
                .equals(other._bonusMaterials, _bonusMaterials));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, calculation, qualifyingQuantity,
      const DeepCollectionEquality().hash(_bonusMaterials));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
          {@JsonKey(name: 'Calculation', defaultValue: '')
          required final String calculation,
          @JsonKey(name: 'QualifyingQuantity', defaultValue: 0)
          required final int qualifyingQuantity,
          @JsonKey(name: 'BonusMaterial', defaultValue: <BonusMaterialDto>[])
          required final List<BonusMaterialDto> bonusMaterials}) =
      _$_PriceBonusItemDto;
  const _PriceBonusItemDto._() : super._();

  factory _PriceBonusItemDto.fromJson(Map<String, dynamic> json) =
      _$_PriceBonusItemDto.fromJson;

  @override
  @JsonKey(name: 'Calculation', defaultValue: '')
  String get calculation;
  @override
  @JsonKey(name: 'QualifyingQuantity', defaultValue: 0)
  int get qualifyingQuantity;
  @override
  @JsonKey(name: 'BonusMaterial', defaultValue: <BonusMaterialDto>[])
  List<BonusMaterialDto> get bonusMaterials;
  @override
  @JsonKey(ignore: true)
  _$$_PriceBonusItemDtoCopyWith<_$_PriceBonusItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

BonusMaterialDto _$BonusMaterialDtoFromJson(Map<String, dynamic> json) {
  return _BonusMaterialDto.fromJson(json);
}

/// @nodoc
mixin _$BonusMaterialDto {
  @JsonKey(name: 'Id', defaultValue: 0)
  int get id => throw _privateConstructorUsedError;
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
  @JsonKey(name: 'LimitPerTransaction', defaultValue: 0)
  int get limitPerTransaction => throw _privateConstructorUsedError;
  @JsonKey(name: 'ConditionId', defaultValue: '')
  String get conditionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'OldMaterialCode', defaultValue: '')
  String get oldMaterialCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BonusMaterialDtoCopyWith<BonusMaterialDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BonusMaterialDtoCopyWith<$Res> {
  factory $BonusMaterialDtoCopyWith(
          BonusMaterialDto value, $Res Function(BonusMaterialDto) then) =
      _$BonusMaterialDtoCopyWithImpl<$Res, BonusMaterialDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Id', defaultValue: 0) int id,
      @JsonKey(name: 'MaterialNumber', defaultValue: '') String materialNumber,
      @JsonKey(name: 'MaterialDescription', defaultValue: '')
      String materialDescription,
      @JsonKey(name: 'Calculation', defaultValue: '') String calculation,
      @JsonKey(name: 'BonusRatio', defaultValue: 0) int bonusRatio,
      @JsonKey(name: 'QualifyingQuantity', defaultValue: 0)
      int qualifyingQuantity,
      @JsonKey(name: 'BonusQuantity', defaultValue: 0) int bonusQuantity,
      @JsonKey(name: 'LimitPerTransaction', defaultValue: 0)
      int limitPerTransaction,
      @JsonKey(name: 'ConditionId', defaultValue: '') String conditionId,
      @JsonKey(name: 'OldMaterialCode', defaultValue: '')
      String oldMaterialCode});
}

/// @nodoc
class _$BonusMaterialDtoCopyWithImpl<$Res, $Val extends BonusMaterialDto>
    implements $BonusMaterialDtoCopyWith<$Res> {
  _$BonusMaterialDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? materialNumber = null,
    Object? materialDescription = null,
    Object? calculation = null,
    Object? bonusRatio = null,
    Object? qualifyingQuantity = null,
    Object? bonusQuantity = null,
    Object? limitPerTransaction = null,
    Object? conditionId = null,
    Object? oldMaterialCode = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      materialDescription: null == materialDescription
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      calculation: null == calculation
          ? _value.calculation
          : calculation // ignore: cast_nullable_to_non_nullable
              as String,
      bonusRatio: null == bonusRatio
          ? _value.bonusRatio
          : bonusRatio // ignore: cast_nullable_to_non_nullable
              as int,
      qualifyingQuantity: null == qualifyingQuantity
          ? _value.qualifyingQuantity
          : qualifyingQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      bonusQuantity: null == bonusQuantity
          ? _value.bonusQuantity
          : bonusQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      limitPerTransaction: null == limitPerTransaction
          ? _value.limitPerTransaction
          : limitPerTransaction // ignore: cast_nullable_to_non_nullable
              as int,
      conditionId: null == conditionId
          ? _value.conditionId
          : conditionId // ignore: cast_nullable_to_non_nullable
              as String,
      oldMaterialCode: null == oldMaterialCode
          ? _value.oldMaterialCode
          : oldMaterialCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BonusMaterialDtoCopyWith<$Res>
    implements $BonusMaterialDtoCopyWith<$Res> {
  factory _$$_BonusMaterialDtoCopyWith(
          _$_BonusMaterialDto value, $Res Function(_$_BonusMaterialDto) then) =
      __$$_BonusMaterialDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Id', defaultValue: 0) int id,
      @JsonKey(name: 'MaterialNumber', defaultValue: '') String materialNumber,
      @JsonKey(name: 'MaterialDescription', defaultValue: '')
      String materialDescription,
      @JsonKey(name: 'Calculation', defaultValue: '') String calculation,
      @JsonKey(name: 'BonusRatio', defaultValue: 0) int bonusRatio,
      @JsonKey(name: 'QualifyingQuantity', defaultValue: 0)
      int qualifyingQuantity,
      @JsonKey(name: 'BonusQuantity', defaultValue: 0) int bonusQuantity,
      @JsonKey(name: 'LimitPerTransaction', defaultValue: 0)
      int limitPerTransaction,
      @JsonKey(name: 'ConditionId', defaultValue: '') String conditionId,
      @JsonKey(name: 'OldMaterialCode', defaultValue: '')
      String oldMaterialCode});
}

/// @nodoc
class __$$_BonusMaterialDtoCopyWithImpl<$Res>
    extends _$BonusMaterialDtoCopyWithImpl<$Res, _$_BonusMaterialDto>
    implements _$$_BonusMaterialDtoCopyWith<$Res> {
  __$$_BonusMaterialDtoCopyWithImpl(
      _$_BonusMaterialDto _value, $Res Function(_$_BonusMaterialDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? materialNumber = null,
    Object? materialDescription = null,
    Object? calculation = null,
    Object? bonusRatio = null,
    Object? qualifyingQuantity = null,
    Object? bonusQuantity = null,
    Object? limitPerTransaction = null,
    Object? conditionId = null,
    Object? oldMaterialCode = null,
  }) {
    return _then(_$_BonusMaterialDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      materialDescription: null == materialDescription
          ? _value.materialDescription
          : materialDescription // ignore: cast_nullable_to_non_nullable
              as String,
      calculation: null == calculation
          ? _value.calculation
          : calculation // ignore: cast_nullable_to_non_nullable
              as String,
      bonusRatio: null == bonusRatio
          ? _value.bonusRatio
          : bonusRatio // ignore: cast_nullable_to_non_nullable
              as int,
      qualifyingQuantity: null == qualifyingQuantity
          ? _value.qualifyingQuantity
          : qualifyingQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      bonusQuantity: null == bonusQuantity
          ? _value.bonusQuantity
          : bonusQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      limitPerTransaction: null == limitPerTransaction
          ? _value.limitPerTransaction
          : limitPerTransaction // ignore: cast_nullable_to_non_nullable
              as int,
      conditionId: null == conditionId
          ? _value.conditionId
          : conditionId // ignore: cast_nullable_to_non_nullable
              as String,
      oldMaterialCode: null == oldMaterialCode
          ? _value.oldMaterialCode
          : oldMaterialCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BonusMaterialDto extends _BonusMaterialDto {
  const _$_BonusMaterialDto(
      {@JsonKey(name: 'Id', defaultValue: 0) required this.id,
      @JsonKey(name: 'MaterialNumber', defaultValue: '')
      required this.materialNumber,
      @JsonKey(name: 'MaterialDescription', defaultValue: '')
      required this.materialDescription,
      @JsonKey(name: 'Calculation', defaultValue: '') required this.calculation,
      @JsonKey(name: 'BonusRatio', defaultValue: 0) required this.bonusRatio,
      @JsonKey(name: 'QualifyingQuantity', defaultValue: 0)
      required this.qualifyingQuantity,
      @JsonKey(name: 'BonusQuantity', defaultValue: 0)
      required this.bonusQuantity,
      @JsonKey(name: 'LimitPerTransaction', defaultValue: 0)
      required this.limitPerTransaction,
      @JsonKey(name: 'ConditionId', defaultValue: '') required this.conditionId,
      @JsonKey(name: 'OldMaterialCode', defaultValue: '')
      required this.oldMaterialCode})
      : super._();

  factory _$_BonusMaterialDto.fromJson(Map<String, dynamic> json) =>
      _$$_BonusMaterialDtoFromJson(json);

  @override
  @JsonKey(name: 'Id', defaultValue: 0)
  final int id;
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
  @JsonKey(name: 'LimitPerTransaction', defaultValue: 0)
  final int limitPerTransaction;
  @override
  @JsonKey(name: 'ConditionId', defaultValue: '')
  final String conditionId;
  @override
  @JsonKey(name: 'OldMaterialCode', defaultValue: '')
  final String oldMaterialCode;

  @override
  String toString() {
    return 'BonusMaterialDto(id: $id, materialNumber: $materialNumber, materialDescription: $materialDescription, calculation: $calculation, bonusRatio: $bonusRatio, qualifyingQuantity: $qualifyingQuantity, bonusQuantity: $bonusQuantity, limitPerTransaction: $limitPerTransaction, conditionId: $conditionId, oldMaterialCode: $oldMaterialCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BonusMaterialDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            (identical(other.materialDescription, materialDescription) ||
                other.materialDescription == materialDescription) &&
            (identical(other.calculation, calculation) ||
                other.calculation == calculation) &&
            (identical(other.bonusRatio, bonusRatio) ||
                other.bonusRatio == bonusRatio) &&
            (identical(other.qualifyingQuantity, qualifyingQuantity) ||
                other.qualifyingQuantity == qualifyingQuantity) &&
            (identical(other.bonusQuantity, bonusQuantity) ||
                other.bonusQuantity == bonusQuantity) &&
            (identical(other.limitPerTransaction, limitPerTransaction) ||
                other.limitPerTransaction == limitPerTransaction) &&
            (identical(other.conditionId, conditionId) ||
                other.conditionId == conditionId) &&
            (identical(other.oldMaterialCode, oldMaterialCode) ||
                other.oldMaterialCode == oldMaterialCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      materialNumber,
      materialDescription,
      calculation,
      bonusRatio,
      qualifyingQuantity,
      bonusQuantity,
      limitPerTransaction,
      conditionId,
      oldMaterialCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BonusMaterialDtoCopyWith<_$_BonusMaterialDto> get copyWith =>
      __$$_BonusMaterialDtoCopyWithImpl<_$_BonusMaterialDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BonusMaterialDtoToJson(
      this,
    );
  }
}

abstract class _BonusMaterialDto extends BonusMaterialDto {
  const factory _BonusMaterialDto(
      {@JsonKey(name: 'Id', defaultValue: 0) required final int id,
      @JsonKey(name: 'MaterialNumber', defaultValue: '')
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
      required final int bonusQuantity,
      @JsonKey(name: 'LimitPerTransaction', defaultValue: 0)
      required final int limitPerTransaction,
      @JsonKey(name: 'ConditionId', defaultValue: '')
      required final String conditionId,
      @JsonKey(name: 'OldMaterialCode', defaultValue: '')
      required final String oldMaterialCode}) = _$_BonusMaterialDto;
  const _BonusMaterialDto._() : super._();

  factory _BonusMaterialDto.fromJson(Map<String, dynamic> json) =
      _$_BonusMaterialDto.fromJson;

  @override
  @JsonKey(name: 'Id', defaultValue: 0)
  int get id;
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
  @JsonKey(name: 'LimitPerTransaction', defaultValue: 0)
  int get limitPerTransaction;
  @override
  @JsonKey(name: 'ConditionId', defaultValue: '')
  String get conditionId;
  @override
  @JsonKey(name: 'OldMaterialCode', defaultValue: '')
  String get oldMaterialCode;
  @override
  @JsonKey(ignore: true)
  _$$_BonusMaterialDtoCopyWith<_$_BonusMaterialDto> get copyWith =>
      throw _privateConstructorUsedError;
}

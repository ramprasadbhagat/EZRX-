// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'price_tier_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PriceTierDto _$PriceTierDtoFromJson(Map<String, dynamic> json) {
  return _PriceTierDto.fromJson(json);
}

/// @nodoc
mixin _$PriceTierDto {
  @JsonKey(name: 'Tier', defaultValue: '')
  @HiveField(19, defaultValue: '')
  String get tier => throw _privateConstructorUsedError;
  @JsonKey(name: 'PriceTier', defaultValue: <PriceTierItemDto>[])
  @HiveField(20, defaultValue: <PriceTierItemDto>[])
  List<PriceTierItemDto> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PriceTierDtoCopyWith<PriceTierDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceTierDtoCopyWith<$Res> {
  factory $PriceTierDtoCopyWith(
          PriceTierDto value, $Res Function(PriceTierDto) then) =
      _$PriceTierDtoCopyWithImpl<$Res, PriceTierDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Tier', defaultValue: '')
      @HiveField(19, defaultValue: '')
          String tier,
      @JsonKey(name: 'PriceTier', defaultValue: <PriceTierItemDto>[])
      @HiveField(20, defaultValue: <PriceTierItemDto>[])
          List<PriceTierItemDto> items});
}

/// @nodoc
class _$PriceTierDtoCopyWithImpl<$Res, $Val extends PriceTierDto>
    implements $PriceTierDtoCopyWith<$Res> {
  _$PriceTierDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tier = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      tier: null == tier
          ? _value.tier
          : tier // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PriceTierItemDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PriceTierDtoCopyWith<$Res>
    implements $PriceTierDtoCopyWith<$Res> {
  factory _$$_PriceTierDtoCopyWith(
          _$_PriceTierDto value, $Res Function(_$_PriceTierDto) then) =
      __$$_PriceTierDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Tier', defaultValue: '')
      @HiveField(19, defaultValue: '')
          String tier,
      @JsonKey(name: 'PriceTier', defaultValue: <PriceTierItemDto>[])
      @HiveField(20, defaultValue: <PriceTierItemDto>[])
          List<PriceTierItemDto> items});
}

/// @nodoc
class __$$_PriceTierDtoCopyWithImpl<$Res>
    extends _$PriceTierDtoCopyWithImpl<$Res, _$_PriceTierDto>
    implements _$$_PriceTierDtoCopyWith<$Res> {
  __$$_PriceTierDtoCopyWithImpl(
      _$_PriceTierDto _value, $Res Function(_$_PriceTierDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tier = null,
    Object? items = null,
  }) {
    return _then(_$_PriceTierDto(
      tier: null == tier
          ? _value.tier
          : tier // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PriceTierItemDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 8, adapterName: 'PriceTierDtoAdapter')
class _$_PriceTierDto extends _PriceTierDto {
  const _$_PriceTierDto(
      {@JsonKey(name: 'Tier', defaultValue: '')
      @HiveField(19, defaultValue: '')
          required this.tier,
      @JsonKey(name: 'PriceTier', defaultValue: <PriceTierItemDto>[])
      @HiveField(20, defaultValue: <PriceTierItemDto>[])
          required final List<PriceTierItemDto> items})
      : _items = items,
        super._();

  factory _$_PriceTierDto.fromJson(Map<String, dynamic> json) =>
      _$$_PriceTierDtoFromJson(json);

  @override
  @JsonKey(name: 'Tier', defaultValue: '')
  @HiveField(19, defaultValue: '')
  final String tier;
  final List<PriceTierItemDto> _items;
  @override
  @JsonKey(name: 'PriceTier', defaultValue: <PriceTierItemDto>[])
  @HiveField(20, defaultValue: <PriceTierItemDto>[])
  List<PriceTierItemDto> get items {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'PriceTierDto(tier: $tier, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PriceTierDto &&
            (identical(other.tier, tier) || other.tier == tier) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, tier, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PriceTierDtoCopyWith<_$_PriceTierDto> get copyWith =>
      __$$_PriceTierDtoCopyWithImpl<_$_PriceTierDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PriceTierDtoToJson(
      this,
    );
  }
}

abstract class _PriceTierDto extends PriceTierDto {
  const factory _PriceTierDto(
      {@JsonKey(name: 'Tier', defaultValue: '')
      @HiveField(19, defaultValue: '')
          required final String tier,
      @JsonKey(name: 'PriceTier', defaultValue: <PriceTierItemDto>[])
      @HiveField(20, defaultValue: <PriceTierItemDto>[])
          required final List<PriceTierItemDto> items}) = _$_PriceTierDto;
  const _PriceTierDto._() : super._();

  factory _PriceTierDto.fromJson(Map<String, dynamic> json) =
      _$_PriceTierDto.fromJson;

  @override
  @JsonKey(name: 'Tier', defaultValue: '')
  @HiveField(19, defaultValue: '')
  String get tier;
  @override
  @JsonKey(name: 'PriceTier', defaultValue: <PriceTierItemDto>[])
  @HiveField(20, defaultValue: <PriceTierItemDto>[])
  List<PriceTierItemDto> get items;
  @override
  @JsonKey(ignore: true)
  _$$_PriceTierDtoCopyWith<_$_PriceTierDto> get copyWith =>
      throw _privateConstructorUsedError;
}

PriceTierItemDto _$PriceTierItemDtoFromJson(Map<String, dynamic> json) {
  return _PriceTierItemDto.fromJson(json);
}

/// @nodoc
mixin _$PriceTierItemDto {
  @JsonKey(name: 'Type', defaultValue: '')
  @HiveField(21, defaultValue: '')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'ApplyBonus', defaultValue: false)
  @HiveField(22, defaultValue: false)
  bool get applyBonus => throw _privateConstructorUsedError;
  @JsonKey(name: 'Sequence', defaultValue: 0)
  @HiveField(23, defaultValue: 0)
  int get sequence => throw _privateConstructorUsedError;
  @JsonKey(name: 'Quantity', defaultValue: 0)
  @HiveField(24, defaultValue: 0)
  int get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'Rate', defaultValue: 0)
  @HiveField(6, defaultValue: 0)
  double get rate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PriceTierItemDtoCopyWith<PriceTierItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceTierItemDtoCopyWith<$Res> {
  factory $PriceTierItemDtoCopyWith(
          PriceTierItemDto value, $Res Function(PriceTierItemDto) then) =
      _$PriceTierItemDtoCopyWithImpl<$Res, PriceTierItemDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Type', defaultValue: '')
      @HiveField(21, defaultValue: '')
          String type,
      @JsonKey(name: 'ApplyBonus', defaultValue: false)
      @HiveField(22, defaultValue: false)
          bool applyBonus,
      @JsonKey(name: 'Sequence', defaultValue: 0)
      @HiveField(23, defaultValue: 0)
          int sequence,
      @JsonKey(name: 'Quantity', defaultValue: 0)
      @HiveField(24, defaultValue: 0)
          int quantity,
      @JsonKey(name: 'Rate', defaultValue: 0)
      @HiveField(6, defaultValue: 0)
          double rate});
}

/// @nodoc
class _$PriceTierItemDtoCopyWithImpl<$Res, $Val extends PriceTierItemDto>
    implements $PriceTierItemDtoCopyWith<$Res> {
  _$PriceTierItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? applyBonus = null,
    Object? sequence = null,
    Object? quantity = null,
    Object? rate = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      applyBonus: null == applyBonus
          ? _value.applyBonus
          : applyBonus // ignore: cast_nullable_to_non_nullable
              as bool,
      sequence: null == sequence
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PriceTierItemDtoCopyWith<$Res>
    implements $PriceTierItemDtoCopyWith<$Res> {
  factory _$$_PriceTierItemDtoCopyWith(
          _$_PriceTierItemDto value, $Res Function(_$_PriceTierItemDto) then) =
      __$$_PriceTierItemDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Type', defaultValue: '')
      @HiveField(21, defaultValue: '')
          String type,
      @JsonKey(name: 'ApplyBonus', defaultValue: false)
      @HiveField(22, defaultValue: false)
          bool applyBonus,
      @JsonKey(name: 'Sequence', defaultValue: 0)
      @HiveField(23, defaultValue: 0)
          int sequence,
      @JsonKey(name: 'Quantity', defaultValue: 0)
      @HiveField(24, defaultValue: 0)
          int quantity,
      @JsonKey(name: 'Rate', defaultValue: 0)
      @HiveField(6, defaultValue: 0)
          double rate});
}

/// @nodoc
class __$$_PriceTierItemDtoCopyWithImpl<$Res>
    extends _$PriceTierItemDtoCopyWithImpl<$Res, _$_PriceTierItemDto>
    implements _$$_PriceTierItemDtoCopyWith<$Res> {
  __$$_PriceTierItemDtoCopyWithImpl(
      _$_PriceTierItemDto _value, $Res Function(_$_PriceTierItemDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? applyBonus = null,
    Object? sequence = null,
    Object? quantity = null,
    Object? rate = null,
  }) {
    return _then(_$_PriceTierItemDto(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      applyBonus: null == applyBonus
          ? _value.applyBonus
          : applyBonus // ignore: cast_nullable_to_non_nullable
              as bool,
      sequence: null == sequence
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 9, adapterName: 'PriceTierItemDtoAdapter')
class _$_PriceTierItemDto extends _PriceTierItemDto {
  const _$_PriceTierItemDto(
      {@JsonKey(name: 'Type', defaultValue: '')
      @HiveField(21, defaultValue: '')
          required this.type,
      @JsonKey(name: 'ApplyBonus', defaultValue: false)
      @HiveField(22, defaultValue: false)
          required this.applyBonus,
      @JsonKey(name: 'Sequence', defaultValue: 0)
      @HiveField(23, defaultValue: 0)
          required this.sequence,
      @JsonKey(name: 'Quantity', defaultValue: 0)
      @HiveField(24, defaultValue: 0)
          required this.quantity,
      @JsonKey(name: 'Rate', defaultValue: 0)
      @HiveField(6, defaultValue: 0)
          required this.rate})
      : super._();

  factory _$_PriceTierItemDto.fromJson(Map<String, dynamic> json) =>
      _$$_PriceTierItemDtoFromJson(json);

  @override
  @JsonKey(name: 'Type', defaultValue: '')
  @HiveField(21, defaultValue: '')
  final String type;
  @override
  @JsonKey(name: 'ApplyBonus', defaultValue: false)
  @HiveField(22, defaultValue: false)
  final bool applyBonus;
  @override
  @JsonKey(name: 'Sequence', defaultValue: 0)
  @HiveField(23, defaultValue: 0)
  final int sequence;
  @override
  @JsonKey(name: 'Quantity', defaultValue: 0)
  @HiveField(24, defaultValue: 0)
  final int quantity;
  @override
  @JsonKey(name: 'Rate', defaultValue: 0)
  @HiveField(6, defaultValue: 0)
  final double rate;

  @override
  String toString() {
    return 'PriceTierItemDto(type: $type, applyBonus: $applyBonus, sequence: $sequence, quantity: $quantity, rate: $rate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PriceTierItemDto &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.applyBonus, applyBonus) ||
                other.applyBonus == applyBonus) &&
            (identical(other.sequence, sequence) ||
                other.sequence == sequence) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.rate, rate) || other.rate == rate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, type, applyBonus, sequence, quantity, rate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PriceTierItemDtoCopyWith<_$_PriceTierItemDto> get copyWith =>
      __$$_PriceTierItemDtoCopyWithImpl<_$_PriceTierItemDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PriceTierItemDtoToJson(
      this,
    );
  }
}

abstract class _PriceTierItemDto extends PriceTierItemDto {
  const factory _PriceTierItemDto(
      {@JsonKey(name: 'Type', defaultValue: '')
      @HiveField(21, defaultValue: '')
          required final String type,
      @JsonKey(name: 'ApplyBonus', defaultValue: false)
      @HiveField(22, defaultValue: false)
          required final bool applyBonus,
      @JsonKey(name: 'Sequence', defaultValue: 0)
      @HiveField(23, defaultValue: 0)
          required final int sequence,
      @JsonKey(name: 'Quantity', defaultValue: 0)
      @HiveField(24, defaultValue: 0)
          required final int quantity,
      @JsonKey(name: 'Rate', defaultValue: 0)
      @HiveField(6, defaultValue: 0)
          required final double rate}) = _$_PriceTierItemDto;
  const _PriceTierItemDto._() : super._();

  factory _PriceTierItemDto.fromJson(Map<String, dynamic> json) =
      _$_PriceTierItemDto.fromJson;

  @override
  @JsonKey(name: 'Type', defaultValue: '')
  @HiveField(21, defaultValue: '')
  String get type;
  @override
  @JsonKey(name: 'ApplyBonus', defaultValue: false)
  @HiveField(22, defaultValue: false)
  bool get applyBonus;
  @override
  @JsonKey(name: 'Sequence', defaultValue: 0)
  @HiveField(23, defaultValue: 0)
  int get sequence;
  @override
  @JsonKey(name: 'Quantity', defaultValue: 0)
  @HiveField(24, defaultValue: 0)
  int get quantity;
  @override
  @JsonKey(name: 'Rate', defaultValue: 0)
  @HiveField(6, defaultValue: 0)
  double get rate;
  @override
  @JsonKey(ignore: true)
  _$$_PriceTierItemDtoCopyWith<_$_PriceTierItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

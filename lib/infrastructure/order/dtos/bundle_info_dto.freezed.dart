// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bundle_info_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BundleInfoDto _$BundleInfoDtoFromJson(Map<String, dynamic> json) {
  return _BundleInfoDto.fromJson(json);
}

/// @nodoc
mixin _$BundleInfoDto {
  @JsonKey(name: 'sequence')
  @HiveField(21)
  int get sequence => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity')
  @HiveField(22)
  int get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  @HiveField(23)
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'rate')
  @HiveField(24)
  double get rate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BundleInfoDtoCopyWith<BundleInfoDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BundleInfoDtoCopyWith<$Res> {
  factory $BundleInfoDtoCopyWith(
          BundleInfoDto value, $Res Function(BundleInfoDto) then) =
      _$BundleInfoDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'sequence') @HiveField(21) int sequence,
      @JsonKey(name: 'quantity') @HiveField(22) int quantity,
      @JsonKey(name: 'type') @HiveField(23) String type,
      @JsonKey(name: 'rate') @HiveField(24) double rate});
}

/// @nodoc
class _$BundleInfoDtoCopyWithImpl<$Res>
    implements $BundleInfoDtoCopyWith<$Res> {
  _$BundleInfoDtoCopyWithImpl(this._value, this._then);

  final BundleInfoDto _value;
  // ignore: unused_field
  final $Res Function(BundleInfoDto) _then;

  @override
  $Res call({
    Object? sequence = freezed,
    Object? quantity = freezed,
    Object? type = freezed,
    Object? rate = freezed,
  }) {
    return _then(_value.copyWith(
      sequence: sequence == freezed
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      rate: rate == freezed
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$_BundleInfoDtoCopyWith<$Res>
    implements $BundleInfoDtoCopyWith<$Res> {
  factory _$$_BundleInfoDtoCopyWith(
          _$_BundleInfoDto value, $Res Function(_$_BundleInfoDto) then) =
      __$$_BundleInfoDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'sequence') @HiveField(21) int sequence,
      @JsonKey(name: 'quantity') @HiveField(22) int quantity,
      @JsonKey(name: 'type') @HiveField(23) String type,
      @JsonKey(name: 'rate') @HiveField(24) double rate});
}

/// @nodoc
class __$$_BundleInfoDtoCopyWithImpl<$Res>
    extends _$BundleInfoDtoCopyWithImpl<$Res>
    implements _$$_BundleInfoDtoCopyWith<$Res> {
  __$$_BundleInfoDtoCopyWithImpl(
      _$_BundleInfoDto _value, $Res Function(_$_BundleInfoDto) _then)
      : super(_value, (v) => _then(v as _$_BundleInfoDto));

  @override
  _$_BundleInfoDto get _value => super._value as _$_BundleInfoDto;

  @override
  $Res call({
    Object? sequence = freezed,
    Object? quantity = freezed,
    Object? type = freezed,
    Object? rate = freezed,
  }) {
    return _then(_$_BundleInfoDto(
      sequence: sequence == freezed
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      rate: rate == freezed
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 16, adapterName: 'BundleInfoDtoAdapter')
class _$_BundleInfoDto extends _BundleInfoDto {
  const _$_BundleInfoDto(
      {@JsonKey(name: 'sequence') @HiveField(21) required this.sequence,
      @JsonKey(name: 'quantity') @HiveField(22) required this.quantity,
      @JsonKey(name: 'type') @HiveField(23) required this.type,
      @JsonKey(name: 'rate') @HiveField(24) required this.rate})
      : super._();

  factory _$_BundleInfoDto.fromJson(Map<String, dynamic> json) =>
      _$$_BundleInfoDtoFromJson(json);

  @override
  @JsonKey(name: 'sequence')
  @HiveField(21)
  final int sequence;
  @override
  @JsonKey(name: 'quantity')
  @HiveField(22)
  final int quantity;
  @override
  @JsonKey(name: 'type')
  @HiveField(23)
  final String type;
  @override
  @JsonKey(name: 'rate')
  @HiveField(24)
  final double rate;

  @override
  String toString() {
    return 'BundleInfoDto(sequence: $sequence, quantity: $quantity, type: $type, rate: $rate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BundleInfoDto &&
            const DeepCollectionEquality().equals(other.sequence, sequence) &&
            const DeepCollectionEquality().equals(other.quantity, quantity) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.rate, rate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(sequence),
      const DeepCollectionEquality().hash(quantity),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(rate));

  @JsonKey(ignore: true)
  @override
  _$$_BundleInfoDtoCopyWith<_$_BundleInfoDto> get copyWith =>
      __$$_BundleInfoDtoCopyWithImpl<_$_BundleInfoDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BundleInfoDtoToJson(
      this,
    );
  }
}

abstract class _BundleInfoDto extends BundleInfoDto {
  const factory _BundleInfoDto(
      {@JsonKey(name: 'sequence')
      @HiveField(21)
          required final int sequence,
      @JsonKey(name: 'quantity')
      @HiveField(22)
          required final int quantity,
      @JsonKey(name: 'type')
      @HiveField(23)
          required final String type,
      @JsonKey(name: 'rate')
      @HiveField(24)
          required final double rate}) = _$_BundleInfoDto;
  const _BundleInfoDto._() : super._();

  factory _BundleInfoDto.fromJson(Map<String, dynamic> json) =
      _$_BundleInfoDto.fromJson;

  @override
  @JsonKey(name: 'sequence')
  @HiveField(21)
  int get sequence;
  @override
  @JsonKey(name: 'quantity')
  @HiveField(22)
  int get quantity;
  @override
  @JsonKey(name: 'type')
  @HiveField(23)
  String get type;
  @override
  @JsonKey(name: 'rate')
  @HiveField(24)
  double get rate;
  @override
  @JsonKey(ignore: true)
  _$$_BundleInfoDtoCopyWith<_$_BundleInfoDto> get copyWith =>
      throw _privateConstructorUsedError;
}

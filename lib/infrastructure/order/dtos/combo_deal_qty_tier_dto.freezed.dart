// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'combo_deal_qty_tier_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ComboDealQtyTierDto _$ComboDealQtyTierDtoFromJson(Map<String, dynamic> json) {
  return _ComboDealQtyTierDto.fromJson(json);
}

/// @nodoc
mixin _$ComboDealQtyTierDto {
  @JsonKey(name: 'rate', defaultValue: '')
  @HiveField(0, defaultValue: '')
  String get rate => throw _privateConstructorUsedError;
  @JsonKey(name: 'conditionNumber', defaultValue: '')
  @HiveField(1, defaultValue: '')
  String get conditionNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'minQty', defaultValue: '')
  @HiveField(2, defaultValue: '')
  String get minQty => throw _privateConstructorUsedError;
  @JsonKey(name: 'type', defaultValue: '')
  @HiveField(3, defaultValue: '')
  String get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ComboDealQtyTierDtoCopyWith<ComboDealQtyTierDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComboDealQtyTierDtoCopyWith<$Res> {
  factory $ComboDealQtyTierDtoCopyWith(
          ComboDealQtyTierDto value, $Res Function(ComboDealQtyTierDto) then) =
      _$ComboDealQtyTierDtoCopyWithImpl<$Res, ComboDealQtyTierDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'rate', defaultValue: '')
      @HiveField(0, defaultValue: '')
          String rate,
      @JsonKey(name: 'conditionNumber', defaultValue: '')
      @HiveField(1, defaultValue: '')
          String conditionNumber,
      @JsonKey(name: 'minQty', defaultValue: '')
      @HiveField(2, defaultValue: '')
          String minQty,
      @JsonKey(name: 'type', defaultValue: '')
      @HiveField(3, defaultValue: '')
          String type});
}

/// @nodoc
class _$ComboDealQtyTierDtoCopyWithImpl<$Res, $Val extends ComboDealQtyTierDto>
    implements $ComboDealQtyTierDtoCopyWith<$Res> {
  _$ComboDealQtyTierDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rate = null,
    Object? conditionNumber = null,
    Object? minQty = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as String,
      conditionNumber: null == conditionNumber
          ? _value.conditionNumber
          : conditionNumber // ignore: cast_nullable_to_non_nullable
              as String,
      minQty: null == minQty
          ? _value.minQty
          : minQty // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ComboDealQtyTierDtoCopyWith<$Res>
    implements $ComboDealQtyTierDtoCopyWith<$Res> {
  factory _$$_ComboDealQtyTierDtoCopyWith(_$_ComboDealQtyTierDto value,
          $Res Function(_$_ComboDealQtyTierDto) then) =
      __$$_ComboDealQtyTierDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'rate', defaultValue: '')
      @HiveField(0, defaultValue: '')
          String rate,
      @JsonKey(name: 'conditionNumber', defaultValue: '')
      @HiveField(1, defaultValue: '')
          String conditionNumber,
      @JsonKey(name: 'minQty', defaultValue: '')
      @HiveField(2, defaultValue: '')
          String minQty,
      @JsonKey(name: 'type', defaultValue: '')
      @HiveField(3, defaultValue: '')
          String type});
}

/// @nodoc
class __$$_ComboDealQtyTierDtoCopyWithImpl<$Res>
    extends _$ComboDealQtyTierDtoCopyWithImpl<$Res, _$_ComboDealQtyTierDto>
    implements _$$_ComboDealQtyTierDtoCopyWith<$Res> {
  __$$_ComboDealQtyTierDtoCopyWithImpl(_$_ComboDealQtyTierDto _value,
      $Res Function(_$_ComboDealQtyTierDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rate = null,
    Object? conditionNumber = null,
    Object? minQty = null,
    Object? type = null,
  }) {
    return _then(_$_ComboDealQtyTierDto(
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as String,
      conditionNumber: null == conditionNumber
          ? _value.conditionNumber
          : conditionNumber // ignore: cast_nullable_to_non_nullable
              as String,
      minQty: null == minQty
          ? _value.minQty
          : minQty // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 29, adapterName: 'ComboDealQtyTierDtoAdapter')
class _$_ComboDealQtyTierDto extends _ComboDealQtyTierDto {
  const _$_ComboDealQtyTierDto(
      {@JsonKey(name: 'rate', defaultValue: '')
      @HiveField(0, defaultValue: '')
          required this.rate,
      @JsonKey(name: 'conditionNumber', defaultValue: '')
      @HiveField(1, defaultValue: '')
          required this.conditionNumber,
      @JsonKey(name: 'minQty', defaultValue: '')
      @HiveField(2, defaultValue: '')
          required this.minQty,
      @JsonKey(name: 'type', defaultValue: '')
      @HiveField(3, defaultValue: '')
          required this.type})
      : super._();

  factory _$_ComboDealQtyTierDto.fromJson(Map<String, dynamic> json) =>
      _$$_ComboDealQtyTierDtoFromJson(json);

  @override
  @JsonKey(name: 'rate', defaultValue: '')
  @HiveField(0, defaultValue: '')
  final String rate;
  @override
  @JsonKey(name: 'conditionNumber', defaultValue: '')
  @HiveField(1, defaultValue: '')
  final String conditionNumber;
  @override
  @JsonKey(name: 'minQty', defaultValue: '')
  @HiveField(2, defaultValue: '')
  final String minQty;
  @override
  @JsonKey(name: 'type', defaultValue: '')
  @HiveField(3, defaultValue: '')
  final String type;

  @override
  String toString() {
    return 'ComboDealQtyTierDto(rate: $rate, conditionNumber: $conditionNumber, minQty: $minQty, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ComboDealQtyTierDto &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.conditionNumber, conditionNumber) ||
                other.conditionNumber == conditionNumber) &&
            (identical(other.minQty, minQty) || other.minQty == minQty) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, rate, conditionNumber, minQty, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ComboDealQtyTierDtoCopyWith<_$_ComboDealQtyTierDto> get copyWith =>
      __$$_ComboDealQtyTierDtoCopyWithImpl<_$_ComboDealQtyTierDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ComboDealQtyTierDtoToJson(
      this,
    );
  }
}

abstract class _ComboDealQtyTierDto extends ComboDealQtyTierDto {
  const factory _ComboDealQtyTierDto(
      {@JsonKey(name: 'rate', defaultValue: '')
      @HiveField(0, defaultValue: '')
          required final String rate,
      @JsonKey(name: 'conditionNumber', defaultValue: '')
      @HiveField(1, defaultValue: '')
          required final String conditionNumber,
      @JsonKey(name: 'minQty', defaultValue: '')
      @HiveField(2, defaultValue: '')
          required final String minQty,
      @JsonKey(name: 'type', defaultValue: '')
      @HiveField(3, defaultValue: '')
          required final String type}) = _$_ComboDealQtyTierDto;
  const _ComboDealQtyTierDto._() : super._();

  factory _ComboDealQtyTierDto.fromJson(Map<String, dynamic> json) =
      _$_ComboDealQtyTierDto.fromJson;

  @override
  @JsonKey(name: 'rate', defaultValue: '')
  @HiveField(0, defaultValue: '')
  String get rate;
  @override
  @JsonKey(name: 'conditionNumber', defaultValue: '')
  @HiveField(1, defaultValue: '')
  String get conditionNumber;
  @override
  @JsonKey(name: 'minQty', defaultValue: '')
  @HiveField(2, defaultValue: '')
  String get minQty;
  @override
  @JsonKey(name: 'type', defaultValue: '')
  @HiveField(3, defaultValue: '')
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$_ComboDealQtyTierDtoCopyWith<_$_ComboDealQtyTierDto> get copyWith =>
      throw _privateConstructorUsedError;
}

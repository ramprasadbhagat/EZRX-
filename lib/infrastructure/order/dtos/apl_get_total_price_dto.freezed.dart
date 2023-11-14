// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'apl_get_total_price_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AplGetTotalPriceDto _$AplGetTotalPriceDtoFromJson(Map<String, dynamic> json) {
  return _AplGetTotalPriceDto.fromJson(json);
}

/// @nodoc
mixin _$AplGetTotalPriceDto {
  @JsonKey(name: 'TotalPrice', defaultValue: 0)
  int get grandTotal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AplGetTotalPriceDtoCopyWith<AplGetTotalPriceDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AplGetTotalPriceDtoCopyWith<$Res> {
  factory $AplGetTotalPriceDtoCopyWith(
          AplGetTotalPriceDto value, $Res Function(AplGetTotalPriceDto) then) =
      _$AplGetTotalPriceDtoCopyWithImpl<$Res, AplGetTotalPriceDto>;
  @useResult
  $Res call({@JsonKey(name: 'TotalPrice', defaultValue: 0) int grandTotal});
}

/// @nodoc
class _$AplGetTotalPriceDtoCopyWithImpl<$Res, $Val extends AplGetTotalPriceDto>
    implements $AplGetTotalPriceDtoCopyWith<$Res> {
  _$AplGetTotalPriceDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? grandTotal = null,
  }) {
    return _then(_value.copyWith(
      grandTotal: null == grandTotal
          ? _value.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AplGetTotalPriceDtoCopyWith<$Res>
    implements $AplGetTotalPriceDtoCopyWith<$Res> {
  factory _$$_AplGetTotalPriceDtoCopyWith(_$_AplGetTotalPriceDto value,
          $Res Function(_$_AplGetTotalPriceDto) then) =
      __$$_AplGetTotalPriceDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'TotalPrice', defaultValue: 0) int grandTotal});
}

/// @nodoc
class __$$_AplGetTotalPriceDtoCopyWithImpl<$Res>
    extends _$AplGetTotalPriceDtoCopyWithImpl<$Res, _$_AplGetTotalPriceDto>
    implements _$$_AplGetTotalPriceDtoCopyWith<$Res> {
  __$$_AplGetTotalPriceDtoCopyWithImpl(_$_AplGetTotalPriceDto _value,
      $Res Function(_$_AplGetTotalPriceDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? grandTotal = null,
  }) {
    return _then(_$_AplGetTotalPriceDto(
      grandTotal: null == grandTotal
          ? _value.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AplGetTotalPriceDto extends _AplGetTotalPriceDto {
  const _$_AplGetTotalPriceDto(
      {@JsonKey(name: 'TotalPrice', defaultValue: 0) required this.grandTotal})
      : super._();

  factory _$_AplGetTotalPriceDto.fromJson(Map<String, dynamic> json) =>
      _$$_AplGetTotalPriceDtoFromJson(json);

  @override
  @JsonKey(name: 'TotalPrice', defaultValue: 0)
  final int grandTotal;

  @override
  String toString() {
    return 'AplGetTotalPriceDto(grandTotal: $grandTotal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AplGetTotalPriceDto &&
            (identical(other.grandTotal, grandTotal) ||
                other.grandTotal == grandTotal));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, grandTotal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AplGetTotalPriceDtoCopyWith<_$_AplGetTotalPriceDto> get copyWith =>
      __$$_AplGetTotalPriceDtoCopyWithImpl<_$_AplGetTotalPriceDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AplGetTotalPriceDtoToJson(
      this,
    );
  }
}

abstract class _AplGetTotalPriceDto extends AplGetTotalPriceDto {
  const factory _AplGetTotalPriceDto(
      {@JsonKey(name: 'TotalPrice', defaultValue: 0)
      required final int grandTotal}) = _$_AplGetTotalPriceDto;
  const _AplGetTotalPriceDto._() : super._();

  factory _AplGetTotalPriceDto.fromJson(Map<String, dynamic> json) =
      _$_AplGetTotalPriceDto.fromJson;

  @override
  @JsonKey(name: 'TotalPrice', defaultValue: 0)
  int get grandTotal;
  @override
  @JsonKey(ignore: true)
  _$$_AplGetTotalPriceDtoCopyWith<_$_AplGetTotalPriceDto> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_payment_advice_footer_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddPaymentAdviceFooterResponseDto _$AddPaymentAdviceFooterResponseDtoFromJson(
    Map<String, dynamic> json) {
  return _AddPaymentAdviceFooterResponseDto.fromJson(json);
}

/// @nodoc
mixin _$AddPaymentAdviceFooterResponseDto {
  @JsonKey(name: 'info', defaultValue: '')
  String get info => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddPaymentAdviceFooterResponseDtoCopyWith<AddPaymentAdviceFooterResponseDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddPaymentAdviceFooterResponseDtoCopyWith<$Res> {
  factory $AddPaymentAdviceFooterResponseDtoCopyWith(
          AddPaymentAdviceFooterResponseDto value,
          $Res Function(AddPaymentAdviceFooterResponseDto) then) =
      _$AddPaymentAdviceFooterResponseDtoCopyWithImpl<$Res,
          AddPaymentAdviceFooterResponseDto>;
  @useResult
  $Res call({@JsonKey(name: 'info', defaultValue: '') String info});
}

/// @nodoc
class _$AddPaymentAdviceFooterResponseDtoCopyWithImpl<$Res,
        $Val extends AddPaymentAdviceFooterResponseDto>
    implements $AddPaymentAdviceFooterResponseDtoCopyWith<$Res> {
  _$AddPaymentAdviceFooterResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
  }) {
    return _then(_value.copyWith(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddPaymentAdviceFooterResponseDtoCopyWith<$Res>
    implements $AddPaymentAdviceFooterResponseDtoCopyWith<$Res> {
  factory _$$_AddPaymentAdviceFooterResponseDtoCopyWith(
          _$_AddPaymentAdviceFooterResponseDto value,
          $Res Function(_$_AddPaymentAdviceFooterResponseDto) then) =
      __$$_AddPaymentAdviceFooterResponseDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'info', defaultValue: '') String info});
}

/// @nodoc
class __$$_AddPaymentAdviceFooterResponseDtoCopyWithImpl<$Res>
    extends _$AddPaymentAdviceFooterResponseDtoCopyWithImpl<$Res,
        _$_AddPaymentAdviceFooterResponseDto>
    implements _$$_AddPaymentAdviceFooterResponseDtoCopyWith<$Res> {
  __$$_AddPaymentAdviceFooterResponseDtoCopyWithImpl(
      _$_AddPaymentAdviceFooterResponseDto _value,
      $Res Function(_$_AddPaymentAdviceFooterResponseDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
  }) {
    return _then(_$_AddPaymentAdviceFooterResponseDto(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AddPaymentAdviceFooterResponseDto
    extends _AddPaymentAdviceFooterResponseDto {
  _$_AddPaymentAdviceFooterResponseDto(
      {@JsonKey(name: 'info', defaultValue: '') required this.info})
      : super._();

  factory _$_AddPaymentAdviceFooterResponseDto.fromJson(
          Map<String, dynamic> json) =>
      _$$_AddPaymentAdviceFooterResponseDtoFromJson(json);

  @override
  @JsonKey(name: 'info', defaultValue: '')
  final String info;

  @override
  String toString() {
    return 'AddPaymentAdviceFooterResponseDto(info: $info)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddPaymentAdviceFooterResponseDto &&
            (identical(other.info, info) || other.info == info));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, info);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddPaymentAdviceFooterResponseDtoCopyWith<
          _$_AddPaymentAdviceFooterResponseDto>
      get copyWith => __$$_AddPaymentAdviceFooterResponseDtoCopyWithImpl<
          _$_AddPaymentAdviceFooterResponseDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddPaymentAdviceFooterResponseDtoToJson(
      this,
    );
  }
}

abstract class _AddPaymentAdviceFooterResponseDto
    extends AddPaymentAdviceFooterResponseDto {
  factory _AddPaymentAdviceFooterResponseDto(
      {@JsonKey(name: 'info', defaultValue: '')
          required final String info}) = _$_AddPaymentAdviceFooterResponseDto;
  _AddPaymentAdviceFooterResponseDto._() : super._();

  factory _AddPaymentAdviceFooterResponseDto.fromJson(
          Map<String, dynamic> json) =
      _$_AddPaymentAdviceFooterResponseDto.fromJson;

  @override
  @JsonKey(name: 'info', defaultValue: '')
  String get info;
  @override
  @JsonKey(ignore: true)
  _$$_AddPaymentAdviceFooterResponseDtoCopyWith<
          _$_AddPaymentAdviceFooterResponseDto>
      get copyWith => throw _privateConstructorUsedError;
}

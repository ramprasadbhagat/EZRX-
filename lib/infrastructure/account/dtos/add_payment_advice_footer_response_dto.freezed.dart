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

ManagePaymentAdviceFooterResponseDto
    _$ManagePaymentAdviceFooterResponseDtoFromJson(Map<String, dynamic> json) {
  return _ManagePaymentAdviceFooterResponseDto.fromJson(json);
}

/// @nodoc
mixin _$ManagePaymentAdviceFooterResponseDto {
  @JsonKey(name: 'info', defaultValue: '')
  String get info => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ManagePaymentAdviceFooterResponseDtoCopyWith<
          ManagePaymentAdviceFooterResponseDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManagePaymentAdviceFooterResponseDtoCopyWith<$Res> {
  factory $ManagePaymentAdviceFooterResponseDtoCopyWith(
          ManagePaymentAdviceFooterResponseDto value,
          $Res Function(ManagePaymentAdviceFooterResponseDto) then) =
      _$ManagePaymentAdviceFooterResponseDtoCopyWithImpl<$Res,
          ManagePaymentAdviceFooterResponseDto>;
  @useResult
  $Res call({@JsonKey(name: 'info', defaultValue: '') String info});
}

/// @nodoc
class _$ManagePaymentAdviceFooterResponseDtoCopyWithImpl<$Res,
        $Val extends ManagePaymentAdviceFooterResponseDto>
    implements $ManagePaymentAdviceFooterResponseDtoCopyWith<$Res> {
  _$ManagePaymentAdviceFooterResponseDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$_ManagePaymentAdviceFooterResponseDtoCopyWith<$Res>
    implements $ManagePaymentAdviceFooterResponseDtoCopyWith<$Res> {
  factory _$$_ManagePaymentAdviceFooterResponseDtoCopyWith(
          _$_ManagePaymentAdviceFooterResponseDto value,
          $Res Function(_$_ManagePaymentAdviceFooterResponseDto) then) =
      __$$_ManagePaymentAdviceFooterResponseDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'info', defaultValue: '') String info});
}

/// @nodoc
class __$$_ManagePaymentAdviceFooterResponseDtoCopyWithImpl<$Res>
    extends _$ManagePaymentAdviceFooterResponseDtoCopyWithImpl<$Res,
        _$_ManagePaymentAdviceFooterResponseDto>
    implements _$$_ManagePaymentAdviceFooterResponseDtoCopyWith<$Res> {
  __$$_ManagePaymentAdviceFooterResponseDtoCopyWithImpl(
      _$_ManagePaymentAdviceFooterResponseDto _value,
      $Res Function(_$_ManagePaymentAdviceFooterResponseDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
  }) {
    return _then(_$_ManagePaymentAdviceFooterResponseDto(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ManagePaymentAdviceFooterResponseDto
    extends _ManagePaymentAdviceFooterResponseDto {
  _$_ManagePaymentAdviceFooterResponseDto(
      {@JsonKey(name: 'info', defaultValue: '') required this.info})
      : super._();

  factory _$_ManagePaymentAdviceFooterResponseDto.fromJson(
          Map<String, dynamic> json) =>
      _$$_ManagePaymentAdviceFooterResponseDtoFromJson(json);

  @override
  @JsonKey(name: 'info', defaultValue: '')
  final String info;

  @override
  String toString() {
    return 'ManagePaymentAdviceFooterResponseDto(info: $info)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ManagePaymentAdviceFooterResponseDto &&
            (identical(other.info, info) || other.info == info));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, info);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ManagePaymentAdviceFooterResponseDtoCopyWith<
          _$_ManagePaymentAdviceFooterResponseDto>
      get copyWith => __$$_ManagePaymentAdviceFooterResponseDtoCopyWithImpl<
          _$_ManagePaymentAdviceFooterResponseDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ManagePaymentAdviceFooterResponseDtoToJson(
      this,
    );
  }
}

abstract class _ManagePaymentAdviceFooterResponseDto
    extends ManagePaymentAdviceFooterResponseDto {
  factory _ManagePaymentAdviceFooterResponseDto(
      {@JsonKey(name: 'info', defaultValue: '')
      required final String info}) = _$_ManagePaymentAdviceFooterResponseDto;
  _ManagePaymentAdviceFooterResponseDto._() : super._();

  factory _ManagePaymentAdviceFooterResponseDto.fromJson(
          Map<String, dynamic> json) =
      _$_ManagePaymentAdviceFooterResponseDto.fromJson;

  @override
  @JsonKey(name: 'info', defaultValue: '')
  String get info;
  @override
  @JsonKey(ignore: true)
  _$$_ManagePaymentAdviceFooterResponseDtoCopyWith<
          _$_ManagePaymentAdviceFooterResponseDto>
      get copyWith => throw _privateConstructorUsedError;
}

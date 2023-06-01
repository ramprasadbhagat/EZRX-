// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_payment_notification_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpdatePaymentNotificationResponseDto
    _$UpdatePaymentNotificationResponseDtoFromJson(Map<String, dynamic> json) {
  return _UpdatePaymentNotificationResponseDto.fromJson(json);
}

/// @nodoc
mixin _$UpdatePaymentNotificationResponseDto {
  @JsonKey(name: 'message')
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdatePaymentNotificationResponseDtoCopyWith<
          UpdatePaymentNotificationResponseDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdatePaymentNotificationResponseDtoCopyWith<$Res> {
  factory $UpdatePaymentNotificationResponseDtoCopyWith(
          UpdatePaymentNotificationResponseDto value,
          $Res Function(UpdatePaymentNotificationResponseDto) then) =
      _$UpdatePaymentNotificationResponseDtoCopyWithImpl<$Res,
          UpdatePaymentNotificationResponseDto>;
  @useResult
  $Res call({@JsonKey(name: 'message') String message});
}

/// @nodoc
class _$UpdatePaymentNotificationResponseDtoCopyWithImpl<$Res,
        $Val extends UpdatePaymentNotificationResponseDto>
    implements $UpdatePaymentNotificationResponseDtoCopyWith<$Res> {
  _$UpdatePaymentNotificationResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UpdatePaymentNotificationResponseDtoCopyWith<$Res>
    implements $UpdatePaymentNotificationResponseDtoCopyWith<$Res> {
  factory _$$_UpdatePaymentNotificationResponseDtoCopyWith(
          _$_UpdatePaymentNotificationResponseDto value,
          $Res Function(_$_UpdatePaymentNotificationResponseDto) then) =
      __$$_UpdatePaymentNotificationResponseDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'message') String message});
}

/// @nodoc
class __$$_UpdatePaymentNotificationResponseDtoCopyWithImpl<$Res>
    extends _$UpdatePaymentNotificationResponseDtoCopyWithImpl<$Res,
        _$_UpdatePaymentNotificationResponseDto>
    implements _$$_UpdatePaymentNotificationResponseDtoCopyWith<$Res> {
  __$$_UpdatePaymentNotificationResponseDtoCopyWithImpl(
      _$_UpdatePaymentNotificationResponseDto _value,
      $Res Function(_$_UpdatePaymentNotificationResponseDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_UpdatePaymentNotificationResponseDto(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UpdatePaymentNotificationResponseDto
    extends _UpdatePaymentNotificationResponseDto {
  const _$_UpdatePaymentNotificationResponseDto(
      {@JsonKey(name: 'message') required this.message})
      : super._();

  factory _$_UpdatePaymentNotificationResponseDto.fromJson(
          Map<String, dynamic> json) =>
      _$$_UpdatePaymentNotificationResponseDtoFromJson(json);

  @override
  @JsonKey(name: 'message')
  final String message;

  @override
  String toString() {
    return 'UpdatePaymentNotificationResponseDto(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdatePaymentNotificationResponseDto &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdatePaymentNotificationResponseDtoCopyWith<
          _$_UpdatePaymentNotificationResponseDto>
      get copyWith => __$$_UpdatePaymentNotificationResponseDtoCopyWithImpl<
          _$_UpdatePaymentNotificationResponseDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UpdatePaymentNotificationResponseDtoToJson(
      this,
    );
  }
}

abstract class _UpdatePaymentNotificationResponseDto
    extends UpdatePaymentNotificationResponseDto {
  const factory _UpdatePaymentNotificationResponseDto(
          {@JsonKey(name: 'message') required final String message}) =
      _$_UpdatePaymentNotificationResponseDto;
  const _UpdatePaymentNotificationResponseDto._() : super._();

  factory _UpdatePaymentNotificationResponseDto.fromJson(
          Map<String, dynamic> json) =
      _$_UpdatePaymentNotificationResponseDto.fromJson;

  @override
  @JsonKey(name: 'message')
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_UpdatePaymentNotificationResponseDtoCopyWith<
          _$_UpdatePaymentNotificationResponseDto>
      get copyWith => throw _privateConstructorUsedError;
}

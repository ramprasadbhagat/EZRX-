// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ForgotPasswordDto _$ForgotPasswordDtoFromJson(Map<String, dynamic> json) {
  return _ForgotPasswordDto.fromJson(json);
}

/// @nodoc
mixin _$ForgotPasswordDto {
  @JsonKey(name: 'requestResetPassword')
  bool get requestResetPassword => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ForgotPasswordDtoCopyWith<ForgotPasswordDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordDtoCopyWith<$Res> {
  factory $ForgotPasswordDtoCopyWith(
          ForgotPasswordDto value, $Res Function(ForgotPasswordDto) then) =
      _$ForgotPasswordDtoCopyWithImpl<$Res, ForgotPasswordDto>;
  @useResult
  $Res call({@JsonKey(name: 'requestResetPassword') bool requestResetPassword});
}

/// @nodoc
class _$ForgotPasswordDtoCopyWithImpl<$Res, $Val extends ForgotPasswordDto>
    implements $ForgotPasswordDtoCopyWith<$Res> {
  _$ForgotPasswordDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestResetPassword = null,
  }) {
    return _then(_value.copyWith(
      requestResetPassword: null == requestResetPassword
          ? _value.requestResetPassword
          : requestResetPassword // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ForgotPasswordDtoCopyWith<$Res>
    implements $ForgotPasswordDtoCopyWith<$Res> {
  factory _$$_ForgotPasswordDtoCopyWith(_$_ForgotPasswordDto value,
          $Res Function(_$_ForgotPasswordDto) then) =
      __$$_ForgotPasswordDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'requestResetPassword') bool requestResetPassword});
}

/// @nodoc
class __$$_ForgotPasswordDtoCopyWithImpl<$Res>
    extends _$ForgotPasswordDtoCopyWithImpl<$Res, _$_ForgotPasswordDto>
    implements _$$_ForgotPasswordDtoCopyWith<$Res> {
  __$$_ForgotPasswordDtoCopyWithImpl(
      _$_ForgotPasswordDto _value, $Res Function(_$_ForgotPasswordDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestResetPassword = null,
  }) {
    return _then(_$_ForgotPasswordDto(
      requestResetPassword: null == requestResetPassword
          ? _value.requestResetPassword
          : requestResetPassword // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ForgotPasswordDto extends _ForgotPasswordDto {
  _$_ForgotPasswordDto(
      {@JsonKey(name: 'requestResetPassword')
          required this.requestResetPassword})
      : super._();

  factory _$_ForgotPasswordDto.fromJson(Map<String, dynamic> json) =>
      _$$_ForgotPasswordDtoFromJson(json);

  @override
  @JsonKey(name: 'requestResetPassword')
  final bool requestResetPassword;

  @override
  String toString() {
    return 'ForgotPasswordDto(requestResetPassword: $requestResetPassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ForgotPasswordDto &&
            (identical(other.requestResetPassword, requestResetPassword) ||
                other.requestResetPassword == requestResetPassword));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, requestResetPassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ForgotPasswordDtoCopyWith<_$_ForgotPasswordDto> get copyWith =>
      __$$_ForgotPasswordDtoCopyWithImpl<_$_ForgotPasswordDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ForgotPasswordDtoToJson(
      this,
    );
  }
}

abstract class _ForgotPasswordDto extends ForgotPasswordDto {
  factory _ForgotPasswordDto(
      {@JsonKey(name: 'requestResetPassword')
          required final bool requestResetPassword}) = _$_ForgotPasswordDto;
  _ForgotPasswordDto._() : super._();

  factory _ForgotPasswordDto.fromJson(Map<String, dynamic> json) =
      _$_ForgotPasswordDto.fromJson;

  @override
  @JsonKey(name: 'requestResetPassword')
  bool get requestResetPassword;
  @override
  @JsonKey(ignore: true)
  _$$_ForgotPasswordDtoCopyWith<_$_ForgotPasswordDto> get copyWith =>
      throw _privateConstructorUsedError;
}

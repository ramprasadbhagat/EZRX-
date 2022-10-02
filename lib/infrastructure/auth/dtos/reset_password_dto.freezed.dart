// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'reset_password_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ResetPasswordDto _$ResetPasswordDtoFromJson(Map<String, dynamic> json) {
  return _ResetPasswordDto.fromJson(json);
}

/// @nodoc
mixin _$ResetPasswordDto {
  @JsonKey(name: 'success')
  bool get success => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResetPasswordDtoCopyWith<ResetPasswordDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordDtoCopyWith<$Res> {
  factory $ResetPasswordDtoCopyWith(
          ResetPasswordDto value, $Res Function(ResetPasswordDto) then) =
      _$ResetPasswordDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'success') bool success,
      @JsonKey(name: 'status') String status});
}

/// @nodoc
class _$ResetPasswordDtoCopyWithImpl<$Res>
    implements $ResetPasswordDtoCopyWith<$Res> {
  _$ResetPasswordDtoCopyWithImpl(this._value, this._then);

  final ResetPasswordDto _value;
  // ignore: unused_field
  final $Res Function(ResetPasswordDto) _then;

  @override
  $Res call({
    Object? success = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ResetPasswordDtoCopyWith<$Res>
    implements $ResetPasswordDtoCopyWith<$Res> {
  factory _$$_ResetPasswordDtoCopyWith(
          _$_ResetPasswordDto value, $Res Function(_$_ResetPasswordDto) then) =
      __$$_ResetPasswordDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'success') bool success,
      @JsonKey(name: 'status') String status});
}

/// @nodoc
class __$$_ResetPasswordDtoCopyWithImpl<$Res>
    extends _$ResetPasswordDtoCopyWithImpl<$Res>
    implements _$$_ResetPasswordDtoCopyWith<$Res> {
  __$$_ResetPasswordDtoCopyWithImpl(
      _$_ResetPasswordDto _value, $Res Function(_$_ResetPasswordDto) _then)
      : super(_value, (v) => _then(v as _$_ResetPasswordDto));

  @override
  _$_ResetPasswordDto get _value => super._value as _$_ResetPasswordDto;

  @override
  $Res call({
    Object? success = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_ResetPasswordDto(
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ResetPasswordDto extends _ResetPasswordDto {
  const _$_ResetPasswordDto(
      {@JsonKey(name: 'success') required this.success,
      @JsonKey(name: 'status') required this.status})
      : super._();

  factory _$_ResetPasswordDto.fromJson(Map<String, dynamic> json) =>
      _$$_ResetPasswordDtoFromJson(json);

  @override
  @JsonKey(name: 'success')
  final bool success;
  @override
  @JsonKey(name: 'status')
  final String status;

  @override
  String toString() {
    return 'ResetPasswordDto(success: $success, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResetPasswordDto &&
            const DeepCollectionEquality().equals(other.success, success) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(success),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$$_ResetPasswordDtoCopyWith<_$_ResetPasswordDto> get copyWith =>
      __$$_ResetPasswordDtoCopyWithImpl<_$_ResetPasswordDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResetPasswordDtoToJson(
      this,
    );
  }
}

abstract class _ResetPasswordDto extends ResetPasswordDto {
  const factory _ResetPasswordDto(
          {@JsonKey(name: 'success') required final bool success,
          @JsonKey(name: 'status') required final String status}) =
      _$_ResetPasswordDto;
  const _ResetPasswordDto._() : super._();

  factory _ResetPasswordDto.fromJson(Map<String, dynamic> json) =
      _$_ResetPasswordDto.fromJson;

  @override
  @JsonKey(name: 'success')
  bool get success;
  @override
  @JsonKey(name: 'status')
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$_ResetPasswordDtoCopyWith<_$_ResetPasswordDto> get copyWith =>
      throw _privateConstructorUsedError;
}

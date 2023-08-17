// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_language_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UpdateLanguageResponse {
  bool get success => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpdateLanguageResponseCopyWith<UpdateLanguageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateLanguageResponseCopyWith<$Res> {
  factory $UpdateLanguageResponseCopyWith(UpdateLanguageResponse value,
          $Res Function(UpdateLanguageResponse) then) =
      _$UpdateLanguageResponseCopyWithImpl<$Res, UpdateLanguageResponse>;
  @useResult
  $Res call({bool success});
}

/// @nodoc
class _$UpdateLanguageResponseCopyWithImpl<$Res,
        $Val extends UpdateLanguageResponse>
    implements $UpdateLanguageResponseCopyWith<$Res> {
  _$UpdateLanguageResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UpdateLanguageResponseCopyWith<$Res>
    implements $UpdateLanguageResponseCopyWith<$Res> {
  factory _$$_UpdateLanguageResponseCopyWith(_$_UpdateLanguageResponse value,
          $Res Function(_$_UpdateLanguageResponse) then) =
      __$$_UpdateLanguageResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success});
}

/// @nodoc
class __$$_UpdateLanguageResponseCopyWithImpl<$Res>
    extends _$UpdateLanguageResponseCopyWithImpl<$Res,
        _$_UpdateLanguageResponse>
    implements _$$_UpdateLanguageResponseCopyWith<$Res> {
  __$$_UpdateLanguageResponseCopyWithImpl(_$_UpdateLanguageResponse _value,
      $Res Function(_$_UpdateLanguageResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
  }) {
    return _then(_$_UpdateLanguageResponse(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_UpdateLanguageResponse implements _UpdateLanguageResponse {
  _$_UpdateLanguageResponse({required this.success});

  @override
  final bool success;

  @override
  String toString() {
    return 'UpdateLanguageResponse(success: $success)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateLanguageResponse &&
            (identical(other.success, success) || other.success == success));
  }

  @override
  int get hashCode => Object.hash(runtimeType, success);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateLanguageResponseCopyWith<_$_UpdateLanguageResponse> get copyWith =>
      __$$_UpdateLanguageResponseCopyWithImpl<_$_UpdateLanguageResponse>(
          this, _$identity);
}

abstract class _UpdateLanguageResponse implements UpdateLanguageResponse {
  factory _UpdateLanguageResponse({required final bool success}) =
      _$_UpdateLanguageResponse;

  @override
  bool get success;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateLanguageResponseCopyWith<_$_UpdateLanguageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

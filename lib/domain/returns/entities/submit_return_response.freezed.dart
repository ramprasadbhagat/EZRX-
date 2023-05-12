// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submit_return_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SubmitReturnResponse {
  String get requestID => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubmitReturnResponseCopyWith<SubmitReturnResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmitReturnResponseCopyWith<$Res> {
  factory $SubmitReturnResponseCopyWith(SubmitReturnResponse value,
          $Res Function(SubmitReturnResponse) then) =
      _$SubmitReturnResponseCopyWithImpl<$Res, SubmitReturnResponse>;
  @useResult
  $Res call({String requestID, String message});
}

/// @nodoc
class _$SubmitReturnResponseCopyWithImpl<$Res,
        $Val extends SubmitReturnResponse>
    implements $SubmitReturnResponseCopyWith<$Res> {
  _$SubmitReturnResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestID = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      requestID: null == requestID
          ? _value.requestID
          : requestID // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SubmitReturnResponseCopyWith<$Res>
    implements $SubmitReturnResponseCopyWith<$Res> {
  factory _$$_SubmitReturnResponseCopyWith(_$_SubmitReturnResponse value,
          $Res Function(_$_SubmitReturnResponse) then) =
      __$$_SubmitReturnResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String requestID, String message});
}

/// @nodoc
class __$$_SubmitReturnResponseCopyWithImpl<$Res>
    extends _$SubmitReturnResponseCopyWithImpl<$Res, _$_SubmitReturnResponse>
    implements _$$_SubmitReturnResponseCopyWith<$Res> {
  __$$_SubmitReturnResponseCopyWithImpl(_$_SubmitReturnResponse _value,
      $Res Function(_$_SubmitReturnResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestID = null,
    Object? message = null,
  }) {
    return _then(_$_SubmitReturnResponse(
      requestID: null == requestID
          ? _value.requestID
          : requestID // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SubmitReturnResponse extends _SubmitReturnResponse {
  const _$_SubmitReturnResponse(
      {required this.requestID, required this.message})
      : super._();

  @override
  final String requestID;
  @override
  final String message;

  @override
  String toString() {
    return 'SubmitReturnResponse(requestID: $requestID, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubmitReturnResponse &&
            (identical(other.requestID, requestID) ||
                other.requestID == requestID) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, requestID, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubmitReturnResponseCopyWith<_$_SubmitReturnResponse> get copyWith =>
      __$$_SubmitReturnResponseCopyWithImpl<_$_SubmitReturnResponse>(
          this, _$identity);
}

abstract class _SubmitReturnResponse extends SubmitReturnResponse {
  const factory _SubmitReturnResponse(
      {required final String requestID,
      required final String message}) = _$_SubmitReturnResponse;
  const _SubmitReturnResponse._() : super._();

  @override
  String get requestID;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_SubmitReturnResponseCopyWith<_$_SubmitReturnResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

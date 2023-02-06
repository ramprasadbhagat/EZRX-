// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'requests_by_user_return_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReturnSummaryRequestByUser {
  String get requestID => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReturnSummaryRequestByUserCopyWith<ReturnSummaryRequestByUser>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReturnSummaryRequestByUserCopyWith<$Res> {
  factory $ReturnSummaryRequestByUserCopyWith(ReturnSummaryRequestByUser value,
          $Res Function(ReturnSummaryRequestByUser) then) =
      _$ReturnSummaryRequestByUserCopyWithImpl<$Res,
          ReturnSummaryRequestByUser>;
  @useResult
  $Res call({String requestID});
}

/// @nodoc
class _$ReturnSummaryRequestByUserCopyWithImpl<$Res,
        $Val extends ReturnSummaryRequestByUser>
    implements $ReturnSummaryRequestByUserCopyWith<$Res> {
  _$ReturnSummaryRequestByUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestID = null,
  }) {
    return _then(_value.copyWith(
      requestID: null == requestID
          ? _value.requestID
          : requestID // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReturnSummaryRequestByUserCopyWith<$Res>
    implements $ReturnSummaryRequestByUserCopyWith<$Res> {
  factory _$$_ReturnSummaryRequestByUserCopyWith(
          _$_ReturnSummaryRequestByUser value,
          $Res Function(_$_ReturnSummaryRequestByUser) then) =
      __$$_ReturnSummaryRequestByUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String requestID});
}

/// @nodoc
class __$$_ReturnSummaryRequestByUserCopyWithImpl<$Res>
    extends _$ReturnSummaryRequestByUserCopyWithImpl<$Res,
        _$_ReturnSummaryRequestByUser>
    implements _$$_ReturnSummaryRequestByUserCopyWith<$Res> {
  __$$_ReturnSummaryRequestByUserCopyWithImpl(
      _$_ReturnSummaryRequestByUser _value,
      $Res Function(_$_ReturnSummaryRequestByUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestID = null,
  }) {
    return _then(_$_ReturnSummaryRequestByUser(
      requestID: null == requestID
          ? _value.requestID
          : requestID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ReturnSummaryRequestByUser extends _ReturnSummaryRequestByUser {
  const _$_ReturnSummaryRequestByUser({required this.requestID}) : super._();

  @override
  final String requestID;

  @override
  String toString() {
    return 'ReturnSummaryRequestByUser(requestID: $requestID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReturnSummaryRequestByUser &&
            (identical(other.requestID, requestID) ||
                other.requestID == requestID));
  }

  @override
  int get hashCode => Object.hash(runtimeType, requestID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReturnSummaryRequestByUserCopyWith<_$_ReturnSummaryRequestByUser>
      get copyWith => __$$_ReturnSummaryRequestByUserCopyWithImpl<
          _$_ReturnSummaryRequestByUser>(this, _$identity);
}

abstract class _ReturnSummaryRequestByUser extends ReturnSummaryRequestByUser {
  const factory _ReturnSummaryRequestByUser({required final String requestID}) =
      _$_ReturnSummaryRequestByUser;
  const _ReturnSummaryRequestByUser._() : super._();

  @override
  String get requestID;
  @override
  @JsonKey(ignore: true)
  _$$_ReturnSummaryRequestByUserCopyWith<_$_ReturnSummaryRequestByUser>
      get copyWith => throw _privateConstructorUsedError;
}

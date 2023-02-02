// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'approver_return_requests_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ApproverReturnRequestsId {
  String get requestId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ApproverReturnRequestsIdCopyWith<ApproverReturnRequestsId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApproverReturnRequestsIdCopyWith<$Res> {
  factory $ApproverReturnRequestsIdCopyWith(ApproverReturnRequestsId value,
          $Res Function(ApproverReturnRequestsId) then) =
      _$ApproverReturnRequestsIdCopyWithImpl<$Res, ApproverReturnRequestsId>;
  @useResult
  $Res call({String requestId});
}

/// @nodoc
class _$ApproverReturnRequestsIdCopyWithImpl<$Res,
        $Val extends ApproverReturnRequestsId>
    implements $ApproverReturnRequestsIdCopyWith<$Res> {
  _$ApproverReturnRequestsIdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = null,
  }) {
    return _then(_value.copyWith(
      requestId: null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ApproverReturnRequestsIdCopyWith<$Res>
    implements $ApproverReturnRequestsIdCopyWith<$Res> {
  factory _$$_ApproverReturnRequestsIdCopyWith(
          _$_ApproverReturnRequestsId value,
          $Res Function(_$_ApproverReturnRequestsId) then) =
      __$$_ApproverReturnRequestsIdCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String requestId});
}

/// @nodoc
class __$$_ApproverReturnRequestsIdCopyWithImpl<$Res>
    extends _$ApproverReturnRequestsIdCopyWithImpl<$Res,
        _$_ApproverReturnRequestsId>
    implements _$$_ApproverReturnRequestsIdCopyWith<$Res> {
  __$$_ApproverReturnRequestsIdCopyWithImpl(_$_ApproverReturnRequestsId _value,
      $Res Function(_$_ApproverReturnRequestsId) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestId = null,
  }) {
    return _then(_$_ApproverReturnRequestsId(
      requestId: null == requestId
          ? _value.requestId
          : requestId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ApproverReturnRequestsId extends _ApproverReturnRequestsId {
  _$_ApproverReturnRequestsId({required this.requestId}) : super._();

  @override
  final String requestId;

  @override
  String toString() {
    return 'ApproverReturnRequestsId(requestId: $requestId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApproverReturnRequestsId &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, requestId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApproverReturnRequestsIdCopyWith<_$_ApproverReturnRequestsId>
      get copyWith => __$$_ApproverReturnRequestsIdCopyWithImpl<
          _$_ApproverReturnRequestsId>(this, _$identity);
}

abstract class _ApproverReturnRequestsId extends ApproverReturnRequestsId {
  factory _ApproverReturnRequestsId({required final String requestId}) =
      _$_ApproverReturnRequestsId;
  _ApproverReturnRequestsId._() : super._();

  @override
  String get requestId;
  @override
  @JsonKey(ignore: true)
  _$$_ApproverReturnRequestsIdCopyWith<_$_ApproverReturnRequestsId>
      get copyWith => throw _privateConstructorUsedError;
}

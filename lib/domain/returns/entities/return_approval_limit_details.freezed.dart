// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_approval_limit_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ApprovalLimits {
  SalesOrg get salesOrg => throw _privateConstructorUsedError;
  Username get userName => throw _privateConstructorUsedError;
  ApprovalLimit get valueUpperLimit => throw _privateConstructorUsedError;
  ApprovalLimit get valueLowerLimit => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ApprovalLimitsCopyWith<ApprovalLimits> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApprovalLimitsCopyWith<$Res> {
  factory $ApprovalLimitsCopyWith(
          ApprovalLimits value, $Res Function(ApprovalLimits) then) =
      _$ApprovalLimitsCopyWithImpl<$Res, ApprovalLimits>;
  @useResult
  $Res call(
      {SalesOrg salesOrg,
      Username userName,
      ApprovalLimit valueUpperLimit,
      ApprovalLimit valueLowerLimit,
      String uuid});
}

/// @nodoc
class _$ApprovalLimitsCopyWithImpl<$Res, $Val extends ApprovalLimits>
    implements $ApprovalLimitsCopyWith<$Res> {
  _$ApprovalLimitsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? userName = null,
    Object? valueUpperLimit = null,
    Object? valueLowerLimit = null,
    Object? uuid = null,
  }) {
    return _then(_value.copyWith(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as Username,
      valueUpperLimit: null == valueUpperLimit
          ? _value.valueUpperLimit
          : valueUpperLimit // ignore: cast_nullable_to_non_nullable
              as ApprovalLimit,
      valueLowerLimit: null == valueLowerLimit
          ? _value.valueLowerLimit
          : valueLowerLimit // ignore: cast_nullable_to_non_nullable
              as ApprovalLimit,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ApprovalLimitsCopyWith<$Res>
    implements $ApprovalLimitsCopyWith<$Res> {
  factory _$$_ApprovalLimitsCopyWith(
          _$_ApprovalLimits value, $Res Function(_$_ApprovalLimits) then) =
      __$$_ApprovalLimitsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SalesOrg salesOrg,
      Username userName,
      ApprovalLimit valueUpperLimit,
      ApprovalLimit valueLowerLimit,
      String uuid});
}

/// @nodoc
class __$$_ApprovalLimitsCopyWithImpl<$Res>
    extends _$ApprovalLimitsCopyWithImpl<$Res, _$_ApprovalLimits>
    implements _$$_ApprovalLimitsCopyWith<$Res> {
  __$$_ApprovalLimitsCopyWithImpl(
      _$_ApprovalLimits _value, $Res Function(_$_ApprovalLimits) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? userName = null,
    Object? valueUpperLimit = null,
    Object? valueLowerLimit = null,
    Object? uuid = null,
  }) {
    return _then(_$_ApprovalLimits(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as SalesOrg,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as Username,
      valueUpperLimit: null == valueUpperLimit
          ? _value.valueUpperLimit
          : valueUpperLimit // ignore: cast_nullable_to_non_nullable
              as ApprovalLimit,
      valueLowerLimit: null == valueLowerLimit
          ? _value.valueLowerLimit
          : valueLowerLimit // ignore: cast_nullable_to_non_nullable
              as ApprovalLimit,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ApprovalLimits extends _ApprovalLimits {
  const _$_ApprovalLimits(
      {required this.salesOrg,
      required this.userName,
      required this.valueUpperLimit,
      required this.valueLowerLimit,
      required this.uuid})
      : super._();

  @override
  final SalesOrg salesOrg;
  @override
  final Username userName;
  @override
  final ApprovalLimit valueUpperLimit;
  @override
  final ApprovalLimit valueLowerLimit;
  @override
  final String uuid;

  @override
  String toString() {
    return 'ApprovalLimits(salesOrg: $salesOrg, userName: $userName, valueUpperLimit: $valueUpperLimit, valueLowerLimit: $valueLowerLimit, uuid: $uuid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApprovalLimits &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.valueUpperLimit, valueUpperLimit) ||
                other.valueUpperLimit == valueUpperLimit) &&
            (identical(other.valueLowerLimit, valueLowerLimit) ||
                other.valueLowerLimit == valueLowerLimit) &&
            (identical(other.uuid, uuid) || other.uuid == uuid));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, salesOrg, userName, valueUpperLimit, valueLowerLimit, uuid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApprovalLimitsCopyWith<_$_ApprovalLimits> get copyWith =>
      __$$_ApprovalLimitsCopyWithImpl<_$_ApprovalLimits>(this, _$identity);
}

abstract class _ApprovalLimits extends ApprovalLimits {
  const factory _ApprovalLimits(
      {required final SalesOrg salesOrg,
      required final Username userName,
      required final ApprovalLimit valueUpperLimit,
      required final ApprovalLimit valueLowerLimit,
      required final String uuid}) = _$_ApprovalLimits;
  const _ApprovalLimits._() : super._();

  @override
  SalesOrg get salesOrg;
  @override
  Username get userName;
  @override
  ApprovalLimit get valueUpperLimit;
  @override
  ApprovalLimit get valueLowerLimit;
  @override
  String get uuid;
  @override
  @JsonKey(ignore: true)
  _$$_ApprovalLimitsCopyWith<_$_ApprovalLimits> get copyWith =>
      throw _privateConstructorUsedError;
}

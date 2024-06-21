// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_restriction_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserRestrictionStatus {
  String get approverRightsStatus => throw _privateConstructorUsedError;
  bool get approvalLimitStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserRestrictionStatusCopyWith<UserRestrictionStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRestrictionStatusCopyWith<$Res> {
  factory $UserRestrictionStatusCopyWith(UserRestrictionStatus value,
          $Res Function(UserRestrictionStatus) then) =
      _$UserRestrictionStatusCopyWithImpl<$Res, UserRestrictionStatus>;
  @useResult
  $Res call({String approverRightsStatus, bool approvalLimitStatus});
}

/// @nodoc
class _$UserRestrictionStatusCopyWithImpl<$Res,
        $Val extends UserRestrictionStatus>
    implements $UserRestrictionStatusCopyWith<$Res> {
  _$UserRestrictionStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? approverRightsStatus = null,
    Object? approvalLimitStatus = null,
  }) {
    return _then(_value.copyWith(
      approverRightsStatus: null == approverRightsStatus
          ? _value.approverRightsStatus
          : approverRightsStatus // ignore: cast_nullable_to_non_nullable
              as String,
      approvalLimitStatus: null == approvalLimitStatus
          ? _value.approvalLimitStatus
          : approvalLimitStatus // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserRestrictionStatusImplCopyWith<$Res>
    implements $UserRestrictionStatusCopyWith<$Res> {
  factory _$$UserRestrictionStatusImplCopyWith(
          _$UserRestrictionStatusImpl value,
          $Res Function(_$UserRestrictionStatusImpl) then) =
      __$$UserRestrictionStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String approverRightsStatus, bool approvalLimitStatus});
}

/// @nodoc
class __$$UserRestrictionStatusImplCopyWithImpl<$Res>
    extends _$UserRestrictionStatusCopyWithImpl<$Res,
        _$UserRestrictionStatusImpl>
    implements _$$UserRestrictionStatusImplCopyWith<$Res> {
  __$$UserRestrictionStatusImplCopyWithImpl(_$UserRestrictionStatusImpl _value,
      $Res Function(_$UserRestrictionStatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? approverRightsStatus = null,
    Object? approvalLimitStatus = null,
  }) {
    return _then(_$UserRestrictionStatusImpl(
      approverRightsStatus: null == approverRightsStatus
          ? _value.approverRightsStatus
          : approverRightsStatus // ignore: cast_nullable_to_non_nullable
              as String,
      approvalLimitStatus: null == approvalLimitStatus
          ? _value.approvalLimitStatus
          : approvalLimitStatus // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UserRestrictionStatusImpl extends _UserRestrictionStatus {
  const _$UserRestrictionStatusImpl(
      {required this.approverRightsStatus, required this.approvalLimitStatus})
      : super._();

  @override
  final String approverRightsStatus;
  @override
  final bool approvalLimitStatus;

  @override
  String toString() {
    return 'UserRestrictionStatus(approverRightsStatus: $approverRightsStatus, approvalLimitStatus: $approvalLimitStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRestrictionStatusImpl &&
            (identical(other.approverRightsStatus, approverRightsStatus) ||
                other.approverRightsStatus == approverRightsStatus) &&
            (identical(other.approvalLimitStatus, approvalLimitStatus) ||
                other.approvalLimitStatus == approvalLimitStatus));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, approverRightsStatus, approvalLimitStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRestrictionStatusImplCopyWith<_$UserRestrictionStatusImpl>
      get copyWith => __$$UserRestrictionStatusImplCopyWithImpl<
          _$UserRestrictionStatusImpl>(this, _$identity);
}

abstract class _UserRestrictionStatus extends UserRestrictionStatus {
  const factory _UserRestrictionStatus(
      {required final String approverRightsStatus,
      required final bool approvalLimitStatus}) = _$UserRestrictionStatusImpl;
  const _UserRestrictionStatus._() : super._();

  @override
  String get approverRightsStatus;
  @override
  bool get approvalLimitStatus;
  @override
  @JsonKey(ignore: true)
  _$$UserRestrictionStatusImplCopyWith<_$UserRestrictionStatusImpl>
      get copyWith => throw _privateConstructorUsedError;
}

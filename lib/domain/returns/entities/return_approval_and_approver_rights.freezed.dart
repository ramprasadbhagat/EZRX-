// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'return_approval_and_approver_rights.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserRestrictions {
  List<ApprovalLimits> get approverLimits => throw _privateConstructorUsedError;
  ApproverRights get approverRights => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserRestrictionsCopyWith<UserRestrictions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRestrictionsCopyWith<$Res> {
  factory $UserRestrictionsCopyWith(
          UserRestrictions value, $Res Function(UserRestrictions) then) =
      _$UserRestrictionsCopyWithImpl<$Res, UserRestrictions>;
  @useResult
  $Res call(
      {List<ApprovalLimits> approverLimits, ApproverRights approverRights});

  $ApproverRightsCopyWith<$Res> get approverRights;
}

/// @nodoc
class _$UserRestrictionsCopyWithImpl<$Res, $Val extends UserRestrictions>
    implements $UserRestrictionsCopyWith<$Res> {
  _$UserRestrictionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? approverLimits = null,
    Object? approverRights = null,
  }) {
    return _then(_value.copyWith(
      approverLimits: null == approverLimits
          ? _value.approverLimits
          : approverLimits // ignore: cast_nullable_to_non_nullable
              as List<ApprovalLimits>,
      approverRights: null == approverRights
          ? _value.approverRights
          : approverRights // ignore: cast_nullable_to_non_nullable
              as ApproverRights,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ApproverRightsCopyWith<$Res> get approverRights {
    return $ApproverRightsCopyWith<$Res>(_value.approverRights, (value) {
      return _then(_value.copyWith(approverRights: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserRestrictionsImplCopyWith<$Res>
    implements $UserRestrictionsCopyWith<$Res> {
  factory _$$UserRestrictionsImplCopyWith(_$UserRestrictionsImpl value,
          $Res Function(_$UserRestrictionsImpl) then) =
      __$$UserRestrictionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ApprovalLimits> approverLimits, ApproverRights approverRights});

  @override
  $ApproverRightsCopyWith<$Res> get approverRights;
}

/// @nodoc
class __$$UserRestrictionsImplCopyWithImpl<$Res>
    extends _$UserRestrictionsCopyWithImpl<$Res, _$UserRestrictionsImpl>
    implements _$$UserRestrictionsImplCopyWith<$Res> {
  __$$UserRestrictionsImplCopyWithImpl(_$UserRestrictionsImpl _value,
      $Res Function(_$UserRestrictionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? approverLimits = null,
    Object? approverRights = null,
  }) {
    return _then(_$UserRestrictionsImpl(
      approverLimits: null == approverLimits
          ? _value._approverLimits
          : approverLimits // ignore: cast_nullable_to_non_nullable
              as List<ApprovalLimits>,
      approverRights: null == approverRights
          ? _value.approverRights
          : approverRights // ignore: cast_nullable_to_non_nullable
              as ApproverRights,
    ));
  }
}

/// @nodoc

class _$UserRestrictionsImpl extends _UserRestrictions {
  const _$UserRestrictionsImpl(
      {required final List<ApprovalLimits> approverLimits,
      required this.approverRights})
      : _approverLimits = approverLimits,
        super._();

  final List<ApprovalLimits> _approverLimits;
  @override
  List<ApprovalLimits> get approverLimits {
    if (_approverLimits is EqualUnmodifiableListView) return _approverLimits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_approverLimits);
  }

  @override
  final ApproverRights approverRights;

  @override
  String toString() {
    return 'UserRestrictions(approverLimits: $approverLimits, approverRights: $approverRights)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRestrictionsImpl &&
            const DeepCollectionEquality()
                .equals(other._approverLimits, _approverLimits) &&
            (identical(other.approverRights, approverRights) ||
                other.approverRights == approverRights));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_approverLimits), approverRights);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRestrictionsImplCopyWith<_$UserRestrictionsImpl> get copyWith =>
      __$$UserRestrictionsImplCopyWithImpl<_$UserRestrictionsImpl>(
          this, _$identity);
}

abstract class _UserRestrictions extends UserRestrictions {
  const factory _UserRestrictions(
      {required final List<ApprovalLimits> approverLimits,
      required final ApproverRights approverRights}) = _$UserRestrictionsImpl;
  const _UserRestrictions._() : super._();

  @override
  List<ApprovalLimits> get approverLimits;
  @override
  ApproverRights get approverRights;
  @override
  @JsonKey(ignore: true)
  _$$UserRestrictionsImplCopyWith<_$UserRestrictionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

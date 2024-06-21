// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_restrictions_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserRestrictionsDto _$UserRestrictionsDtoFromJson(Map<String, dynamic> json) {
  return _UserRestrictionsDto.fromJson(json);
}

/// @nodoc
mixin _$UserRestrictionsDto {
  @JsonKey(name: 'approverRights')
  ApproverRightsDto get approverRights => throw _privateConstructorUsedError;
  @JsonKey(name: 'returnApprovalLimit', defaultValue: <ApprovalLimitsDto>[])
  List<ApprovalLimitsDto> get approverLimits =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserRestrictionsDtoCopyWith<UserRestrictionsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRestrictionsDtoCopyWith<$Res> {
  factory $UserRestrictionsDtoCopyWith(
          UserRestrictionsDto value, $Res Function(UserRestrictionsDto) then) =
      _$UserRestrictionsDtoCopyWithImpl<$Res, UserRestrictionsDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'approverRights') ApproverRightsDto approverRights,
      @JsonKey(name: 'returnApprovalLimit', defaultValue: <ApprovalLimitsDto>[])
      List<ApprovalLimitsDto> approverLimits});

  $ApproverRightsDtoCopyWith<$Res> get approverRights;
}

/// @nodoc
class _$UserRestrictionsDtoCopyWithImpl<$Res, $Val extends UserRestrictionsDto>
    implements $UserRestrictionsDtoCopyWith<$Res> {
  _$UserRestrictionsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? approverRights = null,
    Object? approverLimits = null,
  }) {
    return _then(_value.copyWith(
      approverRights: null == approverRights
          ? _value.approverRights
          : approverRights // ignore: cast_nullable_to_non_nullable
              as ApproverRightsDto,
      approverLimits: null == approverLimits
          ? _value.approverLimits
          : approverLimits // ignore: cast_nullable_to_non_nullable
              as List<ApprovalLimitsDto>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ApproverRightsDtoCopyWith<$Res> get approverRights {
    return $ApproverRightsDtoCopyWith<$Res>(_value.approverRights, (value) {
      return _then(_value.copyWith(approverRights: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserRestrictionsDtoImplCopyWith<$Res>
    implements $UserRestrictionsDtoCopyWith<$Res> {
  factory _$$UserRestrictionsDtoImplCopyWith(_$UserRestrictionsDtoImpl value,
          $Res Function(_$UserRestrictionsDtoImpl) then) =
      __$$UserRestrictionsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'approverRights') ApproverRightsDto approverRights,
      @JsonKey(name: 'returnApprovalLimit', defaultValue: <ApprovalLimitsDto>[])
      List<ApprovalLimitsDto> approverLimits});

  @override
  $ApproverRightsDtoCopyWith<$Res> get approverRights;
}

/// @nodoc
class __$$UserRestrictionsDtoImplCopyWithImpl<$Res>
    extends _$UserRestrictionsDtoCopyWithImpl<$Res, _$UserRestrictionsDtoImpl>
    implements _$$UserRestrictionsDtoImplCopyWith<$Res> {
  __$$UserRestrictionsDtoImplCopyWithImpl(_$UserRestrictionsDtoImpl _value,
      $Res Function(_$UserRestrictionsDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? approverRights = null,
    Object? approverLimits = null,
  }) {
    return _then(_$UserRestrictionsDtoImpl(
      approverRights: null == approverRights
          ? _value.approverRights
          : approverRights // ignore: cast_nullable_to_non_nullable
              as ApproverRightsDto,
      approverLimits: null == approverLimits
          ? _value._approverLimits
          : approverLimits // ignore: cast_nullable_to_non_nullable
              as List<ApprovalLimitsDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserRestrictionsDtoImpl extends _UserRestrictionsDto {
  const _$UserRestrictionsDtoImpl(
      {@JsonKey(name: 'approverRights') required this.approverRights,
      @JsonKey(name: 'returnApprovalLimit', defaultValue: <ApprovalLimitsDto>[])
      required final List<ApprovalLimitsDto> approverLimits})
      : _approverLimits = approverLimits,
        super._();

  factory _$UserRestrictionsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserRestrictionsDtoImplFromJson(json);

  @override
  @JsonKey(name: 'approverRights')
  final ApproverRightsDto approverRights;
  final List<ApprovalLimitsDto> _approverLimits;
  @override
  @JsonKey(name: 'returnApprovalLimit', defaultValue: <ApprovalLimitsDto>[])
  List<ApprovalLimitsDto> get approverLimits {
    if (_approverLimits is EqualUnmodifiableListView) return _approverLimits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_approverLimits);
  }

  @override
  String toString() {
    return 'UserRestrictionsDto(approverRights: $approverRights, approverLimits: $approverLimits)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRestrictionsDtoImpl &&
            (identical(other.approverRights, approverRights) ||
                other.approverRights == approverRights) &&
            const DeepCollectionEquality()
                .equals(other._approverLimits, _approverLimits));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, approverRights,
      const DeepCollectionEquality().hash(_approverLimits));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRestrictionsDtoImplCopyWith<_$UserRestrictionsDtoImpl> get copyWith =>
      __$$UserRestrictionsDtoImplCopyWithImpl<_$UserRestrictionsDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserRestrictionsDtoImplToJson(
      this,
    );
  }
}

abstract class _UserRestrictionsDto extends UserRestrictionsDto {
  const factory _UserRestrictionsDto(
          {@JsonKey(name: 'approverRights')
          required final ApproverRightsDto approverRights,
          @JsonKey(
              name: 'returnApprovalLimit', defaultValue: <ApprovalLimitsDto>[])
          required final List<ApprovalLimitsDto> approverLimits}) =
      _$UserRestrictionsDtoImpl;
  const _UserRestrictionsDto._() : super._();

  factory _UserRestrictionsDto.fromJson(Map<String, dynamic> json) =
      _$UserRestrictionsDtoImpl.fromJson;

  @override
  @JsonKey(name: 'approverRights')
  ApproverRightsDto get approverRights;
  @override
  @JsonKey(name: 'returnApprovalLimit', defaultValue: <ApprovalLimitsDto>[])
  List<ApprovalLimitsDto> get approverLimits;
  @override
  @JsonKey(ignore: true)
  _$$UserRestrictionsDtoImplCopyWith<_$UserRestrictionsDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_restriction_status_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserRestrictionStatusDto _$UserRestrictionStatusDtoFromJson(
    Map<String, dynamic> json) {
  return _UserRestrictionStatusDto.fromJson(json);
}

/// @nodoc
mixin _$UserRestrictionStatusDto {
  @JsonKey(
      name: 'approverRightStatus',
      defaultValue: '',
      readValue: JsonReadValueHelper.readUserRestrictionOverride)
  String get userRestrictionStatus => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'approvalLimitStatus',
      defaultValue: false,
      readValue: JsonReadValueHelper.readUserReturnApprovalLimitOverride)
  bool get userReturnApprovalLimit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserRestrictionStatusDtoCopyWith<UserRestrictionStatusDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRestrictionStatusDtoCopyWith<$Res> {
  factory $UserRestrictionStatusDtoCopyWith(UserRestrictionStatusDto value,
          $Res Function(UserRestrictionStatusDto) then) =
      _$UserRestrictionStatusDtoCopyWithImpl<$Res, UserRestrictionStatusDto>;
  @useResult
  $Res call(
      {@JsonKey(
          name: 'approverRightStatus',
          defaultValue: '',
          readValue: JsonReadValueHelper.readUserRestrictionOverride)
      String userRestrictionStatus,
      @JsonKey(
          name: 'approvalLimitStatus',
          defaultValue: false,
          readValue: JsonReadValueHelper.readUserReturnApprovalLimitOverride)
      bool userReturnApprovalLimit});
}

/// @nodoc
class _$UserRestrictionStatusDtoCopyWithImpl<$Res,
        $Val extends UserRestrictionStatusDto>
    implements $UserRestrictionStatusDtoCopyWith<$Res> {
  _$UserRestrictionStatusDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userRestrictionStatus = null,
    Object? userReturnApprovalLimit = null,
  }) {
    return _then(_value.copyWith(
      userRestrictionStatus: null == userRestrictionStatus
          ? _value.userRestrictionStatus
          : userRestrictionStatus // ignore: cast_nullable_to_non_nullable
              as String,
      userReturnApprovalLimit: null == userReturnApprovalLimit
          ? _value.userReturnApprovalLimit
          : userReturnApprovalLimit // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserRestrictionStatusDtoImplCopyWith<$Res>
    implements $UserRestrictionStatusDtoCopyWith<$Res> {
  factory _$$UserRestrictionStatusDtoImplCopyWith(
          _$UserRestrictionStatusDtoImpl value,
          $Res Function(_$UserRestrictionStatusDtoImpl) then) =
      __$$UserRestrictionStatusDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(
          name: 'approverRightStatus',
          defaultValue: '',
          readValue: JsonReadValueHelper.readUserRestrictionOverride)
      String userRestrictionStatus,
      @JsonKey(
          name: 'approvalLimitStatus',
          defaultValue: false,
          readValue: JsonReadValueHelper.readUserReturnApprovalLimitOverride)
      bool userReturnApprovalLimit});
}

/// @nodoc
class __$$UserRestrictionStatusDtoImplCopyWithImpl<$Res>
    extends _$UserRestrictionStatusDtoCopyWithImpl<$Res,
        _$UserRestrictionStatusDtoImpl>
    implements _$$UserRestrictionStatusDtoImplCopyWith<$Res> {
  __$$UserRestrictionStatusDtoImplCopyWithImpl(
      _$UserRestrictionStatusDtoImpl _value,
      $Res Function(_$UserRestrictionStatusDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userRestrictionStatus = null,
    Object? userReturnApprovalLimit = null,
  }) {
    return _then(_$UserRestrictionStatusDtoImpl(
      userRestrictionStatus: null == userRestrictionStatus
          ? _value.userRestrictionStatus
          : userRestrictionStatus // ignore: cast_nullable_to_non_nullable
              as String,
      userReturnApprovalLimit: null == userReturnApprovalLimit
          ? _value.userReturnApprovalLimit
          : userReturnApprovalLimit // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserRestrictionStatusDtoImpl extends _UserRestrictionStatusDto {
  const _$UserRestrictionStatusDtoImpl(
      {@JsonKey(
          name: 'approverRightStatus',
          defaultValue: '',
          readValue: JsonReadValueHelper.readUserRestrictionOverride)
      required this.userRestrictionStatus,
      @JsonKey(
          name: 'approvalLimitStatus',
          defaultValue: false,
          readValue: JsonReadValueHelper.readUserReturnApprovalLimitOverride)
      required this.userReturnApprovalLimit})
      : super._();

  factory _$UserRestrictionStatusDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserRestrictionStatusDtoImplFromJson(json);

  @override
  @JsonKey(
      name: 'approverRightStatus',
      defaultValue: '',
      readValue: JsonReadValueHelper.readUserRestrictionOverride)
  final String userRestrictionStatus;
  @override
  @JsonKey(
      name: 'approvalLimitStatus',
      defaultValue: false,
      readValue: JsonReadValueHelper.readUserReturnApprovalLimitOverride)
  final bool userReturnApprovalLimit;

  @override
  String toString() {
    return 'UserRestrictionStatusDto(userRestrictionStatus: $userRestrictionStatus, userReturnApprovalLimit: $userReturnApprovalLimit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRestrictionStatusDtoImpl &&
            (identical(other.userRestrictionStatus, userRestrictionStatus) ||
                other.userRestrictionStatus == userRestrictionStatus) &&
            (identical(
                    other.userReturnApprovalLimit, userReturnApprovalLimit) ||
                other.userReturnApprovalLimit == userReturnApprovalLimit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userRestrictionStatus, userReturnApprovalLimit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRestrictionStatusDtoImplCopyWith<_$UserRestrictionStatusDtoImpl>
      get copyWith => __$$UserRestrictionStatusDtoImplCopyWithImpl<
          _$UserRestrictionStatusDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserRestrictionStatusDtoImplToJson(
      this,
    );
  }
}

abstract class _UserRestrictionStatusDto extends UserRestrictionStatusDto {
  const factory _UserRestrictionStatusDto(
      {@JsonKey(
          name: 'approverRightStatus',
          defaultValue: '',
          readValue: JsonReadValueHelper.readUserRestrictionOverride)
      required final String userRestrictionStatus,
      @JsonKey(
          name: 'approvalLimitStatus',
          defaultValue: false,
          readValue: JsonReadValueHelper.readUserReturnApprovalLimitOverride)
      required final bool
          userReturnApprovalLimit}) = _$UserRestrictionStatusDtoImpl;
  const _UserRestrictionStatusDto._() : super._();

  factory _UserRestrictionStatusDto.fromJson(Map<String, dynamic> json) =
      _$UserRestrictionStatusDtoImpl.fromJson;

  @override
  @JsonKey(
      name: 'approverRightStatus',
      defaultValue: '',
      readValue: JsonReadValueHelper.readUserRestrictionOverride)
  String get userRestrictionStatus;
  @override
  @JsonKey(
      name: 'approvalLimitStatus',
      defaultValue: false,
      readValue: JsonReadValueHelper.readUserReturnApprovalLimitOverride)
  bool get userReturnApprovalLimit;
  @override
  @JsonKey(ignore: true)
  _$$UserRestrictionStatusDtoImplCopyWith<_$UserRestrictionStatusDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

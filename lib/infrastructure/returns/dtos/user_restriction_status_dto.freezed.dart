// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_restriction_status_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserRestrictionStatusDto _$UserRestrictionStatusDtoFromJson(
    Map<String, dynamic> json) {
  return _UserRestrictionStatusDto.fromJson(json);
}

/// @nodoc
mixin _$UserRestrictionStatusDto {
  @JsonKey(
      name: 'approverRightStatus',
      defaultValue: '',
      readValue: userRestrictionOverride)
  String get userRestrictionStatus => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'approvalLimitStatus',
      defaultValue: false,
      readValue: userReturnApprovalLimitOverride)
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
      {@JsonKey(name: 'approverRightStatus', defaultValue: '', readValue: userRestrictionOverride)
          String userRestrictionStatus,
      @JsonKey(name: 'approvalLimitStatus', defaultValue: false, readValue: userReturnApprovalLimitOverride)
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
abstract class _$$_UserRestrictionStatusDtoCopyWith<$Res>
    implements $UserRestrictionStatusDtoCopyWith<$Res> {
  factory _$$_UserRestrictionStatusDtoCopyWith(
          _$_UserRestrictionStatusDto value,
          $Res Function(_$_UserRestrictionStatusDto) then) =
      __$$_UserRestrictionStatusDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'approverRightStatus', defaultValue: '', readValue: userRestrictionOverride)
          String userRestrictionStatus,
      @JsonKey(name: 'approvalLimitStatus', defaultValue: false, readValue: userReturnApprovalLimitOverride)
          bool userReturnApprovalLimit});
}

/// @nodoc
class __$$_UserRestrictionStatusDtoCopyWithImpl<$Res>
    extends _$UserRestrictionStatusDtoCopyWithImpl<$Res,
        _$_UserRestrictionStatusDto>
    implements _$$_UserRestrictionStatusDtoCopyWith<$Res> {
  __$$_UserRestrictionStatusDtoCopyWithImpl(_$_UserRestrictionStatusDto _value,
      $Res Function(_$_UserRestrictionStatusDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userRestrictionStatus = null,
    Object? userReturnApprovalLimit = null,
  }) {
    return _then(_$_UserRestrictionStatusDto(
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
class _$_UserRestrictionStatusDto extends _UserRestrictionStatusDto {
  const _$_UserRestrictionStatusDto(
      {@JsonKey(name: 'approverRightStatus', defaultValue: '', readValue: userRestrictionOverride)
          required this.userRestrictionStatus,
      @JsonKey(name: 'approvalLimitStatus', defaultValue: false, readValue: userReturnApprovalLimitOverride)
          required this.userReturnApprovalLimit})
      : super._();

  factory _$_UserRestrictionStatusDto.fromJson(Map<String, dynamic> json) =>
      _$$_UserRestrictionStatusDtoFromJson(json);

  @override
  @JsonKey(
      name: 'approverRightStatus',
      defaultValue: '',
      readValue: userRestrictionOverride)
  final String userRestrictionStatus;
  @override
  @JsonKey(
      name: 'approvalLimitStatus',
      defaultValue: false,
      readValue: userReturnApprovalLimitOverride)
  final bool userReturnApprovalLimit;

  @override
  String toString() {
    return 'UserRestrictionStatusDto(userRestrictionStatus: $userRestrictionStatus, userReturnApprovalLimit: $userReturnApprovalLimit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserRestrictionStatusDto &&
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
  _$$_UserRestrictionStatusDtoCopyWith<_$_UserRestrictionStatusDto>
      get copyWith => __$$_UserRestrictionStatusDtoCopyWithImpl<
          _$_UserRestrictionStatusDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserRestrictionStatusDtoToJson(
      this,
    );
  }
}

abstract class _UserRestrictionStatusDto extends UserRestrictionStatusDto {
  const factory _UserRestrictionStatusDto(
      {@JsonKey(name: 'approverRightStatus', defaultValue: '', readValue: userRestrictionOverride)
          required final String userRestrictionStatus,
      @JsonKey(name: 'approvalLimitStatus', defaultValue: false, readValue: userReturnApprovalLimitOverride)
          required final bool userReturnApprovalLimit}) = _$_UserRestrictionStatusDto;
  const _UserRestrictionStatusDto._() : super._();

  factory _UserRestrictionStatusDto.fromJson(Map<String, dynamic> json) =
      _$_UserRestrictionStatusDto.fromJson;

  @override
  @JsonKey(
      name: 'approverRightStatus',
      defaultValue: '',
      readValue: userRestrictionOverride)
  String get userRestrictionStatus;
  @override
  @JsonKey(
      name: 'approvalLimitStatus',
      defaultValue: false,
      readValue: userReturnApprovalLimitOverride)
  bool get userReturnApprovalLimit;
  @override
  @JsonKey(ignore: true)
  _$$_UserRestrictionStatusDtoCopyWith<_$_UserRestrictionStatusDto>
      get copyWith => throw _privateConstructorUsedError;
}

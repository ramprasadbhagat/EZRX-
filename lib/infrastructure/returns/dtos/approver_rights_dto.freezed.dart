// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'approver_rights_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApproverRightsDto _$ApproverRightsDtoFromJson(Map<String, dynamic> json) {
  return _AddReturnApprovalLimitDto.fromJson(json);
}

/// @nodoc
mixin _$ApproverRightsDto {
  @JsonKey(
      name: 'rawMetaData',
      defaultValue: <String>[],
      readValue: rawMetaDataOverride)
  List<String> get usernames => throw _privateConstructorUsedError;
  @JsonKey(name: 'approverRights', defaultValue: <ApproverRightsDetailsDto>[])
  List<ApproverRightsDetailsDto> get approverRights =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApproverRightsDtoCopyWith<ApproverRightsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApproverRightsDtoCopyWith<$Res> {
  factory $ApproverRightsDtoCopyWith(
          ApproverRightsDto value, $Res Function(ApproverRightsDto) then) =
      _$ApproverRightsDtoCopyWithImpl<$Res, ApproverRightsDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'rawMetaData', defaultValue: <String>[], readValue: rawMetaDataOverride)
          List<String> usernames,
      @JsonKey(name: 'approverRights', defaultValue: <ApproverRightsDetailsDto>[])
          List<ApproverRightsDetailsDto> approverRights});
}

/// @nodoc
class _$ApproverRightsDtoCopyWithImpl<$Res, $Val extends ApproverRightsDto>
    implements $ApproverRightsDtoCopyWith<$Res> {
  _$ApproverRightsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usernames = null,
    Object? approverRights = null,
  }) {
    return _then(_value.copyWith(
      usernames: null == usernames
          ? _value.usernames
          : usernames // ignore: cast_nullable_to_non_nullable
              as List<String>,
      approverRights: null == approverRights
          ? _value.approverRights
          : approverRights // ignore: cast_nullable_to_non_nullable
              as List<ApproverRightsDetailsDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddReturnApprovalLimitDtoCopyWith<$Res>
    implements $ApproverRightsDtoCopyWith<$Res> {
  factory _$$_AddReturnApprovalLimitDtoCopyWith(
          _$_AddReturnApprovalLimitDto value,
          $Res Function(_$_AddReturnApprovalLimitDto) then) =
      __$$_AddReturnApprovalLimitDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'rawMetaData', defaultValue: <String>[], readValue: rawMetaDataOverride)
          List<String> usernames,
      @JsonKey(name: 'approverRights', defaultValue: <ApproverRightsDetailsDto>[])
          List<ApproverRightsDetailsDto> approverRights});
}

/// @nodoc
class __$$_AddReturnApprovalLimitDtoCopyWithImpl<$Res>
    extends _$ApproverRightsDtoCopyWithImpl<$Res, _$_AddReturnApprovalLimitDto>
    implements _$$_AddReturnApprovalLimitDtoCopyWith<$Res> {
  __$$_AddReturnApprovalLimitDtoCopyWithImpl(
      _$_AddReturnApprovalLimitDto _value,
      $Res Function(_$_AddReturnApprovalLimitDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usernames = null,
    Object? approverRights = null,
  }) {
    return _then(_$_AddReturnApprovalLimitDto(
      usernames: null == usernames
          ? _value._usernames
          : usernames // ignore: cast_nullable_to_non_nullable
              as List<String>,
      approverRights: null == approverRights
          ? _value._approverRights
          : approverRights // ignore: cast_nullable_to_non_nullable
              as List<ApproverRightsDetailsDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AddReturnApprovalLimitDto extends _AddReturnApprovalLimitDto {
  const _$_AddReturnApprovalLimitDto(
      {@JsonKey(name: 'rawMetaData', defaultValue: <String>[], readValue: rawMetaDataOverride)
          required final List<String> usernames,
      @JsonKey(name: 'approverRights', defaultValue: <ApproverRightsDetailsDto>[])
          required final List<ApproverRightsDetailsDto> approverRights})
      : _usernames = usernames,
        _approverRights = approverRights,
        super._();

  factory _$_AddReturnApprovalLimitDto.fromJson(Map<String, dynamic> json) =>
      _$$_AddReturnApprovalLimitDtoFromJson(json);

  final List<String> _usernames;
  @override
  @JsonKey(
      name: 'rawMetaData',
      defaultValue: <String>[],
      readValue: rawMetaDataOverride)
  List<String> get usernames {
    if (_usernames is EqualUnmodifiableListView) return _usernames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_usernames);
  }

  final List<ApproverRightsDetailsDto> _approverRights;
  @override
  @JsonKey(name: 'approverRights', defaultValue: <ApproverRightsDetailsDto>[])
  List<ApproverRightsDetailsDto> get approverRights {
    if (_approverRights is EqualUnmodifiableListView) return _approverRights;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_approverRights);
  }

  @override
  String toString() {
    return 'ApproverRightsDto(usernames: $usernames, approverRights: $approverRights)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddReturnApprovalLimitDto &&
            const DeepCollectionEquality()
                .equals(other._usernames, _usernames) &&
            const DeepCollectionEquality()
                .equals(other._approverRights, _approverRights));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_usernames),
      const DeepCollectionEquality().hash(_approverRights));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddReturnApprovalLimitDtoCopyWith<_$_AddReturnApprovalLimitDto>
      get copyWith => __$$_AddReturnApprovalLimitDtoCopyWithImpl<
          _$_AddReturnApprovalLimitDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddReturnApprovalLimitDtoToJson(
      this,
    );
  }
}

abstract class _AddReturnApprovalLimitDto extends ApproverRightsDto {
  const factory _AddReturnApprovalLimitDto(
      {@JsonKey(name: 'rawMetaData', defaultValue: <String>[], readValue: rawMetaDataOverride)
          required final List<String> usernames,
      @JsonKey(name: 'approverRights', defaultValue: <ApproverRightsDetailsDto>[])
          required final List<ApproverRightsDetailsDto> approverRights}) = _$_AddReturnApprovalLimitDto;
  const _AddReturnApprovalLimitDto._() : super._();

  factory _AddReturnApprovalLimitDto.fromJson(Map<String, dynamic> json) =
      _$_AddReturnApprovalLimitDto.fromJson;

  @override
  @JsonKey(
      name: 'rawMetaData',
      defaultValue: <String>[],
      readValue: rawMetaDataOverride)
  List<String> get usernames;
  @override
  @JsonKey(name: 'approverRights', defaultValue: <ApproverRightsDetailsDto>[])
  List<ApproverRightsDetailsDto> get approverRights;
  @override
  @JsonKey(ignore: true)
  _$$_AddReturnApprovalLimitDtoCopyWith<_$_AddReturnApprovalLimitDto>
      get copyWith => throw _privateConstructorUsedError;
}

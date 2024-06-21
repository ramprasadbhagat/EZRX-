// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'policy_configuration_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PolicyConfigurationDto _$PolicyConfigurationDtoFromJson(
    Map<String, dynamic> json) {
  return _PolicyConfigurationDto.fromJson(json);
}

/// @nodoc
mixin _$PolicyConfigurationDto {
  @JsonKey(name: 'salesOrg', defaultValue: '')
  String get salesOrg => throw _privateConstructorUsedError;
  @JsonKey(name: 'principalCode', defaultValue: '')
  String get principalCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'monthsBeforeExpiry', defaultValue: '')
  String get monthsBeforeExpiry => throw _privateConstructorUsedError;
  @JsonKey(name: 'monthsAfterExpiry', defaultValue: '')
  String get monthsAfterExpiry => throw _privateConstructorUsedError;
  @JsonKey(name: 'uuid', defaultValue: '')
  String get uuid => throw _privateConstructorUsedError;
  @JsonKey(name: 'returnsAllowed', defaultValue: false)
  bool get returnsAllowed => throw _privateConstructorUsedError;
  @JsonKey(name: 'principalName', defaultValue: '')
  String get principalName => throw _privateConstructorUsedError;
  @JsonKey(name: 'status', defaultValue: '')
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PolicyConfigurationDtoCopyWith<PolicyConfigurationDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PolicyConfigurationDtoCopyWith<$Res> {
  factory $PolicyConfigurationDtoCopyWith(PolicyConfigurationDto value,
          $Res Function(PolicyConfigurationDto) then) =
      _$PolicyConfigurationDtoCopyWithImpl<$Res, PolicyConfigurationDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'salesOrg', defaultValue: '') String salesOrg,
      @JsonKey(name: 'principalCode', defaultValue: '') String principalCode,
      @JsonKey(name: 'monthsBeforeExpiry', defaultValue: '')
      String monthsBeforeExpiry,
      @JsonKey(name: 'monthsAfterExpiry', defaultValue: '')
      String monthsAfterExpiry,
      @JsonKey(name: 'uuid', defaultValue: '') String uuid,
      @JsonKey(name: 'returnsAllowed', defaultValue: false) bool returnsAllowed,
      @JsonKey(name: 'principalName', defaultValue: '') String principalName,
      @JsonKey(name: 'status', defaultValue: '') String status});
}

/// @nodoc
class _$PolicyConfigurationDtoCopyWithImpl<$Res,
        $Val extends PolicyConfigurationDto>
    implements $PolicyConfigurationDtoCopyWith<$Res> {
  _$PolicyConfigurationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? principalCode = null,
    Object? monthsBeforeExpiry = null,
    Object? monthsAfterExpiry = null,
    Object? uuid = null,
    Object? returnsAllowed = null,
    Object? principalName = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as String,
      principalCode: null == principalCode
          ? _value.principalCode
          : principalCode // ignore: cast_nullable_to_non_nullable
              as String,
      monthsBeforeExpiry: null == monthsBeforeExpiry
          ? _value.monthsBeforeExpiry
          : monthsBeforeExpiry // ignore: cast_nullable_to_non_nullable
              as String,
      monthsAfterExpiry: null == monthsAfterExpiry
          ? _value.monthsAfterExpiry
          : monthsAfterExpiry // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      returnsAllowed: null == returnsAllowed
          ? _value.returnsAllowed
          : returnsAllowed // ignore: cast_nullable_to_non_nullable
              as bool,
      principalName: null == principalName
          ? _value.principalName
          : principalName // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PolicyConfigurationDtoImplCopyWith<$Res>
    implements $PolicyConfigurationDtoCopyWith<$Res> {
  factory _$$PolicyConfigurationDtoImplCopyWith(
          _$PolicyConfigurationDtoImpl value,
          $Res Function(_$PolicyConfigurationDtoImpl) then) =
      __$$PolicyConfigurationDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'salesOrg', defaultValue: '') String salesOrg,
      @JsonKey(name: 'principalCode', defaultValue: '') String principalCode,
      @JsonKey(name: 'monthsBeforeExpiry', defaultValue: '')
      String monthsBeforeExpiry,
      @JsonKey(name: 'monthsAfterExpiry', defaultValue: '')
      String monthsAfterExpiry,
      @JsonKey(name: 'uuid', defaultValue: '') String uuid,
      @JsonKey(name: 'returnsAllowed', defaultValue: false) bool returnsAllowed,
      @JsonKey(name: 'principalName', defaultValue: '') String principalName,
      @JsonKey(name: 'status', defaultValue: '') String status});
}

/// @nodoc
class __$$PolicyConfigurationDtoImplCopyWithImpl<$Res>
    extends _$PolicyConfigurationDtoCopyWithImpl<$Res,
        _$PolicyConfigurationDtoImpl>
    implements _$$PolicyConfigurationDtoImplCopyWith<$Res> {
  __$$PolicyConfigurationDtoImplCopyWithImpl(
      _$PolicyConfigurationDtoImpl _value,
      $Res Function(_$PolicyConfigurationDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? principalCode = null,
    Object? monthsBeforeExpiry = null,
    Object? monthsAfterExpiry = null,
    Object? uuid = null,
    Object? returnsAllowed = null,
    Object? principalName = null,
    Object? status = null,
  }) {
    return _then(_$PolicyConfigurationDtoImpl(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as String,
      principalCode: null == principalCode
          ? _value.principalCode
          : principalCode // ignore: cast_nullable_to_non_nullable
              as String,
      monthsBeforeExpiry: null == monthsBeforeExpiry
          ? _value.monthsBeforeExpiry
          : monthsBeforeExpiry // ignore: cast_nullable_to_non_nullable
              as String,
      monthsAfterExpiry: null == monthsAfterExpiry
          ? _value.monthsAfterExpiry
          : monthsAfterExpiry // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      returnsAllowed: null == returnsAllowed
          ? _value.returnsAllowed
          : returnsAllowed // ignore: cast_nullable_to_non_nullable
              as bool,
      principalName: null == principalName
          ? _value.principalName
          : principalName // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PolicyConfigurationDtoImpl extends _PolicyConfigurationDto {
  const _$PolicyConfigurationDtoImpl(
      {@JsonKey(name: 'salesOrg', defaultValue: '') required this.salesOrg,
      @JsonKey(name: 'principalCode', defaultValue: '')
      required this.principalCode,
      @JsonKey(name: 'monthsBeforeExpiry', defaultValue: '')
      required this.monthsBeforeExpiry,
      @JsonKey(name: 'monthsAfterExpiry', defaultValue: '')
      required this.monthsAfterExpiry,
      @JsonKey(name: 'uuid', defaultValue: '') required this.uuid,
      @JsonKey(name: 'returnsAllowed', defaultValue: false)
      required this.returnsAllowed,
      @JsonKey(name: 'principalName', defaultValue: '')
      required this.principalName,
      @JsonKey(name: 'status', defaultValue: '') required this.status})
      : super._();

  factory _$PolicyConfigurationDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PolicyConfigurationDtoImplFromJson(json);

  @override
  @JsonKey(name: 'salesOrg', defaultValue: '')
  final String salesOrg;
  @override
  @JsonKey(name: 'principalCode', defaultValue: '')
  final String principalCode;
  @override
  @JsonKey(name: 'monthsBeforeExpiry', defaultValue: '')
  final String monthsBeforeExpiry;
  @override
  @JsonKey(name: 'monthsAfterExpiry', defaultValue: '')
  final String monthsAfterExpiry;
  @override
  @JsonKey(name: 'uuid', defaultValue: '')
  final String uuid;
  @override
  @JsonKey(name: 'returnsAllowed', defaultValue: false)
  final bool returnsAllowed;
  @override
  @JsonKey(name: 'principalName', defaultValue: '')
  final String principalName;
  @override
  @JsonKey(name: 'status', defaultValue: '')
  final String status;

  @override
  String toString() {
    return 'PolicyConfigurationDto(salesOrg: $salesOrg, principalCode: $principalCode, monthsBeforeExpiry: $monthsBeforeExpiry, monthsAfterExpiry: $monthsAfterExpiry, uuid: $uuid, returnsAllowed: $returnsAllowed, principalName: $principalName, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PolicyConfigurationDtoImpl &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            (identical(other.principalCode, principalCode) ||
                other.principalCode == principalCode) &&
            (identical(other.monthsBeforeExpiry, monthsBeforeExpiry) ||
                other.monthsBeforeExpiry == monthsBeforeExpiry) &&
            (identical(other.monthsAfterExpiry, monthsAfterExpiry) ||
                other.monthsAfterExpiry == monthsAfterExpiry) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.returnsAllowed, returnsAllowed) ||
                other.returnsAllowed == returnsAllowed) &&
            (identical(other.principalName, principalName) ||
                other.principalName == principalName) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      salesOrg,
      principalCode,
      monthsBeforeExpiry,
      monthsAfterExpiry,
      uuid,
      returnsAllowed,
      principalName,
      status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PolicyConfigurationDtoImplCopyWith<_$PolicyConfigurationDtoImpl>
      get copyWith => __$$PolicyConfigurationDtoImplCopyWithImpl<
          _$PolicyConfigurationDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PolicyConfigurationDtoImplToJson(
      this,
    );
  }
}

abstract class _PolicyConfigurationDto extends PolicyConfigurationDto {
  const factory _PolicyConfigurationDto(
      {@JsonKey(name: 'salesOrg', defaultValue: '')
      required final String salesOrg,
      @JsonKey(name: 'principalCode', defaultValue: '')
      required final String principalCode,
      @JsonKey(name: 'monthsBeforeExpiry', defaultValue: '')
      required final String monthsBeforeExpiry,
      @JsonKey(name: 'monthsAfterExpiry', defaultValue: '')
      required final String monthsAfterExpiry,
      @JsonKey(name: 'uuid', defaultValue: '') required final String uuid,
      @JsonKey(name: 'returnsAllowed', defaultValue: false)
      required final bool returnsAllowed,
      @JsonKey(name: 'principalName', defaultValue: '')
      required final String principalName,
      @JsonKey(name: 'status', defaultValue: '')
      required final String status}) = _$PolicyConfigurationDtoImpl;
  const _PolicyConfigurationDto._() : super._();

  factory _PolicyConfigurationDto.fromJson(Map<String, dynamic> json) =
      _$PolicyConfigurationDtoImpl.fromJson;

  @override
  @JsonKey(name: 'salesOrg', defaultValue: '')
  String get salesOrg;
  @override
  @JsonKey(name: 'principalCode', defaultValue: '')
  String get principalCode;
  @override
  @JsonKey(name: 'monthsBeforeExpiry', defaultValue: '')
  String get monthsBeforeExpiry;
  @override
  @JsonKey(name: 'monthsAfterExpiry', defaultValue: '')
  String get monthsAfterExpiry;
  @override
  @JsonKey(name: 'uuid', defaultValue: '')
  String get uuid;
  @override
  @JsonKey(name: 'returnsAllowed', defaultValue: false)
  bool get returnsAllowed;
  @override
  @JsonKey(name: 'principalName', defaultValue: '')
  String get principalName;
  @override
  @JsonKey(name: 'status', defaultValue: '')
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$PolicyConfigurationDtoImplCopyWith<_$PolicyConfigurationDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

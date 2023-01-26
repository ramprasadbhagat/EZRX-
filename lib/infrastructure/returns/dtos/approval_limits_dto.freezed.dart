// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'approval_limits_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApprovalLimitsDto _$ApprovalLimitsDtoFromJson(Map<String, dynamic> json) {
  return _ApprovalLimitsDto.fromJson(json);
}

/// @nodoc
mixin _$ApprovalLimitsDto {
  @JsonKey(name: 'salesOrg', defaultValue: '')
  String get salesOrg => throw _privateConstructorUsedError;
  @JsonKey(name: 'valueLowerLimit', defaultValue: 0)
  int get valueLowerLimit => throw _privateConstructorUsedError;
  @JsonKey(name: 'valueUpperLimit', defaultValue: 0)
  int get valueUpperLimit => throw _privateConstructorUsedError;
  @JsonKey(name: 'username', defaultValue: '')
  String get username => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApprovalLimitsDtoCopyWith<ApprovalLimitsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApprovalLimitsDtoCopyWith<$Res> {
  factory $ApprovalLimitsDtoCopyWith(
          ApprovalLimitsDto value, $Res Function(ApprovalLimitsDto) then) =
      _$ApprovalLimitsDtoCopyWithImpl<$Res, ApprovalLimitsDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'salesOrg', defaultValue: '') String salesOrg,
      @JsonKey(name: 'valueLowerLimit', defaultValue: 0) int valueLowerLimit,
      @JsonKey(name: 'valueUpperLimit', defaultValue: 0) int valueUpperLimit,
      @JsonKey(name: 'username', defaultValue: '') String username});
}

/// @nodoc
class _$ApprovalLimitsDtoCopyWithImpl<$Res, $Val extends ApprovalLimitsDto>
    implements $ApprovalLimitsDtoCopyWith<$Res> {
  _$ApprovalLimitsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? valueLowerLimit = null,
    Object? valueUpperLimit = null,
    Object? username = null,
  }) {
    return _then(_value.copyWith(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as String,
      valueLowerLimit: null == valueLowerLimit
          ? _value.valueLowerLimit
          : valueLowerLimit // ignore: cast_nullable_to_non_nullable
              as int,
      valueUpperLimit: null == valueUpperLimit
          ? _value.valueUpperLimit
          : valueUpperLimit // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ApprovalLimitsDtoCopyWith<$Res>
    implements $ApprovalLimitsDtoCopyWith<$Res> {
  factory _$$_ApprovalLimitsDtoCopyWith(_$_ApprovalLimitsDto value,
          $Res Function(_$_ApprovalLimitsDto) then) =
      __$$_ApprovalLimitsDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'salesOrg', defaultValue: '') String salesOrg,
      @JsonKey(name: 'valueLowerLimit', defaultValue: 0) int valueLowerLimit,
      @JsonKey(name: 'valueUpperLimit', defaultValue: 0) int valueUpperLimit,
      @JsonKey(name: 'username', defaultValue: '') String username});
}

/// @nodoc
class __$$_ApprovalLimitsDtoCopyWithImpl<$Res>
    extends _$ApprovalLimitsDtoCopyWithImpl<$Res, _$_ApprovalLimitsDto>
    implements _$$_ApprovalLimitsDtoCopyWith<$Res> {
  __$$_ApprovalLimitsDtoCopyWithImpl(
      _$_ApprovalLimitsDto _value, $Res Function(_$_ApprovalLimitsDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? valueLowerLimit = null,
    Object? valueUpperLimit = null,
    Object? username = null,
  }) {
    return _then(_$_ApprovalLimitsDto(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as String,
      valueLowerLimit: null == valueLowerLimit
          ? _value.valueLowerLimit
          : valueLowerLimit // ignore: cast_nullable_to_non_nullable
              as int,
      valueUpperLimit: null == valueUpperLimit
          ? _value.valueUpperLimit
          : valueUpperLimit // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ApprovalLimitsDto extends _ApprovalLimitsDto {
  const _$_ApprovalLimitsDto(
      {@JsonKey(name: 'salesOrg', defaultValue: '')
          required this.salesOrg,
      @JsonKey(name: 'valueLowerLimit', defaultValue: 0)
          required this.valueLowerLimit,
      @JsonKey(name: 'valueUpperLimit', defaultValue: 0)
          required this.valueUpperLimit,
      @JsonKey(name: 'username', defaultValue: '')
          required this.username})
      : super._();

  factory _$_ApprovalLimitsDto.fromJson(Map<String, dynamic> json) =>
      _$$_ApprovalLimitsDtoFromJson(json);

  @override
  @JsonKey(name: 'salesOrg', defaultValue: '')
  final String salesOrg;
  @override
  @JsonKey(name: 'valueLowerLimit', defaultValue: 0)
  final int valueLowerLimit;
  @override
  @JsonKey(name: 'valueUpperLimit', defaultValue: 0)
  final int valueUpperLimit;
  @override
  @JsonKey(name: 'username', defaultValue: '')
  final String username;

  @override
  String toString() {
    return 'ApprovalLimitsDto(salesOrg: $salesOrg, valueLowerLimit: $valueLowerLimit, valueUpperLimit: $valueUpperLimit, username: $username)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApprovalLimitsDto &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            (identical(other.valueLowerLimit, valueLowerLimit) ||
                other.valueLowerLimit == valueLowerLimit) &&
            (identical(other.valueUpperLimit, valueUpperLimit) ||
                other.valueUpperLimit == valueUpperLimit) &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, salesOrg, valueLowerLimit, valueUpperLimit, username);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApprovalLimitsDtoCopyWith<_$_ApprovalLimitsDto> get copyWith =>
      __$$_ApprovalLimitsDtoCopyWithImpl<_$_ApprovalLimitsDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApprovalLimitsDtoToJson(
      this,
    );
  }
}

abstract class _ApprovalLimitsDto extends ApprovalLimitsDto {
  const factory _ApprovalLimitsDto(
      {@JsonKey(name: 'salesOrg', defaultValue: '')
          required final String salesOrg,
      @JsonKey(name: 'valueLowerLimit', defaultValue: 0)
          required final int valueLowerLimit,
      @JsonKey(name: 'valueUpperLimit', defaultValue: 0)
          required final int valueUpperLimit,
      @JsonKey(name: 'username', defaultValue: '')
          required final String username}) = _$_ApprovalLimitsDto;
  const _ApprovalLimitsDto._() : super._();

  factory _ApprovalLimitsDto.fromJson(Map<String, dynamic> json) =
      _$_ApprovalLimitsDto.fromJson;

  @override
  @JsonKey(name: 'salesOrg', defaultValue: '')
  String get salesOrg;
  @override
  @JsonKey(name: 'valueLowerLimit', defaultValue: 0)
  int get valueLowerLimit;
  @override
  @JsonKey(name: 'valueUpperLimit', defaultValue: 0)
  int get valueUpperLimit;
  @override
  @JsonKey(name: 'username', defaultValue: '')
  String get username;
  @override
  @JsonKey(ignore: true)
  _$$_ApprovalLimitsDtoCopyWith<_$_ApprovalLimitsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

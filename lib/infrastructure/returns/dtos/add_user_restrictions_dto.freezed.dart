// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_user_restrictions_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddConfigureUserRestrictionDto _$AddConfigureUserRestrictionDtoFromJson(
    Map<String, dynamic> json) {
  return _AddConfigureUserRestrictionDto.fromJson(json);
}

/// @nodoc
mixin _$AddConfigureUserRestrictionDto {
  @JsonKey(
      name: 'addRestriction',
      defaultValue: '',
      readValue: addRestrictionOverride)
  String get addRestrictionStatus => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'addReturnApprovalLimit',
      defaultValue: false,
      readValue: addReturnApprovalLimitOverride)
  bool get addReturnApprovalLimit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddConfigureUserRestrictionDtoCopyWith<AddConfigureUserRestrictionDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddConfigureUserRestrictionDtoCopyWith<$Res> {
  factory $AddConfigureUserRestrictionDtoCopyWith(
          AddConfigureUserRestrictionDto value,
          $Res Function(AddConfigureUserRestrictionDto) then) =
      _$AddConfigureUserRestrictionDtoCopyWithImpl<$Res,
          AddConfigureUserRestrictionDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'addRestriction', defaultValue: '', readValue: addRestrictionOverride)
          String addRestrictionStatus,
      @JsonKey(name: 'addReturnApprovalLimit', defaultValue: false, readValue: addReturnApprovalLimitOverride)
          bool addReturnApprovalLimit});
}

/// @nodoc
class _$AddConfigureUserRestrictionDtoCopyWithImpl<$Res,
        $Val extends AddConfigureUserRestrictionDto>
    implements $AddConfigureUserRestrictionDtoCopyWith<$Res> {
  _$AddConfigureUserRestrictionDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addRestrictionStatus = null,
    Object? addReturnApprovalLimit = null,
  }) {
    return _then(_value.copyWith(
      addRestrictionStatus: null == addRestrictionStatus
          ? _value.addRestrictionStatus
          : addRestrictionStatus // ignore: cast_nullable_to_non_nullable
              as String,
      addReturnApprovalLimit: null == addReturnApprovalLimit
          ? _value.addReturnApprovalLimit
          : addReturnApprovalLimit // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddConfigureUserRestrictionDtoCopyWith<$Res>
    implements $AddConfigureUserRestrictionDtoCopyWith<$Res> {
  factory _$$_AddConfigureUserRestrictionDtoCopyWith(
          _$_AddConfigureUserRestrictionDto value,
          $Res Function(_$_AddConfigureUserRestrictionDto) then) =
      __$$_AddConfigureUserRestrictionDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'addRestriction', defaultValue: '', readValue: addRestrictionOverride)
          String addRestrictionStatus,
      @JsonKey(name: 'addReturnApprovalLimit', defaultValue: false, readValue: addReturnApprovalLimitOverride)
          bool addReturnApprovalLimit});
}

/// @nodoc
class __$$_AddConfigureUserRestrictionDtoCopyWithImpl<$Res>
    extends _$AddConfigureUserRestrictionDtoCopyWithImpl<$Res,
        _$_AddConfigureUserRestrictionDto>
    implements _$$_AddConfigureUserRestrictionDtoCopyWith<$Res> {
  __$$_AddConfigureUserRestrictionDtoCopyWithImpl(
      _$_AddConfigureUserRestrictionDto _value,
      $Res Function(_$_AddConfigureUserRestrictionDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addRestrictionStatus = null,
    Object? addReturnApprovalLimit = null,
  }) {
    return _then(_$_AddConfigureUserRestrictionDto(
      addRestrictionStatus: null == addRestrictionStatus
          ? _value.addRestrictionStatus
          : addRestrictionStatus // ignore: cast_nullable_to_non_nullable
              as String,
      addReturnApprovalLimit: null == addReturnApprovalLimit
          ? _value.addReturnApprovalLimit
          : addReturnApprovalLimit // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AddConfigureUserRestrictionDto
    extends _AddConfigureUserRestrictionDto {
  const _$_AddConfigureUserRestrictionDto(
      {@JsonKey(name: 'addRestriction', defaultValue: '', readValue: addRestrictionOverride)
          required this.addRestrictionStatus,
      @JsonKey(name: 'addReturnApprovalLimit', defaultValue: false, readValue: addReturnApprovalLimitOverride)
          required this.addReturnApprovalLimit})
      : super._();

  factory _$_AddConfigureUserRestrictionDto.fromJson(
          Map<String, dynamic> json) =>
      _$$_AddConfigureUserRestrictionDtoFromJson(json);

  @override
  @JsonKey(
      name: 'addRestriction',
      defaultValue: '',
      readValue: addRestrictionOverride)
  final String addRestrictionStatus;
  @override
  @JsonKey(
      name: 'addReturnApprovalLimit',
      defaultValue: false,
      readValue: addReturnApprovalLimitOverride)
  final bool addReturnApprovalLimit;

  @override
  String toString() {
    return 'AddConfigureUserRestrictionDto(addRestrictionStatus: $addRestrictionStatus, addReturnApprovalLimit: $addReturnApprovalLimit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddConfigureUserRestrictionDto &&
            (identical(other.addRestrictionStatus, addRestrictionStatus) ||
                other.addRestrictionStatus == addRestrictionStatus) &&
            (identical(other.addReturnApprovalLimit, addReturnApprovalLimit) ||
                other.addReturnApprovalLimit == addReturnApprovalLimit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, addRestrictionStatus, addReturnApprovalLimit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddConfigureUserRestrictionDtoCopyWith<_$_AddConfigureUserRestrictionDto>
      get copyWith => __$$_AddConfigureUserRestrictionDtoCopyWithImpl<
          _$_AddConfigureUserRestrictionDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddConfigureUserRestrictionDtoToJson(
      this,
    );
  }
}

abstract class _AddConfigureUserRestrictionDto
    extends AddConfigureUserRestrictionDto {
  const factory _AddConfigureUserRestrictionDto(
      {@JsonKey(name: 'addRestriction', defaultValue: '', readValue: addRestrictionOverride)
          required final String addRestrictionStatus,
      @JsonKey(name: 'addReturnApprovalLimit', defaultValue: false, readValue: addReturnApprovalLimitOverride)
          required final bool addReturnApprovalLimit}) = _$_AddConfigureUserRestrictionDto;
  const _AddConfigureUserRestrictionDto._() : super._();

  factory _AddConfigureUserRestrictionDto.fromJson(Map<String, dynamic> json) =
      _$_AddConfigureUserRestrictionDto.fromJson;

  @override
  @JsonKey(
      name: 'addRestriction',
      defaultValue: '',
      readValue: addRestrictionOverride)
  String get addRestrictionStatus;
  @override
  @JsonKey(
      name: 'addReturnApprovalLimit',
      defaultValue: false,
      readValue: addReturnApprovalLimitOverride)
  bool get addReturnApprovalLimit;
  @override
  @JsonKey(ignore: true)
  _$$_AddConfigureUserRestrictionDtoCopyWith<_$_AddConfigureUserRestrictionDto>
      get copyWith => throw _privateConstructorUsedError;
}

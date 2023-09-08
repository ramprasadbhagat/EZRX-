// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_organisation_configs_principal_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SalesOrganisationConfigsPrincipalDto
    _$SalesOrganisationConfigsPrincipalDtoFromJson(Map<String, dynamic> json) {
  return _SalesOrganisationConfigsPrincipalDto.fromJson(json);
}

/// @nodoc
mixin _$SalesOrganisationConfigsPrincipalDto {
//The date is not been used anywhere and
//it is not in proper format
//e.g - YYYYMMDD00 (extra two zero at the end)
  @JsonKey(name: 'date', defaultValue: 0)
  int get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'principal')
  String get principalCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SalesOrganisationConfigsPrincipalDtoCopyWith<
          SalesOrganisationConfigsPrincipalDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesOrganisationConfigsPrincipalDtoCopyWith<$Res> {
  factory $SalesOrganisationConfigsPrincipalDtoCopyWith(
          SalesOrganisationConfigsPrincipalDto value,
          $Res Function(SalesOrganisationConfigsPrincipalDto) then) =
      _$SalesOrganisationConfigsPrincipalDtoCopyWithImpl<$Res,
          SalesOrganisationConfigsPrincipalDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'date', defaultValue: 0) int date,
      @JsonKey(name: 'principal') String principalCode});
}

/// @nodoc
class _$SalesOrganisationConfigsPrincipalDtoCopyWithImpl<$Res,
        $Val extends SalesOrganisationConfigsPrincipalDto>
    implements $SalesOrganisationConfigsPrincipalDtoCopyWith<$Res> {
  _$SalesOrganisationConfigsPrincipalDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? principalCode = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as int,
      principalCode: null == principalCode
          ? _value.principalCode
          : principalCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SalesOrganisationConfigsPrincipalDtoCopyWith<$Res>
    implements $SalesOrganisationConfigsPrincipalDtoCopyWith<$Res> {
  factory _$$_SalesOrganisationConfigsPrincipalDtoCopyWith(
          _$_SalesOrganisationConfigsPrincipalDto value,
          $Res Function(_$_SalesOrganisationConfigsPrincipalDto) then) =
      __$$_SalesOrganisationConfigsPrincipalDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'date', defaultValue: 0) int date,
      @JsonKey(name: 'principal') String principalCode});
}

/// @nodoc
class __$$_SalesOrganisationConfigsPrincipalDtoCopyWithImpl<$Res>
    extends _$SalesOrganisationConfigsPrincipalDtoCopyWithImpl<$Res,
        _$_SalesOrganisationConfigsPrincipalDto>
    implements _$$_SalesOrganisationConfigsPrincipalDtoCopyWith<$Res> {
  __$$_SalesOrganisationConfigsPrincipalDtoCopyWithImpl(
      _$_SalesOrganisationConfigsPrincipalDto _value,
      $Res Function(_$_SalesOrganisationConfigsPrincipalDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? principalCode = null,
  }) {
    return _then(_$_SalesOrganisationConfigsPrincipalDto(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as int,
      principalCode: null == principalCode
          ? _value.principalCode
          : principalCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SalesOrganisationConfigsPrincipalDto
    extends _SalesOrganisationConfigsPrincipalDto {
  const _$_SalesOrganisationConfigsPrincipalDto(
      {@JsonKey(name: 'date', defaultValue: 0) required this.date,
      @JsonKey(name: 'principal') required this.principalCode})
      : super._();

  factory _$_SalesOrganisationConfigsPrincipalDto.fromJson(
          Map<String, dynamic> json) =>
      _$$_SalesOrganisationConfigsPrincipalDtoFromJson(json);

//The date is not been used anywhere and
//it is not in proper format
//e.g - YYYYMMDD00 (extra two zero at the end)
  @override
  @JsonKey(name: 'date', defaultValue: 0)
  final int date;
  @override
  @JsonKey(name: 'principal')
  final String principalCode;

  @override
  String toString() {
    return 'SalesOrganisationConfigsPrincipalDto(date: $date, principalCode: $principalCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SalesOrganisationConfigsPrincipalDto &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.principalCode, principalCode) ||
                other.principalCode == principalCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, principalCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SalesOrganisationConfigsPrincipalDtoCopyWith<
          _$_SalesOrganisationConfigsPrincipalDto>
      get copyWith => __$$_SalesOrganisationConfigsPrincipalDtoCopyWithImpl<
          _$_SalesOrganisationConfigsPrincipalDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SalesOrganisationConfigsPrincipalDtoToJson(
      this,
    );
  }
}

abstract class _SalesOrganisationConfigsPrincipalDto
    extends SalesOrganisationConfigsPrincipalDto {
  const factory _SalesOrganisationConfigsPrincipalDto(
          {@JsonKey(name: 'date', defaultValue: 0) required final int date,
          @JsonKey(name: 'principal') required final String principalCode}) =
      _$_SalesOrganisationConfigsPrincipalDto;
  const _SalesOrganisationConfigsPrincipalDto._() : super._();

  factory _SalesOrganisationConfigsPrincipalDto.fromJson(
          Map<String, dynamic> json) =
      _$_SalesOrganisationConfigsPrincipalDto.fromJson;

  @override //The date is not been used anywhere and
//it is not in proper format
//e.g - YYYYMMDD00 (extra two zero at the end)
  @JsonKey(name: 'date', defaultValue: 0)
  int get date;
  @override
  @JsonKey(name: 'principal')
  String get principalCode;
  @override
  @JsonKey(ignore: true)
  _$$_SalesOrganisationConfigsPrincipalDtoCopyWith<
          _$_SalesOrganisationConfigsPrincipalDto>
      get copyWith => throw _privateConstructorUsedError;
}

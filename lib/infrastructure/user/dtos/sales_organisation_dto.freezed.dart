// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sales_organisation_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SalesOrganisationDto _$SalesOrganisationDtoFromJson(Map<String, dynamic> json) {
  return _SalesOrganisationDto.fromJson(json);
}

/// @nodoc
mixin _$SalesOrganisationDto {
  @JsonKey(name: 'salesOrg')
  String get salesOrg => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SalesOrganisationDtoCopyWith<SalesOrganisationDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesOrganisationDtoCopyWith<$Res> {
  factory $SalesOrganisationDtoCopyWith(SalesOrganisationDto value,
          $Res Function(SalesOrganisationDto) then) =
      _$SalesOrganisationDtoCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'salesOrg') String salesOrg});
}

/// @nodoc
class _$SalesOrganisationDtoCopyWithImpl<$Res>
    implements $SalesOrganisationDtoCopyWith<$Res> {
  _$SalesOrganisationDtoCopyWithImpl(this._value, this._then);

  final SalesOrganisationDto _value;
  // ignore: unused_field
  final $Res Function(SalesOrganisationDto) _then;

  @override
  $Res call({
    Object? salesOrg = freezed,
  }) {
    return _then(_value.copyWith(
      salesOrg: salesOrg == freezed
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_SalesOrganisationDtoCopyWith<$Res>
    implements $SalesOrganisationDtoCopyWith<$Res> {
  factory _$$_SalesOrganisationDtoCopyWith(_$_SalesOrganisationDto value,
          $Res Function(_$_SalesOrganisationDto) then) =
      __$$_SalesOrganisationDtoCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'salesOrg') String salesOrg});
}

/// @nodoc
class __$$_SalesOrganisationDtoCopyWithImpl<$Res>
    extends _$SalesOrganisationDtoCopyWithImpl<$Res>
    implements _$$_SalesOrganisationDtoCopyWith<$Res> {
  __$$_SalesOrganisationDtoCopyWithImpl(_$_SalesOrganisationDto _value,
      $Res Function(_$_SalesOrganisationDto) _then)
      : super(_value, (v) => _then(v as _$_SalesOrganisationDto));

  @override
  _$_SalesOrganisationDto get _value => super._value as _$_SalesOrganisationDto;

  @override
  $Res call({
    Object? salesOrg = freezed,
  }) {
    return _then(_$_SalesOrganisationDto(
      salesOrg: salesOrg == freezed
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SalesOrganisationDto extends _SalesOrganisationDto {
  const _$_SalesOrganisationDto(
      {@JsonKey(name: 'salesOrg') required this.salesOrg})
      : super._();

  factory _$_SalesOrganisationDto.fromJson(Map<String, dynamic> json) =>
      _$$_SalesOrganisationDtoFromJson(json);

  @override
  @JsonKey(name: 'salesOrg')
  final String salesOrg;

  @override
  String toString() {
    return 'SalesOrganisationDto(salesOrg: $salesOrg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SalesOrganisationDto &&
            const DeepCollectionEquality().equals(other.salesOrg, salesOrg));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(salesOrg));

  @JsonKey(ignore: true)
  @override
  _$$_SalesOrganisationDtoCopyWith<_$_SalesOrganisationDto> get copyWith =>
      __$$_SalesOrganisationDtoCopyWithImpl<_$_SalesOrganisationDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SalesOrganisationDtoToJson(this);
  }
}

abstract class _SalesOrganisationDto extends SalesOrganisationDto {
  const factory _SalesOrganisationDto(
          {@JsonKey(name: 'salesOrg') required final String salesOrg}) =
      _$_SalesOrganisationDto;
  const _SalesOrganisationDto._() : super._();

  factory _SalesOrganisationDto.fromJson(Map<String, dynamic> json) =
      _$_SalesOrganisationDto.fromJson;

  @override
  @JsonKey(name: 'salesOrg')
  String get salesOrg;
  @override
  @JsonKey(ignore: true)
  _$$_SalesOrganisationDtoCopyWith<_$_SalesOrganisationDto> get copyWith =>
      throw _privateConstructorUsedError;
}

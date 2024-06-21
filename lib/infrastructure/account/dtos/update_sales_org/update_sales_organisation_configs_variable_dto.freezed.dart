// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_sales_organisation_configs_variable_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdateSalesOrganisationConfigsVariableDto
    _$UpdateSalesOrganisationConfigsVariableDtoFromJson(
        Map<String, dynamic> json) {
  return _UpdateSalesOrganisationConfigsVariableDto.fromJson(json);
}

/// @nodoc
mixin _$UpdateSalesOrganisationConfigsVariableDto {
  @JsonKey(name: 'where')
  SalesOrgIdDto get salesOrgIdDto => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  UpdateSalesOrganisationConfigsDto get data =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateSalesOrganisationConfigsVariableDtoCopyWith<
          UpdateSalesOrganisationConfigsVariableDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateSalesOrganisationConfigsVariableDtoCopyWith<$Res> {
  factory $UpdateSalesOrganisationConfigsVariableDtoCopyWith(
          UpdateSalesOrganisationConfigsVariableDto value,
          $Res Function(UpdateSalesOrganisationConfigsVariableDto) then) =
      _$UpdateSalesOrganisationConfigsVariableDtoCopyWithImpl<$Res,
          UpdateSalesOrganisationConfigsVariableDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'where') SalesOrgIdDto salesOrgIdDto,
      @JsonKey(name: 'data') UpdateSalesOrganisationConfigsDto data});

  $SalesOrgIdDtoCopyWith<$Res> get salesOrgIdDto;
  $UpdateSalesOrganisationConfigsDtoCopyWith<$Res> get data;
}

/// @nodoc
class _$UpdateSalesOrganisationConfigsVariableDtoCopyWithImpl<$Res,
        $Val extends UpdateSalesOrganisationConfigsVariableDto>
    implements $UpdateSalesOrganisationConfigsVariableDtoCopyWith<$Res> {
  _$UpdateSalesOrganisationConfigsVariableDtoCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrgIdDto = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      salesOrgIdDto: null == salesOrgIdDto
          ? _value.salesOrgIdDto
          : salesOrgIdDto // ignore: cast_nullable_to_non_nullable
              as SalesOrgIdDto,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as UpdateSalesOrganisationConfigsDto,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesOrgIdDtoCopyWith<$Res> get salesOrgIdDto {
    return $SalesOrgIdDtoCopyWith<$Res>(_value.salesOrgIdDto, (value) {
      return _then(_value.copyWith(salesOrgIdDto: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UpdateSalesOrganisationConfigsDtoCopyWith<$Res> get data {
    return $UpdateSalesOrganisationConfigsDtoCopyWith<$Res>(_value.data,
        (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UpdateSalesOrganisationConfigsVariableDtoImplCopyWith<$Res>
    implements $UpdateSalesOrganisationConfigsVariableDtoCopyWith<$Res> {
  factory _$$UpdateSalesOrganisationConfigsVariableDtoImplCopyWith(
          _$UpdateSalesOrganisationConfigsVariableDtoImpl value,
          $Res Function(_$UpdateSalesOrganisationConfigsVariableDtoImpl) then) =
      __$$UpdateSalesOrganisationConfigsVariableDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'where') SalesOrgIdDto salesOrgIdDto,
      @JsonKey(name: 'data') UpdateSalesOrganisationConfigsDto data});

  @override
  $SalesOrgIdDtoCopyWith<$Res> get salesOrgIdDto;
  @override
  $UpdateSalesOrganisationConfigsDtoCopyWith<$Res> get data;
}

/// @nodoc
class __$$UpdateSalesOrganisationConfigsVariableDtoImplCopyWithImpl<$Res>
    extends _$UpdateSalesOrganisationConfigsVariableDtoCopyWithImpl<$Res,
        _$UpdateSalesOrganisationConfigsVariableDtoImpl>
    implements _$$UpdateSalesOrganisationConfigsVariableDtoImplCopyWith<$Res> {
  __$$UpdateSalesOrganisationConfigsVariableDtoImplCopyWithImpl(
      _$UpdateSalesOrganisationConfigsVariableDtoImpl _value,
      $Res Function(_$UpdateSalesOrganisationConfigsVariableDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrgIdDto = null,
    Object? data = null,
  }) {
    return _then(_$UpdateSalesOrganisationConfigsVariableDtoImpl(
      salesOrgIdDto: null == salesOrgIdDto
          ? _value.salesOrgIdDto
          : salesOrgIdDto // ignore: cast_nullable_to_non_nullable
              as SalesOrgIdDto,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as UpdateSalesOrganisationConfigsDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateSalesOrganisationConfigsVariableDtoImpl
    extends _UpdateSalesOrganisationConfigsVariableDto {
  const _$UpdateSalesOrganisationConfigsVariableDtoImpl(
      {@JsonKey(name: 'where') required this.salesOrgIdDto,
      @JsonKey(name: 'data') required this.data})
      : super._();

  factory _$UpdateSalesOrganisationConfigsVariableDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UpdateSalesOrganisationConfigsVariableDtoImplFromJson(json);

  @override
  @JsonKey(name: 'where')
  final SalesOrgIdDto salesOrgIdDto;
  @override
  @JsonKey(name: 'data')
  final UpdateSalesOrganisationConfigsDto data;

  @override
  String toString() {
    return 'UpdateSalesOrganisationConfigsVariableDto(salesOrgIdDto: $salesOrgIdDto, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateSalesOrganisationConfigsVariableDtoImpl &&
            (identical(other.salesOrgIdDto, salesOrgIdDto) ||
                other.salesOrgIdDto == salesOrgIdDto) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, salesOrgIdDto, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateSalesOrganisationConfigsVariableDtoImplCopyWith<
          _$UpdateSalesOrganisationConfigsVariableDtoImpl>
      get copyWith =>
          __$$UpdateSalesOrganisationConfigsVariableDtoImplCopyWithImpl<
                  _$UpdateSalesOrganisationConfigsVariableDtoImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateSalesOrganisationConfigsVariableDtoImplToJson(
      this,
    );
  }
}

abstract class _UpdateSalesOrganisationConfigsVariableDto
    extends UpdateSalesOrganisationConfigsVariableDto {
  const factory _UpdateSalesOrganisationConfigsVariableDto(
          {@JsonKey(name: 'where') required final SalesOrgIdDto salesOrgIdDto,
          @JsonKey(name: 'data')
          required final UpdateSalesOrganisationConfigsDto data}) =
      _$UpdateSalesOrganisationConfigsVariableDtoImpl;
  const _UpdateSalesOrganisationConfigsVariableDto._() : super._();

  factory _UpdateSalesOrganisationConfigsVariableDto.fromJson(
          Map<String, dynamic> json) =
      _$UpdateSalesOrganisationConfigsVariableDtoImpl.fromJson;

  @override
  @JsonKey(name: 'where')
  SalesOrgIdDto get salesOrgIdDto;
  @override
  @JsonKey(name: 'data')
  UpdateSalesOrganisationConfigsDto get data;
  @override
  @JsonKey(ignore: true)
  _$$UpdateSalesOrganisationConfigsVariableDtoImplCopyWith<
          _$UpdateSalesOrganisationConfigsVariableDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

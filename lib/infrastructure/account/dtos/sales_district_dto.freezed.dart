// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_district_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SalesDistrictDto _$SalesDistrictDtoFromJson(Map<String, dynamic> json) {
  return _SalesDistrictDto.fromJson(json);
}

/// @nodoc
mixin _$SalesDistrictDto {
  @JsonKey(name: 'salesOrg', defaultValue: '')
  String get salesOrg => throw _privateConstructorUsedError;
  @JsonKey(name: 'salesDistricts')
  List<SalesDistrictDetailsDto> get salesDistrictDetails =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SalesDistrictDtoCopyWith<SalesDistrictDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesDistrictDtoCopyWith<$Res> {
  factory $SalesDistrictDtoCopyWith(
          SalesDistrictDto value, $Res Function(SalesDistrictDto) then) =
      _$SalesDistrictDtoCopyWithImpl<$Res, SalesDistrictDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'salesOrg', defaultValue: '')
          String salesOrg,
      @JsonKey(name: 'salesDistricts')
          List<SalesDistrictDetailsDto> salesDistrictDetails});
}

/// @nodoc
class _$SalesDistrictDtoCopyWithImpl<$Res, $Val extends SalesDistrictDto>
    implements $SalesDistrictDtoCopyWith<$Res> {
  _$SalesDistrictDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? salesDistrictDetails = null,
  }) {
    return _then(_value.copyWith(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as String,
      salesDistrictDetails: null == salesDistrictDetails
          ? _value.salesDistrictDetails
          : salesDistrictDetails // ignore: cast_nullable_to_non_nullable
              as List<SalesDistrictDetailsDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SalesDistrictDtoCopyWith<$Res>
    implements $SalesDistrictDtoCopyWith<$Res> {
  factory _$$_SalesDistrictDtoCopyWith(
          _$_SalesDistrictDto value, $Res Function(_$_SalesDistrictDto) then) =
      __$$_SalesDistrictDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'salesOrg', defaultValue: '')
          String salesOrg,
      @JsonKey(name: 'salesDistricts')
          List<SalesDistrictDetailsDto> salesDistrictDetails});
}

/// @nodoc
class __$$_SalesDistrictDtoCopyWithImpl<$Res>
    extends _$SalesDistrictDtoCopyWithImpl<$Res, _$_SalesDistrictDto>
    implements _$$_SalesDistrictDtoCopyWith<$Res> {
  __$$_SalesDistrictDtoCopyWithImpl(
      _$_SalesDistrictDto _value, $Res Function(_$_SalesDistrictDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrg = null,
    Object? salesDistrictDetails = null,
  }) {
    return _then(_$_SalesDistrictDto(
      salesOrg: null == salesOrg
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as String,
      salesDistrictDetails: null == salesDistrictDetails
          ? _value._salesDistrictDetails
          : salesDistrictDetails // ignore: cast_nullable_to_non_nullable
              as List<SalesDistrictDetailsDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SalesDistrictDto extends _SalesDistrictDto {
  const _$_SalesDistrictDto(
      {@JsonKey(name: 'salesOrg', defaultValue: '')
          required this.salesOrg,
      @JsonKey(name: 'salesDistricts')
          required final List<SalesDistrictDetailsDto> salesDistrictDetails})
      : _salesDistrictDetails = salesDistrictDetails,
        super._();

  factory _$_SalesDistrictDto.fromJson(Map<String, dynamic> json) =>
      _$$_SalesDistrictDtoFromJson(json);

  @override
  @JsonKey(name: 'salesOrg', defaultValue: '')
  final String salesOrg;
  final List<SalesDistrictDetailsDto> _salesDistrictDetails;
  @override
  @JsonKey(name: 'salesDistricts')
  List<SalesDistrictDetailsDto> get salesDistrictDetails {
    if (_salesDistrictDetails is EqualUnmodifiableListView)
      return _salesDistrictDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_salesDistrictDetails);
  }

  @override
  String toString() {
    return 'SalesDistrictDto(salesOrg: $salesOrg, salesDistrictDetails: $salesDistrictDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SalesDistrictDto &&
            (identical(other.salesOrg, salesOrg) ||
                other.salesOrg == salesOrg) &&
            const DeepCollectionEquality()
                .equals(other._salesDistrictDetails, _salesDistrictDetails));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, salesOrg,
      const DeepCollectionEquality().hash(_salesDistrictDetails));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SalesDistrictDtoCopyWith<_$_SalesDistrictDto> get copyWith =>
      __$$_SalesDistrictDtoCopyWithImpl<_$_SalesDistrictDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SalesDistrictDtoToJson(
      this,
    );
  }
}

abstract class _SalesDistrictDto extends SalesDistrictDto {
  const factory _SalesDistrictDto(
      {@JsonKey(name: 'salesOrg', defaultValue: '')
          required final String salesOrg,
      @JsonKey(name: 'salesDistricts')
          required final List<SalesDistrictDetailsDto>
              salesDistrictDetails}) = _$_SalesDistrictDto;
  const _SalesDistrictDto._() : super._();

  factory _SalesDistrictDto.fromJson(Map<String, dynamic> json) =
      _$_SalesDistrictDto.fromJson;

  @override
  @JsonKey(name: 'salesOrg', defaultValue: '')
  String get salesOrg;
  @override
  @JsonKey(name: 'salesDistricts')
  List<SalesDistrictDetailsDto> get salesDistrictDetails;
  @override
  @JsonKey(ignore: true)
  _$$_SalesDistrictDtoCopyWith<_$_SalesDistrictDto> get copyWith =>
      throw _privateConstructorUsedError;
}

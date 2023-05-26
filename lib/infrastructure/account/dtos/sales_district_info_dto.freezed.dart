// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_district_info_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SalesDistrictInfoDto _$SalesDistrictInfoDtoFromJson(Map<String, dynamic> json) {
  return _SalesDistrictInfoDto.fromJson(json);
}

/// @nodoc
mixin _$SalesDistrictInfoDto {
  @JsonKey(name: 'id', defaultValue: 0)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'salesDistrict', defaultValue: '')
  String get salesDistrict => throw _privateConstructorUsedError;
  @JsonKey(name: 'salesDistrictLabel', defaultValue: '')
  String get salesDistrictLabel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SalesDistrictInfoDtoCopyWith<SalesDistrictInfoDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesDistrictInfoDtoCopyWith<$Res> {
  factory $SalesDistrictInfoDtoCopyWith(SalesDistrictInfoDto value,
          $Res Function(SalesDistrictInfoDto) then) =
      _$SalesDistrictInfoDtoCopyWithImpl<$Res, SalesDistrictInfoDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: 0)
          int id,
      @JsonKey(name: 'salesDistrict', defaultValue: '')
          String salesDistrict,
      @JsonKey(name: 'salesDistrictLabel', defaultValue: '')
          String salesDistrictLabel});
}

/// @nodoc
class _$SalesDistrictInfoDtoCopyWithImpl<$Res,
        $Val extends SalesDistrictInfoDto>
    implements $SalesDistrictInfoDtoCopyWith<$Res> {
  _$SalesDistrictInfoDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? salesDistrict = null,
    Object? salesDistrictLabel = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      salesDistrict: null == salesDistrict
          ? _value.salesDistrict
          : salesDistrict // ignore: cast_nullable_to_non_nullable
              as String,
      salesDistrictLabel: null == salesDistrictLabel
          ? _value.salesDistrictLabel
          : salesDistrictLabel // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SalesDistrictInfoDtoCopyWith<$Res>
    implements $SalesDistrictInfoDtoCopyWith<$Res> {
  factory _$$_SalesDistrictInfoDtoCopyWith(_$_SalesDistrictInfoDto value,
          $Res Function(_$_SalesDistrictInfoDto) then) =
      __$$_SalesDistrictInfoDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id', defaultValue: 0)
          int id,
      @JsonKey(name: 'salesDistrict', defaultValue: '')
          String salesDistrict,
      @JsonKey(name: 'salesDistrictLabel', defaultValue: '')
          String salesDistrictLabel});
}

/// @nodoc
class __$$_SalesDistrictInfoDtoCopyWithImpl<$Res>
    extends _$SalesDistrictInfoDtoCopyWithImpl<$Res, _$_SalesDistrictInfoDto>
    implements _$$_SalesDistrictInfoDtoCopyWith<$Res> {
  __$$_SalesDistrictInfoDtoCopyWithImpl(_$_SalesDistrictInfoDto _value,
      $Res Function(_$_SalesDistrictInfoDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? salesDistrict = null,
    Object? salesDistrictLabel = null,
  }) {
    return _then(_$_SalesDistrictInfoDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      salesDistrict: null == salesDistrict
          ? _value.salesDistrict
          : salesDistrict // ignore: cast_nullable_to_non_nullable
              as String,
      salesDistrictLabel: null == salesDistrictLabel
          ? _value.salesDistrictLabel
          : salesDistrictLabel // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SalesDistrictInfoDto extends _SalesDistrictInfoDto {
  const _$_SalesDistrictInfoDto(
      {@JsonKey(name: 'id', defaultValue: 0)
          required this.id,
      @JsonKey(name: 'salesDistrict', defaultValue: '')
          required this.salesDistrict,
      @JsonKey(name: 'salesDistrictLabel', defaultValue: '')
          required this.salesDistrictLabel})
      : super._();

  factory _$_SalesDistrictInfoDto.fromJson(Map<String, dynamic> json) =>
      _$$_SalesDistrictInfoDtoFromJson(json);

  @override
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  @override
  @JsonKey(name: 'salesDistrict', defaultValue: '')
  final String salesDistrict;
  @override
  @JsonKey(name: 'salesDistrictLabel', defaultValue: '')
  final String salesDistrictLabel;

  @override
  String toString() {
    return 'SalesDistrictInfoDto(id: $id, salesDistrict: $salesDistrict, salesDistrictLabel: $salesDistrictLabel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SalesDistrictInfoDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.salesDistrict, salesDistrict) ||
                other.salesDistrict == salesDistrict) &&
            (identical(other.salesDistrictLabel, salesDistrictLabel) ||
                other.salesDistrictLabel == salesDistrictLabel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, salesDistrict, salesDistrictLabel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SalesDistrictInfoDtoCopyWith<_$_SalesDistrictInfoDto> get copyWith =>
      __$$_SalesDistrictInfoDtoCopyWithImpl<_$_SalesDistrictInfoDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SalesDistrictInfoDtoToJson(
      this,
    );
  }
}

abstract class _SalesDistrictInfoDto extends SalesDistrictInfoDto {
  const factory _SalesDistrictInfoDto(
      {@JsonKey(name: 'id', defaultValue: 0)
          required final int id,
      @JsonKey(name: 'salesDistrict', defaultValue: '')
          required final String salesDistrict,
      @JsonKey(name: 'salesDistrictLabel', defaultValue: '')
          required final String salesDistrictLabel}) = _$_SalesDistrictInfoDto;
  const _SalesDistrictInfoDto._() : super._();

  factory _SalesDistrictInfoDto.fromJson(Map<String, dynamic> json) =
      _$_SalesDistrictInfoDto.fromJson;

  @override
  @JsonKey(name: 'id', defaultValue: 0)
  int get id;
  @override
  @JsonKey(name: 'salesDistrict', defaultValue: '')
  String get salesDistrict;
  @override
  @JsonKey(name: 'salesDistrictLabel', defaultValue: '')
  String get salesDistrictLabel;
  @override
  @JsonKey(ignore: true)
  _$$_SalesDistrictInfoDtoCopyWith<_$_SalesDistrictInfoDto> get copyWith =>
      throw _privateConstructorUsedError;
}

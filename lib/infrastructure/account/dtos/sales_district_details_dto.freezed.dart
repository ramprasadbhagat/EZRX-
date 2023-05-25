// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_district_details_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SalesDistrictDetailsDto _$SalesDistrictDetailsDtoFromJson(
    Map<String, dynamic> json) {
  return _SalesDistrictDetailsDto.fromJson(json);
}

/// @nodoc
mixin _$SalesDistrictDetailsDto {
  @JsonKey(name: 'id', defaultValue: 0)
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'salesDistrict', defaultValue: '')
  String get salesDistrict => throw _privateConstructorUsedError;
  @JsonKey(name: 'salesDistrictLabel', defaultValue: '')
  String get salesDistrictLabel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SalesDistrictDetailsDtoCopyWith<SalesDistrictDetailsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesDistrictDetailsDtoCopyWith<$Res> {
  factory $SalesDistrictDetailsDtoCopyWith(SalesDistrictDetailsDto value,
          $Res Function(SalesDistrictDetailsDto) then) =
      _$SalesDistrictDetailsDtoCopyWithImpl<$Res, SalesDistrictDetailsDto>;
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
class _$SalesDistrictDetailsDtoCopyWithImpl<$Res,
        $Val extends SalesDistrictDetailsDto>
    implements $SalesDistrictDetailsDtoCopyWith<$Res> {
  _$SalesDistrictDetailsDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$_SalesDistrictDetailsDtoCopyWith<$Res>
    implements $SalesDistrictDetailsDtoCopyWith<$Res> {
  factory _$$_SalesDistrictDetailsDtoCopyWith(_$_SalesDistrictDetailsDto value,
          $Res Function(_$_SalesDistrictDetailsDto) then) =
      __$$_SalesDistrictDetailsDtoCopyWithImpl<$Res>;
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
class __$$_SalesDistrictDetailsDtoCopyWithImpl<$Res>
    extends _$SalesDistrictDetailsDtoCopyWithImpl<$Res,
        _$_SalesDistrictDetailsDto>
    implements _$$_SalesDistrictDetailsDtoCopyWith<$Res> {
  __$$_SalesDistrictDetailsDtoCopyWithImpl(_$_SalesDistrictDetailsDto _value,
      $Res Function(_$_SalesDistrictDetailsDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? salesDistrict = null,
    Object? salesDistrictLabel = null,
  }) {
    return _then(_$_SalesDistrictDetailsDto(
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
class _$_SalesDistrictDetailsDto extends _SalesDistrictDetailsDto {
  const _$_SalesDistrictDetailsDto(
      {@JsonKey(name: 'id', defaultValue: 0)
          required this.id,
      @JsonKey(name: 'salesDistrict', defaultValue: '')
          required this.salesDistrict,
      @JsonKey(name: 'salesDistrictLabel', defaultValue: '')
          required this.salesDistrictLabel})
      : super._();

  factory _$_SalesDistrictDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$$_SalesDistrictDetailsDtoFromJson(json);

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
    return 'SalesDistrictDetailsDto(id: $id, salesDistrict: $salesDistrict, salesDistrictLabel: $salesDistrictLabel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SalesDistrictDetailsDto &&
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
  _$$_SalesDistrictDetailsDtoCopyWith<_$_SalesDistrictDetailsDto>
      get copyWith =>
          __$$_SalesDistrictDetailsDtoCopyWithImpl<_$_SalesDistrictDetailsDto>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SalesDistrictDetailsDtoToJson(
      this,
    );
  }
}

abstract class _SalesDistrictDetailsDto extends SalesDistrictDetailsDto {
  const factory _SalesDistrictDetailsDto(
          {@JsonKey(name: 'id', defaultValue: 0)
              required final int id,
          @JsonKey(name: 'salesDistrict', defaultValue: '')
              required final String salesDistrict,
          @JsonKey(name: 'salesDistrictLabel', defaultValue: '')
              required final String salesDistrictLabel}) =
      _$_SalesDistrictDetailsDto;
  const _SalesDistrictDetailsDto._() : super._();

  factory _SalesDistrictDetailsDto.fromJson(Map<String, dynamic> json) =
      _$_SalesDistrictDetailsDto.fromJson;

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
  _$$_SalesDistrictDetailsDtoCopyWith<_$_SalesDistrictDetailsDto>
      get copyWith => throw _privateConstructorUsedError;
}

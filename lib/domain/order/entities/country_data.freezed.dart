// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'country_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CountryData {
  String get country => throw _privateConstructorUsedError;
  StringValue get countryName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CountryDataCopyWith<CountryData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryDataCopyWith<$Res> {
  factory $CountryDataCopyWith(
          CountryData value, $Res Function(CountryData) then) =
      _$CountryDataCopyWithImpl<$Res, CountryData>;
  @useResult
  $Res call({String country, StringValue countryName});
}

/// @nodoc
class _$CountryDataCopyWithImpl<$Res, $Val extends CountryData>
    implements $CountryDataCopyWith<$Res> {
  _$CountryDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? country = null,
    Object? countryName = null,
  }) {
    return _then(_value.copyWith(
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      countryName: null == countryName
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as StringValue,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CountryDataCopyWith<$Res>
    implements $CountryDataCopyWith<$Res> {
  factory _$$_CountryDataCopyWith(
          _$_CountryData value, $Res Function(_$_CountryData) then) =
      __$$_CountryDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String country, StringValue countryName});
}

/// @nodoc
class __$$_CountryDataCopyWithImpl<$Res>
    extends _$CountryDataCopyWithImpl<$Res, _$_CountryData>
    implements _$$_CountryDataCopyWith<$Res> {
  __$$_CountryDataCopyWithImpl(
      _$_CountryData _value, $Res Function(_$_CountryData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? country = null,
    Object? countryName = null,
  }) {
    return _then(_$_CountryData(
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      countryName: null == countryName
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as StringValue,
    ));
  }
}

/// @nodoc

class _$_CountryData extends _CountryData {
  _$_CountryData({required this.country, required this.countryName})
      : super._();

  @override
  final String country;
  @override
  final StringValue countryName;

  @override
  String toString() {
    return 'CountryData(country: $country, countryName: $countryName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CountryData &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.countryName, countryName) ||
                other.countryName == countryName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, country, countryName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CountryDataCopyWith<_$_CountryData> get copyWith =>
      __$$_CountryDataCopyWithImpl<_$_CountryData>(this, _$identity);
}

abstract class _CountryData extends CountryData {
  factory _CountryData(
      {required final String country,
      required final StringValue countryName}) = _$_CountryData;
  _CountryData._() : super._();

  @override
  String get country;
  @override
  StringValue get countryName;
  @override
  @JsonKey(ignore: true)
  _$$_CountryDataCopyWith<_$_CountryData> get copyWith =>
      throw _privateConstructorUsedError;
}

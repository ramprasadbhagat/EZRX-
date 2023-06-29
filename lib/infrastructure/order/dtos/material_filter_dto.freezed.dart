// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_filter_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MaterialFilterDto _$MaterialFilterDtoFromJson(Map<String, dynamic> json) {
  return _MaterialFilterDto.fromJson(json);
}

/// @nodoc
mixin _$MaterialFilterDto {
  @JsonKey(name: 'ManufactureList', defaultValue: <String>[])
  List<String> get manufactureList => throw _privateConstructorUsedError;
  @JsonKey(name: 'CountryList', defaultValue: <MaterialFilterCountryDto>[])
  List<MaterialFilterCountryDto> get countryList =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'BrandList', defaultValue: <String>[])
  List<String> get brandList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaterialFilterDtoCopyWith<MaterialFilterDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialFilterDtoCopyWith<$Res> {
  factory $MaterialFilterDtoCopyWith(
          MaterialFilterDto value, $Res Function(MaterialFilterDto) then) =
      _$MaterialFilterDtoCopyWithImpl<$Res, MaterialFilterDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ManufactureList', defaultValue: <String>[])
          List<String> manufactureList,
      @JsonKey(name: 'CountryList', defaultValue: <MaterialFilterCountryDto>[])
          List<MaterialFilterCountryDto> countryList,
      @JsonKey(name: 'BrandList', defaultValue: <String>[])
          List<String> brandList});
}

/// @nodoc
class _$MaterialFilterDtoCopyWithImpl<$Res, $Val extends MaterialFilterDto>
    implements $MaterialFilterDtoCopyWith<$Res> {
  _$MaterialFilterDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? manufactureList = null,
    Object? countryList = null,
    Object? brandList = null,
  }) {
    return _then(_value.copyWith(
      manufactureList: null == manufactureList
          ? _value.manufactureList
          : manufactureList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      countryList: null == countryList
          ? _value.countryList
          : countryList // ignore: cast_nullable_to_non_nullable
              as List<MaterialFilterCountryDto>,
      brandList: null == brandList
          ? _value.brandList
          : brandList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MaterialFilterDtoCopyWith<$Res>
    implements $MaterialFilterDtoCopyWith<$Res> {
  factory _$$_MaterialFilterDtoCopyWith(_$_MaterialFilterDto value,
          $Res Function(_$_MaterialFilterDto) then) =
      __$$_MaterialFilterDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ManufactureList', defaultValue: <String>[])
          List<String> manufactureList,
      @JsonKey(name: 'CountryList', defaultValue: <MaterialFilterCountryDto>[])
          List<MaterialFilterCountryDto> countryList,
      @JsonKey(name: 'BrandList', defaultValue: <String>[])
          List<String> brandList});
}

/// @nodoc
class __$$_MaterialFilterDtoCopyWithImpl<$Res>
    extends _$MaterialFilterDtoCopyWithImpl<$Res, _$_MaterialFilterDto>
    implements _$$_MaterialFilterDtoCopyWith<$Res> {
  __$$_MaterialFilterDtoCopyWithImpl(
      _$_MaterialFilterDto _value, $Res Function(_$_MaterialFilterDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? manufactureList = null,
    Object? countryList = null,
    Object? brandList = null,
  }) {
    return _then(_$_MaterialFilterDto(
      manufactureList: null == manufactureList
          ? _value._manufactureList
          : manufactureList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      countryList: null == countryList
          ? _value._countryList
          : countryList // ignore: cast_nullable_to_non_nullable
              as List<MaterialFilterCountryDto>,
      brandList: null == brandList
          ? _value._brandList
          : brandList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MaterialFilterDto extends _MaterialFilterDto {
  const _$_MaterialFilterDto(
      {@JsonKey(name: 'ManufactureList', defaultValue: <String>[])
          required final List<String> manufactureList,
      @JsonKey(name: 'CountryList', defaultValue: <MaterialFilterCountryDto>[])
          required final List<MaterialFilterCountryDto> countryList,
      @JsonKey(name: 'BrandList', defaultValue: <String>[])
          required final List<String> brandList})
      : _manufactureList = manufactureList,
        _countryList = countryList,
        _brandList = brandList,
        super._();

  factory _$_MaterialFilterDto.fromJson(Map<String, dynamic> json) =>
      _$$_MaterialFilterDtoFromJson(json);

  final List<String> _manufactureList;
  @override
  @JsonKey(name: 'ManufactureList', defaultValue: <String>[])
  List<String> get manufactureList {
    if (_manufactureList is EqualUnmodifiableListView) return _manufactureList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_manufactureList);
  }

  final List<MaterialFilterCountryDto> _countryList;
  @override
  @JsonKey(name: 'CountryList', defaultValue: <MaterialFilterCountryDto>[])
  List<MaterialFilterCountryDto> get countryList {
    if (_countryList is EqualUnmodifiableListView) return _countryList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_countryList);
  }

  final List<String> _brandList;
  @override
  @JsonKey(name: 'BrandList', defaultValue: <String>[])
  List<String> get brandList {
    if (_brandList is EqualUnmodifiableListView) return _brandList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_brandList);
  }

  @override
  String toString() {
    return 'MaterialFilterDto(manufactureList: $manufactureList, countryList: $countryList, brandList: $brandList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MaterialFilterDto &&
            const DeepCollectionEquality()
                .equals(other._manufactureList, _manufactureList) &&
            const DeepCollectionEquality()
                .equals(other._countryList, _countryList) &&
            const DeepCollectionEquality()
                .equals(other._brandList, _brandList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_manufactureList),
      const DeepCollectionEquality().hash(_countryList),
      const DeepCollectionEquality().hash(_brandList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MaterialFilterDtoCopyWith<_$_MaterialFilterDto> get copyWith =>
      __$$_MaterialFilterDtoCopyWithImpl<_$_MaterialFilterDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MaterialFilterDtoToJson(
      this,
    );
  }
}

abstract class _MaterialFilterDto extends MaterialFilterDto {
  const factory _MaterialFilterDto(
      {@JsonKey(name: 'ManufactureList', defaultValue: <String>[])
          required final List<String> manufactureList,
      @JsonKey(name: 'CountryList', defaultValue: <MaterialFilterCountryDto>[])
          required final List<MaterialFilterCountryDto> countryList,
      @JsonKey(name: 'BrandList', defaultValue: <String>[])
          required final List<String> brandList}) = _$_MaterialFilterDto;
  const _MaterialFilterDto._() : super._();

  factory _MaterialFilterDto.fromJson(Map<String, dynamic> json) =
      _$_MaterialFilterDto.fromJson;

  @override
  @JsonKey(name: 'ManufactureList', defaultValue: <String>[])
  List<String> get manufactureList;
  @override
  @JsonKey(name: 'CountryList', defaultValue: <MaterialFilterCountryDto>[])
  List<MaterialFilterCountryDto> get countryList;
  @override
  @JsonKey(name: 'BrandList', defaultValue: <String>[])
  List<String> get brandList;
  @override
  @JsonKey(ignore: true)
  _$$_MaterialFilterDtoCopyWith<_$_MaterialFilterDto> get copyWith =>
      throw _privateConstructorUsedError;
}

MaterialFilterCountryDto _$MaterialFilterCountryDtoFromJson(
    Map<String, dynamic> json) {
  return _MaterialFilterCountryDto.fromJson(json);
}

/// @nodoc
mixin _$MaterialFilterCountryDto {
  @JsonKey(name: 'Code', defaultValue: '')
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'Name', defaultValue: '')
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaterialFilterCountryDtoCopyWith<MaterialFilterCountryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialFilterCountryDtoCopyWith<$Res> {
  factory $MaterialFilterCountryDtoCopyWith(MaterialFilterCountryDto value,
          $Res Function(MaterialFilterCountryDto) then) =
      _$MaterialFilterCountryDtoCopyWithImpl<$Res, MaterialFilterCountryDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Code', defaultValue: '') String code,
      @JsonKey(name: 'Name', defaultValue: '') String name});
}

/// @nodoc
class _$MaterialFilterCountryDtoCopyWithImpl<$Res,
        $Val extends MaterialFilterCountryDto>
    implements $MaterialFilterCountryDtoCopyWith<$Res> {
  _$MaterialFilterCountryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MaterialFilterCountryDtoCopyWith<$Res>
    implements $MaterialFilterCountryDtoCopyWith<$Res> {
  factory _$$_MaterialFilterCountryDtoCopyWith(
          _$_MaterialFilterCountryDto value,
          $Res Function(_$_MaterialFilterCountryDto) then) =
      __$$_MaterialFilterCountryDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Code', defaultValue: '') String code,
      @JsonKey(name: 'Name', defaultValue: '') String name});
}

/// @nodoc
class __$$_MaterialFilterCountryDtoCopyWithImpl<$Res>
    extends _$MaterialFilterCountryDtoCopyWithImpl<$Res,
        _$_MaterialFilterCountryDto>
    implements _$$_MaterialFilterCountryDtoCopyWith<$Res> {
  __$$_MaterialFilterCountryDtoCopyWithImpl(_$_MaterialFilterCountryDto _value,
      $Res Function(_$_MaterialFilterCountryDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
  }) {
    return _then(_$_MaterialFilterCountryDto(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MaterialFilterCountryDto extends _MaterialFilterCountryDto {
  const _$_MaterialFilterCountryDto(
      {@JsonKey(name: 'Code', defaultValue: '') required this.code,
      @JsonKey(name: 'Name', defaultValue: '') required this.name})
      : super._();

  factory _$_MaterialFilterCountryDto.fromJson(Map<String, dynamic> json) =>
      _$$_MaterialFilterCountryDtoFromJson(json);

  @override
  @JsonKey(name: 'Code', defaultValue: '')
  final String code;
  @override
  @JsonKey(name: 'Name', defaultValue: '')
  final String name;

  @override
  String toString() {
    return 'MaterialFilterCountryDto(code: $code, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MaterialFilterCountryDto &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MaterialFilterCountryDtoCopyWith<_$_MaterialFilterCountryDto>
      get copyWith => __$$_MaterialFilterCountryDtoCopyWithImpl<
          _$_MaterialFilterCountryDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MaterialFilterCountryDtoToJson(
      this,
    );
  }
}

abstract class _MaterialFilterCountryDto extends MaterialFilterCountryDto {
  const factory _MaterialFilterCountryDto(
      {@JsonKey(name: 'Code', defaultValue: '')
          required final String code,
      @JsonKey(name: 'Name', defaultValue: '')
          required final String name}) = _$_MaterialFilterCountryDto;
  const _MaterialFilterCountryDto._() : super._();

  factory _MaterialFilterCountryDto.fromJson(Map<String, dynamic> json) =
      _$_MaterialFilterCountryDto.fromJson;

  @override
  @JsonKey(name: 'Code', defaultValue: '')
  String get code;
  @override
  @JsonKey(name: 'Name', defaultValue: '')
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_MaterialFilterCountryDtoCopyWith<_$_MaterialFilterCountryDto>
      get copyWith => throw _privateConstructorUsedError;
}

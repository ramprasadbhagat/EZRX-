// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
  @JsonKey(name: 'uniquePrincipalName', defaultValue: <String>[])
  List<String> get uniquePrincipalName => throw _privateConstructorUsedError;
  @JsonKey(name: 'uniqueTherapeuticClass', defaultValue: <String>[])
  List<String> get uniqueTherapeuticClass => throw _privateConstructorUsedError;
  @JsonKey(name: 'uniqueItemBrand', defaultValue: <String>[])
  List<String> get uniqueItemBrand => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'uniquePrincipalName', defaultValue: <String>[])
          List<String> uniquePrincipalName,
      @JsonKey(name: 'uniqueTherapeuticClass', defaultValue: <String>[])
          List<String> uniqueTherapeuticClass,
      @JsonKey(name: 'uniqueItemBrand', defaultValue: <String>[])
          List<String> uniqueItemBrand});
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
    Object? uniquePrincipalName = null,
    Object? uniqueTherapeuticClass = null,
    Object? uniqueItemBrand = null,
  }) {
    return _then(_value.copyWith(
      uniquePrincipalName: null == uniquePrincipalName
          ? _value.uniquePrincipalName
          : uniquePrincipalName // ignore: cast_nullable_to_non_nullable
              as List<String>,
      uniqueTherapeuticClass: null == uniqueTherapeuticClass
          ? _value.uniqueTherapeuticClass
          : uniqueTherapeuticClass // ignore: cast_nullable_to_non_nullable
              as List<String>,
      uniqueItemBrand: null == uniqueItemBrand
          ? _value.uniqueItemBrand
          : uniqueItemBrand // ignore: cast_nullable_to_non_nullable
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
      {@JsonKey(name: 'uniquePrincipalName', defaultValue: <String>[])
          List<String> uniquePrincipalName,
      @JsonKey(name: 'uniqueTherapeuticClass', defaultValue: <String>[])
          List<String> uniqueTherapeuticClass,
      @JsonKey(name: 'uniqueItemBrand', defaultValue: <String>[])
          List<String> uniqueItemBrand});
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
    Object? uniquePrincipalName = null,
    Object? uniqueTherapeuticClass = null,
    Object? uniqueItemBrand = null,
  }) {
    return _then(_$_MaterialFilterDto(
      uniquePrincipalName: null == uniquePrincipalName
          ? _value._uniquePrincipalName
          : uniquePrincipalName // ignore: cast_nullable_to_non_nullable
              as List<String>,
      uniqueTherapeuticClass: null == uniqueTherapeuticClass
          ? _value._uniqueTherapeuticClass
          : uniqueTherapeuticClass // ignore: cast_nullable_to_non_nullable
              as List<String>,
      uniqueItemBrand: null == uniqueItemBrand
          ? _value._uniqueItemBrand
          : uniqueItemBrand // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MaterialFilterDto extends _MaterialFilterDto {
  const _$_MaterialFilterDto(
      {@JsonKey(name: 'uniquePrincipalName', defaultValue: <String>[])
          required final List<String> uniquePrincipalName,
      @JsonKey(name: 'uniqueTherapeuticClass', defaultValue: <String>[])
          required final List<String> uniqueTherapeuticClass,
      @JsonKey(name: 'uniqueItemBrand', defaultValue: <String>[])
          required final List<String> uniqueItemBrand})
      : _uniquePrincipalName = uniquePrincipalName,
        _uniqueTherapeuticClass = uniqueTherapeuticClass,
        _uniqueItemBrand = uniqueItemBrand,
        super._();

  factory _$_MaterialFilterDto.fromJson(Map<String, dynamic> json) =>
      _$$_MaterialFilterDtoFromJson(json);

  final List<String> _uniquePrincipalName;
  @override
  @JsonKey(name: 'uniquePrincipalName', defaultValue: <String>[])
  List<String> get uniquePrincipalName {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_uniquePrincipalName);
  }

  final List<String> _uniqueTherapeuticClass;
  @override
  @JsonKey(name: 'uniqueTherapeuticClass', defaultValue: <String>[])
  List<String> get uniqueTherapeuticClass {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_uniqueTherapeuticClass);
  }

  final List<String> _uniqueItemBrand;
  @override
  @JsonKey(name: 'uniqueItemBrand', defaultValue: <String>[])
  List<String> get uniqueItemBrand {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_uniqueItemBrand);
  }

  @override
  String toString() {
    return 'MaterialFilterDto(uniquePrincipalName: $uniquePrincipalName, uniqueTherapeuticClass: $uniqueTherapeuticClass, uniqueItemBrand: $uniqueItemBrand)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MaterialFilterDto &&
            const DeepCollectionEquality()
                .equals(other._uniquePrincipalName, _uniquePrincipalName) &&
            const DeepCollectionEquality().equals(
                other._uniqueTherapeuticClass, _uniqueTherapeuticClass) &&
            const DeepCollectionEquality()
                .equals(other._uniqueItemBrand, _uniqueItemBrand));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_uniquePrincipalName),
      const DeepCollectionEquality().hash(_uniqueTherapeuticClass),
      const DeepCollectionEquality().hash(_uniqueItemBrand));

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
      {@JsonKey(name: 'uniquePrincipalName', defaultValue: <String>[])
          required final List<String> uniquePrincipalName,
      @JsonKey(name: 'uniqueTherapeuticClass', defaultValue: <String>[])
          required final List<String> uniqueTherapeuticClass,
      @JsonKey(name: 'uniqueItemBrand', defaultValue: <String>[])
          required final List<String> uniqueItemBrand}) = _$_MaterialFilterDto;
  const _MaterialFilterDto._() : super._();

  factory _MaterialFilterDto.fromJson(Map<String, dynamic> json) =
      _$_MaterialFilterDto.fromJson;

  @override
  @JsonKey(name: 'uniquePrincipalName', defaultValue: <String>[])
  List<String> get uniquePrincipalName;
  @override
  @JsonKey(name: 'uniqueTherapeuticClass', defaultValue: <String>[])
  List<String> get uniqueTherapeuticClass;
  @override
  @JsonKey(name: 'uniqueItemBrand', defaultValue: <String>[])
  List<String> get uniqueItemBrand;
  @override
  @JsonKey(ignore: true)
  _$$_MaterialFilterDtoCopyWith<_$_MaterialFilterDto> get copyWith =>
      throw _privateConstructorUsedError;
}

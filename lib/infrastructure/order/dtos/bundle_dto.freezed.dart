// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bundle_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BundleDto _$BundleDtoFromJson(Map<String, dynamic> json) {
  return _BundleDto.fromJson(json);
}

/// @nodoc
mixin _$BundleDto {
  @JsonKey(name: 'bundleName')
  @HiveField(18)
  String get bundleName => throw _privateConstructorUsedError;
  @JsonKey(name: 'bundleCode')
  @HiveField(19)
  String get bundleCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'bundleInformation', defaultValue: <BundleInfoDto>[])
  @HiveField(20)
  List<BundleInfoDto> get bundleInformation =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BundleDtoCopyWith<BundleDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BundleDtoCopyWith<$Res> {
  factory $BundleDtoCopyWith(BundleDto value, $Res Function(BundleDto) then) =
      _$BundleDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'bundleName')
      @HiveField(18)
          String bundleName,
      @JsonKey(name: 'bundleCode')
      @HiveField(19)
          String bundleCode,
      @JsonKey(name: 'bundleInformation', defaultValue: <BundleInfoDto>[])
      @HiveField(20)
          List<BundleInfoDto> bundleInformation});
}

/// @nodoc
class _$BundleDtoCopyWithImpl<$Res> implements $BundleDtoCopyWith<$Res> {
  _$BundleDtoCopyWithImpl(this._value, this._then);

  final BundleDto _value;
  // ignore: unused_field
  final $Res Function(BundleDto) _then;

  @override
  $Res call({
    Object? bundleName = freezed,
    Object? bundleCode = freezed,
    Object? bundleInformation = freezed,
  }) {
    return _then(_value.copyWith(
      bundleName: bundleName == freezed
          ? _value.bundleName
          : bundleName // ignore: cast_nullable_to_non_nullable
              as String,
      bundleCode: bundleCode == freezed
          ? _value.bundleCode
          : bundleCode // ignore: cast_nullable_to_non_nullable
              as String,
      bundleInformation: bundleInformation == freezed
          ? _value.bundleInformation
          : bundleInformation // ignore: cast_nullable_to_non_nullable
              as List<BundleInfoDto>,
    ));
  }
}

/// @nodoc
abstract class _$$_BundleDtoCopyWith<$Res> implements $BundleDtoCopyWith<$Res> {
  factory _$$_BundleDtoCopyWith(
          _$_BundleDto value, $Res Function(_$_BundleDto) then) =
      __$$_BundleDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'bundleName')
      @HiveField(18)
          String bundleName,
      @JsonKey(name: 'bundleCode')
      @HiveField(19)
          String bundleCode,
      @JsonKey(name: 'bundleInformation', defaultValue: <BundleInfoDto>[])
      @HiveField(20)
          List<BundleInfoDto> bundleInformation});
}

/// @nodoc
class __$$_BundleDtoCopyWithImpl<$Res> extends _$BundleDtoCopyWithImpl<$Res>
    implements _$$_BundleDtoCopyWith<$Res> {
  __$$_BundleDtoCopyWithImpl(
      _$_BundleDto _value, $Res Function(_$_BundleDto) _then)
      : super(_value, (v) => _then(v as _$_BundleDto));

  @override
  _$_BundleDto get _value => super._value as _$_BundleDto;

  @override
  $Res call({
    Object? bundleName = freezed,
    Object? bundleCode = freezed,
    Object? bundleInformation = freezed,
  }) {
    return _then(_$_BundleDto(
      bundleName: bundleName == freezed
          ? _value.bundleName
          : bundleName // ignore: cast_nullable_to_non_nullable
              as String,
      bundleCode: bundleCode == freezed
          ? _value.bundleCode
          : bundleCode // ignore: cast_nullable_to_non_nullable
              as String,
      bundleInformation: bundleInformation == freezed
          ? _value._bundleInformation
          : bundleInformation // ignore: cast_nullable_to_non_nullable
              as List<BundleInfoDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 15, adapterName: 'BundleDtoAdapter')
class _$_BundleDto extends _BundleDto {
  const _$_BundleDto(
      {@JsonKey(name: 'bundleName')
      @HiveField(18)
          required this.bundleName,
      @JsonKey(name: 'bundleCode')
      @HiveField(19)
          required this.bundleCode,
      @JsonKey(name: 'bundleInformation', defaultValue: <BundleInfoDto>[])
      @HiveField(20)
          required final List<BundleInfoDto> bundleInformation})
      : _bundleInformation = bundleInformation,
        super._();

  factory _$_BundleDto.fromJson(Map<String, dynamic> json) =>
      _$$_BundleDtoFromJson(json);

  @override
  @JsonKey(name: 'bundleName')
  @HiveField(18)
  final String bundleName;
  @override
  @JsonKey(name: 'bundleCode')
  @HiveField(19)
  final String bundleCode;
  final List<BundleInfoDto> _bundleInformation;
  @override
  @JsonKey(name: 'bundleInformation', defaultValue: <BundleInfoDto>[])
  @HiveField(20)
  List<BundleInfoDto> get bundleInformation {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bundleInformation);
  }

  @override
  String toString() {
    return 'BundleDto(bundleName: $bundleName, bundleCode: $bundleCode, bundleInformation: $bundleInformation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BundleDto &&
            const DeepCollectionEquality()
                .equals(other.bundleName, bundleName) &&
            const DeepCollectionEquality()
                .equals(other.bundleCode, bundleCode) &&
            const DeepCollectionEquality()
                .equals(other._bundleInformation, _bundleInformation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(bundleName),
      const DeepCollectionEquality().hash(bundleCode),
      const DeepCollectionEquality().hash(_bundleInformation));

  @JsonKey(ignore: true)
  @override
  _$$_BundleDtoCopyWith<_$_BundleDto> get copyWith =>
      __$$_BundleDtoCopyWithImpl<_$_BundleDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BundleDtoToJson(
      this,
    );
  }
}

abstract class _BundleDto extends BundleDto {
  const factory _BundleDto(
      {@JsonKey(name: 'bundleName')
      @HiveField(18)
          required final String bundleName,
      @JsonKey(name: 'bundleCode')
      @HiveField(19)
          required final String bundleCode,
      @JsonKey(name: 'bundleInformation', defaultValue: <BundleInfoDto>[])
      @HiveField(20)
          required final List<BundleInfoDto> bundleInformation}) = _$_BundleDto;
  const _BundleDto._() : super._();

  factory _BundleDto.fromJson(Map<String, dynamic> json) =
      _$_BundleDto.fromJson;

  @override
  @JsonKey(name: 'bundleName')
  @HiveField(18)
  String get bundleName;
  @override
  @JsonKey(name: 'bundleCode')
  @HiveField(19)
  String get bundleCode;
  @override
  @JsonKey(name: 'bundleInformation', defaultValue: <BundleInfoDto>[])
  @HiveField(20)
  List<BundleInfoDto> get bundleInformation;
  @override
  @JsonKey(ignore: true)
  _$$_BundleDtoCopyWith<_$_BundleDto> get copyWith =>
      throw _privateConstructorUsedError;
}

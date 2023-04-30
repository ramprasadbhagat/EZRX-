// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_bundle_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MaterialBundleDto _$MaterialBundleDtoFromJson(Map<String, dynamic> json) {
  return _MaterialBundleDto.fromJson(json);
}

/// @nodoc
mixin _$MaterialBundleDto {
  @JsonKey(name: 'MaterialNumber')
  String get materialNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'Bundles', defaultValue: <BundleDto>[])
  List<BundleDto> get bundles => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaterialBundleDtoCopyWith<MaterialBundleDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialBundleDtoCopyWith<$Res> {
  factory $MaterialBundleDtoCopyWith(
          MaterialBundleDto value, $Res Function(MaterialBundleDto) then) =
      _$MaterialBundleDtoCopyWithImpl<$Res, MaterialBundleDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'MaterialNumber')
          String materialNumber,
      @JsonKey(name: 'Bundles', defaultValue: <BundleDto>[])
          List<BundleDto> bundles});
}

/// @nodoc
class _$MaterialBundleDtoCopyWithImpl<$Res, $Val extends MaterialBundleDto>
    implements $MaterialBundleDtoCopyWith<$Res> {
  _$MaterialBundleDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? bundles = null,
  }) {
    return _then(_value.copyWith(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      bundles: null == bundles
          ? _value.bundles
          : bundles // ignore: cast_nullable_to_non_nullable
              as List<BundleDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MaterialBundleDtoCopyWith<$Res>
    implements $MaterialBundleDtoCopyWith<$Res> {
  factory _$$_MaterialBundleDtoCopyWith(_$_MaterialBundleDto value,
          $Res Function(_$_MaterialBundleDto) then) =
      __$$_MaterialBundleDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'MaterialNumber')
          String materialNumber,
      @JsonKey(name: 'Bundles', defaultValue: <BundleDto>[])
          List<BundleDto> bundles});
}

/// @nodoc
class __$$_MaterialBundleDtoCopyWithImpl<$Res>
    extends _$MaterialBundleDtoCopyWithImpl<$Res, _$_MaterialBundleDto>
    implements _$$_MaterialBundleDtoCopyWith<$Res> {
  __$$_MaterialBundleDtoCopyWithImpl(
      _$_MaterialBundleDto _value, $Res Function(_$_MaterialBundleDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialNumber = null,
    Object? bundles = null,
  }) {
    return _then(_$_MaterialBundleDto(
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
      bundles: null == bundles
          ? _value._bundles
          : bundles // ignore: cast_nullable_to_non_nullable
              as List<BundleDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MaterialBundleDto extends _MaterialBundleDto {
  const _$_MaterialBundleDto(
      {@JsonKey(name: 'MaterialNumber')
          required this.materialNumber,
      @JsonKey(name: 'Bundles', defaultValue: <BundleDto>[])
          required final List<BundleDto> bundles})
      : _bundles = bundles,
        super._();

  factory _$_MaterialBundleDto.fromJson(Map<String, dynamic> json) =>
      _$$_MaterialBundleDtoFromJson(json);

  @override
  @JsonKey(name: 'MaterialNumber')
  final String materialNumber;
  final List<BundleDto> _bundles;
  @override
  @JsonKey(name: 'Bundles', defaultValue: <BundleDto>[])
  List<BundleDto> get bundles {
    if (_bundles is EqualUnmodifiableListView) return _bundles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bundles);
  }

  @override
  String toString() {
    return 'MaterialBundleDto(materialNumber: $materialNumber, bundles: $bundles)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MaterialBundleDto &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber) &&
            const DeepCollectionEquality().equals(other._bundles, _bundles));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, materialNumber,
      const DeepCollectionEquality().hash(_bundles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MaterialBundleDtoCopyWith<_$_MaterialBundleDto> get copyWith =>
      __$$_MaterialBundleDtoCopyWithImpl<_$_MaterialBundleDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MaterialBundleDtoToJson(
      this,
    );
  }
}

abstract class _MaterialBundleDto extends MaterialBundleDto {
  const factory _MaterialBundleDto(
      {@JsonKey(name: 'MaterialNumber')
          required final String materialNumber,
      @JsonKey(name: 'Bundles', defaultValue: <BundleDto>[])
          required final List<BundleDto> bundles}) = _$_MaterialBundleDto;
  const _MaterialBundleDto._() : super._();

  factory _MaterialBundleDto.fromJson(Map<String, dynamic> json) =
      _$_MaterialBundleDto.fromJson;

  @override
  @JsonKey(name: 'MaterialNumber')
  String get materialNumber;
  @override
  @JsonKey(name: 'Bundles', defaultValue: <BundleDto>[])
  List<BundleDto> get bundles;
  @override
  @JsonKey(ignore: true)
  _$$_MaterialBundleDtoCopyWith<_$_MaterialBundleDto> get copyWith =>
      throw _privateConstructorUsedError;
}

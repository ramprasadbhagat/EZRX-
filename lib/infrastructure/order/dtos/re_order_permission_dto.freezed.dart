// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 're_order_permission_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReOrderPermissionDto _$ReOrderPermissionDtoFromJson(Map<String, dynamic> json) {
  return _ReOrderPermissionDto.fromJson(json);
}

/// @nodoc
mixin _$ReOrderPermissionDto {
  @JsonKey(name: 'materials', defaultValue: <ValidMaterial>[])
  List<ValidMaterialDto> get validMaterials =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReOrderPermissionDtoCopyWith<ReOrderPermissionDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReOrderPermissionDtoCopyWith<$Res> {
  factory $ReOrderPermissionDtoCopyWith(ReOrderPermissionDto value,
          $Res Function(ReOrderPermissionDto) then) =
      _$ReOrderPermissionDtoCopyWithImpl<$Res, ReOrderPermissionDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'materials', defaultValue: <ValidMaterial>[])
      List<ValidMaterialDto> validMaterials});
}

/// @nodoc
class _$ReOrderPermissionDtoCopyWithImpl<$Res,
        $Val extends ReOrderPermissionDto>
    implements $ReOrderPermissionDtoCopyWith<$Res> {
  _$ReOrderPermissionDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? validMaterials = null,
  }) {
    return _then(_value.copyWith(
      validMaterials: null == validMaterials
          ? _value.validMaterials
          : validMaterials // ignore: cast_nullable_to_non_nullable
              as List<ValidMaterialDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReOrderPermissionDtoCopyWith<$Res>
    implements $ReOrderPermissionDtoCopyWith<$Res> {
  factory _$$_ReOrderPermissionDtoCopyWith(_$_ReOrderPermissionDto value,
          $Res Function(_$_ReOrderPermissionDto) then) =
      __$$_ReOrderPermissionDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'materials', defaultValue: <ValidMaterial>[])
      List<ValidMaterialDto> validMaterials});
}

/// @nodoc
class __$$_ReOrderPermissionDtoCopyWithImpl<$Res>
    extends _$ReOrderPermissionDtoCopyWithImpl<$Res, _$_ReOrderPermissionDto>
    implements _$$_ReOrderPermissionDtoCopyWith<$Res> {
  __$$_ReOrderPermissionDtoCopyWithImpl(_$_ReOrderPermissionDto _value,
      $Res Function(_$_ReOrderPermissionDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? validMaterials = null,
  }) {
    return _then(_$_ReOrderPermissionDto(
      validMaterials: null == validMaterials
          ? _value._validMaterials
          : validMaterials // ignore: cast_nullable_to_non_nullable
              as List<ValidMaterialDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReOrderPermissionDto extends _ReOrderPermissionDto {
  _$_ReOrderPermissionDto(
      {@JsonKey(name: 'materials', defaultValue: <ValidMaterial>[])
      required final List<ValidMaterialDto> validMaterials})
      : _validMaterials = validMaterials,
        super._();

  factory _$_ReOrderPermissionDto.fromJson(Map<String, dynamic> json) =>
      _$$_ReOrderPermissionDtoFromJson(json);

  final List<ValidMaterialDto> _validMaterials;
  @override
  @JsonKey(name: 'materials', defaultValue: <ValidMaterial>[])
  List<ValidMaterialDto> get validMaterials {
    if (_validMaterials is EqualUnmodifiableListView) return _validMaterials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_validMaterials);
  }

  @override
  String toString() {
    return 'ReOrderPermissionDto(validMaterials: $validMaterials)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReOrderPermissionDto &&
            const DeepCollectionEquality()
                .equals(other._validMaterials, _validMaterials));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_validMaterials));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReOrderPermissionDtoCopyWith<_$_ReOrderPermissionDto> get copyWith =>
      __$$_ReOrderPermissionDtoCopyWithImpl<_$_ReOrderPermissionDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReOrderPermissionDtoToJson(
      this,
    );
  }
}

abstract class _ReOrderPermissionDto extends ReOrderPermissionDto {
  factory _ReOrderPermissionDto(
          {@JsonKey(name: 'materials', defaultValue: <ValidMaterial>[])
          required final List<ValidMaterialDto> validMaterials}) =
      _$_ReOrderPermissionDto;
  _ReOrderPermissionDto._() : super._();

  factory _ReOrderPermissionDto.fromJson(Map<String, dynamic> json) =
      _$_ReOrderPermissionDto.fromJson;

  @override
  @JsonKey(name: 'materials', defaultValue: <ValidMaterial>[])
  List<ValidMaterialDto> get validMaterials;
  @override
  @JsonKey(ignore: true)
  _$$_ReOrderPermissionDtoCopyWith<_$_ReOrderPermissionDto> get copyWith =>
      throw _privateConstructorUsedError;
}

ValidMaterialDto _$ValidMaterialDtoFromJson(Map<String, dynamic> json) {
  return _ValidMaterialDto.fromJson(json);
}

/// @nodoc
mixin _$ValidMaterialDto {
  @JsonKey(name: 'hidePrice', defaultValue: false)
  bool get hidePrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'materialNumber', defaultValue: '')
  String get materialNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ValidMaterialDtoCopyWith<ValidMaterialDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValidMaterialDtoCopyWith<$Res> {
  factory $ValidMaterialDtoCopyWith(
          ValidMaterialDto value, $Res Function(ValidMaterialDto) then) =
      _$ValidMaterialDtoCopyWithImpl<$Res, ValidMaterialDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'hidePrice', defaultValue: false) bool hidePrice,
      @JsonKey(name: 'materialNumber', defaultValue: '')
      String materialNumber});
}

/// @nodoc
class _$ValidMaterialDtoCopyWithImpl<$Res, $Val extends ValidMaterialDto>
    implements $ValidMaterialDtoCopyWith<$Res> {
  _$ValidMaterialDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hidePrice = null,
    Object? materialNumber = null,
  }) {
    return _then(_value.copyWith(
      hidePrice: null == hidePrice
          ? _value.hidePrice
          : hidePrice // ignore: cast_nullable_to_non_nullable
              as bool,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ValidMaterialDtoCopyWith<$Res>
    implements $ValidMaterialDtoCopyWith<$Res> {
  factory _$$_ValidMaterialDtoCopyWith(
          _$_ValidMaterialDto value, $Res Function(_$_ValidMaterialDto) then) =
      __$$_ValidMaterialDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'hidePrice', defaultValue: false) bool hidePrice,
      @JsonKey(name: 'materialNumber', defaultValue: '')
      String materialNumber});
}

/// @nodoc
class __$$_ValidMaterialDtoCopyWithImpl<$Res>
    extends _$ValidMaterialDtoCopyWithImpl<$Res, _$_ValidMaterialDto>
    implements _$$_ValidMaterialDtoCopyWith<$Res> {
  __$$_ValidMaterialDtoCopyWithImpl(
      _$_ValidMaterialDto _value, $Res Function(_$_ValidMaterialDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hidePrice = null,
    Object? materialNumber = null,
  }) {
    return _then(_$_ValidMaterialDto(
      hidePrice: null == hidePrice
          ? _value.hidePrice
          : hidePrice // ignore: cast_nullable_to_non_nullable
              as bool,
      materialNumber: null == materialNumber
          ? _value.materialNumber
          : materialNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ValidMaterialDto extends _ValidMaterialDto {
  _$_ValidMaterialDto(
      {@JsonKey(name: 'hidePrice', defaultValue: false) required this.hidePrice,
      @JsonKey(name: 'materialNumber', defaultValue: '')
      required this.materialNumber})
      : super._();

  factory _$_ValidMaterialDto.fromJson(Map<String, dynamic> json) =>
      _$$_ValidMaterialDtoFromJson(json);

  @override
  @JsonKey(name: 'hidePrice', defaultValue: false)
  final bool hidePrice;
  @override
  @JsonKey(name: 'materialNumber', defaultValue: '')
  final String materialNumber;

  @override
  String toString() {
    return 'ValidMaterialDto(hidePrice: $hidePrice, materialNumber: $materialNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ValidMaterialDto &&
            (identical(other.hidePrice, hidePrice) ||
                other.hidePrice == hidePrice) &&
            (identical(other.materialNumber, materialNumber) ||
                other.materialNumber == materialNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, hidePrice, materialNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ValidMaterialDtoCopyWith<_$_ValidMaterialDto> get copyWith =>
      __$$_ValidMaterialDtoCopyWithImpl<_$_ValidMaterialDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ValidMaterialDtoToJson(
      this,
    );
  }
}

abstract class _ValidMaterialDto extends ValidMaterialDto {
  factory _ValidMaterialDto(
      {@JsonKey(name: 'hidePrice', defaultValue: false)
      required final bool hidePrice,
      @JsonKey(name: 'materialNumber', defaultValue: '')
      required final String materialNumber}) = _$_ValidMaterialDto;
  _ValidMaterialDto._() : super._();

  factory _ValidMaterialDto.fromJson(Map<String, dynamic> json) =
      _$_ValidMaterialDto.fromJson;

  @override
  @JsonKey(name: 'hidePrice', defaultValue: false)
  bool get hidePrice;
  @override
  @JsonKey(name: 'materialNumber', defaultValue: '')
  String get materialNumber;
  @override
  @JsonKey(ignore: true)
  _$$_ValidMaterialDtoCopyWith<_$_ValidMaterialDto> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'material_price_detail_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MaterialDetailDto _$MaterialDetailDtoFromJson(Map<String, dynamic> json) {
  return _MaterialDetailDto.fromJson(json);
}

/// @nodoc
mixin _$MaterialDetailDto {
  @JsonKey(name: 'Price')
  PriceDto get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'MaterialInformation')
  CustomerMaterialDto get info => throw _privateConstructorUsedError;
  @JsonKey(name: 'ValidMaterial', defaultValue: false)
  bool get isValidMaterial => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaterialDetailDtoCopyWith<MaterialDetailDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialDetailDtoCopyWith<$Res> {
  factory $MaterialDetailDtoCopyWith(
          MaterialDetailDto value, $Res Function(MaterialDetailDto) then) =
      _$MaterialDetailDtoCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'Price')
          PriceDto price,
      @JsonKey(name: 'MaterialInformation')
          CustomerMaterialDto info,
      @JsonKey(name: 'ValidMaterial', defaultValue: false)
          bool isValidMaterial});

  $PriceDtoCopyWith<$Res> get price;
  $CustomerMaterialDtoCopyWith<$Res> get info;
}

/// @nodoc
class _$MaterialDetailDtoCopyWithImpl<$Res>
    implements $MaterialDetailDtoCopyWith<$Res> {
  _$MaterialDetailDtoCopyWithImpl(this._value, this._then);

  final MaterialDetailDto _value;
  // ignore: unused_field
  final $Res Function(MaterialDetailDto) _then;

  @override
  $Res call({
    Object? price = freezed,
    Object? info = freezed,
    Object? isValidMaterial = freezed,
  }) {
    return _then(_value.copyWith(
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as PriceDto,
      info: info == freezed
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as CustomerMaterialDto,
      isValidMaterial: isValidMaterial == freezed
          ? _value.isValidMaterial
          : isValidMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $PriceDtoCopyWith<$Res> get price {
    return $PriceDtoCopyWith<$Res>(_value.price, (value) {
      return _then(_value.copyWith(price: value));
    });
  }

  @override
  $CustomerMaterialDtoCopyWith<$Res> get info {
    return $CustomerMaterialDtoCopyWith<$Res>(_value.info, (value) {
      return _then(_value.copyWith(info: value));
    });
  }
}

/// @nodoc
abstract class _$$_MaterialDetailDtoCopyWith<$Res>
    implements $MaterialDetailDtoCopyWith<$Res> {
  factory _$$_MaterialDetailDtoCopyWith(_$_MaterialDetailDto value,
          $Res Function(_$_MaterialDetailDto) then) =
      __$$_MaterialDetailDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'Price')
          PriceDto price,
      @JsonKey(name: 'MaterialInformation')
          CustomerMaterialDto info,
      @JsonKey(name: 'ValidMaterial', defaultValue: false)
          bool isValidMaterial});

  @override
  $PriceDtoCopyWith<$Res> get price;
  @override
  $CustomerMaterialDtoCopyWith<$Res> get info;
}

/// @nodoc
class __$$_MaterialDetailDtoCopyWithImpl<$Res>
    extends _$MaterialDetailDtoCopyWithImpl<$Res>
    implements _$$_MaterialDetailDtoCopyWith<$Res> {
  __$$_MaterialDetailDtoCopyWithImpl(
      _$_MaterialDetailDto _value, $Res Function(_$_MaterialDetailDto) _then)
      : super(_value, (v) => _then(v as _$_MaterialDetailDto));

  @override
  _$_MaterialDetailDto get _value => super._value as _$_MaterialDetailDto;

  @override
  $Res call({
    Object? price = freezed,
    Object? info = freezed,
    Object? isValidMaterial = freezed,
  }) {
    return _then(_$_MaterialDetailDto(
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as PriceDto,
      info: info == freezed
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as CustomerMaterialDto,
      isValidMaterial: isValidMaterial == freezed
          ? _value.isValidMaterial
          : isValidMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MaterialDetailDto extends _MaterialDetailDto {
  const _$_MaterialDetailDto(
      {@JsonKey(name: 'Price')
          required this.price,
      @JsonKey(name: 'MaterialInformation')
          required this.info,
      @JsonKey(name: 'ValidMaterial', defaultValue: false)
          required this.isValidMaterial})
      : super._();

  factory _$_MaterialDetailDto.fromJson(Map<String, dynamic> json) =>
      _$$_MaterialDetailDtoFromJson(json);

  @override
  @JsonKey(name: 'Price')
  final PriceDto price;
  @override
  @JsonKey(name: 'MaterialInformation')
  final CustomerMaterialDto info;
  @override
  @JsonKey(name: 'ValidMaterial', defaultValue: false)
  final bool isValidMaterial;

  @override
  String toString() {
    return 'MaterialDetailDto(price: $price, info: $info, isValidMaterial: $isValidMaterial)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MaterialDetailDto &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.info, info) &&
            const DeepCollectionEquality()
                .equals(other.isValidMaterial, isValidMaterial));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(info),
      const DeepCollectionEquality().hash(isValidMaterial));

  @JsonKey(ignore: true)
  @override
  _$$_MaterialDetailDtoCopyWith<_$_MaterialDetailDto> get copyWith =>
      __$$_MaterialDetailDtoCopyWithImpl<_$_MaterialDetailDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MaterialDetailDtoToJson(
      this,
    );
  }
}

abstract class _MaterialDetailDto extends MaterialDetailDto {
  const factory _MaterialDetailDto(
      {@JsonKey(name: 'Price')
          required final PriceDto price,
      @JsonKey(name: 'MaterialInformation')
          required final CustomerMaterialDto info,
      @JsonKey(name: 'ValidMaterial', defaultValue: false)
          required final bool isValidMaterial}) = _$_MaterialDetailDto;
  const _MaterialDetailDto._() : super._();

  factory _MaterialDetailDto.fromJson(Map<String, dynamic> json) =
      _$_MaterialDetailDto.fromJson;

  @override
  @JsonKey(name: 'Price')
  PriceDto get price;
  @override
  @JsonKey(name: 'MaterialInformation')
  CustomerMaterialDto get info;
  @override
  @JsonKey(name: 'ValidMaterial', defaultValue: false)
  bool get isValidMaterial;
  @override
  @JsonKey(ignore: true)
  _$$_MaterialDetailDtoCopyWith<_$_MaterialDetailDto> get copyWith =>
      throw _privateConstructorUsedError;
}

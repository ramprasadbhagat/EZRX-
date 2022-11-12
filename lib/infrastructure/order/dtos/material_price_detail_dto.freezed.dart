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
      _$MaterialDetailDtoCopyWithImpl<$Res, MaterialDetailDto>;
  @useResult
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
class _$MaterialDetailDtoCopyWithImpl<$Res, $Val extends MaterialDetailDto>
    implements $MaterialDetailDtoCopyWith<$Res> {
  _$MaterialDetailDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
    Object? info = null,
    Object? isValidMaterial = null,
  }) {
    return _then(_value.copyWith(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as PriceDto,
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as CustomerMaterialDto,
      isValidMaterial: null == isValidMaterial
          ? _value.isValidMaterial
          : isValidMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceDtoCopyWith<$Res> get price {
    return $PriceDtoCopyWith<$Res>(_value.price, (value) {
      return _then(_value.copyWith(price: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CustomerMaterialDtoCopyWith<$Res> get info {
    return $CustomerMaterialDtoCopyWith<$Res>(_value.info, (value) {
      return _then(_value.copyWith(info: value) as $Val);
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
  @useResult
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
    extends _$MaterialDetailDtoCopyWithImpl<$Res, _$_MaterialDetailDto>
    implements _$$_MaterialDetailDtoCopyWith<$Res> {
  __$$_MaterialDetailDtoCopyWithImpl(
      _$_MaterialDetailDto _value, $Res Function(_$_MaterialDetailDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
    Object? info = null,
    Object? isValidMaterial = null,
  }) {
    return _then(_$_MaterialDetailDto(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as PriceDto,
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as CustomerMaterialDto,
      isValidMaterial: null == isValidMaterial
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
            (identical(other.price, price) || other.price == price) &&
            (identical(other.info, info) || other.info == info) &&
            (identical(other.isValidMaterial, isValidMaterial) ||
                other.isValidMaterial == isValidMaterial));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, price, info, isValidMaterial);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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

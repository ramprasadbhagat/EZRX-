// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_price_detail_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MaterialPriceDetailDto _$MaterialPriceDetailDtoFromJson(
    Map<String, dynamic> json) {
  return _MaterialPriceDetailDto.fromJson(json);
}

/// @nodoc
mixin _$MaterialPriceDetailDto {
  @JsonKey(name: 'price')
  PriceDto get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'validMaterial', defaultValue: false)
  bool get isValidMaterial => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaterialPriceDetailDtoCopyWith<MaterialPriceDetailDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialPriceDetailDtoCopyWith<$Res> {
  factory $MaterialPriceDetailDtoCopyWith(MaterialPriceDetailDto value,
          $Res Function(MaterialPriceDetailDto) then) =
      _$MaterialPriceDetailDtoCopyWithImpl<$Res, MaterialPriceDetailDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'price')
          PriceDto price,
      @JsonKey(name: 'validMaterial', defaultValue: false)
          bool isValidMaterial});

  $PriceDtoCopyWith<$Res> get price;
}

/// @nodoc
class _$MaterialPriceDetailDtoCopyWithImpl<$Res,
        $Val extends MaterialPriceDetailDto>
    implements $MaterialPriceDetailDtoCopyWith<$Res> {
  _$MaterialPriceDetailDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
    Object? isValidMaterial = null,
  }) {
    return _then(_value.copyWith(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as PriceDto,
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
}

/// @nodoc
abstract class _$$_MaterialPriceDetailDtoCopyWith<$Res>
    implements $MaterialPriceDetailDtoCopyWith<$Res> {
  factory _$$_MaterialPriceDetailDtoCopyWith(_$_MaterialPriceDetailDto value,
          $Res Function(_$_MaterialPriceDetailDto) then) =
      __$$_MaterialPriceDetailDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'price')
          PriceDto price,
      @JsonKey(name: 'validMaterial', defaultValue: false)
          bool isValidMaterial});

  @override
  $PriceDtoCopyWith<$Res> get price;
}

/// @nodoc
class __$$_MaterialPriceDetailDtoCopyWithImpl<$Res>
    extends _$MaterialPriceDetailDtoCopyWithImpl<$Res,
        _$_MaterialPriceDetailDto>
    implements _$$_MaterialPriceDetailDtoCopyWith<$Res> {
  __$$_MaterialPriceDetailDtoCopyWithImpl(_$_MaterialPriceDetailDto _value,
      $Res Function(_$_MaterialPriceDetailDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
    Object? isValidMaterial = null,
  }) {
    return _then(_$_MaterialPriceDetailDto(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as PriceDto,
      isValidMaterial: null == isValidMaterial
          ? _value.isValidMaterial
          : isValidMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MaterialPriceDetailDto extends _MaterialPriceDetailDto {
  const _$_MaterialPriceDetailDto(
      {@JsonKey(name: 'price')
          required this.price,
      @JsonKey(name: 'validMaterial', defaultValue: false)
          required this.isValidMaterial})
      : super._();

  factory _$_MaterialPriceDetailDto.fromJson(Map<String, dynamic> json) =>
      _$$_MaterialPriceDetailDtoFromJson(json);

  @override
  @JsonKey(name: 'price')
  final PriceDto price;
  @override
  @JsonKey(name: 'validMaterial', defaultValue: false)
  final bool isValidMaterial;

  @override
  String toString() {
    return 'MaterialPriceDetailDto(price: $price, isValidMaterial: $isValidMaterial)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MaterialPriceDetailDto &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.isValidMaterial, isValidMaterial) ||
                other.isValidMaterial == isValidMaterial));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, price, isValidMaterial);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MaterialPriceDetailDtoCopyWith<_$_MaterialPriceDetailDto> get copyWith =>
      __$$_MaterialPriceDetailDtoCopyWithImpl<_$_MaterialPriceDetailDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MaterialPriceDetailDtoToJson(
      this,
    );
  }
}

abstract class _MaterialPriceDetailDto extends MaterialPriceDetailDto {
  const factory _MaterialPriceDetailDto(
      {@JsonKey(name: 'price')
          required final PriceDto price,
      @JsonKey(name: 'validMaterial', defaultValue: false)
          required final bool isValidMaterial}) = _$_MaterialPriceDetailDto;
  const _MaterialPriceDetailDto._() : super._();

  factory _MaterialPriceDetailDto.fromJson(Map<String, dynamic> json) =
      _$_MaterialPriceDetailDto.fromJson;

  @override
  @JsonKey(name: 'price')
  PriceDto get price;
  @override
  @JsonKey(name: 'validMaterial', defaultValue: false)
  bool get isValidMaterial;
  @override
  @JsonKey(ignore: true)
  _$$_MaterialPriceDetailDtoCopyWith<_$_MaterialPriceDetailDto> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_meta_data_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductMetaDataDto _$ProductMetaDataDtoFromJson(Map<String, dynamic> json) {
  return _ProductMetaDataDto.fromJson(json);
}

/// @nodoc
mixin _$ProductMetaDataDto {
  @JsonKey(name: 'orderCloudProduct', defaultValue: <ProductImagesDto>[])
  List<ProductImagesDto> get productImages =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'Items', defaultValue: <ProductItemDto>[])
  List<ProductItemDto> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductMetaDataDtoCopyWith<ProductMetaDataDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductMetaDataDtoCopyWith<$Res> {
  factory $ProductMetaDataDtoCopyWith(
          ProductMetaDataDto value, $Res Function(ProductMetaDataDto) then) =
      _$ProductMetaDataDtoCopyWithImpl<$Res, ProductMetaDataDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'orderCloudProduct', defaultValue: <ProductImagesDto>[])
          List<ProductImagesDto> productImages,
      @JsonKey(name: 'Items', defaultValue: <ProductItemDto>[])
          List<ProductItemDto> items});
}

/// @nodoc
class _$ProductMetaDataDtoCopyWithImpl<$Res, $Val extends ProductMetaDataDto>
    implements $ProductMetaDataDtoCopyWith<$Res> {
  _$ProductMetaDataDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productImages = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      productImages: null == productImages
          ? _value.productImages
          : productImages // ignore: cast_nullable_to_non_nullable
              as List<ProductImagesDto>,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ProductItemDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductMetaDataDtoCopyWith<$Res>
    implements $ProductMetaDataDtoCopyWith<$Res> {
  factory _$$_ProductMetaDataDtoCopyWith(_$_ProductMetaDataDto value,
          $Res Function(_$_ProductMetaDataDto) then) =
      __$$_ProductMetaDataDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'orderCloudProduct', defaultValue: <ProductImagesDto>[])
          List<ProductImagesDto> productImages,
      @JsonKey(name: 'Items', defaultValue: <ProductItemDto>[])
          List<ProductItemDto> items});
}

/// @nodoc
class __$$_ProductMetaDataDtoCopyWithImpl<$Res>
    extends _$ProductMetaDataDtoCopyWithImpl<$Res, _$_ProductMetaDataDto>
    implements _$$_ProductMetaDataDtoCopyWith<$Res> {
  __$$_ProductMetaDataDtoCopyWithImpl(
      _$_ProductMetaDataDto _value, $Res Function(_$_ProductMetaDataDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productImages = null,
    Object? items = null,
  }) {
    return _then(_$_ProductMetaDataDto(
      productImages: null == productImages
          ? _value._productImages
          : productImages // ignore: cast_nullable_to_non_nullable
              as List<ProductImagesDto>,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ProductItemDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductMetaDataDto extends _ProductMetaDataDto {
  _$_ProductMetaDataDto(
      {@JsonKey(name: 'orderCloudProduct', defaultValue: <ProductImagesDto>[])
          required final List<ProductImagesDto> productImages,
      @JsonKey(name: 'Items', defaultValue: <ProductItemDto>[])
          required final List<ProductItemDto> items})
      : _productImages = productImages,
        _items = items,
        super._();

  factory _$_ProductMetaDataDto.fromJson(Map<String, dynamic> json) =>
      _$$_ProductMetaDataDtoFromJson(json);

  final List<ProductImagesDto> _productImages;
  @override
  @JsonKey(name: 'orderCloudProduct', defaultValue: <ProductImagesDto>[])
  List<ProductImagesDto> get productImages {
    if (_productImages is EqualUnmodifiableListView) return _productImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productImages);
  }

  final List<ProductItemDto> _items;
  @override
  @JsonKey(name: 'Items', defaultValue: <ProductItemDto>[])
  List<ProductItemDto> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'ProductMetaDataDto(productImages: $productImages, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductMetaDataDto &&
            const DeepCollectionEquality()
                .equals(other._productImages, _productImages) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_productImages),
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductMetaDataDtoCopyWith<_$_ProductMetaDataDto> get copyWith =>
      __$$_ProductMetaDataDtoCopyWithImpl<_$_ProductMetaDataDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductMetaDataDtoToJson(
      this,
    );
  }
}

abstract class _ProductMetaDataDto extends ProductMetaDataDto {
  factory _ProductMetaDataDto(
      {@JsonKey(name: 'orderCloudProduct', defaultValue: <ProductImagesDto>[])
          required final List<ProductImagesDto> productImages,
      @JsonKey(name: 'Items', defaultValue: <ProductItemDto>[])
          required final List<ProductItemDto> items}) = _$_ProductMetaDataDto;
  _ProductMetaDataDto._() : super._();

  factory _ProductMetaDataDto.fromJson(Map<String, dynamic> json) =
      _$_ProductMetaDataDto.fromJson;

  @override
  @JsonKey(name: 'orderCloudProduct', defaultValue: <ProductImagesDto>[])
  List<ProductImagesDto> get productImages;
  @override
  @JsonKey(name: 'Items', defaultValue: <ProductItemDto>[])
  List<ProductItemDto> get items;
  @override
  @JsonKey(ignore: true)
  _$$_ProductMetaDataDtoCopyWith<_$_ProductMetaDataDto> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductItemDto _$ProductItemDtoFromJson(Map<String, dynamic> json) {
  return _ProductItemDto.fromJson(json);
}

/// @nodoc
mixin _$ProductItemDto {
  @JsonKey(name: 'PromotionMaterial', defaultValue: '')
  String get promotionMaterial => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductItemDtoCopyWith<ProductItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductItemDtoCopyWith<$Res> {
  factory $ProductItemDtoCopyWith(
          ProductItemDto value, $Res Function(ProductItemDto) then) =
      _$ProductItemDtoCopyWithImpl<$Res, ProductItemDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'PromotionMaterial', defaultValue: '')
          String promotionMaterial});
}

/// @nodoc
class _$ProductItemDtoCopyWithImpl<$Res, $Val extends ProductItemDto>
    implements $ProductItemDtoCopyWith<$Res> {
  _$ProductItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promotionMaterial = null,
  }) {
    return _then(_value.copyWith(
      promotionMaterial: null == promotionMaterial
          ? _value.promotionMaterial
          : promotionMaterial // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductItemDtoCopyWith<$Res>
    implements $ProductItemDtoCopyWith<$Res> {
  factory _$$_ProductItemDtoCopyWith(
          _$_ProductItemDto value, $Res Function(_$_ProductItemDto) then) =
      __$$_ProductItemDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'PromotionMaterial', defaultValue: '')
          String promotionMaterial});
}

/// @nodoc
class __$$_ProductItemDtoCopyWithImpl<$Res>
    extends _$ProductItemDtoCopyWithImpl<$Res, _$_ProductItemDto>
    implements _$$_ProductItemDtoCopyWith<$Res> {
  __$$_ProductItemDtoCopyWithImpl(
      _$_ProductItemDto _value, $Res Function(_$_ProductItemDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promotionMaterial = null,
  }) {
    return _then(_$_ProductItemDto(
      promotionMaterial: null == promotionMaterial
          ? _value.promotionMaterial
          : promotionMaterial // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductItemDto extends _ProductItemDto {
  const _$_ProductItemDto(
      {@JsonKey(name: 'PromotionMaterial', defaultValue: '')
          required this.promotionMaterial})
      : super._();

  factory _$_ProductItemDto.fromJson(Map<String, dynamic> json) =>
      _$$_ProductItemDtoFromJson(json);

  @override
  @JsonKey(name: 'PromotionMaterial', defaultValue: '')
  final String promotionMaterial;

  @override
  String toString() {
    return 'ProductItemDto(promotionMaterial: $promotionMaterial)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductItemDto &&
            (identical(other.promotionMaterial, promotionMaterial) ||
                other.promotionMaterial == promotionMaterial));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, promotionMaterial);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductItemDtoCopyWith<_$_ProductItemDto> get copyWith =>
      __$$_ProductItemDtoCopyWithImpl<_$_ProductItemDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductItemDtoToJson(
      this,
    );
  }
}

abstract class _ProductItemDto extends ProductItemDto {
  const factory _ProductItemDto(
      {@JsonKey(name: 'PromotionMaterial', defaultValue: '')
          required final String promotionMaterial}) = _$_ProductItemDto;
  const _ProductItemDto._() : super._();

  factory _ProductItemDto.fromJson(Map<String, dynamic> json) =
      _$_ProductItemDto.fromJson;

  @override
  @JsonKey(name: 'PromotionMaterial', defaultValue: '')
  String get promotionMaterial;
  @override
  @JsonKey(ignore: true)
  _$$_ProductItemDtoCopyWith<_$_ProductItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

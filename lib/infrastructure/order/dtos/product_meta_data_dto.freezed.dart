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
  @JsonKey(name: 'XP')
  ProductItemXpDto get xp => throw _privateConstructorUsedError;

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
          String promotionMaterial,
      @JsonKey(name: 'XP')
          ProductItemXpDto xp});

  $ProductItemXpDtoCopyWith<$Res> get xp;
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
    Object? xp = null,
  }) {
    return _then(_value.copyWith(
      promotionMaterial: null == promotionMaterial
          ? _value.promotionMaterial
          : promotionMaterial // ignore: cast_nullable_to_non_nullable
              as String,
      xp: null == xp
          ? _value.xp
          : xp // ignore: cast_nullable_to_non_nullable
              as ProductItemXpDto,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductItemXpDtoCopyWith<$Res> get xp {
    return $ProductItemXpDtoCopyWith<$Res>(_value.xp, (value) {
      return _then(_value.copyWith(xp: value) as $Val);
    });
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
          String promotionMaterial,
      @JsonKey(name: 'XP')
          ProductItemXpDto xp});

  @override
  $ProductItemXpDtoCopyWith<$Res> get xp;
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
    Object? xp = null,
  }) {
    return _then(_$_ProductItemDto(
      promotionMaterial: null == promotionMaterial
          ? _value.promotionMaterial
          : promotionMaterial // ignore: cast_nullable_to_non_nullable
              as String,
      xp: null == xp
          ? _value.xp
          : xp // ignore: cast_nullable_to_non_nullable
              as ProductItemXpDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductItemDto extends _ProductItemDto {
  const _$_ProductItemDto(
      {@JsonKey(name: 'PromotionMaterial', defaultValue: '')
          required this.promotionMaterial,
      @JsonKey(name: 'XP')
          required this.xp})
      : super._();

  factory _$_ProductItemDto.fromJson(Map<String, dynamic> json) =>
      _$$_ProductItemDtoFromJson(json);

  @override
  @JsonKey(name: 'PromotionMaterial', defaultValue: '')
  final String promotionMaterial;
  @override
  @JsonKey(name: 'XP')
  final ProductItemXpDto xp;

  @override
  String toString() {
    return 'ProductItemDto(promotionMaterial: $promotionMaterial, xp: $xp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductItemDto &&
            (identical(other.promotionMaterial, promotionMaterial) ||
                other.promotionMaterial == promotionMaterial) &&
            (identical(other.xp, xp) || other.xp == xp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, promotionMaterial, xp);

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
          required final String promotionMaterial,
      @JsonKey(name: 'XP')
          required final ProductItemXpDto xp}) = _$_ProductItemDto;
  const _ProductItemDto._() : super._();

  factory _ProductItemDto.fromJson(Map<String, dynamic> json) =
      _$_ProductItemDto.fromJson;

  @override
  @JsonKey(name: 'PromotionMaterial', defaultValue: '')
  String get promotionMaterial;
  @override
  @JsonKey(name: 'XP')
  ProductItemXpDto get xp;
  @override
  @JsonKey(ignore: true)
  _$$_ProductItemDtoCopyWith<_$_ProductItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductItemXpDto _$ProductItemXpDtoFromJson(Map<String, dynamic> json) {
  return _ProductItemXpDto.fromJson(json);
}

/// @nodoc
mixin _$ProductItemXpDto {
  @JsonKey(name: 'Dosage', defaultValue: '')
  String get dosage => throw _privateConstructorUsedError;
  @JsonKey(name: 'HowToUse', defaultValue: '')
  String get howToUse => throw _privateConstructorUsedError;
  @JsonKey(name: 'Composition', defaultValue: '')
  String get composition => throw _privateConstructorUsedError;
  @JsonKey(name: 'DeliveryInstructions', defaultValue: '')
  String get deliveryInstructions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductItemXpDtoCopyWith<ProductItemXpDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductItemXpDtoCopyWith<$Res> {
  factory $ProductItemXpDtoCopyWith(
          ProductItemXpDto value, $Res Function(ProductItemXpDto) then) =
      _$ProductItemXpDtoCopyWithImpl<$Res, ProductItemXpDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Dosage', defaultValue: '')
          String dosage,
      @JsonKey(name: 'HowToUse', defaultValue: '')
          String howToUse,
      @JsonKey(name: 'Composition', defaultValue: '')
          String composition,
      @JsonKey(name: 'DeliveryInstructions', defaultValue: '')
          String deliveryInstructions});
}

/// @nodoc
class _$ProductItemXpDtoCopyWithImpl<$Res, $Val extends ProductItemXpDto>
    implements $ProductItemXpDtoCopyWith<$Res> {
  _$ProductItemXpDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dosage = null,
    Object? howToUse = null,
    Object? composition = null,
    Object? deliveryInstructions = null,
  }) {
    return _then(_value.copyWith(
      dosage: null == dosage
          ? _value.dosage
          : dosage // ignore: cast_nullable_to_non_nullable
              as String,
      howToUse: null == howToUse
          ? _value.howToUse
          : howToUse // ignore: cast_nullable_to_non_nullable
              as String,
      composition: null == composition
          ? _value.composition
          : composition // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryInstructions: null == deliveryInstructions
          ? _value.deliveryInstructions
          : deliveryInstructions // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductItemXpDtoCopyWith<$Res>
    implements $ProductItemXpDtoCopyWith<$Res> {
  factory _$$_ProductItemXpDtoCopyWith(
          _$_ProductItemXpDto value, $Res Function(_$_ProductItemXpDto) then) =
      __$$_ProductItemXpDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Dosage', defaultValue: '')
          String dosage,
      @JsonKey(name: 'HowToUse', defaultValue: '')
          String howToUse,
      @JsonKey(name: 'Composition', defaultValue: '')
          String composition,
      @JsonKey(name: 'DeliveryInstructions', defaultValue: '')
          String deliveryInstructions});
}

/// @nodoc
class __$$_ProductItemXpDtoCopyWithImpl<$Res>
    extends _$ProductItemXpDtoCopyWithImpl<$Res, _$_ProductItemXpDto>
    implements _$$_ProductItemXpDtoCopyWith<$Res> {
  __$$_ProductItemXpDtoCopyWithImpl(
      _$_ProductItemXpDto _value, $Res Function(_$_ProductItemXpDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dosage = null,
    Object? howToUse = null,
    Object? composition = null,
    Object? deliveryInstructions = null,
  }) {
    return _then(_$_ProductItemXpDto(
      dosage: null == dosage
          ? _value.dosage
          : dosage // ignore: cast_nullable_to_non_nullable
              as String,
      howToUse: null == howToUse
          ? _value.howToUse
          : howToUse // ignore: cast_nullable_to_non_nullable
              as String,
      composition: null == composition
          ? _value.composition
          : composition // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryInstructions: null == deliveryInstructions
          ? _value.deliveryInstructions
          : deliveryInstructions // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductItemXpDto extends _ProductItemXpDto {
  const _$_ProductItemXpDto(
      {@JsonKey(name: 'Dosage', defaultValue: '')
          required this.dosage,
      @JsonKey(name: 'HowToUse', defaultValue: '')
          required this.howToUse,
      @JsonKey(name: 'Composition', defaultValue: '')
          required this.composition,
      @JsonKey(name: 'DeliveryInstructions', defaultValue: '')
          required this.deliveryInstructions})
      : super._();

  factory _$_ProductItemXpDto.fromJson(Map<String, dynamic> json) =>
      _$$_ProductItemXpDtoFromJson(json);

  @override
  @JsonKey(name: 'Dosage', defaultValue: '')
  final String dosage;
  @override
  @JsonKey(name: 'HowToUse', defaultValue: '')
  final String howToUse;
  @override
  @JsonKey(name: 'Composition', defaultValue: '')
  final String composition;
  @override
  @JsonKey(name: 'DeliveryInstructions', defaultValue: '')
  final String deliveryInstructions;

  @override
  String toString() {
    return 'ProductItemXpDto(dosage: $dosage, howToUse: $howToUse, composition: $composition, deliveryInstructions: $deliveryInstructions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductItemXpDto &&
            (identical(other.dosage, dosage) || other.dosage == dosage) &&
            (identical(other.howToUse, howToUse) ||
                other.howToUse == howToUse) &&
            (identical(other.composition, composition) ||
                other.composition == composition) &&
            (identical(other.deliveryInstructions, deliveryInstructions) ||
                other.deliveryInstructions == deliveryInstructions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, dosage, howToUse, composition, deliveryInstructions);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductItemXpDtoCopyWith<_$_ProductItemXpDto> get copyWith =>
      __$$_ProductItemXpDtoCopyWithImpl<_$_ProductItemXpDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductItemXpDtoToJson(
      this,
    );
  }
}

abstract class _ProductItemXpDto extends ProductItemXpDto {
  const factory _ProductItemXpDto(
      {@JsonKey(name: 'Dosage', defaultValue: '')
          required final String dosage,
      @JsonKey(name: 'HowToUse', defaultValue: '')
          required final String howToUse,
      @JsonKey(name: 'Composition', defaultValue: '')
          required final String composition,
      @JsonKey(name: 'DeliveryInstructions', defaultValue: '')
          required final String deliveryInstructions}) = _$_ProductItemXpDto;
  const _ProductItemXpDto._() : super._();

  factory _ProductItemXpDto.fromJson(Map<String, dynamic> json) =
      _$_ProductItemXpDto.fromJson;

  @override
  @JsonKey(name: 'Dosage', defaultValue: '')
  String get dosage;
  @override
  @JsonKey(name: 'HowToUse', defaultValue: '')
  String get howToUse;
  @override
  @JsonKey(name: 'Composition', defaultValue: '')
  String get composition;
  @override
  @JsonKey(name: 'DeliveryInstructions', defaultValue: '')
  String get deliveryInstructions;
  @override
  @JsonKey(ignore: true)
  _$$_ProductItemXpDtoCopyWith<_$_ProductItemXpDto> get copyWith =>
      throw _privateConstructorUsedError;
}

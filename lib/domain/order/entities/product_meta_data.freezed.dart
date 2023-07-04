// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_meta_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductMetaData {
  List<ProductImages> get productImages => throw _privateConstructorUsedError;
  List<ProductItem> get items => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductMetaDataCopyWith<ProductMetaData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductMetaDataCopyWith<$Res> {
  factory $ProductMetaDataCopyWith(
          ProductMetaData value, $Res Function(ProductMetaData) then) =
      _$ProductMetaDataCopyWithImpl<$Res, ProductMetaData>;
  @useResult
  $Res call({List<ProductImages> productImages, List<ProductItem> items});
}

/// @nodoc
class _$ProductMetaDataCopyWithImpl<$Res, $Val extends ProductMetaData>
    implements $ProductMetaDataCopyWith<$Res> {
  _$ProductMetaDataCopyWithImpl(this._value, this._then);

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
              as List<ProductImages>,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ProductItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductMetaDataCopyWith<$Res>
    implements $ProductMetaDataCopyWith<$Res> {
  factory _$$_ProductMetaDataCopyWith(
          _$_ProductMetaData value, $Res Function(_$_ProductMetaData) then) =
      __$$_ProductMetaDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ProductImages> productImages, List<ProductItem> items});
}

/// @nodoc
class __$$_ProductMetaDataCopyWithImpl<$Res>
    extends _$ProductMetaDataCopyWithImpl<$Res, _$_ProductMetaData>
    implements _$$_ProductMetaDataCopyWith<$Res> {
  __$$_ProductMetaDataCopyWithImpl(
      _$_ProductMetaData _value, $Res Function(_$_ProductMetaData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productImages = null,
    Object? items = null,
  }) {
    return _then(_$_ProductMetaData(
      productImages: null == productImages
          ? _value._productImages
          : productImages // ignore: cast_nullable_to_non_nullable
              as List<ProductImages>,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ProductItem>,
    ));
  }
}

/// @nodoc

class _$_ProductMetaData extends _ProductMetaData {
  _$_ProductMetaData(
      {required final List<ProductImages> productImages,
      required final List<ProductItem> items})
      : _productImages = productImages,
        _items = items,
        super._();

  final List<ProductImages> _productImages;
  @override
  List<ProductImages> get productImages {
    if (_productImages is EqualUnmodifiableListView) return _productImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productImages);
  }

  final List<ProductItem> _items;
  @override
  List<ProductItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'ProductMetaData(productImages: $productImages, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductMetaData &&
            const DeepCollectionEquality()
                .equals(other._productImages, _productImages) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_productImages),
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductMetaDataCopyWith<_$_ProductMetaData> get copyWith =>
      __$$_ProductMetaDataCopyWithImpl<_$_ProductMetaData>(this, _$identity);
}

abstract class _ProductMetaData extends ProductMetaData {
  factory _ProductMetaData(
      {required final List<ProductImages> productImages,
      required final List<ProductItem> items}) = _$_ProductMetaData;
  _ProductMetaData._() : super._();

  @override
  List<ProductImages> get productImages;
  @override
  List<ProductItem> get items;
  @override
  @JsonKey(ignore: true)
  _$$_ProductMetaDataCopyWith<_$_ProductMetaData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProductItem {
  StringValue get promotionMaterial => throw _privateConstructorUsedError;
  bool get hidePrice => throw _privateConstructorUsedError;
  ProductItemXp get xp => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductItemCopyWith<ProductItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductItemCopyWith<$Res> {
  factory $ProductItemCopyWith(
          ProductItem value, $Res Function(ProductItem) then) =
      _$ProductItemCopyWithImpl<$Res, ProductItem>;
  @useResult
  $Res call({StringValue promotionMaterial, bool hidePrice, ProductItemXp xp});

  $ProductItemXpCopyWith<$Res> get xp;
}

/// @nodoc
class _$ProductItemCopyWithImpl<$Res, $Val extends ProductItem>
    implements $ProductItemCopyWith<$Res> {
  _$ProductItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promotionMaterial = null,
    Object? hidePrice = null,
    Object? xp = null,
  }) {
    return _then(_value.copyWith(
      promotionMaterial: null == promotionMaterial
          ? _value.promotionMaterial
          : promotionMaterial // ignore: cast_nullable_to_non_nullable
              as StringValue,
      hidePrice: null == hidePrice
          ? _value.hidePrice
          : hidePrice // ignore: cast_nullable_to_non_nullable
              as bool,
      xp: null == xp
          ? _value.xp
          : xp // ignore: cast_nullable_to_non_nullable
              as ProductItemXp,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductItemXpCopyWith<$Res> get xp {
    return $ProductItemXpCopyWith<$Res>(_value.xp, (value) {
      return _then(_value.copyWith(xp: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProductItemCopyWith<$Res>
    implements $ProductItemCopyWith<$Res> {
  factory _$$_ProductItemCopyWith(
          _$_ProductItem value, $Res Function(_$_ProductItem) then) =
      __$$_ProductItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({StringValue promotionMaterial, bool hidePrice, ProductItemXp xp});

  @override
  $ProductItemXpCopyWith<$Res> get xp;
}

/// @nodoc
class __$$_ProductItemCopyWithImpl<$Res>
    extends _$ProductItemCopyWithImpl<$Res, _$_ProductItem>
    implements _$$_ProductItemCopyWith<$Res> {
  __$$_ProductItemCopyWithImpl(
      _$_ProductItem _value, $Res Function(_$_ProductItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promotionMaterial = null,
    Object? hidePrice = null,
    Object? xp = null,
  }) {
    return _then(_$_ProductItem(
      promotionMaterial: null == promotionMaterial
          ? _value.promotionMaterial
          : promotionMaterial // ignore: cast_nullable_to_non_nullable
              as StringValue,
      hidePrice: null == hidePrice
          ? _value.hidePrice
          : hidePrice // ignore: cast_nullable_to_non_nullable
              as bool,
      xp: null == xp
          ? _value.xp
          : xp // ignore: cast_nullable_to_non_nullable
              as ProductItemXp,
    ));
  }
}

/// @nodoc

class _$_ProductItem extends _ProductItem {
  _$_ProductItem(
      {required this.promotionMaterial,
      required this.hidePrice,
      required this.xp})
      : super._();

  @override
  final StringValue promotionMaterial;
  @override
  final bool hidePrice;
  @override
  final ProductItemXp xp;

  @override
  String toString() {
    return 'ProductItem(promotionMaterial: $promotionMaterial, hidePrice: $hidePrice, xp: $xp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductItem &&
            (identical(other.promotionMaterial, promotionMaterial) ||
                other.promotionMaterial == promotionMaterial) &&
            (identical(other.hidePrice, hidePrice) ||
                other.hidePrice == hidePrice) &&
            (identical(other.xp, xp) || other.xp == xp));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, promotionMaterial, hidePrice, xp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductItemCopyWith<_$_ProductItem> get copyWith =>
      __$$_ProductItemCopyWithImpl<_$_ProductItem>(this, _$identity);
}

abstract class _ProductItem extends ProductItem {
  factory _ProductItem(
      {required final StringValue promotionMaterial,
      required final bool hidePrice,
      required final ProductItemXp xp}) = _$_ProductItem;
  _ProductItem._() : super._();

  @override
  StringValue get promotionMaterial;
  @override
  bool get hidePrice;
  @override
  ProductItemXp get xp;
  @override
  @JsonKey(ignore: true)
  _$$_ProductItemCopyWith<_$_ProductItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProductItemXp {
  String get dosage => throw _privateConstructorUsedError;
  String get howToUse => throw _privateConstructorUsedError;
  String get composition => throw _privateConstructorUsedError;
  String get deliveryInstructions => throw _privateConstructorUsedError;
  String get usability => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductItemXpCopyWith<ProductItemXp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductItemXpCopyWith<$Res> {
  factory $ProductItemXpCopyWith(
          ProductItemXp value, $Res Function(ProductItemXp) then) =
      _$ProductItemXpCopyWithImpl<$Res, ProductItemXp>;
  @useResult
  $Res call(
      {String dosage,
      String howToUse,
      String composition,
      String deliveryInstructions,
      String usability});
}

/// @nodoc
class _$ProductItemXpCopyWithImpl<$Res, $Val extends ProductItemXp>
    implements $ProductItemXpCopyWith<$Res> {
  _$ProductItemXpCopyWithImpl(this._value, this._then);

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
    Object? usability = null,
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
      usability: null == usability
          ? _value.usability
          : usability // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductItemXpCopyWith<$Res>
    implements $ProductItemXpCopyWith<$Res> {
  factory _$$_ProductItemXpCopyWith(
          _$_ProductItemXp value, $Res Function(_$_ProductItemXp) then) =
      __$$_ProductItemXpCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String dosage,
      String howToUse,
      String composition,
      String deliveryInstructions,
      String usability});
}

/// @nodoc
class __$$_ProductItemXpCopyWithImpl<$Res>
    extends _$ProductItemXpCopyWithImpl<$Res, _$_ProductItemXp>
    implements _$$_ProductItemXpCopyWith<$Res> {
  __$$_ProductItemXpCopyWithImpl(
      _$_ProductItemXp _value, $Res Function(_$_ProductItemXp) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dosage = null,
    Object? howToUse = null,
    Object? composition = null,
    Object? deliveryInstructions = null,
    Object? usability = null,
  }) {
    return _then(_$_ProductItemXp(
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
      usability: null == usability
          ? _value.usability
          : usability // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ProductItemXp extends _ProductItemXp {
  _$_ProductItemXp(
      {required this.dosage,
      required this.howToUse,
      required this.composition,
      required this.deliveryInstructions,
      required this.usability})
      : super._();

  @override
  final String dosage;
  @override
  final String howToUse;
  @override
  final String composition;
  @override
  final String deliveryInstructions;
  @override
  final String usability;

  @override
  String toString() {
    return 'ProductItemXp(dosage: $dosage, howToUse: $howToUse, composition: $composition, deliveryInstructions: $deliveryInstructions, usability: $usability)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductItemXp &&
            (identical(other.dosage, dosage) || other.dosage == dosage) &&
            (identical(other.howToUse, howToUse) ||
                other.howToUse == howToUse) &&
            (identical(other.composition, composition) ||
                other.composition == composition) &&
            (identical(other.deliveryInstructions, deliveryInstructions) ||
                other.deliveryInstructions == deliveryInstructions) &&
            (identical(other.usability, usability) ||
                other.usability == usability));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dosage, howToUse, composition,
      deliveryInstructions, usability);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductItemXpCopyWith<_$_ProductItemXp> get copyWith =>
      __$$_ProductItemXpCopyWithImpl<_$_ProductItemXp>(this, _$identity);
}

abstract class _ProductItemXp extends ProductItemXp {
  factory _ProductItemXp(
      {required final String dosage,
      required final String howToUse,
      required final String composition,
      required final String deliveryInstructions,
      required final String usability}) = _$_ProductItemXp;
  _ProductItemXp._() : super._();

  @override
  String get dosage;
  @override
  String get howToUse;
  @override
  String get composition;
  @override
  String get deliveryInstructions;
  @override
  String get usability;
  @override
  @JsonKey(ignore: true)
  _$$_ProductItemXpCopyWith<_$_ProductItemXp> get copyWith =>
      throw _privateConstructorUsedError;
}

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
  $Res call({StringValue promotionMaterial});
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
  }) {
    return _then(_value.copyWith(
      promotionMaterial: null == promotionMaterial
          ? _value.promotionMaterial
          : promotionMaterial // ignore: cast_nullable_to_non_nullable
              as StringValue,
    ) as $Val);
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
  $Res call({StringValue promotionMaterial});
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
  }) {
    return _then(_$_ProductItem(
      promotionMaterial: null == promotionMaterial
          ? _value.promotionMaterial
          : promotionMaterial // ignore: cast_nullable_to_non_nullable
              as StringValue,
    ));
  }
}

/// @nodoc

class _$_ProductItem extends _ProductItem {
  _$_ProductItem({required this.promotionMaterial}) : super._();

  @override
  final StringValue promotionMaterial;

  @override
  String toString() {
    return 'ProductItem(promotionMaterial: $promotionMaterial)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductItem &&
            (identical(other.promotionMaterial, promotionMaterial) ||
                other.promotionMaterial == promotionMaterial));
  }

  @override
  int get hashCode => Object.hash(runtimeType, promotionMaterial);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductItemCopyWith<_$_ProductItem> get copyWith =>
      __$$_ProductItemCopyWithImpl<_$_ProductItem>(this, _$identity);
}

abstract class _ProductItem extends ProductItem {
  factory _ProductItem({required final StringValue promotionMaterial}) =
      _$_ProductItem;
  _ProductItem._() : super._();

  @override
  StringValue get promotionMaterial;
  @override
  @JsonKey(ignore: true)
  _$$_ProductItemCopyWith<_$_ProductItem> get copyWith =>
      throw _privateConstructorUsedError;
}

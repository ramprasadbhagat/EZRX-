// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_addition_info_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CartAdditionInfoProduct {
  List<ProductImages> get productImages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CartAdditionInfoProductCopyWith<CartAdditionInfoProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartAdditionInfoProductCopyWith<$Res> {
  factory $CartAdditionInfoProductCopyWith(CartAdditionInfoProduct value,
          $Res Function(CartAdditionInfoProduct) then) =
      _$CartAdditionInfoProductCopyWithImpl<$Res, CartAdditionInfoProduct>;
  @useResult
  $Res call({List<ProductImages> productImages});
}

/// @nodoc
class _$CartAdditionInfoProductCopyWithImpl<$Res,
        $Val extends CartAdditionInfoProduct>
    implements $CartAdditionInfoProductCopyWith<$Res> {
  _$CartAdditionInfoProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productImages = null,
  }) {
    return _then(_value.copyWith(
      productImages: null == productImages
          ? _value.productImages
          : productImages // ignore: cast_nullable_to_non_nullable
              as List<ProductImages>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CartAdditionInfoProductCopyWith<$Res>
    implements $CartAdditionInfoProductCopyWith<$Res> {
  factory _$$_CartAdditionInfoProductCopyWith(_$_CartAdditionInfoProduct value,
          $Res Function(_$_CartAdditionInfoProduct) then) =
      __$$_CartAdditionInfoProductCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ProductImages> productImages});
}

/// @nodoc
class __$$_CartAdditionInfoProductCopyWithImpl<$Res>
    extends _$CartAdditionInfoProductCopyWithImpl<$Res,
        _$_CartAdditionInfoProduct>
    implements _$$_CartAdditionInfoProductCopyWith<$Res> {
  __$$_CartAdditionInfoProductCopyWithImpl(_$_CartAdditionInfoProduct _value,
      $Res Function(_$_CartAdditionInfoProduct) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productImages = null,
  }) {
    return _then(_$_CartAdditionInfoProduct(
      productImages: null == productImages
          ? _value._productImages
          : productImages // ignore: cast_nullable_to_non_nullable
              as List<ProductImages>,
    ));
  }
}

/// @nodoc

class _$_CartAdditionInfoProduct extends _CartAdditionInfoProduct {
  const _$_CartAdditionInfoProduct(
      {required final List<ProductImages> productImages})
      : _productImages = productImages,
        super._();

  final List<ProductImages> _productImages;
  @override
  List<ProductImages> get productImages {
    if (_productImages is EqualUnmodifiableListView) return _productImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productImages);
  }

  @override
  String toString() {
    return 'CartAdditionInfoProduct(productImages: $productImages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CartAdditionInfoProduct &&
            const DeepCollectionEquality()
                .equals(other._productImages, _productImages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_productImages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CartAdditionInfoProductCopyWith<_$_CartAdditionInfoProduct>
      get copyWith =>
          __$$_CartAdditionInfoProductCopyWithImpl<_$_CartAdditionInfoProduct>(
              this, _$identity);
}

abstract class _CartAdditionInfoProduct extends CartAdditionInfoProduct {
  const factory _CartAdditionInfoProduct(
          {required final List<ProductImages> productImages}) =
      _$_CartAdditionInfoProduct;
  const _CartAdditionInfoProduct._() : super._();

  @override
  List<ProductImages> get productImages;
  @override
  @JsonKey(ignore: true)
  _$$_CartAdditionInfoProductCopyWith<_$_CartAdditionInfoProduct>
      get copyWith => throw _privateConstructorUsedError;
}

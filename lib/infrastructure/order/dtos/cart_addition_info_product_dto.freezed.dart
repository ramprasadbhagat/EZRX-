// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_addition_info_product_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CartAdditionInfoProductDto _$CartAdditionInfoProductDtoFromJson(
    Map<String, dynamic> json) {
  return _CartAdditionInfoProductDto.fromJson(json);
}

/// @nodoc
mixin _$CartAdditionInfoProductDto {
  @JsonKey(name: 'orderCloudProduct')
  List<ProductImagesDto> get productImages =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartAdditionInfoProductDtoCopyWith<CartAdditionInfoProductDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartAdditionInfoProductDtoCopyWith<$Res> {
  factory $CartAdditionInfoProductDtoCopyWith(CartAdditionInfoProductDto value,
          $Res Function(CartAdditionInfoProductDto) then) =
      _$CartAdditionInfoProductDtoCopyWithImpl<$Res,
          CartAdditionInfoProductDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'orderCloudProduct')
          List<ProductImagesDto> productImages});
}

/// @nodoc
class _$CartAdditionInfoProductDtoCopyWithImpl<$Res,
        $Val extends CartAdditionInfoProductDto>
    implements $CartAdditionInfoProductDtoCopyWith<$Res> {
  _$CartAdditionInfoProductDtoCopyWithImpl(this._value, this._then);

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
              as List<ProductImagesDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CartAdditionInfoProductDtoCopyWith<$Res>
    implements $CartAdditionInfoProductDtoCopyWith<$Res> {
  factory _$$_CartAdditionInfoProductDtoCopyWith(
          _$_CartAdditionInfoProductDto value,
          $Res Function(_$_CartAdditionInfoProductDto) then) =
      __$$_CartAdditionInfoProductDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'orderCloudProduct')
          List<ProductImagesDto> productImages});
}

/// @nodoc
class __$$_CartAdditionInfoProductDtoCopyWithImpl<$Res>
    extends _$CartAdditionInfoProductDtoCopyWithImpl<$Res,
        _$_CartAdditionInfoProductDto>
    implements _$$_CartAdditionInfoProductDtoCopyWith<$Res> {
  __$$_CartAdditionInfoProductDtoCopyWithImpl(
      _$_CartAdditionInfoProductDto _value,
      $Res Function(_$_CartAdditionInfoProductDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productImages = null,
  }) {
    return _then(_$_CartAdditionInfoProductDto(
      productImages: null == productImages
          ? _value._productImages
          : productImages // ignore: cast_nullable_to_non_nullable
              as List<ProductImagesDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CartAdditionInfoProductDto extends _CartAdditionInfoProductDto {
  const _$_CartAdditionInfoProductDto(
      {@JsonKey(name: 'orderCloudProduct')
          required final List<ProductImagesDto> productImages})
      : _productImages = productImages,
        super._();

  factory _$_CartAdditionInfoProductDto.fromJson(Map<String, dynamic> json) =>
      _$$_CartAdditionInfoProductDtoFromJson(json);

  final List<ProductImagesDto> _productImages;
  @override
  @JsonKey(name: 'orderCloudProduct')
  List<ProductImagesDto> get productImages {
    if (_productImages is EqualUnmodifiableListView) return _productImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productImages);
  }

  @override
  String toString() {
    return 'CartAdditionInfoProductDto(productImages: $productImages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CartAdditionInfoProductDto &&
            const DeepCollectionEquality()
                .equals(other._productImages, _productImages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_productImages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CartAdditionInfoProductDtoCopyWith<_$_CartAdditionInfoProductDto>
      get copyWith => __$$_CartAdditionInfoProductDtoCopyWithImpl<
          _$_CartAdditionInfoProductDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CartAdditionInfoProductDtoToJson(
      this,
    );
  }
}

abstract class _CartAdditionInfoProductDto extends CartAdditionInfoProductDto {
  const factory _CartAdditionInfoProductDto(
          {@JsonKey(name: 'orderCloudProduct')
              required final List<ProductImagesDto> productImages}) =
      _$_CartAdditionInfoProductDto;
  const _CartAdditionInfoProductDto._() : super._();

  factory _CartAdditionInfoProductDto.fromJson(Map<String, dynamic> json) =
      _$_CartAdditionInfoProductDto.fromJson;

  @override
  @JsonKey(name: 'orderCloudProduct')
  List<ProductImagesDto> get productImages;
  @override
  @JsonKey(ignore: true)
  _$$_CartAdditionInfoProductDtoCopyWith<_$_CartAdditionInfoProductDto>
      get copyWith => throw _privateConstructorUsedError;
}

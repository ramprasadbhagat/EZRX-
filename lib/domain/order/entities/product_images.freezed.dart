// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_images.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductImages {
  MaterialNumber get materialID => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get image => throw _privateConstructorUsedError;
  String get thumbNail => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductImagesCopyWith<ProductImages> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductImagesCopyWith<$Res> {
  factory $ProductImagesCopyWith(
          ProductImages value, $Res Function(ProductImages) then) =
      _$ProductImagesCopyWithImpl<$Res, ProductImages>;
  @useResult
  $Res call(
      {MaterialNumber materialID,
      String name,
      String description,
      List<String> image,
      String thumbNail});
}

/// @nodoc
class _$ProductImagesCopyWithImpl<$Res, $Val extends ProductImages>
    implements $ProductImagesCopyWith<$Res> {
  _$ProductImagesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialID = null,
    Object? name = null,
    Object? description = null,
    Object? image = null,
    Object? thumbNail = null,
  }) {
    return _then(_value.copyWith(
      materialID: null == materialID
          ? _value.materialID
          : materialID // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as List<String>,
      thumbNail: null == thumbNail
          ? _value.thumbNail
          : thumbNail // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductImagesCopyWith<$Res>
    implements $ProductImagesCopyWith<$Res> {
  factory _$$_ProductImagesCopyWith(
          _$_ProductImages value, $Res Function(_$_ProductImages) then) =
      __$$_ProductImagesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MaterialNumber materialID,
      String name,
      String description,
      List<String> image,
      String thumbNail});
}

/// @nodoc
class __$$_ProductImagesCopyWithImpl<$Res>
    extends _$ProductImagesCopyWithImpl<$Res, _$_ProductImages>
    implements _$$_ProductImagesCopyWith<$Res> {
  __$$_ProductImagesCopyWithImpl(
      _$_ProductImages _value, $Res Function(_$_ProductImages) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialID = null,
    Object? name = null,
    Object? description = null,
    Object? image = null,
    Object? thumbNail = null,
  }) {
    return _then(_$_ProductImages(
      materialID: null == materialID
          ? _value.materialID
          : materialID // ignore: cast_nullable_to_non_nullable
              as MaterialNumber,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value._image
          : image // ignore: cast_nullable_to_non_nullable
              as List<String>,
      thumbNail: null == thumbNail
          ? _value.thumbNail
          : thumbNail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ProductImages extends _ProductImages {
  const _$_ProductImages(
      {required this.materialID,
      required this.name,
      required this.description,
      required final List<String> image,
      required this.thumbNail})
      : _image = image,
        super._();

  @override
  final MaterialNumber materialID;
  @override
  final String name;
  @override
  final String description;
  final List<String> _image;
  @override
  List<String> get image {
    if (_image is EqualUnmodifiableListView) return _image;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_image);
  }

  @override
  final String thumbNail;

  @override
  String toString() {
    return 'ProductImages(materialID: $materialID, name: $name, description: $description, image: $image, thumbNail: $thumbNail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductImages &&
            (identical(other.materialID, materialID) ||
                other.materialID == materialID) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._image, _image) &&
            (identical(other.thumbNail, thumbNail) ||
                other.thumbNail == thumbNail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, materialID, name, description,
      const DeepCollectionEquality().hash(_image), thumbNail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductImagesCopyWith<_$_ProductImages> get copyWith =>
      __$$_ProductImagesCopyWithImpl<_$_ProductImages>(this, _$identity);
}

abstract class _ProductImages extends ProductImages {
  const factory _ProductImages(
      {required final MaterialNumber materialID,
      required final String name,
      required final String description,
      required final List<String> image,
      required final String thumbNail}) = _$_ProductImages;
  const _ProductImages._() : super._();

  @override
  MaterialNumber get materialID;
  @override
  String get name;
  @override
  String get description;
  @override
  List<String> get image;
  @override
  String get thumbNail;
  @override
  @JsonKey(ignore: true)
  _$$_ProductImagesCopyWith<_$_ProductImages> get copyWith =>
      throw _privateConstructorUsedError;
}

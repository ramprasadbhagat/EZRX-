// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_price_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MaterialPriceDetail {
  Price get price => throw _privateConstructorUsedError;
  MaterialInfo get info => throw _privateConstructorUsedError;
  bool get isValidMaterial => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MaterialPriceDetailCopyWith<MaterialPriceDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialPriceDetailCopyWith<$Res> {
  factory $MaterialPriceDetailCopyWith(
          MaterialPriceDetail value, $Res Function(MaterialPriceDetail) then) =
      _$MaterialPriceDetailCopyWithImpl<$Res, MaterialPriceDetail>;
  @useResult
  $Res call({Price price, MaterialInfo info, bool isValidMaterial});

  $PriceCopyWith<$Res> get price;
  $MaterialInfoCopyWith<$Res> get info;
}

/// @nodoc
class _$MaterialPriceDetailCopyWithImpl<$Res, $Val extends MaterialPriceDetail>
    implements $MaterialPriceDetailCopyWith<$Res> {
  _$MaterialPriceDetailCopyWithImpl(this._value, this._then);

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
              as Price,
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as MaterialInfo,
      isValidMaterial: null == isValidMaterial
          ? _value.isValidMaterial
          : isValidMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceCopyWith<$Res> get price {
    return $PriceCopyWith<$Res>(_value.price, (value) {
      return _then(_value.copyWith(price: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialInfoCopyWith<$Res> get info {
    return $MaterialInfoCopyWith<$Res>(_value.info, (value) {
      return _then(_value.copyWith(info: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MaterialPriceDetailCopyWith<$Res>
    implements $MaterialPriceDetailCopyWith<$Res> {
  factory _$$_MaterialPriceDetailCopyWith(_$_MaterialPriceDetail value,
          $Res Function(_$_MaterialPriceDetail) then) =
      __$$_MaterialPriceDetailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Price price, MaterialInfo info, bool isValidMaterial});

  @override
  $PriceCopyWith<$Res> get price;
  @override
  $MaterialInfoCopyWith<$Res> get info;
}

/// @nodoc
class __$$_MaterialPriceDetailCopyWithImpl<$Res>
    extends _$MaterialPriceDetailCopyWithImpl<$Res, _$_MaterialPriceDetail>
    implements _$$_MaterialPriceDetailCopyWith<$Res> {
  __$$_MaterialPriceDetailCopyWithImpl(_$_MaterialPriceDetail _value,
      $Res Function(_$_MaterialPriceDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
    Object? info = null,
    Object? isValidMaterial = null,
  }) {
    return _then(_$_MaterialPriceDetail(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as Price,
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as MaterialInfo,
      isValidMaterial: null == isValidMaterial
          ? _value.isValidMaterial
          : isValidMaterial // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_MaterialPriceDetail extends _MaterialPriceDetail {
  const _$_MaterialPriceDetail(
      {required this.price, required this.info, required this.isValidMaterial})
      : super._();

  @override
  final Price price;
  @override
  final MaterialInfo info;
  @override
  final bool isValidMaterial;

  @override
  String toString() {
    return 'MaterialPriceDetail(price: $price, info: $info, isValidMaterial: $isValidMaterial)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MaterialPriceDetail &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.info, info) || other.info == info) &&
            (identical(other.isValidMaterial, isValidMaterial) ||
                other.isValidMaterial == isValidMaterial));
  }

  @override
  int get hashCode => Object.hash(runtimeType, price, info, isValidMaterial);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MaterialPriceDetailCopyWith<_$_MaterialPriceDetail> get copyWith =>
      __$$_MaterialPriceDetailCopyWithImpl<_$_MaterialPriceDetail>(
          this, _$identity);
}

abstract class _MaterialPriceDetail extends MaterialPriceDetail {
  const factory _MaterialPriceDetail(
      {required final Price price,
      required final MaterialInfo info,
      required final bool isValidMaterial}) = _$_MaterialPriceDetail;
  const _MaterialPriceDetail._() : super._();

  @override
  Price get price;
  @override
  MaterialInfo get info;
  @override
  bool get isValidMaterial;
  @override
  @JsonKey(ignore: true)
  _$$_MaterialPriceDetailCopyWith<_$_MaterialPriceDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

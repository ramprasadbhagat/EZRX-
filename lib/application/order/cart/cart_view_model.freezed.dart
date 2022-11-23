// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cart_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CartItem {
  List<PriceAggregate> get materials => throw _privateConstructorUsedError;
  CartItemType get itemType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CartItemCopyWith<CartItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemCopyWith<$Res> {
  factory $CartItemCopyWith(CartItem value, $Res Function(CartItem) then) =
      _$CartItemCopyWithImpl<$Res, CartItem>;
  @useResult
  $Res call({List<PriceAggregate> materials, CartItemType itemType});
}

/// @nodoc
class _$CartItemCopyWithImpl<$Res, $Val extends CartItem>
    implements $CartItemCopyWith<$Res> {
  _$CartItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materials = null,
    Object? itemType = null,
  }) {
    return _then(_value.copyWith(
      materials: null == materials
          ? _value.materials
          : materials // ignore: cast_nullable_to_non_nullable
              as List<PriceAggregate>,
      itemType: null == itemType
          ? _value.itemType
          : itemType // ignore: cast_nullable_to_non_nullable
              as CartItemType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CartItemCopyWith<$Res> implements $CartItemCopyWith<$Res> {
  factory _$$_CartItemCopyWith(
          _$_CartItem value, $Res Function(_$_CartItem) then) =
      __$$_CartItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PriceAggregate> materials, CartItemType itemType});
}

/// @nodoc
class __$$_CartItemCopyWithImpl<$Res>
    extends _$CartItemCopyWithImpl<$Res, _$_CartItem>
    implements _$$_CartItemCopyWith<$Res> {
  __$$_CartItemCopyWithImpl(
      _$_CartItem _value, $Res Function(_$_CartItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materials = null,
    Object? itemType = null,
  }) {
    return _then(_$_CartItem(
      materials: null == materials
          ? _value._materials
          : materials // ignore: cast_nullable_to_non_nullable
              as List<PriceAggregate>,
      itemType: null == itemType
          ? _value.itemType
          : itemType // ignore: cast_nullable_to_non_nullable
              as CartItemType,
    ));
  }
}

/// @nodoc

class _$_CartItem extends _CartItem {
  const _$_CartItem(
      {required final List<PriceAggregate> materials, required this.itemType})
      : _materials = materials,
        super._();

  final List<PriceAggregate> _materials;
  @override
  List<PriceAggregate> get materials {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_materials);
  }

  @override
  final CartItemType itemType;

  @override
  String toString() {
    return 'CartItem(materials: $materials, itemType: $itemType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CartItem &&
            const DeepCollectionEquality()
                .equals(other._materials, _materials) &&
            (identical(other.itemType, itemType) ||
                other.itemType == itemType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_materials), itemType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CartItemCopyWith<_$_CartItem> get copyWith =>
      __$$_CartItemCopyWithImpl<_$_CartItem>(this, _$identity);
}

abstract class _CartItem extends CartItem {
  const factory _CartItem(
      {required final List<PriceAggregate> materials,
      required final CartItemType itemType}) = _$_CartItem;
  const _CartItem._() : super._();

  @override
  List<PriceAggregate> get materials;
  @override
  CartItemType get itemType;
  @override
  @JsonKey(ignore: true)
  _$$_CartItemCopyWith<_$_CartItem> get copyWith =>
      throw _privateConstructorUsedError;
}

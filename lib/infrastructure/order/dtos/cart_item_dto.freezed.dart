// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cart_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CartItemDto {
  @JsonKey(name: 'materials')
  @HiveField(0, defaultValue: [])
  List<PriceAggregateDto> get materials => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  @HiveField(1, defaultValue: CartItemType.material)
  CartItemType get itemType => throw _privateConstructorUsedError;
  @JsonKey(name: 'isSelected')
  @HiveField(2, defaultValue: true)
  bool get isSelected => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CartItemDtoCopyWith<CartItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemDtoCopyWith<$Res> {
  factory $CartItemDtoCopyWith(
          CartItemDto value, $Res Function(CartItemDto) then) =
      _$CartItemDtoCopyWithImpl<$Res, CartItemDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'materials')
      @HiveField(0, defaultValue: [])
          List<PriceAggregateDto> materials,
      @JsonKey(name: 'type')
      @HiveField(1, defaultValue: CartItemType.material)
          CartItemType itemType,
      @JsonKey(name: 'isSelected')
      @HiveField(2, defaultValue: true)
          bool isSelected});
}

/// @nodoc
class _$CartItemDtoCopyWithImpl<$Res, $Val extends CartItemDto>
    implements $CartItemDtoCopyWith<$Res> {
  _$CartItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materials = null,
    Object? itemType = null,
    Object? isSelected = null,
  }) {
    return _then(_value.copyWith(
      materials: null == materials
          ? _value.materials
          : materials // ignore: cast_nullable_to_non_nullable
              as List<PriceAggregateDto>,
      itemType: null == itemType
          ? _value.itemType
          : itemType // ignore: cast_nullable_to_non_nullable
              as CartItemType,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CartItemDtoCopyWith<$Res>
    implements $CartItemDtoCopyWith<$Res> {
  factory _$$_CartItemDtoCopyWith(
          _$_CartItemDto value, $Res Function(_$_CartItemDto) then) =
      __$$_CartItemDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'materials')
      @HiveField(0, defaultValue: [])
          List<PriceAggregateDto> materials,
      @JsonKey(name: 'type')
      @HiveField(1, defaultValue: CartItemType.material)
          CartItemType itemType,
      @JsonKey(name: 'isSelected')
      @HiveField(2, defaultValue: true)
          bool isSelected});
}

/// @nodoc
class __$$_CartItemDtoCopyWithImpl<$Res>
    extends _$CartItemDtoCopyWithImpl<$Res, _$_CartItemDto>
    implements _$$_CartItemDtoCopyWith<$Res> {
  __$$_CartItemDtoCopyWithImpl(
      _$_CartItemDto _value, $Res Function(_$_CartItemDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materials = null,
    Object? itemType = null,
    Object? isSelected = null,
  }) {
    return _then(_$_CartItemDto(
      materials: null == materials
          ? _value._materials
          : materials // ignore: cast_nullable_to_non_nullable
              as List<PriceAggregateDto>,
      itemType: null == itemType
          ? _value.itemType
          : itemType // ignore: cast_nullable_to_non_nullable
              as CartItemType,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 21, adapterName: 'CartItemDtoAdapter')
class _$_CartItemDto extends _CartItemDto {
  const _$_CartItemDto(
      {@JsonKey(name: 'materials')
      @HiveField(0, defaultValue: [])
          required final List<PriceAggregateDto> materials,
      @JsonKey(name: 'type')
      @HiveField(1, defaultValue: CartItemType.material)
          required this.itemType,
      @JsonKey(name: 'isSelected')
      @HiveField(2, defaultValue: true)
          required this.isSelected})
      : _materials = materials,
        super._();

  final List<PriceAggregateDto> _materials;
  @override
  @JsonKey(name: 'materials')
  @HiveField(0, defaultValue: [])
  List<PriceAggregateDto> get materials {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_materials);
  }

  @override
  @JsonKey(name: 'type')
  @HiveField(1, defaultValue: CartItemType.material)
  final CartItemType itemType;
  @override
  @JsonKey(name: 'isSelected')
  @HiveField(2, defaultValue: true)
  final bool isSelected;

  @override
  String toString() {
    return 'CartItemDto(materials: $materials, itemType: $itemType, isSelected: $isSelected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CartItemDto &&
            const DeepCollectionEquality()
                .equals(other._materials, _materials) &&
            (identical(other.itemType, itemType) ||
                other.itemType == itemType) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_materials), itemType, isSelected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CartItemDtoCopyWith<_$_CartItemDto> get copyWith =>
      __$$_CartItemDtoCopyWithImpl<_$_CartItemDto>(this, _$identity);
}

abstract class _CartItemDto extends CartItemDto {
  const factory _CartItemDto(
      {@JsonKey(name: 'materials')
      @HiveField(0, defaultValue: [])
          required final List<PriceAggregateDto> materials,
      @JsonKey(name: 'type')
      @HiveField(1, defaultValue: CartItemType.material)
          required final CartItemType itemType,
      @JsonKey(name: 'isSelected')
      @HiveField(2, defaultValue: true)
          required final bool isSelected}) = _$_CartItemDto;
  const _CartItemDto._() : super._();

  @override
  @JsonKey(name: 'materials')
  @HiveField(0, defaultValue: [])
  List<PriceAggregateDto> get materials;
  @override
  @JsonKey(name: 'type')
  @HiveField(1, defaultValue: CartItemType.material)
  CartItemType get itemType;
  @override
  @JsonKey(name: 'isSelected')
  @HiveField(2, defaultValue: true)
  bool get isSelected;
  @override
  @JsonKey(ignore: true)
  _$$_CartItemDtoCopyWith<_$_CartItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

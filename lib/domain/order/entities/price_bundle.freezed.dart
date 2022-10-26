// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'price_bundle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PriceBundle {
  String get name => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  List<PriceBundleItem> get information => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PriceBundleCopyWith<PriceBundle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceBundleCopyWith<$Res> {
  factory $PriceBundleCopyWith(
          PriceBundle value, $Res Function(PriceBundle) then) =
      _$PriceBundleCopyWithImpl<$Res>;
  $Res call({String name, String code, List<PriceBundleItem> information});
}

/// @nodoc
class _$PriceBundleCopyWithImpl<$Res> implements $PriceBundleCopyWith<$Res> {
  _$PriceBundleCopyWithImpl(this._value, this._then);

  final PriceBundle _value;
  // ignore: unused_field
  final $Res Function(PriceBundle) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? code = freezed,
    Object? information = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      information: information == freezed
          ? _value.information
          : information // ignore: cast_nullable_to_non_nullable
              as List<PriceBundleItem>,
    ));
  }
}

/// @nodoc
abstract class _$$_PriceBundleCopyWith<$Res>
    implements $PriceBundleCopyWith<$Res> {
  factory _$$_PriceBundleCopyWith(
          _$_PriceBundle value, $Res Function(_$_PriceBundle) then) =
      __$$_PriceBundleCopyWithImpl<$Res>;
  @override
  $Res call({String name, String code, List<PriceBundleItem> information});
}

/// @nodoc
class __$$_PriceBundleCopyWithImpl<$Res> extends _$PriceBundleCopyWithImpl<$Res>
    implements _$$_PriceBundleCopyWith<$Res> {
  __$$_PriceBundleCopyWithImpl(
      _$_PriceBundle _value, $Res Function(_$_PriceBundle) _then)
      : super(_value, (v) => _then(v as _$_PriceBundle));

  @override
  _$_PriceBundle get _value => super._value as _$_PriceBundle;

  @override
  $Res call({
    Object? name = freezed,
    Object? code = freezed,
    Object? information = freezed,
  }) {
    return _then(_$_PriceBundle(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      information: information == freezed
          ? _value._information
          : information // ignore: cast_nullable_to_non_nullable
              as List<PriceBundleItem>,
    ));
  }
}

/// @nodoc

class _$_PriceBundle extends _PriceBundle {
  const _$_PriceBundle(
      {required this.name,
      required this.code,
      required final List<PriceBundleItem> information})
      : _information = information,
        super._();

  @override
  final String name;
  @override
  final String code;
  final List<PriceBundleItem> _information;
  @override
  List<PriceBundleItem> get information {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_information);
  }

  @override
  String toString() {
    return 'PriceBundle(name: $name, code: $code, information: $information)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PriceBundle &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality()
                .equals(other._information, _information));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(_information));

  @JsonKey(ignore: true)
  @override
  _$$_PriceBundleCopyWith<_$_PriceBundle> get copyWith =>
      __$$_PriceBundleCopyWithImpl<_$_PriceBundle>(this, _$identity);
}

abstract class _PriceBundle extends PriceBundle {
  const factory _PriceBundle(
      {required final String name,
      required final String code,
      required final List<PriceBundleItem> information}) = _$_PriceBundle;
  const _PriceBundle._() : super._();

  @override
  String get name;
  @override
  String get code;
  @override
  List<PriceBundleItem> get information;
  @override
  @JsonKey(ignore: true)
  _$$_PriceBundleCopyWith<_$_PriceBundle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PriceBundleItem {
  String get type => throw _privateConstructorUsedError;
  int get sequence => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double get rate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PriceBundleItemCopyWith<PriceBundleItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceBundleItemCopyWith<$Res> {
  factory $PriceBundleItemCopyWith(
          PriceBundleItem value, $Res Function(PriceBundleItem) then) =
      _$PriceBundleItemCopyWithImpl<$Res>;
  $Res call({String type, int sequence, int quantity, double rate});
}

/// @nodoc
class _$PriceBundleItemCopyWithImpl<$Res>
    implements $PriceBundleItemCopyWith<$Res> {
  _$PriceBundleItemCopyWithImpl(this._value, this._then);

  final PriceBundleItem _value;
  // ignore: unused_field
  final $Res Function(PriceBundleItem) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? sequence = freezed,
    Object? quantity = freezed,
    Object? rate = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      sequence: sequence == freezed
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      rate: rate == freezed
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$_PriceBundleItemCopyWith<$Res>
    implements $PriceBundleItemCopyWith<$Res> {
  factory _$$_PriceBundleItemCopyWith(
          _$_PriceBundleItem value, $Res Function(_$_PriceBundleItem) then) =
      __$$_PriceBundleItemCopyWithImpl<$Res>;
  @override
  $Res call({String type, int sequence, int quantity, double rate});
}

/// @nodoc
class __$$_PriceBundleItemCopyWithImpl<$Res>
    extends _$PriceBundleItemCopyWithImpl<$Res>
    implements _$$_PriceBundleItemCopyWith<$Res> {
  __$$_PriceBundleItemCopyWithImpl(
      _$_PriceBundleItem _value, $Res Function(_$_PriceBundleItem) _then)
      : super(_value, (v) => _then(v as _$_PriceBundleItem));

  @override
  _$_PriceBundleItem get _value => super._value as _$_PriceBundleItem;

  @override
  $Res call({
    Object? type = freezed,
    Object? sequence = freezed,
    Object? quantity = freezed,
    Object? rate = freezed,
  }) {
    return _then(_$_PriceBundleItem(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      sequence: sequence == freezed
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      rate: rate == freezed
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_PriceBundleItem extends _PriceBundleItem {
  const _$_PriceBundleItem(
      {required this.type,
      required this.sequence,
      required this.quantity,
      required this.rate})
      : super._();

  @override
  final String type;
  @override
  final int sequence;
  @override
  final int quantity;
  @override
  final double rate;

  @override
  String toString() {
    return 'PriceBundleItem(type: $type, sequence: $sequence, quantity: $quantity, rate: $rate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PriceBundleItem &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.sequence, sequence) &&
            const DeepCollectionEquality().equals(other.quantity, quantity) &&
            const DeepCollectionEquality().equals(other.rate, rate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(sequence),
      const DeepCollectionEquality().hash(quantity),
      const DeepCollectionEquality().hash(rate));

  @JsonKey(ignore: true)
  @override
  _$$_PriceBundleItemCopyWith<_$_PriceBundleItem> get copyWith =>
      __$$_PriceBundleItemCopyWithImpl<_$_PriceBundleItem>(this, _$identity);
}

abstract class _PriceBundleItem extends PriceBundleItem {
  const factory _PriceBundleItem(
      {required final String type,
      required final int sequence,
      required final int quantity,
      required final double rate}) = _$_PriceBundleItem;
  const _PriceBundleItem._() : super._();

  @override
  String get type;
  @override
  int get sequence;
  @override
  int get quantity;
  @override
  double get rate;
  @override
  @JsonKey(ignore: true)
  _$$_PriceBundleItemCopyWith<_$_PriceBundleItem> get copyWith =>
      throw _privateConstructorUsedError;
}

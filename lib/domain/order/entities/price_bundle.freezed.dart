// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
      _$PriceBundleCopyWithImpl<$Res, PriceBundle>;
  @useResult
  $Res call({String name, String code, List<PriceBundleItem> information});
}

/// @nodoc
class _$PriceBundleCopyWithImpl<$Res, $Val extends PriceBundle>
    implements $PriceBundleCopyWith<$Res> {
  _$PriceBundleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
    Object? information = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      information: null == information
          ? _value.information
          : information // ignore: cast_nullable_to_non_nullable
              as List<PriceBundleItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PriceBundleCopyWith<$Res>
    implements $PriceBundleCopyWith<$Res> {
  factory _$$_PriceBundleCopyWith(
          _$_PriceBundle value, $Res Function(_$_PriceBundle) then) =
      __$$_PriceBundleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String code, List<PriceBundleItem> information});
}

/// @nodoc
class __$$_PriceBundleCopyWithImpl<$Res>
    extends _$PriceBundleCopyWithImpl<$Res, _$_PriceBundle>
    implements _$$_PriceBundleCopyWith<$Res> {
  __$$_PriceBundleCopyWithImpl(
      _$_PriceBundle _value, $Res Function(_$_PriceBundle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
    Object? information = null,
  }) {
    return _then(_$_PriceBundle(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      information: null == information
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
    if (_information is EqualUnmodifiableListView) return _information;
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
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality()
                .equals(other._information, _information));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, code,
      const DeepCollectionEquality().hash(_information));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
      _$PriceBundleItemCopyWithImpl<$Res, PriceBundleItem>;
  @useResult
  $Res call({String type, int sequence, int quantity, double rate});
}

/// @nodoc
class _$PriceBundleItemCopyWithImpl<$Res, $Val extends PriceBundleItem>
    implements $PriceBundleItemCopyWith<$Res> {
  _$PriceBundleItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? sequence = null,
    Object? quantity = null,
    Object? rate = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      sequence: null == sequence
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PriceBundleItemCopyWith<$Res>
    implements $PriceBundleItemCopyWith<$Res> {
  factory _$$_PriceBundleItemCopyWith(
          _$_PriceBundleItem value, $Res Function(_$_PriceBundleItem) then) =
      __$$_PriceBundleItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, int sequence, int quantity, double rate});
}

/// @nodoc
class __$$_PriceBundleItemCopyWithImpl<$Res>
    extends _$PriceBundleItemCopyWithImpl<$Res, _$_PriceBundleItem>
    implements _$$_PriceBundleItemCopyWith<$Res> {
  __$$_PriceBundleItemCopyWithImpl(
      _$_PriceBundleItem _value, $Res Function(_$_PriceBundleItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? sequence = null,
    Object? quantity = null,
    Object? rate = null,
  }) {
    return _then(_$_PriceBundleItem(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      sequence: null == sequence
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      rate: null == rate
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
            (identical(other.type, type) || other.type == type) &&
            (identical(other.sequence, sequence) ||
                other.sequence == sequence) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.rate, rate) || other.rate == rate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, sequence, quantity, rate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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

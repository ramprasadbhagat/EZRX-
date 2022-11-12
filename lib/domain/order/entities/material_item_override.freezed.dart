// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'material_item_override.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MaterialItemOverride {
  String get reference => throw _privateConstructorUsedError;
  List<ValueOverride> get valueOverride => throw _privateConstructorUsedError;
  dynamic get percentageOverride => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MaterialItemOverrideCopyWith<MaterialItemOverride> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialItemOverrideCopyWith<$Res> {
  factory $MaterialItemOverrideCopyWith(MaterialItemOverride value,
          $Res Function(MaterialItemOverride) then) =
      _$MaterialItemOverrideCopyWithImpl<$Res, MaterialItemOverride>;
  @useResult
  $Res call(
      {String reference,
      List<ValueOverride> valueOverride,
      dynamic percentageOverride});
}

/// @nodoc
class _$MaterialItemOverrideCopyWithImpl<$Res,
        $Val extends MaterialItemOverride>
    implements $MaterialItemOverrideCopyWith<$Res> {
  _$MaterialItemOverrideCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reference = null,
    Object? valueOverride = null,
    Object? percentageOverride = null,
  }) {
    return _then(_value.copyWith(
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      valueOverride: null == valueOverride
          ? _value.valueOverride
          : valueOverride // ignore: cast_nullable_to_non_nullable
              as List<ValueOverride>,
      percentageOverride: null == percentageOverride
          ? _value.percentageOverride
          : percentageOverride // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MaterialItemOverrideCopyWith<$Res>
    implements $MaterialItemOverrideCopyWith<$Res> {
  factory _$$_MaterialItemOverrideCopyWith(_$_MaterialItemOverride value,
          $Res Function(_$_MaterialItemOverride) then) =
      __$$_MaterialItemOverrideCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String reference,
      List<ValueOverride> valueOverride,
      dynamic percentageOverride});
}

/// @nodoc
class __$$_MaterialItemOverrideCopyWithImpl<$Res>
    extends _$MaterialItemOverrideCopyWithImpl<$Res, _$_MaterialItemOverride>
    implements _$$_MaterialItemOverrideCopyWith<$Res> {
  __$$_MaterialItemOverrideCopyWithImpl(_$_MaterialItemOverride _value,
      $Res Function(_$_MaterialItemOverride) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reference = null,
    Object? valueOverride = null,
    Object? percentageOverride = null,
  }) {
    return _then(_$_MaterialItemOverride(
      reference: null == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String,
      valueOverride: null == valueOverride
          ? _value._valueOverride
          : valueOverride // ignore: cast_nullable_to_non_nullable
              as List<ValueOverride>,
      percentageOverride: null == percentageOverride
          ? _value.percentageOverride
          : percentageOverride // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$_MaterialItemOverride extends _MaterialItemOverride {
  const _$_MaterialItemOverride(
      {required this.reference,
      required final List<ValueOverride> valueOverride,
      required this.percentageOverride})
      : _valueOverride = valueOverride,
        super._();

  @override
  final String reference;
  final List<ValueOverride> _valueOverride;
  @override
  List<ValueOverride> get valueOverride {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_valueOverride);
  }

  @override
  final dynamic percentageOverride;

  @override
  String toString() {
    return 'MaterialItemOverride(reference: $reference, valueOverride: $valueOverride, percentageOverride: $percentageOverride)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MaterialItemOverride &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            const DeepCollectionEquality()
                .equals(other._valueOverride, _valueOverride) &&
            const DeepCollectionEquality()
                .equals(other.percentageOverride, percentageOverride));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      reference,
      const DeepCollectionEquality().hash(_valueOverride),
      const DeepCollectionEquality().hash(percentageOverride));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MaterialItemOverrideCopyWith<_$_MaterialItemOverride> get copyWith =>
      __$$_MaterialItemOverrideCopyWithImpl<_$_MaterialItemOverride>(
          this, _$identity);
}

abstract class _MaterialItemOverride extends MaterialItemOverride {
  const factory _MaterialItemOverride(
      {required final String reference,
      required final List<ValueOverride> valueOverride,
      required final dynamic percentageOverride}) = _$_MaterialItemOverride;
  const _MaterialItemOverride._() : super._();

  @override
  String get reference;
  @override
  List<ValueOverride> get valueOverride;
  @override
  dynamic get percentageOverride;
  @override
  @JsonKey(ignore: true)
  _$$_MaterialItemOverrideCopyWith<_$_MaterialItemOverride> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ValueOverride {
  String get code => throw _privateConstructorUsedError;
  dynamic get price => throw _privateConstructorUsedError;
  Currency get currency => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ValueOverrideCopyWith<ValueOverride> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValueOverrideCopyWith<$Res> {
  factory $ValueOverrideCopyWith(
          ValueOverride value, $Res Function(ValueOverride) then) =
      _$ValueOverrideCopyWithImpl<$Res, ValueOverride>;
  @useResult
  $Res call({String code, dynamic price, Currency currency});
}

/// @nodoc
class _$ValueOverrideCopyWithImpl<$Res, $Val extends ValueOverride>
    implements $ValueOverrideCopyWith<$Res> {
  _$ValueOverrideCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? price = null,
    Object? currency = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as dynamic,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ValueOverrideCopyWith<$Res>
    implements $ValueOverrideCopyWith<$Res> {
  factory _$$_ValueOverrideCopyWith(
          _$_ValueOverride value, $Res Function(_$_ValueOverride) then) =
      __$$_ValueOverrideCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, dynamic price, Currency currency});
}

/// @nodoc
class __$$_ValueOverrideCopyWithImpl<$Res>
    extends _$ValueOverrideCopyWithImpl<$Res, _$_ValueOverride>
    implements _$$_ValueOverrideCopyWith<$Res> {
  __$$_ValueOverrideCopyWithImpl(
      _$_ValueOverride _value, $Res Function(_$_ValueOverride) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? price = null,
    Object? currency = null,
  }) {
    return _then(_$_ValueOverride(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as dynamic,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
    ));
  }
}

/// @nodoc

class _$_ValueOverride implements _ValueOverride {
  const _$_ValueOverride(
      {required this.code, required this.price, required this.currency});

  @override
  final String code;
  @override
  final dynamic price;
  @override
  final Currency currency;

  @override
  String toString() {
    return 'ValueOverride(code: $code, price: $price, currency: $currency)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ValueOverride &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, code, const DeepCollectionEquality().hash(price), currency);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ValueOverrideCopyWith<_$_ValueOverride> get copyWith =>
      __$$_ValueOverrideCopyWithImpl<_$_ValueOverride>(this, _$identity);
}

abstract class _ValueOverride implements ValueOverride {
  const factory _ValueOverride(
      {required final String code,
      required final dynamic price,
      required final Currency currency}) = _$_ValueOverride;

  @override
  String get code;
  @override
  dynamic get price;
  @override
  Currency get currency;
  @override
  @JsonKey(ignore: true)
  _$$_ValueOverrideCopyWith<_$_ValueOverride> get copyWith =>
      throw _privateConstructorUsedError;
}

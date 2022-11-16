// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bundle_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BundleInfo {
  int get sequence => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  MaterialBundleType get type => throw _privateConstructorUsedError;
  double get rate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BundleInfoCopyWith<BundleInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BundleInfoCopyWith<$Res> {
  factory $BundleInfoCopyWith(
          BundleInfo value, $Res Function(BundleInfo) then) =
      _$BundleInfoCopyWithImpl<$Res>;
  $Res call({int sequence, int quantity, MaterialBundleType type, double rate});
}

/// @nodoc
class _$BundleInfoCopyWithImpl<$Res> implements $BundleInfoCopyWith<$Res> {
  _$BundleInfoCopyWithImpl(this._value, this._then);

  final BundleInfo _value;
  // ignore: unused_field
  final $Res Function(BundleInfo) _then;

  @override
  $Res call({
    Object? sequence = freezed,
    Object? quantity = freezed,
    Object? type = freezed,
    Object? rate = freezed,
  }) {
    return _then(_value.copyWith(
      sequence: sequence == freezed
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MaterialBundleType,
      rate: rate == freezed
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$_BundleInfoCopyWith<$Res>
    implements $BundleInfoCopyWith<$Res> {
  factory _$$_BundleInfoCopyWith(
          _$_BundleInfo value, $Res Function(_$_BundleInfo) then) =
      __$$_BundleInfoCopyWithImpl<$Res>;
  @override
  $Res call({int sequence, int quantity, MaterialBundleType type, double rate});
}

/// @nodoc
class __$$_BundleInfoCopyWithImpl<$Res> extends _$BundleInfoCopyWithImpl<$Res>
    implements _$$_BundleInfoCopyWith<$Res> {
  __$$_BundleInfoCopyWithImpl(
      _$_BundleInfo _value, $Res Function(_$_BundleInfo) _then)
      : super(_value, (v) => _then(v as _$_BundleInfo));

  @override
  _$_BundleInfo get _value => super._value as _$_BundleInfo;

  @override
  $Res call({
    Object? sequence = freezed,
    Object? quantity = freezed,
    Object? type = freezed,
    Object? rate = freezed,
  }) {
    return _then(_$_BundleInfo(
      sequence: sequence == freezed
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MaterialBundleType,
      rate: rate == freezed
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_BundleInfo extends _BundleInfo {
  const _$_BundleInfo(
      {required this.sequence,
      required this.quantity,
      required this.type,
      required this.rate})
      : super._();

  @override
  final int sequence;
  @override
  final int quantity;
  @override
  final MaterialBundleType type;
  @override
  final double rate;

  @override
  String toString() {
    return 'BundleInfo(sequence: $sequence, quantity: $quantity, type: $type, rate: $rate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BundleInfo &&
            const DeepCollectionEquality().equals(other.sequence, sequence) &&
            const DeepCollectionEquality().equals(other.quantity, quantity) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.rate, rate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(sequence),
      const DeepCollectionEquality().hash(quantity),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(rate));

  @JsonKey(ignore: true)
  @override
  _$$_BundleInfoCopyWith<_$_BundleInfo> get copyWith =>
      __$$_BundleInfoCopyWithImpl<_$_BundleInfo>(this, _$identity);
}

abstract class _BundleInfo extends BundleInfo {
  const factory _BundleInfo(
      {required final int sequence,
      required final int quantity,
      required final MaterialBundleType type,
      required final double rate}) = _$_BundleInfo;
  const _BundleInfo._() : super._();

  @override
  int get sequence;
  @override
  int get quantity;
  @override
  MaterialBundleType get type;
  @override
  double get rate;
  @override
  @JsonKey(ignore: true)
  _$$_BundleInfoCopyWith<_$_BundleInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

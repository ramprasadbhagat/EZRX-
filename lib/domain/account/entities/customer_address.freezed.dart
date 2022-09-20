// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'customer_address.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CustomerAddress {
  String get street1 => throw _privateConstructorUsedError;
  String get street2 => throw _privateConstructorUsedError;
  String get street3 => throw _privateConstructorUsedError;
  String get street4 => throw _privateConstructorUsedError;
  String get street5 => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomerAddressCopyWith<CustomerAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerAddressCopyWith<$Res> {
  factory $CustomerAddressCopyWith(
          CustomerAddress value, $Res Function(CustomerAddress) then) =
      _$CustomerAddressCopyWithImpl<$Res>;
  $Res call(
      {String street1,
      String street2,
      String street3,
      String street4,
      String street5});
}

/// @nodoc
class _$CustomerAddressCopyWithImpl<$Res>
    implements $CustomerAddressCopyWith<$Res> {
  _$CustomerAddressCopyWithImpl(this._value, this._then);

  final CustomerAddress _value;
  // ignore: unused_field
  final $Res Function(CustomerAddress) _then;

  @override
  $Res call({
    Object? street1 = freezed,
    Object? street2 = freezed,
    Object? street3 = freezed,
    Object? street4 = freezed,
    Object? street5 = freezed,
  }) {
    return _then(_value.copyWith(
      street1: street1 == freezed
          ? _value.street1
          : street1 // ignore: cast_nullable_to_non_nullable
              as String,
      street2: street2 == freezed
          ? _value.street2
          : street2 // ignore: cast_nullable_to_non_nullable
              as String,
      street3: street3 == freezed
          ? _value.street3
          : street3 // ignore: cast_nullable_to_non_nullable
              as String,
      street4: street4 == freezed
          ? _value.street4
          : street4 // ignore: cast_nullable_to_non_nullable
              as String,
      street5: street5 == freezed
          ? _value.street5
          : street5 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_CustomerAddressCopyWith<$Res>
    implements $CustomerAddressCopyWith<$Res> {
  factory _$$_CustomerAddressCopyWith(
          _$_CustomerAddress value, $Res Function(_$_CustomerAddress) then) =
      __$$_CustomerAddressCopyWithImpl<$Res>;
  @override
  $Res call(
      {String street1,
      String street2,
      String street3,
      String street4,
      String street5});
}

/// @nodoc
class __$$_CustomerAddressCopyWithImpl<$Res>
    extends _$CustomerAddressCopyWithImpl<$Res>
    implements _$$_CustomerAddressCopyWith<$Res> {
  __$$_CustomerAddressCopyWithImpl(
      _$_CustomerAddress _value, $Res Function(_$_CustomerAddress) _then)
      : super(_value, (v) => _then(v as _$_CustomerAddress));

  @override
  _$_CustomerAddress get _value => super._value as _$_CustomerAddress;

  @override
  $Res call({
    Object? street1 = freezed,
    Object? street2 = freezed,
    Object? street3 = freezed,
    Object? street4 = freezed,
    Object? street5 = freezed,
  }) {
    return _then(_$_CustomerAddress(
      street1: street1 == freezed
          ? _value.street1
          : street1 // ignore: cast_nullable_to_non_nullable
              as String,
      street2: street2 == freezed
          ? _value.street2
          : street2 // ignore: cast_nullable_to_non_nullable
              as String,
      street3: street3 == freezed
          ? _value.street3
          : street3 // ignore: cast_nullable_to_non_nullable
              as String,
      street4: street4 == freezed
          ? _value.street4
          : street4 // ignore: cast_nullable_to_non_nullable
              as String,
      street5: street5 == freezed
          ? _value.street5
          : street5 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CustomerAddress extends _CustomerAddress {
  const _$_CustomerAddress(
      {required this.street1,
      required this.street2,
      required this.street3,
      required this.street4,
      required this.street5})
      : super._();

  @override
  final String street1;
  @override
  final String street2;
  @override
  final String street3;
  @override
  final String street4;
  @override
  final String street5;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomerAddress &&
            const DeepCollectionEquality().equals(other.street1, street1) &&
            const DeepCollectionEquality().equals(other.street2, street2) &&
            const DeepCollectionEquality().equals(other.street3, street3) &&
            const DeepCollectionEquality().equals(other.street4, street4) &&
            const DeepCollectionEquality().equals(other.street5, street5));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(street1),
      const DeepCollectionEquality().hash(street2),
      const DeepCollectionEquality().hash(street3),
      const DeepCollectionEquality().hash(street4),
      const DeepCollectionEquality().hash(street5));

  @JsonKey(ignore: true)
  @override
  _$$_CustomerAddressCopyWith<_$_CustomerAddress> get copyWith =>
      __$$_CustomerAddressCopyWithImpl<_$_CustomerAddress>(this, _$identity);
}

abstract class _CustomerAddress extends CustomerAddress {
  const factory _CustomerAddress(
      {required final String street1,
      required final String street2,
      required final String street3,
      required final String street4,
      required final String street5}) = _$_CustomerAddress;
  const _CustomerAddress._() : super._();

  @override
  String get street1;
  @override
  String get street2;
  @override
  String get street3;
  @override
  String get street4;
  @override
  String get street5;
  @override
  @JsonKey(ignore: true)
  _$$_CustomerAddressCopyWith<_$_CustomerAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

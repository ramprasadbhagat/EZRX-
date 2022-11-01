// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'account_selector.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AccountSelector {
  String get salesOrg => throw _privateConstructorUsedError;
  String get customerCode => throw _privateConstructorUsedError;
  String get shippingAddress => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccountSelectorCopyWith<AccountSelector> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountSelectorCopyWith<$Res> {
  factory $AccountSelectorCopyWith(
          AccountSelector value, $Res Function(AccountSelector) then) =
      _$AccountSelectorCopyWithImpl<$Res>;
  $Res call({String salesOrg, String customerCode, String shippingAddress});
}

/// @nodoc
class _$AccountSelectorCopyWithImpl<$Res>
    implements $AccountSelectorCopyWith<$Res> {
  _$AccountSelectorCopyWithImpl(this._value, this._then);

  final AccountSelector _value;
  // ignore: unused_field
  final $Res Function(AccountSelector) _then;

  @override
  $Res call({
    Object? salesOrg = freezed,
    Object? customerCode = freezed,
    Object? shippingAddress = freezed,
  }) {
    return _then(_value.copyWith(
      salesOrg: salesOrg == freezed
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as String,
      customerCode: customerCode == freezed
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String,
      shippingAddress: shippingAddress == freezed
          ? _value.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_AccountSelectorCopyWith<$Res>
    implements $AccountSelectorCopyWith<$Res> {
  factory _$$_AccountSelectorCopyWith(
          _$_AccountSelector value, $Res Function(_$_AccountSelector) then) =
      __$$_AccountSelectorCopyWithImpl<$Res>;
  @override
  $Res call({String salesOrg, String customerCode, String shippingAddress});
}

/// @nodoc
class __$$_AccountSelectorCopyWithImpl<$Res>
    extends _$AccountSelectorCopyWithImpl<$Res>
    implements _$$_AccountSelectorCopyWith<$Res> {
  __$$_AccountSelectorCopyWithImpl(
      _$_AccountSelector _value, $Res Function(_$_AccountSelector) _then)
      : super(_value, (v) => _then(v as _$_AccountSelector));

  @override
  _$_AccountSelector get _value => super._value as _$_AccountSelector;

  @override
  $Res call({
    Object? salesOrg = freezed,
    Object? customerCode = freezed,
    Object? shippingAddress = freezed,
  }) {
    return _then(_$_AccountSelector(
      salesOrg: salesOrg == freezed
          ? _value.salesOrg
          : salesOrg // ignore: cast_nullable_to_non_nullable
              as String,
      customerCode: customerCode == freezed
          ? _value.customerCode
          : customerCode // ignore: cast_nullable_to_non_nullable
              as String,
      shippingAddress: shippingAddress == freezed
          ? _value.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AccountSelector extends _AccountSelector {
  const _$_AccountSelector(
      {required this.salesOrg,
      required this.customerCode,
      required this.shippingAddress})
      : super._();

  @override
  final String salesOrg;
  @override
  final String customerCode;
  @override
  final String shippingAddress;

  @override
  String toString() {
    return 'AccountSelector(salesOrg: $salesOrg, customerCode: $customerCode, shippingAddress: $shippingAddress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountSelector &&
            const DeepCollectionEquality().equals(other.salesOrg, salesOrg) &&
            const DeepCollectionEquality()
                .equals(other.customerCode, customerCode) &&
            const DeepCollectionEquality()
                .equals(other.shippingAddress, shippingAddress));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(salesOrg),
      const DeepCollectionEquality().hash(customerCode),
      const DeepCollectionEquality().hash(shippingAddress));

  @JsonKey(ignore: true)
  @override
  _$$_AccountSelectorCopyWith<_$_AccountSelector> get copyWith =>
      __$$_AccountSelectorCopyWithImpl<_$_AccountSelector>(this, _$identity);
}

abstract class _AccountSelector extends AccountSelector {
  const factory _AccountSelector(
      {required final String salesOrg,
      required final String customerCode,
      required final String shippingAddress}) = _$_AccountSelector;
  const _AccountSelector._() : super._();

  @override
  String get salesOrg;
  @override
  String get customerCode;
  @override
  String get shippingAddress;
  @override
  @JsonKey(ignore: true)
  _$$_AccountSelectorCopyWith<_$_AccountSelector> get copyWith =>
      throw _privateConstructorUsedError;
}

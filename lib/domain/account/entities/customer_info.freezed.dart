// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'customer_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CustomerInfo {
  String get customerCodeSoldTo => throw _privateConstructorUsedError;
  List<ShipToInfo> get shipToInfos => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomerInfoCopyWith<CustomerInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerInfoCopyWith<$Res> {
  factory $CustomerInfoCopyWith(
          CustomerInfo value, $Res Function(CustomerInfo) then) =
      _$CustomerInfoCopyWithImpl<$Res>;
  $Res call({String customerCodeSoldTo, List<ShipToInfo> shipToInfos});
}

/// @nodoc
class _$CustomerInfoCopyWithImpl<$Res> implements $CustomerInfoCopyWith<$Res> {
  _$CustomerInfoCopyWithImpl(this._value, this._then);

  final CustomerInfo _value;
  // ignore: unused_field
  final $Res Function(CustomerInfo) _then;

  @override
  $Res call({
    Object? customerCodeSoldTo = freezed,
    Object? shipToInfos = freezed,
  }) {
    return _then(_value.copyWith(
      customerCodeSoldTo: customerCodeSoldTo == freezed
          ? _value.customerCodeSoldTo
          : customerCodeSoldTo // ignore: cast_nullable_to_non_nullable
              as String,
      shipToInfos: shipToInfos == freezed
          ? _value.shipToInfos
          : shipToInfos // ignore: cast_nullable_to_non_nullable
              as List<ShipToInfo>,
    ));
  }
}

/// @nodoc
abstract class _$$_CustomerInfoCopyWith<$Res>
    implements $CustomerInfoCopyWith<$Res> {
  factory _$$_CustomerInfoCopyWith(
          _$_CustomerInfo value, $Res Function(_$_CustomerInfo) then) =
      __$$_CustomerInfoCopyWithImpl<$Res>;
  @override
  $Res call({String customerCodeSoldTo, List<ShipToInfo> shipToInfos});
}

/// @nodoc
class __$$_CustomerInfoCopyWithImpl<$Res>
    extends _$CustomerInfoCopyWithImpl<$Res>
    implements _$$_CustomerInfoCopyWith<$Res> {
  __$$_CustomerInfoCopyWithImpl(
      _$_CustomerInfo _value, $Res Function(_$_CustomerInfo) _then)
      : super(_value, (v) => _then(v as _$_CustomerInfo));

  @override
  _$_CustomerInfo get _value => super._value as _$_CustomerInfo;

  @override
  $Res call({
    Object? customerCodeSoldTo = freezed,
    Object? shipToInfos = freezed,
  }) {
    return _then(_$_CustomerInfo(
      customerCodeSoldTo: customerCodeSoldTo == freezed
          ? _value.customerCodeSoldTo
          : customerCodeSoldTo // ignore: cast_nullable_to_non_nullable
              as String,
      shipToInfos: shipToInfos == freezed
          ? _value._shipToInfos
          : shipToInfos // ignore: cast_nullable_to_non_nullable
              as List<ShipToInfo>,
    ));
  }
}

/// @nodoc

class _$_CustomerInfo extends _CustomerInfo {
  const _$_CustomerInfo(
      {required this.customerCodeSoldTo,
      required final List<ShipToInfo> shipToInfos})
      : _shipToInfos = shipToInfos,
        super._();

  @override
  final String customerCodeSoldTo;
  final List<ShipToInfo> _shipToInfos;
  @override
  List<ShipToInfo> get shipToInfos {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shipToInfos);
  }

  @override
  String toString() {
    return 'CustomerInfo(customerCodeSoldTo: $customerCodeSoldTo, shipToInfos: $shipToInfos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomerInfo &&
            const DeepCollectionEquality()
                .equals(other.customerCodeSoldTo, customerCodeSoldTo) &&
            const DeepCollectionEquality()
                .equals(other._shipToInfos, _shipToInfos));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(customerCodeSoldTo),
      const DeepCollectionEquality().hash(_shipToInfos));

  @JsonKey(ignore: true)
  @override
  _$$_CustomerInfoCopyWith<_$_CustomerInfo> get copyWith =>
      __$$_CustomerInfoCopyWithImpl<_$_CustomerInfo>(this, _$identity);
}

abstract class _CustomerInfo extends CustomerInfo {
  const factory _CustomerInfo(
      {required final String customerCodeSoldTo,
      required final List<ShipToInfo> shipToInfos}) = _$_CustomerInfo;
  const _CustomerInfo._() : super._();

  @override
  String get customerCodeSoldTo;
  @override
  List<ShipToInfo> get shipToInfos;
  @override
  @JsonKey(ignore: true)
  _$$_CustomerInfoCopyWith<_$_CustomerInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

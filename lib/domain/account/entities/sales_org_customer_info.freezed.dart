// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_org_customer_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SalesOrgCustomerInfo {
  CustomerCode get customerCodeSoldTo => throw _privateConstructorUsedError;
  List<SalesOrgShipToInfo> get shipToInfos =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SalesOrgCustomerInfoCopyWith<SalesOrgCustomerInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesOrgCustomerInfoCopyWith<$Res> {
  factory $SalesOrgCustomerInfoCopyWith(SalesOrgCustomerInfo value,
          $Res Function(SalesOrgCustomerInfo) then) =
      _$SalesOrgCustomerInfoCopyWithImpl<$Res, SalesOrgCustomerInfo>;
  @useResult
  $Res call(
      {CustomerCode customerCodeSoldTo, List<SalesOrgShipToInfo> shipToInfos});
}

/// @nodoc
class _$SalesOrgCustomerInfoCopyWithImpl<$Res,
        $Val extends SalesOrgCustomerInfo>
    implements $SalesOrgCustomerInfoCopyWith<$Res> {
  _$SalesOrgCustomerInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCodeSoldTo = null,
    Object? shipToInfos = null,
  }) {
    return _then(_value.copyWith(
      customerCodeSoldTo: null == customerCodeSoldTo
          ? _value.customerCodeSoldTo
          : customerCodeSoldTo // ignore: cast_nullable_to_non_nullable
              as CustomerCode,
      shipToInfos: null == shipToInfos
          ? _value.shipToInfos
          : shipToInfos // ignore: cast_nullable_to_non_nullable
              as List<SalesOrgShipToInfo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SalesOrgCustomerInfoCopyWith<$Res>
    implements $SalesOrgCustomerInfoCopyWith<$Res> {
  factory _$$_SalesOrgCustomerInfoCopyWith(_$_SalesOrgCustomerInfo value,
          $Res Function(_$_SalesOrgCustomerInfo) then) =
      __$$_SalesOrgCustomerInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CustomerCode customerCodeSoldTo, List<SalesOrgShipToInfo> shipToInfos});
}

/// @nodoc
class __$$_SalesOrgCustomerInfoCopyWithImpl<$Res>
    extends _$SalesOrgCustomerInfoCopyWithImpl<$Res, _$_SalesOrgCustomerInfo>
    implements _$$_SalesOrgCustomerInfoCopyWith<$Res> {
  __$$_SalesOrgCustomerInfoCopyWithImpl(_$_SalesOrgCustomerInfo _value,
      $Res Function(_$_SalesOrgCustomerInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCodeSoldTo = null,
    Object? shipToInfos = null,
  }) {
    return _then(_$_SalesOrgCustomerInfo(
      customerCodeSoldTo: null == customerCodeSoldTo
          ? _value.customerCodeSoldTo
          : customerCodeSoldTo // ignore: cast_nullable_to_non_nullable
              as CustomerCode,
      shipToInfos: null == shipToInfos
          ? _value._shipToInfos
          : shipToInfos // ignore: cast_nullable_to_non_nullable
              as List<SalesOrgShipToInfo>,
    ));
  }
}

/// @nodoc

class _$_SalesOrgCustomerInfo extends _SalesOrgCustomerInfo {
  const _$_SalesOrgCustomerInfo(
      {required this.customerCodeSoldTo,
      required final List<SalesOrgShipToInfo> shipToInfos})
      : _shipToInfos = shipToInfos,
        super._();

  @override
  final CustomerCode customerCodeSoldTo;
  final List<SalesOrgShipToInfo> _shipToInfos;
  @override
  List<SalesOrgShipToInfo> get shipToInfos {
    if (_shipToInfos is EqualUnmodifiableListView) return _shipToInfos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shipToInfos);
  }

  @override
  String toString() {
    return 'SalesOrgCustomerInfo(customerCodeSoldTo: $customerCodeSoldTo, shipToInfos: $shipToInfos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SalesOrgCustomerInfo &&
            (identical(other.customerCodeSoldTo, customerCodeSoldTo) ||
                other.customerCodeSoldTo == customerCodeSoldTo) &&
            const DeepCollectionEquality()
                .equals(other._shipToInfos, _shipToInfos));
  }

  @override
  int get hashCode => Object.hash(runtimeType, customerCodeSoldTo,
      const DeepCollectionEquality().hash(_shipToInfos));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SalesOrgCustomerInfoCopyWith<_$_SalesOrgCustomerInfo> get copyWith =>
      __$$_SalesOrgCustomerInfoCopyWithImpl<_$_SalesOrgCustomerInfo>(
          this, _$identity);
}

abstract class _SalesOrgCustomerInfo extends SalesOrgCustomerInfo {
  const factory _SalesOrgCustomerInfo(
          {required final CustomerCode customerCodeSoldTo,
          required final List<SalesOrgShipToInfo> shipToInfos}) =
      _$_SalesOrgCustomerInfo;
  const _SalesOrgCustomerInfo._() : super._();

  @override
  CustomerCode get customerCodeSoldTo;
  @override
  List<SalesOrgShipToInfo> get shipToInfos;
  @override
  @JsonKey(ignore: true)
  _$$_SalesOrgCustomerInfoCopyWith<_$_SalesOrgCustomerInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_history_basicInfo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderHistoryBasicInfo {
  String get soldTo => throw _privateConstructorUsedError;
  String get shipTo => throw _privateConstructorUsedError;
  CompanyName get companyName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderHistoryBasicInfoCopyWith<OrderHistoryBasicInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryBasicInfoCopyWith<$Res> {
  factory $OrderHistoryBasicInfoCopyWith(OrderHistoryBasicInfo value,
          $Res Function(OrderHistoryBasicInfo) then) =
      _$OrderHistoryBasicInfoCopyWithImpl<$Res>;
  $Res call({String soldTo, String shipTo, CompanyName companyName});
}

/// @nodoc
class _$OrderHistoryBasicInfoCopyWithImpl<$Res>
    implements $OrderHistoryBasicInfoCopyWith<$Res> {
  _$OrderHistoryBasicInfoCopyWithImpl(this._value, this._then);

  final OrderHistoryBasicInfo _value;
  // ignore: unused_field
  final $Res Function(OrderHistoryBasicInfo) _then;

  @override
  $Res call({
    Object? soldTo = freezed,
    Object? shipTo = freezed,
    Object? companyName = freezed,
  }) {
    return _then(_value.copyWith(
      soldTo: soldTo == freezed
          ? _value.soldTo
          : soldTo // ignore: cast_nullable_to_non_nullable
              as String,
      shipTo: shipTo == freezed
          ? _value.shipTo
          : shipTo // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: companyName == freezed
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as CompanyName,
    ));
  }
}

/// @nodoc
abstract class _$$_OrderHistoryBasicInfoCopyWith<$Res>
    implements $OrderHistoryBasicInfoCopyWith<$Res> {
  factory _$$_OrderHistoryBasicInfoCopyWith(_$_OrderHistoryBasicInfo value,
          $Res Function(_$_OrderHistoryBasicInfo) then) =
      __$$_OrderHistoryBasicInfoCopyWithImpl<$Res>;
  @override
  $Res call({String soldTo, String shipTo, CompanyName companyName});
}

/// @nodoc
class __$$_OrderHistoryBasicInfoCopyWithImpl<$Res>
    extends _$OrderHistoryBasicInfoCopyWithImpl<$Res>
    implements _$$_OrderHistoryBasicInfoCopyWith<$Res> {
  __$$_OrderHistoryBasicInfoCopyWithImpl(_$_OrderHistoryBasicInfo _value,
      $Res Function(_$_OrderHistoryBasicInfo) _then)
      : super(_value, (v) => _then(v as _$_OrderHistoryBasicInfo));

  @override
  _$_OrderHistoryBasicInfo get _value =>
      super._value as _$_OrderHistoryBasicInfo;

  @override
  $Res call({
    Object? soldTo = freezed,
    Object? shipTo = freezed,
    Object? companyName = freezed,
  }) {
    return _then(_$_OrderHistoryBasicInfo(
      soldTo: soldTo == freezed
          ? _value.soldTo
          : soldTo // ignore: cast_nullable_to_non_nullable
              as String,
      shipTo: shipTo == freezed
          ? _value.shipTo
          : shipTo // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: companyName == freezed
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as CompanyName,
    ));
  }
}

/// @nodoc

class _$_OrderHistoryBasicInfo extends _OrderHistoryBasicInfo {
  _$_OrderHistoryBasicInfo(
      {required this.soldTo, required this.shipTo, required this.companyName})
      : super._();

  @override
  final String soldTo;
  @override
  final String shipTo;
  @override
  final CompanyName companyName;

  @override
  String toString() {
    return 'OrderHistoryBasicInfo(soldTo: $soldTo, shipTo: $shipTo, companyName: $companyName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderHistoryBasicInfo &&
            const DeepCollectionEquality().equals(other.soldTo, soldTo) &&
            const DeepCollectionEquality().equals(other.shipTo, shipTo) &&
            const DeepCollectionEquality()
                .equals(other.companyName, companyName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(soldTo),
      const DeepCollectionEquality().hash(shipTo),
      const DeepCollectionEquality().hash(companyName));

  @JsonKey(ignore: true)
  @override
  _$$_OrderHistoryBasicInfoCopyWith<_$_OrderHistoryBasicInfo> get copyWith =>
      __$$_OrderHistoryBasicInfoCopyWithImpl<_$_OrderHistoryBasicInfo>(
          this, _$identity);
}

abstract class _OrderHistoryBasicInfo extends OrderHistoryBasicInfo {
  factory _OrderHistoryBasicInfo(
      {required final String soldTo,
      required final String shipTo,
      required final CompanyName companyName}) = _$_OrderHistoryBasicInfo;
  _OrderHistoryBasicInfo._() : super._();

  @override
  String get soldTo;
  @override
  String get shipTo;
  @override
  CompanyName get companyName;
  @override
  @JsonKey(ignore: true)
  _$$_OrderHistoryBasicInfoCopyWith<_$_OrderHistoryBasicInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

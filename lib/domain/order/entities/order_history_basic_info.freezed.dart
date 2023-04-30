// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_history_basic_info.dart';

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
      _$OrderHistoryBasicInfoCopyWithImpl<$Res, OrderHistoryBasicInfo>;
  @useResult
  $Res call({String soldTo, String shipTo, CompanyName companyName});
}

/// @nodoc
class _$OrderHistoryBasicInfoCopyWithImpl<$Res,
        $Val extends OrderHistoryBasicInfo>
    implements $OrderHistoryBasicInfoCopyWith<$Res> {
  _$OrderHistoryBasicInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? soldTo = null,
    Object? shipTo = null,
    Object? companyName = null,
  }) {
    return _then(_value.copyWith(
      soldTo: null == soldTo
          ? _value.soldTo
          : soldTo // ignore: cast_nullable_to_non_nullable
              as String,
      shipTo: null == shipTo
          ? _value.shipTo
          : shipTo // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as CompanyName,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderHistoryBasicInfoCopyWith<$Res>
    implements $OrderHistoryBasicInfoCopyWith<$Res> {
  factory _$$_OrderHistoryBasicInfoCopyWith(_$_OrderHistoryBasicInfo value,
          $Res Function(_$_OrderHistoryBasicInfo) then) =
      __$$_OrderHistoryBasicInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String soldTo, String shipTo, CompanyName companyName});
}

/// @nodoc
class __$$_OrderHistoryBasicInfoCopyWithImpl<$Res>
    extends _$OrderHistoryBasicInfoCopyWithImpl<$Res, _$_OrderHistoryBasicInfo>
    implements _$$_OrderHistoryBasicInfoCopyWith<$Res> {
  __$$_OrderHistoryBasicInfoCopyWithImpl(_$_OrderHistoryBasicInfo _value,
      $Res Function(_$_OrderHistoryBasicInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? soldTo = null,
    Object? shipTo = null,
    Object? companyName = null,
  }) {
    return _then(_$_OrderHistoryBasicInfo(
      soldTo: null == soldTo
          ? _value.soldTo
          : soldTo // ignore: cast_nullable_to_non_nullable
              as String,
      shipTo: null == shipTo
          ? _value.shipTo
          : shipTo // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
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
            (identical(other.soldTo, soldTo) || other.soldTo == soldTo) &&
            (identical(other.shipTo, shipTo) || other.shipTo == shipTo) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, soldTo, shipTo, companyName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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

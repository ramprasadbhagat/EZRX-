// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_history_details_order_items_tender_contract_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderHistoryDetailsOrderItemTenderContractDetails {
  String get tenderContractNumber => throw _privateConstructorUsedError;
  String get tenderContractReference => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderHistoryDetailsOrderItemTenderContractDetailsCopyWith<
          OrderHistoryDetailsOrderItemTenderContractDetails>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryDetailsOrderItemTenderContractDetailsCopyWith<
    $Res> {
  factory $OrderHistoryDetailsOrderItemTenderContractDetailsCopyWith(
          OrderHistoryDetailsOrderItemTenderContractDetails value,
          $Res Function(OrderHistoryDetailsOrderItemTenderContractDetails)
              then) =
      _$OrderHistoryDetailsOrderItemTenderContractDetailsCopyWithImpl<$Res,
          OrderHistoryDetailsOrderItemTenderContractDetails>;
  @useResult
  $Res call({String tenderContractNumber, String tenderContractReference});
}

/// @nodoc
class _$OrderHistoryDetailsOrderItemTenderContractDetailsCopyWithImpl<$Res,
        $Val extends OrderHistoryDetailsOrderItemTenderContractDetails>
    implements
        $OrderHistoryDetailsOrderItemTenderContractDetailsCopyWith<$Res> {
  _$OrderHistoryDetailsOrderItemTenderContractDetailsCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tenderContractNumber = null,
    Object? tenderContractReference = null,
  }) {
    return _then(_value.copyWith(
      tenderContractNumber: null == tenderContractNumber
          ? _value.tenderContractNumber
          : tenderContractNumber // ignore: cast_nullable_to_non_nullable
              as String,
      tenderContractReference: null == tenderContractReference
          ? _value.tenderContractReference
          : tenderContractReference // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderHistoryDetailsOrderItemTenderContractDetailsCopyWith<
        $Res>
    implements
        $OrderHistoryDetailsOrderItemTenderContractDetailsCopyWith<$Res> {
  factory _$$_OrderHistoryDetailsOrderItemTenderContractDetailsCopyWith(
          _$_OrderHistoryDetailsOrderItemTenderContractDetails value,
          $Res Function(_$_OrderHistoryDetailsOrderItemTenderContractDetails)
              then) =
      __$$_OrderHistoryDetailsOrderItemTenderContractDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String tenderContractNumber, String tenderContractReference});
}

/// @nodoc
class __$$_OrderHistoryDetailsOrderItemTenderContractDetailsCopyWithImpl<$Res>
    extends _$OrderHistoryDetailsOrderItemTenderContractDetailsCopyWithImpl<
        $Res, _$_OrderHistoryDetailsOrderItemTenderContractDetails>
    implements
        _$$_OrderHistoryDetailsOrderItemTenderContractDetailsCopyWith<$Res> {
  __$$_OrderHistoryDetailsOrderItemTenderContractDetailsCopyWithImpl(
      _$_OrderHistoryDetailsOrderItemTenderContractDetails _value,
      $Res Function(_$_OrderHistoryDetailsOrderItemTenderContractDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tenderContractNumber = null,
    Object? tenderContractReference = null,
  }) {
    return _then(_$_OrderHistoryDetailsOrderItemTenderContractDetails(
      tenderContractNumber: null == tenderContractNumber
          ? _value.tenderContractNumber
          : tenderContractNumber // ignore: cast_nullable_to_non_nullable
              as String,
      tenderContractReference: null == tenderContractReference
          ? _value.tenderContractReference
          : tenderContractReference // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_OrderHistoryDetailsOrderItemTenderContractDetails
    extends _OrderHistoryDetailsOrderItemTenderContractDetails {
  _$_OrderHistoryDetailsOrderItemTenderContractDetails(
      {required this.tenderContractNumber,
      required this.tenderContractReference})
      : super._();

  @override
  final String tenderContractNumber;
  @override
  final String tenderContractReference;

  @override
  String toString() {
    return 'OrderHistoryDetailsOrderItemTenderContractDetails(tenderContractNumber: $tenderContractNumber, tenderContractReference: $tenderContractReference)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderHistoryDetailsOrderItemTenderContractDetails &&
            (identical(other.tenderContractNumber, tenderContractNumber) ||
                other.tenderContractNumber == tenderContractNumber) &&
            (identical(
                    other.tenderContractReference, tenderContractReference) ||
                other.tenderContractReference == tenderContractReference));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, tenderContractNumber, tenderContractReference);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderHistoryDetailsOrderItemTenderContractDetailsCopyWith<
          _$_OrderHistoryDetailsOrderItemTenderContractDetails>
      get copyWith =>
          __$$_OrderHistoryDetailsOrderItemTenderContractDetailsCopyWithImpl<
                  _$_OrderHistoryDetailsOrderItemTenderContractDetails>(
              this, _$identity);
}

abstract class _OrderHistoryDetailsOrderItemTenderContractDetails
    extends OrderHistoryDetailsOrderItemTenderContractDetails {
  factory _OrderHistoryDetailsOrderItemTenderContractDetails(
          {required final String tenderContractNumber,
          required final String tenderContractReference}) =
      _$_OrderHistoryDetailsOrderItemTenderContractDetails;
  _OrderHistoryDetailsOrderItemTenderContractDetails._() : super._();

  @override
  String get tenderContractNumber;
  @override
  String get tenderContractReference;
  @override
  @JsonKey(ignore: true)
  _$$_OrderHistoryDetailsOrderItemTenderContractDetailsCopyWith<
          _$_OrderHistoryDetailsOrderItemTenderContractDetails>
      get copyWith => throw _privateConstructorUsedError;
}

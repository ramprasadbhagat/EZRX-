// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_summary_details_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PaymentSummaryDetailsResponse {
  List<PaymentSummaryDetails> get paymentSummaryList =>
      throw _privateConstructorUsedError;
  Amount get totalPaymentInProgress => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentSummaryDetailsResponseCopyWith<PaymentSummaryDetailsResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentSummaryDetailsResponseCopyWith<$Res> {
  factory $PaymentSummaryDetailsResponseCopyWith(
          PaymentSummaryDetailsResponse value,
          $Res Function(PaymentSummaryDetailsResponse) then) =
      _$PaymentSummaryDetailsResponseCopyWithImpl<$Res,
          PaymentSummaryDetailsResponse>;
  @useResult
  $Res call(
      {List<PaymentSummaryDetails> paymentSummaryList,
      Amount totalPaymentInProgress});
}

/// @nodoc
class _$PaymentSummaryDetailsResponseCopyWithImpl<$Res,
        $Val extends PaymentSummaryDetailsResponse>
    implements $PaymentSummaryDetailsResponseCopyWith<$Res> {
  _$PaymentSummaryDetailsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentSummaryList = null,
    Object? totalPaymentInProgress = null,
  }) {
    return _then(_value.copyWith(
      paymentSummaryList: null == paymentSummaryList
          ? _value.paymentSummaryList
          : paymentSummaryList // ignore: cast_nullable_to_non_nullable
              as List<PaymentSummaryDetails>,
      totalPaymentInProgress: null == totalPaymentInProgress
          ? _value.totalPaymentInProgress
          : totalPaymentInProgress // ignore: cast_nullable_to_non_nullable
              as Amount,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaymentSummaryDetailsResponseCopyWith<$Res>
    implements $PaymentSummaryDetailsResponseCopyWith<$Res> {
  factory _$$_PaymentSummaryDetailsResponseCopyWith(
          _$_PaymentSummaryDetailsResponse value,
          $Res Function(_$_PaymentSummaryDetailsResponse) then) =
      __$$_PaymentSummaryDetailsResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<PaymentSummaryDetails> paymentSummaryList,
      Amount totalPaymentInProgress});
}

/// @nodoc
class __$$_PaymentSummaryDetailsResponseCopyWithImpl<$Res>
    extends _$PaymentSummaryDetailsResponseCopyWithImpl<$Res,
        _$_PaymentSummaryDetailsResponse>
    implements _$$_PaymentSummaryDetailsResponseCopyWith<$Res> {
  __$$_PaymentSummaryDetailsResponseCopyWithImpl(
      _$_PaymentSummaryDetailsResponse _value,
      $Res Function(_$_PaymentSummaryDetailsResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentSummaryList = null,
    Object? totalPaymentInProgress = null,
  }) {
    return _then(_$_PaymentSummaryDetailsResponse(
      paymentSummaryList: null == paymentSummaryList
          ? _value._paymentSummaryList
          : paymentSummaryList // ignore: cast_nullable_to_non_nullable
              as List<PaymentSummaryDetails>,
      totalPaymentInProgress: null == totalPaymentInProgress
          ? _value.totalPaymentInProgress
          : totalPaymentInProgress // ignore: cast_nullable_to_non_nullable
              as Amount,
    ));
  }
}

/// @nodoc

class _$_PaymentSummaryDetailsResponse extends _PaymentSummaryDetailsResponse {
  _$_PaymentSummaryDetailsResponse(
      {required final List<PaymentSummaryDetails> paymentSummaryList,
      required this.totalPaymentInProgress})
      : _paymentSummaryList = paymentSummaryList,
        super._();

  final List<PaymentSummaryDetails> _paymentSummaryList;
  @override
  List<PaymentSummaryDetails> get paymentSummaryList {
    if (_paymentSummaryList is EqualUnmodifiableListView)
      return _paymentSummaryList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paymentSummaryList);
  }

  @override
  final Amount totalPaymentInProgress;

  @override
  String toString() {
    return 'PaymentSummaryDetailsResponse(paymentSummaryList: $paymentSummaryList, totalPaymentInProgress: $totalPaymentInProgress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentSummaryDetailsResponse &&
            const DeepCollectionEquality()
                .equals(other._paymentSummaryList, _paymentSummaryList) &&
            (identical(other.totalPaymentInProgress, totalPaymentInProgress) ||
                other.totalPaymentInProgress == totalPaymentInProgress));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_paymentSummaryList),
      totalPaymentInProgress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaymentSummaryDetailsResponseCopyWith<_$_PaymentSummaryDetailsResponse>
      get copyWith => __$$_PaymentSummaryDetailsResponseCopyWithImpl<
          _$_PaymentSummaryDetailsResponse>(this, _$identity);
}

abstract class _PaymentSummaryDetailsResponse
    extends PaymentSummaryDetailsResponse {
  factory _PaymentSummaryDetailsResponse(
          {required final List<PaymentSummaryDetails> paymentSummaryList,
          required final Amount totalPaymentInProgress}) =
      _$_PaymentSummaryDetailsResponse;
  _PaymentSummaryDetailsResponse._() : super._();

  @override
  List<PaymentSummaryDetails> get paymentSummaryList;
  @override
  Amount get totalPaymentInProgress;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentSummaryDetailsResponseCopyWith<_$_PaymentSummaryDetailsResponse>
      get copyWith => throw _privateConstructorUsedError;
}

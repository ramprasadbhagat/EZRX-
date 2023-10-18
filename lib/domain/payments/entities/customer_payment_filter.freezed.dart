// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_payment_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CustomerPaymentFilter {
  DateTimeStringValue get today => throw _privateConstructorUsedError;
  DateTimeStringValue get yesterday => throw _privateConstructorUsedError;
  String get paymentBatchAdditionalInfo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomerPaymentFilterCopyWith<CustomerPaymentFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerPaymentFilterCopyWith<$Res> {
  factory $CustomerPaymentFilterCopyWith(CustomerPaymentFilter value,
          $Res Function(CustomerPaymentFilter) then) =
      _$CustomerPaymentFilterCopyWithImpl<$Res, CustomerPaymentFilter>;
  @useResult
  $Res call(
      {DateTimeStringValue today,
      DateTimeStringValue yesterday,
      String paymentBatchAdditionalInfo});
}

/// @nodoc
class _$CustomerPaymentFilterCopyWithImpl<$Res,
        $Val extends CustomerPaymentFilter>
    implements $CustomerPaymentFilterCopyWith<$Res> {
  _$CustomerPaymentFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? today = null,
    Object? yesterday = null,
    Object? paymentBatchAdditionalInfo = null,
  }) {
    return _then(_value.copyWith(
      today: null == today
          ? _value.today
          : today // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      yesterday: null == yesterday
          ? _value.yesterday
          : yesterday // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      paymentBatchAdditionalInfo: null == paymentBatchAdditionalInfo
          ? _value.paymentBatchAdditionalInfo
          : paymentBatchAdditionalInfo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CustomerPaymentFilterCopyWith<$Res>
    implements $CustomerPaymentFilterCopyWith<$Res> {
  factory _$$_CustomerPaymentFilterCopyWith(_$_CustomerPaymentFilter value,
          $Res Function(_$_CustomerPaymentFilter) then) =
      __$$_CustomerPaymentFilterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTimeStringValue today,
      DateTimeStringValue yesterday,
      String paymentBatchAdditionalInfo});
}

/// @nodoc
class __$$_CustomerPaymentFilterCopyWithImpl<$Res>
    extends _$CustomerPaymentFilterCopyWithImpl<$Res, _$_CustomerPaymentFilter>
    implements _$$_CustomerPaymentFilterCopyWith<$Res> {
  __$$_CustomerPaymentFilterCopyWithImpl(_$_CustomerPaymentFilter _value,
      $Res Function(_$_CustomerPaymentFilter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? today = null,
    Object? yesterday = null,
    Object? paymentBatchAdditionalInfo = null,
  }) {
    return _then(_$_CustomerPaymentFilter(
      today: null == today
          ? _value.today
          : today // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      yesterday: null == yesterday
          ? _value.yesterday
          : yesterday // ignore: cast_nullable_to_non_nullable
              as DateTimeStringValue,
      paymentBatchAdditionalInfo: null == paymentBatchAdditionalInfo
          ? _value.paymentBatchAdditionalInfo
          : paymentBatchAdditionalInfo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CustomerPaymentFilter extends _CustomerPaymentFilter {
  _$_CustomerPaymentFilter(
      {required this.today,
      required this.yesterday,
      required this.paymentBatchAdditionalInfo})
      : super._();

  @override
  final DateTimeStringValue today;
  @override
  final DateTimeStringValue yesterday;
  @override
  final String paymentBatchAdditionalInfo;

  @override
  String toString() {
    return 'CustomerPaymentFilter(today: $today, yesterday: $yesterday, paymentBatchAdditionalInfo: $paymentBatchAdditionalInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomerPaymentFilter &&
            (identical(other.today, today) || other.today == today) &&
            (identical(other.yesterday, yesterday) ||
                other.yesterday == yesterday) &&
            (identical(other.paymentBatchAdditionalInfo,
                    paymentBatchAdditionalInfo) ||
                other.paymentBatchAdditionalInfo ==
                    paymentBatchAdditionalInfo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, today, yesterday, paymentBatchAdditionalInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomerPaymentFilterCopyWith<_$_CustomerPaymentFilter> get copyWith =>
      __$$_CustomerPaymentFilterCopyWithImpl<_$_CustomerPaymentFilter>(
          this, _$identity);
}

abstract class _CustomerPaymentFilter extends CustomerPaymentFilter {
  factory _CustomerPaymentFilter(
          {required final DateTimeStringValue today,
          required final DateTimeStringValue yesterday,
          required final String paymentBatchAdditionalInfo}) =
      _$_CustomerPaymentFilter;
  _CustomerPaymentFilter._() : super._();

  @override
  DateTimeStringValue get today;
  @override
  DateTimeStringValue get yesterday;
  @override
  String get paymentBatchAdditionalInfo;
  @override
  @JsonKey(ignore: true)
  _$$_CustomerPaymentFilterCopyWith<_$_CustomerPaymentFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

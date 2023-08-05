import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/errors.dart';
import 'package:ezrxmobile/domain/core/error/failures.dart';
import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/core/value/value_validators.dart';
import 'package:flutter/material.dart';

import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;

  /// Throws [UnexpectedValueError] containing the [ValueFailure]
  T getOrCrash() {
    // id = identity - same as writing (right) => right
    return value.fold((f) => throw UnexpectedValueError(f), id);
  }

  T getOrDefaultValue(T defaultValue) {
    return value.fold((f) => defaultValue, id);
  }

  T getValue() => value.fold((f) => f.failedValue, (r) => r);

  Either<ValueFailure<dynamic>, Unit> get failureOrUnit {
    return value.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }

  bool isValid() => value.isRight();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ValueObject<T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}

class SearchKey extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory SearchKey(String input) {
    return SearchKey._(right(input));
  }

  factory SearchKey.search(String searchText) {
    return SearchKey._(
      validateStringNotEmpty(searchText)
          .flatMap((input) => validateMinStringLength(input, 2)),
    );
  }

  factory SearchKey.searchFilter(String searchText) {
    return SearchKey._(
      (validateStringIsEmpty(searchText).fold(
        (l) => validateMinStringLength(l.failedValue, 2),
        (r) => Right(r),
      )),
    );
  }

  bool get validFilterSearchKey =>
      isValid() && value.getOrElse(() => '').isNotEmpty;

  String get searchValueOrEmpty => value.getOrElse(() => '');

  int get countWhenValid => validFilterSearchKey ? 1 : 0;

  const SearchKey._(this.value);
}

class DateTimeStringValue extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory DateTimeStringValue(String input) {
    return DateTimeStringValue._(validateDateString(input));
  }

  String get _valueOrEmpty => value.getOrElse(() => '');

  String get _valueOrDash => value.getOrElse(() => '-');

  String get _valueOrNa => value.getOrElse(() => 'NA');

  bool get isNotEmpty => _valueOrEmpty.isNotEmpty;

  String get dateOrNaString => displayDateTimeString(
        _valueOrNa,
        DateTimeFormatString.displayDateFormat,
      );

  String get dateTimeOrNaString => displayDateTimeString(
        _valueOrNa,
        DateTimeFormatString.displayDateFormat,
      );

  String get dateOrDashString => displayDateTimeString(
        _valueOrDash,
        DateTimeFormatString.displayDateFormat,
      );

  String get dateTimeOrDashString => displayDateTimeString(
        _valueOrDash,
        DateTimeFormatString.displayDateTimeFormat,
      );

  String get dateString => displayDateTimeString(
        _valueOrEmpty,
        DateTimeFormatString.displayDateFormat,
      );

  String get simpleDateString => displayDateTimeString(
        _valueOrEmpty,
        DateTimeFormatString.displaySimpleDateFormat,
      );

  String get apiDateTimeString => displayDateTimeString(
        _valueOrEmpty,
        DateTimeFormatString.apiDateFormat,
      );

  String get apiDateWithDashString => displayDateTimeString(
        _valueOrEmpty,
        DateTimeFormatString.apiDateWithDashFormat,
      );

  int get intValue => getDateTimeIntValue(_valueOrEmpty);

  DateTime get dateTime => getDateTimeByDateString(_valueOrEmpty);

  const DateTimeStringValue._(this.value);
}

class LanguageValue extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory LanguageValue(String input) {
    return LanguageValue._(validateStringNotEmpty(input));
  }

  String get languageString => getLanguageString(value.getOrElse(() => ''));

  const LanguageValue._(this.value);
}

class StringValue extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory StringValue(String input) =>
      StringValue._(validateStringNotEmpty(input));

  String get displayDashIfEmpty => dashIfEmpty((value.getOrElse(() => '')));

  String get displayNAIfEmpty => naIfEmpty(value.getOrElse(() => ''));

  const StringValue._(this.value);
}

class RangeValue extends ValueObject<double> {
  @override
  final Either<ValueFailure<double>, double> value;

  factory RangeValue(String input) => RangeValue._(validateDoubleValue(input));

  String get apiParameterValue =>
      value.isLeft() ? '' : value.getOrElse(() => 0).toString();

  String get apiParameterValueIfNegative =>
      value.isLeft() ? '' : (-1 * value.getOrElse(() => 0)).toString();

  static bool checkIfRangeIsValid(RangeValue from, RangeValue to) =>
      (!from.isValid() && !to.isValid()) ||
      from.isValid() &&
          to.isValid() &&
          (to.getOrDefaultValue(0) >= from.getOrDefaultValue(0));

  static bool checkIfAnyIsEmpty(RangeValue from, RangeValue to) =>
      !from.isValid() && to.isValid() || from.isValid() && !to.isValid();

  const RangeValue._(this.value);
}

class IntegerValue extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  factory IntegerValue(String input) =>
      IntegerValue._(validateIntegerValue(input));

  String get apiParameterValue => emptyIfZero(value.getOrElse(() => 0));

  const IntegerValue._(this.value);
}

class StatusType extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory StatusType(String input) =>
      StatusType._(validateStringNotEmpty(input));

  bool statusContains(StatusType statusType) => value
      .getOrElse(() => '')
      .toLowerCase()
      .contains(statusType.getOrDefaultValue('').toLowerCase());

  String get displayStatusInList =>
      getReturnSummaryStatusInList(value.getOrElse(() => ''));

  Color get displayStatusLabelColor =>
      getStatusLabelColor(value.getOrElse(() => ''));

  Color get displayDueDateColor => getDueDateColor(value.getOrElse(() => ''));

  String get label => getReturnSummaryFilterByStatus(value.getOrElse(() => ''));

  String get displayStringValue {
    return dashIfEmpty((value.getOrElse(() => '')));
  }

  String get displayStatus => getReturnSummaryStatus(value.getOrElse(() => ''));

  String get displayPaymentStatus =>
      getPaymentStatus(value.getOrElse(() => ''));

  String get displayStatusForViewByRequest =>
      getReturnByRequestStatus(value.getOrElse(() => ''));

  Color get displayStatusTextColor =>
      getStatusTextColor(value.getOrElse(() => ''));

  Color get getPaymentDisplayStatusTextColor =>
      getDisplayStatusTextColor(value.getOrElse(() => ''));

  String message(
    PaymentSummaryDetails paymentSummaryDetails,
  ) =>
      getStatusMessage(value.getOrElse(() => ''), paymentSummaryDetails);
  bool get isApprovedStatus => isApproved(value.getOrElse(() => ''));

  String paymentDate(String date) =>
      getPaymentDate(value.getOrElse(() => ''), date);
  String adviceExpiry(String date) =>
      getAdviceExpiry(value.getOrElse(() => ''), date);

  bool get getIsSuccessful => isSuccessful(value.getOrElse(() => ''));
  bool get getIsBapiStatusFailed =>
      isBapiStatusFailed(value.getOrElse(() => ''));

  String getSAPROCreationValue(String bapiStatus, String bapiSalesDocNumber) =>
      sAPROCreationValue(
        value.getOrElse(() => ''),
        bapiStatus,
        bapiSalesDocNumber,
      );
  String getbapiStatusType(String bapiSalesDocNumber) =>
      bapiStatusType(value.getOrElse(() => ''), bapiSalesDocNumber);

  String get displayOrderStatus => getOrderStatus(value.getOrElse(() => ''));

  IconData displayOrderStatusIcon(String status) => getOrderStatusIcon(status);

  bool get getDisplayZyllemStatus =>
      isEligibleStatusForZyllem(value.getOrElse(() => ''));

  List<String> get displayOrderStatusDetails =>
      getOrderStatusDetails(value.getOrElse(() => ''));

  const StatusType._(this.value);
}

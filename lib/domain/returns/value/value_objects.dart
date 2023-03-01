import 'dart:core';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/core/value/value_validators.dart';
import 'package:ezrxmobile/domain/returns/value/value_transformers.dart';
import 'package:ezrxmobile/domain/returns/value/value_validators.dart';
import 'package:flutter/animation.dart';

class ReturnsAllowed extends ValueObject<bool> {
  @override
  final Either<ValueFailure<bool>, bool> value;

  factory ReturnsAllowed(bool input) {
    return ReturnsAllowed._(Right(input));
  }
  String get display {
    return makeBoolYesNo(value.getOrElse(() => false));
  }

  Color get labelColor {
    return getReturnsAllowedLabelColor(value.getOrElse(() => false));
  }

  const ReturnsAllowed._(this.value);
}

class MonthsAfterExpiry extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory MonthsAfterExpiry.change(String searchText) {
    return MonthsAfterExpiry._(validateStringNotEmpty(searchText)
        .flatMap((input) => validateInputIsBiggerThanMaxValue(input, 12)));
  }
  String get displayMonthsAfterExpiry {
    return zeroIfEmpty((value.getOrElse(() => '')));
  }

  const MonthsAfterExpiry._(this.value);
}

class MonthsBeforeExpiry extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory MonthsBeforeExpiry.change(String searchText) {
    return MonthsBeforeExpiry._(validateStringNotEmpty(searchText)
        .flatMap((input) => validateInputIsBiggerThanMaxValue(input, 36)));
  }
  String get displayMonthsBeforeExpiry {
    return zeroIfEmpty((value.getOrElse(() => '')));
  }

  const MonthsBeforeExpiry._(this.value);
}

class ApprovalLimit extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  factory ApprovalLimit(int input) {
    return ApprovalLimit._(Right(input));
  }

  String get parsedValue {
    return value.getOrElse(() => 0).toString();
  }

  const ApprovalLimit._(this.value);
}

class RefundTotal extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory RefundTotal(String input) {
    return RefundTotal._(validateStringNotEmpty(input));
  }

  double get refundTotal =>
      refundTotalStringAsFixed(value.getOrElse(() => '0'));

  const RefundTotal._(this.value);
}

class ReturnSummaryStatus extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory ReturnSummaryStatus(String input) {
    return ReturnSummaryStatus._(validateStringNotEmpty(input));
  }
  String get displayStatus => getReturnSummaryStatus(value.getOrElse(() => ''));

  String get displayStatusInList =>
      getReturnSummaryStatusInList(value.getOrElse(() => ''));
  Color get displayStatusLabelColor =>
      getStatusLabelColor(value.getOrElse(() => ''));

  Color get displayStatusTextColor =>
      getStatusTextColor(value.getOrElse(() => ''));

  String get label => getReturnSummaryFilterByStatus(value.getOrElse(() => ''));
  const ReturnSummaryStatus._(this.value);
}

class FilterStatus extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory FilterStatus(String input) =>
      FilterStatus._(validateStringNotEmpty(input));

  String get label => filterLabel(value.getOrElse(() => ''));

  String get apiSortValueOrEmpty => covertSortToApiDateString(
        value.getOrElse(() => ''),
      );

  const FilterStatus._(this.value);
}

class PriceRange extends ValueObject<double> {
  @override
  final Either<ValueFailure<double>, double> value;

  factory PriceRange(String input) => PriceRange._(validateDoubleValue(input));

  String get apiParameterValue => emptyIfZero(value.getOrElse(() => 0));

  String get doubleToString => emptyIfZero(value.getOrElse(() => 0));

  const PriceRange._(this.value);
}

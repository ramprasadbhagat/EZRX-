import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/errors.dart';
import 'package:ezrxmobile/domain/core/error/failures.dart';
import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/core/value/value_validators.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
    return SearchKey._(validateStringNotEmpty(input));
  }

  factory SearchKey.search(String searchText) {
    return SearchKey._(validateStringNotEmpty(searchText)
        .flatMap((input) => validateMinStringLength(input, 2)));
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

  factory DateTimeStringValue.announcement(String input) {
    return DateTimeStringValue._(validateAnnouncementDateString(input));
  }

  String get naIfEmptyDateTime => naIfEmpty(value.getOrElse(() => ''));

  String get toValidDateString => displayDateTimeStringOrEmpty(
        value.getOrElse(() => ''),
        DateTimeFormatString.displayDateFormat,
      );

  String get toValidDateStringNaIfEmpty => showDateOrNAIfEmpty(
        naIfEmptyDateTime,
        DateTimeFormatString.displayDateFormat,
      );

  String get toValidDateTimeString => displayDateTimeStringOrEmpty(
        value.getOrElse(() => ''),
        DateTimeFormatString.displayDateFormat,
      );

  bool get isNotEmpty => value.getOrElse(() => '').isNotEmpty;

  String get apiDateTimeFormat =>
      formattedDateTimeForAPI(value.getOrElse(() => ''));

  String get apiDateWithDashFormat =>
      formattedDateWithDashForAPI(value.getOrElse(() => ''));

  DateTime get dateTimeByDateString =>
      getDateTimeByDateString(value.getOrElse(() => ''));

  DateTime get dateTimeByAnnouncementDateString =>
      getDateTimeByAnnouncementDateString(value.getOrElse(() => ''));

  bool isBefore(DateTime dateTime) => dateTimeByDateString.isBefore(dateTime);

  int get dateTimeIntValue => getDateTimeIntValue(value.getOrElse(() => ''));

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

  factory StringValue(String input) {
    return StringValue._(validateStringNotEmpty(input));
  }

  String get displayStringValue {
    return dashIfEmpty((value.getOrElse(() => '')));
  }

  String get displayLabel => naIfEmpty(value.getOrElse(() => ''));

  Color get getPaymentAdviceColor => getValueColor(value.getOrElse(() => ''));

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

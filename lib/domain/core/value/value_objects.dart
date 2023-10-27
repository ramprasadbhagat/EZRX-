import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/errors.dart';
import 'package:ezrxmobile/domain/core/error/failures.dart';
import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/core/value/value_validators.dart';
import 'package:flutter/material.dart';

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

  bool get validateNotEmpty => searchValueOrEmpty.isNotEmpty;

  String get searchValueOrEmpty => value.getOrElse(() => '');

  int get countWhenValid => validateNotEmpty ? 1 : 0;

  bool get isValueEmpty => value.fold((l) => l.failedValue, (r) => r).isEmpty;

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

  String get dateTime12HoursString => displayDateTimeString(
        _valueOrEmpty,
        DateTimeFormatString.displayDateTime12HoursFormat,
      );

  String get dateTimeWithTimeZone =>
      '$dateTime12HoursString ${getTimeZoneAbbreviation(dateTime.timeZoneOffset)}';

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

  DateTime? get dateTimeOrNull => tryParseDateTime(_valueOrEmpty);

  String get differenceTime => calculateDifferenceTime(_valueOrEmpty);
  String get notificationDateTime => displayDateTimeString(
        _valueOrEmpty,
        DateTimeFormatString.displayNotificationDateTimeFormat,
      );

  bool get aWeekDifference => differenceNGTWeek(dateTime);
  const DateTimeStringValue._(this.value);
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

  int get intValue => value.getOrElse(() => 0).toInt();

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

  String get displayStatusText => getStatusText(value.getOrElse(() => ''));

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

  bool get isApprovedStatus => isApproved(value.getOrElse(() => ''));
  bool get getIsBapiStatusFailed =>
      isBapiStatusFailed(value.getOrElse(() => ''));

  String get getIntermediateStatus => bapiStatusType(
        value.getOrElse(() => ''),
      );
  bool get isSuccess => getIntermediateStatus == 'Success';

  String get displayOrderStatus => getOrderStatus(value.getOrElse(() => ''));

  IconData get displayOrderStatusIcon =>
      getOrderStatusIcon(value.getOrElse(() => ''));

  bool get getDisplayZyllemStatus =>
      isEligibleStatusForZyllem(value.getOrElse(() => ''));

  List<StatusType> get displayOrderStatusDetails =>
      getOrderStatusDetails(value.getOrElse(() => ''));

  Color get displayStatusTextColor =>
      getStatusTextColor(value.getOrElse(() => ''));

  const StatusType._(this.value);
}

class OosMaterial extends ValueObject<bool> {
  @override
  final Either<ValueFailure<bool>, bool> value;

  factory OosMaterial(bool input) => OosMaterial._(Right(input));

  String get oosMaterialTag => getOosMaterialTag(value.getOrElse(() => false));

  bool get isOutOfStockMaterialAllowed => value.getOrElse(() => false);

  Color get oosMaterialTagColor =>
      getOosMaterialTagColor(value.getOrElse(() => false));

  Color get oosMaterialTagLabelColor =>
      getOosMaterialTagLabelColor(value.getOrElse(() => false));

  String productTag(bool isValidated) => isValidated ? oosMaterialTag : oosTag;

  Color productTagColor(bool isValidated) =>
      isValidated ? oosMaterialTagColor : oosTagColor;

  Color productTagLabelColor(bool isValidated) =>
      isValidated ? oosMaterialTagLabelColor : oosTagLabelColor;

  String get oosTag => getOosTag();

  Color get oosTagColor => getStatusLabelColor(getOosTag());

  Color get oosTagLabelColor => getOosTagLabelColor();

  const OosMaterial._(this.value);
}

class PoNumberRequired extends ValueObject<bool> {
  @override
  final Either<ValueFailure<bool>, bool> value;

  factory PoNumberRequired(bool input) => PoNumberRequired._(Right(input));

  String get optionalText => getOptionalText(value.getOrElse(() => false));

  const PoNumberRequired._(this.value);
}

class MobileNumber extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory MobileNumber(String input) {
    return MobileNumber._(validateStringNotEmpty(input));
  }

  String get getTelephone {
    return getTelephoneNotGreaterThan16(value.getOrElse(() => ''));
  }

  String get displayLabel => naIfEmpty(getTelephone);

  const MobileNumber._(this.value);
}

class Remarks extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Remarks(String input) {
    return Remarks._(validateStringNotEmpty(input));
  }

  String get displayText => value.getOrElse(() => '-');

  const Remarks._(this.value);
}

class FilterStatus extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory FilterStatus(String input) =>
      FilterStatus._(validateStringNotEmpty(input));

  String get _valueOrEmpty => value.getOrElse(() => '');

  String get stringValue => dashIfEmpty(_valueOrEmpty);

  String get sortLabel => getSortLabel(_valueOrEmpty);

  List<String> get apiStatuses => getApiSatuses(_valueOrEmpty);

  String get apiSortValueOrEmpty => covertApiSortValue(
        value.getOrElse(() => ''),
      );

  String get displayStatusText => getStatusText(value.getOrElse(() => ''));

  Color get displayStatusTextColor =>
      getStatusTextColor(value.getOrElse(() => ''));

  Color get displayStatusLabelColor =>
      getStatusLabelColor(value.getOrElse(() => ''));

  bool get getIsSuccessfulOrProcessed =>
      isSuccessfulOrProcessed(value.getOrElse(() => ''));

  Color get getPaymentDisplayStatusTextColor =>
      getDisplayStatusTextColor(value.getOrElse(() => ''));

  Color get getAdviceExpiryTextColor =>
      getAdviceExpiryColor(value.getOrElse(() => ''));

  bool get getIsFailed => isFailed(value.getOrElse(() => ''));

  bool get isInProgress => getIsInProgress(value.getOrElse(() => ''));

  Color get getAdviceExpiryTextColorForFailed =>
      getAdviceExpiryColorFailed(value.getOrElse(() => ''));

  const FilterStatus._(this.value);
}

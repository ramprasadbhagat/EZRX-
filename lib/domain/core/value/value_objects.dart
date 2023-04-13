import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/errors.dart';
import 'package:ezrxmobile/domain/core/error/failures.dart';
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
        .flatMap((input) => validateMinStringLength(input, 3)));
  }

  factory SearchKey.searchFilter(String searchText) {
    return SearchKey._(
      (validateStringIsEmpty(searchText).fold(
        (l) => validateMinStringLength(l.failedValue, 3),
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

  String get naIfEmptyDateTime => naIfEmpty(value.getOrElse(() => ''));

  String get toValidDateString =>
      displayDateStringOrEmpty(value.getOrElse(() => ''));

  bool get isNotEmpty => value.getOrElse(() => '').isNotEmpty;

  String get apiDateTimeFormat =>
      formattedDateTimeForAPI(value.getOrElse(() => ''));

  DateTime get dateTimeByDateString =>
      getDateTimeByDateString(value.getOrElse(() => ''));

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
    return StringValue._(Right(input));
  }

  String get displayStringValue {
    return dashIfEmpty((value.getOrElse(() => '')));
  }

  const StringValue._(this.value);
}

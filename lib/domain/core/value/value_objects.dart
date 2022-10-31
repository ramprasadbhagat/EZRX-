import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/errors.dart';
import 'package:ezrxmobile/domain/core/error/failures.dart';
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

abstract class DateValueObject<T> {
  const DateValueObject();
  Either<ValueFailure<T>, DateTime> get value;

  /// Throws [UnexpectedValueError] containing the [ValueFailure]
  DateTime getOrCrash() {
    // id = identity - same as writing (right) => right
    return value.fold((f) => throw UnexpectedValueError(f), id);
  }

  bool isValid() => value.isRight();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DateValueObject<T> && other.value == value;
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
        .flatMap((input) => validateMinStringLength(input, 4)));
  }

  factory SearchKey.orderHistoryFilter(String searchText) {
    return SearchKey._(
      validateStringIsEmpty(searchText).fold(
        (l) => validateMinStringLength(l.failedValue, 4),
        (r) => Right(r),
      ),
    );
  }

  const SearchKey._(this.value);
}

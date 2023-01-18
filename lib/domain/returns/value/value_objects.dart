import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_validators.dart';
import 'package:ezrxmobile/domain/returns/value/value_transformers.dart';
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

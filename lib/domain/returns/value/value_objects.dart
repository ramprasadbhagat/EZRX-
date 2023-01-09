import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
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

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/core/value/value_validators.dart';
import 'package:ezrxmobile/domain/material/value/value_transformers.dart';

class MaterialNumber extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory MaterialNumber(String input) {
    return MaterialNumber._(validateStringNotEmpty(input));
  }

  String get displayMatNo {
    return naIfEmpty(removeLeadingZero(value.getOrElse(() => '')));
  }

  const MaterialNumber._(this.value);
}

class MaterialGroup extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory MaterialGroup.two(String input) {
    return MaterialGroup._(Right(input));
  }

  factory MaterialGroup.four(String input) {
    return MaterialGroup._(Right(input));
  }

  bool get isFOC {
    return materialIsFOC(value.getOrElse(() => ''));
  }

  const MaterialGroup._(this.value);
}

class MaterialPrice extends ValueObject<double> {
  @override
  final Either<ValueFailure<double>, double> value;

  factory MaterialPrice(double input) => MaterialPrice._(Right(input));

  const MaterialPrice._(this.value);

  String displayWithCurrency(Currency currency) {
    return currencyAlign(currency, value.getOrElse(() => 0));
  }
}

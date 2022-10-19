import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/core/value/value_validators.dart';
import 'package:ezrxmobile/domain/order/value/value_transformers.dart';

class CompanyName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory CompanyName(String input) {
    return CompanyName._(validateStringNotEmpty(input));
  }

  String get name {
    return naIfEmpty(value.getOrElse(() => ''));
  }

  const CompanyName._(this.value);
}

class SoldToParty extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory SoldToParty(String input) {
    return SoldToParty._(validateStringNotEmpty(input.trim()));
  }

  String get name {
    return naIfEmpty(value.getOrElse(() => ''));
  }

  const SoldToParty._(this.value);
}

class ShipToParty extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory ShipToParty(String input) {
    return ShipToParty._(validateStringNotEmpty(input));
  }

  String get name {
    return naIfEmpty(value.getOrElse(() => ''));
  }

  const ShipToParty._(this.value);
}

class ZpPrice extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory ZpPrice(String input) {
    return ZpPrice._(validateStringNotEmpty(input));
  }
  double get zpPrice {
    return totalPriceStringAsFixed(value.getOrElse(() => '0'));
  }

  const ZpPrice._(this.value);
}

class TotalPrice extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory TotalPrice(String input) {
    return TotalPrice._(validateStringNotEmpty(input));
  }
  double get totalPrice {
    return totalPriceStringAsFixed(value.getOrElse(() => '0'));
  }

  const TotalPrice._(this.value);
}

class PrincipalName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory PrincipalName(String input) {
    return PrincipalName._(validateStringNotEmpty(input));
  }

  String get name {
    return naIfEmpty(value.getOrElse(() => ''));
  }

  const PrincipalName._(this.value);
}

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

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/core/value/value_validators.dart';
import 'package:ezrxmobile/domain/order/value/value_transformers.dart';
import 'package:ezrxmobile/domain/order/value/value_validators.dart';

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

class BundleName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory BundleName(String input) {
    return BundleName._(validateStringNotEmpty(input));
  }

  String get name {
    return naIfEmpty(value.getOrElse(() => '--'));
  }

  const BundleName._(this.value);
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

  bool isValidMaterial(List<MaterialNumber> validMaterialNumbers) {
    return validMaterialNumbers.contains(this);
  }

  const MaterialNumber._(this.value);
}

class MaterialInStock extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory MaterialInStock(String input) {
    return MaterialInStock._(validateStringNotEmpty(input));
  }

  bool get isMaterialInStock {
    return getInStock(value.getOrElse(() => ''));
  }

  const MaterialInStock._(this.value);
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

  String get getMaterialGroup4Type {
    return materialGroup4Type(isFOC);
  }

  const MaterialGroup._(this.value);
}

class MaterialPrice extends ValueObject<double> {
  static const unavailablePriceValue = -1.0;
  @override
  final Either<ValueFailure<double>, double> value;

  factory MaterialPrice(double input) => MaterialPrice._(Right(input));

  factory MaterialPrice.unavailable() =>
      const MaterialPrice._(Right(unavailablePriceValue));

  const MaterialPrice._(this.value);

  bool isEmpty() => value.getOrElse(() => 0) == 0;

  bool isUnavailable() => value.getOrElse(() => 0) == unavailablePriceValue;
}

class MaterialQty extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  factory MaterialQty(int input) => MaterialQty._(Right(input));

  const MaterialQty._(this.value);

  bool conformZDP5Rule(String zdp5Value) =>
      materialQtyConformZDP5Rule(value.getOrElse(() => 0), zdp5Value);
}

class MaterialBundleType extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory MaterialBundleType(String input) {
    return MaterialBundleType._(Right(input));
  }

  const MaterialBundleType._(this.value);

  bool isPercent() {
    return materialBundleTypeIsPercent(value.getOrElse(() => ''));
  }
}

class MaterialTaxClassification extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory MaterialTaxClassification(String input) {
    return MaterialTaxClassification._(Right(input));
  }

  const MaterialTaxClassification._(this.value);

  bool isNoTax() {
    return materialTaxClassificationIsNoTax(value.getOrElse(() => ''));
  }

  bool isExempt() {
    return materialTaxClassificationIsExempt(value.getOrElse(() => ''));
  }

  bool get isFullTax {
    return materialTaxClassificationIsFullTax(value.getOrElse(() => ''));
  }
}

class Remarks extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Remarks(String input) {
    return Remarks._(validateStringNotEmpty(input));
  }

  const Remarks._(this.value);
}

class TemplateName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory TemplateName(String input) {
    return TemplateName._(validateStringNotEmpty(input));
  }

  const TemplateName._(this.value);
}

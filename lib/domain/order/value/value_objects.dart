import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/domain/core/value/value_validators.dart';
import 'package:ezrxmobile/domain/order/entities/price_bonus.dart';
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

  bool get isEmpty => value.getOrElse(() => 0) == 0;

  bool get isUnavailable => value.getOrElse(() => 0) == unavailablePriceValue;
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

  bool get isNoTax {
    return materialTaxClassificationIsNoTax(value.getOrElse(() => ''));
  }

  bool get isExempt {
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

class BonusMaterialCalculation extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory BonusMaterialCalculation(String input) {
    return BonusMaterialCalculation._(validateStringNotEmpty(input));
  }

  BonusMaterialCalculationEnum get getCalculationEnum =>
      getBonusCalculationEnum(value.getOrElse(() => ''));

  const BonusMaterialCalculation._(this.value);
}

class OrderItemType extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory OrderItemType(String input) {
    return OrderItemType._(validateStringNotEmpty(input));
  }

  bool get isMaterialTypeComm {
    return checkMatrialType(value.getOrElse(() => ''));
  }

  const OrderItemType._(this.value);
}

class PrincipleCode extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory PrincipleCode(String input) {
    return PrincipleCode._(validateStringNotEmpty(input));
  }

  const PrincipleCode._(this.value);

  bool isSubmitAllowedForClient() {
    return havingSubmitPrincipleForClient(
      removeLeadingZero(
        value.getOrElse(() => ''),
      ),
    );
  }

  bool isSubmitAllowedForSalesRep() {
    return havingSubmitPrincipleForSalesRep(
      removeLeadingZero(
        value.getOrElse(() => ''),
      ),
    );
  }
}

class TenderPrice extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory TenderPrice(String input) {
    return TenderPrice._(Right(input));
  }

  double get tenderPrice {
    return totalPriceStringAsFixed(value.getOrElse(() => '0'));
  }

  const TenderPrice._(this.value);
}

class TenderContractNumber extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory TenderContractNumber.tenderContractNumber(String input) {
    return TenderContractNumber._(Right(input));
  }

  factory TenderContractNumber.tenderContractItemNumber(String input) {
    return TenderContractNumber._(Right(input));
  }

  factory TenderContractNumber.tenderVisaNumber(String input) {
    return TenderContractNumber._(Right(input));
  }

  factory TenderContractNumber.announcementLetterNumber(String input) {
    return TenderContractNumber._(Right(input));
  }

  String get displayTenderContractNumber {
    return naIfEmpty(value.getOrElse(() => '-'));
  }

  String get displayTenderContractNumberInCart {
    return getTenderContractNumber(value.getOrElse(() => ''));
  }

  String get displayTenderContractItemNumber {
    return naIfEmpty(value.getOrElse(() => '-'));
  }

  String get displayTenderVisaNumber {
    return naIfEmpty(removeLeadingZero(value.getOrElse(() => '-')));
  }

  String get displayAnnouncementLetterNumber {
    return naIfEmpty(removeLeadingZero(value.getOrElse(() => '-')));
  }

  const TenderContractNumber._(this.value);
}

class TenderContractReason extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory TenderContractReason(String input) {
    return TenderContractReason._(Right(input));
  }

  bool get is730 {
    return contractIs730(value.getOrElse(() => ''));
  }

  bool get isEmpty => value.getOrElse(() => '') == '';

  String get displayTenderContractReason {
    return naIfEmpty(removeLeadingZero(value.getOrElse(() => '-')));
  }

  const TenderContractReason._(this.value);
}

class TenderContractInfo extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory TenderContractInfo.tenderContractReference(String input) {
    return TenderContractInfo._(Right(input));
  }

  factory TenderContractInfo.salesDistrict(String input) {
    return TenderContractInfo._(Right(input));
  }

  factory TenderContractInfo.packageDescription(String input) {
    return TenderContractInfo._(Right(input));
  }

  factory TenderContractInfo.contractExpiryDate(String input) {
    return TenderContractInfo._(Right(input));
  }

  factory TenderContractInfo.contractPaymentTerm(String input) {
    return TenderContractInfo._(Right(input));
  }

  String get displayContractReference {
    return naIfEmpty(value.getOrElse(() => ''));
  }

  String get displaySalesDistrict {
    return naIfEmpty(value.getOrElse(() => ''));
  }

  String get displayTenderPackageDescription {
    return naIfEmpty(value.getOrElse(() => ''));
  }

  String get displayContractExpiryDate {
    return naIfEmpty(value.getOrElse(() => ''));
  }

  String get displayContractPaymentTerm {
    return naIfEmpty(value.getOrElse(() => ''));
  }

  const TenderContractInfo._(this.value);
}

class CustomerPoReference extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory CustomerPoReference(String input) {
    return CustomerPoReference._(validateStringNotEmpty(input));
  }

  const CustomerPoReference._(this.value);
}

class SpecialInstruction extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory SpecialInstruction(String input) {
    return SpecialInstruction._(validateStringNotEmpty(input));
  }

  const SpecialInstruction._(this.value);
}

class ReferenceNote extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory ReferenceNote(String input) {
    return ReferenceNote._(validateStringNotEmpty(input));
  }

  const ReferenceNote._(this.value);
}

class CollectiveNumber extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory CollectiveNumber(String input) {
    return CollectiveNumber._(validateStringNotEmpty(input));
  }

  const CollectiveNumber._(this.value);
}

class ContactNumber extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory ContactNumber(String input) {
    return ContactNumber._(validateStringNotEmpty(input));
  }

  String get getTelephone {
    return getTelephoneNotGreaterThan16(value.getOrElse(() => ''));
  }

  const ContactNumber._(this.value);
}

class ContactPerson extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory ContactPerson(String input) {
    return ContactPerson._(validateStringNotEmpty(input));
  }

  const ContactPerson._(this.value);
}

class PaymentTerm extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory PaymentTerm(String input) {
    return PaymentTerm._(validateStringNotEmpty(input));
  }

  const PaymentTerm._(this.value);
}

class DeliveryDate extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory DeliveryDate(String input) {
    return DeliveryDate._(validateStringNotEmpty(input));
  }

  const DeliveryDate._(this.value);
}

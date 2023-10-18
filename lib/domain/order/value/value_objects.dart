import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
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

  bool get isZPPriceZero => isZero(value.getOrElse(() => '0'));

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

class PrincipalCode extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory PrincipalCode(String input) {
    return PrincipalCode._(validateStringNotEmpty(input));
  }

  const PrincipalCode._(this.value);

  String get _valueOrEmpty => value.getOrElse(() => '');

  String get _shortValue => removeLeadingZero(_valueOrEmpty);

  bool get clientSubmitAllowed => havingSubmitPrincipalForClient(_shortValue);

  bool get salesRepSubmitAllowed =>
      havingSubmitPrincipalForSalesRep(_shortValue);

  bool get isAllMaterial => havingPrincipalCodeForAllMaterial(_valueOrEmpty);

  bool get isPnG => havingPnGPrincipalCode(_shortValue);
}

class MaterialNumber extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory MaterialNumber(String input) {
    return MaterialNumber._(validateStringNotEmpty(input));
  }

  String get displayMatNo =>
      naIfEmpty(removeLeadingZero(value.getOrElse(() => '')));

  const MaterialNumber._(this.value);
}

class MaterialInfoType extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory MaterialInfoType(String input) {
    return MaterialInfoType._(validateStringNotEmpty(input));
  }
  factory MaterialInfoType.material() {
    return const MaterialInfoType._(Right('material'));
  }
  factory MaterialInfoType.bundle() {
    return MaterialInfoType._(validateStringNotEmpty('bundle'));
  }

  bool get typeBundle => isBundle(value.getOrElse(() => ''));

  bool get typeMaterial => isMaterial(value.getOrElse(() => ''));

  bool get typeCombo => isCombo(value.getOrElse(() => ''));

  const MaterialInfoType._(this.value);
}

class MaterialCode extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory MaterialCode(String input) {
    return MaterialCode._(validateStringNotEmpty(input));
  }

  String get displayMatNo {
    return naIfEmpty(removeLeadingZero(value.getOrElse(() => '')));
  }

  const MaterialCode._(this.value);
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

  int get intValue => value.getOrElse(() => 0);

  bool get isBonusMaxQuantityExceed =>
      isBonusMaterialMaxQuantityExceed(value.getOrElse(() => 0));

  bool get isQtyGreaterThanZero => intValue > 0;
}

class DiscountType extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory DiscountType(String input) {
    return DiscountType._(Right(input));
  }

  const DiscountType._(this.value);

  bool get isAmount {
    return !isEmpty && !isPercent;
  }

  bool get isPercent {
    return materialBundleTypeIsPercent(value.getOrElse(() => ''));
  }

  bool get isEmpty {
    return value.getOrElse(() => '').isEmpty;
  }
}

class ComboSuffix extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  factory ComboSuffix(String input) {
    return ComboSuffix._(validateIntegerValue(input));
  }

  String get stringValue => intToString(value.getOrElse(() => 0));

  const ComboSuffix._(this.value);
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

class SpecialInstructions extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory SpecialInstructions(String input) {
    return SpecialInstructions._(validateStringNotEmpty(input));
  }

  String get displaySpecialInstructions {
    return naIfEmpty(value.getOrElse(() => ''));
  }

  const SpecialInstructions._(this.value);
}

class POReference extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory POReference(String input) {
    return POReference._(validateStringNotEmpty(input));
  }

  String get displayPOReference {
    return naIfEmpty(value.getOrElse(() => ''));
  }

  const POReference._(this.value);
}

class PaymentTermCode extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory PaymentTermCode(String input) {
    return PaymentTermCode._(validateStringNotEmpty(input));
  }

  String get displayPaymentTermCode {
    return naIfEmpty(value.getOrElse(() => ''));
  }

  const PaymentTermCode._(this.value);
}

class PaymentTermDescription extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory PaymentTermDescription(String input) {
    return PaymentTermDescription._(validateStringNotEmpty(input));
  }

  String get displayPaymentTermDescription {
    return naIfEmpty(value.getOrElse(() => ''));
  }

  const PaymentTermDescription._(this.value);
}

class CustomerClassification extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory CustomerClassification(String input) {
    return CustomerClassification._(validateStringNotEmpty(input));
  }

  String get displayCustomerClassification {
    return naIfEmpty(value.getOrElse(() => ''));
  }

  const CustomerClassification._(this.value);
}

class PhoneNumber extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory PhoneNumber(String input) {
    return PhoneNumber._(validateStringNotEmpty(input));
  }

  String get displayTelephoneNumber {
    return naIfEmpty(value.getOrElse(() => ''));
  }

  const PhoneNumber._(this.value);
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
    return checkMaterialType(value.getOrElse(() => ''));
  }

  bool get isMaterialTypeBonus {
    return checkMaterialTypeBonus(value.getOrElse(() => ''));
  }

  const OrderItemType._(this.value);
}

class TenderPrice extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory TenderPrice(String input) {
    return TenderPrice._(Right(input));
  }

  double get tenderPrice => totalPriceStringAsFixed(value.getOrElse(() => '0'));

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

class PoReference extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory PoReference(String input) {
    return PoReference._(validateStringNotEmpty(input));
  }

  const PoReference._(this.value);
}

class DeliveryInstruction extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory DeliveryInstruction(String input) {
    return DeliveryInstruction._(validateStringNotEmpty(input));
  }

  const DeliveryInstruction._(this.value);
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

  String get getPaymentTerm => getPaymentTermValue(value.getOrElse(() => ''));

  const PaymentTerm._(this.value);
}

class Zdp8OverrideValue extends ValueObject<double> {
  @override
  final Either<ValueFailure<double>, double> value;

  factory Zdp8OverrideValue(double input) =>
      Zdp8OverrideValue._(validateNumberIsBiggerThanZero(input));

  const Zdp8OverrideValue._(this.value);
}

class OrderNumber extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory OrderNumber(String input) {
    return OrderNumber._(validateStringNotEmpty(input));
  }

  const OrderNumber._(this.value);
}

class PriceOverrideValue extends ValueObject<double> {
  @override
  final Either<ValueFailure<double>, double> value;

  factory PriceOverrideValue(double input) =>
      PriceOverrideValue._(validateNumberIsBiggerThanZero(input));

  const PriceOverrideValue._(this.value);
}

class CounterOfferValue extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory CounterOfferValue(String input) {
    return CounterOfferValue._(
      validateStringNotEmpty(input).flatMap(validateStringIsBiggerThanZero),
    );
  }

  double get doubleValue => getDoubleParsedValue(value.getOrElse(() => ''));

  String get stringValue => doubleValue.toString();

  PriceOverrideValue get toPriceOverrideValue =>
      getPriceOverrideValue(doubleValue);

  const CounterOfferValue._(this.value);
}

class CounterOfferDiscountValue extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory CounterOfferDiscountValue(String input) {
    return CounterOfferDiscountValue._(
      validateStringNotEmpty(input)
          .flatMap(validateStringIsBiggerThanZero)
          .flatMap(
            (input) => validateStringInputIsBiggerThanMaxValue(input, 100),
          ),
    );
  }

  double get doubleValue => getDoubleParsedValue(value.getOrElse(() => ''));
  Zdp8OverrideValue get toZdp8OverrideValue =>
      getZdp8OverrideValue(doubleValue);

  const CounterOfferDiscountValue._(this.value);
}

class MaterialItemType extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory MaterialItemType(String input) =>
      MaterialItemType._(validateStringNotEmpty(input));

  bool get isBundle => value.getOrElse(() => '') == 'Bundle';

  const MaterialItemType._(this.value);
}

class DocumentType extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  bool get isZPFB => value.getOrElse(() => '').contains('ZPFB');

  bool get isZPFC => value.getOrElse(() => '').contains('ZPFC');

  bool get isZPOR => value.getOrElse(() => '').contains('ZPOR');
  bool get isZPVF => value.getOrElse(() => '').contains('ZPVF');
  bool get isZPFV => value.getOrElse(() => '').contains('ZPFV');

  bool get isSpecialOrderType => isZPFB || isZPFC;
  bool get isCovidOrderType => isZPVF || isZPFV;

  factory DocumentType(String input) =>
      DocumentType._(validateStringNotEmpty(input));

  String get documentTypeCode {
    if (isZPFB) return 'ZPFB';
    if (isZPFC) return 'ZPFC';
    if (isZPOR) return 'ZPOR';

    return '';
  }

  const DocumentType._(this.value);
}

class SAPStatus extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory SAPStatus(String input) {
    return SAPStatus._(validateStringNotEmpty(input));
  }

  String get displaySAPStatus {
    return value.getOrElse(() => '').isNotEmpty
        ? value.getOrElse(() => '')
        : 'Order Placed'.tr();
  }

  const SAPStatus._(this.value);
}

class ShippingCondition extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory ShippingCondition(String input) {
    return ShippingCondition._(Right(input));
  }

  factory ShippingCondition.greenDelivery() => ShippingCondition('GD');

  bool get isGreenDelivery {
    return value.getOrElse(() => '') == 'GD';
  }

  const ShippingCondition._(this.value);
}

class FlexibleGroup extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory FlexibleGroup(String input) {
    return FlexibleGroup._(validateStringNotEmpty(input));
  }

  const FlexibleGroup._(this.value);
}

class ComboDealCategoryType extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory ComboDealCategoryType(String input) {
    return ComboDealCategoryType._(validateStringNotEmpty(input));
  }

  bool get isMaterialNumber => value.getOrElse(() => '') == 'MATNR';

  bool get isPrinciple => value.getOrElse(() => '') == 'ZPRINC';

  const ComboDealCategoryType._(this.value);
}

class BatchNumber extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory BatchNumber(String input) {
    return BatchNumber._(validateStringNotEmpty(input));
  }

  String get displayLabel => naIfEmpty(value.getOrElse(() => ''));
  String get selectOrGetBatch {
    return value.getOrElse(() => 'Select'.tr());
  }

  const BatchNumber._(this.value);
}

class ZDP5Info extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory ZDP5Info(String input) {
    return ZDP5Info._(Right(input));
  }

  int get intValue => getParsedValue(value.getOrElse(() => ''));

  bool get isValidValue => isValueNotEmpty(value.getOrElse(() => ''));

  const ZDP5Info._(this.value);
}

class Ean extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Ean(String input) {
    return Ean._(validateStringNotEmpty(input));
  }

  const Ean._(this.value);
}

class DataTotalHidden extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  factory DataTotalHidden(int input) => DataTotalHidden._(Right(input));

  const DataTotalHidden._(this.value);

  bool get isDataHidden => notZero(value.getOrElse(() => 0));
}

class FavouriteResponse extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  factory FavouriteResponse(int input) => FavouriteResponse._(Right(input));

  const FavouriteResponse._(this.value);

  bool get isSuccessful => checkIfSuccessful(value.getOrElse(() => 0));
}

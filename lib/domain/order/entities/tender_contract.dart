import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items_tender_contract_details.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tender_contract.freezed.dart';

@freezed
class TenderContract with _$TenderContract {
  const TenderContract._();

  const factory TenderContract({
    required TenderContractNumber contractNumber,
    required TenderContractNumber contractItemNumber,
    required TenderContractInfo contractReference,
    required TenderContractReason tenderOrderReason,
    required TenderContractNumber tenderVisaNumber,
    required TenderContractInfo salesDistrict,
    required TenderContractInfo tenderPackageDescription,
    required TenderPrice tenderPrice,
    required int pricingUnit,
    required int remainingTenderQuantity,
    required int contractQuantity,
    required TenderContractInfo contractExpiryDate,
    required TenderContractNumber announcementLetterNumber,
    required bool isNearToExpire,
    required TenderContractInfo contractPaymentTerm,
  }) = _TenderContract;

  factory TenderContract.empty() => TenderContract(
        contractNumber: TenderContractNumber.tenderContractNumber(''),
        contractItemNumber: TenderContractNumber.tenderContractItemNumber(''),
        contractReference: TenderContractInfo.tenderContractReference(''),
        tenderOrderReason: TenderContractReason(''),
        tenderVisaNumber: TenderContractNumber.tenderVisaNumber(''),
        salesDistrict: TenderContractInfo.salesDistrict(''),
        tenderPackageDescription: TenderContractInfo.packageDescription(''),
        tenderPrice: TenderPrice('0'),
        pricingUnit: 0,
        remainingTenderQuantity: 0,
        contractQuantity: 0,
        contractExpiryDate: TenderContractInfo.contractExpiryDate(''),
        announcementLetterNumber:
            TenderContractNumber.announcementLetterNumber(''),
        isNearToExpire: false,
        contractPaymentTerm: TenderContractInfo.contractPaymentTerm(''),
      );

  factory TenderContract.noContract() => TenderContract.empty().copyWith(
        contractNumber: TenderContractNumber.tenderContractNumber(
          'No contract (Price remains same)',
        ),
      );

  factory TenderContract.fromOrderHistory(
    OrderHistoryDetailsOrderItemTenderContractDetails tenderContact,
  ) =>
      TenderContract.empty().copyWith(
        contractNumber: TenderContractNumber.tenderContractNumber(
          tenderContact.tenderContractNumber,
        ),
        contractReference: TenderContractInfo.tenderContractReference(
          tenderContact.tenderContractReference,
        ),
        tenderPackageDescription: TenderContractInfo.packageDescription(
          tenderContact.tenderPackageDescription,
        ),
      );
}

extension TenderContractListExtension on List<TenderContract> {
  List<TenderContract> get withNoContractItem {
    //If no 730 contract is present in the list, the first item must be a no contract item
    final notContainReason730 =
        !any((element) => element.tenderOrderReason.is730);

    return notContainReason730
        ? (List.from(this)..insert(0, TenderContract.noContract()))
        : this;
  }

  TenderContract getDefaultSelected({
    required TenderContract currentTenderContract,
  }) {
    final defaultSelectedContract = withNoContractItem.firstWhere(
      (contract) =>
          contract.contractNumber == currentTenderContract.contractNumber,
      orElse: () => TenderContract.empty(),
    );

    //Select default if present else Select 730 contract if present, else select first item
    return defaultSelectedContract != TenderContract.empty()
        ? defaultSelectedContract
        : withNoContractItem.firstWhere(
            (e) => e.tenderOrderReason.is730,
            orElse: () => withNoContractItem.first,
          );
  }
}

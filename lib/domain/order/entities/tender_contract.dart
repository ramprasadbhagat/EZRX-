import 'package:ezrxmobile/domain/core/value/value_objects.dart';
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
    required StringValue contractReference,
    required TenderContractReason tenderOrderReason,
    required TenderContractNumber tenderVisaNumber,
    required StringValue salesDistrict,
    required StringValue tenderPackageDescription,
    required TenderPrice tenderPrice,
    required int pricingUnit,
    required int remainingTenderQuantity,
    required int contractQuantity,
    required DateTimeStringValue contractExpiryDate,
    required TenderContractNumber announcementLetterNumber,
    required bool isNearToExpire,
    required StringValue contractPaymentTerm,
  }) = _TenderContract;

  factory TenderContract.empty() => TenderContract(
        contractNumber: TenderContractNumber.tenderContractNumber(''),
        contractItemNumber: TenderContractNumber.tenderContractItemNumber(''),
        contractReference: StringValue(''),
        tenderOrderReason: TenderContractReason(''),
        tenderVisaNumber: TenderContractNumber.tenderVisaNumber(''),
        salesDistrict: StringValue(''),
        tenderPackageDescription: StringValue(''),
        tenderPrice: TenderPrice('0'),
        pricingUnit: 0,
        remainingTenderQuantity: 0,
        contractQuantity: 0,
        contractExpiryDate: DateTimeStringValue(''),
        announcementLetterNumber:
            TenderContractNumber.announcementLetterNumber(''),
        isNearToExpire: false,
        contractPaymentTerm: StringValue(''),
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
        contractReference: StringValue(
          tenderContact.tenderContractReference,
        ),
      );

  double get tenderPriceByPricingUnit =>
      pricingUnit == 0 ? 0 : tenderPrice.tenderPrice / pricingUnit;

  bool get isNotEmpty => this != TenderContract.empty();
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

  TenderContract get firstAvailableContract => firstWhere(
        (element) => element.remainingTenderQuantity > 0,
        orElse: () => TenderContract.empty(),
      );
}

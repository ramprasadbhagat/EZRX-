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
        tenderPrice: TenderPrice(''),
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
}

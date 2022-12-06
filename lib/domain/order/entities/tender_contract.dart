import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tender_contract.freezed.dart';

@freezed
class TenderContract with _$TenderContract {
  const TenderContract._();

  const factory TenderContract({
    required String contractNumber,
    required String contractItemNumber,
    required String contractReference,
    required TenderContractReason tenderOrderReason,
    required TenderContractNumber tenderVisaNumber,
    required String salesDistrict,
    required String tenderPackageDescription,
    required TenderPrice tenderPrice,
    required int pricingUnit,
    required int remainingTenderQuantity,
    required int contractQuantity,
    required String contractExpiryDate,
    required TenderContractNumber announcementLetterNumber,
    required bool isNearToExpire,
    required String contractPaymentTerm,
  }) = _TenderContract;

  factory TenderContract.empty() => TenderContract(
        contractNumber: '',
        contractItemNumber: '',
        contractReference: '',
        tenderOrderReason: TenderContractReason(''),
        tenderVisaNumber: TenderContractNumber.tenderVisaNumber(''),
        salesDistrict: '',
        tenderPackageDescription: '',
        tenderPrice: TenderPrice(''),
        pricingUnit: 0,
        remainingTenderQuantity: 0,
        contractQuantity: 0,
        contractExpiryDate: '',
        announcementLetterNumber: TenderContractNumber.announcementLetterNumber(''),
        isNearToExpire: false,
        contractPaymentTerm: '',
      );
}

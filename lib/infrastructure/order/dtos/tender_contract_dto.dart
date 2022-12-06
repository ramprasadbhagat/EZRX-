import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tender_contract_dto.freezed.dart';

part 'tender_contract_dto.g.dart';

@freezed
class TenderContractDto with _$TenderContractDto {
  const TenderContractDto._();

  const factory TenderContractDto({
    @JsonKey(name: 'contractNumber') required String contractNumber,
    @JsonKey(name: 'contractItemNumber') required String contractItemNumber,
    @JsonKey(name: 'contractReference') required String contractReference,
    @JsonKey(name: 'tenderOrderReason') required String tenderOrderReason,
    @JsonKey(name: 'tenderVisaNumber') required String tenderVisaNumber,
    @JsonKey(name: 'salesDistrict') required String salesDistrict,
    @JsonKey(name: 'tenderPackageDescription') required String tenderPackageDescription,
    @JsonKey(name: 'tenderPrice') required String tenderPrice,
    @JsonKey(name: 'pricingUnit') required int pricingUnit,
    @JsonKey(name: 'remainingTenderQuantity') required int remainingTenderQuantity,
    @JsonKey(name: 'contractQuantity') required int contractQuantity,
    @JsonKey(name: 'contractExpiryDate') required String contractExpiryDate,
    @JsonKey(name: 'announcementLetterNumber') required String announcementLetterNumber,
    @JsonKey(name: 'isNearToExpire') required bool isNearToExpire,
    @JsonKey(name: 'contractPaymentTerm') required String contractPaymentTerm,
  }) = _TenderContractDto;

  factory TenderContractDto.fromDomain(TenderContract tenderContract) {
    return TenderContractDto(
        contractNumber: tenderContract.contractNumber,
        contractItemNumber: tenderContract.contractItemNumber,
        contractReference: tenderContract.contractReference,
        tenderOrderReason: tenderContract.tenderOrderReason.getOrCrash(),
        tenderVisaNumber: tenderContract.tenderVisaNumber.getOrCrash(),
        salesDistrict: tenderContract.salesDistrict,
        tenderPackageDescription: tenderContract.tenderPackageDescription,
        tenderPrice: tenderContract.tenderPrice.getOrCrash(),
        pricingUnit: tenderContract.pricingUnit,
        remainingTenderQuantity: tenderContract.remainingTenderQuantity,
        contractQuantity: tenderContract.contractQuantity,
        contractExpiryDate: tenderContract.contractExpiryDate,
        announcementLetterNumber: tenderContract.announcementLetterNumber.getOrCrash(),
        isNearToExpire: tenderContract.isNearToExpire,
        contractPaymentTerm: tenderContract.contractPaymentTerm,
    );
  }

  TenderContract toDomain() {
    return TenderContract(
        contractNumber:contractNumber,
        contractItemNumber:contractItemNumber,
        contractReference:contractReference,
        tenderOrderReason:TenderContractReason(tenderOrderReason),
        tenderVisaNumber:TenderContractNumber.tenderVisaNumber(tenderVisaNumber),
        salesDistrict:salesDistrict,
        tenderPackageDescription:tenderPackageDescription,
        tenderPrice:TenderPrice(tenderPrice),
        pricingUnit:pricingUnit,
        remainingTenderQuantity:remainingTenderQuantity,
        contractQuantity:contractQuantity,
        contractExpiryDate:contractExpiryDate,
        announcementLetterNumber:TenderContractNumber.announcementLetterNumber(announcementLetterNumber),
        isNearToExpire:isNearToExpire,
        contractPaymentTerm:contractPaymentTerm,
    );
  }

  factory TenderContractDto.fromJson(Map<String, dynamic> json) =>
      _$TenderContractDtoFromJson(json);
}

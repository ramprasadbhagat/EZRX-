import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'tender_contract_dto.freezed.dart';
part 'tender_contract_dto.g.dart';

@freezed
class TenderContractDto with _$TenderContractDto {
  const TenderContractDto._();

  @HiveType(typeId: 20, adapterName: 'TenderContractDtoAdapter')
  const factory TenderContractDto({
    @HiveField(0, defaultValue: '')
    @JsonKey(name: 'contractNumber')
        required String contractNumber,
    @HiveField(1, defaultValue: '')
    @JsonKey(name: 'contractItemNumber')
        required String contractItemNumber,
    @HiveField(2, defaultValue: '')
    @JsonKey(name: 'contractReference')
        required String contractReference,
    @HiveField(3, defaultValue: '')
    @JsonKey(name: 'tenderOrderReason')
        required String tenderOrderReason,
    @HiveField(4, defaultValue: '')
    @JsonKey(name: 'tenderVisaNumber')
        required String tenderVisaNumber,
    @HiveField(5, defaultValue: '')
    @JsonKey(name: 'salesDistrict')
        required String salesDistrict,
    @HiveField(6, defaultValue: '')
    @JsonKey(name: 'tenderPackageDescription')
        required String tenderPackageDescription,
    @HiveField(7, defaultValue: '')
    @JsonKey(name: 'tenderPrice')
        required String tenderPrice,
    @HiveField(8, defaultValue: 0)
    @JsonKey(name: 'pricingUnit')
        required int pricingUnit,
    @HiveField(9, defaultValue: 0)
    @JsonKey(name: 'remainingTenderQuantity')
        required int remainingTenderQuantity,
    @HiveField(10, defaultValue: 0)
    @JsonKey(name: 'contractQuantity')
        required int contractQuantity,
    @HiveField(11, defaultValue: '')
    @JsonKey(name: 'contractExpiryDate')
        required String contractExpiryDate,
    @HiveField(12, defaultValue: '')
    @JsonKey(name: 'announcementLetterNumber')
        required String announcementLetterNumber,
    @HiveField(13, defaultValue: false)
    @JsonKey(name: 'isNearToExpire')
        required bool isNearToExpire,
    @HiveField(14, defaultValue: '')
    @JsonKey(name: 'contractPaymentTerm')
        required String contractPaymentTerm,
  }) = _TenderContractDto;

  factory TenderContractDto.fromDomain(TenderContract tenderContract) {
    return TenderContractDto(
      contractNumber: tenderContract.contractNumber.getOrCrash(),
      contractItemNumber: tenderContract.contractItemNumber.getOrCrash(),
      contractReference: tenderContract.contractReference.getOrCrash(),
      tenderOrderReason: tenderContract.tenderOrderReason.getOrCrash(),
      tenderVisaNumber: tenderContract.tenderVisaNumber.getOrCrash(),
      salesDistrict: tenderContract.salesDistrict.getOrCrash(),
      tenderPackageDescription:
          tenderContract.tenderPackageDescription.getOrCrash(),
      tenderPrice: tenderContract.tenderPrice.getOrCrash(),
      pricingUnit: tenderContract.pricingUnit,
      remainingTenderQuantity: tenderContract.remainingTenderQuantity,
      contractQuantity: tenderContract.contractQuantity,
      contractExpiryDate: tenderContract.contractExpiryDate.getOrCrash(),
      announcementLetterNumber:
          tenderContract.announcementLetterNumber.getOrCrash(),
      isNearToExpire: tenderContract.isNearToExpire,
      contractPaymentTerm: tenderContract.contractPaymentTerm.getOrCrash(),
    );
  }

  TenderContract toDomain() {
    return TenderContract(
      contractNumber: TenderContractNumber.tenderContractNumber(contractNumber),
      contractItemNumber:
          TenderContractNumber.tenderContractItemNumber(contractItemNumber),
      contractReference:
          TenderContractInfo.tenderContractReference(contractReference),
      tenderOrderReason: TenderContractReason(tenderOrderReason),
      tenderVisaNumber: TenderContractNumber.tenderVisaNumber(tenderVisaNumber),
      salesDistrict: TenderContractInfo.salesDistrict(salesDistrict),
      tenderPackageDescription:
          TenderContractInfo.packageDescription(tenderPackageDescription),
      tenderPrice: TenderPrice(tenderPrice),
      pricingUnit: pricingUnit,
      remainingTenderQuantity: remainingTenderQuantity,
      contractQuantity: contractQuantity,
      contractExpiryDate:
          TenderContractInfo.contractExpiryDate(contractExpiryDate),
      announcementLetterNumber: TenderContractNumber.announcementLetterNumber(
        announcementLetterNumber,
      ),
      isNearToExpire: isNearToExpire,
      contractPaymentTerm:
          TenderContractInfo.contractPaymentTerm(contractPaymentTerm),
    );
  }

  factory TenderContractDto.fromJson(Map<String, dynamic> json) =>
      _$TenderContractDtoFromJson(json);
}

import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'submit_tender_contract_dto.freezed.dart';

part 'submit_tender_contract_dto.g.dart';

@freezed
class SubmitTenderContractDto with _$SubmitTenderContractDto {
  const SubmitTenderContractDto._();

  const factory SubmitTenderContractDto({
    @JsonKey(name: 'contractNumber', defaultValue: '')
        required String contractNumber,
    @JsonKey(name: 'contractLineItemNumber', defaultValue: '')
        required String contractLineItemNumber,
    @JsonKey(name: 'contractPrice', defaultValue: 0)
        required double contractPrice,
    @JsonKey(name: 'contractPONumber', defaultValue: '')
        required String contractPONumber,
    @JsonKey(name: 'contractUnitOfMeasurement', defaultValue: 0)
        required int contractUnitOfMeasurement,
    @JsonKey(name: 'currency', defaultValue: '') required String currency,
  }) = _SubmitTenderContractDto;

  factory SubmitTenderContractDto.fromDomain(
    TenderContract tenderContract,
    String currency,
  ) {
    return SubmitTenderContractDto(
      contractNumber: tenderContract.contractNumber.getValue(),
      contractLineItemNumber: tenderContract.contractItemNumber.getValue(),
      contractPrice: tenderContract.tenderPrice.tenderPrice,
      contractPONumber: tenderContract.contractReference.getValue(),
      contractUnitOfMeasurement: tenderContract.pricingUnit,
      currency: currency.toUpperCase(),
    );
  }

  factory SubmitTenderContractDto.fromJson(Map<String, dynamic> json) =>
      _$SubmitTenderContractDtoFromJson(json);
}

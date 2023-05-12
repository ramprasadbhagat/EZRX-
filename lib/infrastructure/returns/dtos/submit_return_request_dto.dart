import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/returns/entities/submit_return_request.dart';

import 'package:ezrxmobile/infrastructure/returns/dtos/invoice_details_dto.dart';

part 'submit_return_request_dto.freezed.dart';
part 'submit_return_request_dto.g.dart';

@freezed
class SubmitReturnRequestDto with _$SubmitReturnRequestDto {
  const SubmitReturnRequestDto._();

  const factory SubmitReturnRequestDto({
     @JsonKey(
      name: 'soldToCustomer',defaultValue: '',)
        required String customerCode,
    @JsonKey(name: 'username', defaultValue: '')
        required String username,
    @JsonKey(name: 'orderSource', defaultValue: '')
        required String orderSource,
    @JsonKey(name: 'subscribeStatusChange', defaultValue: false)
        required bool subscribeStatusChange,
    @JsonKey(name: 'specialInstruction')
        required String specialInstruction,
    @JsonKey(name: 'purchaseNumberC', defaultValue: '')
        required String purchaseNumberC,
    @JsonKey(name: 'invoiceDetails', defaultValue: <InvoiceDetailsDto>[])
        required List<InvoiceDetailsDto> invoiceDetails,
    
  }) = _SubmitReturnRequestDto;

  factory SubmitReturnRequestDto.fromDomain(SubmitReturnsRequest submitReturnRequest) {
    return SubmitReturnRequestDto(
      orderSource: submitReturnRequest.orderSource,
      purchaseNumberC: submitReturnRequest.purchaseNumberC,
      customerCode: submitReturnRequest.customerCode,
      specialInstruction: submitReturnRequest.specialInstruction,
      subscribeStatusChange: submitReturnRequest.subscribeStatusChange,
      username: submitReturnRequest.username.getOrCrash(),
      invoiceDetails: submitReturnRequest.invoiceDetails.map((e) => InvoiceDetailsDto.fromDomain(e)).toList(),
    );
  }


  factory SubmitReturnRequestDto.fromJson(Map<String, dynamic> json) =>
      _$SubmitReturnRequestDtoFromJson(json);
}

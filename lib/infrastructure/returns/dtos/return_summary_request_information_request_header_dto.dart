import 'package:ezrxmobile/domain/returns/entities/return_summary_request_information_request_header.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_summary_request_information_return_invoice_dto.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_summary_request_information_sales_doc_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_summary_request_information_request_header_dto.freezed.dart';
part 'return_summary_request_information_request_header_dto.g.dart';

@freezed
class RequestHeaderDto with _$RequestHeaderDto {
  const RequestHeaderDto._();

  const factory RequestHeaderDto({
    @JsonKey(name: 'soldTo') required String soldTo,
    @JsonKey(name: 'shipTo') required String shipTo,
    @JsonKey(name: 'createdBy') required String createdBy,
    @JsonKey(name: 'returnType') required String returnType,
    @JsonKey(name: 'status') required String status,
    @JsonKey(name: 'createdDate') required String createdDate,
    @JsonKey(name: 'createdTime') required String createdTime,
    @JsonKey(name: 'requestID') required String requestID,
    @JsonKey(name: 'salesOrg') required String salesOrg,
    @JsonKey(name: 'refundTotal') required String refundTotal,
    @JsonKey(name: 'totalItemCount') required String totalItemCount,
    @JsonKey(name: 'returnInvoices', defaultValue: [])
        required List<ReturnInvoiceDto> returnInvoices,
    @JsonKey(name: 'salesDoc', defaultValue: [])
        required List<SalesDocDto> salesDoc,
    @JsonKey(name: 'returnTypeDesc') required String returnTypeDesc,
    @JsonKey(name: 'ppaHeld') required bool ppaHeld,
    @JsonKey(name: 'cName1') required String cName1,
    @JsonKey(name: 'cName2') required String cName2,
    @JsonKey(name: 'cName3') required String cName3,
    @JsonKey(name: 'cName4') required String cName4,
    @JsonKey(name: 'street1') required String street1,
    @JsonKey(name: 'street2') required String street2,
    @JsonKey(name: 'street3') required String street3,
    @JsonKey(name: 'street4') required String street4,
  }) = _RequestHeaderDto;

  factory RequestHeaderDto.fromDomain(RequestHeader requestHeader) {
    return RequestHeaderDto(
      soldTo: requestHeader.soldTo,
      shipTo: requestHeader.shipTo,
      createdBy: requestHeader.createdBy,
      returnType: requestHeader.returnType,
      status: requestHeader.status.getOrCrash(),
      createdDate: requestHeader.createdDate.getOrCrash(),
      createdTime: requestHeader.createdTime,
      requestID: requestHeader.requestId,
      salesOrg: requestHeader.salesOrg,
      refundTotal: requestHeader.refundTotal.toString(),
      totalItemCount: requestHeader.totalItemCount,
      returnInvoices: requestHeader.returnInvoices
          .map((e) => ReturnInvoiceDto.fromDomain(e))
          .toList(),
      salesDoc:
          requestHeader.salesDoc.map((e) => SalesDocDto.fromDomain(e)).toList(),
      returnTypeDesc: requestHeader.returnTypeDesc,
      ppaHeld: requestHeader.ppaHeld,
      cName1: requestHeader.cName1,
      cName2: requestHeader.cName2,
      cName3: requestHeader.cName3,
      cName4: requestHeader.cName4,
      street1: requestHeader.street1,
      street2: requestHeader.street2,
      street3: requestHeader.street3,
      street4: requestHeader.street4,
    );
  }

  RequestHeader toDomain() {
    return RequestHeader(
      soldTo: soldTo,
      shipTo: shipTo,
      createdBy: createdBy,
      returnType: returnType,
      status: ReturnSummaryStatus(status),
      createdDate: SimpleDate(createdDate),
      createdTime: createdTime,
      requestId: requestID,
      salesOrg: salesOrg,
      refundTotal: double.parse(refundTotal),
      totalItemCount: totalItemCount,
      returnInvoices: returnInvoices.map((e) => e.toDomain()).toList(),
      salesDoc: salesDoc.map((e) => e.toDomain()).toList(),
      returnTypeDesc: returnTypeDesc,
      ppaHeld: ppaHeld,
      cName1: cName1,
      cName2: cName2,
      cName3: cName3,
      cName4: cName4,
      street1: street1,
      street2: street2,
      street3: street3,
      street4: street4,
    );
  }

  factory RequestHeaderDto.fromJson(Map<String, dynamic> json) =>
      _$RequestHeaderDtoFromJson(json);
}

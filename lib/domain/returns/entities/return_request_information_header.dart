import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'return_request_information_header.freezed.dart';

@freezed
class ReturnRequestInformationHeader with _$ReturnRequestInformationHeader {
  factory ReturnRequestInformationHeader({
    required StringValue returnReference,
    required SpecialInstructions specialInstructions,
    required String requestID,
    required String cName1,
    required String soldTo,
    required String createdBy,
    required RefundTotal refundTotal,
    required DateTimeStringValue createdDate,
    required StatusType bapiStatus,
  }) = _ReturnRequestInformationHeader;
  factory ReturnRequestInformationHeader.empty() =>
      ReturnRequestInformationHeader(
        returnReference: StringValue(''),
        specialInstructions: SpecialInstructions(''),
        refundTotal: RefundTotal(''),
        cName1: '',
        soldTo: '',
        createdBy: '',
        requestID: '',
        createdDate: DateTimeStringValue(''),
        bapiStatus: StatusType(''),
      );
}

import 'package:ezrxmobile/domain/returns/entities/approver_return_request_information.dart';
import 'package:ezrxmobile/domain/returns/entities/approver_return_request_information_header.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'approver_return_request.freezed.dart';

@freezed
class ApproverReturnRequest with _$ApproverReturnRequest {
  const ApproverReturnRequest._();
  factory ApproverReturnRequest({
    required ApproverReturnRequestInformationHeader requestHeader,
    required List<ApproverReturnRequestInformation> requestInformation,
  }) = _ApproverReturnRequest;

  String get returnId => requestHeader.requestID;
  String get customerName => requestHeader.cName1;
  String get submittedDate => requestHeader.createdDate.isNotEmpty
      ? DateFormat('dd MMM yyyy').format(
          DateTime.tryParse(requestHeader.createdDate) ?? DateTime.now(),
        )
      : '';
  double get refundTotal => requestHeader.refundTotal.refundTotal;
  String get createdBy => requestHeader.createdBy;
  String get soldTo => requestHeader.soldTo;

  factory ApproverReturnRequest.empty() => ApproverReturnRequest(
        requestHeader: ApproverReturnRequestInformationHeader.empty(),
        requestInformation: [],
      );
  
}

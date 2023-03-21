import 'package:ezrxmobile/domain/returns/entities/return_request_information_header.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_information.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_information.freezed.dart';

@freezed
class RequestInformation with _$RequestInformation {
  const RequestInformation._();
  factory RequestInformation({
    required ReturnRequestInformationHeader requestHeader,
    required List<ReturnRequestInformation> requestInformation,
  }) = _RequestInformation;

  String get returnId => requestHeader.requestID;
  String get customerName => requestHeader.cName1;
  String get submittedDate => requestHeader.createdDate.toValidDateString;
  double get refundTotal => requestHeader.refundTotal.refundTotal;
  String get createdBy => requestHeader.createdBy;
  String get soldTo => requestHeader.soldTo;

  factory RequestInformation.empty() => RequestInformation(
        requestHeader: ReturnRequestInformationHeader.empty(),
        requestInformation: [],
      );
  
}

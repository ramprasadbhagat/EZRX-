import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'return_request_information.freezed.dart';

@freezed
class ReturnRequestInformation with _$ReturnRequestInformation {
  const ReturnRequestInformation._();
  factory ReturnRequestInformation({
    required String invoiceNo,
    required DateTimeStringValue expiryDate,
    required StringValue comment,
    required String rejectReason,
    required String returnQuantity,
    required double unitPrice,
    required double totalPrice,
    required String returnOrderDesc,
    required MaterialNumber materialNumber,
    required String materialDescription,
    required String batch,
    required String materialGroup,
    required List<String> imageUrl,
    required List<String> attachments,
    required DateTimeStringValue createdDate,
    required String principal,
    required PrincipalName principalName,
    required String bapiSalesDocNumber,
    required StatusType bapiStatus,
    required StatusType status,
    required String statusReason,
    required bool outsidePolicy,
    required DateTimeStringValue invoiceDate,
    required List<ReturnRequestInformation> bonusInformation,
  }) = _ReturnRequestInformation;

  factory ReturnRequestInformation.empty() => ReturnRequestInformation(
        expiryDate: DateTimeStringValue(''),
        attachments: [],
        bapiSalesDocNumber: '',
        bapiStatus: StatusType(''),
        batch: '',
        bonusInformation: [],
        comment: StringValue(''),
        createdDate: DateTimeStringValue(''),
        imageUrl: [],
        invoiceDate: DateTimeStringValue(''),
        invoiceNo: '',
        materialDescription: '',
        materialGroup: '',
        materialNumber: MaterialNumber(''),
        outsidePolicy: false,
        returnOrderDesc: '',
        principal: '',
        principalName: PrincipalName(''),
        rejectReason: '',
        returnQuantity: '',
        status: StatusType(''),
        statusReason: '',
        totalPrice: 0.0,
        unitPrice: 0.0,
      );

  double get calculatedUnitPrice {
    return double.parse((totalPrice / int.parse(returnQuantity)).toString());
  }
}

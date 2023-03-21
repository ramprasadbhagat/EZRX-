import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_request_information.freezed.dart';

@freezed
class ReturnRequestInformation with _$ReturnRequestInformation {
  const ReturnRequestInformation._();
  factory ReturnRequestInformation({
    required String invoiceNo,
    required String returnValue,
    required List<String> actionRequired,
    required DateTimeStringValue expiryDate,
    required StringValue comment,
    required String salesDocument,
    required String exchangeOrder,
    required String refundCurrency,
    required String rejectReason,
    required String exchangeOrderNumber,
    required String docType,
    required String referenceDocument,
    required String division,
    required String purchaseMethod,
    required String usage,
    required String distributionChannel,
    required String approvalTimeStamp,
    required String createdTimeStamp,
    required String poDate,
    required String returnQuantity,
    required double unitPrice,
    required double totalPrice,
    required String billingItemNumber,
    required String salesDocumentItemNumber,
    required MaterialNumber materialNumber,
    required String materialDescription,
    required String batch,
    required String materialGroup,
    required List<String> imageUrl,
    required List<String> attachmentUrl,
    required String plant,
    required String storageLocation,
    required String highLevelItemCode,
    required String orderReason,
    required DateTimeStringValue priceDate,
    required DateTimeStringValue createdDate,
    required String overrideType,
    required StringValue overrideValue,
    required String returnOrderText,
    required String returnOrderDesc,
    required String principal,
    required String bapiSalesDocNumber,
    required String eZRxNumber,
    required String bapiStatus,
    required String cnNumber,
    required ReturnSummaryStatus status,
    required String statusReason,
    required String priceOverride,
    required String remarks,
    required bool sendForDestruction,
    required bool quarantine,
    required bool returnToStock,
    required bool productRecall,
    required String returnType,
    required String returnTypeDesc,
    required String purchaseNumberCOverride,
    required String purchaseNumberC,
    required bool ppaHeld,
    required bool outsidePolicy,
    required List<String> attachments,
  }) = _ReturnRequestInformation;
  factory ReturnRequestInformation.empty() => ReturnRequestInformation(
        invoiceNo: '',
        returnValue: '',
        actionRequired: [],
        expiryDate: DateTimeStringValue(''),
        comment: StringValue(''),
        salesDocument: '',
        exchangeOrder: '',
        refundCurrency: '',
        rejectReason: '',
        exchangeOrderNumber: '',
        docType: '',
        referenceDocument: '',
        division: '',
        purchaseMethod: '',
        usage: '',
        distributionChannel: '',
        approvalTimeStamp: '',
        createdTimeStamp: '',
        poDate: '',
        returnQuantity: '',
        unitPrice: 0.0,
        totalPrice: 0.0,
        billingItemNumber: '',
        salesDocumentItemNumber: '',
        materialNumber: MaterialNumber(''),
        materialDescription: '',
        batch: '',
        materialGroup: '',
        imageUrl: [],
        attachmentUrl: [],
        plant: '',
        storageLocation: '',
        highLevelItemCode: '',
        orderReason: '',
        priceDate: DateTimeStringValue(''),
        createdDate: DateTimeStringValue(''),
        overrideType: '',
        overrideValue: StringValue(''),
        returnOrderText: '',
        returnOrderDesc: '',
        principal: '',
        bapiSalesDocNumber: '',
        eZRxNumber: '',
        bapiStatus: '',
        cnNumber: '',
        status: ReturnSummaryStatus(''),
        statusReason: '',
        priceOverride: '',
        remarks: '',
        sendForDestruction: false,
        returnToStock: false,
        quarantine: false,
        productRecall: false,
        returnType: '',
        returnTypeDesc: '',
        purchaseNumberCOverride: '',
        purchaseNumberC: '',
        ppaHeld: false,
        outsidePolicy: false,
        attachments: [],
      );

  List<PoDocuments> get attachmentsUploadByUserUrlToPoDocuments =>
      attachmentUrl.isNotEmpty
          ? attachmentUrl
              .map(
                (attachments) => PoDocuments(
                  url: attachments,
                  name: Uri.parse(attachments).pathSegments.last,
                ),
              )
              .toList()
          : [PoDocuments.empty().copyWith(name: '-')];
  List<PoDocuments> get attachmentsUploadByApproverUrlToPoDocuments =>
      attachments.isNotEmpty
          ? attachments
              .map(
                (attachments) => PoDocuments(
                  url: attachments,
                  name: Uri.parse(attachments).pathSegments.last,
                ),
              )
              .toList()
          : [PoDocuments.empty().copyWith(name: '-')];

  String get sAPROCreationValue {
    switch (status.getValue()) {
      case 'APPROVED':
      case 'COMPLETED':
      case 'PENDING':
        return bapiStatusType;

      case 'REJECTED':
        return '-';

      default:
        return '-';
    }
  }

  String get bapiStatusType {
    switch (bapiStatus) {
      case 'FAILED':
        return 'Request Failed';
      case 'PENDING':
        return 'Pending';
      case 'SUCCESS':
        return bapiSalesDocNumber;
      case '':
        return '-';

      default:
        return '-';
    }
  }
}

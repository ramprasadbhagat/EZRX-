import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_attachment.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
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
    required String returnTypeDesc,
    required ReturnType returnType,
    required int returnQuantity,
    required double unitPrice,
    required double totalPrice,
    required String returnOrderDesc,
    required MaterialNumber materialNumber,
    required String materialDescription,
    required String batch,
    required String materialGroup,
    required List<String> imageUrl,
    required List<String> attachments,
    required List<ReturnRequestAttachment> attachmentUrl,
    required DateTimeStringValue createdDate,
    required String principal,
    required PrincipalName principalName,
    required String bapiSalesDocNumber,
    required StatusType bapiStatus,
    required StatusType status,
    required StatusReason statusReason,
    required bool outsidePolicy,
    required DateTimeStringValue invoiceDate,
    required Prsfd prsfd,
    required List<ReturnRequestInformation> bonusInformation,
    required Remarks remarks,
    required double overrideValue,
    required int initialQuantity,
    required List<PriceOverrideTrail> priceOverrideTrail,
    required bool isMarketPlace,
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
        attachmentUrl: <ReturnRequestAttachment>[],
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
        returnType: ReturnType(''),
        returnTypeDesc: '',
        returnQuantity: 1,
        status: StatusType(''),
        statusReason: StatusReason(''),
        totalPrice: 0.0,
        unitPrice: 0.0,
        prsfd: Prsfd(''),
        remarks: Remarks(''),
        overrideValue: 0.0,
        initialQuantity: 0,
        priceOverrideTrail: <PriceOverrideTrail>[],
        isMarketPlace: false,
      );

  double get calculatedUnitPrice {
    if (isCounterOfferRequested) {
      return overrideValue;
    }

    return double.parse(
      (totalPrice / returnQuantity).toString(),
    );
  }

  String get displayNAIfBapiStatusIsNotSuccess =>
      bapiStatus.isSuccess ? bapiSalesDocNumber : 'NA';

  bool displayOutSidePolicy(bool allowReturnsOutsidePolicy) =>
      outsidePolicy && allowReturnsOutsidePolicy;

  bool get isCounterOfferRequested => overrideValue > 0;

  bool get isApprovedQuantityOverride =>
      status.isApprovedStatus && initialQuantity > 0;

  // [isApproverOverride] check whether the approver has overridden the return
  // value
  bool get isApproverOverride =>
      priceOverrideTrail.any((element) => element.overrideRole.isApprover);

  // [userOverrideValue] get overridden value from [priceOverrideTrail]
  // done by user end when return status is approved and approver has
  // updated the value.
  double get userOverrideValue => priceOverrideTrail
      .firstWhere(
        (element) => status.isApprovedStatus && element.overrideRole.isUser,
        orElse: () => PriceOverrideTrail.empty(),
      )
      .overrideValue;

  bool get isUnapprovedCounterOffer =>
      !status.isApprovedStatus && isCounterOfferRequested;

  bool get isApprovedCounterOffer =>
      status.isApprovedStatus && isCounterOfferRequested;

  bool get isEmpty => this == ReturnRequestInformation.empty();

  String get displayPrincipalOrSellerCode =>
      isMarketPlace ? 'Seller code' : 'Principal code';

  String get displayPrincipalOrSellerName =>
      isMarketPlace ? 'Seller name' : 'Principal name';

  String get displayBatch => isMarketPlace ? 'NA' : batch;

  String get displayExpiryDate => isMarketPlace ? 'NA' : expiryDate.dateString;
}

@freezed
class PriceOverrideTrail with _$PriceOverrideTrail {
  const PriceOverrideTrail._();

  factory PriceOverrideTrail({
    required double overrideValue,
    required OverrideRole overrideRole,
  }) = _PriceOverrideTrail;

  factory PriceOverrideTrail.empty() => PriceOverrideTrail(
        overrideValue: 0.0,
        overrideRole: OverrideRole(''),
      );
}

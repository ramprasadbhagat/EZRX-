import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_attachment.dart';
import 'package:ezrxmobile/domain/returns/entities/usage.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_item_details.freezed.dart';

@freezed
class ReturnItemDetails with _$ReturnItemDetails {
  const ReturnItemDetails._();

  const factory ReturnItemDetails({
    required MaterialNumber materialNumber,
    required String itemNumber,
    required String assignmentNumber,
    required String batch,
    required ReturnQuantity returnQuantity,
    required Usage usage,
    required List<ReturnRequestAttachment> uploadedFiles,
    required Remarks remarks,
    required bool outsidePolicy,
    required PriceOverrideValue priceOverride,
    required String returnReason,
  }) = _ReturnItemDetails;

  factory ReturnItemDetails.empty() => ReturnItemDetails(
        materialNumber: MaterialNumber(''),
        itemNumber: '',
        assignmentNumber: '',
        batch: '',
        returnQuantity: ReturnQuantity(''),
        usage: Usage.empty(),
        uploadedFiles: <ReturnRequestAttachment>[],
        remarks: Remarks(''),
        outsidePolicy: false,
        priceOverride: PriceOverrideValue(0),
        returnReason: '',
      );

  String get uuid => '$assignmentNumber$itemNumber';

  bool get isValid => returnQuantity.getIntValue > 0 && returnReason.isNotEmpty;

  String returnValueString(double unitPrice) =>
      returnValue(unitPrice).toStringAsFixed(2);

  double returnValue(double unitPrice) =>
      (returnQuantity.getIntValue * unitPrice);
}

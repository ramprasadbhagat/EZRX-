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
    required RangeValue unitPrice,
    required Usage usage,
    required List<ReturnRequestAttachment> uploadedFiles,
    required Remarks remarks,
    required bool outsidePolicy,
    required CounterOfferValue priceOverride,
    required String returnReason,
    required ReturnType returnType,
    required IntegerValue balanceQty,
  }) = _ReturnItemDetails;

  factory ReturnItemDetails.empty() => ReturnItemDetails(
        materialNumber: MaterialNumber(''),
        itemNumber: '',
        assignmentNumber: '',
        batch: '',
        returnQuantity: ReturnQuantity(''),
        unitPrice: RangeValue(''),
        usage: Usage.empty(),
        uploadedFiles: <ReturnRequestAttachment>[],
        remarks: Remarks(''),
        outsidePolicy: false,
        priceOverride: CounterOfferValue(''),
        returnReason: '',
        returnType: ReturnType.returnItem(),
        balanceQty: IntegerValue('0'),
      );

  String get uuid => '$assignmentNumber$itemNumber';

  bool get isValid => returnQuantity.getIntValue > 0 && returnReason.isNotEmpty;

  double get returnValue =>
      returnQuantity.getIntValue *
      ((returnType.isCounterOfferElegible && priceOverride.isValid())
          ? priceOverride.doubleValue
          : unitPrice.getOrDefaultValue(0));
}

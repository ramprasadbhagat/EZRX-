import 'package:ezrxmobile/domain/order/value/value_objects.dart';
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
    required String batch,
    required ReturnQuantity returnQuantity,
    required Usage usage,
    required List<String> poDocuments,
  }) = _ReturnItemDetails;

  factory ReturnItemDetails.empty() => ReturnItemDetails(
        materialNumber: MaterialNumber(''),
        itemNumber: '',
        batch: '',
        returnQuantity: ReturnQuantity(''),
        usage: Usage.empty(),
        poDocuments: [],
      );
}

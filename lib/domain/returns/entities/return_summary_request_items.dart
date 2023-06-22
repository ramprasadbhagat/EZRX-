import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'return_summary_request_items.freezed.dart';

@freezed
class ReturnSummaryRequestItems with _$ReturnSummaryRequestItems {
  const ReturnSummaryRequestItems._();

  factory ReturnSummaryRequestItems({
    required StatusType status,
    required String materialNumber,
    required String materialName,
    required String returnQty,
    required double unitPrice,
    required double total,
  }) = _ReturnSummaryRequestItems;

  factory ReturnSummaryRequestItems.empty() => ReturnSummaryRequestItems(
        status: StatusType(''),
        materialNumber: '',
        materialName: '',
        returnQty: '',
        unitPrice: 0.0,
        total: 0.0,
      );
}

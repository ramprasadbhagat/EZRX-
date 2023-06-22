import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_summary_request_items.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'return_summary_request_items_dto.freezed.dart';
part 'return_summary_request_items_dto.g.dart';

@freezed
class ReturnSummaryRequestItemsDto with _$ReturnSummaryRequestItemsDto {
  const ReturnSummaryRequestItemsDto._();

  const factory ReturnSummaryRequestItemsDto({
    @JsonKey(name: 'materialNumber', defaultValue: '')
        required String materialNumber,
    @JsonKey(name: 'status', defaultValue: '') required String status,
    @JsonKey(name: 'materialName', defaultValue: '')
        required String materialName,
    @JsonKey(name: 'returnQty', defaultValue: '') required String returnQty,
    @JsonKey(name: 'unitPrice', defaultValue: '') required String unitPrice,
    @JsonKey(name: 'total', defaultValue: '') required String total,
  }) = _ReturnSummaryRequestItemsDto;

  factory ReturnSummaryRequestItemsDto.fromDomain(
    ReturnSummaryRequestItems returnSummaryRequestItems,
  ) {
    return ReturnSummaryRequestItemsDto(
      status: returnSummaryRequestItems.status.getOrCrash(),
      materialNumber: returnSummaryRequestItems.materialNumber,
      materialName: returnSummaryRequestItems.materialName,
      returnQty: returnSummaryRequestItems.returnQty,
      unitPrice: returnSummaryRequestItems.unitPrice.toString(),
      total: returnSummaryRequestItems.total.toString(),
    );
  }
  ReturnSummaryRequestItems toDomain() {
    return ReturnSummaryRequestItems(
      status: StatusType(status),
      materialNumber: materialNumber,
      materialName: materialName,
      returnQty: returnQty,
      unitPrice: double.parse(unitPrice),
      total: double.parse(total),
    );
  }

  factory ReturnSummaryRequestItemsDto.fromJson(Map<String, dynamic> json) =>
      _$ReturnSummaryRequestItemsDtoFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';

part 'order_history_details_po_documents_dto.freezed.dart';
part 'order_history_details_po_documents_dto.g.dart';
@freezed
class OrderHistoryDetailsPODocumentsDto with _$OrderHistoryDetailsPODocumentsDto {
  const OrderHistoryDetailsPODocumentsDto._();
  const factory OrderHistoryDetailsPODocumentsDto({
    @JsonKey(name: 'Url') required String url,
    @JsonKey(name: 'Name') required String name,
  }) = _OrderHistoryDetailsPODocumentsDto;
  factory OrderHistoryDetailsPODocumentsDto.fromDomain( OrderHistoryDetailsPODocuments orderHistoryDetailsPODocuments) {
    return  OrderHistoryDetailsPODocumentsDto(
      url: orderHistoryDetailsPODocuments.url,
      name: orderHistoryDetailsPODocuments.name,
       );
  }

  OrderHistoryDetailsPODocuments toDomain() {
    return OrderHistoryDetailsPODocuments(
      url: url,
      name: name,
    );
  }
 
  factory OrderHistoryDetailsPODocumentsDto.fromJson(Map<String, dynamic> json) =>
      _$OrderHistoryDetailsPODocumentsDtoFromJson(json);
}

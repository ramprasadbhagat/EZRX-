import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_readvalue_helper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';

part 'order_history_details_po_documents_dto.freezed.dart';
part 'order_history_details_po_documents_dto.g.dart';

@freezed
class PoDocumentsDto with _$PoDocumentsDto {
  const PoDocumentsDto._();
  const factory PoDocumentsDto({
    @JsonKey(
      name: 'url',
      defaultValue: '',
      readValue: JsonReadValueHelper.readUrl,
    )
    required String url,
    @JsonKey(
      name: 'name',
      defaultValue: '',
      readValue: JsonReadValueHelper.readFileName,
    )
    required String name,
    @JsonKey(
      name: 'path',
      defaultValue: '',
      readValue: JsonReadValueHelper.readUrl,
    )
    required String path,
  }) = _PoDocumentsDto;
  factory PoDocumentsDto.fromDomain(
    PoDocuments orderHistoryDetailsPODocuments,
  ) {
    return PoDocumentsDto(
      url: orderHistoryDetailsPODocuments.url,
      name: orderHistoryDetailsPODocuments.name,
      path: orderHistoryDetailsPODocuments.url,
    );
  }

  PoDocuments toDomain() {
    return PoDocuments(
      url: url,
      name: name,
      size: FileSize(0),
    );
  }

  factory PoDocumentsDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PoDocumentsDtoFromJson(json);
}

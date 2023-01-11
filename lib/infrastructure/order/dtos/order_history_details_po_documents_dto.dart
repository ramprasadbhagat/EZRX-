import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';

part 'order_history_details_po_documents_dto.freezed.dart';
part 'order_history_details_po_documents_dto.g.dart';

@freezed
class PoDocumentsDto with _$PoDocumentsDto {
  const PoDocumentsDto._();
  const factory PoDocumentsDto({
    @JsonKey(name: 'url', defaultValue: '', readValue: _readUrl)
        required String url,
    @JsonKey(name: 'name', defaultValue: '', readValue: _readName)
        required String name,
  }) = _PoDocumentsDto;
  factory PoDocumentsDto.fromDomain(
    PoDocuments orderHistoryDetailsPODocuments,
  ) {
    return PoDocumentsDto(
      url: orderHistoryDetailsPODocuments.url,
      name: orderHistoryDetailsPODocuments.name,
    );
  }

  PoDocuments toDomain() {
    return PoDocuments(
      url: url,
      name: name,
    );
  }

  factory PoDocumentsDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$PoDocumentsDtoFromJson(json);
}

String _readUrl(Map json, String key) => json['Url'] ?? json['url'] ?? '';

String _readName(Map json, String key) =>
    json[key] ?? json['Name'] ?? json['filename'] ?? '';

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_details_po_documents_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PoDocumentsDtoImpl _$$PoDocumentsDtoImplFromJson(Map<String, dynamic> json) =>
    _$PoDocumentsDtoImpl(
      url: _readUrl(json, 'url') as String? ?? '',
      name: _readName(json, 'name') as String? ?? '',
      path: _readUrl(json, 'path') as String? ?? '',
    );

Map<String, dynamic> _$$PoDocumentsDtoImplToJson(
        _$PoDocumentsDtoImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'name': instance.name,
      'path': instance.path,
    };

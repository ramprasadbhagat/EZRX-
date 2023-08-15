// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FAQItemDto _$$_FAQItemDtoFromJson(Map<String, dynamic> json) =>
    _$_FAQItemDto(
      name: json['name'] as String,
      answer: getAnswer(json, 'answer') as String,
      question: getQuestion(json, 'question') as String,
      displayName: getCategory(json, 'category') as String,
    );

Map<String, dynamic> _$$_FAQItemDtoToJson(_$_FAQItemDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'answer': instance.answer,
      'question': instance.question,
      'category': instance.displayName,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FAQItemDtoImpl _$$FAQItemDtoImplFromJson(Map<String, dynamic> json) =>
    _$FAQItemDtoImpl(
      name: json['name'] as String,
      answer: getAnswer(json, 'answer') as String,
      question: getQuestion(json, 'question') as String,
      displayName: getCategory(json, 'category') as String,
    );

Map<String, dynamic> _$$FAQItemDtoImplToJson(_$FAQItemDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'answer': instance.answer,
      'question': instance.question,
      'category': instance.displayName,
    };

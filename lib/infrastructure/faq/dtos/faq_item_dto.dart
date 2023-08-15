import 'package:ezrxmobile/domain/faq/entity/faq_item.dart';
import 'package:ezrxmobile/domain/faq/value/value_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'faq_item_dto.freezed.dart';
part 'faq_item_dto.g.dart';

@freezed
class FAQItemDto with _$FAQItemDto {
  const FAQItemDto._();

  const factory FAQItemDto({
    required String name,
    @JsonKey(name: 'answer', readValue: getAnswer) required String answer,
    @JsonKey(name: 'question', readValue: getQuestion) required String question,
    @JsonKey(name: 'category', readValue: getCategory)
    required String displayName,
  }) = _FAQItemDto;

  factory FAQItemDto.fromJson(Map<String, dynamic> json) =>
      _$FAQItemDtoFromJson(json);

  FAQItem get toDomain => FAQItem(
        question: question,
        answer: answer,
        category: FAQCategory(displayName),
      );
}

String getQuestion(Map json, String key) => json[key]?['value'] ?? '';
String getAnswer(Map json, String key) => json[key]?['value'] ?? '';
String getCategory(Map json, String key) => json[key]?['displayName'] ?? '';

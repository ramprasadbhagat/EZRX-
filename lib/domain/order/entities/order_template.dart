import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_template.freezed.dart';

@freezed
class OrderTemplate with _$OrderTemplate {
  const OrderTemplate._();

  const factory OrderTemplate({
    required String templateId,
    required String templateName,
    required List<PriceAggregate> cartItems,
    required Map<String, dynamic> user,
  }) = _OrderTemplate;

  factory OrderTemplate.empty() => const OrderTemplate(
        templateId: '',
        templateName: '',
        cartItems: <PriceAggregate>[],
        user: <String, dynamic>{},
      );
}

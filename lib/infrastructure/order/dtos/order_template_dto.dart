import 'dart:convert';

import 'package:ezrxmobile/domain/order/entities/order_template.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/user_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/order_template_material_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_template_dto.freezed.dart';
part 'order_template_dto.g.dart';

@freezed
class OrderTemplateDto with _$OrderTemplateDto {
  const OrderTemplateDto._();
  const factory OrderTemplateDto({
    @JsonKey(name: 'id') required String templateId,
    @JsonKey(name: 'name', defaultValue: '') required String templateName,
    @Default(UserDto.emptyUserDto) @JsonKey(name: 'user') UserDto user,
    @_CartItemListConverter()
    @JsonKey(name: 'cartList', defaultValue: <OrderTemplateMaterialDto>[])
        required List<OrderTemplateMaterialDto> items,
  }) = _OrderTemplateDto;

  factory OrderTemplateDto.fromDomain(OrderTemplate orderTemplate) {
    return OrderTemplateDto(
      templateId: orderTemplate.templateId,
      templateName: orderTemplate.templateName,
      user: UserDto.fromDomain(orderTemplate.user),
      items: orderTemplate.items
          .map((e) => OrderTemplateMaterialDto.fromDomain(e))
          .toList(),
    );
  }

  OrderTemplate toDomain() {
    return OrderTemplate(
      templateId: templateId,
      templateName: templateName,
      user: user.toDomain(),
      items: items.map((e) => e.toDomain()).toList(),
    );
  }

  factory OrderTemplateDto.fromJson(Map<String, dynamic> json) =>
      _$OrderTemplateDtoFromJson(json);
}

class _CartItemListConverter
    extends JsonConverter<List<OrderTemplateMaterialDto>, String> {
  const _CartItemListConverter();

  @override
  List<OrderTemplateMaterialDto> fromJson(String json) {
    return List.from(jsonDecode(json))
        .map((e) => OrderTemplateMaterialDto.fromJson(e))
        .toList();
  }

  @override
  String toJson(List<OrderTemplateMaterialDto> object) {
    return object.map((e) => e.toJson()).toList().toString();
  }
}

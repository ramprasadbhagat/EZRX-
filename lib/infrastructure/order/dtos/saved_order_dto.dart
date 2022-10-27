import 'dart:convert';

import 'package:ezrxmobile/domain/order/entities/saved_order.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_item_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_order_dto.freezed.dart';
part 'saved_order_dto.g.dart';

@freezed
class SavedOrderDto with _$SavedOrderDto {
  const SavedOrderDto._();

  const factory SavedOrderDto({
    @JsonKey(name: 'id', defaultValue: '') required String id,
    @_OrderProductItemListConverter()
    @JsonKey(name: 'itemlist', defaultValue: <MaterialItemDto>[])
        required List<MaterialItemDto> items,
    @JsonKey(name: 'draftorder', defaultValue: false)
        required bool isDraftOrder,
    @JsonKey(name: 'BillingDocument', defaultValue: '')
        required String billingDocument,
    @JsonKey(name: 'eZRxNumber', defaultValue: '') required String eZRxNumber,
    @JsonKey(name: 'SoldToParty', defaultValue: '') required String soldToParty,
    @JsonKey(name: 'ShipToParty', defaultValue: '') required String shipToParty,
    @JsonKey(name: 'CompanyName', defaultValue: '') required String companyName,
    @JsonKey(name: 'TotalOrderValue', defaultValue: 0)
        required num totalOrderValue,
    @JsonKey(name: 'requestedDeliveryDate', defaultValue: '')
        required String requestedDeliveryDate,
  }) = _SavedOrderDto;

  SavedOrder toDomain() {
    return SavedOrder(
      id: id,
      items: items.map((e) => e.toDomain()).toList(),
      isDraftOrder: isDraftOrder,
      isSelected: false,
      isDeleted: false,
      billingDocument: billingDocument,
      eZRxNumber: eZRxNumber,
      soldToParty: SoldToParty(soldToParty),
      shipToParty: ShipToParty(shipToParty),
      companyName: CompanyName(companyName),
      totalOrderValue: totalOrderValue,
      requestedDeliveryDate: requestedDeliveryDate,
    );
  }

  factory SavedOrderDto.fromJson(Map<String, dynamic> json) =>
      _$SavedOrderDtoFromJson(json);
}

class _OrderProductItemListConverter
    extends JsonConverter<List<MaterialItemDto>, String> {
  const _OrderProductItemListConverter();

  @override
  List<MaterialItemDto> fromJson(String json) {
    return List.from(jsonDecode(json)['value'])
        .map((e) => MaterialItemDto.fromJson(e))
        .toList();
  }

  @override
  String toJson(List<MaterialItemDto> object) {
    return {
      'value': object.map((e) => e.toJson()).toList(),
    }.toString();
  }
}

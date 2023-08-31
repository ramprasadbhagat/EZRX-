import 'package:ezrxmobile/domain/order/entities/order_history_details_order_item.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_history_details_order_item_dto.freezed.dart';
part 'order_history_details_order_item_dto.g.dart';

@freezed
class OrderItemDto with _$OrderItemDto {
  const OrderItemDto._();

  const factory OrderItemDto({
    @JsonKey(name: 'MaterialCode', defaultValue: '')
        required String materialCode,
    @JsonKey(name: 'MaterialDescription', defaultValue: '')
        required String materialDescription,
    @JsonKey(name: 'DefaultMaterialDescription', defaultValue: '')
        required String defaultMaterialDescription,
  }) = _OrderItemDto;

  factory OrderItemDto.fromDomain(
    OrderItem orderItem,
  ) {
    return OrderItemDto(
      materialCode: orderItem.materialCode.getValue(),
      materialDescription: orderItem.materialDescription,
      defaultMaterialDescription: orderItem.defaultMaterialDescription,
    );
  }

  OrderItem get toDomain {
    return OrderItem(
      materialCode: MaterialNumber(materialCode),
      materialDescription: materialDescription,
      defaultMaterialDescription: defaultMaterialDescription,
    );
  }

  factory OrderItemDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$OrderItemDtoFromJson(json);
}

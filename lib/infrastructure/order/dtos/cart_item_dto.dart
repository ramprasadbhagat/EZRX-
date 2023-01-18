import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_aggregate_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'cart_item_dto.freezed.dart';
part 'cart_item_dto.g.dart';

@freezed
class CartItemDto with _$CartItemDto {
  const CartItemDto._();
  @HiveType(typeId: 21, adapterName: 'CartItemDtoAdapter')
  const factory CartItemDto({
    @JsonKey(name: 'materials')
    @HiveField(0, defaultValue: [])
        required List<PriceAggregateDto> materials,
    @JsonKey(name: 'type')
    @HiveField(1, defaultValue: CartItemType.material)
        required CartItemType itemType,
    @JsonKey(name: 'isSelected')
    @HiveField(2, defaultValue: true)
        required bool isSelected,
  }) = _CartItemDto;

  factory CartItemDto.fromDomain(CartItem item) => CartItemDto(
        materials: item.materials
            .map(
              (material) => PriceAggregateDto.fromDomain(material),
            )
            .toList(),
        itemType: item.itemType,
        isSelected: item.isSelected,
      );

  CartItem get toDomain => CartItem(
        materials: materials.map((item) => item.toDomain()).toList(),
        itemType: itemType,
        isSelected: isSelected,
      );
}

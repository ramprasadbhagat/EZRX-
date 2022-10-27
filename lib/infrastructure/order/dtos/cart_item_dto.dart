import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_dto.dart';
import 'package:hive/hive.dart';

part 'cart_item_dto.g.dart';

@HiveType(typeId: 2)
class CartItemDto {
  CartItemDto({
    required this.materialDto,
    required this.quantity,
  });

  @HiveField(0)
  MaterialDto materialDto;
  @HiveField(1)
  int quantity;

  factory CartItemDto.fromDomain(CartItem cart) {
    return CartItemDto(
      materialDto: MaterialDto.fromDomain(cart.materialInfo),
      quantity: cart.quantity,
    );
  }

  CartItem toDomain() {
    return CartItem(
      materialInfo: materialDto.toDomain(),
      quantity: quantity,
    );
  }
}

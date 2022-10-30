import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_dto.dart';
import 'package:hive/hive.dart';

part 'cart_item_dto.g.dart';

@HiveType(typeId: 2)
class CartItemDto {
  CartItemDto({
    required this.materialDto,
    required this.quantity,
    // required this.salesOrganisationConfigsDto,
    // required this.priceDto,
  });

  @HiveField(0)
  MaterialDto materialDto;
  @HiveField(1)
  int quantity;
  // @HiveField(2)
  // PriceDto priceDto;
  // @HiveField(3)
  // SalesOrganisationConfigsDto salesOrganisationConfigsDto;

  factory CartItemDto.fromDomain(CartItem cart) {
    return CartItemDto(
      materialDto: MaterialDto.fromDomain(cart.materialInfo),
      quantity: cart.quantity,
      // priceDto: PriceDto.fromDomain(cart.price),
      // salesOrganisationConfigsDto: SalesOrganisationConfigsDto.fromDomain(
      //   cart.salesOrgConfig,
      // ),
    );
  }

  CartItem toDomain() {
    return CartItem(
      materialInfo: materialDto.toDomain(),
      quantity: quantity,
      price: Price.empty(),
      salesOrgConfig: SalesOrganisationConfigs.empty(),
      // price: priceDto.toDomain(),
      // salesOrgConfig: salesOrganisationConfigsDto.toDomain(),
    );
  }
}

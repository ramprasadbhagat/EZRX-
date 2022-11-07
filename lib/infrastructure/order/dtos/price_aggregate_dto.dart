import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/sales_organisation_configs_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_dto.dart';
import 'package:hive/hive.dart';

part 'price_aggregate_dto.g.dart';

@HiveType(typeId: 2, adapterName: 'PriceAggregateDtoAdapter')
class PriceAggregateDto {
  PriceAggregateDto({
    required this.materialDto,
    required this.quantity,
    required this.priceDto,
    required this.salesOrganisationConfigsDto,
    required this.zmgMaterialCountOnCart,
  });

  @HiveField(0)
  MaterialDto materialDto;
  @HiveField(1)
  int quantity;
  @HiveField(2)
  PriceDto priceDto;
  @HiveField(3)
  SalesOrganisationConfigsDto salesOrganisationConfigsDto;
  @HiveField(4)
  int zmgMaterialCountOnCart;

  factory PriceAggregateDto.fromDomain(PriceAggregate cart) {
    return PriceAggregateDto(
      materialDto: MaterialDto.fromDomain(cart.materialInfo),
      quantity: cart.quantity,
      priceDto: PriceDto.fromDomain(cart.price),
      salesOrganisationConfigsDto: SalesOrganisationConfigsDto.fromDomain(
        cart.salesOrgConfig,
      ),
      zmgMaterialCountOnCart: cart.zmgMaterialCountOnCart,
    );
  }

  PriceAggregate toDomain() {
    return PriceAggregate(
      materialInfo: materialDto.toDomain(),
      quantity: quantity,
      price: priceDto.toDomain(),
      // price: Price.empty(),
      salesOrgConfig: salesOrganisationConfigsDto.toDomain(),
      // salesOrgConfig: SalesOrganisationConfigs.empty(),
      zmgMaterialCountOnCart: zmgMaterialCountOnCart,
    );
  }
}

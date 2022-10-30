import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item.freezed.dart';

@freezed
class CartItem with _$CartItem {
  const CartItem._();

  const factory CartItem({
    required Price price,
    required MaterialInfo materialInfo,
    required SalesOrganisationConfigs salesOrgConfig,
    required int quantity,
  }) = _CartItem;

  factory CartItem.empty() => CartItem(
        price: Price.empty(),
        materialInfo: MaterialInfo.empty(),
        salesOrgConfig: SalesOrganisationConfigs.empty(),
        quantity: 1,
      );

  String listPrice() {
    if (price.finalPrice.isEmpty() || materialInfo.hidePrice) return 'NA';
    final listPrice = price.finalPrice.getOrDefaultValue(0);

    return '${salesOrgConfig.currency.code} ${listPrice.toStringAsFixed(2)}';
  }

  String unitPrice() {
    if (price.finalPrice.isEmpty() || materialInfo.hidePrice) return 'NA';
    final unitPrice = price.finalPrice.getOrDefaultValue(0);
    final newPrice = salesOrgConfig.enableVat
        ? unitPrice + (unitPrice * (salesOrgConfig.vatValue / 100))
        : unitPrice;

    return '${salesOrgConfig.currency.code} ${newPrice.toStringAsFixed(2)}';
  }

  String listPriceTotal() {
    if (price.finalPrice.isEmpty() || materialInfo.hidePrice) return 'NA';
    final listPrice = price.finalPrice.getOrDefaultValue(0);
    final newPrice = listPrice * quantity;

    return '${salesOrgConfig.currency.code} ${newPrice.toStringAsFixed(2)}';
  }

  String unitPriceTotal() {
    if (price.finalPrice.isEmpty() || materialInfo.hidePrice) return 'NA';
    final unitPrice = price.finalPrice.getOrDefaultValue(0);
    final newPrice = salesOrgConfig.enableVat
        ? (unitPrice + (unitPrice * (salesOrgConfig.vatValue / 100))) * quantity
        : unitPrice * quantity;

    return '${salesOrgConfig.currency.code} ${newPrice.toStringAsFixed(2)}';
  }
}

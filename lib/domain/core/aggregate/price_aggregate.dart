import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/price_tier.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'price_aggregate.freezed.dart';

@freezed
class PriceAggregate with _$PriceAggregate {
  const PriceAggregate._();
  const factory PriceAggregate({
    required Price price,
    required MaterialInfo materialInfo,
    required SalesOrganisationConfigs salesOrgConfig,
    required int quantity,
    required int zmgMaterialCountOnCart,
    required bool isOverride,
  }) = _PriceAggregate;

  factory PriceAggregate.empty() => PriceAggregate(
        price: Price.empty(),
        materialInfo: MaterialInfo.empty(),
        salesOrgConfig: SalesOrganisationConfigs.empty(),
        quantity: 1,
        zmgMaterialCountOnCart: 0,
        isOverride: false,
      );

  double get listPrice {
    if (price.zmgDiscount) return tirePriceforZMG;

    return price.finalPrice.getOrDefaultValue(0);
  }

  double get unitPrice {
    final value = listPrice;

    if (salesOrgConfig.enableVat) {
      return value + (value * (salesOrgConfig.vatValue / 100));
    } else if (materialInfo.taxClassification.isNoTax()) {
      return value;
    } else if (salesOrgConfig.enableTaxClassification) {
      return value + (value * (double.parse(materialInfo.taxes.first) / 100));
    }

    return value;

    // Backup Logic from value Object
    // finalPrice = isVNUser
    // ? enableVat && enableTaxClassification
    //     ? value +
    //         (value * ((taxes).isNotEmpty ? double.parse(taxes[0]) * 0.01 : 0))
    //     : value
    // : enableTaxClassification && !taxClassification.isExempt()
    //     ? !taxClassification.isNoTax()
    //         ? value + (value * vatValue * 0.01)
    //         : value
    //     : value;
  }

  double get priceBeforeGst {
    if (salesOrgConfig.currency.isVN &&
        salesOrgConfig.enableTaxClassification) {
      return listPrice / (1 + double.parse(materialInfo.taxes[0]) * 0.01);
    } else if (!salesOrgConfig.currency.isVN &&
        materialInfo.taxClassification.isFullTax) {
      return listPrice / (1 + salesOrgConfig.vatValue * 0.01);
    }

    return listPrice;
  }

  bool get isEnableVat {
    return salesOrgConfig.enableVat;
  }

  double get listPriceTotal {
    return listPrice * quantity;
  }

  double get unitPriceTotal {
    return unitPrice * quantity;
  }

  double get tirePriceforZMG => price.priceTireItem
      .firstWhere(
        (element) => zmgMaterialTotalCount >= element.quantity,
        orElse: () => PriceTierItem.empty(),
      )
      .rate;

  int get zmgMaterialTotalCount =>
      zmgMaterialCountOnCart != 0 ? zmgMaterialCountOnCart : quantity;

  double getNewPrice() {
    final newPrice = materialInfo.taxClassification.isExempt()
        ? price.finalPrice.getOrCrash()
        : ((price.finalPrice.getOrCrash()) /
            (1 +
                (materialInfo.taxClassification.isNoTax()
                    ? salesOrgConfig.vatValue
                    : 0)));

    return newPrice;
  }

  String display(PriceType priceType) {
    if (price.isFOC) return 'FOC';
    if (price.finalPrice.isUnavailable() ||
        materialInfo.hidePrice ||
        !price.isValid) return 'NA';

    double result;
    switch (priceType) {
      case PriceType.unitPrice:
        result = unitPrice;
        break;
      case PriceType.listPriceTotal:
        result = listPriceTotal;
        break;
      case PriceType.unitPriceTotal:
        result = unitPriceTotal;
        break;
      case PriceType.unitPriceBeforeGst:
        result = priceBeforeGst;
        break;
      case PriceType.listPrice:
      default:
        result = listPrice;
        break;
    }

    if (salesOrgConfig.currency.isVN) {
      return '${result.toStringAsFixed(2)} ${salesOrgConfig.currency.code}';
    }

    return '${salesOrgConfig.currency.code} ${result.toStringAsFixed(2)}';
  }

  bool get isDefaultMDEnabled {
    return salesOrgConfig.enableDefaultMD &&
        materialInfo.defaultMaterialDescription.isNotEmpty;
  }
}

enum PriceType {
  listPrice,
  unitPrice,
  listPriceTotal,
  unitPriceTotal,
  unitPriceBeforeGst,
}

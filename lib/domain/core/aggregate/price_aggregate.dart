import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_template_material.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/saved_order_material.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'price_aggregate.freezed.dart';

@freezed
class PriceAggregate with _$PriceAggregate {
  const PriceAggregate._();

  const factory PriceAggregate({
    required Price price,
    required MaterialInfo materialInfo,
    required Bundle bundle,
    required SalesOrganisationConfigs salesOrgConfig,
    required int quantity,
    required int discountedMaterialCount,
    required List<MaterialInfo> addedBonusList,
    required StockInfo stockInfo,
  }) = _PriceAggregate;

  factory PriceAggregate.empty() => PriceAggregate(
        price: Price.empty(),
        materialInfo: MaterialInfo.empty(),
        bundle: Bundle.empty(),
        salesOrgConfig: SalesOrganisationConfigs.empty(),
        quantity: 1,
        discountedMaterialCount: 0,
        addedBonusList: [],
        stockInfo: StockInfo.empty(),
      );

  OrderTemplateMaterial toOrderTemplateMaterial() {
    return OrderTemplateMaterial(
      materialNumber: materialInfo.materialNumber,
      materialGroup4: materialInfo.materialGroup4,
      qty: quantity,
      principalName: materialInfo.principalData.principalName,
      materialDescription: materialInfo.materialDescription,
      hidePrice: materialInfo.hidePrice,
      hasValidTenderContract: materialInfo.hasValidTenderContract,
      taxClassification: materialInfo.taxClassification,
      type: '',
    );
  }

  SavedOrderMaterial toSavedOrderMaterial() {
    return SavedOrderMaterial.empty().copyWith(
      materialNumber: materialInfo.materialNumber,
      qty: quantity,
      defaultMaterialDescription: materialInfo.materialDescription,
      type: 'Comm',
      itemRegistrationNumber: materialInfo.itemRegistrationNumber,
      unitOfMeasurement: materialInfo.unitOfMeasurement,
      // zdp8Override: isOverride,
      hidePrice: materialInfo.hidePrice,
      materialGroup2: materialInfo.materialGroup2,
      materialGroup4: materialInfo.materialGroup4,
    );
  }

  double get listPrice {
    if (price.isDiscountEligible) return discountedListPrice;

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

  double get discountedListPrice => price.priceTireItem
      .firstWhere(
        (element) => discountedMaterialCount >= element.quantity,
        orElse: () => price.priceTireItem.last,
      )
      .rate;

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
        !price.isValid ||
        !price.isValidMaterial) return 'NA';

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

    return StringUtils.displayPrice(salesOrgConfig, result);
  }

  bool get isDefaultMDEnabled {
    return salesOrgConfig.enableDefaultMD &&
        materialInfo.defaultMaterialDescription.isNotEmpty;
  }

  bool get isFromBundle => bundle != Bundle.empty();

  String get materialNumberString {
    final materialNumberFromPrice = price.materialNumber.getOrDefaultValue('');
    final materialNumberFromInfo =
        materialInfo.materialNumber.getOrDefaultValue('');

    return materialNumberFromPrice.isEmpty
        ? materialNumberFromInfo
        : materialNumberFromPrice;
  }

  MaterialNumber get getMaterialNumber => materialInfo.materialNumber;

  String? get taxDetails {
    return salesOrgConfig.currency.isVN
        ? materialInfo.getTotalTax(salesOrgConfig.enableTaxDisplay)
        : materialInfo.getTaxClassification(
            salesOrgConfig.enableTaxDisplay,
            salesOrgConfig.enableTaxClassification,
          );
  }
}

enum PriceType {
  listPrice,
  unitPrice,
  listPriceTotal,
  unitPriceTotal,
  unitPriceBeforeGst,
}

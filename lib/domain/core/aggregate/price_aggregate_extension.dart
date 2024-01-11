part of 'price_aggregate.dart';

extension ComboDealExtension on PriceAggregate {
  String get comboDealId => '${price.comboDeal.id}-${comboDeal.scheme.name}';

  PriceAggregate copyWithComboDealMinQty(ComboDeal comboDeal) {
    final materialWithDeal = copyWith(
      comboDeal: comboDeal,
    );

    final minQty = materialWithDeal.selfComboDeal.minQty;

    return materialWithDeal.copyWith(
      quantity: minQty == 0 ? 1 : minQty,
    );
  }

  bool containComboDealInCart(String comboDealId) {
    return materialInfo.type.typeCombo &&
        comboMaterials.any(
          (comboMaterial) => comboMaterial.comboDeals.id == comboDealId,
        );
  }

  ComboDealMaterial get selfComboDeal => comboDeal.singleDeal(
        materialNumber: getMaterialNumber,
      );

  double get comboDealListPrice => price.lastPrice.getOrDefaultValue(0);

  double get comboDealTotalListPrice => comboDealListPrice * quantity;

  double comboDealUnitPrice({
    DiscountInfo? discount,
  }) {
    final discountInfo = discount ?? selfComboDeal.discountInfo;

    if (discountInfo.type.isPercent) {
      return NumUtils.priceByRate(
        comboDealListPrice,
        discountInfo.rate,
      );
    }
    if (discountInfo.type.isAmount) {
      return discountInfo.rate;
    }

    return comboDealListPrice;
  }

  double comboDealTotalUnitPrice({
    DiscountInfo? discount,
  }) =>
      comboDealUnitPrice(discount: discount) * quantity;

  bool get selfComboDealEligible => quantity >= selfComboDeal.minQty;

  List<PriceAggregate> get convertComboItemToPriceAggregateList =>
      comboMaterials
          .map(
            (item) => PriceAggregate.empty().copyWith(
              price: price.copyWith(
                comboDeal: item.comboDeals,
                isValid: item.valid,
                lastPrice: MaterialPrice(item.listPrice),
              ),
              quantity: item.quantity,
              materialInfo: materialInfo.copyWith(
                materialNumber: item.productId,
                principalData: item.principalData,
                materialDescription: item.materialDescription,
                parentID: item.parentId,
              ),
            ),
          )
          .toList();

  Map<MaterialNumber, int> get comboMaterialsCurrentQuantity => Map.fromEntries(
        comboMaterials.map(
          (comboMaterialItem) =>
              MapEntry(comboMaterialItem.productId, comboMaterialItem.quantity),
        ),
      );
}

extension PriceAggregateExtension on List<PriceAggregate> {
  List<MaterialNumber> get materialNumbers => map(
        (e) => e.getMaterialNumber,
      ).toList();

  List<MaterialInfo> get materialInfos => map(
        (e) => e.materialInfo,
      ).toList();

  Map<MaterialNumber, PriceAggregate> get mapByMaterialNumber => {
        for (final material in this) material.getMaterialNumber: material,
      };

  ComboDeal get firstComboDeal => isEmpty ? ComboDeal.empty() : first.comboDeal;

  PriceComboDeal get firstPriceComboDeal =>
      isEmpty ? PriceComboDeal.empty() : first.price.comboDeal;

  List<PriceAggregate> get preOrderItems => where(
        (element) =>
            element.isPreOrder && (!element.materialInfo.type.typeCombo),
      ).toList();

  List<PriceAggregate> get priceAggregateWithDiscountedCount => map(
        (item) => item.price.isTireDiscountEligible
            ? item.copyWith(
                discountedMaterialCount: item.quantity,
              )
            : item,
      ).toList();

  double get originalTotalAmount => fold<double>(
        0,
        (previousValue, element) => previousValue + element.listPriceTotal,
      );

  int get totalComboQuantity => fold<int>(
        0,
        (previousValue, element) => previousValue + element.quantity,
      );

  List<ComboMaterialItem> get comboMaterialItemList => map(
        (product) {
          final materialComboDeal = product.selfComboDeal;

          final totalQuantityUnit =
              product.comboDeal.scheme == ComboDealScheme.k3
                  ? length
                  : totalComboQuantity;

          final comboMaterialItemRate = product.comboDeal.getMaterialComboRate(
            materialNumber: product.getMaterialNumber,
            currentTotalAmount: originalTotalAmount,
            totalQuantityUnit: totalQuantityUnit,
          );

          return ComboMaterialItem(
            comboDeals: product.price.comboDeal,
            isComboEligible: product.price.comboDeal.isEligible,
            valid: product.price.isValid,
            quantity: product.quantity,
            listPrice: product.listPrice,
            finalIndividualPrice: product.getComboOfferPriceWithDiscount(
              comboDealRate: comboMaterialItemRate,
            ),
            productId: product.getMaterialNumber,
            principalData: product.materialInfo.principalData,
            materialDescription: product.materialInfo.materialDescription,
            minQty: materialComboDeal.minQty,
            conditionNumber: materialComboDeal.conditionNumber,
            mandatory: materialComboDeal.mandatory,
            suffix: materialComboDeal.suffix.stringValue,
            setNo: product.comboDeal.getSetNo(
              materialNumber: product.getMaterialNumber,
            ),
            comboDealType: product.comboDeal.scheme.comboDealType,
            parentId: product.materialInfo.parentID,
            rate: comboMaterialItemRate,
            materialInfo: product.materialInfo,
            salesOrgConfig: product.salesOrgConfig,
          );
        },
      ).toList();
}

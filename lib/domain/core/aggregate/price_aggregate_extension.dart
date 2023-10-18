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
                principalData: materialInfo.principalData.copyWith(
                  principalCode: item.principalCode,
                  principalName: item.principalName,
                ),
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

  Map<MaterialNumber, PriceAggregate> get mapByMaterialNumber => {
        for (final material in this) material.getMaterialNumber: material,
      };

  ComboDeal get firstComboDeal => isEmpty ? ComboDeal.empty() : first.comboDeal;

  PriceComboDeal get firstPriceComboDeal =>
      isEmpty ? PriceComboDeal.empty() : first.price.comboDeal;

  List<PriceAggregate> get preOrderItems => where(
        (element) => element.isPreOrder,
      ).toList();

  List<PriceAggregate> get priceAggregateWithDiscountedCount => map(
        (item) => item.price.isTireDiscountEligible
            ? item.copyWith(
                discountedMaterialCount: item.quantity,
              )
            : item,
      ).toList();

  List<ComboMaterialItem> get comboMaterialItemList => map(
        (product) {
          final materialComboDeal = product.selfComboDeal;

          return ComboMaterialItem(
            comboDeals: product.price.comboDeal,
            isComboEligible: product.price.comboDeal.isEligible,
            valid: product.price.isValid,
            quantity: product.quantity,
            listPrice: product.listPrice,
            finalIndividualPrice: product.comboOfferPrice,
            productId: product.getMaterialNumber,
            principalName: product.materialInfo.principalData.principalName,
            principalCode: product.materialInfo.principalData.principalCode,
            materialDescription: product.materialInfo.materialDescription,
            minQty: materialComboDeal.minQty,
            conditionNumber: materialComboDeal.conditionNumber,
            mandatory: materialComboDeal.mandatory,
            rate: materialComboDeal.rate,
            suffix: materialComboDeal.suffix.stringValue,
            setNo: product.comboDeal.getSetNo(
              materialNumber: product.getMaterialNumber,
            ),
            comboDealType: product.comboDeal.comboDealType,
            language: product.salesOrgConfig.getConfigLanguageDefaultEnglish,
            parentId: product.materialInfo.parentID,
          );
        },
      ).toList();
}

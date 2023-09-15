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
}

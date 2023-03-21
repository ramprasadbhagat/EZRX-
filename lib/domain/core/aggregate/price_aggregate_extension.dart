part of 'price_aggregate.dart';

extension ComboDealExtension on PriceAggregate {
  String get comboDealId => '${price.comboDeal.id}-${comboDeal.scheme.name}';

  PriceAggregate copyWithComboDeal(ComboDeal comboDeal) {
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

  //TODO: Currently, we only handled the case when rate type is percent. May be we need to revisit and implement other case
  double comboDealUnitPrice({
    double? rate,
  }) =>
      NumUtils.priceByRate(
        comboDealListPrice,
        rate ?? selfComboDeal.rate,
      );

  double comboDealTotalUnitPrice({
    double? rate,
  }) =>
      comboDealUnitPrice(rate: rate) * quantity;

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
}

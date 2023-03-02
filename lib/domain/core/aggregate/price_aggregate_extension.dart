part of 'price_aggregate.dart';

extension ComboDealExtension on PriceAggregate {
  String get comboDealId => '${price.comboDeal.id}-${comboDeal.scheme.name}';

  ComboDealMaterial get selfComboDeal => comboDeal.singleDeal(
        materialNumber: getMaterialNumber,
      );

  double get comboDealListPrice => price.lastPrice.getOrDefaultValue(0);

  double get comboDealTotalListPrice => comboDealListPrice * quantity;

  double get comboDealUnitPrice {
    //TODO: Currently, we only handled the case when rate type is percent. May be we need to revisit and implement other case
    //TODO: Handle price for 1 qty for another scheme here
    switch (comboDeal.scheme) {
      case ComboDealScheme.k1:
        return NumUtils.roundToPlaces(
          comboDealListPrice * (100 + selfComboDeal.rate) / 100,
        );
      case ComboDealScheme.k2:
      case ComboDealScheme.k3:
      case ComboDealScheme.k4:
      case ComboDealScheme.k5:
        return comboDealListPrice * (100 + selfComboDeal.rate) / 100;
    }
  }

  double get comboDealTotalUnitPrice {
    //TODO: Handle price for all qty for another scheme here
    switch (comboDeal.scheme) {
      case ComboDealScheme.k1:
        return comboDealUnitPrice * quantity;
      case ComboDealScheme.k2:
      case ComboDealScheme.k3:
      case ComboDealScheme.k4:
      case ComboDealScheme.k5:
        return comboDealUnitPrice * quantity;
    }
  }

  bool get selfComboDealEligible => quantity >= selfComboDeal.minQty;
}

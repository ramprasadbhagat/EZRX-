class NumUtils {
  static double roundToPlaces(double num, [int places = 2]) {
    return double.parse(num.toStringAsFixed(places));
  }

  static double priceByRate(double num, double rate) => roundToPlaces(
        num * (100 + rate) / 100,
      );
}

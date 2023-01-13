class NumUtils {
  static double roundToPlaces(double num, [int places = 2]) {
    return double.parse(num.toStringAsFixed(places));
  }
}

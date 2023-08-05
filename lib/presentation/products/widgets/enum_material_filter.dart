enum Sort { az, za, priceLowToHigh, priceHighToLow }

extension SortExt on Sort {
  String get title {
    switch (this) {
      case Sort.az:
        return 'A-Z';
      case Sort.za:
        return 'Z-A';
      case Sort.priceLowToHigh:
        return 'Price: Low to high';
      case Sort.priceHighToLow:
        return 'Price: High to low';
    }
  }

  String get valueRequest {
    switch (this) {
      case Sort.az:
        return 'asc';
      case Sort.za:
        return 'desc';
      case Sort.priceLowToHigh:
        return 'Price: Low to high';
      case Sort.priceHighToLow:
        return 'Price: High to low';
    }
  }
}

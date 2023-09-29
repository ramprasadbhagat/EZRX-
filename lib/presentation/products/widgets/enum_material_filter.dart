enum Sort { az, za }

extension SortExt on Sort {
  String get title {
    switch (this) {
      case Sort.az:
        return 'A-Z';
      case Sort.za:
        return 'Z-A';
    }
  }

  String get valueRequest {
    switch (this) {
      case Sort.az:
        return 'asc';
      case Sort.za:
        return 'desc';
    }
  }
}

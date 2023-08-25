import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'soa_filter.freezed.dart';

@freezed
class SoaFilter with _$SoaFilter {
  const SoaFilter._();
  factory SoaFilter({
    required DateTime toDate,
    required DateTime fromDate,
  }) = _SoaFilter;

  factory SoaFilter.empty() => SoaFilter(
        fromDate: DateTime.now().subtract(const Duration(days: 365)),
        toDate: DateTime.now(),
      );



  DateTimeStringValue get toDateDisplay =>
      DateTimeStringValue(toDate.toIso8601String());

  DateTimeStringValue get fromDateDisplay =>
      DateTimeStringValue(fromDate.toIso8601String());

  int get appliedFilterCount => 1;
}


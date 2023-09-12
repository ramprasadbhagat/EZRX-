import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'soa_filter.freezed.dart';

@freezed
class SoaFilter with _$SoaFilter {
  const SoaFilter._();
  factory SoaFilter({
    required DateTimeStringValue toDate,
    required DateTimeStringValue fromDate,
  }) = _SoaFilter;

  factory SoaFilter.empty() => SoaFilter(
        fromDate: DateTimeStringValue(
          getDateStringByDateTime(
            DateTime.now().subtract(const Duration(days: 365)),
          ),
        ),
        toDate: DateTimeStringValue(getDateStringByDateTime(DateTime.now())),
      );

  int get appliedFilterCount => 1;
}

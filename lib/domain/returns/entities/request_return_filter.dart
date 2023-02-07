import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_return_filter.freezed.dart';

@freezed
class RequestReturnFilter with _$RequestReturnFilter {
  const RequestReturnFilter._();
  factory RequestReturnFilter({
    required SearchKey assignmentNumber,
    required SearchKey batch,
    required SearchKey materialDescription,
    required SearchKey materialNumber,
    required SearchKey principalSearch,
    required DateTime? toExpiryDate,
    required DateTime? fromExpiryDate,
  }) = _RequestReturnFilter;

  factory RequestReturnFilter.empty() => RequestReturnFilter(
        assignmentNumber: SearchKey.searchFilter(''),
        batch: SearchKey.searchFilter(''),
        materialDescription: SearchKey.searchFilter(''),
        materialNumber: SearchKey.searchFilter(''),
        principalSearch: SearchKey.searchFilter(''),
        fromExpiryDate: null,
        toExpiryDate: null,
      );
}

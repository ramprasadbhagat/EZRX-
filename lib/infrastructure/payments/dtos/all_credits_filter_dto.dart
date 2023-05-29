import 'package:ezrxmobile/domain/payments/entities/all_credits_filter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'all_credits_filter_dto.freezed.dart';
part 'all_credits_filter_dto.g.dart';

@freezed
class AllCreditsFilterDto with _$AllCreditsFilterDto {
  const AllCreditsFilterDto._();
  const factory AllCreditsFilterDto({
    @JsonKey(
      name: 'documentNumber',
      defaultValue: '',
    )
        required String documentNumber,
    @JsonKey(
      name: 'creditAmountTo',
      defaultValue: '',
    )
        required String creditAmountTo,
    @JsonKey(
      name: 'creditAmountFrom',
      defaultValue: '',
    )
        required String creditAmountFrom,
    @JsonKey(
      name: 'documentDateTo',
      defaultValue: '',
    )
        required String documentDateTo,
    @JsonKey(
      name: 'documentDateFrom',
      defaultValue: '',
    )
        required String documentDateFrom,
    @JsonKey(
      name: 'status',
      defaultValue: '',
    )
        required String status,
  }) = _AllCreditsFilterDto;

  factory AllCreditsFilterDto.fromDomain(
    AllCreditsFilter allCreditsFilter,
  ) {
    return AllCreditsFilterDto(
      documentNumber: allCreditsFilter.documentNumber.getOrDefaultValue(''),
      creditAmountFrom:
          allCreditsFilter.creditAmountFrom.apiParameterValueIfNegative,
      creditAmountTo:
          allCreditsFilter.creditAmountTo.apiParameterValueIfNegative,
      documentDateTo: allCreditsFilter.documentDateTo.apiDateWithDashFormat,
      documentDateFrom: allCreditsFilter.documentDateFrom.apiDateWithDashFormat,
      status: allCreditsFilter.sortBy,
    );
  }

  factory AllCreditsFilterDto.fromJson(Map<String, dynamic> json) =>
      _$AllCreditsFilterDtoFromJson(json);

  List<Map<String, String>> get toFilterByMapList {
    final filterQuery = <Map<String, String>>[];
    filterQuery.add(
      {
        'field': 'debitCreditCode',
        'value': 'H',
      },
    );
    if (documentNumber.isNotEmpty) {
      filterQuery.add({
        'field': 'accountingDocument',
        'value': documentNumber,
      });
    }

    if (documentDateFrom.isNotEmpty) {
      filterQuery.add({
        'field': 'postingDate',
        'value': documentDateFrom,
        'type': 'ge',
      });
    }

    if (documentDateTo.isNotEmpty) {
      filterQuery.add({
        'field': 'postingDate',
        'value': documentDateTo,
        'type': 'le',
      });
    }

    if (creditAmountFrom.isNotEmpty) {
      filterQuery.add({
        'field': 'amountInTransactionCurrency',
        'value': creditAmountFrom,
        'type': 'le',
      });
    }

    if (creditAmountTo.isNotEmpty) {
      filterQuery.add({
        'field': 'amountInTransactionCurrency',
        'value': creditAmountTo,
        'type': 'ge',
      });
    }

    if (status != 'All') {
      filterQuery.add({
        'field': 'invoiceProcessingStatus',
        'value': status,
      });
    }

    return filterQuery;
  }
}

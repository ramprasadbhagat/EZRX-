import 'package:ezrxmobile/domain/payments/entities/all_credits_filter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'all_credits_filter_dto.freezed.dart';
part 'all_credits_filter_dto.g.dart';

@freezed
class AllCreditsFilterDto with _$AllCreditsFilterDto {
  const AllCreditsFilterDto._();
  const factory AllCreditsFilterDto({
    @JsonKey(
      name: 'documentDateFrom',
      defaultValue: '',
    )
        required String documentDateFrom,
    @JsonKey(
      name: 'documentDateTo',
      defaultValue: '',
    )
        required String documentDateTo,
    @JsonKey(
      name: 'amountValueFrom',
      defaultValue: '',
    )
        required String amountValueFrom,
    @JsonKey(
      name: 'amountValueTo',
      defaultValue: '',
    )
        required String amountValueTo,
    @JsonKey(
      name: 'filterStatuses',
      defaultValue: '',
    )
        required String filterStatuses,
  }) = _AllCreditsFilterDto;

  factory AllCreditsFilterDto.fromDomain(
    AllCreditsFilter tempFilter,
  ) {
    return AllCreditsFilterDto(
      documentDateTo: tempFilter.documentDateTo.apiDateWithDashFormat,
      documentDateFrom: tempFilter.documentDateFrom.apiDateWithDashFormat,
      amountValueFrom: tempFilter.amountValueFrom.apiParameterValue,
      amountValueTo: tempFilter.amountValueTo.apiParameterValue,
      filterStatuses: tempFilter.filterStatuses.join(','),
    );
  }

  factory AllCreditsFilterDto.fromJson(Map<String, dynamic> json) =>
      _$AllCreditsFilterDtoFromJson(json);

  List<Map<String, String>> get toMapList => <Map<String, String>>[
        {
          'field': 'debitCreditCode',
          'value': 'H',
        },
        if (documentDateFrom.isNotEmpty)
          {
            'field': 'documentDate',
            'value': documentDateFrom,
            'type': 'ge',
          },
        if (documentDateTo.isNotEmpty)
          {
            'field': 'documentDate',
            'value': documentDateTo,
            'type': 'le',
          },
        if (amountValueFrom.isNotEmpty)
          {
            'field': 'amountInTransactionCurrency',
            'value': amountValueFrom,
            'type': 'ge',
          },
        if (amountValueTo.isNotEmpty)
          {
            'field': 'amountInTransactionCurrency',
            'value': amountValueTo,
            'type': 'le',
          },
        if (filterStatuses.isNotEmpty)
          {
            'field': 'invoiceProcessingStatus',
            'value': filterStatuses,
          },
      ];
}

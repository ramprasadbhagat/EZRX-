import 'package:ezrxmobile/domain/payments/entities/payment_summary_filter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'payment_summary_filter_dto.freezed.dart';
part 'payment_summary_filter_dto.g.dart';

@freezed
class PaymentSummaryFilterDto with _$PaymentSummaryFilterDto {
  const PaymentSummaryFilterDto._();
  const factory PaymentSummaryFilterDto({
    @JsonKey(
      name: 'createdDateFrom',
      defaultValue: '',
    )
        required String createdDateFrom,
    @JsonKey(
      name: 'createdDateTo',
      defaultValue: '',
    )
        required String createdDateTo,
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
  }) = _PaymentSummaryFilterDto;

  factory PaymentSummaryFilterDto.fromDomain(
    PaymentSummaryFilter tempFilter,
  ) {
    return PaymentSummaryFilterDto(
      createdDateTo: tempFilter.createdDateTo.apiDateWithDashString,
      createdDateFrom: tempFilter.createdDateTo.apiDateWithDashString,
      amountValueFrom: tempFilter.amountValueFrom.apiParameterValue,
      amountValueTo: tempFilter.amountValueTo.apiParameterValue,
      filterStatuses:
          tempFilter.filterStatuses.map((e) => e.getValue()).join(','),
    );
  }

  factory PaymentSummaryFilterDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentSummaryFilterDtoFromJson(json);

  List<Map<String, String>> get toMapList => <Map<String, String>>[
        if (createdDateFrom.isNotEmpty)
          {
            'field': 'createdDate',
            'value': createdDateFrom,
            'type': 'ge',
          },
        if (createdDateTo.isNotEmpty)
          {
            'field': 'createdDate',
            'value': createdDateTo,
            'type': 'le',
          },
        if (amountValueFrom.isNotEmpty)
          {
            'field': 'paymentAmount',
            'value': amountValueFrom,
            'type': 'ge',
          },
        if (amountValueTo.isNotEmpty)
          {
            'field': 'paymentAmount',
            'value': amountValueTo,
            'type': 'le',
          },
        if (filterStatuses.isNotEmpty)
          {
            'field': 'status',
            'value': filterStatuses,
          },
      ];
}

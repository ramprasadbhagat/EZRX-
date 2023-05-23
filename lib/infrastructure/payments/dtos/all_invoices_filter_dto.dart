import 'package:ezrxmobile/domain/payments/entities/all_invoices_filter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'all_invoices_filter_dto.freezed.dart';
part 'all_invoices_filter_dto.g.dart';

@freezed
class AllInvoicesFilterDto with _$AllInvoicesFilterDto {
  const AllInvoicesFilterDto._();
  const factory AllInvoicesFilterDto({
    @JsonKey(
      name: 'dueDateFrom',
      defaultValue: '',
    )
        required String dueDateFrom,
    @JsonKey(
      name: 'dueDateTo',
      defaultValue: '',
    )
        required String dueDateTo,
    @JsonKey(
      name: 'documentNumber',
    )
        required String documentNumber,
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
      name: 'debitValueFrom',
      defaultValue: '',
    )
        required String debitValueFrom,
    @JsonKey(
      name: 'debitValueTo',
      defaultValue: '',
    )
        required String debitValueTo,
    @JsonKey(
      name: 'filterStatus',
      defaultValue: '',
    )
        required String filterStatus,
  }) = _AllInvoicesFilterDto;

  factory AllInvoicesFilterDto.fromDomain(
    AllInvoicesFilter allInvoicesFilter,
  ) {
    return AllInvoicesFilterDto(
      dueDateFrom: allInvoicesFilter.dueDateFrom.apiDateWithDashFormat,
      dueDateTo: allInvoicesFilter.dueDateTo.apiDateWithDashFormat,
      documentNumber: allInvoicesFilter.documentNumber.getOrDefaultValue(''),
      documentDateTo: allInvoicesFilter.documentDateTo.apiDateWithDashFormat,
      documentDateFrom:
          allInvoicesFilter.documentDateFrom.apiDateWithDashFormat,
      debitValueFrom: allInvoicesFilter.debitValueFrom.apiParameterValue,
      debitValueTo: allInvoicesFilter.debitValueTo.apiParameterValue,
      filterStatus: allInvoicesFilter.filterStatus,
    );
  }

  factory AllInvoicesFilterDto.fromJson(Map<String, dynamic> json) =>
      _$AllInvoicesFilterDtoFromJson(json);

  List<Map<String, String>> get toMapList {
    final filterMapList = <Map<String, String>>[
      {
        'field': 'debitCreditCode',
        'value': 'S',
      },
      if (dueDateFrom.isNotEmpty)
        {
          'field': 'netDueDate',
          'value': dueDateFrom,
          'type': 'ge',
        },
      if (dueDateTo.isNotEmpty)
        {
          'field': 'netDueDate',
          'value': dueDateTo,
          'type': 'le',
        },
      if (documentNumber.isNotEmpty)
        {
          'field': 'accountingDocument',
          'value': documentNumber,
        },
      if (documentDateFrom.isNotEmpty)
        {
          'field': 'postingDate',
          'value': documentDateFrom,
          'type': 'ge',
        },
      if (documentDateTo.isNotEmpty)
        {
          'field': 'postingDate',
          'value': documentDateTo,
          'type': 'le',
        },
      if (debitValueFrom.isNotEmpty)
        {
          'field': 'amountInTransactionCurrency',
          'value': debitValueFrom,
          'type': 'ge',
        },
      if (debitValueTo.isNotEmpty)
        {
          'field': 'amountInTransactionCurrency',
          'value': debitValueTo,
          'type': 'le',
        },
      if (filterStatus.isNotEmpty && filterStatus != 'All')
        {
          'field': 'invoiceProcessingStatus',
          'value': filterStatus,
        },
    ];

    return filterMapList;
  }
}

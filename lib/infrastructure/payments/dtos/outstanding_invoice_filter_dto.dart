import 'package:ezrxmobile/domain/payments/entities/outstanding_invoice_filter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'outstanding_invoice_filter_dto.freezed.dart';
part 'outstanding_invoice_filter_dto.g.dart';

@freezed
class OutstandingInvoiceFilterDto with _$OutstandingInvoiceFilterDto {
  const OutstandingInvoiceFilterDto._();
  const factory OutstandingInvoiceFilterDto({
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
      name: 'amountInTransactionCurrencyFrom',
      defaultValue: '',
    )
        required String amountInTransactionCurrencyFrom,
    @JsonKey(
      name: 'amountInTransactionCurrencyTo',
      defaultValue: '',
    )
        required String amountInTransactionCurrencyTo,
    @JsonKey(
      name: 'status',
      defaultValue: '',
    )
        required String status,
  }) = _OutstandingInvoiceFilterDto;

  factory OutstandingInvoiceFilterDto.fromDomain(
    OutstandingInvoiceFilter outstandingInvoiceFilter,
  ) {
    return OutstandingInvoiceFilterDto(
      status: outstandingInvoiceFilter
          .outstandingInvoiceStatus.displayPaymentStatus,
      dueDateTo: outstandingInvoiceFilter.dueDateTo.apiDateWithDashFormat,
      dueDateFrom: outstandingInvoiceFilter.dueDateFrom.apiDateWithDashFormat,
      documentDateTo:
          outstandingInvoiceFilter.documentDateTo.apiDateWithDashFormat,
      documentDateFrom:
          outstandingInvoiceFilter.documentDateFrom.apiDateWithDashFormat,
      amountInTransactionCurrencyFrom:
          outstandingInvoiceFilter.amountValueFrom.apiParameterValue,
      amountInTransactionCurrencyTo:
          outstandingInvoiceFilter.amountValueTo.apiParameterValue,
    );
  }

  factory OutstandingInvoiceFilterDto.fromJson(Map<String, dynamic> json) =>
      _$OutstandingInvoiceFilterDtoFromJson(json);

  Map<String, String> _mapData({
    required String field,
    required String date,
    required String type,
  }) {
    final dataMap = <String, String>{};
    dataMap.putIfAbsent('field', () => field);
    dataMap.putIfAbsent('value', () => date);
    dataMap.putIfAbsent('type', () => type);

    return dataMap;
  }

  Map<String, dynamic> get toMapList {
    final filterMap = <Map<String, String>>[];
    if (dueDateFrom.isNotEmpty && dueDateTo.isNotEmpty) {
      filterMap.add(
        _mapData(
          field: 'netDueDate',
          date: dueDateFrom,
          type: 'ge',
        ),
      );
      filterMap.add(
        _mapData(
          field: 'netDueDate',
          date: dueDateTo,
          type: 'le',
        ),
      );
    }
    if (documentDateFrom.isNotEmpty && documentDateTo.isNotEmpty) {
      filterMap.add(
        _mapData(
          field: 'documentDate',
          date: documentDateFrom,
          type: 'ge',
        ),
      );
      filterMap.add(
        _mapData(
          field: 'documentDate',
          date: documentDateTo,
          type: 'le',
        ),
      );
    }
    if (amountInTransactionCurrencyFrom.isNotEmpty &&
        amountInTransactionCurrencyTo.isNotEmpty) {
      filterMap.add(
        _mapData(
          field: 'amountInTransactionCurrency',
          date: amountInTransactionCurrencyFrom,
          type: 'ge',
        ),
      );
      filterMap.add(
        _mapData(
          field: 'amountInTransactionCurrency',
          date: amountInTransactionCurrencyTo,
          type: 'le',
        ),
      );
    }

    if (status.isNotEmpty) {
      final statusMap = <String, String>{};
      statusMap.putIfAbsent('field', () => 'status');
      statusMap.putIfAbsent('value', () => status);
      filterMap.add(statusMap);
    }

    return filterMap.isEmpty ? {} : {'filterBy': filterMap};
  }
}

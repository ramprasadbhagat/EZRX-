import 'package:ezrxmobile/domain/payments/entities/available_credit_filter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'available_credit_filter_dto.freezed.dart';
part 'available_credit_filter_dto.g.dart';

@freezed
class AvailableCreditFilterDto with _$AvailableCreditFilterDto {
  const AvailableCreditFilterDto._();
  const factory AvailableCreditFilterDto({
    @JsonKey(name: 'documentDateFrom', defaultValue: '')
    required String documentDateFrom,
    @JsonKey(name: 'documentDateTo', defaultValue: '')
    required String documentDateTo,
    @JsonKey(name: 'amountInTransactionCurrencyFrom', defaultValue: '')
    required String amountInTransactionCurrencyFrom,
    @JsonKey(name: 'amountInTransactionCurrencyTo', defaultValue: '')
    required String amountInTransactionCurrencyTo,
  }) = _AvailableCreditFilterDto;

  factory AvailableCreditFilterDto.fromDomain(
    AvailableCreditFilter availableCreditFilter,
  ) {
    return AvailableCreditFilterDto(
      documentDateTo:
          availableCreditFilter.documentDateTo.apiDateWithDashString,
      documentDateFrom:
          availableCreditFilter.documentDateFrom.apiDateWithDashString,
      amountInTransactionCurrencyFrom:
          availableCreditFilter.amountValueFrom.apiParameterValue,
      amountInTransactionCurrencyTo:
          availableCreditFilter.amountValueTo.apiParameterValue,
    );
  }

  factory AvailableCreditFilterDto.fromJson(Map<String, dynamic> json) =>
      _$AvailableCreditFilterDtoFromJson(json);

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

  List<Map<String, String>> get toMapList {
    final filterMap = <Map<String, String>>[];
    if (documentDateFrom.isNotEmpty &&
        documentDateFrom != '-' &&
        documentDateTo.isNotEmpty &&
        documentDateTo != '-') {
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
          field: 'openAmountInTransCrcy',
          date: '-$amountInTransactionCurrencyTo',
          type: 'ge',
        ),
      );
      filterMap.add(
        _mapData(
          field: 'openAmountInTransCrcy',
          date: '-$amountInTransactionCurrencyFrom',
          type: 'le',
        ),
      );
    }

    return filterMap;
  }
}

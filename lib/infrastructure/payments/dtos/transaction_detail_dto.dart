import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/transaction_invoice_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';

part 'transaction_detail_dto.freezed.dart';
part 'transaction_detail_dto.g.dart';

@freezed
class TransactionDetailDto with _$TransactionDetailDto {
  const TransactionDetailDto._();
  const factory TransactionDetailDto({
    @JsonKey(name: 'id', defaultValue: '')
        required String id,
    @JsonKey(name: 'reference', defaultValue: '')
        required String reference,
    @JsonKey(name: 'invoices', defaultValue: <TransactionInvoiceDto>[])
        required List<TransactionInvoiceDto> invoices,
    @JsonKey(name: 'amountPayable', defaultValue: 0.0)
        required double amountPayable,
    @JsonKey(name: 'status', defaultValue: '')
        required String status,
    @JsonKey(name: 'paymentDocument', defaultValue: '')
        required String paymentDocument,
    @JsonKey(name: 'paymentMethodDisplay', defaultValue: '')
        required String paymentMethodDisplay,
    @JsonKey(name: 'createdOn', defaultValue: '')
        required String createdOn,
    @JsonKey(name: 'bankId', defaultValue: '')
        required String bankId,
    @JsonKey(name: 'paidOn', defaultValue: '')
        required String paidOn,
    @JsonKey(
      name: 'vaName',
      defaultValue: '',
      readValue: _mappingVaName,
    )
        required String vaName,
    @JsonKey(
      name: 'vaNumber',
      defaultValue: '',
      readValue: _mappingVaNumber,
    )
        required String vaNumber,
  }) = _TransactionDetailDto;

  PaymentSummaryDetails toDomain() {
    return PaymentSummaryDetails.empty().copyWith(
      paymentID: StringValue(id),
      status: FilterStatus(status),
      zzAdvice: StringValue(reference.isNotEmpty ? reference : id),
      paymentMethod: StringValue('Virtual Bank Account'),
      createdDate: DateTimeStringValue(createdOn),
      paymentItems: invoices.map((e) => e.toDomain()).toList(),
      paymentAmount: amountPayable,
      bankIdentification: bankId,
      bankAccountNumber: StringValue(vaNumber),
      bankName: StringValue(vaName),
    );
  }

  factory TransactionDetailDto.fromJson(Map<String, dynamic> json) =>
      _$TransactionDetailDtoFromJson(json);
}

String _mappingVaName(Map json, String _) =>
    json['paymentDetails']?['vaName'] ?? '';
String _mappingVaNumber(Map json, String _) =>
    json['paymentDetails']?['vaNumber'] ?? '';

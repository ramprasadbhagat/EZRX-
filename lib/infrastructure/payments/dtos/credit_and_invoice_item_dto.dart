import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'credit_and_invoice_item_dto.freezed.dart';
part 'credit_and_invoice_item_dto.g.dart';

@freezed
class CreditAndInvoiceItemDto with _$CreditAndInvoiceItemDto {
  const CreditAndInvoiceItemDto._();
  factory CreditAndInvoiceItemDto({
    @JsonKey(
      name: 'bpCustomerNumber',
      defaultValue: '',
    )
        required String bpCustomerNumber,
    @JsonKey(
      name: 'accountingDocument',
      defaultValue: '',
    )
        required String accountingDocument,
    @JsonKey(
      name: 'accountingDocumentType',
      defaultValue: '',
    )
        required String accountingDocumentType,
    @JsonKey(
      name: 'fiscalYear',
      defaultValue: '',
    )
        required String fiscalYear,
    @JsonKey(
      name: 'accountingDocumentItem',
      defaultValue: '',
    )
        required String accountingDocumentItem,
    @JsonKey(
      name: 'postingKeyName',
      defaultValue: '',
    )
        required String postingKeyName,
    @JsonKey(
      name: 'netDueDate',
      defaultValue: '',
    )
        required String netDueDate,
    @JsonKey(
      name: 'postingDate',
      defaultValue: '',
    )
        required String postingDate,
    @JsonKey(
      name: 'transactionCurrency',
      defaultValue: '',
    )
        required String transactionCurrency,
    @JsonKey(
      name: 'referenceDocumentNumber',
      defaultValue: '',
    )
        required String referenceDocumentNumber,
    @JsonKey(
      name: 'invoiceProcessingStatus',
      defaultValue: '',
    )
        required String invoiceProcessingStatus,
    @JsonKey(
      name: 'grossAmount',
      defaultValue: 0,
    )
        required int grossAmount,
    @JsonKey(
      name: 'netAmount',
      defaultValue: 0,
    )
        required int netAmount,
    @JsonKey(
      name: 'taxAmount',
      defaultValue: 0,
    )
        required int taxAmount,
    @JsonKey(
      name: 'amountInTransactionCurrency',
      defaultValue: 0.0,
    )
        required double amountInTransactionCurrency,
    @JsonKey(
      name: 'invoiceReference',
      defaultValue: '',
    )
        required String invoiceReference,
    @JsonKey(
      name: 'returnId',
      defaultValue: '',
    )
        required String returnId,
    @JsonKey(
      name: 'orderId',
      defaultValue: '',
    )
        required String orderId,
    @JsonKey(
      name: 'principalName',
      defaultValue: '',
    )
        required String principalName,
    @JsonKey(
      name: 'principalCode',
      defaultValue: '',
    )
        required String principalCode,
  }) = _CreditAndInvoiceItemDto;

  CreditAndInvoiceItem toDomain() {
    return CreditAndInvoiceItem(
      bpCustomerNumber: bpCustomerNumber,
      accountingDocument: accountingDocument,
      accountingDocumentType: accountingDocumentType,
      fiscalYear: fiscalYear,
      accountingDocumentItem: accountingDocumentItem,
      postingKeyName: postingKeyName,
      netDueDate: DateTimeStringValue(netDueDate),
      postingDate: DateTimeStringValue(postingDate),
      referenceDocumentNumber: StringValue(referenceDocumentNumber),
      invoiceProcessingStatus: StatusType(invoiceProcessingStatus),
      grossAmount: grossAmount,
      netAmount: netAmount,
      taxAmount: taxAmount,
      amountInTransactionCurrency: amountInTransactionCurrency,
      invoiceReference: StringValue(invoiceReference),
      returnId: returnId,
      orderId: StringValue(orderId),
      documentDate: DateTimeStringValue(''),
    );
  }

  factory CreditAndInvoiceItemDto.fromJson(Map<String, dynamic> json) =>
      _$CreditAndInvoiceItemDtoFromJson(json);
}

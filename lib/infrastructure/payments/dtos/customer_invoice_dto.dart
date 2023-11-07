import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_invoice_dto.freezed.dart';
part 'customer_invoice_dto.g.dart';

@freezed
class CustomerInvoiceDto with _$CustomerInvoiceDto {
  const CustomerInvoiceDto._();

  const factory CustomerInvoiceDto({
    @JsonKey(name: 'accountingDocExternalReference', defaultValue: '')
        required String accountingDocExternalReference,
    @JsonKey(name: 'accountingDocument', defaultValue: '')
        required String accountingDocument,
    @JsonKey(name: 'bpCustomerNumber') required String bpCustomerNumber,
    @JsonKey(name: 'debitCreditFlag', defaultValue: '')
        required String debitCreditFlag,
    @JsonKey(name: 'discountAmount', defaultValue: '')
        required String discountAmount,
    @JsonKey(name: 'discountDate', defaultValue: '')
        required String discountDate,
    @JsonKey(name: 'displayAmount', defaultValue: '')
        required String displayAmount,
    @JsonKey(name: 'displayOpenAmount', defaultValue: '')
        required String displayOpenAmount,
    @JsonKey(name: 'dueDate', defaultValue: '') required String dueDate,
    @JsonKey(name: 'fiscalYear', defaultValue: '') required String fiscalYear,
    @JsonKey(name: 'isDisputed', defaultValue: '') required String isDisputed,
    @JsonKey(name: 'lineItemNumber', defaultValue: '')
        required String lineItemNumber,
    @JsonKey(name: 'lineNumber', defaultValue: '') required String lineNumber,
    @JsonKey(name: 'partialPaymentHistoryDesc', defaultValue: '')
        required String partialPaymentHistoryDesc,
    @JsonKey(name: 'paymentAmount', defaultValue: '')
        required String paymentAmount,
    @JsonKey(name: 'salesOrg', defaultValue: '') required String salesOrg,
    @JsonKey(name: 'zzDeductCode', defaultValue: <PaymentDeductionDto>[])
        required List<PaymentDeductionDto> zzDeductCode,
  }) = _CustomerInvoiceDto;

  factory CustomerInvoiceDto.fromDomain(
    CustomerOpenItem customerOpenItem,
  ) {
    final customerInvoiceDto = CustomerInvoiceDto(
      accountingDocExternalReference:
          customerOpenItem.accountingDocExternalReference,
      accountingDocument: customerOpenItem.accountingDocument,
      bpCustomerNumber: customerOpenItem.bpCustomerNumber,
      debitCreditFlag: customerOpenItem.debitCreditCode,
      discountAmount:
          customerOpenItem.cashDiscountAmountInDspCrcy.toStringAsFixed(2),
      discountDate: customerOpenItem.cashDiscountDueDate.getValue(),
      displayAmount:
          customerOpenItem.totalAmountInDisplayCrcy.toStringAsFixed(2),
      displayOpenAmount:
          customerOpenItem.openAmountInDisplayCrcy.toStringAsFixed(2),
      dueDate: customerOpenItem.netDueDate.getValue(),
      fiscalYear: customerOpenItem.fiscalYear,
      isDisputed: customerOpenItem.isDisputed,
      lineItemNumber: customerOpenItem.accountingDocumentItem,
      lineNumber: customerOpenItem.accountingDocumentItemRef,
      partialPaymentHistoryDesc: customerOpenItem.partialPaymentHistoryDesc,
      paymentAmount:
          customerOpenItem.paymentAmountInDisplayCrcy.toStringAsFixed(2),
      salesOrg: customerOpenItem.companyCode,
      zzDeductCode: <PaymentDeductionDto>[],
    );
    if (customerOpenItem.displayCurrency.isPH) {
      return customerInvoiceDto.copyWith(
        paymentAmount: (customerOpenItem.paymentAmountInDisplayCrcy -
                customerOpenItem.g2Tax -
                customerOpenItem.g4Tax)
            .toStringAsFixed(2),
        zzDeductCode: [
          PaymentDeductionDto.fromDomain('G2', customerOpenItem.g2Tax),
          PaymentDeductionDto.fromDomain('G4', customerOpenItem.g4Tax),
        ],
      );
    }

    return customerInvoiceDto;
  }

  factory CustomerInvoiceDto.fromJson(Map<String, dynamic> json) =>
      _$CustomerInvoiceDtoFromJson(json);
}

@freezed
class PaymentDeductionDto with _$PaymentDeductionDto {
  const PaymentDeductionDto._();

  const factory PaymentDeductionDto({
    @JsonKey(name: 'deductCode', defaultValue: '') required String deductCode,
    @JsonKey(name: 'amountInTransactionCurrency', defaultValue: 0)
        required double amountInTransactionCurrency,
  }) = _PaymentDeductionDto;

  factory PaymentDeductionDto.fromDomain(
    String deductCode,
    double amountInTransactionCurrency,
  ) {
    return PaymentDeductionDto(
      deductCode: deductCode,
      amountInTransactionCurrency: amountInTransactionCurrency,
    );
  }

  factory PaymentDeductionDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentDeductionDtoFromJson(json);
}

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
      name: 'companyCode',
      defaultValue: '',
    )
        required String companyCode,
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
      name: 'specialGLCode',
      defaultValue: '',
    )
        required String specialGLCode,
    @JsonKey(
      name: 'postingKey',
      defaultValue: '',
    )
        required String postingKey,
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
      name: 'billingDocument',
      defaultValue: '',
    )
        required String billingDocument,
    @JsonKey(
      name: 'referenceDocumentNumber',
      defaultValue: '',
    )
        required String referenceDocumentNumber,
    @JsonKey(
      name: 'payerParty',
      defaultValue: '',
    )
        required String payerParty,
    @JsonKey(
      name: 'payerName1',
      defaultValue: '',
    )
        required String payerName1,
    @JsonKey(
      name: 'dueCalculationBaseDate',
      defaultValue: '',
    )
        required String dueCalculationBaseDate,
    @JsonKey(
      name: 'cashDiscount1DueDate',
      defaultValue: '',
    )
        required String cashDiscount1DueDate,
    @JsonKey(
      name: 'cashDiscount2DueDate',
      defaultValue: '',
    )
        required String cashDiscount2DueDate,
    @JsonKey(
      name: 'cashDiscount1Percent',
      defaultValue: '',
    )
        required String cashDiscount1Percent,
    @JsonKey(
      name: 'cashDiscount2Percent',
      defaultValue: '',
    )
        required String cashDiscount2Percent,
    @JsonKey(
      name: 'invoiceProcessingStatus',
      defaultValue: '',
    )
        required String invoiceProcessingStatus,
    @JsonKey(
      name: 'documentReferenceID',
      defaultValue: '',
    )
        required String documentReferenceID,
    @JsonKey(
      name: 'purchaseOrderByCustomer',
      defaultValue: '',
    )
        required String purchaseOrderByCustomer,
    @JsonKey(
      name: 'customerReferenceNumber',
      defaultValue: '',
    )
        required String customerReferenceNumber,
    @JsonKey(
      name: 'openAmountInTransCrcy',
      defaultValue: 0,
    )
        required int openAmountInTransCrcy,
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
      name: 'paymentAmount',
      defaultValue: 0,
    )
        required int paymentAmount,
    @JsonKey(
      name: 'iban',
      defaultValue: '',
    )
        required String iban,
    @JsonKey(
      name: 'bankAccountNumber',
      defaultValue: '',
    )
        required String bankAccountNumber,
    @JsonKey(
      name: 'bankName',
      defaultValue: '',
    )
        required String bankName,
    @JsonKey(
      name: 'memoLine',
      defaultValue: '',
    )
        required String memoLine,
    @JsonKey(
      name: 'paymentCardType',
      defaultValue: '',
    )
        required String paymentCardType,
    @JsonKey(
      name: 'paymentCardTypeName',
      defaultValue: '',
    )
        required String paymentCardTypeName,
    @JsonKey(
      name: 'paymentCardNumber',
      defaultValue: '',
    )
        required String paymentCardNumber,
    @JsonKey(
      name: 'paymentCardMaskedNumber',
      defaultValue: '',
    )
        required String paymentCardMaskedNumber,
    @JsonKey(
      name: 'paymentCardHolderName',
      defaultValue: '',
    )
        required String paymentCardHolderName,
    @JsonKey(
      name: 'debitCreditCode',
      defaultValue: '',
    )
        required String debitCreditCode,
    @JsonKey(
      name: 'postingPeriod',
      defaultValue: '',
    )
        required String postingPeriod,
    @JsonKey(
      name: 'clearingAccountingDocument',
      defaultValue: '',
    )
        required String clearingAccountingDocument,
    @JsonKey(
      name: 'clearingDate',
      defaultValue: '',
    )
        required String clearingDate,
    @JsonKey(
      name: 'documentDate',
      defaultValue: '',
    )
        required String documentDate,
    @JsonKey(
      name: 'amountInTransactionCurrency',
      defaultValue: 0.0,
    )
        required double amountInTransactionCurrency,
    @JsonKey(
      name: 'isDisputed',
      defaultValue: '',
    )
        required String isDisputed,
    @JsonKey(
      name: 'disputeCaseUUID',
      defaultValue: '',
    )
        required String disputeCaseUUID,
    @JsonKey(
      name: 'disputeCaseStatus',
      defaultValue: '',
    )
        required String disputeCaseStatus,
    @JsonKey(
      name: 'disputeCaseStatusName',
      defaultValue: '',
    )
        required String disputeCaseStatusName,
    @JsonKey(
      name: 'invoiceReference',
      defaultValue: '',
    )
        required String invoiceReference,
    @JsonKey(
      name: 'partnerFunctionIsPrintRelevant',
      defaultValue: false,
    )
        required bool partnerFunctionIsPrintRelevant,
    @JsonKey(
      name: 'functionIsXMLRelevant',
      defaultValue: false,
    )
        required bool functionIsXMLRelevant,
    @JsonKey(
      name: 'invoiceIsResidualForInference',
      defaultValue: '',
    )
        required String invoiceIsResidualForInference,
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
  }) = _CreditAndInvoiceItemDto;

  CreditAndInvoiceItem toDomain() {
    return CreditAndInvoiceItem(
      companyCode: companyCode,
      bpCustomerNumber: bpCustomerNumber,
      accountingDocument: accountingDocument,
      accountingDocumentType: accountingDocumentType,
      fiscalYear: fiscalYear,
      accountingDocumentItem: accountingDocumentItem,
      specialGLCode: specialGLCode,
      postingKey: postingKey,
      postingKeyName: postingKeyName,
      netDueDate: DateTimeStringValue(netDueDate),
      postingDate: postingDate,
      transactionCurrency: transactionCurrency,
      billingDocument: billingDocument,
      referenceDocumentNumber: referenceDocumentNumber,
      payerParty: payerParty,
      payerName1: payerName1,
      dueCalculationBaseDate: dueCalculationBaseDate,
      cashDiscount1DueDate: cashDiscount1DueDate,
      cashDiscount2DueDate: cashDiscount2DueDate,
      cashDiscount1Percent: cashDiscount1Percent,
      cashDiscount2Percent: cashDiscount2Percent,
      invoiceProcessingStatus: invoiceProcessingStatus,
      documentReferenceID: documentReferenceID,
      purchaseOrderByCustomer: purchaseOrderByCustomer,
      customerReferenceNumber: customerReferenceNumber,
      openAmountInTransCrcy: openAmountInTransCrcy,
      grossAmount: grossAmount,
      netAmount: netAmount,
      taxAmount: taxAmount,
      paymentAmount: paymentAmount,
      iban: iban,
      bankAccountNumber: bankAccountNumber,
      bankName: bankName,
      memoLine: memoLine,
      paymentCardType: paymentCardType,
      paymentCardTypeName: paymentCardTypeName,
      paymentCardNumber: paymentCardNumber,
      paymentCardMaskedNumber: paymentCardMaskedNumber,
      paymentCardHolderName: paymentCardHolderName,
      debitCreditCode: debitCreditCode,
      postingPeriod: postingPeriod,
      clearingAccountingDocument: clearingAccountingDocument,
      clearingDate: clearingDate,
      documentDate: DateTimeStringValue(documentDate),
      amountInTransactionCurrency: amountInTransactionCurrency,
      isDisputed: isDisputed,
      disputeCaseUUID: disputeCaseUUID,
      disputeCaseStatus: disputeCaseStatus,
      disputeCaseStatusName: disputeCaseStatusName,
      invoiceReference: invoiceReference,
      partnerFunctionIsPrintRelevant: partnerFunctionIsPrintRelevant,
      functionIsXMLRelevant: functionIsXMLRelevant,
      invoiceIsResidualForInference: invoiceIsResidualForInference,
      returnId: returnId,
      orderId: orderId,
    );
  }

  factory CreditAndInvoiceItemDto.fromJson(Map<String, dynamic> json) =>
      _$CreditAndInvoiceItemDtoFromJson(json);
}

import 'package:collection/collection.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_group.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'credit_and_invoice_item.freezed.dart';

@freezed
class CreditAndInvoiceItem with _$CreditAndInvoiceItem {
  const CreditAndInvoiceItem._();
  factory CreditAndInvoiceItem({
    required String companyCode,
    required String bpCustomerNumber,
    required String accountingDocument,
    required String accountingDocumentType,
    required String fiscalYear,
    required String accountingDocumentItem,
    required String specialGLCode,
    required String postingKey,
    required String postingKeyName,
    required DateTimeStringValue netDueDate,
    required DateTimeStringValue postingDate,
    required String transactionCurrency,
    required String billingDocument,
    required StringValue referenceDocumentNumber,
    required String payerParty,
    required String payerName1,
    required String dueCalculationBaseDate,
    required String cashDiscount1DueDate,
    required String cashDiscount2DueDate,
    required String cashDiscount1Percent,
    required String cashDiscount2Percent,
    required StatusType invoiceProcessingStatus,
    required String documentReferenceID,
    required String purchaseOrderByCustomer,
    required String customerReferenceNumber,
    required int openAmountInTransCrcy,
    required int grossAmount,
    required int netAmount,
    required int taxAmount,
    required int paymentAmount,
    required String iban,
    required String bankAccountNumber,
    required String bankName,
    required String memoLine,
    required String paymentCardType,
    required String paymentCardTypeName,
    required String paymentCardNumber,
    required String paymentCardMaskedNumber,
    required String paymentCardHolderName,
    required String debitCreditCode,
    required String postingPeriod,
    required String clearingAccountingDocument,
    required String clearingDate,
    required DateTimeStringValue documentDate,
    required double amountInTransactionCurrency,
    required String isDisputed,
    required String disputeCaseUUID,
    required String disputeCaseStatus,
    required String disputeCaseStatusName,
    required StringValue invoiceReference,
    required bool partnerFunctionIsPrintRelevant,
    required bool functionIsXMLRelevant,
    required String invoiceIsResidualForInference,
    required String returnId,
    required String orderId,
  }) = _CreditAndInvoiceItem;

  factory CreditAndInvoiceItem.empty() => CreditAndInvoiceItem(
        companyCode: '',
        bpCustomerNumber: '',
        accountingDocument: '',
        accountingDocumentType: '',
        fiscalYear: '',
        accountingDocumentItem: '',
        specialGLCode: '',
        postingKey: '',
        postingKeyName: '',
        netDueDate: DateTimeStringValue(''),
        postingDate: DateTimeStringValue(''),
        transactionCurrency: '',
        billingDocument: '',
        referenceDocumentNumber: StringValue(''),
        payerParty: '',
        payerName1: '',
        dueCalculationBaseDate: '',
        cashDiscount1DueDate: '',
        cashDiscount2DueDate: '',
        cashDiscount1Percent: '',
        cashDiscount2Percent: '',
        invoiceProcessingStatus: StatusType(''),
        documentReferenceID: '',
        purchaseOrderByCustomer: '',
        customerReferenceNumber: '',
        openAmountInTransCrcy: 0,
        grossAmount: 0,
        netAmount: 0,
        taxAmount: 0,
        paymentAmount: 0,
        iban: '',
        bankAccountNumber: '',
        bankName: '',
        memoLine: '',
        paymentCardType: '',
        paymentCardTypeName: '',
        paymentCardNumber: '',
        paymentCardMaskedNumber: '',
        paymentCardHolderName: '',
        debitCreditCode: '',
        postingPeriod: '',
        clearingAccountingDocument: '',
        clearingDate: '',
        documentDate: DateTimeStringValue(''),
        amountInTransactionCurrency: 0.0,
        isDisputed: '',
        disputeCaseUUID: '',
        disputeCaseStatus: '',
        disputeCaseStatusName: '',
        invoiceReference: StringValue(''),
        partnerFunctionIsPrintRelevant: false,
        functionIsXMLRelevant: false,
        invoiceIsResidualForInference: '',
        returnId: '',
        orderId: '',
      );
//to convert if amountInTransactionCurrency value is negative
  double get convertIfAmountInTransactionCurrencyIsNegative =>
      amountInTransactionCurrency * -1;
}

extension CreditAndInvoiceListExtension on List<CreditAndInvoiceItem> {
  List<CreditAndInvoiceGroup> get groupList {
    return List<CreditAndInvoiceItem>.from(this)
        .groupListsBy((item) => item.netDueDate)
        .entries
        .map(
          (entry) => CreditAndInvoiceGroup(
            dueDate: entry.key,
            items: entry.value,
          ),
        )
        .toList();
  }
}
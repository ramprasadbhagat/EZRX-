import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_payment_info.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_payment_item_dto.freezed.dart';
part 'customer_payment_item_dto.g.dart';

@freezed
class CustomerPaymentItemDto with _$CustomerPaymentItemDto {
  const CustomerPaymentItemDto._();

  const factory CustomerPaymentItemDto({
    @JsonKey(name: 'paymentID', defaultValue: '') required String paymentID,
    @JsonKey(name: 'valueDate', defaultValue: '') required String valueDate,
    @JsonKey(name: 'paymentAmount', defaultValue: 0) required num paymentAmount,
    @JsonKey(name: 'transactionCurrency', defaultValue: '')
        required String transactionCurrency,
    @JsonKey(name: 'invoiceProcessingStatus', defaultValue: '')
        required String invoiceProcessingStatus,
    @JsonKey(name: 'accountingDocExternalReference', defaultValue: '')
        required String accountingDocExternalReference,
    @JsonKey(name: 'paymentMethod', defaultValue: '')
        required String paymentMethod,
    @JsonKey(name: 'zCcpPaymentQrCode', defaultValue: '')
        required String zCcpPaymentQrCode,
    @JsonKey(name: 'paymentBatchAdditionalInfo', defaultValue: '')
        required String paymentBatchAdditionalInfo,
    @JsonKey(name: 'zzAdvice', defaultValue: '') required String zzAdvice,
    @JsonKey(name: 'zzHtmcs', defaultValue: '') required String zzHtmcs,
    @JsonKey(name: 'adviceExpiry', defaultValue: '')
        required String adviceExpiry,
    @JsonKey(name: 'createdDate', defaultValue: '') required String createdDate,
    @JsonKey(name: 'status', defaultValue: '') required String status,
  }) = _CustomerPaymentItemDto;

  CustomerPaymentInfo toDomain() {
    if (zzHtmcs.isEmpty) {
      return CustomerPaymentInfo(
        zzHtmcs: zzHtmcs,
        paymentBatchAdditionalInfo: paymentBatchAdditionalInfo,
        paymentID: paymentID,
        accountingDocExternalReference: accountingDocExternalReference,
        zzAdvice: zzAdvice,
        createdDate: DateTimeStringValue(createdDate),
        adviceExpiry: AdviceExpiryValue(adviceExpiry),
      );
    }

    if (Currency(transactionCurrency).isTH) {
      final htmlFormat = zzHtmcs.characters
          .getRange(
            zzHtmcs.indexOf('<html>'),
            zzHtmcs.indexOf('</html>') + '</html>'.length,
          )
          .string;

      return CustomerPaymentInfo(
        zzHtmcs: htmlFormat,
        paymentBatchAdditionalInfo: paymentBatchAdditionalInfo,
        paymentID: paymentID,
        accountingDocExternalReference: accountingDocExternalReference,
        zzAdvice: zzAdvice,
        createdDate: DateTimeStringValue(createdDate),
        adviceExpiry: AdviceExpiryValue(adviceExpiry),
      );
    }

    var htmlFormat = zzHtmcs
        .replaceAll(RegExp(r'html:\s*'), '')
        .replaceAll(RegExp(r'_blank\s*'), '_self');
    final buttonHtml = htmlFormat.characters
        .getRange(
          htmlFormat.indexOf('<button'),
          htmlFormat.indexOf('</button>') + '</button>'.length,
        )
        .string;
    htmlFormat = htmlFormat.replaceAll(buttonHtml, '');
    const jsLib =
        '''<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>''';
    const autoClick =
        '''<script type="text/javascript">\$(document).ready(function(){\$("#btn_submit").click();});</script>''';

    return CustomerPaymentInfo(
      zzHtmcs: '$jsLib$buttonHtml$htmlFormat$autoClick',
      paymentBatchAdditionalInfo: paymentBatchAdditionalInfo,
      paymentID: paymentID,
      accountingDocExternalReference: accountingDocExternalReference,
      zzAdvice: zzAdvice,
      createdDate: DateTimeStringValue(createdDate),
      adviceExpiry: AdviceExpiryValue(adviceExpiry),
    );
  }

  factory CustomerPaymentItemDto.fromJson(Map<String, dynamic> json) =>
      _$CustomerPaymentItemDtoFromJson(json);
}

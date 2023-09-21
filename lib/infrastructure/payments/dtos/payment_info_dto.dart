import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_info.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_info_dto.freezed.dart';
part 'payment_info_dto.g.dart';

@freezed
class PaymentInfoDto with _$PaymentInfoDto {
  const PaymentInfoDto._();

  const factory PaymentInfoDto({
    @JsonKey(name: 'zzHtmcs', defaultValue: '') required String zzHtmcs,
    @JsonKey(name: 'accountingDocExternalReference', defaultValue: '')
        required String accountingDocExternalReference,
    @JsonKey(name: 'paymentID', defaultValue: '') required String paymentID,
    @JsonKey(name: 'paymentBatchAdditionalInfo', defaultValue: '')
        required String paymentBatchAdditionalInfo,
    @JsonKey(name: 'transactionCurrency', defaultValue: '')
        required String transactionCurrency,
  }) = _PaymentInfoDto;

  PaymentInfo toDomain() {
    if (Currency(transactionCurrency).isTH) {
      final htmlFormat = zzHtmcs.characters
          .getRange(
            zzHtmcs.indexOf('<html>'),
            zzHtmcs.indexOf('</html>') + '</html>'.length,
          )
          .string;

      return PaymentInfo(
        zzHtmcs: htmlFormat,
        paymentBatchAdditionalInfo: paymentBatchAdditionalInfo,
        paymentID: paymentID,
        accountingDocExternalReference: accountingDocExternalReference,
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

    return PaymentInfo(
      zzHtmcs: '$jsLib$buttonHtml$htmlFormat$autoClick',
      paymentBatchAdditionalInfo: paymentBatchAdditionalInfo,
      paymentID: paymentID,
      accountingDocExternalReference: accountingDocExternalReference,
    );
  }

  factory PaymentInfoDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentInfoDtoFromJson(json);
}

import 'dart:convert';

import 'package:ezrxmobile/infrastructure/payments/dtos/customer_payment_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic dataMY;
  late dynamic dataPH;
  late dynamic dataVN;
  late dynamic dataTH;
  late dynamic dataSG;

  group('Customer Payment Info dto ', () {
    setUp(() async {
      dataMY = json.decode(
        await rootBundle.loadString(
          'assets/json/customerPaymentMYResponse.json',
        ),
      );
      dataPH = json.decode(
        await rootBundle.loadString(
          'assets/json/customerPaymentPHResponse.json',
        ),
      );
      dataVN = json.decode(
        await rootBundle.loadString(
          'assets/json/customerPaymentVNResponse.json',
        ),
      );
      dataTH = json.decode(
        await rootBundle.loadString(
          'assets/json/customerPaymentTHResponse.json',
        ),
      );
      dataSG = json.decode(
        await rootBundle.loadString(
          'assets/json/customerPaymentSGResponse.json',
        ),
      );
    });

    test('CustomerPaymentInfoDto fromJson and toDomain on MY market', () {
      final customerPaymentInfoDto =
          CustomerPaymentDto.fromJson(dataMY['data']['customerPayment'])
              .customerPaymentResponse
              .first
              .toDomain();
      expect(
        customerPaymentInfoDto.zzHtmcs,
        '''<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script><button type="button" onlick="butonClick" id="btn_submit">Open Payment Gateway</button><script language="javascript">\$("#btn_submit").click(function(){var win = window.open("" ,"_self");win.document.body.innerHTML = '<form id="pay_form" name="pay_form" action="https://pay.e-ghl.com/IPGSG/Payment.aspx" method="post"><input name="TransactionType" type="hidden" id="TransactionType" value="SALE" /><input name="PymtMethod" type="hidden" id="PymtMethod" value="ANY" /><input name="ServiceID" type="hidden" id="ServiceID" value="ZUE" /><input name="PaymentID" type="hidden" id="PaymentID" value="09EZ230001191801" /><input name="OrderNumber" type="hidden" id="OrderNumber" value="09EZ230001191801" /><input name="PaymentDesc" type="hidden" id="PaymentDesc" value="-" /><input name="MerchantName" type="hidden" id="MerchantName" value="Zuellig Pharma" /><input name="MerchantReturnURL" type="hidden" id="MerchantReturnURL" value="https://uat-my.ezrx.com/api/thankyou-payment" /><input name="MerchantCallBackURL" type="hidden" id="MerchantCallBackURL" value="https://omnicollect-dev.business.hsbc.com/api/callback/my/eGHL/payment" /><input name="Amount" type="hidden" id="Amount" value="12425.98" /><input name="CurrencyCode" type="hidden" id="CurrencyCode" value="MYR" /><input name="CustIP" type="hidden" id="CustIP" value="" /><input name="CustName" type="hidden" id="CustName" value="Customer Name" /><input name="CustEmail" type="hidden" id="CustEmail" value="customer.name@example.com" /><input name="CustPhone" type="hidden" id="CustPhone" value="1234567890" /><input name="LanguageCode" type="hidden" id="LanguageCode" value="EN" /><input name="PageTimeout" type="hidden" id="PageTimeout" value="780" /><input name="HashValue" type="hidden" id="HashValue" value="d0f8a5d65db2f14c72f42bc7361ba06e225c9026dcbedacd6bbd2fc68482f962" /></form>';win.document.pay_form.submit();})</script><script type="text/javascript">\$(document).ready(function(){\$("#btn_submit").click();});</script>''',
      );
    });

    test('CustomerPaymentInfoDto fromJson and toDomain on PH market', () {
      final customerPaymentInfoDto =
          CustomerPaymentDto.fromJson(dataPH['data']['customerPayment'])
              .customerPaymentResponse
              .first
              .toDomain();
      expect(
        customerPaymentInfoDto.zzHtmcs,
        '''<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script><button type="button" onlick="butonClick" id="btn_submit">Open Payment Gateway</button><script language="javascript">\$(document).ready(function(){\$("#btn_submit").click(function (){var win=window.open("https://ubotpsentry-tst1.outsystemsenterprise.com/UPAY/WhiteLabel/73352865-5C06-AB2A-16A0-7E63A173AD0B?s=BO6qn38IzSkPzODnR%2FrCTg%3D%3DPz7CbHG%2Buec9hTb4u%2FwxLR7ku5kbpINSnE6zxubEqnUMBX%2Bzt9VvqSgyGV%2Btd8I%2BvTxSZDERDbSzzaOyr9MMsQc2rjGEsPf%2B2A7vPQrdAtEx729fM8kSlrjH8fc8l3cv1wwUwzlb3jUncpo6kocvJvhtCaYQj2FRV40DcCJeH10S47SIGAPeGKb1Sfz6413hdb1h3h%2BudYzEJpmbuVsqWPrIGe3GyPLsoUbg0dXpNqJ30hFF%2F1JidSyho1ghz2MmVAHg31HiiEG%2FjiCZIrPvxWQvP2LWw4DA2BhDCanPs%2F0BtNQ5W8hGpG3D60YhzTYk2oS8W026OOCurKw%2BG9qdyIJdpBMIxLrGH7uPgR2NcfhOPsYVg1YbYcHPzDiJobbhU2SaHFac52eLZUdacfUdc%2BdeYPlZzYYQCmD%2FyWzX9d4%3D" ,"_self" );})})</script><script type="text/javascript">\$(document).ready(function(){\$("#btn_submit").click();});</script>''',
      );
    });

    test('CustomerPaymentInfoDto fromJson and toDomain on VN market', () {
      final customerPaymentInfoDto =
          CustomerPaymentDto.fromJson(dataVN['data']['customerPayment'])
              .customerPaymentResponse
              .first
              .toDomain();
      expect(
        customerPaymentInfoDto.zzHtmcs,
        '''<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script><button type="button" onlick="butonClick" id="btn_submit">Open Payment Gateway</button><script language="javascript">\$(document).ready(function(){\$("#btn_submit").click(function (){var win=window.open("https://newsandbox.payoo.com.vn/v2/paynow/prepare?_token=1hgRF9i75CC" ,"_self" );})})</script><script type="text/javascript">\$(document).ready(function(){\$("#btn_submit").click();});</script>''',
      );
    });

    test('CustomerPaymentInfoDto fromJson and toDomain on TH market', () {
      final customerPaymentInfoDto =
          CustomerPaymentDto.fromJson(dataTH['data']['customerPayment'])
              .customerPaymentResponse
              .first
              .toDomain();
      expect(
        customerPaymentInfoDto.zzHtmcs,
        '''<html><head></head><body><script type="text/javascript" src="https://dev-kpaymentgateway.kasikornbank.com/ui/v2/kpayment.min.js" data-apikey="pkey_test_21102hvZyafqGFFzN0G3NjphkJZ2NPFbRBMRq" data-amount="1605.00" data-currency="THB" data-payment-methods="qr" data-order-id="order_test_21102e9e04f465f8d4975a4f64d7de25b8c1b"></script></body></html>''',
      );
    });

    test('CustomerPaymentInfoDto fromJson and toDomain on SG market', () {
      final customerPaymentInfoDto =
          CustomerPaymentDto.fromJson(dataSG['data']['customerPayment'])
              .customerPaymentResponse
              .first
              .toDomain();
      expect(
        customerPaymentInfoDto.zzHtmcs,
        '',
      );
    });
  });
}

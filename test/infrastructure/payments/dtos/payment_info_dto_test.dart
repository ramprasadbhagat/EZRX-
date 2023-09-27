import 'dart:convert';

import 'package:ezrxmobile/infrastructure/payments/dtos/payment_info_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic dataMY;
  late dynamic dataPH;

  group('Payment Info dto ', () {
    setUp(() async {
      dataMY = json.decode(
        await rootBundle.loadString(
          'assets/json/payResponseMY.json',
        ),
      );
      dataPH = json.decode(
        await rootBundle.loadString(
          'assets/json/payResponsePH.json',
        ),
      );
    });

    test('PaymentInfoDto fromJson and toDomain on MY market', () {
      final paymentInfoDto =
          PaymentInfoDto.fromJson(dataMY['data']['addCustomerPayment'])
              .toDomain();
      expect(
        paymentInfoDto.zzHtmcs,
        '''<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script><button type="button" onlick="butonClick" id="btn_submit">Open Payment Gateway</button><script language="javascript">\$("#btn_submit").click(function(){var win = window.open("" ,"_self");win.document.body.innerHTML = '<form id="pay_form" name="pay_form" action="https://pay.e-ghl.com/IPGSG/Payment.aspx" method="post"><input name="TransactionType" type="hidden" id="TransactionType" value="SALE" /><input name="PymtMethod" type="hidden" id="PymtMethod" value="ANY" /><input name="ServiceID" type="hidden" id="ServiceID" value="ZUE" /><input name="PaymentID" type="hidden" id="PaymentID" value="09EZ230001051701" /><input name="OrderNumber" type="hidden" id="OrderNumber" value="09EZ230001051701" /><input name="PaymentDesc" type="hidden" id="PaymentDesc" value="-" /><input name="MerchantName" type="hidden" id="MerchantName" value="Zuellig Pharma" /><input name="MerchantReturnURL" type="hidden" id="MerchantReturnURL" value="https://uat-my.ezrx.com/api/thankyou-payment" /><input name="MerchantCallBackURL" type="hidden" id="MerchantCallBackURL" value="https://omnicollect-dev.business.hsbc.com/api/callback/my/eGHL/payment" /><input name="Amount" type="hidden" id="Amount" value="2950.00" /><input name="CurrencyCode" type="hidden" id="CurrencyCode" value="MYR" /><input name="CustIP" type="hidden" id="CustIP" value="" /><input name="CustName" type="hidden" id="CustName" value="Customer Name" /><input name="CustEmail" type="hidden" id="CustEmail" value="customer.name@example.com" /><input name="CustPhone" type="hidden" id="CustPhone" value="1234567890" /><input name="LanguageCode" type="hidden" id="LanguageCode" value="EN" /><input name="PageTimeout" type="hidden" id="PageTimeout" value="780" /><input name="HashValue" type="hidden" id="HashValue" value="1b1c28d4e88c09ac5f1371fa00dc83affdc133822a4b6ada9a1a298efa955980" /></form>';win.document.pay_form.submit();})</script><script type="text/javascript">\$(document).ready(function(){\$("#btn_submit").click();});</script>''',
      );
    });

    test('PaymentInfoDto fromJson and toDomain on PH market', () {
      final paymentInfoDto =
          PaymentInfoDto.fromJson(dataPH['data']['addCustomerPayment'])
              .toDomain();
      expect(
        paymentInfoDto.zzHtmcs,
        '''<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script><button type="button" onlick="butonClick" id="btn_submit">Open Payment Gateway</button><script language="javascript">\$(document).ready(function(){\$("#btn_submit").click(function (){var win=window.open("https://ubotpsentry-tst1.outsystemsenterprise.com/UPAY/WhiteLabel/73352865-5C06-AB2A-16A0-7E63A173AD0B?s=BNQ3N4RFV1WQb57XEz6WEg%3D%3DcoiiQNXYbZg76khnGLFQNfmU%2BkiEm5ETXgwuOWLGheMweEwp5J5ht8S7nmFCPJdVfgliqPSdeB3M9nxi8QkAHX5CGwGDlxUBeLg10kzckMEm7nu0erQHh8dJCujc%2BviXxYcUsclxBZbRb%2BaKw6tNxbrGDLG7TW8jV%2BKKZxQhFuf8%2FBOMiMQ2hzlK21igkqliqrrzVMz01qeE%2Bfk%2FZiMQOJg%2FyboKvEZXHSaTcHedjxCLc6Ml6dThoL4CUcxKt3mQymqQnrFkCzyNTmO%2FBGDPJ2si8Jhj%2BPqk5tZ81gSwzoViTQeKZn0SU0sEEYIkvMg5pVUhOO88DhwbsryCtp%2BN10mg8Wk%2FiW1ArrmSs0k1H62iEWBwqxqU1CH2Uzjh7AMUBD5d1T0LwMDvXzbO9q5RVg9dlW4cxpaoz9rpklX%2F%2FGfl4PNPNjPTaaCyL5rCMEYQIciHnHMSJb04qkfbeu5g2cV02Oi%2B7SkMHW38Z4hLJ3GzM1buTKx4DiGVq3GWeokG" ,"_self" );})})</script><script type="text/javascript">\$(document).ready(function(){\$("#btn_submit").click();});</script>''',
      );
    });
  });
}

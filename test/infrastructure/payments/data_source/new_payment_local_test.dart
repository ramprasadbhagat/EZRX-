import 'package:ezrxmobile/infrastructure/payments/datasource/new_payment_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late NewPaymentLocalDataSource localDataSource;
  late String htmlUrlMY;

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = NewPaymentLocalDataSource();
    },
  );
  setUp(() {
    htmlUrlMY =
        '''<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script><button type="button" onlick="butonClick" id="btn_submit">Open Payment Gateway</button><script language="javascript">\$("#btn_submit").click(function(){var win = window.open("" ,"_self");win.document.body.innerHTML = '<form id="pay_form" name="pay_form" action="https://pay.e-ghl.com/IPGSG/Payment.aspx" method="post"><input name="TransactionType" type="hidden" id="TransactionType" value="SALE" /><input name="PymtMethod" type="hidden" id="PymtMethod" value="ANY" /><input name="ServiceID" type="hidden" id="ServiceID" value="ZUE" /><input name="PaymentID" type="hidden" id="PaymentID" value="09EZ230001051701" /><input name="OrderNumber" type="hidden" id="OrderNumber" value="09EZ230001051701" /><input name="PaymentDesc" type="hidden" id="PaymentDesc" value="-" /><input name="MerchantName" type="hidden" id="MerchantName" value="Zuellig Pharma" /><input name="MerchantReturnURL" type="hidden" id="MerchantReturnURL" value="https://uat-my.ezrx.com/api/thankyou-payment" /><input name="MerchantCallBackURL" type="hidden" id="MerchantCallBackURL" value="https://omnicollect-dev.business.hsbc.com/api/callback/my/eGHL/payment" /><input name="Amount" type="hidden" id="Amount" value="2950.00" /><input name="CurrencyCode" type="hidden" id="CurrencyCode" value="MYR" /><input name="CustIP" type="hidden" id="CustIP" value="" /><input name="CustName" type="hidden" id="CustName" value="Customer Name" /><input name="CustEmail" type="hidden" id="CustEmail" value="customer.name@example.com" /><input name="CustPhone" type="hidden" id="CustPhone" value="1234567890" /><input name="LanguageCode" type="hidden" id="LanguageCode" value="EN" /><input name="PageTimeout" type="hidden" id="PageTimeout" value="780" /><input name="HashValue" type="hidden" id="HashValue" value="1b1c28d4e88c09ac5f1371fa00dc83affdc133822a4b6ada9a1a298efa955980" /></form>';win.document.pay_form.submit();})</script><script type="text/javascript">\$(document).ready(function(){\$("#btn_submit").click();});</script>''';
  });

  group(
    'New Payment Local Datasource Test',
    () {
      test(
        'getCustomerOpenItems',
        () async {
          final result = await localDataSource.getCustomerOpenItems();
          expect(
            result.length,
            5,
          );
        },
      );

      test(
        'pay on MY market',
        () async {
          final result = await localDataSource.pay(currentMarket: 'MY');
          expect(
            result.zzHtmcs,
            htmlUrlMY,
          );
        },
      );

      test(
        'payment invoice pdf',
        () async {
          final result = await localDataSource.getPaymentInvoiceInfoPdf();
          expect(
            result.zzAdvice,
            '09EZ230000977801',
          );
        },
      );

      test(
        'update payment gateway',
        () async {
          final result = await localDataSource.updatePaymentGateway();
          expect(
            () => result,
            isA<void>(),
          );
        },
      );

      test(
        'fetch payment method',
        () async {
          final result = await localDataSource.fetchPaymentMethods();
          expect(
            result.length,
            1,
          );
        },
      );
    },
  );
}

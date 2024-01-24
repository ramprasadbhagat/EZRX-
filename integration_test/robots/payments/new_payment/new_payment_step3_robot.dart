import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../common/extension.dart';

class NewPaymentStep3Robot {
  final WidgetTester tester;
  NewPaymentStep3Robot(this.tester);
  final generatePaymentAdviceButton = find.byKey(
    WidgetKeys.generatePaymentAdvice,
  );
  final payButton = find.byKey(WidgetKeys.payButton);
  final radioPaymentGateway = find.byKey(WidgetKeys.paymentMethodRadio);
  final paymentWebviewPage = find.byKey(WidgetKeys.paymentWebviewPage);
  final createPaymentAdviseNote =
      find.byKey(WidgetKeys.createPaymentAdviseNote);

  void verifyStep3InitialField() {
    final defaultPaymentMethod = 'Payment Gateway'.tr();

    verifyWarningMessage();
    expect(
      find.textContaining('Select payment method'.tr()),
      findsAtLeastNWidgets(1),
    );
    expect(
      find.textContaining(defaultPaymentMethod),
      findsAtLeastNWidgets(1),
    );
    expect(radioPaymentGateway, findsAtLeastNWidgets(1));
    expect(
      tester.widget<Radio>(radioPaymentGateway).value,
      equals(PaymentMethodValue(defaultPaymentMethod)),
    );
  }

  void verifyWarningMessage() {
    expect(createPaymentAdviseNote, findsOneWidget);
  }

  void verifyOrderAddressVisible(String address) {
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget.key == WidgetKeys.addressInfoSectionActionLabel &&
            widget is Text &&
            (widget.data ?? '').contains(address),
      ),
      findsOneWidget,
    );
  }

  void verifyCustomerCode(String customerCode) {
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget.key == WidgetKeys.addressInfoSectionCustomerCodeLabel &&
            widget is Text &&
            (widget.data ?? '').contains(customerCode),
      ),
      findsOneWidget,
    );
  }

  void verifyShipToCode(String shipToCode) {
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget.key == WidgetKeys.addressInfoSectionDeliveryToLabel &&
            widget is Text &&
            (widget.data ?? '').contains(shipToCode),
      ),
      findsOneWidget,
    );
  }

  void verifyGeneratePaymentAdviceButton() {
    expect(generatePaymentAdviceButton, findsOneWidget);
  }

  void verifyThePriceAndButton(
    double priceWithoutCredit,
    double priceWithCredit,
  ) {
    expect(
      find.textContaining(priceWithCredit.priceFormatted, findRichText: true),
      findsAtLeastNWidgets(1),
    );
    expect(
      find.textContaining(
        priceWithoutCredit.priceFormatted,
        findRichText: true,
      ),
      findsAtLeastNWidgets(1),
    );
    expect(generatePaymentAdviceButton, findsOneWidget);
  }

  void verifyTotalAmountToPay(double invoicePrice, double creditPrice) {
    final totalAmount = double.parse(
      tester
          .widget<PriceComponent>(find.byKey(WidgetKeys.totalAmountToPay))
          .price,
    );
    expect(totalAmount, invoicePrice - creditPrice);
  }
}

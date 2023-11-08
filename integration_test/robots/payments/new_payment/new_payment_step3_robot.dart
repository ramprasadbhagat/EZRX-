import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class NewPaymentStep3Robot {
  final WidgetTester tester;
  NewPaymentStep3Robot(this.tester);
  final generatePaymentAdviceButton = find.byKey(
    WidgetKeys.generatePaymentAdvice,
  );
  final payButton = find.byKey(WidgetKeys.payButton);
  final radioPaymentGateway = find.byKey(WidgetKeys.radioPaymentGateway);
  final paymentWebviewPage = find.byKey(WidgetKeys.paymentWebviewPage);
  void verifyStep3InitialField({
    required String step3Title,
    required String defaultPaymentMethod,
    required String salesOrg,
  }) {
    expect(
      find.textContaining(step3Title),
      findsAtLeastNWidgets(1),
    );
    expect(
      find.textContaining(defaultPaymentMethod),
      findsAtLeastNWidgets(1),
    );
    final amountPayable = tester
            .widget<Text>(
              find.byKey(WidgetKeys.priceTextData).first,
            )
            .data ??
        '';

    expect(
      find.textContaining(amountPayable, findRichText: true),
      findsAtLeastNWidgets(2),
    );
    expect(generatePaymentAdviceButton, findsOneWidget);
    expect(find.textContaining(salesOrg), findsAtLeastNWidgets(1));
    expect(radioPaymentGateway, findsAtLeastNWidgets(1));
    expect(
      tester.widget<Radio>(radioPaymentGateway).value,
      equals(PaymentMethodValue(defaultPaymentMethod)),
    );
  }

  Future<void> tapGeneratePaymentAdvice() async {
    await tester.tap(generatePaymentAdviceButton);
    await tester.pumpAndSettle();
  }

  void verifyPaymentAdviceGenerated(String paymentAdviceGenerated) {
    expect(
      find.textContaining(paymentAdviceGenerated),
      findsAtLeastNWidgets(1),
    );
  }

  Future<void> tapPayNow() async {
    await tester.tap(payButton);
    await tester.pumpAndSettle();
  }

  void verifyWebviewVisible() {
    expect(paymentWebviewPage, findsOneWidget);
  }
}

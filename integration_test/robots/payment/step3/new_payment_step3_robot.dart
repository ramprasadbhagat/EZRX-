import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../common/extension.dart';

class NewPaymentStep3Robot {
  final WidgetTester tester;
  NewPaymentStep3Robot(this.tester);

  final double priceWithoutCredit = 29958.00;
  final double priceWithCredit = 438.00;
  void verifyStep3InitialField() {
    expect(
      find.textContaining('Select payment method'.tr()),
      findsAtLeastNWidgets(1),
    );
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
  }
}

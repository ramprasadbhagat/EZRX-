import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../common/extension.dart';

class NewPaymentStep2Robot {
  final WidgetTester tester;
  NewPaymentStep2Robot(this.tester);
  final priceText = find.byKey(WidgetKeys.priceText);
  final checkAllWidget = find.byKey(WidgetKeys.checkAllWidget);
  final priceComponent = find.byKey(WidgetKeys.priceComponent);
  void verifyStep2InitialField(double price) {
    expect(
      find.textContaining('Select credit (Optional)'.tr()),
      findsOneWidget,
    );
    expect(
      find.byKey(WidgetKeys.genericKey(key: '')),
      findsOneWidget,
    );
    expect(priceComponent, findsNWidgets(2));
    expect(priceText, findsNWidgets(2));
    expect(checkAllWidget, findsOneWidget);
    expect(
      find.textContaining(price.priceFormatted, findRichText: true),
      findsAtLeastNWidgets(1),
    );
  }
}

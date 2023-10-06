import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter_test/flutter_test.dart';

import '../common/common_robot.dart';

class ProductSuggestionRobot extends CommonRobot {
  ProductSuggestionRobot(WidgetTester tester) : super(tester);

  Future<void> tapSearchResult(String materialNumber) async {
    await tester.tap(find.byKey(WidgetKeys.searchedProduct(materialNumber)));
    await tester.pumpAndSettle();
  }

   void verifySearchResults(String textSearch) {
    final productList = find.textContaining(textSearch);
    expect(productList, findsWidgets);
  }

  void verifySearchNotFound() {
    final message = find.text('That didn’t match anything'.tr());
    expect(message, findsWidgets);
  }
}

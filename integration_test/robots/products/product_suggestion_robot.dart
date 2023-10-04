import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter_test/flutter_test.dart';

import '../common/common_robot.dart';

class ProductSuggestionRobot extends CommonRobot {
  ProductSuggestionRobot(WidgetTester tester) : super(tester);

  Future<void> tapSearchResult(String materialNumber) async {
    await tester.tap(find.byKey(WidgetKeys.searchedProduct(materialNumber)));
    await tester.pumpAndSettle();
  }
}

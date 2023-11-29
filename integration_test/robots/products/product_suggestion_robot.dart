import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../common/common_robot.dart';

class ProductSuggestionRobot extends CommonRobot {
  ProductSuggestionRobot(WidgetTester tester) : super(tester);

  final suggestedProductsTile = find.byKey(WidgetKeys.suggestedProductsTile);

  Future<void> tapSearchResult(String materialNumber) async {
    await tester.tap(find.byKey(WidgetKeys.searchedProduct(materialNumber)));
    await tester.pumpAndSettle();
  }

  void verifySearchResults(String textSearch) {
    final productList = find.textContaining(textSearch);
    expect(productList, findsWidgets);
  }

  void verifyNoSuggestedProduct() {
    expect(suggestedProductsTile, findsNothing);
  }

  void verifyNoRecordFound({bool isVisible = true}) {
    expect(
      find.text('That didn’t match anything'.tr()),
      isVisible ? findsOneWidget : findsNothing,
    );
    expect(
      find.text(
        '${'Try adjusting your search or filter selection to find what you’re looking for'.tr()}.',
      ),
      isVisible ? findsOneWidget : findsNothing,
    );
  }

  void verifySuggestProductsSearch(String keyword) {
    final listSuggestTile =
        tester.widgetList<Text>(suggestedProductsTile).map((e) => e.data);

    for (final e in listSuggestTile) {
      expect(e, contains(keyword));
    }
  }
}

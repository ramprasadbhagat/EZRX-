import 'package:ezrxmobile/presentation/core/custom_search_bar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class ArticleRobot {
  final WidgetTester tester;

  ArticleRobot(this.tester);

  final firstArticleItemKey =
      find.byKey(WidgetKeys.genericKey(key: 'articleItem0'));
  final notFoundDataKey = find.byKey(WidgetKeys.noArticleToShowKey);
  final customSnackBar = find.byKey(WidgetKeys.customSnackBar);

  void verifySearchBar() {
    expect(find.byType(CustomSearchBar), findsOneWidget);
  }

  void verifyNotFoundData() {
    expect(notFoundDataKey, findsAtLeastNWidgets(1));
  }

  void verifyArticleItemsVisible() {
    expect(
      find.descendant(
        of: firstArticleItemKey,
        matching: find.byKey(WidgetKeys.articleImageKey),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: firstArticleItemKey,
        matching: find.byKey(WidgetKeys.articleTitleKey),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: firstArticleItemKey,
        matching: find.byKey(WidgetKeys.articleTimeKey),
      ),
      findsOneWidget,
    );
  }

  void verifyArticleItemstitle({required String searchKey}) {
    expect(
      find.descendant(
        of: firstArticleItemKey,
        matching: find.byKey(WidgetKeys.articleTitleKey),
      ),
      findsOneWidget,
    );
    expect(
      find.text(searchKey),
      findsOneWidget,
    );
  }

  Future<void> putSearchKey() async {
    final itemTitleList = tester
        .widgetList<Text>(find.byKey(WidgetKeys.articleTitleKey))
        .map((e) => e.data)
        .toList();
    await tester.enterText(
      find.byType(CustomSearchBar),
      itemTitleList.first.toString(),
    );
    await tester.tap(find.byKey(WidgetKeys.searchIconKey));
    await tester.pumpAndSettle();
  }

  Future<void> tapArticleItem() async {
    expect(
      firstArticleItemKey,
      findsOneWidget,
    );
    await tester.tap(firstArticleItemKey);
    await tester.pumpAndSettle();
  }

  void verifyFilterIcon() {
    expect(
      find.byIcon(
        Icons.tune,
      ),
      findsOneWidget,
    );
  }
}

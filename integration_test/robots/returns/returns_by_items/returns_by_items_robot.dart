import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:ezrxmobile/presentation/core/bonus_tag.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../common/extension.dart';

class ReturnsByItemsRobot {
  final WidgetTester tester;

  ReturnsByItemsRobot(this.tester);

  final searchBar = find.byKey(WidgetKeys.returnByItemsSearchBar);
  final exportReturnByItem = find.byKey(WidgetKeys.exportReturnByItem);
  final filterButton = find.byKey(WidgetKeys.returnByItemsFilterButton);
  final newRequestButton = find.byKey(WidgetKeys.returnByItemsNewRequestButton);
  final item = find.byKey(WidgetKeys.returnItemTile);
  final itemGroupDate = find.byKey(WidgetKeys.returnItemGroupDate);
  final newRequestFloatingButton =
      find.byKey(WidgetKeys.returnByItemsNewRequestButton);
  late final returnIdLabel = find.descendant(
    of: item,
    matching: find.byKey(WidgetKeys.commonTileItemHeader),
  );

  void verifySearchBarVisible() {
    expect(searchBar, findsOneWidget);
  }

  void verifyExportButtonVisible() {
    expect(exportReturnByItem, findsOneWidget);
  }

  Future<void> tapExportButton() async {
    await tester.tap(exportReturnByItem);
    await tester.pumpAndSettle();
  }

  void verifyInvalidSearchTextMessageVisible() {
    expect(
      find.text('Please enter at least 2 characters.'.tr()),
      findsOneWidget,
    );
  }

  Future<void> tapNewRequestFloatingButton() async {
    await tester.tap(newRequestFloatingButton);
    await tester.pumpAndSettle();
  }

  void verifyFilterButtonVisible() {
    expect(filterButton, findsOneWidget);
  }

  void verifyNewRequestButtonVisible() {
    expect(newRequestButton, findsOneWidget);
  }

  Future<void> tapFilterButton() async {
    await tester.tap(filterButton);
    await tester.pumpAndSettle();
  }

  void verifyFilterApplied(int count) {
    expect(
      find.descendant(
        of: filterButton,
        matching: find.text(count.toString()),
      ),
      findsOneWidget,
    );
  }

  void verifyReturnItemsVisible() {
    expect(itemGroupDate, findsAtLeastNWidgets(1));
    expect(item, findsAtLeastNWidgets(1));
    final itemCount = item.evaluate().length;
    // Verify return code
    expect(returnIdLabel, findsNWidgets(itemCount));
    // Verify material number
    expect(
      find.descendant(
        of: item,
        matching: find.byKey(WidgetKeys.commonTileItemLabel),
      ),
      findsNWidgets(itemCount),
    );
    // Verify material description
    expect(
      find.descendant(
        of: item,
        matching: find.byKey(WidgetKeys.commonTileItemTitle),
      ),
      findsNWidgets(itemCount),
    );
    // Verify qty
    expect(
      find.descendant(
        of: item,
        matching: find.byKey(WidgetKeys.commonTileItemQty),
      ),
      findsNWidgets(itemCount),
    );
    // Verify image
    expect(
      find.descendant(
        of: item,
        matching: find.byType(ProductImage),
      ),
      findsNWidgets(itemCount),
    );
    // Verify batch
    expect(
      find.descendant(
        of: item,
        matching: find.byKey(WidgetKeys.commonTileItemSubTitle),
      ),
      findsNWidgets(itemCount),
    );
    // Verify status
    expect(
      find.descendant(
        of: item,
        matching: find.byKey(WidgetKeys.returnItemTileStatus),
      ),
      findsNWidgets(itemCount),
    );
  }

  void verifyNoRecordFoundVisible() {
    expect(item, findsNothing);
    expect(find.byKey(WidgetKeys.noRecordsFoundSearchIcon), findsOneWidget);
    expect(find.text("That didn't match anything".tr()), findsOneWidget);
  }

  void verifyReturnsWithProductNameVisible(String searchKey) {
    expect(item, findsAtLeastNWidgets(1));
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget.key == WidgetKeys.commonTileItemTitle &&
            widget is Text &&
            widget.data!.contains(searchKey),
      ),
      findsAtLeastNWidgets(1),
    );
  }

  void verifyReturnsWithProductCodeVisible(String searchKey) {
    expect(item, findsAtLeastNWidgets(1));
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget.key == WidgetKeys.commonTileItemLabel &&
            widget is Text &&
            widget.data!.contains(searchKey),
      ),
      findsAtLeastNWidgets(1),
    );
  }

  void verifyReturnsWithIdVisible(String searchKey) {
    expect(item, findsAtLeastNWidgets(1));
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is Text &&
            widget.key == WidgetKeys.commonTileItemHeader &&
            (widget.data ?? '').contains(searchKey),
      ),
      findsAtLeastNWidgets(1),
    );
  }

  void verifyReturnItemVisible(String searchKey) {
    expect(item, findsAtLeastNWidgets(1));
    // Verify return Id
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is Text &&
            widget.key == WidgetKeys.commonTileItemHeader &&
            (widget.data ?? '').contains(searchKey),
      ),
      findsAtLeastNWidgets(1),
    );
    // Verify image
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is ProductImage &&
            widget.key == WidgetKeys.commonTileItemImage,
      ),
      findsAtLeastNWidgets(1),
    );
    // Verify material Qty
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is Text && widget.key == WidgetKeys.commonTileItemQty,
      ),
      findsAtLeastNWidgets(1),
    );
    // Verify material number
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is Text && widget.key == WidgetKeys.commonTileItemLabel,
      ),
      findsAtLeastNWidgets(1),
    );
    // Verify status
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is StatusLabel &&
            widget.key == WidgetKeys.returnItemTileStatus,
      ),
      findsAtLeastNWidgets(1),
    );
    // Verify material title
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is Text && widget.key == WidgetKeys.commonTileItemTitle,
      ),
      findsAtLeastNWidgets(1),
    );
    // Verify batch
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is Text && widget.key == WidgetKeys.commonTileItemSubTitle,
      ),
      findsAtLeastNWidgets(1),
    );
  }

  void verifyReturnItemWithBonusVisible(String searchKey) {
    expect(item, findsAtLeastNWidgets(1));
    // Verify return Id
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is Text &&
            widget.key == WidgetKeys.commonTileItemHeader &&
            (widget.data ?? '').contains(searchKey),
      ),
      findsAtLeastNWidgets(1),
    );
    // Verify image
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is ProductImage &&
            widget.key == WidgetKeys.commonTileItemImage,
      ),
      findsAtLeastNWidgets(1),
    );
    // Verify material Qty
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is Text && widget.key == WidgetKeys.commonTileItemQty,
      ),
      findsAtLeastNWidgets(1),
    );
    // Verify material number
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is Text && widget.key == WidgetKeys.commonTileItemLabel,
      ),
      findsAtLeastNWidgets(1),
    );
    // Verify status
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is StatusLabel &&
            widget.key == WidgetKeys.returnItemTileStatus,
      ),
      findsAtLeastNWidgets(1),
    );
    // Verify BonusTag
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is BonusTag &&
            widget.key == WidgetKeys.returnItemTileBonusTag,
      ),
      findsAtLeastNWidgets(1),
    );
    // Verify material title
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is Text && widget.key == WidgetKeys.commonTileItemTitle,
      ),
      findsAtLeastNWidgets(1),
    );
    // Verify batch
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is Text && widget.key == WidgetKeys.commonTileItemSubTitle,
      ),
      findsAtLeastNWidgets(1),
    );
  }

  void verifyReturnGroupInDateRangeVisible({
    required DateTime fromDate,
    required DateTime toDate,
  }) {
    verifyReturnItemsVisible();
    final dateText = tester
        .widgetList<Text>(
          find.descendant(
            of: itemGroupDate,
            matching: find.textContaining('Requested on'.tr()),
          ),
        )
        .map((e) => e.data!);
    for (final text in dateText) {
      final dateText = text.split('${'Requested on'.tr()} ');
      final date =
          DateFormat(DateTimeFormatString.displayDateFormat).parse(dateText[1]);
      expect(date.isDateBetween(fromDate, toDate), true);
    }
  }

  void verifyReturnsWithStatusVisible(String status) {
    verifyReturnItemsVisible();
    final statusText = tester
        .widgetList<Text>(
          find.descendant(
            of: find.byKey(WidgetKeys.returnItemTileStatus),
            matching: find.byType(Text),
          ),
        )
        .map((e) => e.data!);

    for (final text in statusText) {
      expect(text == status, true);
    }
  }

  Future<void> tapFirstReturn() async {
    await tester.tap(item.first);
    await tester.pumpAndSettle();
  }

  String getReturnIdText({required int index}) =>
      tester.widget<Text>(returnIdLabel.at(index)).data ?? '';

  void verifyReturnIdTextVisible(String text, {required int index}) {
    expect(tester.widget<Text>(returnIdLabel.at(index)).data, text);
  }

  void verifyReturnIdTextNotVisible(String text, {required int index}) {
    expect(
      returnIdLabel.evaluate().length - 1 < index ||
          tester.widget<Text>(returnIdLabel.at(index)).data != text,
      true,
    );
  }
}

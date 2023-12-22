import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/common_tile_item.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class AccountCreditDetailsRobot {
  final WidgetTester _tester;
  AccountCreditDetailsRobot(this._tester);

  //Finder
  final Finder _itemDetailsTile = find.byKey(WidgetKeys.creditDetailsTile);

  //Robot Functions
  void verify() {
    expect(find.byKey(WidgetKeys.creditDetailsPage), findsOneWidget);
  }

  Future<void> tapCloseButton() async {
    await _tester.tap(find.byKey(WidgetKeys.closeButton));
    await _tester.pumpAndSettle();
  }

  void verifyCreditDetailId(String searchKey) {
    expect(
      find.descendant(
        of: _itemDetailsTile,
        matching: find.byKey(WidgetKeys.creditItemId(searchKey)),
      ),
      findsOneWidget,
    );
  }

  void verifyCreditDetailStatus(String status) {
    expect(
      find.descendant(
        of: _itemDetailsTile,
        matching: find.text(status),
      ),
      findsOneWidget,
    );
  }

  void verifyCreditDetailDocumentDate(String documentDate) {
    expect(
      find.byKey(WidgetKeys.balanceTextRow('Document date'.tr(), documentDate)),
      findsOneWidget,
    );
  }

  void verifyCreditDetailDocumentType(String documentType) {
    expect(
      find.byKey(WidgetKeys.balanceTextRow('Document type'.tr(), documentType)),
      findsOneWidget,
    );
  }

  void verifyCreditDetailReferenceNumber(String referenceNumber) {
    expect(
      find.byKey(
        WidgetKeys.balanceTextRow('Reference Number'.tr(), referenceNumber),
      ),
      findsOneWidget,
    );
  }

  void verifyCreditDetails(String details) {
    expect(
      find.byKey(WidgetKeys.balanceTextRow('Details'.tr(), details)),
      findsOneWidget,
    );
  }

  void verifyOrderAddress(String address) {
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget.key == WidgetKeys.addressInfoSectionActionLabel &&
            widget is RichText &&
            widget.text.toPlainText().contains(address),
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

  void verifyDeliveryTo(String shipToCode) {
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

  void verifyCreditItemTotalPrice(String price) {
    expect(
      find.descendant(
        of: find.byKey(WidgetKeys.creditSummaryTile),
        matching: _getPriceFinder(price),
      ),
      findsOneWidget,
    );
  }

  void verifyReturnItems(int quantity) {
    expect(find.text('Return items ($quantity)'), findsOneWidget);
  }

  void verifyReturnMaterial(
    String materialNumber,
    int quantity,
    String unitPrice,
    String totalPrice,
  ) {
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is CommonTileItem &&
            widget.label == materialNumber &&
            widget.quantity == quantity.toString() &&
            widget.subtitle == unitPrice,
      ),
      findsAtLeastNWidgets(1),
    );
    expect(
      find.descendant(
        of: find.byType(CommonTileItem),
        matching: _getPriceFinder(totalPrice),
      ),
      findsAtLeastNWidgets(1),
    );
  }

  Finder _getPriceFinder(String price) => find.byWidgetPredicate(
        (widget) =>
            widget is RichText &&
            widget.key == WidgetKeys.priceComponent &&
            widget.text.toPlainText().contains(price),
      );
}

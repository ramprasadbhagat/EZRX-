import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/invoice_details/invoice_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class AccountInvoiceDetailRobot {
  final WidgetTester tester;

  AccountInvoiceDetailRobot(this.tester);

  late Finder _verifyingMaterial;

  void verifyPage() {
    expect(find.byType(InvoiceDetailsPage), findsOneWidget);
  }

  void verifyInvoiceIdAndStatus(String id, String status) {
    expect(
      find.byKey(WidgetKeys.balanceTextRow('${'Invoice'.tr()} #$id', status)),
      findsOneWidget,
    );
  }

  void verifyInvoiceId(String id) => expect(
        find.descendant(
          of: find.byKey(WidgetKeys.invoiceDetailIdAndStatus),
          matching: find.textContaining(id, findRichText: true),
        ),
        findsOneWidget,
      );

  void verifyCustomerCode(String customerCode) {
    expect(
      tester
          .widget<Text>(
            find.byKey(WidgetKeys.addressInfoSectionCustomerCodeLabel),
          )
          .data,
      contains(customerCode),
    );
  }

  void verifyDeliveryTo(String shipToCode) {
    expect(
      tester
          .widget<Text>(
            find.byKey(WidgetKeys.addressInfoSectionDeliveryToLabel),
          )
          .data,
      contains(shipToCode),
    );
  }

  void verifyOrderAddress(String address) {
    expect(
      tester
          .widget<RichText>(
            find.byKey(WidgetKeys.addressInfoSectionActionLabel),
          )
          .text
          .toPlainText(),
      contains(address),
    );
  }

  void verifySubTotal(String price) {
    expect(
      find.descendant(
        of: find.byKey(WidgetKeys.invoiceDetailSubTotal),
        matching: find.text(price, findRichText: true),
      ),
      findsOneWidget,
    );
  }

  void verifyGrandTotal(String price) {
    expect(
      find.descendant(
        of: find.byKey(WidgetKeys.invoiceDetailGrandTotal),
        matching: find.text(price, findRichText: true),
      ),
      findsOneWidget,
    );
  }

  void verifyDownloadEInvoiceButton() {
    expect(find.byKey(WidgetKeys.downloadEInvoiceButton), findsOneWidget);
  }

  Future<void> verifyMaterial(int groupIndex, int index) async {
    _verifyingMaterial = _material(groupIndex, index);
    await tester.dragUntilVisible(
      _verifyingMaterial,
      find.byKey(WidgetKeys.invoiceDetailsPageListView),
      const Offset(0, -200),
    );
    await tester.pump();
    expect(_verifyingMaterial, findsOneWidget);
  }

  void verifyMaterialNumber(String materialNumber) {
    final label = find.descendant(
      of: _verifyingMaterial,
      matching: find.byKey(WidgetKeys.commonTileItemLabel),
    );
    expect(tester.widget<Text>(label).data, equals(materialNumber));
  }

  void verifyMaterialQty(int qty) {
    final label = find.descendant(
      of: _verifyingMaterial,
      matching: find.byKey(WidgetKeys.invoiceDetailMaterialQty),
    );
    expect(tester.widget<Text>(label).data, contains(qty.toString()));
  }

  void verifyMaterialUnitPrice(String price) {
    final label = find.descendant(
      of: _verifyingMaterial,
      matching: find.byKey(WidgetKeys.invoiceDetailMaterialUnitPrice),
    );
    expect(
      find.descendant(
        of: label,
        matching: find.text(price, findRichText: true),
      ),
      findsOneWidget,
    );
  }

  void verifyMaterialTotalPrice(String price) {
    final label = find.descendant(
      of: _verifyingMaterial,
      matching: find.byKey(WidgetKeys.invoiceDetailMaterialTotalPrice),
    );
    expect(
      find.descendant(
        of: label,
        matching: find.text(price, findRichText: true),
      ),
      findsOneWidget,
    );
  }

  Finder _material(int groupIndex, int index) =>
      find.byKey(WidgetKeys.invoiceDetailMaterial(groupIndex, index));
}

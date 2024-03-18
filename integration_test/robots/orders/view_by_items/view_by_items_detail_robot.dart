import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/address_info_section.dart';
import 'package:ezrxmobile/presentation/core/common_tile_item.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:ezrxmobile/presentation/core/status_tracker.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_item_details/view_by_item_details.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_order_details/view_by_order_details.dart';
import 'package:ezrxmobile/presentation/payments/invoice_details/invoice_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../common/common_robot.dart';
import '../../common/extension.dart';

class ViewByItemsDetailRobot extends CommonRobot {
  ViewByItemsDetailRobot(WidgetTester tester) : super(tester);

  final statusTrackerSection = find.byType(StatusTrackerSection);
  final addressSection = find.byType(AddressInfoSection);
  final itemDetailSection = find.byType(ItemDetailsSection);
  final otherItemDetailSection = find.byType(OtherItemDetailsSection);
  final orderItem = find.byType(CommonTileItem);
  final offerTag = find.byKey(WidgetKeys.offerTag);
  final bundleTag = find.byKey(WidgetKeys.bundleTag);
  final bonusTag = find.byKey(WidgetKeys.commonTileItemStatusLabel);
  Finder get freePrice => find.descendant(
        of: find.byKey(WidgetKeys.cartItemProductTotalPrice),
        matching: find.text('FREE'.tr(), findRichText: true),
      );
  final buyAgainButton = find.byKey(WidgetKeys.viewByItemDetailBuyAgainButton);
  final expandButton = find.byKey(WidgetKeys.viewByItemDetailExpandButton);
  final qtyLabel = find.byKey(WidgetKeys.cartItemProductQty);

  void verifyPage() {
    expect(find.byType(ViewByItemDetailsPage), findsOneWidget);
  }

  void verifyHeader() {
    expect(
      find.byKey(WidgetKeys.viewByItemsOrderDetailOrderCode),
      findsOneWidget,
    );
    expect(
      find.byKey(WidgetKeys.viewByItemsOrderDetailOrderDate),
      findsOneWidget,
    );
    expect(
      find.byKey(WidgetKeys.viewByItemsOrderDetailInvoiceNumber),
      findsOneWidget,
    );
    expect(
      find.byKey(WidgetKeys.viewByItemsOrderDetailPoReference),
      findsOneWidget,
    );
  }

  Future<void> tapOrderNumber() async {
    await tester.tap(find.byKey(WidgetKeys.viewByOrderOrderNumberButton));
    await tester.pumpUntilVisible(find.byType(ViewByOrderDetailsPage));
  }

  String getInvoiceNumber() {
    final invoiceWidget = tester.widget<InvoiceNumberSection>(
      find.byKey(WidgetKeys.viewByItemsOrderDetailInvoiceNumber),
    );

    return invoiceWidget.invoiceNumber;
  }

  Future<void> tapInvoiceNumber() async {
    await tester
        .tap(find.byKey(WidgetKeys.viewByItemsOrderDetailsInvoiceNumberButton));
    await tester.pumpUntilVisible(find.byType(InvoiceDetailsPage));
  }

  void verifyStatusTracker() {
    expect(statusTrackerSection, findsOneWidget);
  }

  void verifyAddress() {
    expect(
      find.byKey(WidgetKeys.addressInfoSectionActionLabel),
      findsOneWidget,
    );
    expect(
      find.byKey(WidgetKeys.addressInfoSectionCustomerCodeLabel),
      findsOneWidget,
    );
    expect(
      find.byKey(WidgetKeys.addressInfoSectionDeliveryToLabel),
      findsOneWidget,
    );
  }

  void verifyExpandButton({bool isVisible = true}) =>
      expect(expandButton, isVisible ? findsOneWidget : findsNothing);

  Future<void> tapExpandButton() async {
    await tester.tap(expandButton);
    await tester.pumpAndSettle();
  }

  Future<void> tapBuyAgainButton() async {
    await tester.tap(buyAgainButton);
    await tester.pumpAndSettle();
  }

  void verifyBuyAgainButton({required bool isVisible}) {
    expect(buyAgainButton, isVisible ? findsOneWidget : findsNothing);
  }

  Future<void> verifyItemComponent() async {
    await scrollEnsureFinderVisible(orderItem.first);
    _verifyItemComponent(orderItem);
    _verifyItemComponent(find.byKey(WidgetKeys.commonTileItemTitle));
    _verifyItemComponent(find.byKey(WidgetKeys.commonTileItemLabel));
    _verifyItemComponent(find.byType(ProductImage));
    _verifyItemComponent(find.byKey(WidgetKeys.orderItemStatusKey));
    _verifyItemComponent(qtyLabel);
  }

  Future<void> verifyManufacturerName(String manufacturerName) async {
    await scrollEnsureFinderVisible(addressSection);
    final manufacturerFinder =
        find.byKey(WidgetKeys.manufacturerMaterials).first;
    await scrollEnsureFinderVisible(manufacturerFinder);
    expect(tester.widget<Text>(manufacturerFinder).data, manufacturerName);
  }

  void verifyMaterialNumber(String materialNumber) => _verifyItemComponent(
        find.byWidgetPredicate(
          (widget) =>
              widget.key == WidgetKeys.commonTileItemLabel &&
              widget is Text &&
              (widget.data ?? '').contains(materialNumber),
        ),
      );

  void verifyQty(int qty) {
    final widget = tester.widget<Text>(
      find.descendant(of: itemDetailSection, matching: qtyLabel),
    );
    expect(widget.data ?? '', contains(qty.toString()));
  }

  void verifyBonusLabel() => _verifyItemComponent(bonusTag);

  void verifyOfferTag() => _verifyItemComponent(offerTag);

  void verifyBundleTag() => _verifyItemComponent(bundleTag);

  void verifyFreePrice() => _verifyItemComponent(freePrice);

  void _verifyItemComponent(Finder finder) => expect(
        find.descendant(of: itemDetailSection, matching: finder),
        findsOneWidget,
      );

  Future<void> verifyOtherItemsComponent({bool isVisible = true}) async {
    await scrollEnsureFinderVisible(otherItemDetailSection);
    expect(
      find.descendant(of: otherItemDetailSection, matching: orderItem),
      isVisible ? findsWidgets : findsNothing,
    );
  }

  late Finder _verifyingItem;

  Future<void> startVerifyOtherItem(int index) async {
    final item = find.descendant(
      of: otherItemDetailSection,
      matching: find.byKey(WidgetKeys.genericKey(key: index.toString())),
    );
    await scrollEnsureFinderVisible(
      find.descendant(of: item, matching: qtyLabel),
    );
    _verifyingItem = item;
  }

  void verifyOtherItemQty(int qty) {
    final widget = tester.widget<Text>(
      find.descendant(of: _verifyingItem, matching: qtyLabel),
    );
    expect(widget.data ?? '', contains(qty.toString()));
  }

  void verifyOtherItemBonusLabel() => expect(
        find.descendant(of: _verifyingItem, matching: bonusTag),
        findsOneWidget,
      );

  void verifyOtherItemOfferTag() => expect(
        find.descendant(of: _verifyingItem, matching: offerTag),
        findsOneWidget,
      );

  void verifyOtherItemBundleTag() => expect(
        find.descendant(of: _verifyingItem, matching: bundleTag),
        findsOneWidget,
      );

  void verifyOtherItemFreePrice() => expect(
        find.descendant(of: _verifyingItem, matching: freePrice),
        findsOneWidget,
      );

  void verifyCovidMaterialLabel() {
    expect(find.byKey(WidgetKeys.covidLabel), findsWidgets);
  }
}

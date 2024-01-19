import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/address_info_section.dart';
import 'package:ezrxmobile/presentation/core/bonus_tag.dart';
import 'package:ezrxmobile/presentation/core/custom_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/checkout/widgets/po_upload_attachment_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class CheckoutRobot {
  final WidgetTester tester;

  CheckoutRobot(this.tester);

  final page = find.byKey(WidgetKeys.checkoutPage);
  final placeOrderButton = find.byKey(WidgetKeys.checkoutButton);
  final poReferenceField =
      find.byKey(WidgetKeys.genericKey(key: 'pOReferenceKey'));
  final deliveryDateField = find.byKey(WidgetKeys.deliveryDate);
  final referenceNoteField =
      find.byKey(WidgetKeys.genericKey(key: 'referenceNoteKey'));
  final paymentTermField = find.byKey(WidgetKeys.paymentTermDropdownKey);
  final contactPersonField =
      find.byKey(WidgetKeys.genericKey(key: 'contactPersonKey'));
  final mobileNumberField = find.byKey(WidgetKeys.mobileNumber);
  final deliveryInstructionField =
      find.byKey(WidgetKeys.genericKey(key: 'deliveryInstructionKey'));
  final poAttachmentSection = find.byType(PoAttachmentUpload);
  final stickyGrandTotal = find.byKey(WidgetKeys.priceSummaryGrandTotal);
  final principalLabel = find.byKey(WidgetKeys.cartPrincipalLabel);
  final materialQtyLabel = find.byKey(WidgetKeys.cartItemProductQty);
  final materialDescriptionLabel =
      find.byKey(WidgetKeys.cartItemProductMaterialDescription);
  final materialPrincipalLabel =
      find.byKey(WidgetKeys.cartItemProductPrincipalName);
  final materialImage = find.byType(CustomImage);

  void verifyPage() {
    expect(page, findsOneWidget);
  }

  Future<void> tapCloseButton() async {
    await tester.tap(find.byKey(WidgetKeys.closeButton));
    await tester.pumpAndSettle();
  }

  Future<void> tapDeliveryInformationArrowButton() async {
    final button = find.byKey(WidgetKeys.checkoutDeliveryArrowButton);
    await _scrollUntilVisible(button, reversed: true);
    await tester.tap(button);
    await tester.pumpAndSettle();
  }

  void verifyAddressSection() {
    expect(find.byType(AddressInfoSection), findsOneWidget);
  }

  void verifyCustomerCode(String customerCode) {
    final label = find.byKey(WidgetKeys.addressInfoSectionCustomerCodeLabel);
    expect(label, findsOneWidget);
    expect(tester.widget<Text>(label).data, contains(customerCode));
  }

  void verifyDeliveryTo(String deliveryTo) {
    final label = find.byKey(WidgetKeys.addressInfoSectionDeliveryToLabel);
    expect(label, findsOneWidget);
    expect(tester.widget<Text>(label).data, contains(deliveryTo));
  }

  Future<void> verifyPoReferenceField({required bool isVisible}) =>
      _verifyDeliveryInformationComponent(poReferenceField, isVisible);

  Future<void> enterPoReference(String text) async {
    await tester.tap(poReferenceField);
    await tester.enterText(poReferenceField, text);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
  }

  void verifyEmptyPoReferenceMessage({required bool isVisible}) {
    expect(
      find.descendant(
        of: poReferenceField,
        matching: find.text('PO reference is a required field.'.tr()),
      ),
      isVisible ? findsOneWidget : findsNothing,
    );
  }

  Future<void> verifyDeliveryDateField({required bool isVisible}) =>
      _verifyDeliveryInformationComponent(deliveryDateField, isVisible);

  Future<void> verifyReferenceNoteField({required bool isVisible}) =>
      _verifyDeliveryInformationComponent(referenceNoteField, isVisible);

  Future<void> verifyPaymentTermField({required bool isVisible}) =>
      _verifyDeliveryInformationComponent(paymentTermField, isVisible);

  Future<void> verifyContactPersonField({required bool isVisible}) =>
      _verifyDeliveryInformationComponent(contactPersonField, isVisible);

  Future<void> verifyMobileNumberField({required bool isVisible}) =>
      _verifyDeliveryInformationComponent(mobileNumberField, isVisible);

  Future<void> verifyDeliveryInstructionField({required bool isVisible}) =>
      _verifyDeliveryInformationComponent(deliveryInstructionField, isVisible);

  Future<void> enterDeliveryInstruction(String text) async {
    await tester.tap(deliveryInstructionField);
    await tester.enterText(deliveryInstructionField, text);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
  }

  Future<void> verifyPoAttachmentSection({required bool isVisible}) =>
      _verifyDeliveryInformationComponent(poAttachmentSection, isVisible);

  Future<void> _verifyDeliveryInformationComponent(
    Finder finder,
    bool isVisible,
  ) async {
    if (isVisible) {
      await _scrollUntilVisible(finder);
    } else {
      expect(finder, findsNothing);
    }
  }

  Future<void> verifyYoursItemLabel(int qty) async {
    final label = find.byKey(WidgetKeys.checkoutItemsTotalQty);
    await _scrollUntilVisible(label);
    expect(tester.widget<Text>(label).data, contains(qty.toString()));
  }

  void verifyStickyTotalQty(int qty) {
    expect(
      tester.widget<Text>(find.byKey(WidgetKeys.priceSummaryTotalQty)).data,
      contains(qty.toString()),
    );
  }

  void verifyStickyGrandTotal(String price) {
    expect(
      find.descendant(
        of: stickyGrandTotal,
        matching: find.textContaining(price, findRichText: true),
      ),
      findsOneWidget,
    );
  }

  Future<void> tapStickyGrandTotal() async {
    await tester.tap(stickyGrandTotal);
    await tester.pumpAndSettle();
  }

  void verifyPlaceOrderButton() {
    expect(placeOrderButton, findsOneWidget);
  }

  Future<void> tapPlaceOrderButton() async {
    await tester.tap(placeOrderButton);
    await tester.pumpAndSettle();
  }

  Future<void> verifySubTotalLabel(String price) =>
      _verifyOrderSummaryComponent(
        find.byKey(WidgetKeys.checkoutSummarySubTotal),
        price,
      );

  Future<void> verifySmallOrderFeeLabel(String price) =>
      _verifyOrderSummaryComponent(
        find.byKey(WidgetKeys.checkoutSummarySmallOrderFee),
        price,
      );

  Future<void> verifyGrandTotalLabel(String price) =>
      _verifyOrderSummaryComponent(
        find.byKey(WidgetKeys.checkoutSummaryGrandTotal),
        price,
      );

  Future<void> verifyTotalSavingLabel(String price) =>
      _verifyOrderSummaryComponent(
        find.byKey(WidgetKeys.checkoutSummaryTotalSaving),
        price,
      );

  Future<void> _verifyOrderSummaryComponent(Finder label, String price) async {
    await _scrollUntilVisible(label);
    expect(
      find.descendant(
        of: label,
        matching: find.textContaining(price, findRichText: true),
      ),
      findsOneWidget,
    );
  }

  //============================================================
  //  Material
  //============================================================

  Future<void> verifyMaterialPrincipal(String text) =>
      _scrollUntilVisible(principalLabel);

  Future<void> verifyMaterial(String materialNumber) =>
      _scrollUntilVisible(_material(materialNumber));

  void verifyMaterialQty(String materialNumber, int qty) {
    final qtyLabel = find.descendant(
      of: _material(materialNumber),
      matching: materialQtyLabel,
    );
    expect(tester.widget<Text>(qtyLabel).data, contains(qty.toString()));
  }

  void verifyMaterialDescription(String materialNumber, String text) {
    final qtyLabel = find.descendant(
      of: _material(materialNumber),
      matching: materialDescriptionLabel,
    );
    expect(tester.widget<Text>(qtyLabel).data, equals(text));
  }

  void verifyMaterialImage(String materialNumber) {
    expect(
      find.descendant(of: _material(materialNumber), matching: materialImage),
      findsOneWidget,
    );
  }

  void verifyMaterialUnitPrice(String materialNumber, String price) {
    expect(
      find.descendant(
        of: find.descendant(
          of: _material(materialNumber),
          matching: find.byKey(WidgetKeys.cartItemProductUnitPrice),
        ),
        matching: find.textContaining(price, findRichText: true),
      ),
      findsOneWidget,
    );
  }

  void verifyMaterialTotalPrice(String materialNumber, String price) {
    expect(
      find.descendant(
        of: find.descendant(
          of: _material(materialNumber),
          matching: find.byKey(WidgetKeys.cartItemProductTotalPrice),
        ),
        matching: find.textContaining(price, findRichText: true),
      ),
      findsOneWidget,
    );
  }

  void verifyMaterialCounterOfferLabel(
    String materialNumber, {
    required bool isVisible,
  }) {
    expect(
      find.descendant(
        of: _material(materialNumber),
        matching: find.byKey(WidgetKeys.cartItemProductCounterOfferLabel),
      ),
      isVisible ? findsOneWidget : findsNothing,
    );
  }

  Finder _material(String materialNumber) =>
      find.byKey(WidgetKeys.cartItemProductTile(materialNumber));

  //============================================================
  //  Bundle
  //============================================================

  Future<void> verifyBundle(String bundleNumber) =>
      _scrollUntilVisible(_bundle(bundleNumber));

  void verifyBundleName(String bundleNumber, String bundleName) {
    final label = find.descendant(
      of: _bundle(bundleNumber),
      matching: find.byKey(WidgetKeys.cartItemBundleName),
    );
    expect(
      tester.widget<Text>(label).data,
      equals(bundleName),
    );
  }

  void verifyBundleRate(String bundleNumber, int qty, String rate) {
    final label = find.descendant(
      of: _bundle(bundleNumber),
      matching: find.byKey(WidgetKeys.cartItemBundleRate),
    );
    expect(
      tester.widget<Text>(label).data,
      equals(
        '${'Purchase'.tr()} $qty ${'or more for'.tr()} $rate ${'per item'.tr()}',
      ),
    );
  }

  Future<void> verifyBundleItem(String bundleNumber, String materialNumber) =>
      _scrollUntilVisible(_bundleItem(bundleNumber, materialNumber));

  void verifyBundleItemQty(
    String bundleNumber,
    String materialNumber,
    int text,
  ) {
    final label = find.descendant(
      of: _bundleItem(bundleNumber, materialNumber),
      matching: materialQtyLabel,
    );
    expect(tester.widget<Text>(label).data, contains(text.toString()));
  }

  void verifyBundleItemImage(
    String bundleNumber,
    String materialNumber,
  ) {
    expect(
      find.descendant(
        of: _bundleItem(bundleNumber, materialNumber),
        matching: materialImage,
      ),
      findsOneWidget,
    );
  }

  void verifyBundleItemDescription(
    String bundleNumber,
    String materialNumber,
    String text,
  ) {
    final label = find.descendant(
      of: _bundleItem(bundleNumber, materialNumber),
      matching: materialDescriptionLabel,
    );
    expect(tester.widget<Text>(label).data, equals(text));
  }

  void verifyBundleItemPrincipal(
    String bundleNumber,
    String materialNumber,
    String text,
  ) {
    final label = find.descendant(
      of: _bundleItem(bundleNumber, materialNumber),
      matching: materialPrincipalLabel,
    );
    expect(tester.widget<Text>(label).data, equals(text));
  }

  void verifyBundleTotalQty(String bundleNumber, int qty) {
    final label = find.descendant(
      of: _bundle(bundleNumber),
      matching: find.byKey(WidgetKeys.cartItemBundleQty),
    );
    expect(tester.widget<Text>(label).data, contains(qty.toString()));
  }

  void verifyBundleTotalPrice(String bundleNumber, String price) {
    final widget = find.descendant(
      of: _bundle(bundleNumber),
      matching: find.byKey(WidgetKeys.cartItemBundleTotalPrice),
    );
    expect(
      find.descendant(
        of: widget,
        matching: find.textContaining(price, findRichText: true),
      ),
      findsOneWidget,
    );
  }

  Finder _bundleItem(String bundleNumber, String materialNumber) =>
      find.descendant(
        of: _bundle(bundleNumber),
        matching: _material(materialNumber),
      );

  Finder _bundle(String bundleNumber) =>
      find.byKey(WidgetKeys.cartItemBundleTile(bundleNumber));

  //============================================================
  //  Bonus
  //============================================================

  Future<void> verifyBonusMaterial(
    String materialNumber,
    String bonusMaterialNumber,
  ) =>
      _scrollUntilVisible(_bonusItem(materialNumber, bonusMaterialNumber));

  void verifyBonusMaterialDescription(
    String materialNumber,
    String bonusMaterialNumber,
    String text,
  ) {
    expect(
      find.descendant(
        of: _bonusItem(materialNumber, bonusMaterialNumber),
        matching: find.byWidgetPredicate(
          (widget) =>
              widget.key == WidgetKeys.cartItemBonusMaterialDescription &&
              widget is Text &&
              widget.data == text,
        ),
      ),
      findsOneWidget,
    );
  }

  void verifyBonusMaterialImage(
    String materialNumber,
    String bonusMaterialNumber,
  ) {
    expect(
      find.descendant(
        of: _bonusItem(materialNumber, bonusMaterialNumber),
        matching: find.byType(CustomImage),
      ),
      findsOneWidget,
    );
  }

  void verifyBonusMaterialQty(
    String materialNumber,
    String bonusMaterialNumber,
    int qty,
  ) {
    final qtyLabel = find.descendant(
      of: _bonusItem(materialNumber, bonusMaterialNumber),
      matching: find.byKey(WidgetKeys.cartItemBonusQty),
    );
    expect(tester.widget<Text>(qtyLabel).data, contains(qty.toString()));
  }

  void verifyBonusMaterialFreeLabel(
    String materialNumber,
    String bonusMaterialNumber,
  ) {
    expect(
      find.descendant(
        of: _bonusItem(materialNumber, bonusMaterialNumber),
        matching: find.byKey(WidgetKeys.cartItemBonusFreeLabel),
      ),
      findsNWidgets(2),
    );
  }

  void verifyBonusMaterialTag(
    String materialNumber,
    String bonusMaterialNumber,
  ) {
    expect(
      find.descendant(
        of: _bonusItem(materialNumber, bonusMaterialNumber),
        matching: find.byType(BonusTag),
      ),
      findsOneWidget,
    );
  }

  Finder _bonusItem(String materialNumber, String bonusMaterialNumber) =>
      find.byKey(WidgetKeys.cartItemBonus(materialNumber, bonusMaterialNumber));

  Future<void> _scrollUntilVisible(
    Finder finder, {
    bool reversed = false,
  }) async {
    await tester.dragUntilVisible(
      finder,
      find.byKey(WidgetKeys.checkoutScrollList),
      Offset(0, reversed ? -100 : 100.0),
    );
    expect(finder, findsOneWidget);
    await tester.pump();
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter_test/flutter_test.dart';

class NewReturnStep2Robot {
  final WidgetTester tester;
  NewReturnStep2Robot(this.tester);
  final newRequestStep2ItemImage =
      find.byKey(WidgetKeys.newRequestStep2ItemImage);
  final newRequestStep2ItemproductImage = find.byKey(WidgetKeys.productImage);
  final newRequestStep2QuantityAndPrice =
      find.byKey(WidgetKeys.newRequestStep2QuantityAndPrice);
  final newRequestStep2DetailsSection =
      find.byKey(WidgetKeys.newRequestStep2DetailsSection);
  final newRequestStep2BonusItemSection =
      find.byKey(WidgetKeys.bonusItemSection);
  Finder newRequestStep2BalanceQuantityTextField(uuid) =>
      find.byKey(WidgetKeys.returnQuantityField(uuid));
  Finder bonusQuantityField(uuid) =>
      find.byKey(WidgetKeys.bonusQuantityField(uuid));
  Finder materialQuantityField(uuid) =>
      find.byKey(WidgetKeys.materialQuantityField(uuid));
  final nextButton = find.byKey(WidgetKeys.nextButton);
  final newRequestStep2ReasonDropdown =
      find.byKey(WidgetKeys.newRequestStep2ReasonDropdown);
  Finder newRequestStepsDropdownItem(option) =>
      find.byKey(WidgetKeys.newRequestStepsDropdownItem(option));
  final newRequestStep2RemoveIcon =
      find.byKey(WidgetKeys.newRequestStep2RemoveIcon);
  final confirmBottomSheetConfirmButton =
      find.byKey(WidgetKeys.confirmBottomSheetConfirmButton);
  final materialReturnDetailsSection =
      find.byKey(WidgetKeys.materialReturnDetailsSection);
  final bonusItemSection = find.byKey(WidgetKeys.bonusItemSection);

  void verifyReturnDetailDisplayed(String materialNumber, String materialName) {
    expect(find.text(materialNumber), findsOneWidget);
    expect(find.text(materialName), findsOneWidget);
    expect(newRequestStep2ItemImage, findsAtLeastNWidgets(1));
    expect(newRequestStep2ItemproductImage, findsAtLeastNWidgets(1));
    expect(newRequestStep2QuantityAndPrice, findsAtLeastNWidgets(1));
    expect(newRequestStep2DetailsSection, findsAtLeastNWidgets(1));
  }

  void verifyReturnDetailDisplayedWithBonus() {
    expect(newRequestStep2ItemImage, findsAtLeastNWidgets(1));
    expect(newRequestStep2ItemproductImage, findsAtLeastNWidgets(1));
    expect(newRequestStep2QuantityAndPrice, findsAtLeastNWidgets(1));
    expect(newRequestStep2DetailsSection, findsAtLeastNWidgets(1));
    expect(newRequestStep2BonusItemSection, findsAtLeastNWidgets(1));
  }

  bool _hasBonusSection(String uuid) {
    return tester.widgetList(bonusQuantityField(uuid)).isNotEmpty;
  }

  Future<void> _dragTo(Finder finder) async {
    await tester.dragUntilVisible(
      finder,
      find.byKey(
        WidgetKeys.returnDetailsListView,
      ),
      const Offset(0, -200),
    );
    await tester.pumpAndSettle();
  }

  Future<void> enterReturnQuantity(String returnQuantity, String uuid) async {
    final materialTextField = find.descendant(
      of: materialQuantityField(uuid),
      matching: newRequestStep2BalanceQuantityTextField(uuid),
    );
    if (!_hasBonusSection(uuid)) {
      await tester.enterText(materialTextField, returnQuantity);
      await tester.pumpAndSettle();
      return;
    } else {
      final bonusTextField = find.descendant(
        of: bonusQuantityField(uuid),
        matching: newRequestStep2BalanceQuantityTextField(uuid),
      );
      await tester.enterText(materialTextField, returnQuantity);
      await tester.pumpAndSettle();
      await _dragTo(bonusTextField);
      await tester.enterText(bonusTextField, returnQuantity);
      await tester.pumpAndSettle();
      await _dragTo(materialTextField);
      return;
    }
  }

  Future<void> tapNextButton() async {
    await tester.tap(nextButton);
    await tester.pumpAndSettle();
  }

  void verifyReturnQuantityCannotExceedBalanceQuantity() {
    expect(
      find.text('Return quantity cannot exceed balance quantity.'.tr()),
      findsAtLeastNWidgets(1),
    );
  }

  Future<void> selectReason(String reason, String uuid) async {
    final materialTextField = find.descendant(
      of: materialQuantityField(uuid),
      matching: newRequestStep2BalanceQuantityTextField(uuid),
    );
    if (!_hasBonusSection(uuid)) {
      await _dragTo(materialTextField);
      expect(newRequestStep2ReasonDropdown, findsOneWidget);
      await tester.tap(newRequestStep2ReasonDropdown);
      await tester.pumpAndSettle();
      await tester.tap(find.text(reason));
      await tester.pumpAndSettle();
    } else {
      final bonusTextField = find.descendant(
        of: bonusQuantityField(uuid),
        matching: newRequestStep2BalanceQuantityTextField(uuid),
      );
      await _dragTo(materialTextField);
      expect(newRequestStep2ReasonDropdown, findsAtLeastNWidgets(2));
      await tester.tap(newRequestStep2ReasonDropdown.first);
      await tester.pumpAndSettle();
      await tester.tap(find.text(reason));
      await tester.pumpAndSettle();
      await _dragTo(bonusTextField);
      await tester.tap(newRequestStep2ReasonDropdown.last);
      await tester.pumpAndSettle();
      await tester.tap(find.text(reason));
      await tester.pumpAndSettle();
    }
    await tester.tap(nextButton);
    await tester.pumpAndSettle();
  }

  void verifyNextToStep3(String materialNumber, String materialName) {
    expect(find.text(materialNumber), findsOneWidget);
    expect(find.text(materialName), findsOneWidget);
  }

  Future<void> deleteItem() async {
    expect(newRequestStep2RemoveIcon, findsOneWidget);
    await tester.tap(newRequestStep2RemoveIcon);
    await tester.pumpAndSettle();
    expect(confirmBottomSheetConfirmButton, findsOneWidget);
    await tester.tap(confirmBottomSheetConfirmButton);
    await tester.pumpAndSettle();
  }

  void verifyCannotMoveWithoutReturnQuantity() {
    expect(
      find.text('Return quantity is required field.'.tr()),
      findsAtLeastNWidgets(1),
    );
    expect(
      find.text('Please ensure all required fields are filled.'.tr()),
      findsOneWidget,
    );
  }

  void verifyCannotMoveWithoutReason() {
    expect(
      find.text('Return reason is required field.'.tr()),
      findsAtLeastNWidgets(1),
    );
    expect(
      find.text('Please ensure all required fields are filled.'.tr()),
      findsOneWidget,
    );
  }
}

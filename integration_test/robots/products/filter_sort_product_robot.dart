import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../common/common_robot.dart';

class FilterSortProductRobot extends CommonRobot {
  final manufacturerLabel = find.text('Manufacturer'.tr());
  final countryLabel = find.text('Country of origin'.tr());

  FilterSortProductRobot(WidgetTester tester) : super(tester);
  void verifyCheckboxCheckedShowProduct(
    String checkbox,
    bool isChecked,
  ) {
    final checkboxFavorites =
        find.byKey(WidgetKeys.showProductCheckbox(checkbox));
    expect(
      tester.firstWidget<CheckboxListTile>(checkboxFavorites).value,
      isChecked,
    );
  }

  Future<void> chooseSortProductsBy(String sortType) async {
    final radioSort = find.byKey(WidgetKeys.sortByRadio(sortType));
    await tester.tap(radioSort);
    await tester.pumpAndSettle();
  }

  Future<void> openFilterManufacturerScreen() async {
    await tester.tap(manufacturerLabel);
    await tester.pumpAndSettle();
  }

  void verifyFilterManufacturerVisible() {
    expect(manufacturerLabel, findsOneWidget);
  }

  Future<void> openFilterCountryOfOriginScreen() async {
    await tester.tap(countryLabel);
    await tester.pumpAndSettle();
  }

  void verifyFilterCountryOfOriginVisible() {
    expect(countryLabel, findsOneWidget);
  }

  void verifyCountryListSelectedVisible(int countSelected) {
    expect(
      tester
              .widget<Text>(
                find.byKey(WidgetKeys.countryListSelectedLength),
              )
              .data ??
          ' ',
      '$countSelected selected',
    );
  }

  void verifyManufactureListSelectedVisible(int countSelected) {
    expect(
      tester
              .widget<Text>(
                find.byKey(WidgetKeys.manufactureListSelectedLength),
              )
              .data ??
          ' ',
      '$countSelected selected',
    );
  }

  Future<void> tapFilterApplyButton() async {
    final filterApplyButton = find.byKey(WidgetKeys.filterApplyButton);
    await tester.tap(filterApplyButton);
    await tester.pumpAndSettle();
  }

  Future<void> tapFilterResetButton() async {
    final filterResetButton = find.byKey(WidgetKeys.filterResetButton);
    await tester.tap(filterResetButton);
    await tester.pumpAndSettle();
  }

  void verifyRadioSort(String sortType, bool isChecked) {
    final radioSort = find.byKey(WidgetKeys.sortByRadio(sortType));
    expect(
      tester.firstWidget<RadioListTile>(radioSort).checked,
      isChecked,
    );
  }

  Future<void> tapFirstSuggestedManufacturer() async {
    final suggestedManufacturer =
        find.byKey(WidgetKeys.suggestedManufacturer).first;
    await tester.tap(suggestedManufacturer);
    await tester.pumpAndSettle();
  }

  Future<void> tapFirstSuggestedCountry() async {
    final suggestedCountry = find.byKey(WidgetKeys.suggestedCountry).first;
    await tester.tap(suggestedCountry);
    await tester.pumpAndSettle();
  }

  void verifyManufacturerSelected(String filterSelected) {
    expect(
      find.byKey(WidgetKeys.manufacturerFilterSelected(filterSelected)),
      findsOneWidget,
    );
  }

  void verifyListCountryOfOriginMatched(String keyword) {
    final suggestedCountryText = find.byKey(WidgetKeys.suggestedCountryText);
    final listSuggest =
        tester.widgetList<Text>(suggestedCountryText).map((e) => e.data);

    for (final e in listSuggest) {
      expect(e, contains(keyword));
    }
  }

  void verifyListManufacturerMatched(String keyword) {
    final suggestedManufacturerText =
        find.byKey(WidgetKeys.suggestedManufacturerText);
    final listSuggest =
        tester.widgetList<Text>(suggestedManufacturerText).map((e) => e.data);

    for (final e in listSuggest) {
      expect(e, contains(keyword));
    }
  }

  void verifyDefaultFilterProduct() {
    verifyCheckboxCheckedShowProduct(
      'Favourites',
      false,
    );

    verifyCheckboxCheckedShowProduct(
      'Items with offers',
      false,
    );
    verifyCheckboxCheckedShowProduct(
      'Bundle offers',
      false,
    );
    verifyRadioSort(
      'A-Z',
      true,
    );
    verifyRadioSort(
      'Z-A',
      false,
    );

    verifyFilterManufacturerVisible();
    verifyFilterCountryOfOriginVisible();
  }
}

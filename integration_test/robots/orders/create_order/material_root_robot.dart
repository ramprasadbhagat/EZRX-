import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class MaterialRootRobot {
  late WidgetTester tester;
  MaterialRootRobot(this.tester);

  final bundles = find.byKey(const Key('bundles'));
  final principleSelector = find.byKey(const Key('principleSelector')).first;
  final therapeuticSelector = find.byKey(const Key('therapeuticSelector'));
  final brandSelector = find.byKey(const Key('brandSelector'));
  final materialFilterPage = find.byKey(const Key('materialFilterPage'));
  final materialFilterSearchField =
      find.byKey(const Key('materialFilterSearchField'));

  final applyMaterialFilter = find.byKey(const Key('applyMaterialFilter'));
  final filterclearMaterialList =
      find.byKey(const Key('filterclearMaterialList'));

  final material = find.byKey(const Key('material'));
  final covid = find.byKey(const Key('covid-19'));
  final announcementCloseIcon = find.byKey(const Key('announcementCloseIcon'));
  void verify() {
    expect(find.byKey(const Key('materialRootPage')), findsOneWidget);
  }

  Future<void> findAndCloseAnnouncementIcon() async {
    if (announcementCloseIcon.evaluate().isNotEmpty) {
      await tester.tap(announcementCloseIcon.first);
      await tester.pumpAndSettle();
    }
  }

  void findBundlesTab() {
    expect(bundles, findsOneWidget);
  }

  void findNoBundleTab() {
    expect(bundles, findsNothing);
  }

  void findMaterialTab() {
    expect(material, findsOneWidget);
  }

  Finder _getPrincipleItemKey({
    required String principleFullText,
  }) {
    return find.byKey(Key('filterOption-$principleFullText'));
  }

  void findPrincipleSelector() {
    expect(principleSelector, findsOneWidget);
  }

  Future<void> tapPrincipleSelector() async {
    await tester.tap(principleSelector);
    await tester.pumpAndSettle();
  }

  void verifyMaterialFilterPage() {
    expect(materialFilterPage, findsOneWidget);
  }

  Future<void> enterTextAndSubmit({
    required String principleSearchText,
  }) async {
    await tester.enterText(materialFilterSearchField, principleSearchText);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
  }

  void verifySearchResultAppears({
    required String principleFullText,
  }) {
    expect(_getPrincipleItemKey(principleFullText: principleFullText),
        findsOneWidget);
  }

  Future<void> tapOnSearchResult({
    required String principleFullText,
  }) async {
    await tester
        .tap(_getPrincipleItemKey(principleFullText: principleFullText));
    await tester.pumpAndSettle();
  }

  void verifyApplyButton() {
    expect(applyMaterialFilter, findsOneWidget);
  }

  Future<void> tapApplyButton() async {
    await tester.tap(applyMaterialFilter);
    await tester.pumpAndSettle();
  }

  void findClearFilter() {
    expect(filterclearMaterialList, findsOneWidget);
  }

  Future<void> tapClearFilter() async {
    await tester.tap(filterclearMaterialList);
    await tester.pumpAndSettle();
  }

  void findCovidTab() {
    expect(covid, findsOneWidget);
  }

  Future<void> tapBundlesTab() async {
    await tester.tap(bundles);
    await tester.pumpAndSettle();
  }

  Future<void> tapMaterialTab() async {
    await tester.tap(material);
    await tester.pumpAndSettle();
  }

  Future<void> tapCovidTab() async {
    await tester.tap(covid);
    await tester.pumpAndSettle();
  }

  Future<void> goBack() async {
    // ignore: omit_local_variable_types
    final NavigatorState navigator = tester.state(find.byType(Navigator));
    navigator.pop();
    await tester.pumpAndSettle();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class MaterialRootRobot {
  late WidgetTester tester;
  MaterialRootRobot(this.tester);

  final bundles = find.byKey(const Key('bundles'));
  final material = find.byKey(const Key('material'));
  final covid = find.byKey(const Key('covid-19'));

  void verify() {
    expect(find.byKey(const Key('materialRootPage')), findsOneWidget);
  }

  void findBundlesTab() {
    expect(bundles, findsOneWidget);
  }

  void findMaterialTab() {
    expect(material, findsOneWidget);
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

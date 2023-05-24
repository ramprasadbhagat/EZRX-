import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class BundleListRobot {
  late WidgetTester tester;
  BundleListRobot(this.tester);

  void verify() {
    expect(find.byKey(const Key('materialBundleListPage')), findsOneWidget);
  }

  Future<void> tapBundle(String bundleCode) async {
    final materialBundle = find.byKey(Key('materialBundleOption$bundleCode'));
    await tester.ensureVisible(materialBundle);
    expect(materialBundle, findsOneWidget);
    await tester.tap(materialBundle);
    await tester.pumpAndSettle();
  }

  Future<void> goBack() async {
    // ignore: omit_local_variable_types
    final NavigatorState navigator = tester.state(find.byType(Navigator));
    navigator.pop();
    await tester.pumpAndSettle();
  }
}

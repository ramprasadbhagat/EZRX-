import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class OrderTemplateListRobot {
  final WidgetTester tester;

  OrderTemplateListRobot(this.tester);

  final deleteIcon = find.byKey(const Key('deleteFromList'));
  final confirmButton = find.byKey(const Key('Yes'));

  void verify() {
    final orderTemplateList = find.byKey(const Key('OrderTemplateListPage'));
    expect(orderTemplateList, findsOneWidget);
  }

  void findTemplateItem(String templateName) {
    final template = find.text(templateName);
    expect(template, findsOneWidget);
  }

  Future<void> tapTemplateItem(String templateName) async {
    final template = find.text(templateName);
    await tester.tap(template);
    await tester.pumpAndSettle();
  }

  void findTemplateItemDelete() {
    expect(deleteIcon, findsOneWidget);
  }

  Future<void> tapTemplateItemDelete() async {
    await tester.tap(deleteIcon);
    await tester.pumpAndSettle();
  }

  void verifyConfirmationDialog() {
    final dialog = find.byKey(const Key('confirmDialog'));
    expect(dialog, findsOneWidget);
  }

  void findConfirmButton() {
    expect(confirmButton, findsOneWidget);
  }

  Future<void> tapConfirmButton() async {
    await tester.tap(confirmButton);
    await tester.pumpAndSettle();
  }

  Future<void> goBack() async {
    // ignore: omit_local_variable_types
    final NavigatorState navigator = tester.state(find.byType(Navigator));
    navigator.pop();
    await tester.pump();
  }
}

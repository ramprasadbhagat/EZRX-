import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class CovidListRobot {
  late WidgetTester tester;
  CovidListRobot(this.tester);

  void verify() {
    expect(find.byKey(const Key('covidMaterialListPage')), findsOneWidget);
  }

  void findCovidMaterial(String materialNumber) {
    expect(
      find.byKey(Key('covidMaterialOption$materialNumber')),
      findsOneWidget,
    );
  }

  Future<void> tapCovidMaterial(String materialNumber) async {
    final covidMaterial = find.byKey(Key('covidMaterialOption$materialNumber'));
    await tester.tap(covidMaterial);
    await tester.pumpAndSettle();
  }
}

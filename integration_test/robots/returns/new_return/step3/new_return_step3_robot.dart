import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter_test/flutter_test.dart';

class NewReturnStep3Robot {
  final WidgetTester tester;
  NewReturnStep3Robot(this.tester);

  final submitButton = find.byKey(WidgetKeys.submitButton);
  final returnReferenceField = find.byKey(WidgetKeys.returnReferenceField);
  final specialInstructionsField =
      find.byKey(WidgetKeys.specialInstructionsField);
  final newRequestStep3MaterialDetail =
      find.byKey(WidgetKeys.newRequestStep3MaterialDetail);
  final returnFor = find.byKey(WidgetKeys.newRequestReturnFor);

  void verifyStep3Visible() {
    expect(returnReferenceField, findsOneWidget);
    expect(specialInstructionsField, findsOneWidget);
    expect(submitButton, findsOneWidget);
    expect(newRequestStep3MaterialDetail, findsOneWidget);
    expect(returnFor, findsOneWidget);
  }
}

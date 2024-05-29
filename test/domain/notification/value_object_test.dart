import 'package:ezrxmobile/domain/notification/value/value_object.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Notification Type value object', () {
    test('should return isOrder is true when type is OrderCancelled', () async {
      const input = 'OrderCancelled';
      final type = NotificationType(input);
      final result = type.isOrder;
      expect(result, true);
    });
  });
}

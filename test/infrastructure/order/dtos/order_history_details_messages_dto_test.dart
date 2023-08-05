import 'package:ezrxmobile/infrastructure/order/dtos/order_history_details_messages_dto.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;
  group('Test Order History Details Messages Dto ', () {
    setUp(() async {
      data = {
        'Type': 'fake-type',
        'Message': 'temp-message',
      };
    });

    test('Test fromDomain', () {
      final configs = OrderHistoryDetailsMessagesDto.fromDomain(
        OrderHistoryDetailsMessagesDto.fromJson(
          data,
        ).toDomain(),
      );

      expect(configs.type, 'fake-type');
    });

    test('Test toJson', () {
      final configs = OrderHistoryDetailsMessagesDto.fromDomain(
        OrderHistoryDetailsMessagesDto.fromJson(
          data,
        ).toDomain(),
      ).toJson();

      expect(configs['Type'], 'fake-type');
    });
  });
}

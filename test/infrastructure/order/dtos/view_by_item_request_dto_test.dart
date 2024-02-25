import 'package:ezrxmobile/domain/order/entities/view_by_item_request.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/view_by_item_request_dto.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../common_mock_data/customer_code_mock.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  group('Test view by item dto shipping info ', () {
    test('Test fromDomain if shipTo is empty', () {
      final viewByItemsRequest = ViewByItemRequest.empty();

      final variable = ViewByItemRequestDto.fromDomain(viewByItemsRequest);

      expect(variable.shipTo, []);
    });

    test('Test fromDomain if shipTo is not empty', () {
      final viewByItemsRequest = ViewByItemRequest.empty().copyWith(
        shipToCustomerCode: fakeShipToInfo.shipToCustomerCode,
      );

      final variable = ViewByItemRequestDto.fromDomain(viewByItemsRequest);

      expect(variable.shipTo, [fakeShipToInfo.shipToCustomerCode]);
    });
  });
}

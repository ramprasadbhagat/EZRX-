
import 'package:ezrxmobile/infrastructure/order/dtos/order_template_material_dto.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late dynamic data;
  group('Test order Template material ', () {
    setUp(() async {
      data = {
        'materialNumber': '1234',
        'qty': 10,
        'type': 'fake-type',
        'principalName': 'fake-name',
        'materialDescription': '',
        'hidePrice': false,
        'taxClassification': '',
        'materialGroup4': '',
        'hasValidTenderContract': true,
      };
    });

    test('Test fromDomain', () {
      final configsDto = OrderTemplateMaterialDto.fromDomain(
          OrderTemplateMaterialDto.fromJson(data)
              .toDomain());
      expect(configsDto.materialNumber, '1234');
    });

    test('Test toJson', () {
     final configsDto = OrderTemplateMaterialDto.fromDomain(
          OrderTemplateMaterialDto.fromJson(data)
              .toDomain()).toJson();
      expect(configsDto['materialNumber'], '1234');
    });
  });
}

import 'package:ezrxmobile/domain/order/entities/material_item.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_item_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/tender_contract_dto.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late MaterialItem data;
  late dynamic mapObject;
  group('Test bundleInfoDto ', () {
    setUp(() async {
      data = MaterialItem.empty().copyWith(
        batchNumber: '12345',
        materialNumber: MaterialNumber('12345'),
      );
      mapObject = {
        'batchNumber': '12345',
        'materialNumber': '12345',
        'tenderContract':
            TenderContractDto.fromDomain(TenderContract.empty()).toJson(),
      };
    });
    test('Test toDomain', () {
      final configs = MaterialItemDto.fromJson(mapObject).toDomain();

      expect(configs.batchNumber, '12345');
    });

    test('Test fromDomain', () {
      final configsDto = MaterialItemDto.fromDomain(data);
      expect(configsDto.batchNumber, '12345');
    });

    test('Test toJson', () {
      final configsDtoMap = MaterialItemDto.fromDomain(data).toJson();
      expect(configsDtoMap['materialNumber'], '12345');
    });
  });
}

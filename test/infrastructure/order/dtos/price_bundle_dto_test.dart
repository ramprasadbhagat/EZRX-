import 'package:ezrxmobile/infrastructure/order/dtos/price_bundle_dto.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  late dynamic data;
  group('Test bundleInfoDto ', () {
    setUp(() async {
      data = {
        'BundleName': '',
        'BundleCode': 'fake-code',
        'BundleInformation': []
      };
    });
    test('Test fromDomain', () {
      final configsDto =
          PriceBundleDto.fromDomain(PriceBundleDto.fromJson(data).toDomain());

      expect(configsDto.code, 'fake-code');
    });

    test('Test toJson', () {
      final configsDto =
          PriceBundleDto.fromDomain(PriceBundleDto.fromJson(data).toDomain())
              .toJson();

      expect(configsDto['BundleCode'], 'fake-code');
    });

    test('Test PriceBundleItemDto fromdomain', () {
      final data = {
        'Type': 'fake-type',
        'Sequence': 12,
        'Quantity': 1,
        'Rate': 10,
      };
      final configsDtoMap = PriceBundleItemDto.fromDomain(
        PriceBundleItemDto.fromJson(data).toDomain(),
      );
      expect(configsDtoMap.sequence, 12);
    });

    test('Test PriceBundleItemDto fromdomain', () {
      final data = {
        'Type': 'fake-type',
        'Sequence': 12,
        'Quantity': 1,
        'Rate': 10,
      };
      final configsDtoMap = PriceBundleItemDto.fromDomain(
        PriceBundleItemDto.fromJson(data).toDomain(),
      ).toJson();
      expect(configsDtoMap['Sequence'], 12);
    });
  });
}

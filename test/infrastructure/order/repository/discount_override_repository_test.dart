import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/discount_override_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/discount_override_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_dto.dart';
import 'package:ezrxmobile/infrastructure/order/repository/discount_override_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockConfig extends Mock implements Config {}

class DiscountOverrideLocalDataSourceMock extends Mock
    implements DiscountOverrideLocalDataSource {}

class DiscountOverrideRemoteDataSourceMock extends Mock
    implements DiscountOverrideRemoteDataSource {}

class CountlyServiceMock extends Mock implements CountlyService {}

void main() {
  late DiscountOverrideRepository discountOverrideRepository;
  late Config mockConfig;
  late DiscountOverrideLocalDataSource discountOverrideLocalDataSource;
  late DiscountOverrideRemoteDataSource discountOverrideRemoteDataSource;

  final fakeSaleOrg =
      SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2601'));
  final fakeCustomerCodeInfo =
      CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: '123456');

  setUpAll(() {
    mockConfig = MockConfig();
    discountOverrideLocalDataSource = DiscountOverrideLocalDataSourceMock();
    discountOverrideRemoteDataSource = DiscountOverrideRemoteDataSourceMock();

    discountOverrideRepository = DiscountOverrideRepository(
        config: mockConfig,
        localDataSource: discountOverrideLocalDataSource,
        remoteDataSource: discountOverrideRemoteDataSource);
  });

  group('discountOverrideRepository should - ', () {
    test('get discountOverride successfully locally ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => discountOverrideLocalDataSource.getPriceList())
          .thenAnswer((invocation) async => <Price>[]);

      final result =
          await discountOverrideRepository.getMaterialPriceWithOverride(
              customerCodeInfo: fakeCustomerCodeInfo,
              shipToInfo: ShipToInfo.empty().copyWith(
                shipToCustomerCode: 'fake-code',
              ),
              salesOrganisation: fakeSaleOrg,
              price: Price.empty().copyWith(
                priceOverride: PriceOverrideValue(70.0),
                zdp8Override: Zdp8OverrideValue(12.0),
                materialNumber: MaterialNumber('123456'),
              ));
      expect(
        result.isRight(),
        false,
      );
    });
    test('get discountOverride fail locally ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => discountOverrideLocalDataSource.getPriceList())
          .thenThrow((invocation) async => MockException());

      final result =
          await discountOverrideRepository.getMaterialPriceWithOverride(
              customerCodeInfo: fakeCustomerCodeInfo,
              shipToInfo: ShipToInfo.empty().copyWith(
                shipToCustomerCode: 'fake-code',
              ),
              salesOrganisation: fakeSaleOrg,
              price: Price.empty().copyWith(
                priceOverride: PriceOverrideValue(70.0),
                zdp8Override: Zdp8OverrideValue(12.0),
                materialNumber: MaterialNumber('123456'),
              ));
      expect(
        result.isLeft(),
        true,
      );
    });
    test('get discountOverride successfully remote ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(() => discountOverrideRemoteDataSource.getMaterialOverridePriceList(
          salesOrgCode: '2601',
          customerCode: '123456',
          shipToCode: 'fake-code',
          materialQuery: PriceDto.fromDomain(Price.empty().copyWith(
            priceOverride: PriceOverrideValue(70.0),
            zdp8Override: Zdp8OverrideValue(12.0),
            materialNumber: MaterialNumber('123456'),
            isPriceOverride: true,
          )).overrideQuery)).thenAnswer((invocation) async => [
            Price.empty().copyWith(
              priceOverride: PriceOverrideValue(70.0),
              zdp8Override: Zdp8OverrideValue(12.0),
              materialNumber: MaterialNumber('123456'),
              isPriceOverride: true,
            )
          ]);

      final result =
          await discountOverrideRepository.getMaterialPriceWithOverride(
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToInfo: ShipToInfo.empty().copyWith(
                shipToCustomerCode: 'fake-code',
              ),
        salesOrganisation: fakeSaleOrg,
        price: Price.empty().copyWith(
          priceOverride: PriceOverrideValue(70.0),
          zdp8Override: Zdp8OverrideValue(12.0),
          materialNumber: MaterialNumber('123456'),
          isPriceOverride: true,
        ),
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test('get discountOverride fail remote ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(() => discountOverrideRemoteDataSource.getMaterialOverridePriceList(
          salesOrgCode: '',
          customerCode: '',
          shipToCode: 'fake-code',
          materialQuery: {})).thenThrow((invocation) async => MockException());

      final result =
          await discountOverrideRepository.getMaterialPriceWithOverride(
              customerCodeInfo: fakeCustomerCodeInfo,
              shipToInfo: ShipToInfo.empty().copyWith(
                shipToCustomerCode: 'fake-code',
              ),
              salesOrganisation: fakeSaleOrg,
              price: Price.empty().copyWith(
                priceOverride: PriceOverrideValue(70.0),
                zdp8Override: Zdp8OverrideValue(12.0),
                materialNumber: MaterialNumber('123456'),
              ));
      expect(
        result.isLeft(),
        true,
      );
    });

    test(
        'get discountOverride successfully locally with condition zdp8Override valid',
        () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => discountOverrideLocalDataSource.getPriceList())
          .thenAnswer((invocation) async => <Price>[Price.empty()]);

      final result =
          await discountOverrideRepository.getMaterialPriceWithOverride(
              customerCodeInfo: fakeCustomerCodeInfo,
              shipToInfo: ShipToInfo.empty().copyWith(
                shipToCustomerCode: 'fake-code',
              ),
              salesOrganisation: fakeSaleOrg,
              price: Price.empty().copyWith(
                priceOverride: PriceOverrideValue(70.0),
                zdp8Override: Zdp8OverrideValue(12.0),
                materialNumber: MaterialNumber('123456'),
              ));
      expect(
        result.isRight(),
        true,
      );
    });

    test(
        'get discountOverride successfully locally with condition zdp8Override inValid',
        () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => discountOverrideLocalDataSource.getPriceList())
          .thenAnswer((invocation) async => <Price>[Price.empty()]);

      final result =
          await discountOverrideRepository.getMaterialPriceWithOverride(
            shipToInfo: ShipToInfo.empty().copyWith(
                shipToCustomerCode: 'fake-code',
              ),
              customerCodeInfo: fakeCustomerCodeInfo,
              salesOrganisation: fakeSaleOrg,
              price: Price.empty().copyWith(
                priceOverride: PriceOverrideValue(70.0),
                zdp8Override: Zdp8OverrideValue(0.0),
                materialNumber: MaterialNumber('123456'),
              ));
      expect(
        result.isRight(),
        true,
      );
    });

    test(
        'get discountOverride successfully locally with condition element and price material number same',
        () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => discountOverrideLocalDataSource.getPriceList()).thenAnswer(
          (invocation) async => <Price>[
                Price.empty().copyWith(materialNumber: MaterialNumber('123456'))
              ]);

      final result =
          await discountOverrideRepository.getMaterialPriceWithOverride(
              customerCodeInfo: fakeCustomerCodeInfo,
              shipToInfo: ShipToInfo.empty().copyWith(
                shipToCustomerCode: 'fake-code',
              ),
              salesOrganisation: fakeSaleOrg,
              price: Price.empty().copyWith(
                priceOverride: PriceOverrideValue(70.0),
                zdp8Override: Zdp8OverrideValue(0.0),
                materialNumber: MaterialNumber('123456'),
              ));
      expect(
        result.isRight(),
        true,
      );
    });
  });
}

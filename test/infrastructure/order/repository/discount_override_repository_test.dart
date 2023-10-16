import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';

import 'package:ezrxmobile/infrastructure/order/datasource/discount_override_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/discount_override_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/price_dto.dart';
import 'package:ezrxmobile/infrastructure/order/repository/discount_override_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';

class MockConfig extends Mock implements Config {}

class DiscountOverrideLocalDataSourceMock extends Mock
    implements DiscountOverrideLocalDataSource {}

class DiscountOverrideRemoteDataSourceMock extends Mock
    implements DiscountOverrideRemoteDataSource {}

void main() {
  late DiscountOverrideRepository discountOverrideRepository;
  late Config mockConfig;
  late DiscountOverrideLocalDataSource discountOverrideLocalDataSource;
  late DiscountOverrideRemoteDataSource discountOverrideRemoteDataSource;

  final fakePrice = Price.empty().copyWith(
    priceOverride: PriceOverrideValue(70.0),
    zdp8Override: Zdp8OverrideValue(12.0),
    materialNumber: MaterialNumber('123456'),
  );
  setUpAll(() {
    mockConfig = MockConfig();
    discountOverrideLocalDataSource = DiscountOverrideLocalDataSourceMock();
    discountOverrideRemoteDataSource = DiscountOverrideRemoteDataSourceMock();
    discountOverrideRepository = DiscountOverrideRepository(
      config: mockConfig,
      localDataSource: discountOverrideLocalDataSource,
      remoteDataSource: discountOverrideRemoteDataSource,
    );
  });

  group('discountOverrideRepository should - ', () {
    test('get discountOverride successfully locally ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => discountOverrideLocalDataSource.getPriceList())
          .thenAnswer((invocation) async => <Price>[]);

      final result =
          await discountOverrideRepository.getMaterialPriceWithOverride(
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
        salesOrganisation: fakeSalesOrganisation,
        price: fakePrice,
      );
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
        shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
        salesOrganisation: fakeSalesOrganisation,
        price: fakePrice,
      );
      expect(
        result.isLeft(),
        true,
      );
    });
    test('get discountOverride successfully remote ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(
        () => discountOverrideRemoteDataSource.getMaterialOverridePriceList(
          salesOrgCode: fakeSalesOrganisation.salesOrg.getOrCrash(),
          customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
          shipToCode: fakeCustomerCodeInfo.shipToInfos.first.shipToCustomerCode,
          materialQuery: PriceDto.fromDomain(
            fakePrice,
          ).overrideQuery,
        ),
      ).thenAnswer(
        (invocation) async => [fakePrice],
      );

      final result =
          await discountOverrideRepository.getMaterialPriceWithOverride(
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
        salesOrganisation: fakeSalesOrganisation,
        price: fakePrice,
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test('get discountOverride fail remote ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(
        () => discountOverrideRemoteDataSource.getMaterialOverridePriceList(
          salesOrgCode: fakeSalesOrganisation.salesOrg.getOrCrash(),
          customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
          shipToCode: fakeCustomerCodeInfo.shipToInfos.first.shipToCustomerCode,
          materialQuery: PriceDto.fromDomain(
            fakePrice,
          ).overrideQuery,
        ),
      ).thenThrow((invocation) async => MockException());

      final result =
          await discountOverrideRepository.getMaterialPriceWithOverride(
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
        salesOrganisation: fakeSalesOrganisation,
        price: fakePrice,
      );
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
        shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
        salesOrganisation: fakeSalesOrganisation,
        price: fakePrice,
      );
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
        shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        price: fakePrice,
      );
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
        (invocation) async => <Price>[fakePrice],
      );

      final result =
          await discountOverrideRepository.getMaterialPriceWithOverride(
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
        salesOrganisation: fakeSalesOrganisation,
        price: fakePrice,
      );
      expect(
        result.isRight(),
        true,
      );
    });

    test(
      'get Material Price With Zdp5 Discount locally',
      () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(() => discountOverrideLocalDataSource.getPriceList()).thenAnswer(
          (invocation) async => [fakePrice],
        );
        final result =
            await discountOverrideRepository.getMaterialPriceWithZdp5Discount(
          salesOrganisation: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          price: fakePrice,
          exceedQuantity: true,
        );
        expect(result.isRight(), true);
      },
    );

    test(
      'get Material Price With Zdp5 Discount locally failure',
      () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(() => discountOverrideLocalDataSource.getPriceList()).thenThrow(
          (invocation) async => MockException(),
        );
        final result =
            await discountOverrideRepository.getMaterialPriceWithZdp5Discount(
          salesOrganisation: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          price: fakePrice,
          exceedQuantity: true,
        );
        expect(result.isLeft(), true);
      },
    );
    test(
      'get Material Price With Zdp5 Discount remote',
      () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => discountOverrideRemoteDataSource.getMaterialOverridePriceList(
            salesOrgCode: fakeSalesOrganisation.salesOrg.getOrCrash(),
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            shipToCode: fakeShipToInfo.shipToCustomerCode,
            materialQuery: PriceDto.fromDomain(
              fakePrice,
            ).materialQueryWithExceedQty(true),
          ),
        ).thenAnswer(
          (invocation) async => [fakePrice],
        );
        final result =
            await discountOverrideRepository.getMaterialPriceWithZdp5Discount(
          salesOrganisation: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          price: fakePrice,
          exceedQuantity: true,
        );
        expect(result.isRight(), true);
      },
    );

    test(
      'get Material Price With Zdp5 Discount remote failure',
      () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => discountOverrideRemoteDataSource.getMaterialOverridePriceList(
            salesOrgCode: fakeSalesOrganisation.salesOrg.getOrCrash(),
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            shipToCode: fakeShipToInfo.shipToCustomerCode,
            materialQuery: PriceDto.fromDomain(
              fakePrice,
            ).materialQueryWithExceedQty(true),
          ),
        ).thenThrow(
          (invocation) async => Exception('fake-error'),
        );
        final result =
            await discountOverrideRepository.getMaterialPriceWithZdp5Discount(
          salesOrganisation: fakeSalesOrganisation,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          price: fakePrice,
          exceedQuantity: true,
        );
        expect(result.isLeft(), true);
      },
    );
  });
}

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_price.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_price_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_price_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/return_price_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockConfig extends Mock implements Config {}

class ReturnPriceLocalDataSourceMock extends Mock
    implements ReturnPriceLocalDataSource {}

class ReturnPriceRemoteDataSourceMock extends Mock
    implements ReturnPriceRemoteDataSource {}

void main() {
  late ReturnPriceRepository returnPriceRepository;
  late Config mockConfig;
  late ReturnPriceLocalDataSource returnPriceLocalDataSource;
  late ReturnPriceRemoteDataSource returnPriceRemoteDataSource;

  final returnPriceResponse = ReturnPrice.empty();

  setUpAll(() {
    mockConfig = MockConfig();
    returnPriceLocalDataSource = ReturnPriceLocalDataSourceMock();
    returnPriceRemoteDataSource = ReturnPriceRemoteDataSourceMock();

    returnPriceRepository = ReturnPriceRepository(
      config: mockConfig,
      localDataSource: returnPriceLocalDataSource,
      remoteDataSource: returnPriceRemoteDataSource,
    );
  });

  group(
    'Return Price Repository =>',
    () {
      test(
        'get searchReturnRequestList Success locally',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
          when(() => returnPriceLocalDataSource.fetchReturnPrice())
              .thenAnswer((invocation) async => returnPriceResponse);

          final result = await returnPriceRepository.fetchReturnPrice(
              returnItemsList: [],
              salesOrg: SalesOrganisation.empty()
                  .copyWith(salesOrg: SalesOrg('fake-salesOrg')));
          expect(
            result.isRight(),
            true,
          );
        },
      );

      /* test('get return price fail locally', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(() => returnPriceLocalDataSource.fetchReturnPrice())
            .thenThrow(const ApiFailure.serverTimeout());

        final result = await returnPriceRepository.fetchReturnPrice(
          returnItemsList: [],
          salesOrg: SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('fake-salesOrg'))
        );
        expect(
          result.isLeft(),
          true,
        );
      });*/

      test('get searchReturnRequestList successfully remotely', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
        when(() => returnPriceRemoteDataSource.getReturnPrice(
                invoiceNumber: 'fake-number',
                materials: {},
                salesOrg: 'sales-org'))
            .thenAnswer((invocation) async => returnPriceResponse);

        final result = await returnPriceRepository.fetchReturnPrice(
            returnItemsList: [],
            salesOrg: SalesOrganisation.empty()
                .copyWith(salesOrg: SalesOrg('fake-salesOrg')));
        expect(
          result.isRight(),
          true,
        );
      });
    },
  );
}

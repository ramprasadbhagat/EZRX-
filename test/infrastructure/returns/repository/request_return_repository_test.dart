import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/request_return_filter.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/request_return_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/request_return_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/request_return_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockConfig extends Mock implements Config {}

class RequestReturnLocalDatasourceMock extends Mock
    implements RequestReturnLocalDatasource {}

class RequestReturnRemoteDatasourceMock extends Mock
    implements RequestReturnRemoteDatasource {}

void main() {
  late RequestReturnRepository requestReturnRepository;
  late Config mockConfig;
  late RequestReturnLocalDatasource requestReturnLocalDatasource;
  late RequestReturnRemoteDatasource requestReturnRemoteDatasource;

  final requestReturnResponse = ReturnRequest.empty();

  setUpAll(() {
    mockConfig = MockConfig();
    requestReturnLocalDatasource = RequestReturnLocalDatasourceMock();
    requestReturnRemoteDatasource = RequestReturnRemoteDatasourceMock();

    requestReturnRepository = RequestReturnRepository(
      config: mockConfig,
      localDataSource: requestReturnLocalDatasource,
      remoteDataSource: requestReturnRemoteDatasource,
    );
  });

  group(
    'RequestReturn Repository =>',
    () {
      test(
        'get searchReturnRequestList Success locally',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
          when(() => requestReturnLocalDatasource.searchReturnMaterials())
              .thenAnswer((invocation) async => requestReturnResponse);

          final result = await requestReturnRepository.searchReturnRequestList(
            requestReturnFilter: RequestReturnFilter.empty(),
            salesOrganisation: SalesOrganisation.empty(),
            shipToInfo: ShipToInfo.empty(),
            customerCodeInfo: CustomerCodeInfo.empty(),
            pageSize: 10,
            offSet: 0,
          );
          expect(
            result.isRight(),
            true,
          );
        },
      );

      test('get searchReturnRequestList fail locally', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
        when(() => requestReturnLocalDatasource.searchReturnMaterials())
            .thenThrow(const ApiFailure.serverTimeout());

        final result = await requestReturnRepository.searchReturnRequestList(
          requestReturnFilter: RequestReturnFilter.empty(),
          salesOrganisation: SalesOrganisation.empty(),
          shipToInfo: ShipToInfo.empty(),
          customerCodeInfo: CustomerCodeInfo.empty(),
          pageSize: 10,
          offSet: 0,
        );
        expect(
          result.isLeft(),
          true,
        );
      });

      test('get searchReturnRequestList successfully remotely', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
        when(() => requestReturnRemoteDatasource.searchReturnMaterials(
              batch: '',
              dateFrom: '',
              dateTo: '',
              invoiceNo: '',
              materialDescription: '',
              materialNumber: '',
              principalSearch: '',
              salesOrg: 'salesOrg',
              shipTo: 'shipTo',
              soldTo: 'soldTo',
              pageSize: 10,
              offSet: 0,
            )).thenAnswer((invocation) async => requestReturnResponse);

        final result = await requestReturnRepository.searchReturnRequestList(
          requestReturnFilter: RequestReturnFilter.empty(),
          salesOrganisation: SalesOrganisation.empty()
              .copyWith(salesOrg: SalesOrg('salesOrg')),
          shipToInfo: ShipToInfo.empty().copyWith(shipToCustomerCode: 'shipTo'),
          customerCodeInfo:
              CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: 'soldTo'),
          pageSize: 10,
          offSet: 0,
        );
        expect(
          result.isRight(),
          false,
        );
      });

      test('get searchReturnRequestList successfully remotely with DateFilter',
          () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
        when(() => requestReturnRemoteDatasource.searchReturnMaterials(
              batch: '',
              dateFrom: '20221011',
              dateTo: '20221022',
              invoiceNo: '',
              materialDescription: '',
              materialNumber: '',
              principalSearch: '',
              salesOrg: 'salesOrg',
              shipTo: 'shipTo',
              soldTo: 'soldTo',
              pageSize: 10,
              offSet: 0,
            )).thenAnswer((invocation) async => requestReturnResponse);

        final result = await requestReturnRepository.searchReturnRequestList(
          requestReturnFilter: RequestReturnFilter.empty().copyWith(
              fromInvoiceDate: DateTimeStringValue('20221011'),
              toInvoiceDate: DateTimeStringValue('20221022')),
          salesOrganisation: SalesOrganisation.empty()
              .copyWith(salesOrg: SalesOrg('salesOrg')),
          shipToInfo: ShipToInfo.empty().copyWith(shipToCustomerCode: 'shipTo'),
          customerCodeInfo:
              CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: 'soldTo'),
          pageSize: 10,
          offSet: 0,
        );
        expect(
          result.isRight(),
          true,
        );
      });

      test('get searchReturnRequestList fail remotely', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
        when(
          () => requestReturnRemoteDatasource.searchReturnMaterials(
            batch: '',
            dateFrom: '',
            dateTo: '',
            invoiceNo: '',
            materialDescription: '',
            materialNumber: '',
            principalSearch: '',
            salesOrg: 'salesOrg',
            shipTo: 'shipTo',
            soldTo: 'soldTo',
            pageSize: 10,
            offSet: 0,
          ),
        ).thenThrow(const ApiFailure.serverTimeout());

        final result = await requestReturnRepository.searchReturnRequestList(
          requestReturnFilter: RequestReturnFilter.empty(),
          salesOrganisation: SalesOrganisation.empty()
              .copyWith(salesOrg: SalesOrg('salesOrg')),
          shipToInfo: ShipToInfo.empty().copyWith(shipToCustomerCode: 'shipTo'),
          customerCodeInfo:
              CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: 'soldTo'),
          pageSize: 10,
          offSet: 0,
        );
        expect(
          result.isLeft(),
          true,
        );
      });
    },
  );
}

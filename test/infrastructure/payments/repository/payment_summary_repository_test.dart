import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_filter.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_summary_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/payment_summary_remote_datasource.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/payment_summary_filter_dto.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/payment_summary_repository.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';

class MockConfig extends Mock implements Config {}

class PaymentSummaryLocalDataSourceMock extends Mock
    implements PaymentSummaryLocalDataSource {}

class PaymentSummaryRemoteDataSourceMock extends Mock
    implements PaymentSummaryRemoteDataSource {}

void main() {
  late PaymentSummaryRepository paymentSummaryRepository;
  late Config mockConfig;
  late PaymentSummaryLocalDataSource localDataSource;
  late PaymentSummaryRemoteDataSource remoteDataSource;
  late List<PaymentSummaryDetails> fakePaymentList;
  final fakeFilter = PaymentSummaryFilter.empty();
  final filterList = PaymentSummaryFilterDto.fromDomain(fakeFilter).toMapList;
  final searchMap = {
    'field': 'zzAdvice',
    'value': SearchKey.searchFilter('fake_search_key').searchValueOrEmpty,
  };
  filterList.add(searchMap);

  setUpAll(
    () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      mockConfig = Config()..appFlavor = Flavor.mock;
      localDataSource = PaymentSummaryLocalDataSourceMock();
      remoteDataSource = PaymentSummaryRemoteDataSourceMock();
      paymentSummaryRepository = PaymentSummaryRepository(
        config: mockConfig,
        localDataSource: localDataSource,
        remoteDataSource: remoteDataSource,
      );

      fakePaymentList =
          await PaymentSummaryLocalDataSource().getPaymentSummary();
    },
  );

  group('PaymentSummaryRepository tests', () {
    test('fetch Payment Summary List successfully local', () async {
      when(() => localDataSource.getPaymentSummary())
          .thenAnswer((invocation) async => fakePaymentList);

      final result = await paymentSummaryRepository.fetchPaymentSummaryList(
        customerCodeInfo: fakeCustomerCodeInfo,
        filter: fakeFilter,
        offset: 0,
        pageSize: mockConfig.pageSize,
        salesOrganization: fakeSalesOrganisation,
        searchKey: SearchKey(''),
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test('fetch Payment Summary List fail local', () async {
      when(() => localDataSource.getPaymentSummary())
          .thenThrow(MockException());

      final result = await paymentSummaryRepository.fetchPaymentSummaryList(
        customerCodeInfo: fakeCustomerCodeInfo,
        filter: fakeFilter,
        offset: 0,
        pageSize: mockConfig.pageSize,
        salesOrganization: fakeSalesOrganisation,
        searchKey: SearchKey('fake_search_key'),
      );
      expect(
        result.isLeft(),
        true,
      );
    });

    test(
      'fetch Payment Summary List successfully remote ',
      () async {
        mockConfig.appFlavor = Flavor.uat;

        when(
          () => remoteDataSource.getPaymentSummary(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
            offset: 0,
            filterList: filterList,
            pageSize: mockConfig.pageSize,
          ),
        ).thenAnswer((invocation) async => fakePaymentList);

        final result = await paymentSummaryRepository.fetchPaymentSummaryList(
          customerCodeInfo: fakeCustomerCodeInfo,
          filter: fakeFilter,
          offset: 0,
          pageSize: mockConfig.pageSize,
          salesOrganization: fakeSalesOrganisation,
          searchKey: SearchKey.searchFilter('fake_search_key'),
        );
        expect(
          result.isRight(),
          true,
        );
      },
    );

    test(
      'fetch Payment Summary List successfully remote when searck key is blank',
      () async {
        mockConfig.appFlavor = Flavor.uat;

        when(
          () => remoteDataSource.getPaymentSummary(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
            offset: 0,
            filterList:
                PaymentSummaryFilterDto.fromDomain(fakeFilter).toMapList,
            pageSize: mockConfig.pageSize,
          ),
        ).thenAnswer((invocation) async => fakePaymentList);

        final result = await paymentSummaryRepository.fetchPaymentSummaryList(
          customerCodeInfo: fakeCustomerCodeInfo,
          filter: fakeFilter,
          offset: 0,
          pageSize: mockConfig.pageSize,
          salesOrganization: fakeSalesOrganisation,
          searchKey: SearchKey.searchFilter(''),
        );
        expect(
          result.isRight(),
          true,
        );
      },
    );

    test(
      'fetch Payment Summary List fail remote ',
      () async {
        mockConfig.appFlavor = Flavor.uat;
        when(
          () => remoteDataSource.getPaymentSummary(
            customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
            salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
            offset: 0,
            filterList: filterList,
            pageSize: mockConfig.pageSize,
          ),
        ).thenThrow(MockException());
        final result = await paymentSummaryRepository.fetchPaymentSummaryList(
          customerCodeInfo: fakeCustomerCodeInfo,
          filter: fakeFilter,
          offset: 0,
          pageSize: mockConfig.pageSize,
          salesOrganization: fakeSalesOrganisation,
          searchKey: SearchKey.searchFilter('fake_search_key'),
        );
        expect(
          result.isLeft(),
          true,
        );
      },
    );
  });
}

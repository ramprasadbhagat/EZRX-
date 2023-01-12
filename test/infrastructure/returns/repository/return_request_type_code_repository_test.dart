import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_type_code_details.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_request_type_code_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_request_type_code_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/return_request_type_code_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockConfig extends Mock implements Config {}

class ReturnRequestTypeCodeLocalDataSourceMock extends Mock
    implements ReturnRequestTypeCodeLocalDataSource {}

class ReturnRequestTypeCodeRemoteDataSourceMock extends Mock
    implements ReturnRequestTypeCodeRemoteDataSource {}

void main() {
  late ReturnRequestTypeCodeRepository returnRequestTypeCodeRepository;
  late Config mockConfig;
  late ReturnRequestTypeCodeLocalDataSource
      returnRequestTypeCodeLocalDataSource;
  late ReturnRequestTypeCodeRemoteDataSource
      returnRequestTypeCodeRemoteDataSource;

  final mockSalesOrganisation = SalesOrganisation.empty().copyWith(
    salesOrg: SalesOrg('fake-salesorg'),
  );

  setUpAll(() {
    mockConfig = MockConfig();
    returnRequestTypeCodeLocalDataSource =
        ReturnRequestTypeCodeLocalDataSourceMock();
    returnRequestTypeCodeRemoteDataSource =
        ReturnRequestTypeCodeRemoteDataSourceMock();

    returnRequestTypeCodeRepository = ReturnRequestTypeCodeRepository(
      config: mockConfig,
      localDataSource: returnRequestTypeCodeLocalDataSource,
      remoteDataSource: returnRequestTypeCodeRemoteDataSource,
    );
  });

  group('Return Request Type Code', () {
    test('get ReturnRequestType successfully locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => returnRequestTypeCodeLocalDataSource
              .getReturnRequestTypeCodeList())
          .thenAnswer((invocation) async => <ReturnRequestTypeCodeDetails>[]);

      final result =
          await returnRequestTypeCodeRepository.getReturnRequestTypeCodeList(
              salesOrganisation: mockSalesOrganisation);
      expect(
        result.isRight(),
        true,
      );
    });
    test('Return Request Type fail Local', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => returnRequestTypeCodeLocalDataSource
              .getReturnRequestTypeCodeList())
          .thenThrow((invocation) async => MockException());

      final result =
          await returnRequestTypeCodeRepository.getReturnRequestTypeCodeList(
              salesOrganisation: mockSalesOrganisation);
      expect(
        result.isLeft(),
        true,
      );
    });
    test('get return request type code successfully remote', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(() => returnRequestTypeCodeRemoteDataSource
              .getReturnRequestTypeCodeList(salesOrg: '2601'))
          .thenAnswer((invocation) async => <ReturnRequestTypeCodeDetails>[]);

      final result =
          await returnRequestTypeCodeRepository.getReturnRequestTypeCodeList(
              salesOrganisation:
                  mockSalesOrganisation.copyWith(salesOrg: SalesOrg('2601')));
      expect(
        result.isRight(),
        true,
      );
    });
    test('get return request type code fail remote', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(() => returnRequestTypeCodeRemoteDataSource
              .getReturnRequestTypeCodeList(salesOrg: '2500'))
          .thenThrow((invocation) async => MockException());

      final result =
          await returnRequestTypeCodeRepository.getReturnRequestTypeCodeList(
              salesOrganisation:
                  mockSalesOrganisation.copyWith(salesOrg: SalesOrg('2500')));
      expect(
        result.isLeft(),
        true,
      );
    });
  });
}

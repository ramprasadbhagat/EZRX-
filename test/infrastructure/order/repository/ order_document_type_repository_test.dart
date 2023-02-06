import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/order/entities/order_document_type.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_document_type_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_document_type_remote.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_document_type_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockConfig extends Mock implements Config {}

class OrderDocumentTypeLocalDataSourceMock extends Mock
    implements OrderDocumentTypeLocalDataSource {}

class OrderDocumentTypeRemoteDataSourceMock extends Mock
    implements OrderDocumentTypeRemoteDataSource {}


void main() {
  late OrderDocumentTypeRepository orderDocumentTypeRepository;
  late Config mockConfig;
  late OrderDocumentTypeLocalDataSource orderDocumentTypeLocalDataSource;
  late OrderDocumentTypeRemoteDataSource orderDocumentTypeRemoteDataSource;

  final mockSalesOrganisation = SalesOrganisation.empty();

  setUpAll(() {
    mockConfig = MockConfig();
    orderDocumentTypeLocalDataSource = OrderDocumentTypeLocalDataSourceMock();
    orderDocumentTypeRemoteDataSource = OrderDocumentTypeRemoteDataSourceMock();

    orderDocumentTypeRepository = OrderDocumentTypeRepository(
      config: mockConfig,
      orderDocumentTypLocalDataSource: orderDocumentTypeLocalDataSource,
      orderDocumentTypRemoteDataSource: orderDocumentTypeRemoteDataSource,
    );
  });

  group('orderDocumentTypeRepository should - ', () {
    test('get orderDocumentType successfully locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => orderDocumentTypeLocalDataSource.getOrderDocumentTypList())
          .thenAnswer((invocation) async => <OrderDocumentType>[]);

      final result = await orderDocumentTypeRepository.getOrderDocumentTypList(
          salesOrganisation: mockSalesOrganisation);
      expect(
        result.isRight(),
        true,
      );
    });
    test('get orderDocumentType fail locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => orderDocumentTypeLocalDataSource.getOrderDocumentTypList())
          .thenThrow((invocation) async => MockException());

      final result = await orderDocumentTypeRepository.getOrderDocumentTypList(
          salesOrganisation: mockSalesOrganisation);
      expect(
        result.isLeft(),
        true,
      );
    });
    test('get orderDocumentType successfully remote', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(() => orderDocumentTypeRemoteDataSource.getOrderDocumentTypList(
              salesOrgCode: '2601'))
          .thenAnswer((invocation) async => <OrderDocumentType>[]);

      final result = await orderDocumentTypeRepository.getOrderDocumentTypList(
          salesOrganisation:
              mockSalesOrganisation.copyWith(salesOrg: SalesOrg('2601')));
      expect(
        result.isRight(),
        true,
      );
    });
    test('get orderDocumentType fail remote', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(() => orderDocumentTypeRemoteDataSource.getOrderDocumentTypList(
              salesOrgCode: ''))
          .thenThrow((invocation) async => MockException());

      final result = await orderDocumentTypeRepository.getOrderDocumentTypList(
          salesOrganisation:
              mockSalesOrganisation.copyWith(salesOrg: SalesOrg('')));
      expect(
        result.isLeft(),
        true,
      );
    });
  });
}

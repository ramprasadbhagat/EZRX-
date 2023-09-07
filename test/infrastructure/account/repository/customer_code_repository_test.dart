import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/account_selector_storage.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_code_local.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_code_remote.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/account_selector_storage_dto.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/customer_code_search_dto.dart';
import 'package:ezrxmobile/infrastructure/account/repository/customer_code_repository.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class CustomerCodeLocalDataSourceMock extends Mock
    implements CustomerCodeLocalDataSource {}

class CustomerCodeRemoteDataSourceMock extends Mock
    implements CustomerCodeRemoteDataSource {}

class AccountSelectorStorageMock extends Mock
    implements AccountSelectorStorage {}

class ConfigMock extends Mock implements Config {}

void main() {
  late int offset;
  late int pageSize;
  late Config configMock;
  late bool hideCustomer;
  late String mockCustomerCode;
  late SalesOrganisation mockSalesOrg;
  late User mockClientUser;
  late User mockSalesRepUser;
  late CustomerCodeRepository customerCodeRepository;
  late AccountSelectorStorage accountSelectorStorageMock;
  late CustomerCodeLocalDataSource customerCodeLocalDataSourceMock;
  late CustomerCodeRemoteDataSource customerCodeRemoteDataSourceMock;

  setUpAll(() async {
    configMock = ConfigMock();
    accountSelectorStorageMock = AccountSelectorStorageMock();
    customerCodeLocalDataSourceMock = CustomerCodeLocalDataSourceMock();
    customerCodeRemoteDataSourceMock = CustomerCodeRemoteDataSourceMock();

    offset = 0;
    pageSize = 20;
    hideCustomer = true;
    mockCustomerCode = 'mockCustomerCode';
    mockSalesOrg = SalesOrganisation.empty().copyWith(
      salesOrg: SalesOrg('mockSalesOrg'),
    );

    mockClientUser = User.empty().copyWith(
      username: Username('mockUserName'),
      role: Role.empty().copyWith(
        type: RoleType('client'),
      ),
    );

    mockSalesRepUser = User.empty().copyWith(
      username: Username('mockUserName'),
      role: Role.empty().copyWith(
        type: RoleType('internal_sales_rep'),
      ),
    );

    customerCodeRepository = CustomerCodeRepository(
      config: configMock,
      accountSelectorStorage: accountSelectorStorageMock,
      remoteDataSource: customerCodeRemoteDataSourceMock,
      localCustomerCodeDataSource: customerCodeLocalDataSourceMock,
    );

    registerFallbackValue(AccountSelectorStorageDto.empty());
  });

  group('CustomerCode Repository Test', () {
    test(
        'Get Customer Code from local data source successfully for sales rep test',
        () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);

      when(() => customerCodeLocalDataSourceMock.getSalesRepCustomerCodeList())
          .thenAnswer((invocation) async => <CustomerCodeInfo>[]);

      final result = await customerCodeRepository.getCustomerCode(
        salesOrganisation: mockSalesOrg,
        customerCodes: [mockCustomerCode],
        hideCustomer: hideCustomer,
        offset: offset,
        user: mockSalesRepUser,
        pageSize: pageSize,
      );

      expect(result.isRight(), true);
    });

    test('Get Customer Code from local data source failed for sales rep test',
        () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);

      when(() => customerCodeLocalDataSourceMock.getSalesRepCustomerCodeList())
          .thenThrow((invocation) async => MockException());

      final result = await customerCodeRepository.getCustomerCode(
        salesOrganisation: mockSalesOrg,
        customerCodes: [mockCustomerCode],
        hideCustomer: hideCustomer,
        offset: offset,
        user: mockSalesRepUser,
        pageSize: pageSize,
      );

      expect(result.isLeft(), true);
    });

    test(
        'Get Customer Code from local data source successfully for non sales rep test',
        () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);

      when(() => customerCodeLocalDataSourceMock.getCustomerCodeList())
          .thenAnswer((invocation) async => <CustomerCodeInfo>[]);

      final result = await customerCodeRepository.getCustomerCode(
        salesOrganisation: mockSalesOrg,
        customerCodes: [mockCustomerCode],
        hideCustomer: hideCustomer,
        offset: offset,
        user: mockClientUser,
        pageSize: pageSize,
      );

      expect(result.isRight(), true);
    });

    test(
        'Get Customer Code from local data source failed for non sales rep test',
        () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);

      when(() => customerCodeLocalDataSourceMock.getCustomerCodeList())
          .thenThrow((invocation) async => MockException());

      final result = await customerCodeRepository.getCustomerCode(
        salesOrganisation: mockSalesOrg,
        customerCodes: [mockCustomerCode],
        hideCustomer: hideCustomer,
        offset: offset,
        user: mockClientUser,
        pageSize: pageSize,
      );

      expect(result.isLeft(), true);
    });

    test(
        'Get Customer Code from remote data source successfully for sales rep test',
        () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);

      when(
        () => customerCodeRemoteDataSourceMock.getSalesRepCustomerCodeList(
          request: CustomerCodeSearchDto(
            salesOrg: mockSalesOrg.salesOrg.getOrCrash(),
            first: pageSize,
            filterBlockCustomer: false,
            after: offset,
            searchKey: mockCustomerCode,
          ),
        ),
      ).thenAnswer(
        (invocation) async => <CustomerCodeInfo>[
          CustomerCodeInfo.empty(),
          CustomerCodeInfo.empty(),
        ],
      );

      when(
        () => customerCodeRemoteDataSourceMock.getSalesRepCustomerCodeList(
          request: CustomerCodeSearchDto(
            salesOrg: mockSalesOrg.salesOrg.getOrCrash(),
            first: pageSize,
            filterBlockCustomer: false,
            after: offset,
            searchKey: '${mockCustomerCode}1',
          ),
        ),
      ).thenAnswer(
        (invocation) async => <CustomerCodeInfo>[
          CustomerCodeInfo.empty(),
          CustomerCodeInfo.empty(),
        ],
      );

      when(
        () => customerCodeRemoteDataSourceMock.getSalesRepCustomerCodeList(
          request: CustomerCodeSearchDto(
            salesOrg: mockSalesOrg.salesOrg.getOrCrash(),
            first: pageSize,
            filterBlockCustomer: false,
            after: offset,
            searchKey: '${mockCustomerCode}2',
          ),
        ),
      ).thenAnswer(
        (invocation) async => <CustomerCodeInfo>[
          CustomerCodeInfo.empty(),
          CustomerCodeInfo.empty(),
        ],
      );

      final result = await customerCodeRepository.getCustomerCode(
        salesOrganisation: mockSalesOrg,
        customerCodes: [
          mockCustomerCode,
          '${mockCustomerCode}1',
          '${mockCustomerCode}2',
        ],
        hideCustomer: hideCustomer,
        offset: offset,
        user: mockSalesRepUser,
        pageSize: pageSize,
      );

      expect(result.isRight(), true);
      result.fold((_) {}, (r) => expect(r.length, 6));
    });

    test('Get Customer Code from remote data source failed for sales rep test',
        () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);

      when(
        () => customerCodeRemoteDataSourceMock.getSalesRepCustomerCodeList(
          request: CustomerCodeSearchDto(
            salesOrg: mockSalesOrg.salesOrg.getOrCrash(),
            first: pageSize,
            filterBlockCustomer: false,
            after: offset,
            searchKey: mockCustomerCode,
          ),
        ),
      ).thenAnswer(
        (invocation) async => <CustomerCodeInfo>[
          CustomerCodeInfo.empty(),
          CustomerCodeInfo.empty(),
        ],
      );

      when(
        () => customerCodeRemoteDataSourceMock.getSalesRepCustomerCodeList(
          request: CustomerCodeSearchDto(
            salesOrg: mockSalesOrg.salesOrg.getOrCrash(),
            first: pageSize,
            filterBlockCustomer: false,
            after: offset,
            searchKey: '${mockCustomerCode}1',
          ),
        ),
      ).thenThrow((invocation) async => MockException());

      when(
        () => customerCodeRemoteDataSourceMock.getSalesRepCustomerCodeList(
          request: CustomerCodeSearchDto(
            salesOrg: mockSalesOrg.salesOrg.getOrCrash(),
            first: pageSize,
            filterBlockCustomer: false,
            after: offset,
            searchKey: '${mockCustomerCode}2',
          ),
        ),
      ).thenAnswer(
        (invocation) async => <CustomerCodeInfo>[
          CustomerCodeInfo.empty(),
          CustomerCodeInfo.empty(),
        ],
      );

      final result = await customerCodeRepository.getCustomerCode(
        salesOrganisation: mockSalesOrg,
        customerCodes: [
          mockCustomerCode,
          '${mockCustomerCode}1',
          '${mockCustomerCode}2',
        ],
        hideCustomer: hideCustomer,
        offset: offset,
        user: mockSalesRepUser,
        pageSize: pageSize,
      );

      expect(result.isRight(), true);
      result.fold((_) {}, (r) => expect(r.length, 4));
    });

    test(
        'Get Customer Code from remote data source failed for sales rep test 2',
        () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);

      when(
        () => customerCodeRemoteDataSourceMock.getSalesRepCustomerCodeList(
          request: CustomerCodeSearchDto(
            salesOrg: mockSalesOrg.salesOrg.getOrCrash(),
            first: pageSize,
            filterBlockCustomer: false,
            after: offset,
            searchKey: mockCustomerCode,
          ),
        ),
      ).thenThrow((invocation) async => MockException());

      when(
        () => customerCodeRemoteDataSourceMock.getSalesRepCustomerCodeList(
          request: CustomerCodeSearchDto(
            salesOrg: mockSalesOrg.salesOrg.getOrCrash(),
            first: pageSize,
            filterBlockCustomer: false,
            after: offset,
            searchKey: '${mockCustomerCode}1',
          ),
        ),
      ).thenThrow((invocation) async => MockException());

      when(
        () => customerCodeRemoteDataSourceMock.getSalesRepCustomerCodeList(
          request: CustomerCodeSearchDto(
            salesOrg: mockSalesOrg.salesOrg.getOrCrash(),
            first: pageSize,
            filterBlockCustomer: false,
            after: offset,
            searchKey: '${mockCustomerCode}2',
          ),
        ),
      ).thenThrow((invocation) async => MockException());

      final result = await customerCodeRepository.getCustomerCode(
        salesOrganisation: mockSalesOrg,
        customerCodes: [
          mockCustomerCode,
          '${mockCustomerCode}1',
          '${mockCustomerCode}2',
        ],
        hideCustomer: hideCustomer,
        offset: offset,
        user: mockSalesRepUser,
        pageSize: pageSize,
      );

      expect(result.isRight(), true);
      result.fold((_) {}, (r) => expect(r.length, 0));
    });

    test(
        'Get Customer Code from remote data source successfully for non sales rep test',
        () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);

      when(
        () => customerCodeRemoteDataSourceMock.getCustomerCodeList(
          salesOrg: mockSalesOrg.salesOrg.getOrCrash(),
          customerCode: mockCustomerCode,
          hideCustomer: hideCustomer,
          offset: offset,
          pageSize: pageSize,
        ),
      ).thenAnswer(
        (invocation) async => <CustomerCodeInfo>[
          CustomerCodeInfo.empty(),
          CustomerCodeInfo.empty(),
        ],
      );

      when(
        () => customerCodeRemoteDataSourceMock.getCustomerCodeList(
          salesOrg: mockSalesOrg.salesOrg.getOrCrash(),
          customerCode: '${mockCustomerCode}1',
          hideCustomer: hideCustomer,
          offset: offset,
          pageSize: pageSize,
        ),
      ).thenAnswer(
        (invocation) async => <CustomerCodeInfo>[
          CustomerCodeInfo.empty(),
          CustomerCodeInfo.empty(),
        ],
      );

      when(
        () => customerCodeRemoteDataSourceMock.getCustomerCodeList(
          salesOrg: mockSalesOrg.salesOrg.getOrCrash(),
          customerCode: '${mockCustomerCode}2',
          hideCustomer: hideCustomer,
          offset: offset,
          pageSize: pageSize,
        ),
      ).thenAnswer(
        (invocation) async => <CustomerCodeInfo>[
          CustomerCodeInfo.empty(),
          CustomerCodeInfo.empty(),
        ],
      );

      final result = await customerCodeRepository.getCustomerCode(
        salesOrganisation: mockSalesOrg,
        customerCodes: [
          mockCustomerCode,
          '${mockCustomerCode}1',
          '${mockCustomerCode}2',
        ],
        hideCustomer: hideCustomer,
        offset: offset,
        user: mockClientUser,
        pageSize: pageSize,
      );

      expect(result.isRight(), true);
      result.fold((_) {}, (r) => expect(r.length, 6));
    });

    test(
        'Get Customer Code from remote data source failed for non sales rep test',
        () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);

      when(
        () => customerCodeRemoteDataSourceMock.getCustomerCodeList(
          salesOrg: mockSalesOrg.salesOrg.getOrCrash(),
          customerCode: mockCustomerCode,
          hideCustomer: hideCustomer,
          offset: offset,
          pageSize: pageSize,
        ),
      ).thenAnswer(
        (invocation) async => <CustomerCodeInfo>[
          CustomerCodeInfo.empty(),
          CustomerCodeInfo.empty(),
        ],
      );

      when(
        () => customerCodeRemoteDataSourceMock.getCustomerCodeList(
          salesOrg: mockSalesOrg.salesOrg.getOrCrash(),
          customerCode: '${mockCustomerCode}1',
          hideCustomer: hideCustomer,
          offset: offset,
          pageSize: pageSize,
        ),
      ).thenThrow((invocation) async => MockException());

      when(
        () => customerCodeRemoteDataSourceMock.getCustomerCodeList(
          salesOrg: mockSalesOrg.salesOrg.getOrCrash(),
          customerCode: '${mockCustomerCode}2',
          hideCustomer: hideCustomer,
          offset: offset,
          pageSize: pageSize,
        ),
      ).thenAnswer(
        (invocation) async => <CustomerCodeInfo>[
          CustomerCodeInfo.empty(),
          CustomerCodeInfo.empty(),
        ],
      );

      final result = await customerCodeRepository.getCustomerCode(
        salesOrganisation: mockSalesOrg,
        customerCodes: [
          mockCustomerCode,
          '${mockCustomerCode}1',
          '${mockCustomerCode}2',
        ],
        hideCustomer: hideCustomer,
        offset: offset,
        user: mockClientUser,
        pageSize: pageSize,
      );

      expect(result.isRight(), true);
      result.fold((_) {}, (r) => expect(r.length, 4));
    });

    test('Get customer code from account storage successfully test', () async {
      when(() => accountSelectorStorageMock.get())
          .thenAnswer((invocation) async => AccountSelectorStorageDto.empty());

      final result = await customerCodeRepository.getCustomerCodeStorage();

      expect(result.isRight(), true);
    });

    test('Get customer code from account storage failed test', () async {
      when(() => accountSelectorStorageMock.get())
          .thenThrow((invocation) async => MockException());

      final result = await customerCodeRepository.getCustomerCodeStorage();

      expect(result.isLeft(), true);
    });

    test('Store customer code in account storage successfully test', () async {
      when(() => accountSelectorStorageMock.get())
          .thenAnswer((invocation) async => AccountSelectorStorageDto.empty());

      when(
        () => accountSelectorStorageMock.set(
          accountSelectorStorageDto:
              any(named: 'accountSelectorStorageDto', that: isNotNull),
        ),
      ).thenAnswer((invocation) async {
        return;
      });

      final result = await customerCodeRepository.storeCustomerInfo(
        customerCode: mockCustomerCode,
        shippingAddress: 'mockShippingAddress',
      );

      expect(result.isRight(), true);
    });

    test('Store customer code in account storage failure test', () async {
      when(() => accountSelectorStorageMock.get())
          .thenAnswer((invocation) async => AccountSelectorStorageDto.empty());

      when(
        () => accountSelectorStorageMock.set(
          accountSelectorStorageDto:
              any(named: 'accountSelectorStorageDto', that: isNotNull),
        ),
      ).thenThrow((invocation) => MockException());

      final result = await customerCodeRepository.storeCustomerInfo(
        customerCode: mockCustomerCode,
        shippingAddress: 'mockShippingAddress',
      );

      expect(result.isLeft(), true);
    });

    test(
        'Get Customer Code from remote data source failed for sales rep test for single customer code',
        () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.uat);

      when(
        () => customerCodeRemoteDataSourceMock.getSalesRepCustomerCodeList(
          request: CustomerCodeSearchDto(
            salesOrg: mockSalesOrg.salesOrg.getOrCrash(),
            first: pageSize,
            filterBlockCustomer: false,
            after: offset,
            searchKey: mockCustomerCode,
          ),
        ),
      ).thenThrow((invocation) async => MockException());

      final result = await customerCodeRepository.getCustomerCode(
        salesOrganisation: mockSalesOrg,
        customerCodes: [mockCustomerCode],
        hideCustomer: hideCustomer,
        offset: offset,
        user: mockSalesRepUser,
        pageSize: pageSize,
      );

      expect(result.isLeft(), true);
    });
  });
}

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_filter.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_list_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_list_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/return_list_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockConfig extends Mock implements Config {}

class ReturnListLocalDataSourceMock extends Mock
    implements ReturnListLocalDataSource {}

class ReturnListRemoteDataSourceMock extends Mock
    implements ReturnListRemoteDataSource {}

void main() {
  late ReturnListRepository returnListRepository;
  late Config mockConfig;
  late ReturnListLocalDataSource returnListLocalDataSource;
  late ReturnListRemoteDataSource returnListRemoteDataSource;
  late Map<String, dynamic> inputParams;

  final returnListByRequest = [ReturnItem.empty()];

  setUpAll(() {
    mockConfig = MockConfig();
    returnListLocalDataSource = ReturnListLocalDataSourceMock();
    returnListRemoteDataSource = ReturnListRemoteDataSourceMock();

    returnListRepository = ReturnListRepository(
      config: mockConfig,
      localDataSource: returnListLocalDataSource,
      remoteDataSource: returnListRemoteDataSource,
    );
    inputParams = {
      'soldTo': '0030082707',
      'shipTo': '0070149863',
      'username': 'test-name',
      'first': 24,
      'salesOrg': '2001',
      'after': 0,
    };
  });

  group(
    'Return list repository test',
    () {
      test('Fetch Return Item By Request', () async {
        when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
        when(
          () => returnListRemoteDataSource.fetchReturnByRequest(
            requestParams: inputParams,
          ),
        ).thenAnswer((invocation) async => returnListByRequest);

        final result = await returnListRepository.fetchReturnListByRequest(
          appliedFilter: ReturnFilter.empty().copyWith(
            returnDateFrom: DateTimeStringValue('-'),
            returnDateTo: DateTimeStringValue('-'),
          ),
          customerCode: CustomerCodeInfo.empty().copyWith(
            customerCodeSoldTo: '0030082707',
          ),
          offset: 0,
          pageSize: 24,
          salesOrg: SalesOrg('2001'),
          searchKey: SearchKey(''),
          shipToInfo: ShipToInfo.empty().copyWith(
            shipToCustomerCode: '0070149863',
          ),
          user: User.empty().copyWith(
            username: Username('test-name'),
          ),
        );
        expect(
          result.isRight(),
          true,
        );
      });
    },
  );
}

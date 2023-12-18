import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_filter.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
import 'package:ezrxmobile/domain/returns/entities/return_list_request.dart';
import 'package:ezrxmobile/infrastructure/core/common/device_info.dart';
import 'package:ezrxmobile/infrastructure/core/common/file_path_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/permission_service.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_list_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_list_remote.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_list_request_dto.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/return_list_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';

class MockConfig extends Mock implements Config {}

class ReturnListLocalDataSourceMock extends Mock
    implements ReturnListLocalDataSource {}

class ReturnListRemoteDataSourceMock extends Mock
    implements ReturnListRemoteDataSource {}

class PermissionServiceMock extends Mock implements PermissionService {}

class DeviceInfoMock extends Mock implements DeviceInfo {}

class FileSystemHelperMock extends Mock implements FileSystemHelper {}

void main() {
  late ReturnListRepository returnListRepository;
  late Config mockConfig;
  late ReturnListLocalDataSource returnListLocalDataSource;
  late ReturnListRemoteDataSource returnListRemoteDataSource;
  late Map<String, dynamic> inputParams;

  final returnListByRequest = [ReturnItem.empty()];
  final errorMock = Exception('fake-error');
  final appliedFilterMock = ReturnFilter.empty();
  final searchKeyMock = SearchKey('fake-search-key');
  final returnListRequest = ReturnListRequest.empty().copyWith(
    customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
    salesOrg: fakeSalesOrg,
    shipToInfo: fakeCustomerCodeInfo.shipToInfos.first.shipToCustomerCode,
    userName: fakeClient.username,
    after: 0,
    first: 10,
    filter: appliedFilterMock,
    searchKey: searchKeyMock,
  );

  setUpAll(() {
    mockConfig = MockConfig();
    returnListLocalDataSource = ReturnListLocalDataSourceMock();
    returnListRemoteDataSource = ReturnListRemoteDataSourceMock();
    final permissionService = PermissionServiceMock();
    final deviceInfo = DeviceInfoMock();
    final fileSystemHelper = FileSystemHelperMock();

    returnListRepository = ReturnListRepository(
      config: mockConfig,
      localDataSource: returnListLocalDataSource,
      remoteDataSource: returnListRemoteDataSource,
      deviceInfo: deviceInfo,
      fileSystemHelper: fileSystemHelper,
      permissionService: permissionService,
    );
    inputParams = ReturnListRequestDto.fromDomain(returnListRequest).toMap();
  });

  group(
    'Return list repository test',
    () {
      test(
        'Fetch Return List By Item Success Locally',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
          when(
            () => returnListLocalDataSource.fetchReturnByItems(),
          ).thenAnswer((invocation) async => returnListByRequest);
          final result = await returnListRepository.fetchReturnListByItem(
            salesOrg: fakeSalesOrg,
            customerCode: fakeCustomerCodeInfo,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            user: fakeClient,
            pageSize: 10,
            offset: 0,
            appliedFilter: appliedFilterMock,
            searchKey: searchKeyMock,
          );
          expect(result.isRight(), true);
          expect(
            result.getOrElse(
              () => <ReturnItem>[],
            ),
            returnListByRequest,
          );
        },
      );

      test(
        'Fetch Return List By Item Failure Locally',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
          when(
            () => returnListLocalDataSource.fetchReturnByItems(),
          ).thenThrow(errorMock);
          final result = await returnListRepository.fetchReturnListByItem(
            salesOrg: fakeSalesOrg,
            customerCode: fakeCustomerCodeInfo,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            user: fakeClient,
            pageSize: 10,
            offset: 0,
            appliedFilter: appliedFilterMock,
            searchKey: searchKeyMock,
          );
          expect(result.isLeft(), true);
        },
      );

      test(
        'Fetch Return List By Item Success Remote',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
          when(
            () => returnListRemoteDataSource.fetchReturnByItems(
              requestParams: inputParams,
            ),
          ).thenAnswer(
            (invocation) async => returnListByRequest,
          );
          final result = await returnListRepository.fetchReturnListByItem(
            salesOrg: fakeSalesOrg,
            customerCode: fakeCustomerCodeInfo,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            user: fakeClient,
            pageSize: 10,
            offset: 0,
            appliedFilter: appliedFilterMock,
            searchKey: searchKeyMock,
          );
          expect(result.isRight(), true);
          expect(
            result.getOrElse(
              () => <ReturnItem>[],
            ),
            returnListByRequest,
          );
        },
      );

      test(
        'Fetch Return List By Item Failure Remote',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
          when(
            () => returnListRemoteDataSource.fetchReturnByItems(
              requestParams: inputParams,
            ),
          ).thenThrow(errorMock);
          final result = await returnListRepository.fetchReturnListByItem(
            salesOrg: fakeSalesOrg,
            customerCode: fakeCustomerCodeInfo,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            user: fakeClient,
            pageSize: 10,
            offset: 0,
            appliedFilter: appliedFilterMock,
            searchKey: searchKeyMock,
          );
          expect(result.isLeft(), true);
        },
      );

      test(
        'Fetch Return Item By Request Success Remote',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
          when(
            () => returnListRemoteDataSource.fetchReturnByRequest(
              requestParams: inputParams,
            ),
          ).thenAnswer((invocation) async => returnListByRequest);

          final result = await returnListRepository.fetchReturnListByRequest(
            appliedFilter: appliedFilterMock,
            customerCode: fakeCustomerCodeInfo,
            offset: 0,
            pageSize: 10,
            salesOrg: fakeSalesOrg,
            searchKey: searchKeyMock,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            user: fakeClient,
          );
          expect(
            result.isRight(),
            true,
          );
          expect(
            result.getOrElse(
              () => <ReturnItem>[],
            ),
            returnListByRequest,
          );
        },
      );

      test(
        'Fetch Return List By Request Success Locally',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
          when(
            () => returnListLocalDataSource.fetchReturnByRequests(),
          ).thenAnswer((invocation) async => returnListByRequest);
          final result = await returnListRepository.fetchReturnListByRequest(
            salesOrg: fakeSalesOrg,
            customerCode: fakeCustomerCodeInfo,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            user: fakeClient,
            pageSize: 10,
            offset: 0,
            appliedFilter: appliedFilterMock,
            searchKey: searchKeyMock,
          );
          expect(result.isRight(), true);
          expect(
            result.getOrElse(
              () => <ReturnItem>[],
            ),
            returnListByRequest,
          );
        },
      );

      test(
        'Fetch Return List By Request Failure Locally',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
          when(
            () => returnListLocalDataSource.fetchReturnByRequests(),
          ).thenThrow(errorMock);
          final result = await returnListRepository.fetchReturnListByRequest(
            salesOrg: fakeSalesOrg,
            customerCode: fakeCustomerCodeInfo,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            user: fakeClient,
            pageSize: 10,
            offset: 0,
            appliedFilter: appliedFilterMock,
            searchKey: searchKeyMock,
          );
          expect(result.isLeft(), true);
        },
      );

      test(
        'Fetch Return List By Request Failure Remote',
        () async {
          when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
          when(
            () => returnListRemoteDataSource.fetchReturnByRequest(
              requestParams: inputParams,
            ),
          ).thenThrow(errorMock);
          final result = await returnListRepository.fetchReturnListByRequest(
            salesOrg: fakeSalesOrg,
            customerCode: fakeCustomerCodeInfo,
            shipToInfo: fakeCustomerCodeInfo.shipToInfos.first,
            user: fakeClient,
            pageSize: 10,
            offset: 0,
            appliedFilter: appliedFilterMock,
            searchKey: searchKeyMock,
          );
          expect(result.isLeft(), true);
        },
      );
    },
  );
}

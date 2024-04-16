import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/re_order_permission.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/re_order_permission_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/re_order_permission_remote.dart';
import 'package:ezrxmobile/infrastructure/order/repository/re_order_permission_repository.dart';
import 'package:flutter/material.dart';
import 'package:ezrxmobile/config.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';

class MockConfig extends Mock implements Config {}

class ReOrderPermissionLocalDataSourceMock extends Mock
    implements ReOrderPermissionLocalDataSource {}

class ReOrderPermissionRemoteDataSourceMock extends Mock
    implements ReOrderPermissionRemoteDataSource {}

void main() {
  late Config mockConfig;
  late ReOrderPermissionRepository reOrderPermissionRepository;
  late ReOrderPermissionLocalDataSource reOrderPermissionLocalDataSource;
  late ReOrderPermission getReorderPermissionResponseMock;
  late ReOrderPermissionRemoteDataSource reOrderPermissionRemoteDataSource;
  late List<MaterialNumber> fakeMaterialNumbers;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    getReorderPermissionResponseMock =
        await ReOrderPermissionLocalDataSource().getPermission();
    fakeMaterialNumbers = getReorderPermissionResponseMock.validMaterials
        .map((e) => e.materialNumber)
        .toList();
  });

  setUp(() {
    mockConfig = MockConfig();
    reOrderPermissionLocalDataSource = ReOrderPermissionLocalDataSourceMock();
    reOrderPermissionRemoteDataSource = ReOrderPermissionRemoteDataSourceMock();
    reOrderPermissionRepository = ReOrderPermissionRepository(
      config: mockConfig,
      localDataSource: reOrderPermissionLocalDataSource,
      remoteDataSource: reOrderPermissionRemoteDataSource,
    );
  });

  group('=> get Reorder Permission Test', () {
    test('=> get locally fail', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => reOrderPermissionLocalDataSource.getPermission())
          .thenThrow((invocation) async => MockException());

      final result = await reOrderPermissionRepository.getReorderPermission(
        shipToInfo: fakeShipToInfo,
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        materialNumbers: fakeMaterialNumbers,
        user: fakeSalesRepUser,
        salesOrganisationConfigs: fakeSalesOrganisationConfigs,
      );
      expect(
        result.isLeft(),
        true,
      );
    });

    test('=> get locally success', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => reOrderPermissionLocalDataSource.getPermission()).thenAnswer(
        (invocation) async => getReorderPermissionResponseMock,
      );

      final result = await reOrderPermissionRepository.getReorderPermission(
        shipToInfo: fakeShipToInfo,
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        materialNumbers: fakeMaterialNumbers,
        user: fakeSalesRepUser,
        salesOrganisationConfigs: fakeSalesOrganisationConfigs,
      );
      expect(
        result.isRight(),
        true,
      );
    });

    test('=> get remotely fail', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => reOrderPermissionRemoteDataSource.getPermission(
          shipToCode: fakeShipToInfo.shipToCustomerCode,
          customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
          salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
          materialNumbers:
              fakeMaterialNumbers.map((e) => e.getOrCrash()).toList(),
          isEnableGimmickMaterial: fakeSalesOrganisationConfigs.enableGimmickMaterial,
          isSalesRepUser: fakeSalesRepUser.role.type.isSalesRepRole,
          userName: fakeSalesRepUser.username.getValue(), 
        ),
      ).thenThrow((invocation) async => MockException());

      final result = await reOrderPermissionRepository.getReorderPermission(
        shipToInfo: fakeShipToInfo,
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        materialNumbers: fakeMaterialNumbers,
        user: fakeSalesRepUser,
        salesOrganisationConfigs: fakeSalesOrganisationConfigs,
      );
      expect(
        result.isLeft(),
        true,
      );
    });

    test('=> not call remote API in ID market ', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);

      final result = await reOrderPermissionRepository.getReorderPermission(
        shipToInfo: fakeShipToInfo,
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeIDSalesOrganisation,
        materialNumbers: fakeMaterialNumbers,
        user: fakeSalesRepUser,
        salesOrganisationConfigs: fakeSalesOrganisationConfigs,
      );

      final expectedResult = ReOrderPermission(
        validMaterials: fakeMaterialNumbers
            .map((e) => ValidMaterial.empty().copyWith(materialNumber: e))
            .toList(),
      );

      verifyZeroInteractions(reOrderPermissionRemoteDataSource);
      expect(result, Right(expectedResult));
    });

    test('=> get remotely success', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => reOrderPermissionRemoteDataSource.getPermission(
          shipToCode: fakeShipToInfo.shipToCustomerCode,
          customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
          salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
          materialNumbers:
              fakeMaterialNumbers.map((e) => e.getOrCrash()).toList(),
          isEnableGimmickMaterial:
              fakeSalesOrganisationConfigs.enableGimmickMaterial,
          isSalesRepUser: fakeSalesRepUser.role.type.isSalesRepRole,
          userName: fakeSalesRepUser.username.getValue(),     
        ),
      ).thenAnswer(
        (invocation) async => getReorderPermissionResponseMock,
      );

      final result = await reOrderPermissionRepository.getReorderPermission(
        shipToInfo: fakeShipToInfo,
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        materialNumbers: fakeMaterialNumbers,
        user: fakeSalesRepUser,
        salesOrganisationConfigs: fakeSalesOrganisationConfigs,
      );
      expect(
        result.isRight(),
        true,
      );
    });

    test(
        '=> get remotely success and throw the exception when all materials are invalid',
        () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => reOrderPermissionRemoteDataSource.getPermission(
          shipToCode: fakeShipToInfo.shipToCustomerCode,
          customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
          salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
          materialNumbers:
              fakeMaterialNumbers.map((e) => e.getOrCrash()).toList(),
          isEnableGimmickMaterial:
              fakeSalesOrganisationConfigs.enableGimmickMaterial,
          isSalesRepUser: fakeSalesRepUser.role.type.isSalesRepRole,
          userName: fakeSalesRepUser.username.getValue(),    
        ),
      ).thenAnswer(
        (invocation) async => ReOrderPermission.empty(),
      );

      final result = await reOrderPermissionRepository.getReorderPermission(
        shipToInfo: fakeShipToInfo,
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        materialNumbers: fakeMaterialNumbers,
        user: fakeSalesRepUser,
        salesOrganisationConfigs: fakeSalesOrganisationConfigs,
      );
      expect(result, const Left(ApiFailure.allReorderItemInvalid()));
    });
  });
}

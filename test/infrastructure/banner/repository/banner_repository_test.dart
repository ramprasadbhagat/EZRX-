import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/sales_org_customer_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/banner/entities/banner.dart';
import 'package:ezrxmobile/infrastructure/banner/datasource/banner_local.dart';
import 'package:ezrxmobile/infrastructure/banner/datasource/banner_remote.dart';
import 'package:ezrxmobile/infrastructure/banner/dtos/banner_dto.dart';
import 'package:ezrxmobile/infrastructure/banner/repository/banner_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class BannerRemoteDataSourceMock extends Mock
    implements BannerRemoteDataSource {}

class BannerLocalDataSourceMock extends Mock implements BannerLocalDataSource {}

class ConfigMock extends Mock implements Config {}

void main() {
  late BannerRepository repository;
  late BannerRemoteDataSource remoteDataSourceMock;
  late Config configMock;
  late BannerLocalDataSource localDataSourceMock;
  late List<BannerItem> bannerListMock;
  final salesOrg2601 = SalesOrg('2601');
  final mockSalesOrganisation = SalesOrganisation(
    salesOrg: salesOrg2601,
    customerInfos: <SalesOrgCustomerInfo>[],
  );

  setUpAll(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      configMock = Config()..appFlavor = Flavor.uat;
      localDataSourceMock = BannerLocalDataSourceMock();
      when(
        () => localDataSourceMock.getBanners(
          isPreSalesOrg: false,
          salesOrg: mockSalesOrganisation.salesOrg.getOrCrash(),
        ),
      ).thenAnswer((invocation) async {
        final res = json.decode(
          await rootBundle.loadString('assets/json/getBannersResponse.json'),
        );

        return List.from(res['data']['getBanners'])
            .map((e) => BannerDto.fromJson(e).toDomain())
            .toList();
      });

      remoteDataSourceMock = BannerRemoteDataSourceMock();

      repository = BannerRepository(
        remoteDataSource: remoteDataSourceMock,
        config: configMock,
        localDataSource: localDataSourceMock,
      );
    },
  );

  group('Banner Repository', () {
    test('Get banner from remote success', () async {
      bannerListMock = await localDataSourceMock.getBanners(
        isPreSalesOrg: false,
        salesOrg: mockSalesOrganisation.salesOrg.getOrCrash(),
      );

      when(
        () => remoteDataSourceMock.getBanners(
          isPreSalesOrg: false,
          salesOrg: mockSalesOrganisation.salesOrg.getOrCrash(),
        ),
      ).thenAnswer(
        (invocation) async => bannerListMock,
      );

      final result = await repository.getBanner(
        isPreSalesOrg: false,
        salesOrganisation: mockSalesOrganisation,
      );
      expect(result.isRight(), true);

      verify(
        () => repository.getBanner(
          isPreSalesOrg: false,
          salesOrganisation: mockSalesOrganisation,
        ),
      ).called(1);
    });

    test('Get banner from remote failed', () async {
      when(
        () => remoteDataSourceMock.getBanners(
          isPreSalesOrg: false,
          salesOrg: mockSalesOrganisation.salesOrg.getOrCrash(),
        ),
      ).thenThrow(
        (invocation) async => Exception('fake-error'),
      );

      final result = await repository.getBanner(
        isPreSalesOrg: false,
        salesOrganisation: mockSalesOrganisation,
      );
      expect(result.isLeft(), true);

      verify(
        () => repository.getBanner(
          isPreSalesOrg: false,
          salesOrganisation: mockSalesOrganisation,
        ),
      ).called(1);
    });

    test('Get banner from local success', () async {
      final repository = BannerRepository(
        remoteDataSource: remoteDataSourceMock,
        config: configMock..appFlavor = Flavor.mock,
        localDataSource: localDataSourceMock,
      );

      final result = await repository.getBanner(
        isPreSalesOrg: false,
        salesOrganisation: mockSalesOrganisation,
      );
      expect(result.isRight(), true);
    });

    test('Get banner from local failed', () async {
      final repository = BannerRepository(
        remoteDataSource: remoteDataSourceMock,
        config: configMock..appFlavor = Flavor.mock,
        localDataSource: localDataSourceMock,
      );
      when(
        () => localDataSourceMock.getBanners(
          isPreSalesOrg: false,
          salesOrg: mockSalesOrganisation.salesOrg.getOrCrash(),
        ),
      ).thenThrow(
        () => Exception('fake-error'),
      );

      final result = await repository.getBanner(
        isPreSalesOrg: false,
        salesOrganisation: mockSalesOrganisation,
      );
      expect(result.isLeft(), true);
    });
  });
}

import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_price_detail.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_detail_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_detail_remote.dart';
import 'package:ezrxmobile/infrastructure/order/repository/material_price_detail_repository.dart';

import '../../../common_mock_data/user_mock.dart';
import '../../../common_mock_data/mock_other.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_vn_sales_org_config.dart';

class MaterialDetailRemoteDataSourceMock extends Mock
    implements MaterialPriceDetailRemoteDataSource {}

class MaterialDetailLocalDataSourceMock extends Mock
    implements MaterialPriceDetailLocalDataSource {}


class MaterialPriceDetailRepositoryMock extends Mock
    implements MaterialPriceDetailRepository {}

void main() {
  late MaterialPriceDetailRepository repository;
  late MaterialPriceDetailRemoteDataSource remoteDataSourceMock;
  late Config configMock;
  late MaterialPriceDetailLocalDataSource localDataSourceMock;

  final fakeCustomerCodeInfo = CustomerCodeInfo.empty()
      .copyWith(customerCodeSoldTo: 'fake-customer-code');
  final fakeShipToInfo =
      ShipToInfo.empty().copyWith(shipToCustomerCode: 'fake-ship-to-code');

  final fakeQuery = [
    MaterialQueryInfo.empty().copyWith(
      value: MaterialNumber('fake-material-1'),
      qty: MaterialQty(1),
    ),
    MaterialQueryInfo.empty().copyWith(
      value: MaterialNumber('fake-material-2'),
      qty: MaterialQty(2),
    ),
    MaterialQueryInfo.empty().copyWith(
      value: MaterialNumber('fake-material-3'),
      qty: MaterialQty(3),
    ),
  ];
  final fakeQueryResponseNotEnableZDP5 = [
    MaterialPriceDetail.empty().copyWith.price(
          materialNumber: MaterialNumber('fake-material-1'),
          finalPrice: MaterialPrice(1),
        ),
    MaterialPriceDetail.empty().copyWith.price(
          materialNumber: MaterialNumber('fake-material-2'),
          finalPrice: MaterialPrice(4),
        ),
    MaterialPriceDetail.empty().copyWith.price(
          materialNumber: MaterialNumber('fake-material-3'),
          finalPrice: MaterialPrice(6),
        )
  ];
  final fakeQueryResponseToEnableZDP5 = [
    MaterialPriceDetail.empty().copyWith.price(
          materialNumber: MaterialNumber('fake-material-1'),
          finalPrice: MaterialPrice(1),
        ),
    MaterialPriceDetail.empty().copyWith.price(
          materialNumber: MaterialNumber('fake-material-2'),
          finalPrice: MaterialPrice(4),
          zdp5MaxQuota: ZDP5Info('3'),
        ),
    MaterialPriceDetail.empty().copyWith.price(
          materialNumber: MaterialNumber('fake-material-3'),
          finalPrice: MaterialPrice(6),
          zdp5RemainingQuota: ZDP5Info('0'),
        )
  ];
  final fakeQueryResponseWhenEnableZDP5 = [
    MaterialPriceDetail.empty().copyWith.price(
          materialNumber: MaterialNumber('fake-material-2'),
          finalPrice: MaterialPrice(6),
          zdp5MaxQuota: ZDP5Info('3'),
        ),
    MaterialPriceDetail.empty().copyWith.price(
          materialNumber: MaterialNumber('fake-material-3'),
          finalPrice: MaterialPrice(9),
          zdp5RemainingQuota: ZDP5Info('0'),
        )
  ];
  final fakeQueryResponseWhenEnableZDP5WithOverride = [
    MaterialPriceDetail.empty().copyWith.price(
          materialNumber: MaterialNumber('fake-material-1'),
          finalPrice: MaterialPrice(1),
          zdp8Override: Zdp8OverrideValue(1),
          priceOverride: PriceOverrideValue(1),
          zdp5MaxQuota: ZDP5Info('3'),
        ),
  ];
  final fakeQueryWithOverride = [
    MaterialQueryInfo.empty().copyWith(
      value: MaterialNumber('fake-material-1'),
      qty: MaterialQty(1),
      zdp8Override: 1,
      priceOverride: 1,
    ),
  ];
  setUpAll(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      configMock = ConfigMock();
      localDataSourceMock = MaterialDetailLocalDataSourceMock();
      remoteDataSourceMock = MaterialDetailRemoteDataSourceMock();
      repository = MaterialPriceDetailRepository(
        remoteDataSource: remoteDataSourceMock,
        config: configMock,
        localDataSource: localDataSourceMock,
      );
    },
  );
  group('MaterialDetail Repository', () {
    test('Get MaterialDetails from local success with no ZDP5 enable',
        () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);
      when(() => localDataSourceMock.getMaterialDetailList()).thenAnswer(
        (invocation) async => fakeQueryResponseNotEnableZDP5,
      );

      final result = await repository.getMaterialDetailList(
        salesOrganisation: fakeMYSalesOrganisation,
        salesOrganisationConfigs: fakeMYSalesOrgConfigs,
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToCodeInfo: fakeShipToInfo,
        materialQueryList: fakeQuery,
        preferredLanguage: fakeClientUser.preferredLanguage,
      );

      expect(result.isRight(), true);
      await result.fold((l) async {}, (r) async {
        expect(
          r,
          {
            fakeQuery[0]: fakeQueryResponseNotEnableZDP5[0],
            fakeQuery[1]: fakeQueryResponseNotEnableZDP5[1],
            fakeQuery[2]: fakeQueryResponseNotEnableZDP5[2],
          },
        );
      });
    });
    test('Get MaterialDetails from local fail with no ZDP5 enable', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);
      when(() => localDataSourceMock.getMaterialDetailList())
          .thenThrow((invocation) async => MockException());

      final result = await repository.getMaterialDetailList(
        salesOrganisation: fakeMYSalesOrganisation,
        salesOrganisationConfigs: fakeMYSalesOrgConfigs,
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToCodeInfo: fakeShipToInfo,
        materialQueryList: fakeQuery,
        preferredLanguage: fakeClientUser.preferredLanguage,
      );

      expect(result.isLeft(), true);
    });
    test('Get MaterialDetails from remote success with no ZDP5 enable',
        () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.dev);

      when(
        () => remoteDataSourceMock.getMaterialDetail(
          salesOrgCode: fakeMYSalesOrganisation.salesOrg.getValue(),
          customerCode: 'fake-customer-code',
          shipToCode: 'fake-ship-to-code',
          language: 'EN',
          listPriceOnly: false,
          queryString: [
            {
              'MaterialNumber': 'fake-material-1',
            },
            {
              'MaterialNumber': 'fake-material-2',
            },
            {
              'MaterialNumber': 'fake-material-3',
            }
          ],
        ),
      ).thenAnswer(
        (invocation) async => fakeQueryResponseNotEnableZDP5,
      );

      final result = await repository.getMaterialDetailList(
        salesOrganisation: fakeMYSalesOrganisation,
        salesOrganisationConfigs: fakeMYSalesOrgConfigs,
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToCodeInfo: fakeShipToInfo,
        materialQueryList: fakeQuery,
        preferredLanguage: fakeClientUser.preferredLanguage,
      );

      expect(result.isRight(), true);

      await result.fold((l) async {}, (r) async {
        expect(
          r,
          {
            fakeQuery[0]: fakeQueryResponseNotEnableZDP5[0],
            fakeQuery[1]: fakeQueryResponseNotEnableZDP5[1],
            fakeQuery[2]: fakeQueryResponseNotEnableZDP5[2],
          },
        );
      });
    });
    test('Get MaterialDetails from remote fail with no ZDP5 enable', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.dev);

      when(
        () => remoteDataSourceMock.getMaterialDetail(
          salesOrgCode: fakeMYSalesOrganisation.salesOrg.getValue(),
          customerCode: 'fake-customer-code',
          shipToCode: 'fake-ship-to-code',
          listPriceOnly: false,
          language: 'EN',
          queryString: [
            {
              'MaterialNumber': 'fake-material-1',
            },
            {
              'MaterialNumber': 'fake-material-2',
            },
            {
              'MaterialNumber': 'fake-material-3',
            }
          ],
        ),
      ).thenThrow((invocation) async => MockException());

      final result = await repository.getMaterialDetailList(
        salesOrganisation: fakeMYSalesOrganisation,
        salesOrganisationConfigs: fakeMYSalesOrgConfigs,
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToCodeInfo: fakeShipToInfo,
        materialQueryList: fakeQuery,
        preferredLanguage: fakeClientUser.preferredLanguage,
      );

      expect(result.isLeft(), true);
    });
    test('Get MaterialDetailZDP5Enabled from local success with no ZDP5 enable',
        () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);

      when(() => localDataSourceMock.getMaterialDetailList()).thenAnswer(
        (invocation) async => fakeQueryResponseWhenEnableZDP5,
      );

      final result = await repository.getMaterialDetailList(
        salesOrganisation: fakeMYSalesOrganisation,
        salesOrganisationConfigs: fakeMYSalesOrgConfigs,
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToCodeInfo: fakeShipToInfo,
        materialQueryList: fakeQuery,
        preferredLanguage: fakeClientUser.preferredLanguage,
      );

      expect(result.isRight(), true);
    });

    test('Get MaterialDetailZDP5Enabled from local fail with no ZDP5 enable',
        () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);

      when(() => localDataSourceMock.getMaterialDetailList()).thenThrow(
        (invocation) async => MockException(),
      );

      final result = await repository.getMaterialDetailList(
        salesOrganisation: fakeMYSalesOrganisation,
        salesOrganisationConfigs: fakeMYSalesOrgConfigs,
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToCodeInfo: fakeShipToInfo,
        materialQueryList: <MaterialQueryInfo>[],
        preferredLanguage: fakeClientUser.preferredLanguage,
      );

      expect(result.isLeft(), true);
    });
    test(
        'Get MaterialDetailZDP5Enabled from remote success with no ZDP5 enable',
        () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.dev);

      when(
        () => remoteDataSourceMock.getMaterialDetail(
          salesOrgCode: fakeVNSalesOrganisation.salesOrg.getValue(),
          customerCode: 'fake-customer-code',
          shipToCode: 'fake-ship-to-code',
          listPriceOnly: false,
          language: 'EN',
          queryString: [
            {
              'MaterialNumber': 'fake-material-1',
            },
            {
              'MaterialNumber': 'fake-material-2',
            },
            {
              'MaterialNumber': 'fake-material-3',
            }
          ],
        ),
      ).thenAnswer(
        (invocation) async => fakeQueryResponseToEnableZDP5,
      );
      when(
        () => remoteDataSourceMock.getMaterialDetailZDP5Enabled(
          salesOrgCode: fakeVNSalesOrganisation.salesOrg.getValue(),
          customerCode: 'fake-customer-code',
          shipToCode: 'fake-ship-to-code',
          language: 'EN',
          materialNumbers: {
            'fake-material-2': true,
            'fake-material-3': true,
          },
        ),
      ).thenAnswer(
        (invocation) async => fakeQueryResponseWhenEnableZDP5,
      );

      final result = await repository.getMaterialDetailList(
        salesOrganisation: fakeVNSalesOrganisation,
        salesOrganisationConfigs: fakeVNSalesOrgConfigs,
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToCodeInfo: fakeShipToInfo,
        materialQueryList: fakeQuery,
        preferredLanguage: fakeClientUser.preferredLanguage,
      );

      verify(
        () => remoteDataSourceMock.getMaterialDetailZDP5Enabled(
          salesOrgCode: fakeVNSalesOrganisation.salesOrg.getValue(),
          customerCode: 'fake-customer-code',
          shipToCode: 'fake-ship-to-code',
          language: 'EN',
          materialNumbers: {
            'fake-material-2': true,
            'fake-material-3': true,
          },
        ),
      ).called(1);

      expect(result.isRight(), true);

      await result.fold((l) async {}, (r) async {
        expect(
          r,
          {
            fakeQuery[0]: fakeQueryResponseNotEnableZDP5[0],
            fakeQuery[1]: fakeQueryResponseWhenEnableZDP5[0],
            fakeQuery[2]: fakeQueryResponseWhenEnableZDP5[1],
          },
        );
      });
    });

    test('Get MaterialDetailZDP5Enabled from remote fail with no ZDP5 enable',
        () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.dev);

      when(
        () => remoteDataSourceMock.getMaterialDetail(
          salesOrgCode: fakeVNSalesOrganisation.salesOrg.getValue(),
          customerCode: 'fake-customer-code',
          shipToCode: 'fake-ship-to-code',
          listPriceOnly: false,
          language: 'EN',
          queryString: [
            {
              'MaterialNumber': 'fake-material-1',
            },
            {
              'MaterialNumber': 'fake-material-2',
            },
            {
              'MaterialNumber': 'fake-material-3',
            }
          ],
        ),
      ).thenAnswer(
        (invocation) async => fakeQueryResponseToEnableZDP5,
      );
      when(
        () => remoteDataSourceMock.getMaterialDetailZDP5Enabled(
          salesOrgCode: fakeVNSalesOrganisation.salesOrg.getValue(),
          customerCode: 'fake-customer-code',
          shipToCode: 'fake-ship-to-code',
          language: 'EN',
          materialNumbers: {
            'fake-material-2': true,
            'fake-material-3': true,
          },
        ),
      ).thenThrow((invocation) async => MockException());

      final result = await repository.getMaterialDetailList(
        salesOrganisation: fakeVNSalesOrganisation,
        salesOrganisationConfigs: fakeVNSalesOrgConfigs,
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToCodeInfo: fakeShipToInfo,
        materialQueryList: fakeQuery,
        preferredLanguage: fakeClientUser.preferredLanguage,
      );

      verify(
        () => remoteDataSourceMock.getMaterialDetailZDP5Enabled(
          salesOrgCode: fakeVNSalesOrganisation.salesOrg.getValue(),
          customerCode: 'fake-customer-code',
          shipToCode: 'fake-ship-to-code',
          language: 'EN',
          materialNumbers: {
            'fake-material-2': true,
            'fake-material-3': true,
          },
        ),
      ).called(1);

      expect(result.isRight(), true);
    });

    test('Get MaterialDetails from remote success ZDP8 override', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.dev);

      when(
        () => remoteDataSourceMock.getMaterialDetail(
          salesOrgCode: fakeVNSalesOrganisation.salesOrg.getValue(),
          customerCode: 'fake-customer-code',
          shipToCode: 'fake-ship-to-code',
          listPriceOnly: false,
          language: 'EN',
          queryString: [
            {
              'MaterialNumber': 'fake-material-1',
              'ZDP8': 1,
              'ZPO1': 1,
            },
          ],
        ),
      ).thenAnswer(
        (invocation) async => fakeQueryResponseWhenEnableZDP5WithOverride,
      );

      final result = await repository.getMaterialDetailList(
        salesOrganisation: fakeVNSalesOrganisation,
        salesOrganisationConfigs: fakeVNSalesOrgConfigs,
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToCodeInfo: fakeShipToInfo,
        materialQueryList: fakeQueryWithOverride,
        preferredLanguage: fakeClientUser.preferredLanguage,
      );

      expect(result.isRight(), true);

      await result.fold((l) async {}, (r) async {
        expect(
          r,
          {
            fakeQueryWithOverride[0]:
                fakeQueryResponseWhenEnableZDP5WithOverride[0],
          },
        );
      });
    });
    test('Get MaterialDetails from remote fail ZDP8 override', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.dev);

      when(
        () => remoteDataSourceMock.getMaterialDetailZDP5Enabled(
          salesOrgCode: fakeVNSalesOrganisation.salesOrg.getValue(),
          customerCode: '',
          shipToCode: '',
          language: Language.english().languageCode,
          materialNumbers: {},
        ),
      ).thenThrow(
        (invocation) async => MockException(),
      );

      final result = await repository.getMaterialDetailListWithZDP5Enabled(
        salesOrganisation: fakeVNSalesOrganisation,
        salesOrganisationConfigs: fakeVNSalesOrgConfigs,
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToCodeInfo: fakeShipToInfo,
        materialQueryList: {},
        preferredLanguage: fakeClientUser.preferredLanguage,
      );

      await result.fold((l) async {}, (r) async {
        expect(
          r,
          {
            fakeQueryWithOverride[0]:
                fakeQueryResponseWhenEnableZDP5WithOverride[0],
          },
        );
      });
      expect(result.isLeft(), true);
    });
    test('Get MaterialDetails from local success ZDP8 override', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);

      when(
        () => localDataSourceMock.getMaterialDetailList(),
      ).thenAnswer(
        (invocation) async => fakeQueryResponseWhenEnableZDP5WithOverride,
      );

      final result = await repository.getMaterialDetailList(
        salesOrganisation: fakeVNSalesOrganisation,
        salesOrganisationConfigs: fakeVNSalesOrgConfigs,
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToCodeInfo: fakeShipToInfo,
        materialQueryList: fakeQueryWithOverride,
        preferredLanguage: fakeClientUser.preferredLanguage,
      );

      expect(result.isRight(), true);

      await result.fold((l) async {}, (r) async {
        expect(
          r,
          {
            fakeQueryWithOverride[0]:
                fakeQueryResponseWhenEnableZDP5WithOverride[0],
          },
        );
      });
    });
    test('Get MaterialDetails from local fail ZDP8 override', () async {
      when(() => configMock.appFlavor).thenReturn(Flavor.mock);

      when(() => localDataSourceMock.getMaterialDetailList()).thenThrow(
        (invocation) async => MockException(),
      );

      final result = await repository.getMaterialDetailListWithZDP5Enabled(
        salesOrganisation: fakeVNSalesOrganisation,
        salesOrganisationConfigs: fakeVNSalesOrgConfigs,
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToCodeInfo: fakeShipToInfo,
        materialQueryList: {},
        preferredLanguage: fakeClientUser.preferredLanguage,
      );

      expect(result.isLeft(), true);

      await result.fold((l) async {}, (r) async {
        expect(
          r,
          {
            fakeQueryWithOverride[0]:
                fakeQueryResponseWhenEnableZDP5WithOverride[0],
          },
        );
      });
    });

    group('Get single material detail', () {
      test('- local success', () async {
        when(() => configMock.appFlavor).thenReturn(Flavor.mock);
        when(() => localDataSourceMock.getMaterialDetailList()).thenAnswer(
          (invocation) async => [fakeQueryResponseNotEnableZDP5.first],
        );

        final result = await repository.getMaterialDetail(
          salesOrganisation: fakeVNSalesOrganisation,
          salesOrganisationConfigs: fakeVNSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToCodeInfo: fakeShipToInfo,
          materialNumber: fakeQuery.first.value,
          preferredLanguage: fakeClientUser.preferredLanguage,
        );

        expect(result.isRight(), true);
        await result.fold((l) async {}, (r) async {
          expect(r, fakeQueryResponseNotEnableZDP5[0]);
        });
      });
      test('- local fail', () async {
        when(() => configMock.appFlavor).thenReturn(Flavor.mock);
        when(() => localDataSourceMock.getMaterialDetailList())
            .thenThrow((invocation) async => MockException());

        final result = await repository.getMaterialDetail(
          salesOrganisation: fakeVNSalesOrganisation,
          salesOrganisationConfigs: fakeVNSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToCodeInfo: fakeShipToInfo,
          materialNumber: fakeQuery.first.value,
          preferredLanguage: fakeClientUser.preferredLanguage,
        );

        expect(result.isLeft(), true);
      });
      test('- remote success', () async {
        when(() => configMock.appFlavor).thenReturn(Flavor.dev);

        when(
          () => remoteDataSourceMock.getMaterialDetail(
            salesOrgCode: fakeMYSalesOrganisation.salesOrg.getValue(),
            customerCode: 'fake-customer-code',
            shipToCode: 'fake-ship-to-code',
            language: 'EN',
            listPriceOnly: false,
            queryString: [
              {'MaterialNumber': 'fake-material-1'}
            ],
          ),
        ).thenAnswer(
          (invocation) async => [fakeQueryResponseNotEnableZDP5.first],
        );

        final result = await repository.getMaterialDetail(
          salesOrganisation: fakeMYSalesOrganisation,
          salesOrganisationConfigs: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToCodeInfo: fakeShipToInfo,
          materialNumber: fakeQuery.first.value,
          preferredLanguage: fakeClientUser.preferredLanguage,
        );

        expect(result.isRight(), true);

        await result.fold((l) async {}, (r) async {
          expect(r, fakeQueryResponseNotEnableZDP5[0]);
        });
      });
      test('- remote fail', () async {
        when(() => configMock.appFlavor).thenReturn(Flavor.dev);

        when(
          () => remoteDataSourceMock.getMaterialDetail(
            salesOrgCode: fakeMYSalesOrganisation.salesOrg.getValue(),
            customerCode: 'fake-customer-code',
            shipToCode: 'fake-ship-to-code',
            listPriceOnly: false,
            language: 'EN',
            queryString: [
              {'MaterialNumber': 'fake-material-1'}
            ],
          ),
        ).thenThrow((invocation) async => MockException());

        final result = await repository.getMaterialDetail(
          salesOrganisation: fakeMYSalesOrganisation,
          salesOrganisationConfigs: fakeMYSalesOrgConfigs,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToCodeInfo: fakeShipToInfo,
          materialNumber: fakeQuery.first.value,
          preferredLanguage: fakeClientUser.preferredLanguage,
        );

        expect(result.isLeft(), true);
      });
    });
  });
}

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';

import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/material_price_detail.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';

import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_detail_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/material_price_detail_repository.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MaterialDetailRepositoryMock extends Mock
    implements MaterialPriceDetailRepository {}

void main() {
  final MaterialPriceDetailRepository repository =
      MaterialDetailRepositoryMock();

  late final Map<MaterialQueryInfo, MaterialPriceDetail> mockDetails;

  final fakeSaleOrg =
      SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('fake-saleOrg'));
  final fakeCustomerCodeInfo = CustomerCodeInfo.empty()
      .copyWith(customerCodeSoldTo: 'fake-customer-code');
  final fakeShipToInfo =
      ShipToInfo.empty().copyWith(shipToCustomerCode: 'fake-ship-to-code');
  final fakeSaleOrgConfig = SalesOrganisationConfigs.empty();

  final fakeQuery = [
    MaterialQueryInfo.empty().copyWith(
      value: MaterialNumber('000000000023210571'),
      qty: MaterialQty(1),
    ),
    MaterialQueryInfo.empty().copyWith(
      value: MaterialNumber('000000000023245612'),
      qty: MaterialQty(1),
    ),
  ];
  final fakeQueryALlFOC = [
    MaterialQueryInfo.empty().copyWith(
        value: MaterialNumber('000000000023210571'),
        qty: MaterialQty(1),
        materialGroup4: MaterialGroup.four('6A1')),
    MaterialQueryInfo.empty().copyWith(
        value: MaterialNumber('000000000023245612'),
        qty: MaterialQty(1),
        materialGroup4: MaterialGroup.four('6A1')),
  ];

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    final detailData =
        await MaterialPriceDetailLocalDataSource().getMaterialDetailList();
    mockDetails = {
      for (var detail in detailData)
        MaterialQueryInfo.empty().copyWith(
          value: detail.price.materialNumber,
          qty: MaterialQty(1),
        ): detail,
    };
  });

  group('Material Detail Bloc', () {
    blocTest(
      'Initialize',
      build: () => MaterialPriceDetailBloc(repository),
      act: (MaterialPriceDetailBloc bloc) => bloc.add(
        const MaterialPriceDetailEvent.initialized(),
      ),
      expect: () => [MaterialPriceDetailState.initial()],
    );

    blocTest(
      'Fetch stop when already has these material details ',
      build: () => MaterialPriceDetailBloc(repository),
      seed: () => MaterialPriceDetailState.initial()
          .copyWith(materialDetails: mockDetails),
      act: (MaterialPriceDetailBloc bloc) => bloc.add(
        MaterialPriceDetailEvent.fetch(
          customerCode: fakeCustomerCodeInfo,
          salesOrganisation: fakeSaleOrg,
          salesOrganisationConfigs: fakeSaleOrgConfig,
          shipToCode: fakeShipToInfo,
          materialInfos: fakeQuery,
        ),
      ),
      expect: () => [],
    );

    blocTest(
      'All query material got Filtered because all is FOC ',
      build: () => MaterialPriceDetailBloc(repository),
      act: (MaterialPriceDetailBloc bloc) => bloc.add(
        MaterialPriceDetailEvent.fetch(
          customerCode: fakeCustomerCodeInfo,
          salesOrganisation: fakeSaleOrg,
          salesOrganisationConfigs: fakeSaleOrgConfig,
          shipToCode: fakeShipToInfo,
          materialInfos: fakeQueryALlFOC,
        ),
      ),
      expect: () => [
        MaterialPriceDetailState.initial().copyWith(materialDetails: {
          for (final material in fakeQueryALlFOC)
            material: MaterialPriceDetail.empty().copyWith(
              price: Price.empty().copyWith(materialNumber: material.value),
            )
        })
      ],
    );

    blocTest(
      'Fetch material detail success',
      build: () => MaterialPriceDetailBloc(repository),
      setUp: () {
        when(
          () => repository.getMaterialDetail(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeSaleOrg,
            salesOrganisationConfigs: fakeSaleOrgConfig,
            shipToCodeInfo: fakeShipToInfo,
            materialQueryList: fakeQuery,
          ),
        ).thenAnswer(
          (_) async => Right(mockDetails),
        );
      },
      act: (MaterialPriceDetailBloc bloc) => bloc.add(
        MaterialPriceDetailEvent.fetch(
          customerCode: fakeCustomerCodeInfo,
          salesOrganisation: fakeSaleOrg,
          salesOrganisationConfigs: fakeSaleOrgConfig,
          shipToCode: fakeShipToInfo,
          materialInfos: fakeQuery,
        ),
      ),
      expect: () => [
        MaterialPriceDetailState.initial().copyWith(isFetching: true),
        MaterialPriceDetailState.initial().copyWith(
          isFetching: false,
          materialDetails: mockDetails,
        ),
      ],
    );

    blocTest(
      'Fetch material detail failure',
      build: () => MaterialPriceDetailBloc(repository),
      setUp: () {
        when(
          () => repository.getMaterialDetail(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeSaleOrg,
            salesOrganisationConfigs: fakeSaleOrgConfig,
            shipToCodeInfo: fakeShipToInfo,
            materialQueryList: fakeQuery,
          ),
        ).thenAnswer(
          (_) async => const Left(ApiFailure.other('fake-error')),
        );
      },
      act: (MaterialPriceDetailBloc bloc) => bloc.add(
        MaterialPriceDetailEvent.fetch(
          customerCode: fakeCustomerCodeInfo,
          salesOrganisation: fakeSaleOrg,
          salesOrganisationConfigs: fakeSaleOrgConfig,
          shipToCode: fakeShipToInfo,
          materialInfos: fakeQuery,
        ),
      ),
      expect: () => [
        MaterialPriceDetailState.initial().copyWith(isFetching: true),
        MaterialPriceDetailState.initial().copyWith(
          isFetching: false,
        ),
      ],
    );
  });
}

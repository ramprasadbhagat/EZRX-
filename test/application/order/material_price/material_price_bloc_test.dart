import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/price_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/price_rule.dart';
import 'package:ezrxmobile/domain/order/entities/price_tier.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/material_price_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MaterialPriceRepositoryMock extends Mock
    implements MaterialPriceRepository {}

void main() {
  late final MaterialPriceRepository repository;

  late final Map<MaterialNumber, Price> mockPriceMap;

  final fakeSalesOrg = SalesOrganisation.empty().copyWith(
    salesOrg: SalesOrg('fake-name'),
  );
  final fakeCustomerCodeInfo = CustomerCodeInfo.empty().copyWith(
    customerCodeSoldTo: 'fake-code',
  );
  final fakeShipToInfo = ShipToInfo.empty().copyWith(
    shipToCustomerCode: 'fake-code',
  );

  final fakeSalesConfigs = SalesOrganisationConfigs.empty();

  final fakeFOCMaterialQuery = [
    MaterialInfo.empty().copyWith(
        code: MaterialNumber('1'),
        materialGroup4: MaterialGroup.four('6A1')),
    MaterialInfo.empty().copyWith(
        code: MaterialNumber('2'),
        materialGroup4: MaterialGroup.four('6A1')),
  ];

  final fakeMaterialQuery = [
    MaterialInfo.empty().copyWith(code: MaterialNumber('1')),
    MaterialInfo.empty().copyWith(code: MaterialNumber('2')),
  ];

  final fakeMaterialNumberQuery = [
    MaterialNumber('1'),
    MaterialNumber('2'),
  ];

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    repository = MaterialPriceRepositoryMock();
    final priceData = await MaterialPriceLocalDataSource().getPriceList();
    mockPriceMap = {
      for (var price in priceData) price.materialNumber: price,
    };
  });

  group('Material Price Bloc', () {
    blocTest(
      'Initialize',
      build: () => MaterialPriceBloc(repository: repository),
      act: (MaterialPriceBloc bloc) => bloc.add(
        const MaterialPriceEvent.initialized(),
      ),
      expect: () => [MaterialPriceState.initial()],
    );

    blocTest<MaterialPriceBloc, MaterialPriceState>(
      'Fetch when all materials query already have their price',
      build: () => MaterialPriceBloc(repository: repository),
      seed: () => MaterialPriceState.initial().copyWith(
        materialPrice: {
          for (var number in fakeMaterialQuery)
            number.code: Price.empty().copyWith(
              rules: [PriceRule.empty()],
              tiers: [PriceTier.empty()],
              bonuses: [PriceBonus.empty()],
            ),
        },
      ),
      act: (MaterialPriceBloc bloc) => bloc.add(
        MaterialPriceEvent.fetch(
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          salesOrganisation: fakeSalesOrg,
          salesConfigs: fakeSalesConfigs,
          materials: fakeMaterialQuery,
          comboDealEligible: false,
        ),
      ),
      expect: () {
        return [
        MaterialPriceState.initial().copyWith(
          isFetching: true,
          materialPrice: {
            for (var number in fakeMaterialQuery)
              number.code: Price.empty().copyWith(
                rules: [PriceRule.empty()],
                tiers: [PriceTier.empty()],
                bonuses: [PriceBonus.empty()],
              ),
          },
        ),
        MaterialPriceState.initial().copyWith(
          isFetching: false,
          materialPrice: {
            for (var number in fakeMaterialQuery)
              number.code: Price.empty().copyWith(
                rules: [PriceRule.empty()],
                tiers: [PriceTier.empty()],
                bonuses: [PriceBonus.empty()],
              ),
          },
        )
      ];}
    );

    blocTest<MaterialPriceBloc, MaterialPriceState>(
      'Fetch when all materials is FOC',
      build: () => MaterialPriceBloc(repository: repository),
      act: (MaterialPriceBloc bloc) => bloc.add(
        MaterialPriceEvent.fetch(
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          salesOrganisation: fakeSalesOrg,
          salesConfigs: fakeSalesConfigs,
          materials: fakeFOCMaterialQuery,
          comboDealEligible: false,
        ),
      ),
      expect: () => [
        MaterialPriceState.initial().copyWith(isFetching: true),
        MaterialPriceState.initial().copyWith(
          isFetching: true,
          materialPrice: {
            for (final material in fakeFOCMaterialQuery)
              material.code: Price.empty()
                  .copyWith(materialNumber: material.code)
          },
        ),
        MaterialPriceState.initial().copyWith(
          isFetching: false,
          materialPrice: {
            for (final material in fakeFOCMaterialQuery)
              material.code: Price.empty()
                  .copyWith(materialNumber: material.code)
          },
        ),
      ],
    );

    blocTest<MaterialPriceBloc, MaterialPriceState>(
      'Fetch price success',
      build: () => MaterialPriceBloc(repository: repository),
      setUp: () {
        when(
          () => repository.getMaterialPrice(
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
            salesOrganisation: fakeSalesOrg,
            salesConfigs: fakeSalesConfigs,
            materialNumberList: fakeMaterialNumberQuery,
            comboDealEligible: false,
          ),
        ).thenAnswer(
          (_) async => Right(mockPriceMap),
        );
      },
      act: (MaterialPriceBloc bloc) => bloc.add(
        MaterialPriceEvent.fetch(
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          salesOrganisation: fakeSalesOrg,
          salesConfigs: fakeSalesConfigs,
          materials: fakeMaterialQuery,
          comboDealEligible: false,
        ),
      ),
      expect: () => [
        MaterialPriceState.initial().copyWith(
          isFetching: true,
        ),
        MaterialPriceState.initial().copyWith(
          isFetching: false,
          materialPrice: mockPriceMap,
        ),
      ],
    );

    blocTest<MaterialPriceBloc, MaterialPriceState>(
      'Fetch price failure',
      build: () => MaterialPriceBloc(repository: repository),
      setUp: () {
        when(
          () => repository.getMaterialPrice(
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
            salesOrganisation: fakeSalesOrg,
            salesConfigs: fakeSalesConfigs,
            materialNumberList: fakeMaterialNumberQuery,
            comboDealEligible: false,
          ),
        ).thenAnswer(
          (_) async => const Left(ApiFailure.other('fake-error')),
        );
      },
      act: (MaterialPriceBloc bloc) => bloc.add(
        MaterialPriceEvent.fetch(
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          salesOrganisation: fakeSalesOrg,
          salesConfigs: fakeSalesConfigs,
          materials: fakeMaterialQuery,
          comboDealEligible: false,
        ),
      ),
      expect: () => [
        MaterialPriceState.initial().copyWith(
          isFetching: true,
        ),
        MaterialPriceState.initial().copyWith(
          isFetching: false,
        ),
      ],
    );
  });
}

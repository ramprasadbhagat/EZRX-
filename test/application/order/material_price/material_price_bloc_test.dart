import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
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

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';

class MaterialPriceRepositoryMock extends Mock
    implements MaterialPriceRepository {}

void main() {
  late final MaterialPriceRepository repository;

  late final Map<MaterialNumber, Price> mockPriceMap;

  final fakeShipToInfo = ShipToInfo.empty().copyWith(
    shipToCustomerCode: 'fake-code',
  );

  final fakeFOCMaterialQuery = [
    MaterialInfo.empty().copyWith(
      materialNumber: MaterialNumber('1'),
      isFOCMaterial: true,
    ),
    MaterialInfo.empty().copyWith(
      materialNumber: MaterialNumber('2'),
      isFOCMaterial: true,
    ),
  ];
  final materialPrice = {
    for (final material in fakeFOCMaterialQuery)
      material.materialNumber: Price.empty().copyWith(
        materialNumber: material.materialNumber,
        isValid: false,
      )
  };

  final fakeMaterialQuery = [
    MaterialInfo.empty().copyWith(materialNumber: MaterialNumber('1')),
    MaterialInfo.empty().copyWith(materialNumber: MaterialNumber('2')),
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

  group('Material Price Bloc for materials', () {
    blocTest(
      'Initialize',
      build: () => MaterialPriceBloc(repository: repository),
      act: (MaterialPriceBloc bloc) => bloc.add(
        MaterialPriceEvent.initialized(
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          salesOrganisation: fakeSalesOrganisation,
          salesConfigs: fakeEmptySalesConfigs,
        ),
      ),
      expect: () => [
        MaterialPriceState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          salesOrganisation: fakeSalesOrganisation,
          salesConfigs: fakeEmptySalesConfigs,
        )
      ],
    );

    blocTest<MaterialPriceBloc, MaterialPriceState>(
      'Fetch when all materials query already have their price',
      build: () => MaterialPriceBloc(repository: repository),
      seed: () => MaterialPriceState.initial().copyWith(
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToInfo: fakeShipToInfo,
        salesOrganisation: fakeSalesOrganisation,
        salesConfigs: fakeEmptySalesConfigs,
        materialPrice: {
          for (var number in fakeMaterialQuery)
            number.materialNumber: Price.empty().copyWith(
              rules: [PriceRule.empty()],
              tiers: [PriceTier.empty()],
              bonuses: [PriceBonus.empty()],
            ),
        },
      ),
      act: (MaterialPriceBloc bloc) => bloc.add(
        MaterialPriceEvent.fetch(
          materials: fakeMaterialQuery,
          comboDealEligible: false,
        ),
      ),
      expect: () {
        return [
          MaterialPriceState.initial().copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
            salesOrganisation: fakeSalesOrganisation,
            salesConfigs: fakeEmptySalesConfigs,
            isFetching: true,
            materialPrice: {
              for (var number in fakeMaterialQuery)
                number.materialNumber: Price.empty().copyWith(
                  rules: [PriceRule.empty()],
                  tiers: [PriceTier.empty()],
                  bonuses: [PriceBonus.empty()],
                ),
            },
          ),
          MaterialPriceState.initial().copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
            salesOrganisation: fakeSalesOrganisation,
            salesConfigs: fakeEmptySalesConfigs,
            materialPrice: {
              for (var number in fakeMaterialQuery)
                number.materialNumber: Price.empty().copyWith(
                  rules: [PriceRule.empty()],
                  tiers: [PriceTier.empty()],
                  bonuses: [PriceBonus.empty()],
                ),
            },
          )
        ];
      },
    );

    blocTest<MaterialPriceBloc, MaterialPriceState>(
      'Fetch when all materials is FOC',
      build: () => MaterialPriceBloc(repository: repository),
      seed: () => MaterialPriceState.initial().copyWith(
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToInfo: fakeShipToInfo,
        salesOrganisation: fakeSalesOrganisation,
        salesConfigs: fakeEmptySalesConfigs,
      ),
      act: (MaterialPriceBloc bloc) => bloc.add(
        MaterialPriceEvent.fetch(
          materials: fakeFOCMaterialQuery,
          comboDealEligible: false,
        ),
      ),
      expect: () => [
        MaterialPriceState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          salesOrganisation: fakeSalesOrganisation,
          salesConfigs: fakeEmptySalesConfigs,
          isFetching: true,
        ),
        MaterialPriceState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          salesOrganisation: fakeSalesOrganisation,
          salesConfigs: fakeEmptySalesConfigs,
          isFetching: true,
          materialPrice: materialPrice,
        ),
        MaterialPriceState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          salesOrganisation: fakeSalesOrganisation,
          salesConfigs: fakeEmptySalesConfigs,
          materialPrice: materialPrice,
        ),
      ],
    );

    blocTest<MaterialPriceBloc, MaterialPriceState>(
      'Fetch price success',
      build: () => MaterialPriceBloc(repository: repository),
      seed: () => MaterialPriceState.initial().copyWith(
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToInfo: fakeShipToInfo,
        salesOrganisation: fakeSalesOrganisation,
        salesConfigs: fakeEmptySalesConfigs,
      ),
      setUp: () {
        when(
          () => repository.getMaterialPrice(
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
            salesOrganisation: fakeSalesOrganisation,
            salesConfigs: fakeEmptySalesConfigs,
            materialNumberList: fakeMaterialNumberQuery,
            comboDealEligible: false,
          ),
        ).thenAnswer(
          (_) async => Right(mockPriceMap),
        );
      },
      act: (MaterialPriceBloc bloc) => bloc.add(
        MaterialPriceEvent.fetch(
          materials: fakeMaterialQuery,
          comboDealEligible: false,
        ),
      ),
      expect: () => [
        MaterialPriceState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          salesOrganisation: fakeSalesOrganisation,
          salesConfigs: fakeEmptySalesConfigs,
          isFetching: true,
        ),
        MaterialPriceState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          salesOrganisation: fakeSalesOrganisation,
          salesConfigs: fakeEmptySalesConfigs,
          materialPrice: mockPriceMap,
        ),
      ],
    );

    blocTest<MaterialPriceBloc, MaterialPriceState>(
      'Fetch price failure',
      build: () => MaterialPriceBloc(repository: repository),
      seed: () => MaterialPriceState.initial().copyWith(
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToInfo: fakeShipToInfo,
        salesOrganisation: fakeSalesOrganisation,
        salesConfigs: fakeEmptySalesConfigs,
      ),
      setUp: () {
        when(
          () => repository.getMaterialPrice(
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
            salesOrganisation: fakeSalesOrganisation,
            salesConfigs: fakeEmptySalesConfigs,
            materialNumberList: fakeMaterialNumberQuery,
            comboDealEligible: false,
          ),
        ).thenAnswer(
          (_) async => const Left(ApiFailure.other('fake-error')),
        );
      },
      act: (MaterialPriceBloc bloc) => bloc.add(
        MaterialPriceEvent.fetch(
          materials: fakeMaterialQuery,
          comboDealEligible: false,
        ),
      ),
      expect: () => [
        MaterialPriceState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          salesOrganisation: fakeSalesOrganisation,
          salesConfigs: fakeEmptySalesConfigs,
          isFetching: true,
        ),
        MaterialPriceState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          salesOrganisation: fakeSalesOrganisation,
          salesConfigs: fakeEmptySalesConfigs,
        ),
      ],
    );
  });

  group('Material Price Bloc for cart product', () {
    blocTest<MaterialPriceBloc, MaterialPriceState>(
      'Fetch when all materials query already have their price',
      build: () => MaterialPriceBloc(repository: repository),
      seed: () => MaterialPriceState.initial().copyWith(
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToInfo: fakeShipToInfo,
        salesOrganisation: fakeSalesOrganisation,
        salesConfigs: fakeEmptySalesConfigs,
        materialPrice: {
          for (var number in fakeMaterialQuery)
            number.materialNumber: Price.empty().copyWith(
              rules: [PriceRule.empty()],
              tiers: [PriceTier.empty()],
              bonuses: [PriceBonus.empty()],
            ),
        },
      ),
      act: (MaterialPriceBloc bloc) => bloc.add(
        MaterialPriceEvent.fetchPriceCartProduct(
          products: fakeMaterialQuery,
          comboDealEligible: false,
        ),
      ),
      expect: () {
        return [
          MaterialPriceState.initial().copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
            salesOrganisation: fakeSalesOrganisation,
            salesConfigs: fakeEmptySalesConfigs,
            isFetching: true,
            materialPrice: {
              for (var number in fakeMaterialQuery)
                number.materialNumber: Price.empty().copyWith(
                  rules: [PriceRule.empty()],
                  tiers: [PriceTier.empty()],
                  bonuses: [PriceBonus.empty()],
                ),
            },
          ),
          MaterialPriceState.initial().copyWith(
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
            salesOrganisation: fakeSalesOrganisation,
            salesConfigs: fakeEmptySalesConfigs,
            materialPrice: {
              for (var number in fakeMaterialQuery)
                number.materialNumber: Price.empty().copyWith(
                  rules: [PriceRule.empty()],
                  tiers: [PriceTier.empty()],
                  bonuses: [PriceBonus.empty()],
                ),
            },
          )
        ];
      },
    );

    blocTest<MaterialPriceBloc, MaterialPriceState>(
      'Fetch when all materials is FOC',
      build: () => MaterialPriceBloc(repository: repository),
      act: (MaterialPriceBloc bloc) => bloc.add(
        MaterialPriceEvent.fetchPriceCartProduct(
          products: fakeFOCMaterialQuery,
          comboDealEligible: false,
        ),
      ),
      expect: () => [
        MaterialPriceState.initial().copyWith(
          isFetching: true,
        ),
        MaterialPriceState.initial().copyWith(
          isFetching: true,
          materialPrice: materialPrice,
        ),
        MaterialPriceState.initial().copyWith(
          materialPrice: materialPrice,
        ),
      ],
    );

    blocTest<MaterialPriceBloc, MaterialPriceState>(
      'Fetch price success',
      build: () => MaterialPriceBloc(repository: repository),
      seed: () => MaterialPriceState.initial().copyWith(
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToInfo: fakeShipToInfo,
        salesOrganisation: fakeSalesOrganisation,
        salesConfigs: fakeEmptySalesConfigs,
      ),
      setUp: () {
        when(
          () => repository.getMaterialPrice(
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
            salesOrganisation: fakeSalesOrganisation,
            salesConfigs: fakeEmptySalesConfigs,
            materialNumberList: fakeMaterialNumberQuery,
            comboDealEligible: false,
          ),
        ).thenAnswer(
          (_) async => Right(mockPriceMap),
        );
      },
      act: (MaterialPriceBloc bloc) => bloc.add(
        MaterialPriceEvent.fetchPriceCartProduct(
          products: fakeMaterialQuery,
          comboDealEligible: false,
        ),
      ),
      expect: () => [
        MaterialPriceState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          salesOrganisation: fakeSalesOrganisation,
          salesConfigs: fakeEmptySalesConfigs,
          isFetching: true,
        ),
        MaterialPriceState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          salesOrganisation: fakeSalesOrganisation,
          salesConfigs: fakeEmptySalesConfigs,
          materialPrice: mockPriceMap,
        ),
      ],
    );

    blocTest<MaterialPriceBloc, MaterialPriceState>(
      'Fetch price failure',
      build: () => MaterialPriceBloc(repository: repository),
      seed: () => MaterialPriceState.initial().copyWith(
        customerCodeInfo: fakeCustomerCodeInfo,
        shipToInfo: fakeShipToInfo,
        salesOrganisation: fakeSalesOrganisation,
        salesConfigs: fakeEmptySalesConfigs,
      ),
      setUp: () {
        when(
          () => repository.getMaterialPrice(
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
            salesOrganisation: fakeSalesOrganisation,
            salesConfigs: fakeEmptySalesConfigs,
            materialNumberList: fakeMaterialNumberQuery,
            comboDealEligible: false,
          ),
        ).thenAnswer(
          (_) async => const Left(ApiFailure.other('fake-error')),
        );
      },
      act: (MaterialPriceBloc bloc) => bloc.add(
        MaterialPriceEvent.fetchPriceCartProduct(
          products: fakeMaterialQuery,
          comboDealEligible: false,
        ),
      ),
      expect: () => [
        MaterialPriceState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          salesOrganisation: fakeSalesOrganisation,
          salesConfigs: fakeEmptySalesConfigs,
          isFetching: true,
        ),
      ],
    );
  });
}

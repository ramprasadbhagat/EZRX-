import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
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
  final MaterialPriceRepository repository = MaterialPriceRepositoryMock();

  late final Map<MaterialNumber, Price> mockPriceMap;

  final fakeSalesOrg = SalesOrganisation.empty().copyWith(
    salesOrg: SalesOrg('fake-name'),
  );
  final fakeCustomerCode = CustomerCodeInfo.empty().copyWith(
    customerCodeSoldTo: 'fake-code',
  );

  final fakeFOCMaterialQuery = [
    MaterialInfo.empty().copyWith(
        materialNumber: MaterialNumber('1'),
        materialGroup4: MaterialGroup.four('6A1')),
    MaterialInfo.empty().copyWith(
        materialNumber: MaterialNumber('2'),
        materialGroup4: MaterialGroup.four('6A1')),
  ];

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
            number.materialNumber: Price.empty().copyWith(
              rules: [PriceRule.empty()],
              tiers: [PriceTier.empty()],
              bonuses: [PriceBonus.empty()],
            ),
        },
      ),
      act: (MaterialPriceBloc bloc) => bloc.add(
        MaterialPriceEvent.fetch(
          customerCode: fakeCustomerCode,
          salesOrganisation: fakeSalesOrg,
          materials: fakeMaterialQuery,
        ),
      ),
      expect: () => [],
    );

    blocTest<MaterialPriceBloc, MaterialPriceState>(
      'Fetch when all materials is FOC',
      build: () => MaterialPriceBloc(repository: repository),
      act: (MaterialPriceBloc bloc) => bloc.add(
        MaterialPriceEvent.fetch(
          customerCode: fakeCustomerCode,
          salesOrganisation: fakeSalesOrg,
          materials: fakeFOCMaterialQuery,
        ),
      ),
      expect: () => [
        MaterialPriceState.initial().copyWith(materialPrice: {
          for (final material in fakeFOCMaterialQuery)
            material.materialNumber:
                Price.empty().copyWith(materialNumber: material.materialNumber)
        })
      ],
    );

    blocTest<MaterialPriceBloc, MaterialPriceState>(
      'Fetch price success',
      build: () => MaterialPriceBloc(repository: repository),
      setUp: () {
        when(
          () => repository.getMaterialPrice(
            customerCodeInfo: fakeCustomerCode,
            salesOrganisation: fakeSalesOrg,
            materialNumberList: fakeMaterialNumberQuery,
          ),
        ).thenAnswer(
          (_) async => Right(mockPriceMap),
        );
      },
      act: (MaterialPriceBloc bloc) => bloc.add(
        MaterialPriceEvent.fetch(
          customerCode: fakeCustomerCode,
          salesOrganisation: fakeSalesOrg,
          materials: fakeMaterialQuery,
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
            customerCodeInfo: fakeCustomerCode,
            salesOrganisation: fakeSalesOrg,
            materialNumberList: fakeMaterialNumberQuery,
          ),
        ).thenAnswer(
          (_) async => const Left(ApiFailure.other('fake-error')),
        );
      },
      act: (MaterialPriceBloc bloc) => bloc.add(
        MaterialPriceEvent.fetch(
          customerCode: fakeCustomerCode,
          salesOrganisation: fakeSalesOrg,
          materials: fakeMaterialQuery,
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

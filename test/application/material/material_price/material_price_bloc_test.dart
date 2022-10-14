import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/material/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/material/entities/price.dart';
import 'package:ezrxmobile/domain/material/entities/price_bonus.dart';
import 'package:ezrxmobile/domain/material/entities/price_rule.dart';
import 'package:ezrxmobile/domain/material/entities/price_tier.dart';
import 'package:ezrxmobile/domain/material/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/material/datasource/material_price_local.dart';
import 'package:ezrxmobile/infrastructure/material/repository/material_price_repository.dart';
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

  final fakeMaterialNumberQuery = [MaterialNumber('1'), MaterialNumber('2')];

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    final priceData = await MaterialPriceLocalDataSource().getPriceList();
    mockPriceMap = {
      for (var price in priceData)
        MaterialNumber(
          price.materialNumber,
        ): price,
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
          for (var number in fakeMaterialNumberQuery)
            number: Price.empty().copyWith(
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
          materialNumbers: fakeMaterialNumberQuery,
        ),
      ),
      expect: () => [],
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
          materialNumbers: fakeMaterialNumberQuery,
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
          materialNumbers: fakeMaterialNumberQuery,
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

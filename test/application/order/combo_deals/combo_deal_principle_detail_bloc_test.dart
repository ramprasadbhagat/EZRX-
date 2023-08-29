import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_principle_detail_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_tier_rule.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_price_detail.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/price_combo_deal.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/repository/material_list_repository.dart';
import 'package:ezrxmobile/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMaterialListRepository extends Mock
    implements MaterialListRepository {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late MaterialListRepository mockRepository;
  late Config config;
  final fakePriceComboDeal = PriceComboDeal.empty().copyWith(
    category: PriceComboDealCategory.empty().copyWith(
      type: ComboDealCategoryType('ZPRINC'),
    ),
  );
  final fakeComboDeal = ComboDeal.empty().copyWith(
    flexiTierRule: [
      ComboDealTierRule.empty().copyWith(
        minTotalAmount: 30,
        rate: -10,
      ),
      ComboDealTierRule.empty().copyWith(
        minTotalAmount: 50,
        rate: -20,
      ),
    ],
  );

  setUp(() async {
    mockRepository = MockMaterialListRepository();
    config = Config()..appFlavor = Flavor.mock;
  });

  PriceAggregate newPriceAggregate(String materialNumber) =>
      PriceAggregate.empty().copyWith(
        materialInfo: MaterialInfo.empty().copyWith(
          materialNumber: MaterialNumber(materialNumber),
        ),
      );

  blocTest<ComboDealPrincipleDetailBloc, ComboDealPrincipleDetailState>(
    'Init',
    build: () => ComboDealPrincipleDetailBloc(
      repository: mockRepository,
      config: config,
    ),
    act: (bloc) => bloc.add(
      const ComboDealPrincipleDetailEvent.initialize(),
    ),
    seed: () => ComboDealPrincipleDetailState.initial().copyWith(
      itemPageNumber: 10,
    ),
    expect: () => [
      ComboDealPrincipleDetailState.initial(),
    ],
  );

  blocTest<ComboDealPrincipleDetailBloc, ComboDealPrincipleDetailState>(
    'Init from cart',
    build: () => ComboDealPrincipleDetailBloc(
      repository: mockRepository,
      config: config,
    ),
    act: (bloc) => bloc.add(
      ComboDealPrincipleDetailEvent.initFromCart(
        items: [
          newPriceAggregate('fake-1'),
          newPriceAggregate('fake-2'),
        ],
      ),
    ),
    seed: () => ComboDealPrincipleDetailState.initial().copyWith(
      items: {
        MaterialNumber('fake-3'): newPriceAggregate('fake-3'),
      },
      selectedItems: {
        MaterialNumber('fake-3'): false,
      },
    ),
    expect: () => [
      ComboDealPrincipleDetailState.initial().copyWith(
        items: {
          MaterialNumber('fake-3'): newPriceAggregate('fake-3'),
          MaterialNumber('fake-1'): newPriceAggregate('fake-1'),
          MaterialNumber('fake-2'): newPriceAggregate('fake-2'),
        },
        selectedItems: {
          MaterialNumber('fake-3'): false,
          MaterialNumber('fake-1'): true,
          MaterialNumber('fake-2'): true,
        },
      ),
    ],
  );

  blocTest<ComboDealPrincipleDetailBloc, ComboDealPrincipleDetailState>(
    'Update quantity',
    build: () => ComboDealPrincipleDetailBloc(
      repository: mockRepository,
      config: config,
    ),
    act: (bloc) => bloc.add(
      ComboDealPrincipleDetailEvent.updateItemQuantity(
        item: MaterialNumber('fake-2'),
        qty: 3,
      ),
    ),
    seed: () => ComboDealPrincipleDetailState.initial().copyWith(
      items: {
        MaterialNumber('fake-1'): newPriceAggregate('fake-1'),
        MaterialNumber('fake-2'): newPriceAggregate('fake-2'),
      },
    ),
    expect: () => [
      ComboDealPrincipleDetailState.initial().copyWith(
        items: {
          MaterialNumber('fake-1'): newPriceAggregate('fake-1'),
          MaterialNumber('fake-2'): newPriceAggregate('fake-2').copyWith(
            quantity: 3,
          ),
        },
      ),
    ],
  );

  blocTest<ComboDealPrincipleDetailBloc, ComboDealPrincipleDetailState>(
    'Update selection',
    build: () => ComboDealPrincipleDetailBloc(
      repository: mockRepository,
      config: config,
    ),
    act: (bloc) => bloc.add(
      ComboDealPrincipleDetailEvent.updateItemSelection(
        item: MaterialNumber('fake-2'),
      ),
    ),
    seed: () => ComboDealPrincipleDetailState.initial().copyWith(
      selectedItems: {
        MaterialNumber('fake-1'): false,
        MaterialNumber('fake-2'): true,
      },
    ),
    expect: () => [
      ComboDealPrincipleDetailState.initial().copyWith(
        selectedItems: {
          MaterialNumber('fake-1'): false,
          MaterialNumber('fake-2'): false,
        },
      ),
    ],
  );

  blocTest<ComboDealPrincipleDetailBloc, ComboDealPrincipleDetailState>(
    'Set combo deal info',
    build: () => ComboDealPrincipleDetailBloc(
      repository: mockRepository,
      config: config,
    ),
    act: (bloc) => bloc.add(
      ComboDealPrincipleDetailEvent.setComboDealInfo(
        comboDealInfo: fakeComboDeal,
      ),
    ),
    seed: () => ComboDealPrincipleDetailState.initial().copyWith(
      items: {
        MaterialNumber('fake-1'): newPriceAggregate('fake-1'),
        MaterialNumber('fake-2'): newPriceAggregate('fake-2').copyWith(
          quantity: 3,
        ),
      },
    ),
    expect: () => [
      ComboDealPrincipleDetailState.initial().copyWith(
        items: {
          MaterialNumber('fake-1'): newPriceAggregate('fake-1').copyWith(
            comboDeal: fakeComboDeal,
          ),
          MaterialNumber('fake-2'): newPriceAggregate('fake-2').copyWith(
            comboDeal: fakeComboDeal,
            quantity: 3,
          ),
        },
      ),
    ],
  );

  blocTest<ComboDealPrincipleDetailBloc, ComboDealPrincipleDetailState>(
    'Set price info',
    build: () => ComboDealPrincipleDetailBloc(
      repository: mockRepository,
      config: config,
    ),
    act: (bloc) => bloc.add(
      ComboDealPrincipleDetailEvent.setPriceInfo(
        priceMap: {
          MaterialNumber('fake-1'): MaterialPriceDetail.empty().copyWith(
            price: Price.empty().copyWith(
              finalPrice: MaterialPrice(10),
            ),
          ),
        },
        comboDeal: fakePriceComboDeal,
      ),
    ),
    seed: () => ComboDealPrincipleDetailState.initial().copyWith(
      items: {
        MaterialNumber('fake-1'): newPriceAggregate('fake-1'),
        MaterialNumber('fake-2'): newPriceAggregate('fake-2'),
      },
    ),
    expect: () => [
      ComboDealPrincipleDetailState.initial().copyWith(
        items: {
          MaterialNumber('fake-1'): newPriceAggregate('fake-1').copyWith(
            price: Price.empty().copyWith(
              finalPrice: MaterialPrice(10),
              comboDeal: fakePriceComboDeal,
            ),
            materialInfo: MaterialInfo.empty(),
          ),
          MaterialNumber('fake-2'): newPriceAggregate('fake-2').copyWith(
            price: Price.empty().copyWith(
              materialNumber: MaterialNumber('fake-2'),
              comboDeal: fakePriceComboDeal,
            ),
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('fake-2'),
            ),
          ),
        },
      ),
    ],
  );

  blocTest<ComboDealPrincipleDetailBloc, ComboDealPrincipleDetailState>(
    'Fetch success',
    build: () => ComboDealPrincipleDetailBloc(
      repository: mockRepository,
      config: config,
    ),
    setUp: () {
      when(
        () => mockRepository.getComboDealMaterials(
          user: User.empty(),
          salesOrganisation: SalesOrganisation.empty(),
          customerCodeInfo: CustomerCodeInfo.empty(),
          shipToInfo: ShipToInfo.empty(),
          pageSize: config.pageSize,
          offset: 0,
          principles: ['fake-principle'],
        ),
      ).thenAnswer(
        (invocation) async => Right(
          [
            MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('fake-3'),
            ),
          ],
        ),
      );
    },
    act: (bloc) => bloc.add(
      ComboDealPrincipleDetailEvent.fetch(
        customerCodeInfo: CustomerCodeInfo.empty(),
        salesConfigs: SalesOrganisationConfigs.empty(),
        salesOrganisation: SalesOrganisation.empty(),
        shipToInfo: ShipToInfo.empty(),
        user: User.empty(),
        fetchFromCart: false,
        principles: ['fake-principle'],
      ),
    ),
    seed: () => ComboDealPrincipleDetailState.initial().copyWith(
      items: {
        MaterialNumber('fake-1'): newPriceAggregate('fake-1'),
        MaterialNumber('fake-2'): newPriceAggregate('fake-2'),
      },
    ),
    expect: () => [
      ComboDealPrincipleDetailState.initial().copyWith(
        items: {
          MaterialNumber('fake-1'): newPriceAggregate('fake-1'),
          MaterialNumber('fake-2'): newPriceAggregate('fake-2'),
        },
        isFetchingMaterials: true,
      ),
      ComboDealPrincipleDetailState.initial().copyWith(
        items: {
          MaterialNumber('fake-3'): newPriceAggregate('fake-3'),
        },
        isFetchingMaterials: false,
        isFetchingPrice: true,
        isFetchingComboInfo: true,
        canLoadMore: false,
        itemPageNumber: 1,
      ),
    ],
  );

  blocTest<ComboDealPrincipleDetailBloc, ComboDealPrincipleDetailState>(
    'Fetch failure',
    build: () => ComboDealPrincipleDetailBloc(
      repository: mockRepository,
      config: config,
    ),
    setUp: () {
      when(
        () => mockRepository.getComboDealMaterials(
          user: User.empty(),
          salesOrganisation: SalesOrganisation.empty(),
          customerCodeInfo: CustomerCodeInfo.empty(),
          shipToInfo: ShipToInfo.empty(),
          pageSize: config.pageSize,
          offset: 0,
          principles: ['fake-principle'],
        ),
      ).thenAnswer(
        (invocation) async => const Left(ApiFailure.other('fake-message')),
      );
    },
    act: (bloc) => bloc.add(
      ComboDealPrincipleDetailEvent.fetch(
        customerCodeInfo: CustomerCodeInfo.empty(),
        salesConfigs: SalesOrganisationConfigs.empty(),
        salesOrganisation: SalesOrganisation.empty(),
        shipToInfo: ShipToInfo.empty(),
        user: User.empty(),
        fetchFromCart: false,
        principles: ['fake-principle'],
      ),
    ),
    seed: () => ComboDealPrincipleDetailState.initial().copyWith(
      items: {
        MaterialNumber('fake-1'): newPriceAggregate('fake-1'),
        MaterialNumber('fake-2'): newPriceAggregate('fake-2'),
      },
    ),
    expect: () => [
      ComboDealPrincipleDetailState.initial().copyWith(
        items: {
          MaterialNumber('fake-1'): newPriceAggregate('fake-1'),
          MaterialNumber('fake-2'): newPriceAggregate('fake-2'),
        },
        isFetchingMaterials: true,
      ),
      ComboDealPrincipleDetailState.initial().copyWith(
        items: {
          MaterialNumber('fake-1'): newPriceAggregate('fake-1'),
          MaterialNumber('fake-2'): newPriceAggregate('fake-2'),
        },
        isFetchingMaterials: false,
        apiFailureOrSuccessOption: optionOf(
          const Left(
            ApiFailure.other('fake-message'),
          ),
        ),
      ),
    ],
  );

  blocTest<ComboDealPrincipleDetailBloc, ComboDealPrincipleDetailState>(
    'Fetch success when init from cart',
    build: () => ComboDealPrincipleDetailBloc(
      repository: mockRepository,
      config: config,
    ),
    setUp: () {
      when(
        () => mockRepository.getComboDealMaterials(
          user: User.empty(),
          salesOrganisation: SalesOrganisation.empty(),
          customerCodeInfo: CustomerCodeInfo.empty(),
          shipToInfo: ShipToInfo.empty(),
          pageSize: config.pageSize,
          offset: 0,
          principles: ['fake-principle'],
        ),
      ).thenAnswer(
        (invocation) async => Right(
          [
            MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('fake-3'),
            ),
            MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('fake-2'),
            ),
          ],
        ),
      );
    },
    act: (bloc) => bloc.add(
      ComboDealPrincipleDetailEvent.fetch(
        customerCodeInfo: CustomerCodeInfo.empty(),
        salesConfigs: SalesOrganisationConfigs.empty(),
        salesOrganisation: SalesOrganisation.empty(),
        shipToInfo: ShipToInfo.empty(),
        user: User.empty(),
        fetchFromCart: true,
        principles: ['fake-principle'],
      ),
    ),
    seed: () => ComboDealPrincipleDetailState.initial().copyWith(
      items: {
        MaterialNumber('fake-1'): newPriceAggregate('fake-1'),
        MaterialNumber('fake-2'): newPriceAggregate('fake-2'),
      },
    ),
    expect: () => [
      ComboDealPrincipleDetailState.initial().copyWith(
        items: {
          MaterialNumber('fake-1'): newPriceAggregate('fake-1'),
          MaterialNumber('fake-2'): newPriceAggregate('fake-2'),
        },
        isFetchingMaterials: true,
      ),
      ComboDealPrincipleDetailState.initial().copyWith(
        items: {
          MaterialNumber('fake-1'): newPriceAggregate('fake-1'),
          MaterialNumber('fake-2'): newPriceAggregate('fake-2'),
          MaterialNumber('fake-3'): newPriceAggregate('fake-3'),
        },
        isFetchingMaterials: false,
        isFetchingPrice: true,
        isFetchingComboInfo: true,
        canLoadMore: false,
        itemPageNumber: 1,
      ),
    ],
  );

  blocTest<ComboDealPrincipleDetailBloc, ComboDealPrincipleDetailState>(
    'Prevent loadmore when can not loadmore',
    build: () => ComboDealPrincipleDetailBloc(
      repository: mockRepository,
      config: config,
    ),
    act: (bloc) => bloc.add(
      ComboDealPrincipleDetailEvent.loadMore(
        customerCodeInfo: CustomerCodeInfo.empty(),
        salesConfigs: SalesOrganisationConfigs.empty(),
        salesOrganisation: SalesOrganisation.empty(),
        shipToInfo: ShipToInfo.empty(),
        user: User.empty(),
        principles: ['fake-principle'],
      ),
    ),
    seed: () => ComboDealPrincipleDetailState.initial().copyWith(
      canLoadMore: false,
    ),
    expect: () => [],
  );

  blocTest<ComboDealPrincipleDetailBloc, ComboDealPrincipleDetailState>(
    'Prevent loadmore when fetching',
    build: () => ComboDealPrincipleDetailBloc(
      repository: mockRepository,
      config: config,
    ),
    act: (bloc) => bloc.add(
      ComboDealPrincipleDetailEvent.loadMore(
        customerCodeInfo: CustomerCodeInfo.empty(),
        salesConfigs: SalesOrganisationConfigs.empty(),
        salesOrganisation: SalesOrganisation.empty(),
        shipToInfo: ShipToInfo.empty(),
        user: User.empty(),
        principles: ['fake-principle'],
      ),
    ),
    seed: () => ComboDealPrincipleDetailState.initial().copyWith(
      isFetchingMaterials: true,
    ),
    expect: () => [],
  );

  blocTest<ComboDealPrincipleDetailBloc, ComboDealPrincipleDetailState>(
    'Loadmore success',
    build: () => ComboDealPrincipleDetailBloc(
      repository: mockRepository,
      config: config,
    ),
    setUp: () {
      when(
        () => mockRepository.getComboDealMaterials(
          user: User.empty(),
          salesOrganisation: SalesOrganisation.empty(),
          customerCodeInfo: CustomerCodeInfo.empty(),
          shipToInfo: ShipToInfo.empty(),
          pageSize: config.pageSize,
          offset: config.pageSize,
          principles: ['fake-principle'],
        ),
      ).thenAnswer(
        (invocation) async => Right(
          [
            MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('fake-3'),
            ),
            MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('fake-2'),
            ),
          ],
        ),
      );
    },
    act: (bloc) => bloc.add(
      ComboDealPrincipleDetailEvent.loadMore(
        customerCodeInfo: CustomerCodeInfo.empty(),
        salesConfigs: SalesOrganisationConfigs.empty(),
        salesOrganisation: SalesOrganisation.empty(),
        shipToInfo: ShipToInfo.empty(),
        user: User.empty(),
        principles: ['fake-principle'],
      ),
    ),
    seed: () => ComboDealPrincipleDetailState.initial().copyWith(
      items: {
        MaterialNumber('fake-1'): newPriceAggregate('fake-1'),
        MaterialNumber('fake-2'): newPriceAggregate('fake-2'),
      },
      canLoadMore: true,
      itemPageNumber: 1,
    ),
    expect: () => [
      ComboDealPrincipleDetailState.initial().copyWith(
        items: {
          MaterialNumber('fake-1'): newPriceAggregate('fake-1'),
          MaterialNumber('fake-2'): newPriceAggregate('fake-2'),
        },
        isFetchingMaterials: true,
        itemPageNumber: 1,
        canLoadMore: true,
      ),
      ComboDealPrincipleDetailState.initial().copyWith(
        items: {
          MaterialNumber('fake-1'): newPriceAggregate('fake-1'),
          MaterialNumber('fake-2'): newPriceAggregate('fake-2'),
          MaterialNumber('fake-3'): newPriceAggregate('fake-3'),
        },
        isFetchingMaterials: false,
        isFetchingPrice: true,
        isFetchingComboInfo: true,
        canLoadMore: false,
        itemPageNumber: 2,
      ),
    ],
  );

  blocTest<ComboDealPrincipleDetailBloc, ComboDealPrincipleDetailState>(
    'Loadmore failure',
    build: () => ComboDealPrincipleDetailBloc(
      repository: mockRepository,
      config: config,
    ),
    setUp: () {
      when(
        () => mockRepository.getComboDealMaterials(
          user: User.empty(),
          salesOrganisation: SalesOrganisation.empty(),
          customerCodeInfo: CustomerCodeInfo.empty(),
          shipToInfo: ShipToInfo.empty(),
          pageSize: config.pageSize,
          offset: config.pageSize,
          principles: ['fake-principle'],
        ),
      ).thenAnswer(
        (invocation) async => const Left(ApiFailure.other('fake-message')),
      );
    },
    act: (bloc) => bloc.add(
      ComboDealPrincipleDetailEvent.loadMore(
        customerCodeInfo: CustomerCodeInfo.empty(),
        salesConfigs: SalesOrganisationConfigs.empty(),
        salesOrganisation: SalesOrganisation.empty(),
        shipToInfo: ShipToInfo.empty(),
        user: User.empty(),
        principles: ['fake-principle'],
      ),
    ),
    seed: () => ComboDealPrincipleDetailState.initial().copyWith(
      canLoadMore: true,
      itemPageNumber: 1,
    ),
    expect: () => [
      ComboDealPrincipleDetailState.initial().copyWith(
        canLoadMore: true,
        itemPageNumber: 1,
        isFetchingMaterials: true,
      ),
      ComboDealPrincipleDetailState.initial().copyWith(
        canLoadMore: true,
        itemPageNumber: 1,
        isFetchingMaterials: false,
        apiFailureOrSuccessOption: optionOf(
          const Left(
            ApiFailure.other('fake-message'),
          ),
        ),
      ),
    ],
  );

  test(
    'ComboDealPrincipleDetailState getter',
    () {
      expect(
        ComboDealPrincipleDetailState.initial()
            .copyWith(isFetchingMaterials: true)
            .isFetching,
        true,
      );

      expect(
        ComboDealPrincipleDetailState.initial()
            .copyWith(isFetchingMaterials: true)
            .isEnableAddToCart,
        false,
      );

      expect(
        ComboDealPrincipleDetailState.initial().copyWith(
          isFetchingMaterials: false,
          isFetchingComboInfo: false,
          isFetchingPrice: false,
          selectedItems: {
            MaterialNumber('fake-1'): true,
          },
          items: {
            MaterialNumber('fake-1'): newPriceAggregate('fake-1'),
          },
        ).isEnableAddToCart,
        true,
      );

      expect(
        ComboDealPrincipleDetailState.initial().copyWith(
          items: {
            MaterialNumber('fake-1'): newPriceAggregate('fake-1').copyWith(
              comboDeal: fakeComboDeal,
            ),
          },
        ).currentDeal,
        fakeComboDeal,
      );

      expect(
        ComboDealPrincipleDetailState.initial().copyWith(
          selectedItems: {
            MaterialNumber('fake-1'): true,
            MaterialNumber('fake-2'): false,
          },
          items: {
            MaterialNumber('fake-1'): newPriceAggregate('fake-1'),
            MaterialNumber('fake-2'): newPriceAggregate('fake-2'),
            MaterialNumber('fake-3'): newPriceAggregate('fake-3'),
          },
        ).allSelectedItems,
        [newPriceAggregate('fake-1')],
      );
    },
  );
}

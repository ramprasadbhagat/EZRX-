import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/infrastructure/order/repository/stock_info_repository.dart';
import 'package:flutter/material.dart';
import 'package:ezrxmobile/config.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/combo_deal_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/material_list_repository.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/order/repository/product_details_repository.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_material_detail_bloc.dart';

import '../../../common_mock_data/user_mock.dart';
import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_kh_sales_org_config.dart';

class ProductDetailRepositoryMock extends Mock
    implements ProductDetailRepository {}

class ConfigMock extends Mock implements Config {}

class MaterialListRepositoryMock extends Mock
    implements MaterialListRepository {}

class StockInfoRepositoryMock extends Mock implements StockInfoRepository {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late ProductDetailRepository productDetailRepository;
  late MaterialListRepository materialListRepository;
  late Config config;
  late List<PriceAggregate> productList;
  late ComboDealMaterialDetailEvent initialEvent;
  late ComboDealMaterialDetailState initialState;
  late Map<MaterialNumber, PriceAggregate> items;
  late Map<MaterialNumber, PriceAggregate> itemsAfterGetMaterials;
  late Map<MaterialNumber, bool> selectedItems;
  late ComboDeal comboDeal;
  late Map<MaterialNumber, bool> selectionStatus;
  late List<MaterialStockInfo> materialStockInfos;
  late MaterialResponse materialResponse;
  late StockInfoRepository stockInfoRepositoryMock;
  setUpAll(() async {
    productDetailRepository = ProductDetailRepositoryMock();
    materialListRepository = MaterialListRepositoryMock();
    stockInfoRepositoryMock = StockInfoRepositoryMock();
    config = ConfigMock();
    productList = (await CartLocalDataSource().getAddedToCartProductList())
        .cartProducts
        .where(
          (e) =>
              e.materialInfo.type.typeMaterial && !e.materialInfo.isMarketPlace,
        )
        .toList();
    initialEvent = ComboDealMaterialDetailEvent.initialize(
      salesOrganisation: fakeKHSalesOrganisation,
      customerCodeInfo: fakeCustomerCodeInfo,
      shipToInfo: fakeShipToInfo,
      salesConfigs: fakeKHSalesOrgConfigs,
      user: fakeClientUser,
    );
    initialState = ComboDealMaterialDetailState.initial().copyWith(
      salesOrganisation: fakeKHSalesOrganisation,
      customerCodeInfo: fakeCustomerCodeInfo,
      shipToInfo: fakeShipToInfo,
    );
    comboDeal = (await ComboDealLocalDataSource().getComboDealList()).first;
    materialStockInfos =
        await StockInfoLocalDataSource().getMaterialStockInfoList();

    for (var i = 0; i <= 2; i++) {
      productList[i] = productList[i].copyWith(
        materialInfo: productList[i]
            .materialInfo
            .copyWith(materialNumber: comboDeal.allMaterialNumbers[i]),
      );
      materialStockInfos[i] = materialStockInfos[i].copyWith(
        materialNumber: productList[i].getMaterialNumber,
      );
    }
    materialResponse = await MaterialListLocalDataSource().getProductList();
  });
  group('Combo deal material detail bloc test', () {
    blocTest(
      'combo deal material bloc initialState',
      build: () => ComboDealMaterialDetailBloc(
        productDetailRepository: productDetailRepository,
        materialListRepository: materialListRepository,
        config: config,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      act: (ComboDealMaterialDetailBloc bloc) => bloc.add(initialEvent),
      expect: () => [initialState],
    );
    blocTest(
      'combo deal material bloc initFromCartComboDealItems',
      setUp: () {
        productList.first = productList.first.copyWith(comboDeal: comboDeal);
        items = {
          for (final item in productList)
            item.getMaterialNumber: item.copyWith(
              salesOrgConfig: fakeKHSalesOrgConfigs,
            ),
        };
        selectedItems = {
          for (final item in productList) item.getMaterialNumber: true,
        };
        final missingComboItemMaterialNumbers = comboDeal.allMaterialNumbers
            .where(
              (materialNumber) =>
                  !productList.materialNumbers.contains(materialNumber),
            )
            .toList();
        items.addAll(
          {
            for (final materialNumber in missingComboItemMaterialNumbers)
              materialNumber: PriceAggregate.empty()
                  .copyWith(
                    salesOrgConfig: fakeKHSalesOrgConfigs,
                    materialInfo: MaterialInfo.empty().copyWith(
                      materialNumber: materialNumber,
                    ),
                  )
                  .copyWithComboDealMinQty(comboDeal),
          },
        );
        selectedItems.addAll(
          {
            for (final materialNumber in missingComboItemMaterialNumbers)
              materialNumber: false,
          },
        );
      },
      build: () => ComboDealMaterialDetailBloc(
        productDetailRepository: productDetailRepository,
        materialListRepository: materialListRepository,
        config: config,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      seed: () => initialState,
      act: (ComboDealMaterialDetailBloc bloc) => bloc.add(
        ComboDealMaterialDetailEvent.initFromCartComboDealItems(
          items: productList,
          salesConfigs: fakeKHSalesOrgConfigs,
        ),
      ),
      expect: () => [
        initialState.copyWith(
          items: items,
          selectedItems: selectedItems,
          isFetchingPrice: true,
        ),
      ],
    );

    blocTest(
      'combo deal material bloc updateItemQuantity',
      setUp: () {
        items = {
          for (final item in productList)
            item.getMaterialNumber: item.copyWith(
              salesOrgConfig: fakeKHSalesOrgConfigs,
            ),
        };
        items[productList.first.getMaterialNumber] =
            items[productList.first.getMaterialNumber]!.copyWith(quantity: 25);
      },
      build: () => ComboDealMaterialDetailBloc(
        productDetailRepository: productDetailRepository,
        materialListRepository: materialListRepository,
        config: config,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      seed: () => initialState.copyWith(
        items: {
          for (final item in productList)
            item.getMaterialNumber: item.copyWith(
              salesOrgConfig: fakeKHSalesOrgConfigs,
            ),
        },
      ),
      act: (ComboDealMaterialDetailBloc bloc) => bloc.add(
        ComboDealMaterialDetailEvent.updateItemQuantity(
          item: productList.first.getMaterialNumber,
          qty: 25,
        ),
      ),
      expect: () => [
        initialState.copyWith(
          items: items,
        ),
      ],
    );
    blocTest(
      'combo deal material bloc updateItemQuantity with zero qty',
      setUp: () {
        items = {
          for (final item in productList)
            item.getMaterialNumber: item.copyWith(
              salesOrgConfig: fakeKHSalesOrgConfigs,
            ),
        };
        items[productList.first.getMaterialNumber] =
            items[productList.first.getMaterialNumber]!.copyWith(quantity: 24);
      },
      build: () => ComboDealMaterialDetailBloc(
        productDetailRepository: productDetailRepository,
        materialListRepository: materialListRepository,
        config: config,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      seed: () => initialState.copyWith(
        items: {
          for (final item in productList)
            item.getMaterialNumber: item.copyWith(
              salesOrgConfig: fakeKHSalesOrgConfigs,
            ),
        },
      ),
      act: (ComboDealMaterialDetailBloc bloc) => bloc.add(
        ComboDealMaterialDetailEvent.updateItemQuantity(
          item: productList.first.getMaterialNumber,
          qty: 0,
        ),
      ),
      expect: () => [
        initialState.copyWith(
          items: items,
        ),
      ],
    );
    blocTest(
      'combo deal material bloc updateItemSelection',
      setUp: () {
        items = {
          for (final item in productList)
            item.getMaterialNumber: item.copyWith(
              salesOrgConfig: fakeKHSalesOrgConfigs,
            ),
        };
        selectionStatus = {
          for (final item in productList) item.getMaterialNumber: true,
        };
      },
      build: () => ComboDealMaterialDetailBloc(
        productDetailRepository: productDetailRepository,
        materialListRepository: materialListRepository,
        config: config,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      seed: () => initialState.copyWith(
        items: items,
        selectedItems: {
          for (final item in productList) item.getMaterialNumber: true,
        },
      ),
      act: (ComboDealMaterialDetailBloc bloc) => bloc.add(
        ComboDealMaterialDetailEvent.updateItemSelection(
          item: productList.first.getMaterialNumber,
        ),
      ),
      expect: () => [
        initialState.copyWith(
          items: items,
          selectedItems: selectionStatus,
          apiFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other(
                'All items in this combo are mandatory.',
              ),
            ),
          ),
        ),
      ],
    );
    blocTest(
      'combo deal material bloc loadMoreComboDealPrincipal',
      setUp: () {
        when(() => config.pageSize).thenAnswer((invocation) => 1);
        items = comboDeal.allMaterialNumbers.fold(
          <MaterialNumber, PriceAggregate>{},
          (
            Map<MaterialNumber, PriceAggregate> map,
            MaterialNumber materialNumber,
          ) {
            map[materialNumber] = PriceAggregate.empty()
                .copyWith(salesOrgConfig: fakeKHSalesOrgConfigs);

            return map;
          },
        );
        when(
          () => materialListRepository.getComboDealMaterials(
            user: fakeClientUser,
            salesOrganisation: fakeKHSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
            pageSize: 1,
            offset: 0,
            principles: [
              productList.first.materialInfo.principalData.principalCode
                  .getOrDefaultValue(''),
            ],
            salesOrgConfig: fakeKHSalesOrgConfigs,
          ),
        ).thenAnswer(
          (_) async => Right(
            materialResponse,
          ),
        );
        final newItems = materialResponse.products
            .map(
              (material) => PriceAggregate.empty().copyWith(
                materialInfo: material,
                salesOrgConfig: fakeKHSalesOrgConfigs,
                comboDeal: comboDeal,
              ),
            )
            .toList()
            .mapByMaterialNumber;

        itemsAfterGetMaterials =
            Map<MaterialNumber, PriceAggregate>.from(items);

        selectedItems = Map<MaterialNumber, bool>.from({});

        for (final item in newItems.values) {
          if (!itemsAfterGetMaterials.containsKey(item.getMaterialNumber)) {
            itemsAfterGetMaterials.putIfAbsent(
              item.getMaterialNumber,
              () => item,
            );
            selectedItems.putIfAbsent(
              item.getMaterialNumber,
              () => item.selfComboDeal.mandatory,
            );
          }
        }

        when(
          () => stockInfoRepositoryMock.getStockInfoList(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeKHSalesOrganisation,
            materials: newItems.entries
                .map((e) => e.value.materialInfo)
                .toList()
                .map((e) => e.materialNumber)
                .toList(),
            shipToInfo: fakeShipToInfo,
          ),
        ).thenAnswer(
          (_) async => Right(
            materialStockInfos,
          ),
        );
        if (materialStockInfos.isNotEmpty) {
          for (final materialStockInfo in materialStockInfos) {
            final material =
                itemsAfterGetMaterials[materialStockInfo.materialNumber];

            if (material != null && materialStockInfo.stockInfos.isNotEmpty) {
              itemsAfterGetMaterials[materialStockInfo.materialNumber] =
                  material.copyWith(
                stockInfo: materialStockInfo.stockInfos.first,
                stockInfoList: materialStockInfo.stockInfos,
              );
            }
          }
        }
      },
      build: () => ComboDealMaterialDetailBloc(
        productDetailRepository: productDetailRepository,
        materialListRepository: materialListRepository,
        config: config,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      seed: () => initialState.copyWith(
        items: items,
        canLoadMore: true,
        user: fakeClientUser,
        salesConfigs: fakeKHSalesOrgConfigs,
      ),
      act: (ComboDealMaterialDetailBloc bloc) => bloc.add(
        ComboDealMaterialDetailEvent.loadMoreComboDealPrincipal(
          comboDeal: comboDeal,
          principles: [
            productList.first.materialInfo.principalData.principalCode
                .getOrDefaultValue(''),
          ],
        ),
      ),
      skip: 1,
      expect: () => [
        initialState.copyWith(
          items: itemsAfterGetMaterials,
          selectedItems: selectedItems,
          user: fakeClientUser,
          salesConfigs: fakeKHSalesOrgConfigs,
          nextPageIndex: 1,
          materialCount: 0,
        ),
      ],
    );
    blocTest(
      'combo deal material bloc clearSearch',
      build: () => ComboDealMaterialDetailBloc(
        productDetailRepository: productDetailRepository,
        materialListRepository: materialListRepository,
        config: config,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      seed: () => initialState.copyWith(searchKey: SearchKey.search('dummy')),
      act: (ComboDealMaterialDetailBloc bloc) => bloc.add(
        const ComboDealMaterialDetailEvent.clearSearch(),
      ),
      expect: () => [
        initialState.copyWith(
          searchKey: SearchKey.empty(),
        ),
      ],
    );
    blocTest(
      'combo deal material bloc search',
      setUp: () {},
      build: () => ComboDealMaterialDetailBloc(
        productDetailRepository: productDetailRepository,
        materialListRepository: materialListRepository,
        config: config,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      seed: () => initialState,
      act: (ComboDealMaterialDetailBloc bloc) => bloc.add(
        ComboDealMaterialDetailEvent.search(
          searchKey: SearchKey.search('dummy'),
        ),
      ),
      expect: () => [
        initialState.copyWith(
          searchKey: SearchKey.search('dummy'),
        ),
      ],
    );
    blocTest(
      'combo deal material bloc cartContainsCurrentCombo',
      setUp: () {},
      build: () => ComboDealMaterialDetailBloc(
        productDetailRepository: productDetailRepository,
        materialListRepository: materialListRepository,
        config: config,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      seed: () => initialState,
      act: (ComboDealMaterialDetailBloc bloc) => bloc.add(
        const ComboDealMaterialDetailEvent.cartContainsCurrentCombo(
          contain: true,
        ),
      ),
      expect: () => [
        initialState.copyWith(
          isUpdateCart: true,
        ),
      ],
    );
    blocTest(
      'combo deal material bloc loadMoreComboDealPrincipal',
      setUp: () {
        when(() => config.pageSize).thenAnswer((invocation) => 1);
        items = comboDeal.allMaterialNumbers.fold(
          <MaterialNumber, PriceAggregate>{},
          (
            Map<MaterialNumber, PriceAggregate> map,
            MaterialNumber materialNumber,
          ) {
            map[materialNumber] = PriceAggregate.empty()
                .copyWith(salesOrgConfig: fakeKHSalesOrgConfigs);

            return map;
          },
        );
        when(
          () => materialListRepository.getComboDealMaterials(
            user: fakeClientUser,
            salesOrganisation: fakeKHSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
            pageSize: 1,
            offset: 0,
            principles: [
              productList.first.materialInfo.principalData.principalCode
                  .getOrDefaultValue(''),
            ],
            salesOrgConfig: fakeKHSalesOrgConfigs,
          ),
        ).thenAnswer(
          (_) async => const Left(
            ApiFailure.other('fake-error'),
          ),
        );
      },
      build: () => ComboDealMaterialDetailBloc(
        productDetailRepository: productDetailRepository,
        materialListRepository: materialListRepository,
        config: config,
        stockInfoRepository: stockInfoRepositoryMock,
      ),
      seed: () => initialState.copyWith(
        items: items,
        canLoadMore: true,
        user: fakeClientUser,
        salesConfigs: fakeKHSalesOrgConfigs,
      ),
      act: (ComboDealMaterialDetailBloc bloc) => bloc.add(
        ComboDealMaterialDetailEvent.loadMoreComboDealPrincipal(
          comboDeal: comboDeal,
          principles: [
            productList.first.materialInfo.principalData.principalCode
                .getOrDefaultValue(''),
          ],
        ),
      ),
      skip: 1,
      expect: () => [
        initialState.copyWith(
          apiFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
          isLoadMore: false,
          items: items,
          user: fakeClientUser,
          salesConfigs: fakeKHSalesOrgConfigs,
        ),
      ],
    );
  });

  blocTest(
    'combo deal material bloc clear selected items',
    setUp: () {
      items = {
        for (final item in productList)
          item.getMaterialNumber: item.copyWith(
            salesOrgConfig: fakeKHSalesOrgConfigs,
            comboDeal: comboDeal,
          ),
      };
      selectionStatus = {
        for (final item in productList)
          item.getMaterialNumber: comboDeal
              .singleDeal(materialNumber: item.getMaterialNumber)
              .mandatory,
      };
    },
    build: () => ComboDealMaterialDetailBloc(
      productDetailRepository: productDetailRepository,
      materialListRepository: materialListRepository,
      config: config,
      stockInfoRepository: stockInfoRepositoryMock,
    ),
    seed: () => initialState.copyWith(
      items: items,
    ),
    act: (ComboDealMaterialDetailBloc bloc) => bloc.add(
      const ComboDealMaterialDetailEvent.clearSelectedItem(),
    ),
    expect: () => [
      initialState.copyWith(
        items: {
          for (final item in productList)
            item.getMaterialNumber: item.copyWith(
              salesOrgConfig: fakeKHSalesOrgConfigs,
              comboDeal: comboDeal,
            ),
        },
        selectedItems: selectionStatus,
      ),
    ],
  );
}

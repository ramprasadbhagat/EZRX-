import 'package:dartz/dartz.dart';
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
import 'package:ezrxmobile/domain/order/entities/material_price_detail.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/combo_deal_local.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_list_local.dart';
import 'package:ezrxmobile/infrastructure/order/repository/material_list_repository.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/order/repository/product_details_repository.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_price_detail_local.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_material_detail_bloc.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';

class ProductDetailRepositoryMock extends Mock
    implements ProductDetailRepository {}

class ConfigMock extends Mock implements Config {}

class MaterialListRepositoryMock extends Mock
    implements MaterialListRepository {}

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
  late List<MaterialPriceDetail> materialPrices;
  late Map<MaterialNumber, bool> selectionStatus;
  late Map<MaterialNumber, int> qty;
  late List<MaterialInfo> materialInfos;
  late List<MaterialStockInfo> materialStockInfos;
  late MaterialResponse materialResponse;
  setUpAll(() async {
    productDetailRepository = ProductDetailRepositoryMock();
    materialListRepository = MaterialListRepositoryMock();
    config = ConfigMock();
    productList = await CartLocalDataSource().getAddedToCartProductList();
    initialEvent = ComboDealMaterialDetailEvent.initialize(
      salesOrganisation: fakeSalesOrganisation,
      customerCodeInfo: fakeCustomerCodeInfo,
      shipToInfo: fakeShipToInfo,
      salesConfigs: fakeSalesOrganisationConfigs,
      user: fakeClientUser,
    );
    initialState = ComboDealMaterialDetailState.initial().copyWith(
      salesOrganisation: fakeSalesOrganisation,
      customerCodeInfo: fakeCustomerCodeInfo,
      shipToInfo: fakeShipToInfo,
    );
    comboDeal = (await ComboDealLocalDataSource().getComboDealList()).first;

    materialPrices =
        (await MaterialPriceDetailLocalDataSource().getMaterialDetailList())
            .take(3)
            .toList();
    materialInfos = await MaterialListLocalDataSource().getMaterialList();
    materialStockInfos =
        await StockInfoLocalDataSource().getMaterialStockInfoList();
    for (var i = 0; i < 2; i++) {
      productList[i] = productList[i].copyWith(
        materialInfo: productList[i]
            .materialInfo
            .copyWith(materialNumber: comboDeal.allMaterialNumbers[i]),
      );
      materialPrices[i] = materialPrices[i].copyWith(
        info: materialPrices[i]
            .info
            .copyWith(materialNumber: comboDeal.allMaterialNumbers[i]),
      );
      materialInfos[i] = materialInfos[i].copyWith(
        materialNumber: productList[i].getMaterialNumber,
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
              salesOrgConfig: fakeSalesOrganisationConfigs,
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
                    salesOrgConfig: fakeSalesOrganisationConfigs,
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
      ),
      seed: () => initialState,
      act: (ComboDealMaterialDetailBloc bloc) => bloc.add(
        ComboDealMaterialDetailEvent.initFromCartComboDealItems(
          items: productList,
          salesConfigs: fakeSalesOrganisationConfigs,
        ),
      ),
      expect: () => [
        initialState.copyWith(
          items: items,
          selectedItems: selectedItems,
          isFetchingPrice: true,
        )
      ],
    );
    blocTest(
      'combo deal material bloc setPriceInfo',
      setUp: () {
        items = {
          for (final item in productList)
            item.getMaterialNumber: item.copyWith(
              salesOrgConfig: fakeSalesOrganisationConfigs,
            ),
        };
        final priceMap = {
          for (int i = 0; i < 2; i++)
            productList[i].getMaterialNumber: materialPrices[i]
        };
        priceMap.forEach(
          (key, value) {
            if (items[key] != null) {
              items[key] = items[key]!.copyWith(
                price: value.price,
              );
            }
          },
        );
      },
      build: () => ComboDealMaterialDetailBloc(
        productDetailRepository: productDetailRepository,
        materialListRepository: materialListRepository,
        config: config,
      ),
      seed: () => initialState.copyWith(
        items: {
          for (final item in productList)
            item.getMaterialNumber: item.copyWith(
              salesOrgConfig: fakeSalesOrganisationConfigs,
            ),
        },
      ),
      act: (ComboDealMaterialDetailBloc bloc) => bloc.add(
        ComboDealMaterialDetailEvent.setPriceInfo(
          priceMap: {
            for (int i = 0; i < 2; i++)
              productList[i].getMaterialNumber: materialPrices[i]
          },
        ),
      ),
      expect: () => [
        initialState.copyWith(
          items: items,
        )
      ],
    );

    blocTest(
      'combo deal material bloc updateItemQuantity',
      setUp: () {
        items = {
          for (final item in productList)
            item.getMaterialNumber: item.copyWith(
              salesOrgConfig: fakeSalesOrganisationConfigs,
            ),
        };
        items[productList.first.getMaterialNumber] =
            items[productList.first.getMaterialNumber]!.copyWith(quantity: 25);
      },
      build: () => ComboDealMaterialDetailBloc(
        productDetailRepository: productDetailRepository,
        materialListRepository: materialListRepository,
        config: config,
      ),
      seed: () => initialState.copyWith(
        items: {
          for (final item in productList)
            item.getMaterialNumber: item.copyWith(
              salesOrgConfig: fakeSalesOrganisationConfigs,
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
        )
      ],
    );
    blocTest(
      'combo deal material bloc updateItemQuantity with zero qty',
      setUp: () {
        items = {
          for (final item in productList)
            item.getMaterialNumber: item.copyWith(
              salesOrgConfig: fakeSalesOrganisationConfigs,
            ),
        };
        items[productList.first.getMaterialNumber] =
            items[productList.first.getMaterialNumber]!.copyWith(quantity: 24);
      },
      build: () => ComboDealMaterialDetailBloc(
        productDetailRepository: productDetailRepository,
        materialListRepository: materialListRepository,
        config: config,
      ),
      seed: () => initialState.copyWith(
        items: {
          for (final item in productList)
            item.getMaterialNumber: item.copyWith(
              salesOrgConfig: fakeSalesOrganisationConfigs,
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
        )
      ],
    );
    blocTest(
      'combo deal material bloc updateItemSelection',
      setUp: () {
        items = {
          for (final item in productList)
            item.getMaterialNumber: item.copyWith(
              salesOrgConfig: fakeSalesOrganisationConfigs,
            ),
        };
        selectionStatus = {
          for (final item in productList) item.getMaterialNumber: true
        };
      },
      build: () => ComboDealMaterialDetailBloc(
        productDetailRepository: productDetailRepository,
        materialListRepository: materialListRepository,
        config: config,
      ),
      seed: () => initialState.copyWith(
        items: items,
        selectedItems: {
          for (final item in productList) item.getMaterialNumber: true
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
      'combo deal material bloc fetchComboDeal',
      setUp: () {
        items = comboDeal.allMaterialNumbers.fold(
          <MaterialNumber, PriceAggregate>{},
          (
            Map<MaterialNumber, PriceAggregate> map,
            MaterialNumber materialNumber,
          ) {
            map[materialNumber] = PriceAggregate.empty()
                .copyWith(salesOrgConfig: SalesOrganisationConfigs.empty());

            return map;
          },
        );
        itemsAfterGetMaterials =
            Map<MaterialNumber, PriceAggregate>.from(items);
        selectionStatus = {
          for (final item in productList) item.getMaterialNumber: true
        };
        qty = {
          for (final item in productList) item.materialInfo.materialNumber: 1,
        };
        when(
          () => productDetailRepository.getProductListDetail(
            customerCodeInfo: fakeCustomerCodeInfo,
            language: Language.english(),
            materialNumber: comboDeal.allMaterialNumbers,
            salesOrganisation: fakeSalesOrganisation,
            shipToInfo: fakeShipToInfo,
            types: comboDeal.allMaterialNumbers
                .map((e) => MaterialInfoType('material'))
                .toList(),
          ),
        ).thenAnswer(
          (_) async => Right(
            materialInfos,
          ),
        );
        if (materialInfos.isNotEmpty) {
          for (final materialInfo in materialInfos) {
            if (itemsAfterGetMaterials[materialInfo.materialNumber] != null) {
              itemsAfterGetMaterials[materialInfo.materialNumber] =
                  itemsAfterGetMaterials[materialInfo.materialNumber]!
                      .copyWith(
                        materialInfo: materialInfo.copyWith(
                          parentID: productList.first.getMaterialNumber
                              .getOrDefaultValue(''),
                        ),
                      )
                      .copyWithComboDealMinQty(comboDeal);
            }
          }
        }
        when(
          () => productDetailRepository.getStockInfoList(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeSalesOrganisation,
            materials: itemsAfterGetMaterials.entries
                .map((e) => e.value.materialInfo)
                .toList(),
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
                  material
                      .copyWith(
                        stockInfo: materialStockInfo.stockInfos.first,
                        stockInfoList: materialStockInfo.stockInfos,
                      )
                      .copyWithComboDealMinQty(comboDeal);
            }
          }
        }
        final currentQuantityMap = qty;
        if (currentQuantityMap.isNotEmpty) {
          currentQuantityMap.forEach((key, value) {
            itemsAfterGetMaterials[key] = itemsAfterGetMaterials[key]!.copyWith(
              quantity: value,
            );
          });
        }
        itemsAfterGetMaterials.forEach((key, value) {
          value = value.copyWith(salesOrgConfig: fakeSalesOrganisationConfigs);
        });

        selectedItems = <MaterialNumber, bool>{};

        selectedItems.addAll(
          {
            for (final item in itemsAfterGetMaterials.values)
              item.getMaterialNumber:
                  currentQuantityMap.containsKey(item.getMaterialNumber)
                      ? true
                      : item.selfComboDeal.mandatory
          },
        );
      },
      build: () => ComboDealMaterialDetailBloc(
        productDetailRepository: productDetailRepository,
        materialListRepository: materialListRepository,
        config: config,
      ),
      seed: () => initialState.copyWith(
        items: items,
        selectedItems: {
          for (final item in productList) item.getMaterialNumber: true
        },
      ),
      act: (ComboDealMaterialDetailBloc bloc) => bloc.add(
        ComboDealMaterialDetailEvent.fetchComboDealDetail(
          comboDeal: comboDeal,
          parentMaterialNumber: productList.first.getMaterialNumber,
          comboMaterialsCurrentQuantity: qty,
        ),
      ),
      skip: 1,
      expect: () => [
        initialState.copyWith(
          items: itemsAfterGetMaterials,
          selectedItems: selectedItems,
          isFetchingPrice: true,
          salesConfigs: SalesOrganisationConfigs.empty(),
        ),
      ],
    );
    blocTest(
      'combo deal material bloc fetchComboDealPrincipal',
      setUp: () {
        when(() => config.pageSize).thenAnswer((invocation) => 1);
        items = {};
        itemsAfterGetMaterials =
            Map<MaterialNumber, PriceAggregate>.from(items);
        qty = {
          for (final item in productList) item.materialInfo.materialNumber: 1,
        };

        when(
          () => productDetailRepository.getProductListDetail(
            customerCodeInfo: fakeCustomerCodeInfo,
            language: Language.english(),
            materialNumber: qty.keys.toList(),
            salesOrganisation: fakeSalesOrganisation,
            shipToInfo: fakeShipToInfo,
            types: qty.keys.map((e) => MaterialInfoType('material')).toList(),
          ),
        ).thenAnswer(
          (_) async => Right(
            materialInfos,
          ),
        );

        when(
          () => materialListRepository.getComboDealMaterials(
            user: fakeClientUser,
            salesOrganisation: fakeSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
            pageSize: 1,
            offset: 0,
            principles: [
              productList.first.materialInfo.principalData.principalCode
                  .getOrDefaultValue('')
            ],
            salesOrgConfig: fakeSalesOrganisationConfigs,
          ),
        ).thenAnswer(
          (_) async => Right(
            materialResponse,
          ),
        );
        final materialsNextPage = qty.keys.toList();
        selectedItems = <MaterialNumber, bool>{};
        if (materialsNextPage.isNotEmpty) {
          itemsAfterGetMaterials.addAll({
            for (final material in materialsNextPage)
              material: PriceAggregate.empty(),
          });
          selectedItems.addAll({
            for (final material in materialsNextPage) material: true,
          });

          if (materialInfos.isNotEmpty) {
            for (final materialInfo in materialInfos) {
              if (itemsAfterGetMaterials[materialInfo.materialNumber] != null) {
                itemsAfterGetMaterials[materialInfo.materialNumber] =
                    itemsAfterGetMaterials[materialInfo.materialNumber]!
                        .copyWith(
                  materialInfo: materialInfo,
                  comboDeal: comboDeal,
                  salesOrgConfig: fakeSalesOrganisationConfigs,
                );
              }
            }
          }
        }

        itemsAfterGetMaterials.addAll(
          materialResponse.products
              .map(
                (material) => PriceAggregate.empty().copyWith(
                  materialInfo: material,
                  salesOrgConfig: fakeSalesOrganisationConfigs,
                  comboDeal: comboDeal,
                ),
              )
              .toList()
              .mapByMaterialNumber,
        );
        when(
          () => productDetailRepository.getStockInfoList(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeSalesOrganisation,
            materials: itemsAfterGetMaterials.entries
                .map((e) => e.value.materialInfo)
                .toList(),
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

        if (qty.isNotEmpty) {
          qty.forEach((key, value) {
            if (itemsAfterGetMaterials.containsKey(key)) {
              itemsAfterGetMaterials[key] =
                  itemsAfterGetMaterials[key]!.copyWith(quantity: value);
            }
          });
        }

        selectedItems.addAll(
          {
            for (final item in itemsAfterGetMaterials.values)
              item.getMaterialNumber: qty.containsKey(item.getMaterialNumber)
                  ? true
                  : item.selfComboDeal.mandatory
          },
        );
      },
      build: () => ComboDealMaterialDetailBloc(
        productDetailRepository: productDetailRepository,
        materialListRepository: materialListRepository,
        config: config,
      ),
      seed: () => initialState.copyWith(
        items: items,
        user: fakeClientUser,
        salesConfigs: fakeSalesOrganisationConfigs,
        selectedItems: {
          for (final item in productList) item.getMaterialNumber: true
        },
      ),
      act: (ComboDealMaterialDetailBloc bloc) => bloc.add(
        ComboDealMaterialDetailEvent.fetchComboDealPrincipal(
          comboDeal: comboDeal,
          principles: [
            productList.first.materialInfo.principalData.principalCode
                .getOrDefaultValue('')
          ],
          comboMaterialsCurrentQuantity: qty,
        ),
      ),
      skip: 2,
      expect: () => [
        initialState.copyWith(
          items: itemsAfterGetMaterials,
          selectedItems: selectedItems,
          isFetchingPrice: true,
          user: fakeClientUser,
          salesConfigs: fakeSalesOrganisationConfigs,
          nextPageIndex: 1,
          materialCount: 13,
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
                .copyWith(salesOrgConfig: SalesOrganisationConfigs.empty());

            return map;
          },
        );
        when(
          () => materialListRepository.getComboDealMaterials(
            user: fakeClientUser,
            salesOrganisation: fakeSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
            pageSize: 1,
            offset: 0,
            principles: [
              productList.first.materialInfo.principalData.principalCode
                  .getOrDefaultValue('')
            ],
            salesOrgConfig: fakeSalesOrganisationConfigs,
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
                salesOrgConfig: fakeSalesOrganisationConfigs,
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
          () => productDetailRepository.getStockInfoList(
            customerCodeInfo: fakeCustomerCodeInfo,
            salesOrganisation: fakeSalesOrganisation,
            materials:
                newItems.entries.map((e) => e.value.materialInfo).toList(),
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
      ),
      seed: () => initialState.copyWith(
        items: items,
        canLoadMore: true,
        user: fakeClientUser,
        salesConfigs: fakeSalesOrganisationConfigs,
      ),
      act: (ComboDealMaterialDetailBloc bloc) => bloc.add(
        ComboDealMaterialDetailEvent.loadMoreComboDealPrincipal(
          comboDeal: comboDeal,
          principles: [
            productList.first.materialInfo.principalData.principalCode
                .getOrDefaultValue('')
          ],
        ),
      ),
      skip: 1,
      expect: () => [
        initialState.copyWith(
          items: itemsAfterGetMaterials,
          selectedItems: selectedItems,
          user: fakeClientUser,
          salesConfigs: fakeSalesOrganisationConfigs,
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
      ),
      seed: () => initialState.copyWith(searchKey: SearchKey('dummy')),
      act: (ComboDealMaterialDetailBloc bloc) => bloc.add(
        const ComboDealMaterialDetailEvent.clearSearch(),
      ),
      expect: () => [
        initialState.copyWith(
          searchKey: SearchKey.search(''),
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
      ),
      seed: () => initialState,
      act: (ComboDealMaterialDetailBloc bloc) => bloc.add(
        ComboDealMaterialDetailEvent.search(
          searchKey: SearchKey('dummy'),
        ),
      ),
      expect: () => [
        initialState.copyWith(
          searchKey: SearchKey('dummy'),
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
                .copyWith(salesOrgConfig: SalesOrganisationConfigs.empty());

            return map;
          },
        );
        when(
          () => materialListRepository.getComboDealMaterials(
            user: fakeClientUser,
            salesOrganisation: fakeSalesOrganisation,
            customerCodeInfo: fakeCustomerCodeInfo,
            shipToInfo: fakeShipToInfo,
            pageSize: 1,
            offset: 0,
            principles: [
              productList.first.materialInfo.principalData.principalCode
                  .getOrDefaultValue('')
            ],
            salesOrgConfig: fakeSalesOrganisationConfigs,
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
      ),
      seed: () => initialState.copyWith(
        items: items,
        canLoadMore: true,
        user: fakeClientUser,
        salesConfigs: fakeSalesOrganisationConfigs,
      ),
      act: (ComboDealMaterialDetailBloc bloc) => bloc.add(
        ComboDealMaterialDetailEvent.loadMoreComboDealPrincipal(
          comboDeal: comboDeal,
          principles: [
            productList.first.materialInfo.principalData.principalCode
                .getOrDefaultValue('')
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
          salesConfigs: fakeSalesOrganisationConfigs,
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
            salesOrgConfig: fakeSalesOrganisationConfigs,
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
              salesOrgConfig: fakeSalesOrganisationConfigs,
              comboDeal: comboDeal,
            ),
        },
        selectedItems: selectionStatus,
      ),
    ],
  );
}

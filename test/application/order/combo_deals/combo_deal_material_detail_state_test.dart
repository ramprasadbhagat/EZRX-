import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_material.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_group_deal.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/combo_deal_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_local_datasource.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_material_detail_bloc.dart';

import '../../../common_mock_data/sales_org_config_mock/fake_kh_sales_org_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late ComboDeal comboDeal;
  late List<PriceAggregate> productList;
  late Map<MaterialNumber, PriceAggregate> items;
  setUpAll(() async {
    comboDeal = (await ComboDealLocalDataSource().getComboDealList()).first;
    productList = (await CartLocalDataSource().getAddedToCartProductList())
        .cartProducts
        .where(
          (e) =>
              e.materialInfo.type.typeMaterial && !e.materialInfo.isMarketPlace,
        )
        .toList();

    for (var i = 0; i < productList.length; i++) {
      productList[i] = productList[i].copyWith(
        materialInfo: productList[i]
            .materialInfo
            .copyWith(materialNumber: comboDeal.allMaterialNumbers[i]),
      );
    }

    items = {
      for (final item in productList)
        item.getMaterialNumber: item.copyWith(
          salesOrgConfig: fakeKHSalesOrgConfigs,
        ),
    };
  });
  group('ComboDealMaterialDetailState', () {
    test(' => searchableList when searchKey is empty', () {
      final state = ComboDealMaterialDetailState.initial().copyWith(
        searchKey: SearchKey.empty(),
        items: items,
      );
      expect(state.searchableList, items);
    });
    test(' => searchableList when searchKey is not empty', () {
      final state = ComboDealMaterialDetailState.initial().copyWith(
        searchKey: SearchKey.search('*****'),
        items: items,
      );
      expect(state.searchableList, {});
    });
    test(' => searchableList when comboDeal is K2.1', () {
      final mockComboDeal = ComboDeal.empty().copyWith(
        materialComboDeals: [
          ComboDealMaterialSet.empty().copyWith(
            materials: [ComboDealMaterial.empty()],
          ),
        ],
        groupDeal: ComboDealGroupDeal.empty().copyWith(minTotalQuantity: 1),
      );
      productList[0] = productList[0].copyWith(comboDeal: mockComboDeal);
      items = {
        for (final item in productList)
          item.getMaterialNumber: item.copyWith(
            salesOrgConfig: fakeKHSalesOrgConfigs,
          ),
      };
      final state = ComboDealMaterialDetailState.initial().copyWith(
        searchKey: SearchKey.search('190'),
        items: items,
      );
      expect(state.searchableList, {});
    });
    test(' => mandatoryMaterials when comboDeal is K2.1', () {
      final mockComboDeal = ComboDeal.empty().copyWith(
        materialComboDeals: [
          ComboDealMaterialSet.empty().copyWith(
            materials: [
              ComboDealMaterial.empty(),
              ComboDealMaterial.empty().copyWith(mandatory: true),
            ],
          ),
          ComboDealMaterialSet.empty().copyWith(
            materials: [
              ComboDealMaterial.empty().copyWith(mandatory: true),
              ComboDealMaterial.empty().copyWith(
                mandatory: true,
                materialNumber: productList.first.getMaterialNumber,
              ),
            ],
          ),
        ],
        groupDeal: ComboDealGroupDeal.empty().copyWith(minTotalQuantity: 1),
      );
      productList[0] = productList[0].copyWith(comboDeal: mockComboDeal);
      items = {for (final item in productList) item.getMaterialNumber: item};
      final state = ComboDealMaterialDetailState.initial().copyWith(
        items: items,
      );
      expect(
        state.mandatoryMaterials,
        {
          productList.first.getMaterialNumber: productList.first,
        },
      );
    });
    test(' => allSelectedItems should show the right result', () {
      items = {for (final item in productList) item.getMaterialNumber: item};
      final selectedItems = {
        for (final item in productList) item.getMaterialNumber: true,
      };
      final state = ComboDealMaterialDetailState.initial().copyWith(
        items: items,
        selectedItems: selectedItems,
      );

      expect(
        state.allSelectedItems,
        productList,
      );
    });
    test(' => isMaterialSelected should show the right result', () {
      items = {for (final item in productList) item.getMaterialNumber: item};
      final selectedItems = {
        for (final item in productList) item.getMaterialNumber: true,
      };
      final state = ComboDealMaterialDetailState.initial().copyWith(
        items: items,
        selectedItems: selectedItems,
      );

      expect(
        state.isMaterialSelected(productList.first.getMaterialNumber),
        true,
      );
    });
    test(' => totalPriceSelectedItems should show the right result', () {
      items = {
        for (final item in productList)
          item.getMaterialNumber: item.copyWith(
            quantity: 10,
            price: Price.empty().copyWith(
              lastPrice: MaterialPrice(100),
              finalPrice: MaterialPrice(100),
              finalTotalPrice: MaterialPrice(100),
            ),
          ),
      };
      final selectedItems = {
        for (final item in productList) item.getMaterialNumber: true,
      };
      final state = ComboDealMaterialDetailState.initial().copyWith(
        items: items,
        selectedItems: selectedItems,
      );

      expect(
        state.totalPriceSelectedItems,
        3000,
      );
    });
    test(' => totalPriceDisplay should show the right result', () {
      items = {
        for (final item in productList)
          item.getMaterialNumber: item.copyWith(
            quantity: 10,
            price: Price.empty().copyWith(
              lastPrice: MaterialPrice(100),
              finalPrice: MaterialPrice(100),
              finalTotalPrice: MaterialPrice(100),
            ),
          ),
      };
      final selectedItems = {
        for (final item in productList) item.getMaterialNumber: true,
      };
      final state = ComboDealMaterialDetailState.initial().copyWith(
        items: items,
        selectedItems: selectedItems,
      );

      expect(
        state.totalPriceDisplay,
        3000,
      );
    });
    test(' => allMaterialsNumber should show the right result', () {
      items = {for (final item in productList) item.getMaterialNumber: item};
      final selectedItems = {
        for (final item in productList) item.getMaterialNumber: true,
      };
      final state = ComboDealMaterialDetailState.initial().copyWith(
        items: items,
        selectedItems: selectedItems,
      );

      expect(
        state.allMaterialsNumber,
        items.keys.toList(),
      );
    });
    test(' => allMaterialsInfo should show the right result', () {
      items = {for (final item in productList) item.getMaterialNumber: item};
      final selectedItems = {
        for (final item in productList) item.getMaterialNumber: true,
      };
      final state = ComboDealMaterialDetailState.initial().copyWith(
        items: items,
        selectedItems: selectedItems,
      );

      expect(
        state.allMaterialsInfo,
        items.values.toList().map((e) => e.materialInfo).toList(),
      );
    });
    test(' => totalSelectedQuantity should show the right result', () {
      items = {
        for (final item in productList)
          item.getMaterialNumber: item.copyWith(quantity: 2),
      };
      final selectedItems = {
        for (final item in productList) item.getMaterialNumber: true,
      };
      final state = ComboDealMaterialDetailState.initial().copyWith(
        items: items,
        selectedItems: selectedItems,
      );

      expect(
        state.totalSelectedQuantity,
        6,
      );
    });
    test(' => currentPrincipalCode should show the right result', () {
      items = {
        for (final item in productList)
          item.getMaterialNumber: item.copyWith(
            quantity: 2,
            materialInfo: MaterialInfo.empty().copyWith(
              principalData: PrincipalData(
                principalCode: PrincipalCode('dummy'),
                principalName: PrincipalName('dummy'),
              ),
            ),
          ),
      };
      final selectedItems = {
        for (final item in productList) item.getMaterialNumber: true,
      };
      final state = ComboDealMaterialDetailState.initial().copyWith(
        items: items,
        selectedItems: selectedItems,
      );

      expect(
        state.currentPrincipalCode,
        'dummy',
      );
    });
    test(
        ' => displayNextComboDealMessage and displayMinPurchaseQtyMessage should show the right result',
        () {
      items = {for (final item in productList) item.getMaterialNumber: item};
      final selectedItems = {
        for (final item in productList) item.getMaterialNumber: true,
      };
      final state = ComboDealMaterialDetailState.initial().copyWith(
        items: items,
        selectedItems: selectedItems,
        isFetchingComboInfo: false,
        isFetchingPrice: false,
      );

      expect(
        state.displayNextComboDealMessage,
        false,
      );
      expect(
        state.displayMinPurchaseQtyMessage,
        true,
      );
    });
  });
}

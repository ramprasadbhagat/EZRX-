import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_detail_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal_material.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_price_detail.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/price_combo_deal.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final fakeMaterialNumber = MaterialNumber('fake-number');
  final fakeQueryItem = PriceAggregate.empty().copyWith(
    salesOrgConfig: SalesOrganisationConfigs.empty(),
    materialInfo: MaterialInfo.empty().copyWith(
      materialNumber: fakeMaterialNumber,
    ),
  );
  final fakePrice = Price.empty().copyWith(
    materialNumber: fakeMaterialNumber,
  );
  final fakeMaterialInfo = MaterialInfo.empty().copyWith(
    materialNumber: fakeMaterialNumber,
  );
  final fakePriceMap = {
    fakeMaterialNumber: MaterialPriceDetail.empty().copyWith(
      info: fakeMaterialInfo,
      price: fakePrice,
    ),
  };
  final fakeComboDealQuery = PriceComboDeal.empty().copyWith(
    flexibleGroup: FlexibleGroup('fake-group'),
  );

  const fakeMinQty = 4;

  final fakeComboDealDetail = ComboDeal.empty().copyWith(
    materialComboDeals: [
      ComboDealMaterialSet(
        materials: [
          ComboDealMaterial.empty().copyWith(
            minQty: fakeMinQty,
            materialNumber: fakeMaterialNumber,
          ),
        ],
        setNo: 'fake-set',
      )
    ],
  );

  group(
    'Combo Deal Detail',
    () {
      blocTest<ComboDealDetailBloc, ComboDealDetailState>(
        'Init',
        build: () => ComboDealDetailBloc(),
        act: (bloc) => bloc.add(
          const ComboDealDetailEvent.initialize(),
        ),
        expect: () => [
          ComboDealDetailState.initial(),
        ],
      );

      blocTest<ComboDealDetailBloc, ComboDealDetailState>(
        'Init items with empty data',
        build: () => ComboDealDetailBloc(),
        act: (bloc) => bloc.add(
          ComboDealDetailEvent.initComboDealItems(
            items: [fakeQueryItem],
            salesConfigs: SalesOrganisationConfigs.empty(),
          ),
        ),
        expect: () => [
          ComboDealDetailState(
            isFetchingComboInfo: true,
            isFetchingPrice: true,
            items: {
              fakeMaterialNumber: fakeQueryItem,
            },
            selectedItems: {
              fakeMaterialNumber: true,
            },
          ),
        ],
      );
      //TODO: Update this test later (Test content doesn't match with the description)
      blocTest<ComboDealDetailBloc, ComboDealDetailState>(
        'Init items with fully data (not require fetch additional data)',
        build: () => ComboDealDetailBloc(),
        act: (bloc) => bloc.add(
          ComboDealDetailEvent.initComboDealItems(
            items: [fakeQueryItem],
            salesConfigs: SalesOrganisationConfigs.empty(),
          ),
        ),
        expect: () => [
          ComboDealDetailState(
            isFetchingComboInfo: true,
            isFetchingPrice: true,
            items: {
              fakeMaterialNumber: fakeQueryItem,
            },
            selectedItems: {
              fakeMaterialNumber: true,
            },
          ),
        ],
        verify: (bloc) {
          expect(bloc.state.allSelectedItems, [fakeQueryItem]);
          expect(bloc.state.isEnableAddToCart, false);
        },
      );

      blocTest<ComboDealDetailBloc, ComboDealDetailState>(
        'Update Item quantity',
        build: () => ComboDealDetailBloc(),
        act: (bloc) => bloc.add(
          ComboDealDetailEvent.updateItemQuantity(
              item: fakeMaterialNumber, qty: 2),
        ),
        seed: () => ComboDealDetailState.initial().copyWith(
          items: {
            fakeMaterialNumber: fakeQueryItem,
          },
        ),
        expect: () => [
          ComboDealDetailState.initial().copyWith(
            items: {
              fakeMaterialNumber: fakeQueryItem.copyWith(quantity: 2),
            },
          ),
        ],
      );

      blocTest<ComboDealDetailBloc, ComboDealDetailState>(
        'Update Item Selection',
        build: () => ComboDealDetailBloc(),
        act: (bloc) => bloc.add(
          ComboDealDetailEvent.updateItemSelection(
            item: fakeMaterialNumber,
          ),
        ),
        seed: () => ComboDealDetailState.initial().copyWith(
          selectedItems: {
            fakeMaterialNumber: true,
          },
        ),
        expect: () => [
          ComboDealDetailState.initial().copyWith(
            selectedItems: {
              fakeMaterialNumber: false,
            },
          ),
        ],
      );

      blocTest<ComboDealDetailBloc, ComboDealDetailState>(
        'Set price Info',
        build: () => ComboDealDetailBloc(),
        act: (bloc) => bloc.add(
          ComboDealDetailEvent.setPriceInfo(
            priceMap: fakePriceMap,
            comboDeal: fakeComboDealQuery,
          ),
        ),
        seed: () => ComboDealDetailState.initial().copyWith(
          items: {
            fakeMaterialNumber: fakeQueryItem,
          },
          isFetchingPrice: true,
        ),
        expect: () => [
          ComboDealDetailState.initial().copyWith(
            items: {
              fakeMaterialNumber: fakeQueryItem.copyWith(
                price: fakePrice.copyWith(
                  comboDeal: fakeComboDealQuery,
                ),
                materialInfo: fakeMaterialInfo,
              ),
            },
            isFetchingPrice: false,
          ),
        ],
      );

      blocTest<ComboDealDetailBloc, ComboDealDetailState>(
        'Set price Info with default value',
        build: () => ComboDealDetailBloc(),
        act: (bloc) => bloc.add(
          ComboDealDetailEvent.setPriceInfo(
            priceMap: {},
            comboDeal: fakeComboDealQuery,
          ),
        ),
        seed: () => ComboDealDetailState.initial().copyWith(
          items: {
            fakeMaterialNumber: fakeQueryItem,
          },
          isFetchingPrice: true,
        ),
        expect: () => [
          ComboDealDetailState.initial().copyWith(
            items: {
              fakeMaterialNumber: fakeQueryItem.copyWith(
                price: fakePrice.copyWith(
                  comboDeal: fakeComboDealQuery,
                ),
                materialInfo: fakeMaterialInfo,
              ),
            },
            isFetchingPrice: false,
          ),
        ],
      );
      //TODO: Rewrite this test later
      // blocTest<ComboDealDetailBloc, ComboDealDetailState>(
      //   'Set combo deal info ',
      //   build: () => ComboDealDetailBloc(),
      //   act: (bloc) => bloc.add(
      //     ComboDealDetailEvent.setComboDealInfo(
      //       comboDealInfo: fakeComboDealDetail,
      //     ),
      //   ),
      //   seed: () => ComboDealDetailState.initial().copyWith(
      //     items: {
      //       fakeMaterialNumber: fakeQueryItem,
      //     },
      //     isFetchingComboInfo: true,
      //   ),
      //   expect: () => [
      //     ComboDealDetailState.initial().copyWith(
      //       items: {
      //         fakeMaterialNumber: fakeQueryItem.copyWith(
      //           comboDeal: fakeComboDealDetail,
      //           quantity: fakeMinQty,
      //         ),
      //       },
      //       isFetchingComboInfo: true,
      //       isFetchingPrice: true,
      //     ),
      //   ],
      // );
    },
  );
}

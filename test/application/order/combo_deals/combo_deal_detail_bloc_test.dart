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
  final fakeFirstMaterialNumber = MaterialNumber('fake-first-number');
  final fakeSecondMaterialNumber = MaterialNumber('fake-second-number');
  final fakeFirstQueryItem = PriceAggregate.empty().copyWith(
    salesOrgConfig: SalesOrganisationConfigs.empty(),
    materialInfo: MaterialInfo.empty().copyWith(
      materialNumber: fakeFirstMaterialNumber,
    ),
  );
  final fakeSecondQueryItem = PriceAggregate.empty().copyWith(
    salesOrgConfig: SalesOrganisationConfigs.empty(),
    materialInfo: MaterialInfo.empty().copyWith(
      materialNumber: fakeSecondMaterialNumber,
    ),
  );
  final fakePrice = Price.empty().copyWith(
    materialNumber: fakeFirstMaterialNumber,
  );
  final fakeMaterialInfo = MaterialInfo.empty().copyWith(
    materialNumber: fakeFirstMaterialNumber,
  );
  final fakePriceMap = {
    fakeFirstMaterialNumber: MaterialPriceDetail.empty().copyWith(
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
            materialNumber: fakeFirstMaterialNumber,
          ),
          ComboDealMaterial.empty().copyWith(
            minQty: fakeMinQty,
            materialNumber: fakeSecondMaterialNumber,
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
            items: [fakeFirstQueryItem],
            salesConfigs: SalesOrganisationConfigs.empty(),
          ),
        ),
        expect: () => [
          ComboDealDetailState(
            isFetchingComboInfo: true,
            isFetchingPrice: true,
            items: {
              fakeFirstMaterialNumber: fakeFirstQueryItem,
            },
            selectedItems: {
              fakeFirstMaterialNumber: true,
            },
          ),
        ],
      );
      blocTest<ComboDealDetailBloc, ComboDealDetailState>(
          'Init items from cart items (edit mode)',
          build: () => ComboDealDetailBloc(),
          act: (bloc) => bloc.add(
                ComboDealDetailEvent.initFromCartComboDealItems(
                  items: [
                    fakeFirstQueryItem.copyWith(
                      comboDeal: fakeComboDealDetail,
                    )
                  ],
                  salesConfigs: SalesOrganisationConfigs.empty(),
                ),
              ),
          expect: () => [
                ComboDealDetailState(
                  isFetchingComboInfo: false,
                  isFetchingPrice: true,
                  items: {
                    fakeFirstMaterialNumber: fakeFirstQueryItem.copyWith(
                      comboDeal: fakeComboDealDetail,
                    ),
                    fakeSecondMaterialNumber: fakeSecondQueryItem.copyWith(
                      comboDeal: fakeComboDealDetail,
                      quantity: 4,
                    ),
                  },
                  selectedItems: {
                    fakeFirstMaterialNumber: true,
                    fakeSecondMaterialNumber: false,
                  },
                ),
              ],
          verify: (bloc) {
            expect(bloc.state.currentDeal, fakeComboDealDetail);
            expect(bloc.state.allSelectedItems, [
              fakeFirstQueryItem.copyWith(
                comboDeal: fakeComboDealDetail,
              ),
            ]);
          });

      blocTest<ComboDealDetailBloc, ComboDealDetailState>(
        'Update Item quantity',
        build: () => ComboDealDetailBloc(),
        act: (bloc) => bloc.add(
          ComboDealDetailEvent.updateItemQuantity(
            item: fakeFirstMaterialNumber,
            qty: 2,
          ),
        ),
        seed: () => ComboDealDetailState.initial().copyWith(
          items: {
            fakeFirstMaterialNumber: fakeFirstQueryItem,
          },
        ),
        expect: () => [
          ComboDealDetailState.initial().copyWith(
            items: {
              fakeFirstMaterialNumber: fakeFirstQueryItem.copyWith(quantity: 2),
            },
          ),
        ],
      );

      blocTest<ComboDealDetailBloc, ComboDealDetailState>(
        'Update Item Selection',
        build: () => ComboDealDetailBloc(),
        act: (bloc) => bloc.add(
          ComboDealDetailEvent.updateItemSelection(
            item: fakeFirstMaterialNumber,
          ),
        ),
        seed: () => ComboDealDetailState.initial().copyWith(
          selectedItems: {
            fakeFirstMaterialNumber: true,
          },
        ),
        expect: () => [
          ComboDealDetailState.initial().copyWith(
            selectedItems: {
              fakeFirstMaterialNumber: false,
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
            fakeFirstMaterialNumber: fakeFirstQueryItem,
          },
          isFetchingPrice: true,
        ),
        expect: () => [
          ComboDealDetailState.initial().copyWith(
            items: {
              fakeFirstMaterialNumber: fakeFirstQueryItem.copyWith(
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
            fakeFirstMaterialNumber: fakeFirstQueryItem,
          },
          isFetchingPrice: true,
        ),
        expect: () => [
          ComboDealDetailState.initial().copyWith(
            items: {
              fakeFirstMaterialNumber: fakeFirstQueryItem.copyWith(
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
        'Set combo deal info ',
        build: () => ComboDealDetailBloc(),
        act: (bloc) => bloc.add(
          ComboDealDetailEvent.setComboDealInfo(
            comboDealInfo: fakeComboDealDetail,
          ),
        ),
        seed: () => ComboDealDetailState.initial().copyWith(
          items: {
            fakeFirstMaterialNumber: fakeFirstQueryItem,
          },
          isFetchingComboInfo: true,
        ),
        expect: () => [
          ComboDealDetailState.initial().copyWith(
            items: {
              fakeFirstMaterialNumber: fakeFirstQueryItem.copyWith(
                comboDeal: fakeComboDealDetail,
                quantity: fakeMinQty,
              ),
            },
            selectedItems: {
              fakeFirstMaterialNumber: false,
            },
            isFetchingComboInfo: false,
          ),
        ],
      );

      blocTest<ComboDealDetailBloc, ComboDealDetailState>(
        'State Getter',
        build: () => ComboDealDetailBloc(),
        seed: () => ComboDealDetailState.initial().copyWith(
          items: {
            fakeFirstMaterialNumber: fakeFirstQueryItem.copyWith(
              comboDeal: fakeComboDealDetail,
              quantity: 5,
            ),
            fakeSecondMaterialNumber: fakeSecondQueryItem.copyWith(
              comboDeal: fakeComboDealDetail,
              quantity: 4,
            ),
          },
          selectedItems: {
            fakeFirstMaterialNumber: true,
            fakeSecondMaterialNumber: false,
          },
        ),
        verify: (bloc) {
          expect(bloc.state.isEnableAddToCart, true);
          expect(
            bloc.state.itemBySets,
            [
              [
                fakeFirstQueryItem.copyWith(
                  comboDeal: fakeComboDealDetail,
                  quantity: 5,
                ),
                fakeSecondQueryItem.copyWith(
                  comboDeal: fakeComboDealDetail,
                  quantity: 4,
                ),
              ]
            ],
          );
        },
      );
    },
  );
}

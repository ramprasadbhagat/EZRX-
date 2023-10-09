import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/order/bundle/add_to_cart/bundle_add_to_cart_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/bundle_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/material_bundle_list_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late MaterialInfo bundleMock;
  late List<MaterialInfo> bundleMaterialsMocks;
  late BundleAddToCartState initialState;
  late BundleAddToCartState stateAfterSet;
  late BundleAddToCartState stateAfterUpdateQuantity;
  const quantity = 10;
  late BundleAddToCartState mockState;
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    bundleMock =
        (await MaterialBundleListLocalDatasource().getMaterialBundleList())
            .first;
    bundleMaterialsMocks = await MaterialBundleListLocalDatasource()
        .getMaterialBundleListForSalesRep();
    initialState = BundleAddToCartState.initial();
    stateAfterSet = BundleAddToCartState.initial().copyWith(
      bundle: bundleMock,
      bundleMaterials: bundleMaterialsMocks,
    );
    stateAfterUpdateQuantity = stateAfterSet.copyWith(
      bundleMaterials: bundleMaterialsMocks
          .map(
            (element) => element.materialNumber == bundleMock.materialNumber
                ? element.copyWith(quantity: MaterialQty(quantity))
                : element,
          )
          .toList(),
    );
  });

  group('Bundle Add To Cart Bloc test', () {
    blocTest<BundleAddToCartBloc, BundleAddToCartState>(
      'Initialized',
      build: () => BundleAddToCartBloc(),
      act: (BundleAddToCartBloc bloc) =>
          bloc.add(const BundleAddToCartEvent.initialized()),
      expect: () => [initialState],
    );

    blocTest<BundleAddToCartBloc, BundleAddToCartState>(
      'Set the bundle and bundleMaterials',
      build: () => BundleAddToCartBloc(),
      act: (BundleAddToCartBloc bloc) => bloc.add(
        BundleAddToCartEvent.set(
          bundle: bundleMock,
          bundleMaterials: bundleMaterialsMocks,
        ),
      ),
      expect: () => [stateAfterSet],
    );

    blocTest(
      'Update the quantity',
      build: () => BundleAddToCartBloc(),
      seed: () => BundleAddToCartState.initial().copyWith(
        bundle: bundleMock,
        bundleMaterials: bundleMaterialsMocks,
      ),
      act: (BundleAddToCartBloc bloc) => bloc.add(
        BundleAddToCartEvent.updateQuantity(
          materialNumber: bundleMock.materialNumber,
          quantity: quantity,
        ),
      ),
      expect: () => [stateAfterUpdateQuantity],
    );
  });
  group('Bundle Add To Cart State test', () {
    setUpAll(() {
      mockState = stateAfterUpdateQuantity.copyWith(
        bundle: bundleMock.copyWith(
          bundle: Bundle.empty().copyWith(
            bundleInformation: [
              BundleInfo.empty().copyWith(quantity: 1),
              BundleInfo.empty().copyWith(quantity: 2),
            ],
          ),
        ),
      );
    });
    test('Check totalCount', () {
      expect(mockState.totalCount, 10);
    });
    test('Check bundleOffer', () {
      expect(
        mockState.bundleOffer,
        BundleInfo.empty().copyWith(quantity: 2),
      );
    });
    test('Check bundleOffer orElse case', () {
      expect(
        mockState
            .copyWith(
              bundle: bundleMock.copyWith(
                bundle: Bundle.empty().copyWith(
                  bundleInformation: [
                    BundleInfo.empty().copyWith(quantity: 100),
                    BundleInfo.empty().copyWith(quantity: 100),
                  ],
                ),
              ),
            )
            .bundleOffer,
        BundleInfo.empty().copyWith(quantity: 100),
      );
    });
    test('Check bundleMaterialsSelected', () {
      expect(
        mockState.bundleMaterialsSelected,
        stateAfterUpdateQuantity.bundleMaterials
            .where((element) => element.quantity.intValue > 0)
            .toList(),
      );
    });
    test('Check isBundleCountSatisfied', () {
      expect(mockState.isBundleCountSatisfied, true);
    });

    test('Check selectedMaterialInfo', () {
      expect(
        mockState.selectedMaterialInfo(
          PriceAggregate.empty().copyWith(
            bundle: Bundle.empty().copyWith(materials: bundleMaterialsMocks),
          ),
        ),
        [
          stateAfterUpdateQuantity.bundleMaterials
              .where((element) => element.quantity.intValue > 0)
              .toList()
              .first
              .copyWith(quantity: MaterialQty(10))
        ],
      );
    });
    test('Check selectedMaterialInfo orElse case', () {
      expect(
        mockState.selectedMaterialInfo(PriceAggregate.empty()),
        [
          stateAfterUpdateQuantity.bundleMaterials
              .where((element) => element.quantity.intValue > 0)
              .toList()
              .first
              .copyWith(quantity: MaterialQty(10))
        ],
      );
    });
  });
}

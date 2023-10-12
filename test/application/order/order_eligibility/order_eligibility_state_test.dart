import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_local_datasource.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late OrderEligibilityState initializedState;
  late PriceAggregate fakeCartItem;
  late List<PriceAggregate> mockMaterialsCartItems;
  group('Test OrderEligibilityState', () {
    setUp(
      () async {
        fakeCartItem = (await CartLocalDataSource().upsertCartItems())[0];
        initializedState = OrderEligibilityState.initial().copyWith(
          user: fakeExternalSalesRepUser,
          salesOrg: fakeSalesOrganisation.copyWith(salesOrg: fakeSalesOrg),
          configs: fakeEmptySalesConfigs.copyWith(
            minOrderAmount: '50.0',
          ),
          customerCodeInfo: fakeCustomerCodeInfo.copyWith(division: 'div'),
          shipInfo: fakeShipToInfo.copyWith(city1: 'Kol'),
        );

        mockMaterialsCartItems = await CartLocalDataSource().upsertCart();
      },
    );

    test(' => containsRegularMaterials should return correct value', () {
      // containsRegularMaterials is false
      final modifiedState = initializedState.copyWith(
        cartItems: [
          fakeCartItem.copyWith(
            materialInfo: MaterialInfo.empty().copyWith(
              isSampleMaterial: true,
            ),
          ),
        ],
      );
      expect(modifiedState.containsRegularMaterials, false);

      // containsRegularMaterials is true
      final changeState = initializedState.copyWith(
        cartItems: [
          fakeCartItem.copyWith(
            materialInfo: MaterialInfo.empty(),
          ),
        ],
      );
      expect(changeState.containsRegularMaterials, true);
    });

    test(' => validateRegularOrderType should return correct value', () {
      // validateRegularOrderType is true
      expect(initializedState.validateRegularOrderType, true);

      // validateRegularOrderType equals containsRegularMaterials
      final changeState = initializedState.copyWith(
        orderType: 'ZPOR',
      );
      expect(
        changeState.validateRegularOrderType,
        changeState.containsRegularMaterials,
      );
    });

    test(' => displayMovWarning should return correct value', () {
      // displayMovWarning is true
      final modifiedState = initializedState.copyWith(
        showErrorMessage: true,
      );
      expect(modifiedState.displayMovWarning, true);

      // displayMovWarning is false
      expect(initializedState.displayMovWarning, false);
    });

    test(' => isOOSAllowedIfPresentInCart should return correct value', () {
      // isOOSAllowedIfPresentInCart is true
      expect(initializedState.isOOSAllowedIfPresentInCart, true);
      // isOOSAllowedIfPresentInCart is false
      final modifiedState = initializedState.copyWith(
        cartItems: [
          fakeCartItem.copyWith(
            materialInfo: MaterialInfo.empty().copyWith(
              type: MaterialInfoType('material'),
            ),
          ),
        ],
      );
      expect(modifiedState.isOOSAllowedIfPresentInCart, false);
    });

    test(' => displayOOSWarning should return correct value', () {
      // displayOOSWarning is false
      expect(initializedState.displayOOSWarning, false);
      // displayOOSWarning is true
      final modifiedState = initializedState.copyWith(
        cartItems: [
          fakeCartItem.copyWith(
            materialInfo: MaterialInfo.empty().copyWith(
              type: MaterialInfoType('material'),
            ),
            stockInfoList: [StockInfo.empty()],
          ),
        ],
        showErrorMessage: true,
      );
      expect(modifiedState.displayOOSWarning, true);
    });

    test(' => isBundleQuantitySatisfies should return correct value', () {
      // isBundleQuantitySatisfies is true
      expect(initializedState.isBundleQuantitySatisfies, true);

      // isBundleQuantitySatisfies is false
      final bundleMaterials = fakeCartItem.bundle.materials
          .map((e) => e.copyWith(quantity: MaterialQty(0)))
          .toList();
      final modifiedState = initializedState.copyWith(
        cartItems: [
          fakeCartItem.copyWith(
            bundle: fakeCartItem.bundle.copyWith(
              materials: bundleMaterials,
            ),
          )
        ],
        showErrorMessage: true,
      );
      expect(modifiedState.isBundleQuantitySatisfies, false);
    });

    test(' => getTotalQuantityOfProductBundle should return correct value', () {
      final modifiedState = initializedState.copyWith(
        cartItems: [
          fakeCartItem.copyWith(
            materialInfo: MaterialInfo.empty().copyWith(
              type: MaterialInfoType('bundle'),
            ),
            bundle: Bundle.empty().copyWith(
              bundleCode: 'test-code',
              materials: [
                MaterialInfo.empty().copyWith(
                  quantity: MaterialQty(1),
                ),
              ],
            ),
            stockInfoList: [StockInfo.empty()],
          ),
        ],
        showErrorMessage: true,
      );

      // getTotalQuantityOfProductBundle return value
      expect(
        modifiedState.getTotalQuantityOfProductBundle(
          bundleCode: 'test-code',
        ),
        1,
      );

      // getTotalQuantityOfProductBundle return value
      expect(
        modifiedState.getTotalQuantityOfProductBundle(
          bundleCode: 'wrong-test-code',
        ),
        0,
      );
    });

    test(' => isOOSOrderAllowedToSubmit should return correct value', () {
      // isOOSOrderAllowedToSubmit is false
      expect(initializedState.isOOSOrderAllowedToSubmit, false);

      // isOOSOrderAllowedToSubmit is true
      final modifiedState = initializedState.copyWith(
        configs: fakeEmptySalesConfigs.copyWith(
          addOosMaterials: OosMaterial(true),
          oosValue: OosValue(0),
        ),
      );
      expect(modifiedState.isOOSOrderAllowedToSubmit, true);
    });

    test(' => displayMWPNotAllowedWarning should return correct value', () {
      // displayMWPNotAllowedWarning is false
      expect(initializedState.displayMWPNotAllowedWarning, false);

      // displayMWPNotAllowedWarning is true
      final modifiedState = initializedState.copyWith(
        showErrorMessage: true,
        cartItems: [
          fakeCartItem.copyWith(
            price: Price.empty(),
            materialInfo: MaterialInfo.empty().copyWith(
              type: MaterialInfoType('material'),
            ),
          )
        ],
      );
      expect(modifiedState.displayMWPNotAllowedWarning, true);
    });

    test(' => cartContainsSuspendedMaterials should return correct value', () {
      // cartContainsSuspendedMaterials is false
      expect(initializedState.cartContainsSuspendedMaterials, false);

      // cartContainsSuspendedMaterials is true
      final modifiedState = initializedState.copyWith(
        showErrorMessage: true,
        cartItems: [
          fakeCartItem.copyWith(
            price: Price.empty(),
            materialInfo: MaterialInfo.empty().copyWith(
              type: MaterialInfoType('material'),
              isSuspended: true,
            ),
          )
        ],
      );
      expect(modifiedState.cartContainsSuspendedMaterials, true);
    });

    test(' => invalidMaterialCartItems should return correct value', () {
      // invalidMaterialCartItems is empty
      expect(initializedState.invalidMaterialCartItems, []);

      // invalidMaterialCartItems is not empty
      final cartProducts = mockMaterialsCartItems
          .map(
            (e) => e.copyWith(
              materialInfo: e.materialInfo.copyWith(
                type: MaterialInfoType('material'),
              ),
            ),
          )
          .toList();
      final eligibilityState = OrderEligibilityState.initial().copyWith(
        cartItems: cartProducts,
      );
      final invalidMaterials = cartProducts
          .map(
            (e) => e.materialInfo.copyWith(
              quantity: MaterialQty(0),
            ),
          )
          .toList();
      final materials = eligibilityState.invalidMaterialCartItems;
      expect(materials, invalidMaterials);
    });

    test(' => displayCartPagePriceMessage should return correct value', () {
      // displayCartPagePriceMessage is false
      expect(initializedState.displayCartPagePriceMessage, false);

      // displayCartPagePriceMessage is true
      final modifiedState = initializedState.copyWith(
        configs: fakeEmptySalesConfigs.copyWith(materialWithoutPrice: true),
        cartItems: [
          fakeCartItem.copyWith(
            price: Price.empty(),
            materialInfo: MaterialInfo.empty().copyWith(
              type: MaterialInfoType('material'),
              isSuspended: true,
            ),
          )
        ],
      );
      expect(modifiedState.displayCartPagePriceMessage, true);
    });

    test(' => invalidBundleCartItems should return correct value', () {
      // invalidBundleCartItems is empty
      expect(initializedState.invalidBundleCartItems, []);

      // invalidBundleCartItems is not empty
      final modifiedState = initializedState.copyWith(
        showErrorMessage: true,
        cartItems: [
          fakeCartItem.copyWith(
            materialInfo: MaterialInfo.empty().copyWith(
              type: MaterialInfoType('bundle'),
            ),
            bundle: Bundle.empty().copyWith(
              bundleCode: 'test-code',
              materials: [
                MaterialInfo.empty().copyWith(
                  quantity: MaterialQty(1),
                ),
              ],
            ),
            stockInfoList: [StockInfo.empty()],
          ),
        ],
      );
      expect(modifiedState.invalidBundleCartItems, [
        MaterialInfo.empty().copyWith(
          parentID: 'test-code',
        )
      ]);

      final changedState = initializedState.copyWith(
        showErrorMessage: true,
        cartItems: [
          fakeCartItem.copyWith(
            materialInfo: MaterialInfo.empty().copyWith(
              type: MaterialInfoType('bundle'),
            ),
            bundle: Bundle.empty().copyWith(
              bundleCode: 'test-code',
              materials: [
                MaterialInfo.empty().copyWith(
                  quantity: MaterialQty(1),
                  stockInfos: [
                    StockInfo.empty().copyWith(
                      inStock: MaterialInStock('Yes'),
                    )
                  ],
                  isSuspended: true,
                ),
              ],
            ),
            stockInfoList: [StockInfo.empty()],
          ),
        ],
      );
      expect(changedState.invalidBundleCartItems, [
        MaterialInfo.empty().copyWith(
          parentID: 'test-code',
          stockInfos: [
            StockInfo.empty().copyWith(
              inStock: MaterialInStock('Yes'),
            )
          ],
          isSuspended: true,
        )
      ]);
    });

    test(' => invalidCartItems should return correct value', () {
      // invalidCartItems is empty
      expect(initializedState.invalidCartItems, []);

      // invalidCartItems is not empty
      final cartProducts = mockMaterialsCartItems
          .map(
            (e) => e.copyWith(
              materialInfo: e.materialInfo.copyWith(
                type: MaterialInfoType('material'),
              ),
            ),
          )
          .toList();
      final eligibilityState = OrderEligibilityState.initial().copyWith(
        cartItems: cartProducts,
      );
      final invalidMaterials = cartProducts
          .map(
            (e) => e.materialInfo.copyWith(
              quantity: MaterialQty(0),
            ),
          )
          .toList();
      final materials = eligibilityState.invalidMaterialCartItems;
      expect(materials, invalidMaterials);
    });

    test(' => eligibleForOrderSubmit should return correct value', () {
      // eligibleForOrderSubmit is false
      expect(initializedState.eligibleForOrderSubmit, false);
      // eligibleForOrderSubmit is true
      final modifiedState = initializedState.copyWith(
        configs: fakeEmptySalesConfigs.copyWith(
          materialWithoutPrice: true,
          addOosMaterials: OosMaterial(true),
          oosValue: OosValue(0),
        ),
        orderType: 'ZPFC',
        cartItems: [
          fakeCartItem.copyWith(
            materialInfo: MaterialInfo.empty().copyWith(
              principalData: PrincipalData.empty().copyWith(
                principalCode: PrincipalCode('100225'),
              ),
              type: MaterialInfoType('material'),
            ),
            price: Price.empty(),
            stockInfoList: [StockInfo.empty()],
          ),
        ],
        grandTotal: 100,
      );
      expect(modifiedState.eligibleForOrderSubmit, true);
    });

    test(' => displayInvalidItemsBanner should return correct value', () {
      // displayInvalidItemsBanner is false
      expect(initializedState.displayInvalidItemsBanner, false);

      // displayInvalidItemsBanner is true
      final eligibilityState = OrderEligibilityState.initial().copyWith(
        cartItems: mockMaterialsCartItems,
      );
      expect(eligibilityState.displayInvalidItemsBanner, true);
    });

    test(' => cartContainsSuspendedPrincipal should return correct value', () {
      // cartContainsSuspendedMaterials is false
      expect(initializedState.cartContainsSuspendedPrincipal, false);

      // cartContainsSuspendedMaterials is true
      final modifiedState = initializedState.copyWith(
        showErrorMessage: true,
        cartItems: [mockMaterialsCartItems.last],
      );
      expect(modifiedState.cartContainsSuspendedPrincipal, true);
    });
  });
}

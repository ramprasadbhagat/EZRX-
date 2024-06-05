import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_local_datasource.dart';

import '../../../common_mock_data/sales_org_config_mock/fake_sg_sales_org_config.dart';
import '../../../common_mock_data/user_mock.dart';
import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_kh_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_th_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_ph_sales_org_config.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late OrderEligibilityState initializedState;
  late PriceAggregate fakeCartItem;
  late PriceAggregate fakeMPCartItem;
  late List<PriceAggregate> mockMaterialsCartItems;
  late List<PriceAggregate> fakeCart;
  group('Test OrderEligibilityState', () {
    setUpAll(() {
      final config = Config()..appFlavor = Flavor.uat;
      locator.registerSingleton(config);
    });

    setUp(
      () async {
        fakeCart = (await CartLocalDataSource().getAddedToCartProductList())
            .cartProducts;
        fakeCartItem =
            fakeCart.firstWhere((e) => e.materialInfo.type.typeMaterial);
        fakeMPCartItem =
            fakeCartItem.copyWith.materialInfo(isMarketPlace: true);
        initializedState = OrderEligibilityState.initial().copyWith(
          user: fakeExternalSalesRepUser,
          salesOrg: fakeMYSalesOrganisation,
          configs: fakeMYSalesOrgConfigs,
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
          fakeCartItem,
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
        configs: fakeKHSalesOrgConfigs.copyWith(
          addOosMaterials: OosMaterial(false),
        ),
      );
      expect(modifiedState.isOOSAllowedIfPresentInCart, false);
    });

    test(' => isBundleQuantitySatisfies should return correct value', () {
      // isBundleQuantitySatisfies is true
      expect(initializedState.isBundleQuantitySatisfies, true);

      // isBundleQuantitySatisfies is false
      final bundle = fakeCart.firstWhere((e) => e.materialInfo.type.typeBundle);
      final bundleMaterials = bundle.bundle.materials
          .map((e) => e.copyWith(quantity: MaterialQty(0)))
          .toList();
      final modifiedState = initializedState.copyWith(
        cartItems: [bundle.copyWith.bundle(materials: bundleMaterials)],
        showErrorMessage: true,
      );
      expect(modifiedState.isBundleQuantitySatisfies, false);
    });

    test(' => isOOSOrderAllowedToSubmit should return correct value', () {
      // isOOSOrderAllowedToSubmit is false
      expect(
        initializedState
            .copyWith(
              configs: fakeKHSalesOrgConfigs,
            )
            .isOOSOrderAllowedToSubmit,
        false,
      );

      // isOOSOrderAllowedToSubmit is true
      final modifiedState = initializedState.copyWith(
        configs: fakeMYSalesOrgConfigs.copyWith(
          oosValue: OosValue(0),
        ),
      );
      expect(modifiedState.isOOSOrderAllowedToSubmit, true);
    });

    test(' => displayMWPNotAllowedWarning should return correct value', () {
      // displayMWPNotAllowedWarning is false
      final state = initializedState.copyWith(
        configs: fakeTHSalesOrgConfigs,
      );
      expect(state.displayMWPNotAllowedWarning, false);

      // displayMWPNotAllowedWarning is true
      final modifiedState = initializedState.copyWith(
        configs: fakePHSalesOrgConfigs,
        showErrorMessage: true,
        cartItems: [
          fakeCartItem.copyWith(
            materialInfo: MaterialInfo.empty().copyWith(
              type: MaterialInfoType('material'),
            ),
          ),
        ],
      );
      expect(modifiedState.displayMWPNotAllowedWarning, true);
    });

    test(' => cartContainsSuspendedMaterials should return correct value', () {
      // cartContainsSuspendedMaterials is false
      expect(initializedState.cartContainsSuspendedMaterials, false);

      // cartContainsSuspendedMaterials is true
      final stateWithZPMaterial = initializedState.copyWith(
        showErrorMessage: true,
        cartItems: [
          fakeCartItem.copyWith(
            salesOrgConfig: fakeMYSalesOrgConfigs,
            materialInfo: MaterialInfo.empty().copyWith(
              type: MaterialInfoType.material(),
              isSuspended: true,
            ),
          ),
        ],
      );
      expect(stateWithZPMaterial.cartContainsSuspendedMaterials, true);

      // cartContainsSuspendedMaterials is true
      final stateWithMPMaterial = initializedState.copyWith(
        showErrorMessage: true,
        cartItems: [
          fakeCartItem.copyWith(
            salesOrgConfig: fakeSGSalesOrgConfigs,
            materialInfo: MaterialInfo.empty().copyWith(
              type: MaterialInfoType.material(),
              isSuspended: false,
              isMarketPlace: true,
            ),
          ),
        ],
      );
      expect(stateWithMPMaterial.cartContainsSuspendedMaterials, true);
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
      expect(initializedState.displayPriceNotAvailableMessage, false);

      // displayCartPagePriceMessage is true
      final modifiedState = initializedState.copyWith(
        cartItems: [
          fakeCartItem.copyWith(
            materialInfo: MaterialInfo.empty().copyWith(
              type: MaterialInfoType('material'),
              isSuspended: true,
            ),
          ),
        ],
      );
      expect(modifiedState.displayPriceNotAvailableMessage, true);
    });

    test(' => invalidBundleCartItems should return correct value', () {
      // invalidBundleCartItems is empty
      expect(initializedState.invalidBundleCartItems, []);

      // invalidBundleCartItems is not empty
      final modifiedState = initializedState.copyWith(
        configs: fakeKHSalesOrgConfigs.copyWith(
          addOosMaterials: OosMaterial(false),
        ),
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
        ),
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
                    ),
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
            ),
          ],
          isSuspended: true,
        ),
      ]);
    });

    test(' => isCheckoutDisabled should return correct value', () {
      // isCheckoutDisabled is false
      expect(initializedState.isCheckoutDisabled, true);
      // isCheckoutDisabled is true
      final modifiedState = initializedState.copyWith(
        orderType: 'ZPFC',
        cartItems: [
          fakeCartItem.copyWith(
            materialInfo: MaterialInfo.empty().copyWith(
              principalData: PrincipalData.empty().copyWith(
                principalCode: PrincipalCode('100225'),
              ),
              type: MaterialInfoType('material'),
            ),
            stockInfoList: [StockInfo.empty()],
          ),
        ],
        grandTotal: 100,
      );
      expect(modifiedState.isCheckoutDisabled, false);
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

    group('MOV validation -', () {
      test('zpSubtotalMOVEligible getter', () {
        //return true when there is no zp material
        expect(
          OrderEligibilityState.initial().copyWith(
            cartItems: [fakeMPCartItem],
          ).zpSubtotalMOVEligible,
          true,
        );

        //return true when zp material subtotal >= mov value
        expect(
          OrderEligibilityState.initial()
              .copyWith(
                configs: fakeMYSalesOrgConfigs,
                cartItems: [fakeCartItem],
                zpSubtotal: fakeMYSalesOrgConfigs.minOrderAmount,
              )
              .zpSubtotalMOVEligible,
          true,
        );

        //return false when zp material subtotal < mov value
        expect(
          OrderEligibilityState.initial()
              .copyWith(
                configs: fakeMYSalesOrgConfigs,
                cartItems: [fakeCartItem],
                zpSubtotal: fakeMYSalesOrgConfigs.minOrderAmount - 1,
              )
              .zpSubtotalMOVEligible,
          false,
        );
      });

      test('mpSubtotalMOVEligible getter', () {
        //return true when there is no mp material
        expect(
          OrderEligibilityState.initial().copyWith(
            cartItems: [fakeCartItem],
          ).mpSubtotalMOVEligible,
          true,
        );

        //return true when mp material subtotal >= mov value
        expect(
          OrderEligibilityState.initial()
              .copyWith(
                configs: fakeMYSalesOrgConfigs,
                cartItems: [fakeMPCartItem],
                mpSubtotal: fakeMYSalesOrgConfigs.mpMinOrderAmount,
              )
              .mpSubtotalMOVEligible,
          true,
        );

        //return false when mp material subtotal < mov value
        expect(
          OrderEligibilityState.initial()
              .copyWith(
                configs: fakeMYSalesOrgConfigs,
                cartItems: [fakeMPCartItem],
                mpSubtotal: fakeMYSalesOrgConfigs.mpMinOrderAmount - 1,
              )
              .mpSubtotalMOVEligible,
          false,
        );
      });

      group('isTotalGreaterThanMinOrderAmount getter -', () {
        test('when contains marketplace material', () {
          final stateWithMPMaterial = OrderEligibilityState.initial().copyWith(
            cartItems: [fakeMPCartItem, fakeCartItem],
            configs: fakeMYSalesOrgConfigs,
          );
          //return false when not satisfied zp MOV
          expect(
            stateWithMPMaterial
                .copyWith(
                  zpSubtotal: fakeMYSalesOrgConfigs.minOrderAmount - 1,
                  mpSubtotal: fakeMYSalesOrgConfigs.mpMinOrderAmount,
                )
                .isTotalGreaterThanMinOrderAmount,
            false,
          );

          //return false when not satisfied mp MOV
          expect(
            stateWithMPMaterial
                .copyWith(
                  zpSubtotal: fakeMYSalesOrgConfigs.minOrderAmount,
                  mpSubtotal: fakeMYSalesOrgConfigs.mpMinOrderAmount - 1,
                )
                .isTotalGreaterThanMinOrderAmount,
            false,
          );

          //return true when satisfied both mp MOV and zp MOV
          expect(
            stateWithMPMaterial
                .copyWith(
                  zpSubtotal: fakeMYSalesOrgConfigs.minOrderAmount,
                  mpSubtotal: fakeMYSalesOrgConfigs.mpMinOrderAmount,
                )
                .isTotalGreaterThanMinOrderAmount,
            true,
          );
        });

        test(
            'when contains only zp material && market required check mov on subtotal',
            () {
          final state = OrderEligibilityState.initial().copyWith(
            salesOrg: fakeSGSalesOrganisation,
            configs: fakeSGSalesOrgConfigs,
            cartItems: [fakeCartItem],
          );

          // return false when subtotal < mov
          expect(
            state
                .copyWith(subTotal: fakeSGSalesOrgConfigs.minOrderAmount - 1)
                .isTotalGreaterThanMinOrderAmount,
            false,
          );

          // return true when subtotal >= mov
          expect(
            state
                .copyWith(subTotal: fakeSGSalesOrgConfigs.minOrderAmount)
                .isTotalGreaterThanMinOrderAmount,
            true,
          );
        });

        test(
            'when contains only zp material && market not required check mov on subtotal',
            () {
          final state = OrderEligibilityState.initial().copyWith(
            salesOrg: fakeMYSalesOrganisation,
            configs: fakeMYSalesOrgConfigs,
            cartItems: [fakeCartItem],
          );

          // return false when grandTotal < mov
          expect(
            state
                .copyWith(
                  grandTotal: fakeMYSalesOrgConfigs.minOrderAmount - 1,
                )
                .isTotalGreaterThanMinOrderAmount,
            false,
          );

          // return true when grandTotal >= mov
          expect(
            state
                .copyWith(grandTotal: fakeMYSalesOrgConfigs.minOrderAmount)
                .isTotalGreaterThanMinOrderAmount,
            true,
          );
        });
      });
    });

    group('Small order fee validation -', () {
      final inStock = [
        StockInfo.empty().copyWith(inStock: MaterialInStock('Yes')),
      ];
      late final zpSmallOrderFeeEnableState =
          OrderEligibilityState.initial().copyWith(
        user: fakeClientUser,
        cartItems: [fakeCartItem],
        configs: fakeMYSalesOrgConfigsWithSmallOrderFee,
      );

      late final mpSmallOrderFeeEnableState =
          OrderEligibilityState.initial().copyWith(
        user: fakeClientUser,
        cartItems: [fakeMPCartItem],
        configs: fakeMYSalesOrgConfigsWithSmallOrderFee,
      );
      test('zpSmallOrderFeeEnable getter', () {
        expect(OrderEligibilityState.initial().zpSmallOrderFeeEnable, false);

        expect(
          OrderEligibilityState.initial().copyWith(
            cartItems: [fakeCartItem],
          ).zpSmallOrderFeeEnable,
          false,
        );

        expect(
          OrderEligibilityState.initial().copyWith(
            cartItems: [fakeCartItem],
            configs: fakeMYSalesOrgConfigs.copyWith(enableSmallOrderFee: true),
          ).zpSmallOrderFeeEnable,
          false,
        );

        expect(
          OrderEligibilityState.initial().copyWith(
            cartItems: [fakeCartItem],
            configs: fakeMYSalesOrgConfigs.copyWith(
              enableSmallOrderFee: true,
              smallOrderFeeUserRoles: ['Client User'],
            ),
          ).zpSmallOrderFeeEnable,
          false,
        );

        expect(zpSmallOrderFeeEnableState.zpSmallOrderFeeEnable, true);
      });

      test('mpSmallOrderFeeEnable getter', () {
        expect(OrderEligibilityState.initial().mpSmallOrderFeeEnable, false);

        expect(
          OrderEligibilityState.initial().copyWith(
            cartItems: [fakeMPCartItem],
          ).mpSmallOrderFeeEnable,
          false,
        );

        expect(
          OrderEligibilityState.initial().copyWith(
            cartItems: [fakeMPCartItem],
            configs:
                fakeMYSalesOrgConfigs.copyWith(enableMPSmallOrderFee: true),
          ).mpSmallOrderFeeEnable,
          false,
        );

        expect(
          OrderEligibilityState.initial().copyWith(
            cartItems: [fakeMPCartItem],
            configs: fakeMYSalesOrgConfigs.copyWith(
              enableMPSmallOrderFee: true,
              mpSmallOrderFeeUserRoles: ['Client User'],
            ),
          ).mpSmallOrderFeeEnable,
          false,
        );

        expect(mpSmallOrderFeeEnableState.mpSmallOrderFeeEnable, true);
      });

      test('displayAtLeastOneZPItemInStockWarning getter', () {
        expect(
          zpSmallOrderFeeEnableState.displayAtLeastOneZPItemInStockWarning,
          true,
        );

        expect(
          OrderEligibilityState.initial().displayAtLeastOneZPItemInStockWarning,
          false,
        );

        expect(
          zpSmallOrderFeeEnableState.copyWith(
            cartItems: [fakeCartItem.copyWith(stockInfoList: inStock)],
          ).displayAtLeastOneZPItemInStockWarning,
          false,
        );
      });

      test('displayAtLeastOneMPItemInStockWarning getter', () {
        expect(
          mpSmallOrderFeeEnableState.displayAtLeastOneMPItemInStockWarning,
          true,
        );

        expect(
          OrderEligibilityState.initial().displayAtLeastOneMPItemInStockWarning,
          false,
        );

        expect(
          mpSmallOrderFeeEnableState.copyWith(
            cartItems: [fakeMPCartItem.copyWith(stockInfoList: inStock)],
          ).displayAtLeastOneMPItemInStockWarning,
          false,
        );
      });

      test('zpSmallOrderFeeApplied getter', () {
        expect(OrderEligibilityState.initial().zpSmallOrderFeeApplied, false);

        expect(zpSmallOrderFeeEnableState.zpSmallOrderFeeApplied, false);

        expect(
          zpSmallOrderFeeEnableState.copyWith(
            cartItems: [
              fakeCartItem.copyWith(
                stockInfoList: inStock,
                price: Price.empty().copyWith(
                  finalPrice: MaterialPrice(
                    fakeMYSalesOrgConfigsWithSmallOrderFee.sapMinOrderAmount,
                  ),
                ),
              ),
            ],
          ).zpSmallOrderFeeApplied,
          false,
        );

        expect(
          zpSmallOrderFeeEnableState.copyWith(
            cartItems: [
              fakeCartItem.copyWith(stockInfoList: inStock, quantity: 0),
            ],
          ).zpSmallOrderFeeApplied,
          true,
        );
      });

      test('mpSmallOrderFeeApplied getter', () {
        expect(OrderEligibilityState.initial().mpSmallOrderFeeApplied, false);

        expect(mpSmallOrderFeeEnableState.mpSmallOrderFeeApplied, false);

        expect(
          mpSmallOrderFeeEnableState.copyWith(
            cartItems: [
              fakeMPCartItem.copyWith(
                stockInfoList: inStock,
                price: Price.empty().copyWith(
                  finalPrice: MaterialPrice(
                    fakeMYSalesOrgConfigsWithSmallOrderFee.mpSAPMinOrderAmount,
                  ),
                ),
              ),
            ],
          ).mpSmallOrderFeeApplied,
          false,
        );

        expect(
          mpSmallOrderFeeEnableState.copyWith(
            cartItems: [
              fakeMPCartItem.copyWith(stockInfoList: inStock, quantity: 0),
            ],
          ).mpSmallOrderFeeApplied,
          true,
        );
      });
    });
  });
}

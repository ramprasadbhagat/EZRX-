import 'package:ezrxmobile/domain/order/entities/bundle_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/price_tier.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/entities/material_price_detail.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_item.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';

void main() {
  group('Cart Item Test', () {
    final emptyPriceAggregate = PriceAggregate.empty();
    final priceAggregateList = [
      emptyPriceAggregate,
      emptyPriceAggregate,
      emptyPriceAggregate,
    ];
    final emptyBundle = Bundle.empty();
    final emptyMaterial = MaterialItem.empty();
    final emptySalesConfigs = SalesOrganisationConfigs.empty();
    final emptyMaterialPriceDetail = MaterialPriceDetail.empty();
    final priceDetailMap = {
      MaterialQueryInfo.empty(): emptyMaterialPriceDetail,
    };

    test(
      'returns correct cartItem object',
      () {
        final cartItem = CartItem(
          materials: priceAggregateList,
          itemType: CartItemType.bundle,
          isSelected: false,
        );

        expect(cartItem.materials, priceAggregateList);
        expect(cartItem.itemType, CartItemType.bundle);
        expect(cartItem.isSelected, false);
      },
    );

    test(
      'CartItem.material',
      () {
        final cartItemMaterial = CartItem.material(emptyPriceAggregate);

        expect(cartItemMaterial.materials, [emptyPriceAggregate]);
        expect(cartItemMaterial.itemType, CartItemType.material);
      },
    );

    test(
      'CartItem.materialEmpty',
      () {
        final cartItemMaterialEmpty = CartItem.materialEmpty();

        expect(cartItemMaterialEmpty.materials, [emptyPriceAggregate]);
        expect(cartItemMaterialEmpty.itemType, CartItemType.material);
      },
    );

    test(
      'CartItem.bundle',
      () {
        final cartItemBundle = CartItem.bundle(priceAggregateList);
        expect(cartItemBundle.materials, priceAggregateList);
        expect(cartItemBundle.itemType, CartItemType.bundle);
      },
    );

    test('CartItem.materialFromOrder', () {
      final cartItem = CartItem.materialFromOrder(
        priceDetailMap: priceDetailMap,
        material: emptyMaterial,
        salesConfigs: emptySalesConfigs,
        tenderContractMap: {},
      );
      expect(cartItem.materials.length, 1);
      expect(cartItem.itemType, CartItemType.material);
      final priceAggregate = cartItem.materials.first;
      expect(priceAggregate.price, Price.empty());
      expect(priceAggregate.materialInfo, emptyMaterialPriceDetail.info);
      expect(priceAggregate.bundle, emptyBundle);
      expect(priceAggregate.salesOrgConfig, emptySalesConfigs);
      expect(priceAggregate.quantity, 0);
      expect(priceAggregate.discountedMaterialCount, 0);
      expect(priceAggregate.addedBonusList, []);
      expect(priceAggregate.stockInfo, StockInfo.empty());
      expect(priceAggregate.tenderContract, TenderContract.empty());
    });

    test('CartItem.bundleFromOrder', () {
      final cartItem = CartItem.bundleFromOrder(
        priceDetailMap: priceDetailMap,
        savedItem: emptyMaterial,
        salesConfigs: emptySalesConfigs,
      );
      expect(cartItem.materials.isEmpty, true);
      expect(cartItem.itemType, CartItemType.bundle);
    });

    test('CartItem.copyWithStockInfo', () {
      final cartItem = CartItem(
        materials: [
          PriceAggregate.empty().copyWith(
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('5'),
            ),
          ),
          PriceAggregate.empty().copyWith(
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('10'),
            ),
          ),
        ],
        itemType: CartItemType.material,
      );
      final stockInfoMap = {
        MaterialNumber('5'): [
          StockInfo.empty().copyWith(
            materialNumber: MaterialNumber('5'),
            salesDistrict: 'Dist 0',
          )
        ],
        MaterialNumber('10'): [
          StockInfo.empty().copyWith(
            materialNumber: MaterialNumber('10'),
            salesDistrict: 'Dist 1',
          )
        ],
      };
      final newCartItem = cartItem.copyWithStockInfo(
        stockInfoMap: stockInfoMap,
        salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
      );

      expect(newCartItem.materials[0].getMaterialNumber.getOrCrash(), '5');
      expect(newCartItem.materials[0].stockInfo.salesDistrict, 'Dist 0');
      expect(newCartItem.materials[1].getMaterialNumber.getOrCrash(), '10');
      expect(newCartItem.materials[1].stockInfo.salesDistrict, 'Dist 1');
    });

    test('CartItem.copyWithInStockOnly', () {
      final cartItem = CartItem(
        materials: [
          PriceAggregate.empty().copyWith(
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('5'),
            ),
            stockInfo: StockInfo.empty().copyWith(
              inStock: MaterialInStock('Yes'),
            ),
          ),
          PriceAggregate.empty().copyWith(
            materialInfo: MaterialInfo.empty().copyWith(
              materialNumber: MaterialNumber('10'),
            ),
            stockInfo: StockInfo.empty().copyWith(
              inStock: MaterialInStock(''),
            ),
          ),
        ],
        itemType: CartItemType.material,
      );
      final newCartItem = cartItem.copyWithInStockOnly(allowOutOfStock: false);

      expect(newCartItem.materials.length, 1);
      expect(newCartItem.materials[0].getMaterialNumber.getOrCrash(), '5');

      final newCartItem2 = cartItem.copyWithInStockOnly(allowOutOfStock: true);

      expect(newCartItem2.materials.length, 2);
      expect(newCartItem2.materials[0].getMaterialNumber.getOrCrash(), '5');
      expect(newCartItem2.materials[1].getMaterialNumber.getOrCrash(), '10');
    });

    test('CartItem.copyWithSelectSwitched', () {
      final cartItem = CartItem(
        materials: priceAggregateList,
        itemType: CartItemType.material,
        isSelected: false,
      );

      final copiedCartItem = cartItem.copyWithSelectSwitched;
      expect(copiedCartItem.isSelected, true);
      expect(copiedCartItem.materials, cartItem.materials);
    });

    test('get id returns correct value', () {
      // Create a CartItem with a material
      var itemType = CartItemType.material;
      var cartItem =
          CartItem(materials: priceAggregateList, itemType: itemType);
      expect(cartItem.id, '');

      // Create a CartItem with a bundle
      itemType = CartItemType.bundle;
      cartItem = CartItem(materials: priceAggregateList, itemType: itemType);
      expect(cartItem.id, '');

      // Create a CartItem with empty materials
      itemType = CartItemType.material;
      cartItem = CartItem(materials: [], itemType: itemType);
      expect(cartItem.id, '');
    });

    test('unitPrice from CartItem', () {
      // Create a CartItem with a material
      var cartItem = CartItem(
        materials: [
          emptyPriceAggregate.copyWith(
            tenderContract: TenderContract.empty().copyWith(
              tenderPrice: TenderPrice('40'),
              pricingUnit: 2,
            ),
            price: Price.empty().copyWith(
              zmgDiscount: true,
              tiers: [
                PriceTier.empty().copyWith(items: [PriceTierItem.empty()])
              ],
            ),
          ),
          emptyPriceAggregate.copyWith(
            tenderContract: TenderContract.empty().copyWith(
              tenderPrice: TenderPrice('10'),
              pricingUnit: 3,
            ),
            price: Price.empty().copyWith(
              zmgDiscount: true,
              tiers: [
                PriceTier.empty().copyWith(items: [PriceTierItem.empty()])
              ],
            ),
          ),
        ],
        itemType: CartItemType.material,
      );
      expect(cartItem.unitPrice, 20.0);

      // Create a CartItem with a bundle
      cartItem = CartItem(
        materials: [
          emptyPriceAggregate.copyWith(
            quantity: 25,
            bundle: emptyBundle.copyWith(
              bundleInformation: [
                BundleInfo.empty().copyWith(
                  quantity: 10,
                  rate: 50,
                ),
                BundleInfo.empty().copyWith(
                  quantity: 5,
                  rate: 100,
                ),
              ],
            ),
          ),
          emptyPriceAggregate.copyWith(
            quantity: 30,
            bundle: emptyBundle.copyWith(
              bundleInformation: [
                BundleInfo.empty().copyWith(
                  quantity: 15,
                  rate: 60,
                ),
                BundleInfo.empty().copyWith(
                  quantity: 10,
                  rate: 150,
                ),
              ],
            ),
          ),
        ],
        itemType: CartItemType.bundle,
      );
      expect(cartItem.unitPrice, 100);

      // Create a CartItem with empty materials
      cartItem = const CartItem(materials: [], itemType: CartItemType.material);
      expect(cartItem.unitPrice, 0);
    });

    test('listPrice from CartItem', () {
      //for empty materials
      const emptyCartItem =
          CartItem(materials: [], itemType: CartItemType.material);
      expect(emptyCartItem.listPrice, 0);

      //for non empty materials
      final cartItem = CartItem(
        materials: [
          emptyPriceAggregate.copyWith(
            tenderContract: TenderContract.empty().copyWith(
              tenderPrice: TenderPrice('40'),
              pricingUnit: 2,
            ),
            price: Price.empty().copyWith(
              lastPrice: MaterialPrice(20.0),
              zmgDiscount: true,
              tiers: [
                PriceTier.empty().copyWith(items: [PriceTierItem.empty()])
              ],
            ),
          ),
        ],
        itemType: CartItemType.material,
      );

      expect(cartItem.listPrice, 20.0);
    });

    test('totalQty returns correct value', () {
      final cartItem = CartItem(
        itemType: CartItemType.bundle,
        materials: [emptyPriceAggregate, emptyPriceAggregate],
      );
      expect(cartItem.totalQty, 2);
    });

    test('test toSavedOrderMaterial method', () {
      final cartItem1 = CartItem(
        itemType: CartItemType.material,
        materials: [
          emptyPriceAggregate.copyWith(
            quantity: 10,
          ),
          emptyPriceAggregate.copyWith(
            quantity: 20,
          ),
        ],
      );

      final cartItem2 = CartItem(
        itemType: CartItemType.bundle,
        materials: [
          emptyPriceAggregate.copyWith(
            quantity: 10,
          ),
          emptyPriceAggregate.copyWith(
            quantity: 20,
          ),
        ],
      );

      final savedOrderMaterial1 = cartItem1.toSavedOrderMaterial();
      expect(savedOrderMaterial1.length, 2);
      expect(
        savedOrderMaterial1[0],
        emptyPriceAggregate
            .copyWith(
              quantity: 10,
            )
            .toSavedOrderMaterial(),
      );
      expect(
        savedOrderMaterial1[1],
        emptyPriceAggregate
            .copyWith(
              quantity: 20,
            )
            .toSavedOrderMaterial(),
      );

      final savedOrderMaterial2 = cartItem2.toSavedOrderMaterial();
      expect(savedOrderMaterial2.length, 1);
      expect(savedOrderMaterial2[0].materials.length, 2);
      expect(
        savedOrderMaterial2[0].bundleName,
        emptyPriceAggregate.bundle.bundleName.getValue(),
      );
      expect(
        savedOrderMaterial2[0].bundleCode,
        emptyPriceAggregate.bundle.bundleCode,
      );
      expect(
        savedOrderMaterial2[0].bundleInformation,
        emptyPriceAggregate.bundle.bundleInformation,
      );
      expect(savedOrderMaterial2[0].totalQuantity, cartItem2.totalQty);
      expect(savedOrderMaterial2[0].type, MaterialItemType('Bundle'));
    });

    test('allOutOfStock for List<CartItem>', () {
      final cartList = [
        CartItem.materialEmpty(),
        CartItem.materialEmpty(),
        CartItem.materialEmpty(),
      ];

      expect(cartList.allOutOfStock(allowOutOfStock: true), false);
    });

    group('- Grand total', () {
      test('- Bundle type', () {
        final cartItem = CartItem.bundle(
          [
            emptyPriceAggregate.copyWith(
              quantity: 25,
              bundle: emptyBundle.copyWith(
                bundleInformation: [
                  BundleInfo.empty().copyWith(
                    quantity: 10,
                    rate: 50,
                  ),
                  BundleInfo.empty().copyWith(
                    quantity: 5,
                    rate: 100,
                  ),
                ],
              ),
            ),
            emptyPriceAggregate.copyWith(
              quantity: 30,
              bundle: emptyBundle.copyWith(
                bundleInformation: [
                  BundleInfo.empty().copyWith(
                    quantity: 15,
                    rate: 60,
                  ),
                  BundleInfo.empty().copyWith(
                    quantity: 10,
                    rate: 150,
                  ),
                ],
              ),
            ),
          ],
        );
        expect(cartItem.grandTotalPrice(), 5500.0);
      });
      test('- Material type', () {
        final cartItem = CartItem.material(
          emptyPriceAggregate.copyWith(
            tenderContract: TenderContract.empty().copyWith(
              tenderPrice: TenderPrice('40'),
              pricingUnit: 2,
            ),
            price: Price.empty().copyWith(
              zmgDiscount: true,
              tiers: [
                PriceTier.empty().copyWith(items: [PriceTierItem.empty()])
              ],
            ),
          ),
        );
        expect(cartItem.grandTotalPrice(), 20.0);
      });

      test('- Material type with PnG enabled', () {
        final cartItem = CartItem.material(
          emptyPriceAggregate.copyWith(
            materialInfo: MaterialInfo.empty().copyWith(hidePrice: true),
            price: Price.empty().copyWith(
              finalPrice: MaterialPrice(10),
              finalTotalPrice: MaterialPrice(10),
              lastPrice: MaterialPrice(10),
            ),
          ),
        );
        expect(cartItem.grandTotalPrice(), 0);
      });
    });

    group('- Sub total', () {
      test('- Material type', () {
        final cartItem = CartItem.material(
          emptyPriceAggregate.copyWith(
            tenderContract: TenderContract.empty().copyWith(
              tenderPrice: TenderPrice('40'),
              pricingUnit: 2,
            ),
            price: Price.empty().copyWith(
              zmgDiscount: true,
              tiers: [
                PriceTier.empty().copyWith(items: [PriceTierItem.empty()])
              ],
            ),
          ),
        );
        expect(cartItem.subTotalPrice(), 20.0);
      });

      test('- Material type with PnG enabled', () {
        final cartItem = CartItem.material(
          emptyPriceAggregate.copyWith(
            materialInfo: MaterialInfo.empty().copyWith(hidePrice: true),
            price: Price.empty().copyWith(
              finalPrice: MaterialPrice(10),
              finalTotalPrice: MaterialPrice(10),
              lastPrice: MaterialPrice(10),
            ),
          ),
        );
        expect(cartItem.subTotalPrice(), 0);
      });
      test('- Bundle type', () {
        final cartItem = CartItem.bundle(
          [
            emptyPriceAggregate.copyWith(
              quantity: 25,
              bundle: emptyBundle.copyWith(
                bundleInformation: [
                  BundleInfo.empty().copyWith(
                    quantity: 10,
                    rate: 50,
                  ),
                  BundleInfo.empty().copyWith(
                    quantity: 5,
                    rate: 100,
                  ),
                ],
              ),
            ),
            emptyPriceAggregate.copyWith(
              quantity: 30,
              bundle: emptyBundle.copyWith(
                bundleInformation: [
                  BundleInfo.empty().copyWith(
                    quantity: 15,
                    rate: 60,
                  ),
                  BundleInfo.empty().copyWith(
                    quantity: 10,
                    rate: 150,
                  ),
                ],
              ),
            ),
          ],
        );
        expect(cartItem.subTotalPrice(), 5500.0);
      });
    });
  });
}

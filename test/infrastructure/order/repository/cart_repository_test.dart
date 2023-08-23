import 'dart:ui';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs_principal.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_item_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/price_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/price_tier.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_remote_datasource.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/discount_override_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_item_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_item_remote.dart';
import 'package:ezrxmobile/infrastructure/order/repository/cart_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'order_history_repository_test.dart';
import 'order_repository_test.dart';

class MockConfig extends Mock implements Config {}

class StockInfoRemoteDataSourceMock extends Mock
    implements StockInfoRemoteDataSource {}

class CartLocalDataSourceMock extends Mock implements CartLocalDataSource {}

class CartRemoteDataSourceMock extends Mock implements CartRemoteDataSource {}

class DiscountOverrideRemoteDataSourceMock extends Mock
    implements DiscountOverrideRemoteDataSource {}

class StockInfoLocalDataSourceMock extends Mock
    implements StockInfoLocalDataSource {}

void main() {
  late Config mockConfig;
  late StockInfoLocalDataSourceMock stockInfoLocalDataSource;
  late StockInfoRemoteDataSourceMock stockInfoRemoteDataSource;
  late CartLocalDataSourceMock cartLocalDataSourceMock;
  late DiscountOverrideRemoteDataSource discountOverrideRemoteDataSourceMock;
  late CartRepository cartRepository;
  late CartItem fakeCartItem;
  late SalesOrganisationConfigs mockSalesOrganisationConfigs;
  late SalesOrg mockSalesOrg;
  late SalesOrganisation mockSalesOrganisation;
  late MixpanelService mixpanelService;
  late CartRemoteDataSource cartRemoteDataSource;
  late ViewByItemLocalDataSource orderHistoryLocalDataSource;
  late OrderHistoryRemoteDataSource orderHistoryRemoteDataSource;

  final fakeShipToInfo = ShipToInfo.empty().copyWith(
    shipToCustomerCode: '1234567',
    status: Status('fake_status'),
  );
  final fakeCustomerCodeInfo = CustomerCodeInfo.empty().copyWith(
    customerCodeSoldTo: '100000345',
    customerAttr7: CustomerAttr7('ZEV'),
    customerGrp4: CustomerGrp4('VR'),
    status: Status('fake_status'),
  );

  setUpAll(() {
    mockConfig = MockConfig();
    when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
    stockInfoLocalDataSource = StockInfoLocalDataSourceMock();
    stockInfoRemoteDataSource = StockInfoRemoteDataSourceMock();
    cartLocalDataSourceMock = CartLocalDataSourceMock();
    discountOverrideRemoteDataSourceMock =
        DiscountOverrideRemoteDataSourceMock();
    mixpanelService = MixpanelServiceMock();
    cartRemoteDataSource = CartRemoteDataSourceMock();
    orderHistoryLocalDataSource = OrderHistoryLocalDataSourceMock();
    orderHistoryRemoteDataSource = OrderHistoryRemoteDataSourceMock();
    cartRepository = CartRepository(
      mixpanelService: mixpanelService,
      cartLocalDataSource: cartLocalDataSourceMock,
      discountOverrideRemoteDataSource: discountOverrideRemoteDataSourceMock,
      config: mockConfig,
      stockInfoLocalDataSource: stockInfoLocalDataSource,
      stockInfoRemoteDataSource: stockInfoRemoteDataSource,
      cartRemoteDataSource: cartRemoteDataSource,
      viewByItemLocalDataSource: orderHistoryLocalDataSource,
      orderHistoryRemoteDataSource: orderHistoryRemoteDataSource,
    );
    mockSalesOrg = SalesOrg('2601');
    mockSalesOrganisation = SalesOrganisation.empty().copyWith(
      salesOrg: mockSalesOrg,
    );
    mockSalesOrganisationConfigs = SalesOrganisationConfigs.empty().copyWith(
      languageFilter: true,
      languageValue: const Locale(ApiLanguageCode.english),
      disablePrincipals: false,
      enableGimmickMaterial: true,
      principalList: [
        SalesOrganisationConfigsPrincipal.empty()
            .copyWith(principalCode: PrincipalCode('123')),
        SalesOrganisationConfigsPrincipal.empty()
            .copyWith(principalCode: PrincipalCode('234')),
        SalesOrganisationConfigsPrincipal.empty()
            .copyWith(principalCode: PrincipalCode('345')),
      ],
      currency: Currency('SG'),
      salesOrg: mockSalesOrg,
    );

    fakeCartItem = CartItem(
      itemType: CartItemType.material,
      materials: [
        PriceAggregate.empty().copyWith(
          salesOrgConfig: mockSalesOrganisationConfigs,
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('1'),
          ),
        ),
      ],
      isSelected: true,
    );

    when(
      () => stockInfoLocalDataSource.getStockInfo(),
    ).thenAnswer(
      (invocation) async => StockInfo.empty(),
    );

    when(
      () => stockInfoLocalDataSource.getStockInfoList(),
    ).thenAnswer(
      (invocation) async => [
        StockInfo.empty().copyWith(
          materialNumber: MaterialNumber('1234'),
          inStock: MaterialInStock('Yes'),
        ),
      ],
    );

    when(
      () => stockInfoRemoteDataSource.getStockInfo(
        materialNumber: fakeCartItem.materials.first.materialNumberString,
        salesOrg: mockSalesOrganisation.salesOrg.getOrCrash(),
        selectedCustomerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
      ),
    ).thenAnswer(
      (invocation) async => StockInfo.empty(),
    );

    when(
      () => stockInfoRemoteDataSource.getStockInfoList(
        materialNumber: fakeCartItem.materials.first.materialNumberString,
        salesOrg: mockSalesOrganisation.salesOrg.getOrCrash(),
        selectedCustomerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
        plant: fakeShipToInfo.plant,
      ),
    ).thenAnswer(
      (invocation) async => [StockInfo.empty()],
    );
  });

  test('Test Clear Cart - Success', () async {
    final result = await cartRepository.clearCart();
    expect(result.isRight(), true);
  });

  // test('Test Clear Cart - Failure', () async {
  //   when(
  //     () => cartRemoteDataSource.deleteCart(),
  //   ).thenThrow(
  //     (invocation) async => MockException(),
  //   );

  //   final result = await cartRepository.clearCart();
  //   expect(result.isLeft(), true);
  // });

  test('Test Update Material Deal Bonus - Success', () async {
    when(
      () => stockInfoLocalDataSource.getStockInfo(),
    ).thenAnswer(
      (invocation) async => StockInfo.empty().copyWith(
        materialNumber: MaterialNumber('1234'),
        inStock: MaterialInStock('Yes'),
      ),
    );

    final materials = [...fakeCartItem.materials];
    final material = materials.first.copyWith(
      materialInfo: MaterialInfo.empty().copyWith(
        materialNumber: MaterialNumber('1234'),
      ),
      price: Price.empty().copyWith(
        bonuses: [
          PriceBonus.empty().copyWith(
            items: [
              PriceBonusItem.empty().copyWith(
                bonusMaterials: [
                  BonusMaterial.empty().copyWith(
                    bonusQuantity: 1,
                    qualifyingQuantity: 1,
                    materialNumber: MaterialNumber(
                      '1234',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      addedBonusList: [
        MaterialItemBonus.empty().copyWith(
          additionalBonusFlag: true,
        ),
      ],
    );
    materials.replaceRange(0, 1, [material]);

    final result = await cartRepository.updateMaterialDealBonus(
      materials: materials,
      shipToInfo: fakeShipToInfo,
      salesOrganisation: mockSalesOrganisation,
      customerCodeInfo: fakeCustomerCodeInfo,
      salesOrganisationConfigs: mockSalesOrganisationConfigs.copyWith(
        enableBatchNumber: false,
      ),
    );
    if (result.isRight()) {
      result.fold((l) => {}, (r) {
        expect(
          r.first.addedBonusList.length !=
              fakeCartItem.materials.first.addedBonusList.length,
          true,
        );
      });
    }
  });

  test('Test Update Material Deal Bonus - Failure', () async {
    when(
      () => stockInfoLocalDataSource.getStockInfo(),
    ).thenAnswer(
      (invocation) async => StockInfo.empty().copyWith(
        materialNumber: MaterialNumber('1234'),
        inStock: MaterialInStock('Yes'),
      ),
    );

    final result = await cartRepository.updateMaterialDealBonus(
      materials: fakeCartItem.materials,
      shipToInfo: fakeShipToInfo,
      salesOrganisation: mockSalesOrganisation,
      customerCodeInfo: fakeCustomerCodeInfo,
      salesOrganisationConfigs: mockSalesOrganisationConfigs,
    );
    if (result.isRight()) {
      result.fold((l) => {}, (r) {
        expect(
          r.first.addedBonusList.length !=
              fakeCartItem.materials.first.addedBonusList.length,
          false,
        );
      });
    }
  });

  test('Test Update Discount Qty Material - Success', () async {
    final result = cartRepository.updateDiscountQty(
      items: [fakeCartItem],
    );
    expect(result, [fakeCartItem]);
  });

  test('Test Update Discount Qty Material - zmgDiscount - true - Success',
      () async {
    final result = cartRepository.updateDiscountQty(
      items: [
        fakeCartItem.copyWith(
          materials: [
            fakeCartItem.materials.first.copyWith(
              price: Price.empty().copyWith(
                zmgDiscount: true,
              ),
            ),
          ],
        )
      ],
    );
    expect(result, [
      fakeCartItem.copyWith(
        materials: [
          fakeCartItem.materials.first.copyWith(
            discountedMaterialCount: 1,
            price: Price.empty().copyWith(
              zmgDiscount: true,
            ),
          ),
        ],
      ),
    ]);
  });

  test(
      'Test Update Discount Qty Material - isTireDiscountEligible - true - Success',
      () async {
    final result = cartRepository.updateDiscountQty(
      items: [
        fakeCartItem.copyWith(
          materials: [
            fakeCartItem.materials.first.copyWith(
              price: Price.empty().copyWith(
                tiers: [
                  PriceTier.empty(),
                ],
              ),
            ),
          ],
        )
      ],
    );
    expect(result, [
      fakeCartItem.copyWith(
        materials: [
          fakeCartItem.materials.first.copyWith(
            discountedMaterialCount: 1,
            price: Price.empty().copyWith(
              tiers: [
                PriceTier.empty(),
              ],
            ),
          ),
        ],
      ),
    ]);
  });

  test('Test Update Discount Qty Bundle - Success', () async {
    final result = cartRepository.updateDiscountQty(
      items: [
        fakeCartItem.copyWith(
          itemType: CartItemType.bundle,
          materials: [
            fakeCartItem.materials.first.copyWith(
              bundle: Bundle.empty().copyWith(bundleCode: '1'),
            ),
          ],
        ),
      ],
    );
    expect(result, [
      fakeCartItem.copyWith(
        itemType: CartItemType.bundle,
        materials: [
          fakeCartItem.materials.first.copyWith(
            bundle: Bundle.empty().copyWith(bundleCode: '1'),
          ),
        ],
      ),
    ]);
  });

  test('Test Get Stock Info - Success', () async {
    final result = await cartRepository.getStockInfo(
      salesOrganisationConfigs: mockSalesOrganisationConfigs,
      customerCodeInfo: fakeCustomerCodeInfo,
      salesOrganisation: mockSalesOrganisation,
      shipToInfo: fakeShipToInfo,
      material: fakeCartItem.materials.first.materialInfo,
    );
    expect(result.isRight(), true);
  });

  test('Test Get Stock Info - UAT - Success', () async {
    when(
      () => stockInfoLocalDataSource.getStockInfo(),
    ).thenAnswer(
      (invocation) async => StockInfo.empty(),
    );

    when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

    final result = await cartRepository.getStockInfo(
      salesOrganisationConfigs: mockSalesOrganisationConfigs,
      customerCodeInfo: fakeCustomerCodeInfo,
      salesOrganisation: mockSalesOrganisation,
      shipToInfo: fakeShipToInfo,
      material: fakeCartItem.materials.first.materialInfo,
    );
    expect(result.isRight(), true);
  });

  test('Test Get Stock Info - UAT - Failure', () async {
    when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
    when(
      () => stockInfoRemoteDataSource.getStockInfo(
        materialNumber: fakeCartItem.materials.first.materialNumberString,
        salesOrg: mockSalesOrganisation.salesOrg.getOrCrash(),
        selectedCustomerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
      ),
    ).thenThrow(
      (invocation) async => MockException(),
    );

    final result = await cartRepository.getStockInfo(
      salesOrganisationConfigs: mockSalesOrganisationConfigs,
      customerCodeInfo: fakeCustomerCodeInfo,
      salesOrganisation: mockSalesOrganisation,
      shipToInfo: fakeShipToInfo,
      material: fakeCartItem.materials.first.materialInfo,
    );
    expect(result.isLeft(), true);
  });

  test('Test Get Stock Info - Failure', () async {
    when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
    when(
      () => stockInfoLocalDataSource.getStockInfo(),
    ).thenThrow(
      (invocation) async => MockException(),
    );

    final result = await cartRepository.getStockInfo(
      salesOrganisationConfigs: mockSalesOrganisationConfigs,
      customerCodeInfo: fakeCustomerCodeInfo,
      salesOrganisation: mockSalesOrganisation,
      shipToInfo: fakeShipToInfo,
      material: fakeCartItem.materials.first.materialInfo,
    );
    expect(result.isLeft(), true);
  });

  test('Test Get Stock Info enableBatchNumber - Success', () async {
    final result = await cartRepository.getStockInfo(
      salesOrganisationConfigs: mockSalesOrganisationConfigs.copyWith(
        enableBatchNumber: true,
      ),
      customerCodeInfo: fakeCustomerCodeInfo,
      salesOrganisation: mockSalesOrganisation,
      shipToInfo: fakeShipToInfo,
      material: fakeCartItem.materials.first.materialInfo,
    );
    expect(result.isRight(), true);
  });

  test('Test Get Stock Info enableBatchNumber - UAT - Success', () async {
    when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

    final result = await cartRepository.getStockInfo(
      salesOrganisationConfigs: mockSalesOrganisationConfigs.copyWith(
        enableBatchNumber: true,
      ),
      customerCodeInfo: fakeCustomerCodeInfo,
      salesOrganisation: mockSalesOrganisation,
      shipToInfo: fakeShipToInfo,
      material: fakeCartItem.materials.first.materialInfo,
    );
    expect(result.isRight(), true);
  });
}

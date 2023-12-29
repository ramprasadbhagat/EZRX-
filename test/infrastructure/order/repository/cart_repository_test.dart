import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs_principal.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/core/error/failure_handler.dart';
import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/apl_simulator_order.dart';
import 'package:ezrxmobile/domain/order/entities/bonus_sample_item.dart';
import 'package:ezrxmobile/domain/order/entities/cart_product_request.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/price_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/product_meta_data.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/order/repository/cart_repository.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_item_local.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/cart_product_request_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/combo_product_request_dto.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/view_by_item_remote.dart';
import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/discount_override_remote.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_remote_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/user_mock.dart';
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

class ViewByItemRemoteDataSourceMock extends Mock
    implements ViewByItemRemoteDataSource {}

class ViewByItemLocalDataSourceMock extends Mock
    implements ViewByItemLocalDataSource {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late Config mockConfig;
  late StockInfoLocalDataSourceMock stockInfoLocalDataSource;
  late StockInfoRemoteDataSourceMock stockInfoRemoteDataSource;
  late CartLocalDataSourceMock cartLocalDataSourceMock;
  late DiscountOverrideRemoteDataSource discountOverrideRemoteDataSourceMock;
  late CartRepository cartRepository;
  late SalesOrganisationConfigs mockSalesOrganisationConfigs;
  late MixpanelService mixpanelService;
  late CartRemoteDataSource cartRemoteDataSource;
  late ViewByItemLocalDataSource orderHistoryLocalDataSource;
  late ViewByItemRemoteDataSource viewByItemRemoteDataSource;
  late AplSimulatorOrder aplSimulatorOrder;
  late AplSimulatorOrder aplSimulatorGetTotalPrice;

  final fakeCartProducts = [
    PriceAggregate.empty().copyWith(
      salesOrgConfig: fakeSalesOrganisationConfigs,
      materialInfo: MaterialInfo.empty().copyWith(
        materialNumber: MaterialNumber('1'),
        quantity: MaterialQty(5),
        counterOfferDetails: RequestCounterOfferDetails.empty().copyWith(
          comment: StringValue('fakeComment'),
          counterOfferCurrency: Currency('MYR'),
        ),
        sampleBonusItemId: 'fakeSampleBonusItemId',
        type: MaterialInfoType('material'),
        parentID: 'fakeSampleBonusItemId',
      ),
    ),
  ];
  final fakeCartProductsWithCombo = <PriceAggregate>[];
  final fakeException = Exception('fake_error');

  setUpAll(() async {
    mockConfig = MockConfig();
    when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
    stockInfoLocalDataSource = StockInfoLocalDataSourceMock();
    stockInfoRemoteDataSource = StockInfoRemoteDataSourceMock();
    cartLocalDataSourceMock = CartLocalDataSourceMock();
    discountOverrideRemoteDataSourceMock =
        DiscountOverrideRemoteDataSourceMock();
    mixpanelService = MixpanelServiceMock();
    cartRemoteDataSource = CartRemoteDataSourceMock();
    orderHistoryLocalDataSource = ViewByItemLocalDataSourceMock();
    viewByItemRemoteDataSource = ViewByItemRemoteDataSourceMock();
    cartRepository = CartRepository(
      mixpanelService: mixpanelService,
      cartLocalDataSource: cartLocalDataSourceMock,
      discountOverrideRemoteDataSource: discountOverrideRemoteDataSourceMock,
      config: mockConfig,
      stockInfoLocalDataSource: stockInfoLocalDataSource,
      stockInfoRemoteDataSource: stockInfoRemoteDataSource,
      cartRemoteDataSource: cartRemoteDataSource,
      viewByItemLocalDataSource: orderHistoryLocalDataSource,
      viewByItemRemoteDataSource: viewByItemRemoteDataSource,
    );
    mockSalesOrganisationConfigs = SalesOrganisationConfigs.empty().copyWith(
      languageFilter: true,
      languageValue: Language.english(),
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
      salesOrg: fakeSalesOrg,
    );

    fakeCartProductsWithCombo
        .addAll(await CartLocalDataSource().upsertCartItemsWithComboOffers());
    aplSimulatorOrder = await CartLocalDataSource().aplSimulateOrder();
    aplSimulatorGetTotalPrice = await CartLocalDataSource().aplGetTotalPrice();

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
      () => stockInfoRemoteDataSource.getMaterialStockInfoList(
        materialNumbers: [fakeCartProducts.first.materialNumberString],
        salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
        selectedCustomerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
      ),
    ).thenAnswer(
      (invocation) async => [MaterialStockInfo.empty()],
    );

    when(
      () => stockInfoRemoteDataSource.getMaterialStockInfoList(
        materialNumbers: [fakeCartProducts.first.materialNumberString],
        salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
        selectedCustomerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
      ),
    ).thenAnswer(
      (invocation) async => [MaterialStockInfo.empty()],
    );
    when(() => mockConfig.maximumCartQuantity).thenReturn(99999);
  });

  test('Test Clear Cart - Success', () async {
    final result = await cartRepository.clearCart();
    expect(result.isRight(), true);
  });

  test('Test Clear Cart remote - success', () async {
    when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
    when(
      () => cartRemoteDataSource.deleteCart(),
    ).thenAnswer((invocation) async => unit);

    final result = await cartRepository.clearCart();
    expect(result.isRight(), true);
  });

  test('Test Clear Cart remote - failure', () async {
    when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
    when(
      () => cartRemoteDataSource.deleteCart(),
    ).thenThrow(
      fakeException,
    );

    final result = await cartRepository.clearCart();
    expect(result, Left(FailureHandler.handleFailure(fakeException)));
  });

  test('Test getStockInfoList remote - success', () async {
    when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
    when(
      () => stockInfoRemoteDataSource.getStockInfo(
        materialNumber: '12345',
        salesOrg: '2001',
        selectedCustomerCode: CustomerCodeInfo.empty().customerCodeSoldTo,
      ),
    ).thenThrow((invocation) async => MockException());

    final result = await cartRepository.getStockInfoList(
      items: [
        MaterialInfo.empty().copyWith(materialNumber: MaterialNumber('12345'))
      ],
      shipToInfo: ShipToInfo.empty(),
      salesOrganisation:
          SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2001')),
      customerCodeInfo: CustomerCodeInfo.empty(),
      salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
    );
    expect(result.isRight(), true);
  });

  test('Test Update Material Deal Bonus - Success', () async {
    when(
      () => stockInfoLocalDataSource.getStockInfo(),
    ).thenAnswer(
      (invocation) async => StockInfo.empty().copyWith(
        materialNumber: MaterialNumber('1234'),
        inStock: MaterialInStock('Yes'),
      ),
    );

    final materials = [...fakeCartProducts];
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
      bonusSampleItems: [
        BonusSampleItem.empty().copyWith(
          materialNumber: MaterialNumber('fake-number'),
        )
      ],
    );
    materials.replaceRange(0, 1, [material]);

    final result = await cartRepository.updateMaterialDealBonus(
      materials: materials,
      shipToInfo: fakeShipToInfo,
      salesOrganisation: fakeSalesOrganisation,
      customerCodeInfo: fakeCustomerCodeInfo,
      salesOrganisationConfigs: mockSalesOrganisationConfigs.copyWith(
        enableBatchNumber: false,
      ),
    );
    if (result.isRight()) {
      result.fold((l) => {}, (r) {
        expect(
          r.first.bonusSampleItems.length !=
              fakeCartProducts.first.bonusSampleItems.length,
          true,
        );
      });
    }
  });

  test(
      'Test Update Material Deal Bonus for different material number - Success',
      () async {
    when(
      () => stockInfoLocalDataSource.getStockInfo(),
    ).thenAnswer(
      (invocation) async => StockInfo.empty().copyWith(
        materialNumber: MaterialNumber('12345'),
        inStock: MaterialInStock('Yes'),
      ),
    );

    final materials = [...fakeCartProducts];
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
      bonusSampleItems: [
        BonusSampleItem.empty().copyWith(
          materialNumber: MaterialNumber('fake-number'),
        )
      ],
    );
    materials.replaceRange(0, 1, [material]);

    final result = await cartRepository.updateMaterialDealBonus(
      materials: materials,
      shipToInfo: fakeShipToInfo,
      salesOrganisation: fakeSalesOrganisation,
      customerCodeInfo: fakeCustomerCodeInfo,
      salesOrganisationConfigs: mockSalesOrganisationConfigs.copyWith(
        enableBatchNumber: false,
      ),
    );
    if (result.isRight()) {
      result.fold((l) => {}, (r) {
        expect(
          r.first.bonusSampleItems.length !=
              fakeCartProducts.first.bonusSampleItems.length,
          true,
        );
      });
    }
  });

  test(
      'Test Update Material Deal Bonus with different material number - failure',
      () async {
    when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
    when(
      () => stockInfoLocalDataSource.getStockInfo(),
    ).thenAnswer(
      (invocation) async => StockInfo.empty().copyWith(
        materialNumber: MaterialNumber('12345'),
        inStock: MaterialInStock('Yes'),
      ),
    );

    final materials = [...fakeCartProducts];
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
      bonusSampleItems: [
        BonusSampleItem.empty().copyWith(
          materialNumber: MaterialNumber('fake-number'),
        )
      ],
    );
    materials.replaceRange(0, 1, [material]);

    final result = await cartRepository.updateMaterialDealBonus(
      materials: materials,
      shipToInfo: fakeShipToInfo,
      salesOrganisation: fakeSalesOrganisation,
      customerCodeInfo: fakeCustomerCodeInfo,
      salesOrganisationConfigs: mockSalesOrganisationConfigs.copyWith(
        enableBatchNumber: false,
      ),
    );
    if (result.isRight()) {
      result.fold((l) => {}, (r) {
        expect(
          r.first.bonusSampleItems.first.inStock == MaterialInStock(''),
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
        materialNumber: MaterialNumber(''),
        inStock: MaterialInStock('Yes'),
      ),
    );

    final result = await cartRepository.updateMaterialDealBonus(
      materials: fakeCartProducts,
      shipToInfo: fakeShipToInfo,
      salesOrganisation: fakeSalesOrganisation,
      customerCodeInfo: fakeCustomerCodeInfo,
      salesOrganisationConfigs: mockSalesOrganisationConfigs,
    );
    if (result.isRight()) {
      result.fold((l) => {}, (r) {
        expect(
          r.first.bonusSampleItems.length !=
              fakeCartProducts.first.bonusSampleItems.length,
          false,
        );
      });
    }
  });

  // test('Test Update Discount Qty Material - Success', () async {
  //   final result = cartRepository.updateDiscountQty(
  //     items: [fakeCartItem],
  //   );
  //   expect(result, [fakeCartItem]);
  // });

  // test('Test Update Discount Qty Material - zmgDiscount - true - Success',
  //     () async {
  //   final result = cartRepository.updateDiscountQty(
  //     items: [
  //       fakeCartItem.copyWith(
  //         materials: [
  //           fakeCartItem.materials.first.copyWith(
  //             price: Price.empty().copyWith(
  //               zmgDiscount: true,
  //             ),
  //           ),
  //         ],
  //       )
  //     ],
  //   );
  //   expect(result, [
  //     fakeCartItem.copyWith(
  //       materials: [
  //         fakeCartItem.materials.first.copyWith(
  //           discountedMaterialCount: 1,
  //           price: Price.empty().copyWith(
  //             zmgDiscount: true,
  //           ),
  //         ),
  //       ],
  //     ),
  //   ]);
  // });

  // test(
  //     'Test Update Discount Qty Material - isTireDiscountEligible - true - Success',
  //     () async {
  //   final result = cartRepository.updateDiscountQty(
  //     items: [
  //       fakeCartItem.copyWith(
  //         materials: [
  //           fakeCartItem.materials.first.copyWith(
  //             price: Price.empty().copyWith(
  //               tiers: [
  //                 PriceTier.empty(),
  //               ],
  //             ),
  //           ),
  //         ],
  //       )
  //     ],
  //   );
  //   expect(result, [
  //     fakeCartItem.copyWith(
  //       materials: [
  //         fakeCartItem.materials.first.copyWith(
  //           discountedMaterialCount: 1,
  //           price: Price.empty().copyWith(
  //             tiers: [
  //               PriceTier.empty(),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   ]);
  // });

  // test('Test Update Discount Qty Bundle - Success', () async {
  //   final result = cartRepository.updateDiscountQty(
  //     items: [
  //       fakeCartItem.copyWith(
  //         itemType: CartItemType.bundle,
  //         materials: [
  //           fakeCartItem.materials.first.copyWith(
  //             bundle: Bundle.empty().copyWith(bundleCode: '1'),
  //           ),
  //         ],
  //       ),
  //     ],
  //   );
  //   expect(result, [
  //     fakeCartItem.copyWith(
  //       itemType: CartItemType.bundle,
  //       materials: [
  //         fakeCartItem.materials.first.copyWith(
  //           bundle: Bundle.empty().copyWith(bundleCode: '1'),
  //         ),
  //       ],
  //     ),
  //   ]);
  // });

  // test('Test Update Discount Qty ComboDeal - Success', () async {
  //   final result = cartRepository.updateDiscountQty(
  //     items: [
  //       fakeCartItem.copyWith(
  //         itemType: CartItemType.comboDeal,
  //         materials: [
  //           fakeCartItem.materials.first.copyWith(
  //             bundle: Bundle.empty().copyWith(bundleCode: '1'),
  //           ),
  //         ],
  //       ),
  //     ],
  //   );
  //   expect(result, [
  //     fakeCartItem.copyWith(
  //       itemType: CartItemType.comboDeal,
  //       materials: [
  //         fakeCartItem.materials.first.copyWith(
  //           bundle: Bundle.empty().copyWith(bundleCode: '1'),
  //         ),
  //       ],
  //     ),
  //   ]);
  // });

  test('Test Get Stock Info - Success', () async {
    when(
      () => stockInfoLocalDataSource.getMaterialStockInfoList(),
    ).thenAnswer(
      (invocation) async => [MaterialStockInfo.empty()],
    );
    final result = await cartRepository.getStockInfo(
      customerCodeInfo: fakeCustomerCodeInfo,
      salesOrganisation: fakeSalesOrganisation,
      materials: [fakeCartProducts.first.materialInfo],
    );
    expect(result.isRight(), true);
  });

  test('Test Get Stock Info - UAT - Success', () async {
    when(
      () => stockInfoRemoteDataSource.getMaterialStockInfoList(
        materialNumbers: [
          fakeCartProducts.first.materialInfo.materialNumber.getOrCrash()
        ],
        salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
        selectedCustomerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
      ),
    ).thenAnswer(
      (invocation) async => [MaterialStockInfo.empty()],
    );

    when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

    final result = await cartRepository.getStockInfo(
      customerCodeInfo: fakeCustomerCodeInfo,
      salesOrganisation: fakeSalesOrganisation,
      materials: [fakeCartProducts.first.materialInfo],
    );
    expect(result.isRight(), true);
  });

  test('Test Get Stock Info - UAT - Failure', () async {
    when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
    when(
      () => stockInfoRemoteDataSource.getMaterialStockInfoList(
        materialNumbers: [fakeCartProducts.first.materialNumberString],
        salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
        selectedCustomerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
      ),
    ).thenThrow(
      (invocation) async => MockException(),
    );

    final result = await cartRepository.getStockInfo(
      customerCodeInfo: fakeCustomerCodeInfo,
      salesOrganisation: fakeSalesOrganisation,
      materials: [fakeCartProducts.first.materialInfo],
    );
    expect(result.isLeft(), true);
  });

  test('Test Get Stock Info - Failure', () async {
    when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
    when(
      () => stockInfoLocalDataSource.getMaterialStockInfoList(),
    ).thenThrow(
      (invocation) async => MockException(),
    );

    final result = await cartRepository.getStockInfo(
      customerCodeInfo: fakeCustomerCodeInfo,
      salesOrganisation: fakeSalesOrganisation,
      materials: [fakeCartProducts.first.materialInfo],
    );
    expect(result.isLeft(), true);
  });

  test('Test Get Stock Info enableBatchNumber - Success', () async {
    when(
      () => stockInfoLocalDataSource.getMaterialStockInfoList(),
    ).thenAnswer(
      (invocation) async => [MaterialStockInfo.empty()],
    );
    final result = await cartRepository.getStockInfo(
      customerCodeInfo: fakeCustomerCodeInfo,
      salesOrganisation: fakeSalesOrganisation,
      materials: [fakeCartProducts.first.materialInfo],
    );
    expect(result.isRight(), true);
  });

  test('Test Get Stock Info enableBatchNumber - UAT - Success', () async {
    when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
    when(
      () => stockInfoRemoteDataSource.getMaterialStockInfoList(
        materialNumbers: [
          fakeCartProducts.first.materialInfo.materialNumber.getOrCrash()
        ],
        salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
        selectedCustomerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
      ),
    ).thenAnswer(
      (invocation) async => [MaterialStockInfo.empty()],
    );

    final result = await cartRepository.getStockInfo(
      customerCodeInfo: fakeCustomerCodeInfo,
      salesOrganisation: fakeSalesOrganisation,
      materials: [fakeCartProducts.first.materialInfo],
    );
    expect(result.isRight(), true);
  });

  group('addHistoryItemsToCart test', () {
    test('addHistoryItemsToCart test - Remote Success', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

      final productList = <MaterialInfo>[
        MaterialInfo.empty().copyWith(
          materialNumber: MaterialNumber('fake-material-number'),
          quantity: MaterialQty(1),
          type: MaterialInfoType('material'),
          parentID: 'fake-parent-Id',
        )
      ];
      when(
        () => cartRemoteDataSource.upsertCartItems(
          requestParams: productList.map((materialInfo) {
            final upsertCartRequest = CartProductRequest.toMaterialRequest(
              salesOrg: fakeSalesOrganisation.salesOrg,
              customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
              shipToCustomerCode: fakeShipToInfo.shipToCustomerCode,
              language: Language.english().languageCode,
              materialInfo: materialInfo,
              counterOfferDetails: RequestCounterOfferDetails.empty(),
              itemId: 'fake-item-Id',
              quantity: materialInfo.quantity.intValue,
            );

            return CartProductRequestDto.fromDomain(upsertCartRequest).toMap();
          }).toList(),
        ),
      ).thenAnswer(
        (invocation) async => <PriceAggregate>[
          PriceAggregate.empty().copyWith(
            materialInfo: productList.first,
          )
        ],
      );

      final result = await cartRepository.addHistoryItemsToCart(
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        shipToInfo: fakeShipToInfo,
        itemId: 'fake-item-Id',
        counterOfferDetails: RequestCounterOfferDetails.empty(),
        language: Language.english(),
        materialInfo: productList,
        salesOrganisationConfig: fakeSalesOrganisationConfigs,
      );
      expect(result.isRight(), true);
    });

    test('addHistoryItemsToCart test - Remote Failure', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

      final productList = <MaterialInfo>[
        MaterialInfo.empty().copyWith(
          materialNumber: MaterialNumber('fake-material-number'),
          quantity: MaterialQty(1),
          type: MaterialInfoType('material'),
          parentID: 'fake-parent-Id',
        )
      ];
      when(
        () => cartRemoteDataSource.upsertCartItems(
          requestParams: productList.map((materialInfo) {
            final upsertCartRequest = CartProductRequest.toMaterialRequest(
              salesOrg: fakeSalesOrganisation.salesOrg,
              customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
              shipToCustomerCode: fakeShipToInfo.shipToCustomerCode,
              language: Language.english().languageCode,
              materialInfo: materialInfo,
              counterOfferDetails: RequestCounterOfferDetails.empty(),
              itemId: 'fake-item-Id',
              quantity: materialInfo.quantity.intValue,
            );

            return CartProductRequestDto.fromDomain(upsertCartRequest).toMap();
          }).toList(),
        ),
      ).thenThrow(
        (invocation) async => MockException(),
      );

      final result = await cartRepository.addHistoryItemsToCart(
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        shipToInfo: fakeShipToInfo,
        itemId: 'fake-item-Id',
        counterOfferDetails: RequestCounterOfferDetails.empty(),
        language: Language.english(),
        materialInfo: productList,
        salesOrganisationConfig: fakeSalesOrganisationConfigs,
      );
      expect(result.isLeft(), true);
    });

    test('addHistoryItemsToCart test - Local success', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(
        () => cartLocalDataSourceMock.upsertCartItemsWithReorderMaterials(),
      ).thenAnswer(
        (invocation) async => fakeCartProducts,
      );

      final result = await cartRepository.addHistoryItemsToCart(
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        shipToInfo: fakeShipToInfo,
        itemId: 'fake-item-Id',
        counterOfferDetails:
            fakeCartProducts.first.materialInfo.counterOfferDetails,
        language: fakeClientUser.settings.languagePreference,
        materialInfo: fakeCartProducts.materialInfos,
        salesOrganisationConfig: fakeSalesOrganisationConfigs,
      );
      expect(result, Right(fakeCartProducts));
    });

    test('addHistoryItemsToCart test - Local Failure', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(
        () => cartLocalDataSourceMock.upsertCartItemsWithReorderMaterials(),
      ).thenThrow(
        fakeException,
      );

      final result = await cartRepository.addHistoryItemsToCart(
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        shipToInfo: fakeShipToInfo,
        itemId: 'fake-item-Id',
        counterOfferDetails:
            fakeCartProducts.first.materialInfo.counterOfferDetails,
        language: fakeClientUser.settings.languagePreference,
        materialInfo: fakeCartProducts.materialInfos,
        salesOrganisationConfig: fakeSalesOrganisationConfigs,
      );

      expect(result, Left(FailureHandler.handleFailure(fakeException)));
    });

    test('upsertCartItemsWithComboOffers test local success', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(
        () => cartLocalDataSourceMock.upsertCartItemsWithComboOffers(),
      ).thenAnswer(
        (invocation) async => fakeCartProductsWithCombo,
      );

      final result = await cartRepository.upsertCartItemsWithComboOffers(
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        shipToInfo: fakeShipToInfo,
        products: fakeCartProductsWithCombo,
      );
      expect(result.isRight(), true);
    });

    test('upsertCartItemsWithComboOffers test local failure', () async {
      when(
        () => cartLocalDataSourceMock.upsertCartItemsWithComboOffers(),
      ).thenThrow(
        (invocation) async => MockException(),
      );

      final result = await cartRepository.upsertCartItemsWithComboOffers(
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        shipToInfo: fakeShipToInfo,
        products: [],
      );
      expect(result.isLeft(), true);
    });

    test('upsertCartItemsWithComboOffers test remote success', () async {
      final requestParams = fakeCartProductsWithCombo.comboMaterialItemList
          .map(
            (productUpsertRequest) => ComboProductRequestDto.fromDomain(
              comboProductRequest: productUpsertRequest,
              salesOrg:
                  mockSalesOrganisationConfigs.salesOrg.getOrDefaultValue(''),
              customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
              shipToId: fakeShipToInfo.shipToCustomerCode,
            ).toMap(),
          )
          .toList();
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(
        () => cartRemoteDataSource.upsertCartItems(
          requestParams: requestParams,
        ),
      ).thenAnswer(
        (invocation) async => fakeCartProductsWithCombo,
      );

      final result = await cartRepository.upsertCartItemsWithComboOffers(
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        shipToInfo: fakeShipToInfo,
        products: fakeCartProductsWithCombo,
      );
      expect(result.isRight(), true);
    });

    test('upsertCartItemsWithComboOffers remote test left', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(
        () => cartRemoteDataSource.upsertCartItems(
          requestParams: [],
        ),
      ).thenThrow(
        (invocation) async => MockException(),
      );

      final result = await cartRepository.upsertCartItemsWithComboOffers(
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        shipToInfo: fakeShipToInfo,
        products: [],
      );
      expect(result.isLeft(), true);
    });

    /////////////////////////////////-aplSimulatorOrder-////////////////////////
    test('aplSimulatorOrder test local success', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(
        () => cartLocalDataSourceMock.aplSimulateOrder(),
      ).thenAnswer(
        (invocation) async => aplSimulatorOrder,
      );

      final result = await cartRepository.aplSimulateOrder(
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        product: fakeCartProducts.materialInfos,
      );
      expect(result, Right(aplSimulatorOrder));
    });

    test('aplSimulatorOrder test local failure', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(
        () => cartLocalDataSourceMock.aplSimulateOrder(),
      ).thenThrow(
        fakeException,
      );

      final result = await cartRepository.aplSimulateOrder(
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        product: fakeCartProducts.materialInfos,
      );
      expect(result, Left(FailureHandler.handleFailure(fakeException)));
    });

    test('aplSimulatorOrder test remote success', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(
        () => cartRemoteDataSource.aplSimulateOrder(
          customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
          materialQuantityPairList: [
            {
              'material': fakeCartProducts.materialInfos.first.materialNumber
                  .getOrCrash(),
              'quantity': fakeCartProducts.materialInfos.first.quantity.intValue
                  .toString(),
            }
          ],
          salesOrgCode: fakeSalesOrganisation.salesOrg.getOrCrash(),
        ),
      ).thenAnswer(
        (invocation) async => aplSimulatorOrder,
      );

      final result = await cartRepository.aplSimulateOrder(
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        product: fakeCartProducts.materialInfos,
      );
      expect(result, Right(aplSimulatorOrder));
    });

    test('aplSimulatorOrder test remote failure', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(
        () => cartRemoteDataSource.aplSimulateOrder(
          customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
          materialQuantityPairList: [
            {
              'material': fakeCartProducts.materialInfos.first.materialNumber
                  .getOrCrash(),
              'quantity': fakeCartProducts.materialInfos.first.quantity.intValue
                  .toString(),
            }
          ],
          salesOrgCode: fakeSalesOrganisation.salesOrg.getOrCrash(),
        ),
      ).thenThrow(
        fakeException,
      );

      final result = await cartRepository.aplSimulateOrder(
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        product: fakeCartProducts.materialInfos,
      );
      expect(result, Left(FailureHandler.handleFailure(fakeException)));
    });
    /////////////////////////////////-aplSimulatorOrder-////////////////////////

    ////////////////////////////-fetchGrandTotalPriceForIdMarket-////////////////////////
    test('fetchGrandTotalPriceForIdMarket test local success', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(
        () => cartLocalDataSourceMock.aplGetTotalPrice(),
      ).thenAnswer(
        (invocation) async => aplSimulatorGetTotalPrice,
      );

      final result = await cartRepository.fetchGrandTotalPriceForIdMarket(
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        materialNumbers: fakeCartProducts.materialNumbers,
        totalPrice: 1000,
      );

      expect(result, Right(aplSimulatorGetTotalPrice));
    });

    test('fetchGrandTotalPriceForIdMarket test local failure', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(
        () => cartLocalDataSourceMock.aplGetTotalPrice(),
      ).thenThrow(
        fakeException,
      );

      final result = await cartRepository.fetchGrandTotalPriceForIdMarket(
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        materialNumbers: fakeCartProducts.materialNumbers,
        totalPrice: 1000,
      );

      expect(result, Left(FailureHandler.handleFailure(fakeException)));
    });

    test('fetchGrandTotalPriceForIdMarket test remote success', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(
        () => cartRemoteDataSource.aplGetTotalPrice(
          customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
          salesOrgCode: fakeSalesOrganisation.salesOrg.getOrCrash(),
          materialNumbers: fakeCartProducts.materialNumbers
              .map((item) => item.getOrCrash())
              .toList(),
          totalPrice: 1000,
        ),
      ).thenAnswer(
        (invocation) async => aplSimulatorGetTotalPrice,
      );

      final result = await cartRepository.fetchGrandTotalPriceForIdMarket(
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        materialNumbers: fakeCartProducts.materialNumbers,
        totalPrice: 1000,
      );

      expect(result, Right(aplSimulatorGetTotalPrice));
    });

    test('fetchGrandTotalPriceForIdMarket test remote failure', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(
        () => cartRemoteDataSource.aplGetTotalPrice(
          customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
          salesOrgCode: fakeSalesOrganisation.salesOrg.getOrCrash(),
          materialNumbers: fakeCartProducts.materialNumbers
              .map((item) => item.getOrCrash())
              .toList(),
          totalPrice: 1000,
        ),
      ).thenThrow(
        fakeException,
      );

      final result = await cartRepository.fetchGrandTotalPriceForIdMarket(
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        materialNumbers: fakeCartProducts.materialNumbers,
        totalPrice: 1000,
      );

      expect(result, Left(FailureHandler.handleFailure(fakeException)));
    });
    ////////////////////////////-fetchGrandTotalPriceForIdMarket-////////////////////////

    /////////////////////////////////-updateCartWithProductDetermination-////////////////////////
    test('updateCartWithProductDetermination test local success', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(
        () => cartLocalDataSourceMock.upsertCartItemsWithReorderMaterials(),
      ).thenAnswer(
        (invocation) async => fakeCartProducts,
      );

      final result = await cartRepository.updateCartWithProductDetermination(
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        productDeterminationList: fakeCartProducts.materialInfos,
        salesOrganisationConfig: fakeSalesOrganisationConfigs,
        shipToInfo: fakeShipToInfo,
        updatedCartItems: fakeCartProducts,
        language: fakeClientUser.settings.languagePreference,
      );
      expect(result, Right(fakeCartProducts));
    });

    test('updateCartWithProductDetermination test local failure', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(
        () => cartLocalDataSourceMock.upsertCartItemsWithReorderMaterials(),
      ).thenThrow(
        fakeException,
      );

      final result = await cartRepository.updateCartWithProductDetermination(
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        productDeterminationList: fakeCartProducts.materialInfos,
        salesOrganisationConfig: fakeSalesOrganisationConfigs,
        shipToInfo: fakeShipToInfo,
        updatedCartItems: fakeCartProducts,
        language: fakeClientUser.settings.languagePreference,
      );
      expect(result, Left(FailureHandler.handleFailure(fakeException)));
    });

    // test('updateCartWithProductDetermination test remote success', () async {
    //   when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
    //       when(
    //     () => cartRemoteDataSource.deleteCart(),
    //   ).thenAnswer((invocation) async => unit);

    //   when(
    //     () => cartRemoteDataSource.upsertCartItems(
    //       requestParams: fakeCartProducts.materialInfos.map((materialInfo) {
    //         final upsertCartRequest = CartProductRequest.toMaterialRequest(
    //           salesOrg: fakeSGSalesOrganisation.salesOrg,
    //           customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
    //           shipToCustomerCode: fakeShipToInfo.shipToCustomerCode,
    //           language: fakeClientUser.settings.languagePreference.languageCode,
    //           materialInfo: materialInfo,
    //           itemId: materialInfo.sampleBonusItemId,
    //           quantity: materialInfo.quantity.intValue,
    //           counterOfferDetails: materialInfo.counterOfferDetails,
    //         );

    //         return CartProductRequestDto.fromDomain(upsertCartRequest).toMap();
    //       }).toList(),

    //     ),
    //   ).thenAnswer(
    //     (invocation) async => fakeCartProducts,
    //   );

    //   final result = await cartRepository.updateCartWithProductDetermination(
    //     customerCodeInfo: fakeCustomerCodeInfo,
    //     salesOrganisation: fakeSalesOrganisation,
    //     productDeterminationList: fakeCartProducts.materialInfos,
    //     salesOrganisationConfig: fakeSalesOrganisationConfigs,
    //     shipToInfo: fakeShipToInfo,
    //     updatedCartItems: fakeCartProducts,
    //     language: fakeClientUser.settings.languagePreference,
    //   );

    //   expect(result, Right(fakeCartProducts));
    // });

    test('updateCartWithProductDetermination test local failure', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(
        () => cartLocalDataSourceMock.upsertCartItemsWithReorderMaterials(),
      ).thenThrow(
        fakeException,
      );

      final result = await cartRepository.updateCartWithProductDetermination(
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        productDeterminationList: fakeCartProducts.materialInfos,
        salesOrganisationConfig: fakeSalesOrganisationConfigs,
        shipToInfo: fakeShipToInfo,
        updatedCartItems: fakeCartProducts,
        language: fakeClientUser.settings.languagePreference,
      );
      expect(result, Left(FailureHandler.handleFailure(fakeException)));
    });

    test('updateCartWithProductDetermination test remote success', () async {
      final materialInfo = [
        ...fakeCartProducts.materialInfos,
        ...fakeCartProducts
            .map(
              (e) => [
                e.materialInfo.copyWith(quantity: MaterialQty(e.quantity)),
                ...e.existingProductDealBonus,
              ],
            )
            .flattened
            .toList(),
      ];

      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(
        () => cartRemoteDataSource.deleteCart(),
      ).thenAnswer((invocation) async => unit);
      when(
        () => cartRemoteDataSource.upsertCartItems(
          requestParams: materialInfo.map((materialInfo) {
            final upsertCartRequest = CartProductRequest.toMaterialRequest(
              salesOrg: fakeSalesOrganisation.salesOrg,
              customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
              shipToCustomerCode: fakeShipToInfo.shipToCustomerCode,
              language: Language.english().languageCode,
              materialInfo: materialInfo,
              itemId: materialInfo.sampleBonusItemId,
              quantity: materialInfo.quantity.intValue,
              counterOfferDetails: materialInfo.counterOfferDetails,
            );

            return CartProductRequestDto.fromDomain(upsertCartRequest).toMap();
          }).toList(),
        ),
      ).thenAnswer(
        (invocation) async => fakeCartProducts,
      );
      final result = await cartRepository.updateCartWithProductDetermination(
        language: Language.english(),
        shipToInfo: fakeShipToInfo,
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisationConfig: fakeSalesOrganisationConfigs,
        salesOrganisation: fakeSalesOrganisation,
        productDeterminationList: fakeCartProducts.materialInfos,
        updatedCartItems: fakeCartProducts,
      );
      expect(result.getOrElse(() => []), fakeCartProducts);
    });

    test('updateCartWithProductDetermination test remote failure', () async {
      final materialInfo = [
        ...fakeCartProducts.materialInfos,
        ...fakeCartProducts
            .map(
              (e) => [
                e.materialInfo.copyWith(quantity: MaterialQty(e.quantity)),
                ...e.existingProductDealBonus,
              ],
            )
            .flattened
            .toList(),
      ];

      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(
        () => cartRemoteDataSource.deleteCart(),
      ).thenAnswer((invocation) async => unit);
      when(
        () => cartRemoteDataSource.upsertCartItems(
          requestParams: materialInfo.map((materialInfo) {
            final upsertCartRequest = CartProductRequest.toMaterialRequest(
              salesOrg: fakeSalesOrganisation.salesOrg,
              customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
              shipToCustomerCode: fakeShipToInfo.shipToCustomerCode,
              language: 'EN',
              materialInfo: materialInfo,
              itemId: materialInfo.sampleBonusItemId,
              quantity: materialInfo.quantity.intValue,
              counterOfferDetails: materialInfo.counterOfferDetails,
            );

            return CartProductRequestDto.fromDomain(upsertCartRequest).toMap();
          }).toList(),
        ),
      ).thenThrow(
        fakeException,
      );

      final result = await cartRepository.updateCartWithProductDetermination(
        language: Language.english(),
        shipToInfo: fakeShipToInfo,
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisationConfig: fakeSalesOrganisationConfigs,
        salesOrganisation: fakeSalesOrganisation,
        productDeterminationList: fakeCartProducts.materialInfos,
        updatedCartItems: fakeCartProducts,
      );

      expect(result, Left(FailureHandler.handleFailure(fakeException)));
    });

    /////////////////////////////////-updateCartWithProductDetermination-////////////////////////

    /////////////////////////////////-removeSelectedProducts-////////////////////////

    test('removeSelectedProducts local test success', () async {
      when(
        () => cartLocalDataSourceMock.upsertCart(),
      ).thenAnswer(
        (invocation) async => fakeCartProducts,
      );

      final result = await cartRepository.removeSelectedProducts(
        salesOrganisationConfig: mockSalesOrganisationConfigs,
        customerCodeInfo: fakeCustomerCodeInfo,
        language: Language.english(),
        products: [
          MaterialInfo.empty().copyWith(materialNumber: MaterialNumber('12345'))
        ],
        salesOrganisation: fakeSalesOrganisation,
        shipToInfo: fakeShipToInfo,
      );
      expect(result.isRight(), true);
    });

    test('removeSelectedProducts remote test success', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(
        () => stockInfoRemoteDataSource.getStockInfo(
          materialNumber: fakeCartProducts.materialNumbers.first.getOrCrash(),
          salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
          selectedCustomerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
        ),
      ).thenAnswer(
        (invocation) async => StockInfo.empty(),
      );
      final upsertCartRequest = CartProductRequest.toMaterialRequest(
        salesOrg: fakeSalesOrganisation.salesOrg,
        customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
        shipToCustomerCode: fakeShipToInfo.shipToCustomerCode,
        language: Language.english().languageCode,
        materialInfo: fakeCartProducts.first.materialInfo,
        itemId: fakeCartProducts.first.materialInfo.parentID,
        quantity: fakeCartProducts.first.materialInfo.quantity.intValue,
        counterOfferDetails:
            fakeCartProducts.first.materialInfo.counterOfferDetails,
      );
      when(
        () => stockInfoRemoteDataSource.getMaterialStockInfoList(
          materialNumbers: [
            fakeCartProducts.first.materialInfo.materialNumber.getOrCrash()
          ],
          salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
          selectedCustomerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
        ),
      ).thenAnswer(
        (invocation) async => [
          MaterialStockInfo.empty().copyWith(
            materialNumber: fakeCartProducts.first.materialInfo.materialNumber,
            stockInfos: [StockInfo.empty()],
          )
        ],
      );

      when(
        () => cartRemoteDataSource.upsertCart(
          requestParams:
              CartProductRequestDto.fromDomain(upsertCartRequest).toMap(),
        ),
      ).thenAnswer(
        (invocation) async => fakeCartProducts,
      );

      final result = await cartRepository.removeSelectedProducts(
        salesOrganisationConfig: mockSalesOrganisationConfigs,
        customerCodeInfo: fakeCustomerCodeInfo,
        language: Language.english(),
        products: fakeCartProducts.materialInfos,
        salesOrganisation: fakeSalesOrganisation,
        shipToInfo: fakeShipToInfo,
      );
      expect(result.getOrElse(() => <PriceAggregate>[]), [
        fakeCartProducts.first.copyWith(stockInfoList: [StockInfo.empty()])
      ]);
    });

    test('removeSelectedProducts remote test success - if upsert cart fails',
        () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(
        () => stockInfoRemoteDataSource.getStockInfo(
          materialNumber: fakeCartProducts.materialNumbers.first.getOrCrash(),
          salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
          selectedCustomerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
        ),
      ).thenAnswer(
        (invocation) async => StockInfo.empty(),
      );
      final upsertCartRequest = CartProductRequest.toMaterialRequest(
        salesOrg: fakeSalesOrganisation.salesOrg,
        customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
        shipToCustomerCode: fakeShipToInfo.shipToCustomerCode,
        language: 'EN',
        materialInfo: fakeCartProducts.first.materialInfo,
        itemId: fakeCartProducts.first.materialInfo.parentID,
        quantity: fakeCartProducts.first.materialInfo.quantity.intValue,
        counterOfferDetails:
            fakeCartProducts.first.materialInfo.counterOfferDetails,
      );
      when(
        () => cartRemoteDataSource.upsertCart(
          requestParams:
              CartProductRequestDto.fromDomain(upsertCartRequest).toMap(),
        ),
      ).thenThrow(
        fakeException,
      );

      final result = await cartRepository.removeSelectedProducts(
        salesOrganisationConfig: mockSalesOrganisationConfigs,
        customerCodeInfo: fakeCustomerCodeInfo,
        language: Language.english(),
        products: fakeCartProducts.materialInfos,
        salesOrganisation: fakeSalesOrganisation,
        shipToInfo: fakeShipToInfo,
      );
      expect(result.isRight(), true);
      expect(result.getOrElse(() => <PriceAggregate>[]), <PriceAggregate>[]);
    });
    /////////////////////////////////-removeSelectedProducts-////////////////////////

    test('getProduct remote test success', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(
        () => viewByItemRemoteDataSource.getItemProductDetails(
          materialIDs: ['1234'],
        ),
      ).thenAnswer(
        (invocation) async => ProductMetaData.empty().copyWith(
          productImages: [
            ProductImages.empty()
                .copyWith(materialNumber: MaterialNumber('1234'))
          ],
        ),
      );

      final result = await cartRepository.getProducts(
        materialNumbers: [MaterialNumber('1234')],
      );
      expect(result.isRight(), true);
    });

    test('getProduct remote test failure', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(
        () => viewByItemRemoteDataSource.getItemProductDetails(
          materialIDs: ['1234'],
        ),
      ).thenThrow(
        fakeException,
      );

      final result = await cartRepository.getProducts(
        materialNumbers: [MaterialNumber('1234')],
      );
      expect(result, Left(FailureHandler.handleFailure(fakeException)));
    });

    test('getProduct local test success', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      final fakeMaterialNumber =
          fakeCartProducts.first.materialInfo.materialNumber;
      final fakeProductMetaData = ProductMetaData.empty().copyWith(
        productImages: [
          ProductImages.empty().copyWith(materialNumber: fakeMaterialNumber)
        ],
      );
      when(
        () => orderHistoryLocalDataSource.getItemProductDetails(),
      ).thenAnswer(
        (invocation) async => fakeProductMetaData,
      );

      final result = await cartRepository.getProducts(
        materialNumbers: [fakeMaterialNumber],
      );
      expect(result.getOrElse(() => {}), {
        fakeMaterialNumber: fakeProductMetaData,
      });
    });

    test('getProduct local test failure', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(
        () => orderHistoryLocalDataSource.getItemProductDetails(),
      ).thenThrow(
        (invocation) async => MockException(),
      );

      final result = await cartRepository.getProducts(
        materialNumbers: [MaterialNumber('1234')],
      );
      expect(result.isLeft(), true);
    });

    test('upsertCartItems local test failure', () async {
      when(
        () => cartLocalDataSourceMock.upsertCartItems(),
      ).thenThrow(
        (invocation) async => MockException(),
      );

      final result = await cartRepository.upsertCartItems(
        customerCodeInfo: fakeCustomerCodeInfo,
        language: Language.english(),
        product: fakeCartProducts.first,
        salesOrganisation: fakeSalesOrganisation,
        shipToInfo: fakeShipToInfo,
      );
      expect(result.isLeft(), true);
    });

    test('upsertCartItems local test success', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(
        () => cartLocalDataSourceMock.upsertCartItems(),
      ).thenAnswer(
        (invocation) async => fakeCartProducts,
      );

      final result = await cartRepository.upsertCartItems(
        customerCodeInfo: fakeCustomerCodeInfo,
        language: Language.english(),
        product: fakeCartProducts.first,
        salesOrganisation: fakeSalesOrganisation,
        shipToInfo: fakeShipToInfo,
      );
      expect(result.isRight(), true);
    });

    test('upsertCartItems remote test success', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

      when(
        () => cartRemoteDataSource.upsertCartItems(
          requestParams:
              fakeCartProducts.first.bundle.materials.map((materialInfo) {
            final upsertCartRequest = CartProductRequest.toBundlesRequest(
              salesOrg: fakeSalesOrganisation.salesOrg,
              customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
              shipToCustomerCode: fakeShipToInfo.shipToCustomerCode,
              language: Language.english(),
              materialInfo: materialInfo,
              bundleCode: fakeCartProducts.first.bundle.bundleCode,
            );

            return CartProductRequestDto.fromDomain(upsertCartRequest).toMap();
          }).toList(),
        ),
      ).thenAnswer(
        (invocation) async => fakeCartProducts,
      );

      final result = await cartRepository.upsertCartItems(
        customerCodeInfo: fakeCustomerCodeInfo,
        language: Language.english(),
        product: fakeCartProducts.first,
        salesOrganisation: fakeSalesOrganisation,
        shipToInfo: fakeShipToInfo,
      );
      expect(result.isRight(), true);
    });

    test('upsertCartItems remote test failure', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);

      when(
        () => cartRemoteDataSource.upsertCartItems(
          requestParams:
              fakeCartProducts.first.bundle.materials.map((materialInfo) {
            final upsertCartRequest = CartProductRequest.toBundlesRequest(
              salesOrg: fakeSalesOrganisation.salesOrg,
              customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
              shipToCustomerCode: fakeShipToInfo.shipToCustomerCode,
              language: Language.english(),
              materialInfo: materialInfo,
              bundleCode: fakeCartProducts.first.bundle.bundleCode,
            );

            return CartProductRequestDto.fromDomain(upsertCartRequest).toMap();
          }).toList(),
        ),
      ).thenThrow(
        (invocation) async => MockException(),
      );

      final result = await cartRepository.upsertCartItems(
        customerCodeInfo: fakeCustomerCodeInfo,
        language: Language.english(),
        product: fakeCartProducts.first,
        salesOrganisation: fakeSalesOrganisation,
        shipToInfo: fakeShipToInfo,
      );
      expect(result.isLeft(), true);
    });

    // test('saveToCartWithUpdatedStockInfo remote test success', () async {
    //   when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
    //   when(
    //     () => stockInfoRemoteDataSource.getStockInfo(
    //       materialNumber:
    //           fakeCartProducts.materialNumbers.first.getOrCrash(),
    //       salesOrg: mockSalesOrganisation.salesOrg.getOrCrash(),
    //       selectedCustomerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
    //     ),
    //   ).thenAnswer(
    //     (invocation) async => StockInfo.empty(),
    //   );

    //   final result = await cartRepository.saveToCartWithUpdatedStockInfo(
    //     customerCodeInfo: fakeCustomerCodeInfo,
    //     salesOrganisation: mockSalesOrganisation,
    //     shipToInfo: fakeShipToInfo,
    //     cartItem: [fakeCartItem],
    //     salesOrganisationConfigs: fakeEmptySalesConfigs,
    //   );
    //   expect(result.isRight(), true);
    // });

    // test('getMaterialPriceWithZdp5Discount remote test success', () async {
    //   when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
    //   when(
    //     () => discountOverrideRemoteDataSourceMock.getMaterialOverridePriceList(
    //       salesOrgCode: mockSalesOrganisation.salesOrg.getOrCrash(),
    //       customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
    //       shipToCode: fakeShipToInfo.shipToCustomerCode,
    //       materialQuery: PriceDto.fromDomain(
    //         fakeCartItem.materials.first.price,
    //       ).materialQueryWithExceedQty(
    //         fakeCartItem.materials.first.hasZdp5Validation,
    //       ),
    //     ),
    //   ).thenAnswer(
    //     (invocation) async => [fakeCartItem.materials.first.price],
    //   );

    //   final result = await cartRepository.getMaterialPriceWithZdp5Discount(
    //     customerCodeInfo: fakeCustomerCodeInfo,
    //     salesOrganisation: mockSalesOrganisation,
    //     shipToInfo: fakeShipToInfo,
    //     item: fakeCartItem,
    //   );
    //   expect(result.isRight(), true);
    // });

    // test('getMaterialPriceWithZdp5Discount remote test failure', () async {
    //   when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
    //   when(
    //     () => discountOverrideRemoteDataSourceMock.getMaterialOverridePriceList(
    //       salesOrgCode: mockSalesOrganisation.salesOrg.getOrCrash(),
    //       customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
    //       shipToCode: fakeShipToInfo.shipToCustomerCode,
    //       materialQuery: PriceDto.fromDomain(
    //         fakeCartItem.materials.first.price,
    //       ).materialQueryWithExceedQty(
    //         fakeCartItem.materials.first.hasZdp5Validation,
    //       ),
    //     ),
    //   ).thenThrow(
    //     (invocation) async => MockException(),
    //   );

    //   final result = await cartRepository.getMaterialPriceWithZdp5Discount(
    //     customerCodeInfo: fakeCustomerCodeInfo,
    //     salesOrganisation: mockSalesOrganisation,
    //     shipToInfo: fakeShipToInfo,
    //     item: fakeCartItem,
    //   );
    //   expect(result.isLeft(), true);
    // });

    test('getAddedToCartProductList remote test success', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(
        () => cartRemoteDataSource.getAddedToCartProductList(),
      ).thenAnswer(
        (invocation) async => fakeCartProducts,
      );

      final result = await cartRepository.getAddedToCartProductList();
      expect(result.isRight(), true);
    });

    test('getAddedToCartProductList remote test failure', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(
        () => cartRemoteDataSource.getAddedToCartProductList(),
      ).thenThrow(
        (invocation) async => MockException(),
      );

      final result = await cartRepository.getAddedToCartProductList();
      expect(result.isLeft(), true);
    });

    test('getAddedToCartProductList local test success', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(
        () => cartLocalDataSourceMock.getAddedToCartProductList(),
      ).thenAnswer(
        (invocation) async => fakeCartProducts,
      );

      final result = await cartRepository.getAddedToCartProductList();
      expect(result.isRight(), true);
    });

    test('getAddedToCartProductList local test failure', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(
        () => cartLocalDataSourceMock.getAddedToCartProductList(),
      ).thenThrow(
        (invocation) async => MockException(),
      );

      final result = await cartRepository.getAddedToCartProductList();
      expect(result.isLeft(), true);
    });

    test('upsertCart local test success', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(
        () => cartLocalDataSourceMock.upsertCart(),
      ).thenAnswer(
        (invocation) async => fakeCartProducts,
      );

      final result = await cartRepository.upsertCart(
        counterOfferDetails: RequestCounterOfferDetails.empty(),
        quantity: 1,
        language: Language.english(),
        shipToInfo: fakeShipToInfo,
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisationConfig: fakeSalesOrganisationConfigs,
        salesOrganisation: fakeSalesOrganisation,
        materialInfo: MaterialInfo.empty().copyWith(
          materialNumber: MaterialNumber('fake-material-number'),
          type: MaterialInfoType('material'),
          parentID: 'fake-parent-Id',
        ),
        itemId: 'fake-item-Id',
      );
      expect(result.isRight(), true);
    });

    test('upsertCart local test failure', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(
        () => cartLocalDataSourceMock.upsertCart(),
      ).thenThrow(
        (invocation) async => MockException(),
      );

      final result = await cartRepository.upsertCart(
        counterOfferDetails: RequestCounterOfferDetails.empty(),
        quantity: 1,
        language: Language.english(),
        shipToInfo: fakeShipToInfo,
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisationConfig: fakeSalesOrganisationConfigs,
        salesOrganisation: fakeSalesOrganisation,
        materialInfo: MaterialInfo.empty().copyWith(
          materialNumber: MaterialNumber('fake-material-number'),
          type: MaterialInfoType('material'),
          parentID: 'fake-parent-Id',
        ),
        itemId: 'fake-item-Id',
      );
      expect(result.isLeft(), true);
    });

    test('upsertCart remote test success - stock info - failure', () async {
      final upsertCartRequest = CartProductRequest.toMaterialRequest(
        salesOrg: fakeSalesOrganisation.salesOrg,
        customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
        shipToCustomerCode: fakeShipToInfo.shipToCustomerCode,
        language: 'EN',
        materialInfo: fakeCartProducts.first.materialInfo,
        itemId: fakeCartProducts.first.materialInfo.parentID,
        quantity: fakeCartProducts.first.materialInfo.quantity.intValue,
        counterOfferDetails:
            fakeCartProducts.first.materialInfo.counterOfferDetails,
      );
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(
        () => cartRemoteDataSource.upsertCart(
          requestParams:
              CartProductRequestDto.fromDomain(upsertCartRequest).toMap(),
        ),
      ).thenAnswer(
        (invocation) async => fakeCartProducts,
      );

      when(
        () => stockInfoRemoteDataSource.getMaterialStockInfoList(
          materialNumbers: [
            fakeCartProducts.first.materialInfo.materialNumber.getOrCrash()
          ],
          salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
          selectedCustomerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
        ),
      ).thenAnswer(
        (invocation) async => [MaterialStockInfo.empty()],
      );

      when(
        () => stockInfoRemoteDataSource.getStockInfo(
          materialNumber: fakeCartProducts.first.materialNumberString,
          salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
          selectedCustomerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
        ),
      ).thenThrow(
        fakeException,
      );

      final result = await cartRepository.upsertCart(
        counterOfferDetails:
            fakeCartProducts.first.materialInfo.counterOfferDetails,
        quantity: fakeCartProducts.first.materialInfo.quantity.intValue,
        language: Language.english(),
        shipToInfo: fakeShipToInfo,
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisationConfig: fakeSalesOrganisationConfigs,
        salesOrganisation: fakeSalesOrganisation,
        materialInfo: fakeCartProducts.first.materialInfo,
        itemId: fakeCartProducts.first.materialInfo.parentID,
      );

      expect(result.getOrElse(() => []), fakeCartProducts);
    });

    test('upsertCart remote test success - update stock info - success',
        () async {
      final upsertCartRequest = CartProductRequest.toMaterialRequest(
        salesOrg: fakeSalesOrganisation.salesOrg,
        customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
        shipToCustomerCode: fakeShipToInfo.shipToCustomerCode,
        language: 'EN',
        materialInfo: fakeCartProducts.first.materialInfo,
        itemId: fakeCartProducts.first.materialInfo.parentID,
        quantity: fakeCartProducts.first.materialInfo.quantity.intValue,
        counterOfferDetails:
            fakeCartProducts.first.materialInfo.counterOfferDetails,
      );
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(
        () => cartRemoteDataSource.upsertCart(
          requestParams:
              CartProductRequestDto.fromDomain(upsertCartRequest).toMap(),
        ),
      ).thenAnswer(
        (invocation) async => fakeCartProducts,
      );
      when(
        () => stockInfoRemoteDataSource.getStockInfo(
          materialNumber: fakeCartProducts.first.materialNumberString,
          salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
          selectedCustomerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
        ),
      ).thenAnswer(
        (invocation) async => StockInfo.empty(),
      );

      when(
        () => stockInfoRemoteDataSource.getMaterialStockInfoList(
          materialNumbers: [
            fakeCartProducts.first.materialInfo.materialNumber.getOrCrash()
          ],
          salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
          selectedCustomerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
        ),
      ).thenAnswer(
        (invocation) async => [
          MaterialStockInfo.empty().copyWith(
            materialNumber: fakeCartProducts.first.materialInfo.materialNumber,
            stockInfos: [StockInfo.empty()],
          )
        ],
      );

      final result = await cartRepository.upsertCart(
        counterOfferDetails:
            fakeCartProducts.first.materialInfo.counterOfferDetails,
        quantity: fakeCartProducts.first.materialInfo.quantity.intValue,
        language: Language.english(),
        shipToInfo: fakeShipToInfo,
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisationConfig: fakeSalesOrganisationConfigs,
        salesOrganisation: fakeSalesOrganisation,
        materialInfo: fakeCartProducts.first.materialInfo,
        itemId: fakeCartProducts.first.materialInfo.parentID,
      );

      expect(result.getOrElse(() => []), [
        fakeCartProducts.first.copyWith(
          stockInfoList: [StockInfo.empty()],
        )
      ]);
    });

    test('upsertCart exceed maximum quantity', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      final result = await cartRepository.upsertCart(
        counterOfferDetails: RequestCounterOfferDetails.empty(),
        quantity: 100000,
        language: Language.english(),
        shipToInfo: fakeShipToInfo,
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisationConfig: fakeSalesOrganisationConfigs,
        salesOrganisation: fakeSalesOrganisation,
        materialInfo: MaterialInfo.empty().copyWith(
          materialNumber: MaterialNumber('fake-material-number'),
          type: MaterialInfoType('material'),
          parentID: 'fake-parent-Id',
        ),
        itemId: 'fake-item-Id',
      );
      expect(result.isLeft(), true);
      expect(
        result,
        Left(
          ApiFailure.maximumCartQuantityExceed(
            mockConfig.maximumCartQuantity.toString(),
          ),
        ),
      );
    });

    test('upsertCartWithBonus test left', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      final materialInfo = MaterialInfo.empty().copyWith(
        materialNumber: MaterialNumber('fake-material-number'),
        type: MaterialInfoType('material'),
        parentID: 'fake-parent-Id',
        quantity: MaterialQty(1),
      );
      final upsertCartRequest = CartProductRequest.toMaterialRequest(
        salesOrg: fakeSalesOrg,
        customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
        shipToCustomerCode: fakeShipToInfo.shipToCustomerCode,
        quantity: 1,
        itemId: 'fake-item-Id',
        language: 'EN',
        materialInfo: materialInfo,
        counterOfferDetails: RequestCounterOfferDetails.empty(),
      );
      when(
        () => cartRemoteDataSource.upsertCart(
          requestParams:
              CartProductRequestDto.fromDomain(upsertCartRequest).toMap(),
        ),
      ).thenThrow(
        (invocation) async => MockException(),
      );

      final result = await cartRepository.upsertCartWithBonus(
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        shipToInfo: fakeShipToInfo,
        counterOfferDetails: RequestCounterOfferDetails.empty(),
        language: Language.english(),
        product: PriceAggregate.empty().copyWith(
          materialInfo: materialInfo,
        ),
        salesOrganisationConfig: fakeSalesOrganisationConfigs,
      );
      expect(result.isLeft(), true);
    });

    test('upsertCartWithBonus test success', () async {
      final upsertCartRequest = CartProductRequest.toMaterialRequest(
        salesOrg: fakeSalesOrganisation.salesOrg,
        customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
        shipToCustomerCode: fakeShipToInfo.shipToCustomerCode,
        language: 'EN',
        materialInfo: fakeCartProducts.first.materialInfo,
        itemId: fakeCartProducts.first.materialInfo.parentID,
        quantity: 1,
        counterOfferDetails:
            fakeCartProducts.first.materialInfo.counterOfferDetails,
      );
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(
        () => cartRemoteDataSource.upsertCart(
          requestParams:
              CartProductRequestDto.fromDomain(upsertCartRequest).toMap(),
        ),
      ).thenAnswer(
        (invocation) async => fakeCartProducts,
      );

      final result = await cartRepository.upsertCartWithBonus(
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisation: fakeSalesOrganisation,
        shipToInfo: fakeShipToInfo,
        language: Language.english(),
        product: fakeCartProducts.first,
        salesOrganisationConfig: fakeSalesOrganisationConfigs,
        counterOfferDetails:
            fakeCartProducts.first.materialInfo.counterOfferDetails,
      );
      expect(result.getOrElse(() => []), [
        fakeCartProducts.first.copyWith(stockInfoList: [StockInfo.empty()])
      ]);
    });

    test('Test update stock info with upsert cart', () async {
      final upsertCartRequest = CartProductRequest.toMaterialRequest(
        salesOrg: fakeSalesOrganisation.salesOrg,
        customerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
        shipToCustomerCode: fakeShipToInfo.shipToCustomerCode,
        language: 'EN',
        materialInfo: fakeCartProducts.first.materialInfo,
        itemId: fakeCartProducts.first.materialInfo.parentID,
        quantity: fakeCartProducts.first.materialInfo.quantity.intValue,
        counterOfferDetails:
            fakeCartProducts.first.materialInfo.counterOfferDetails,
      );
      when(() => mockConfig.appFlavor).thenReturn(Flavor.uat);
      when(
        () => cartRemoteDataSource.upsertCart(
          requestParams:
              CartProductRequestDto.fromDomain(upsertCartRequest).toMap(),
        ),
      ).thenAnswer(
        (invocation) async => fakeCartProducts,
      );

      when(
        () => stockInfoRemoteDataSource.getMaterialStockInfoList(
          materialNumbers: [
            fakeCartProducts.first.materialInfo.materialNumber.getOrCrash()
          ],
          salesOrg: fakeSalesOrganisation.salesOrg.getOrCrash(),
          selectedCustomerCode: fakeCustomerCodeInfo.customerCodeSoldTo,
        ),
      ).thenAnswer(
        (invocation) async => [
          MaterialStockInfo.empty().copyWith(
            materialNumber: fakeCartProducts.first.materialInfo.materialNumber,
            stockInfos: [
              StockInfo.empty().copyWith(
                materialNumber:
                    fakeCartProducts.first.materialInfo.materialNumber,
                inStock: MaterialInStock('Yes'),
              )
            ],
          )
        ],
      );

      final result = await cartRepository.upsertCart(
        counterOfferDetails:
            fakeCartProducts.first.materialInfo.counterOfferDetails,
        quantity: fakeCartProducts.first.materialInfo.quantity.intValue,
        language: Language.english(),
        shipToInfo: fakeShipToInfo,
        customerCodeInfo: fakeCustomerCodeInfo,
        salesOrganisationConfig: fakeSalesOrganisationConfigs,
        salesOrganisation: fakeSalesOrganisation,
        materialInfo: fakeCartProducts.first.materialInfo,
        itemId: fakeCartProducts.first.materialInfo.parentID,
      );

      expect(result.getOrElse(() => []), [
        fakeCartProducts.first.copyWith(
          stockInfoList: [
            StockInfo.empty().copyWith(
              materialNumber:
                  fakeCartProducts.first.materialInfo.materialNumber,
              inStock: MaterialInStock('Yes'),
            )
          ],
        )
      ]);
    });
  });
}

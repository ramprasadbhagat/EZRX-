import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/exception.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_item_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/price_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/price_tier.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/cart_storage.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_local.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/stock_info_remote.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/cart_item_dto.dart';
import 'package:ezrxmobile/infrastructure/order/repository/cart_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'order_repository_test.dart';

class MockConfig extends Mock implements Config {}

class MockCartStorage extends Mock implements CartStorage {}

class CountlyServiceMock extends Mock implements CountlyService {}

class StockInfoRemoteDataSourceMock extends Mock
    implements StockInfoRemoteDataSource {}

class StockInfoLocalDataSourceMock extends Mock
    implements StockInfoLocalDataSource {}

void main() {
  late Config mockConfig;
  late CartStorage cartStorageMock;
  late StockInfoLocalDataSourceMock stockInfoLocalDataSource;
  late StockInfoRemoteDataSourceMock stockInfoRemoteDataSource;
  late CountlyService countlyServiceMock;
  late CartRepository cartRepository;
  late CartItem fakeCartItem;
  late SalesOrganisationConfigs mockSalesOrganisationConfigs;
  late SalesOrg mockSalesOrg;
  late SalesOrganisation mockSalesOrganisation;
  late MixpanelService mixpanelService;

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
    cartStorageMock = MockCartStorage();
    countlyServiceMock = CountlyServiceMock();
    mixpanelService = MixpanelServiceMock();
    cartRepository = CartRepository(
      mixpanelService: mixpanelService,
      config: mockConfig,
      cartStorage: cartStorageMock,
      countlyService: countlyServiceMock,
      stockInfoLocalDataSource: stockInfoLocalDataSource,
      stockInfoRemoteDataSource: stockInfoRemoteDataSource,
    );
    mockSalesOrg = SalesOrg('2601');
    mockSalesOrganisation = SalesOrganisation.empty().copyWith(
      salesOrg: mockSalesOrg,
    );
    mockSalesOrganisationConfigs = SalesOrganisationConfigs.empty().copyWith(
      languageFilter: true,
      languageValue: LanguageValue('EN'),
      disablePrincipals: false,
      enableGimmickMaterial: true,
      principalList: ['123', '234', '345'],
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
        plant: fakeShipToInfo.plant,
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

    when(
      () => cartStorageMock.get(
        id: fakeCartItem.id,
      ),
    ).thenAnswer(
      (invocation) => CartItemDto.fromDomain(fakeCartItem),
    );

    when(
      () => cartStorageMock.put(
        id: fakeCartItem.id,
        item: CartItemDto.fromDomain(fakeCartItem),
      ),
    ).thenAnswer(
      (invocation) async => const Right(unit),
    );

    when(
      () => cartStorageMock.put(
        id: fakeCartItem.id,
        item: CartItemDto.fromDomain(fakeCartItem),
      ),
    ).thenAnswer(
      (invocation) async => const Right(unit),
    );

    when(
      () => cartStorageMock.putAll(
        items: {'1': CartItemDto.fromDomain(fakeCartItem)},
      ),
    ).thenAnswer(
      (invocation) async => const Right(unit),
    );

    when(
      () => cartStorageMock.getAll(),
    ).thenAnswer(
      (invocation) => <CartItemDto>[],
    );

    when(
      () => cartStorageMock.clear(),
    ).thenAnswer(
      (invocation) async => const Right(unit),
    );

    when(
      () => cartStorageMock.getAll(),
    ).thenReturn([]);

    when(
      () => cartStorageMock
          .deleteSelectedItems(selectedItemIds: ['0000012345678']),
    ).thenAnswer(
      (invocation) async => Future.delayed(const Duration(seconds: 2)),
    );

    when(
      () => cartStorageMock.delete(
        id: fakeCartItem.id,
      ),
    ).thenAnswer(
      (invocation) async => const Right(unit),
    );

    when(
      () => countlyServiceMock.addCountlyEvent(
        'Delete from Cart',
      ),
    ).thenAnswer(
      (invocation) async => const Right(unit),
    );

    when(
      () => countlyServiceMock.addCountlyEvent(
        'Remove bonus',
      ),
    ).thenAnswer(
      (invocation) async => const Right(unit),
    );
  });

  test('Test Clear Select Items Cart - Success', () async {
    final result = await cartRepository
        .clearCartOnlySelectedItems(selectedItemIds: ['0000012345678']);
    expect(result.isRight(), true);
  });

  test('Test Fetch Cart - Success', () async {
    final result = cartRepository.fetchCart();
    expect(result.isRight(), true);
  });

  test('Test Fetch Cart - Failure', () async {
    when(
      () => cartStorageMock.getAll(),
    ).thenThrow(
      (invocation) async => MockException(),
    );

    final result = cartRepository.fetchCart();
    expect(result.isLeft(), true);
  });

  test('Test Clear Cart - Success', () async {
    final result = await cartRepository.clearCart();
    expect(result.isRight(), true);
  });

  test('Test Clear Cart - Failure', () async {
    when(
      () => cartStorageMock.clear(),
    ).thenThrow(
      (invocation) async => MockException(),
    );

    final result = await cartRepository.clearCart();
    expect(result.isLeft(), true);
  });

  test('Test Clear Selected Item Cart - Failure', () async {
    when(
      () => cartStorageMock
          .deleteSelectedItems(selectedItemIds: ['0000012345678']),
    ).thenThrow(
      (invocation) async => MockException(),
    );

    final result = await cartRepository
        .clearCartOnlySelectedItems(selectedItemIds: ['0000012345678']);
    expect(result.isLeft(), true);
  });

  test('Test Add Item To Cart - Success', () async {
    final result = await cartRepository.addItemToCart(
      cartItem: fakeCartItem,
      override: true,
      salesOrganisationConfigs: mockSalesOrganisationConfigs,
      customerCodeInfo: fakeCustomerCodeInfo,
      salesOrganisation: mockSalesOrganisation,
      shipToInfo: fakeShipToInfo,
      doNotAllowOutOfStockMaterials: false,
    );
    expect(result.isRight(), false);
  });

  test('Test Add Item To Cart Override False - Success', () async {
    final result = await cartRepository.addItemToCart(
      cartItem: fakeCartItem,
      override: false,
      salesOrganisationConfigs: mockSalesOrganisationConfigs,
      customerCodeInfo: fakeCustomerCodeInfo,
      salesOrganisation: mockSalesOrganisation,
      shipToInfo: fakeShipToInfo,
      doNotAllowOutOfStockMaterials: false,
    );
    expect(result.isRight(), false);
  });

  test('Test Add Item To Cart - Failure', () async {
    when(
      () => cartStorageMock.put(
        id: fakeCartItem.id,
        item: CartItemDto.fromDomain(fakeCartItem),
      ),
    ).thenThrow(
      (invocation) async => MockException(),
    );

    final result = await cartRepository.addItemToCart(
      cartItem: fakeCartItem,
      override: true,
      salesOrganisationConfigs: mockSalesOrganisationConfigs,
      customerCodeInfo: fakeCustomerCodeInfo,
      salesOrganisation: mockSalesOrganisation,
      shipToInfo: fakeShipToInfo,
      doNotAllowOutOfStockMaterials: false,
    );
    expect(result.isLeft(), true);
  });

  test('Test Delete From Cart - Success', () async {
    when(
      () => cartStorageMock.getAll(),
    ).thenAnswer(
      (invocation) => <CartItemDto>[],
    );
    final result = await cartRepository.deleteFromCart(
      item: fakeCartItem,
    );
    expect(result.isRight(), true);
  });

  test('Test Delete From Cart - Failure', () async {
    when(
      () => cartStorageMock.delete(
        id: fakeCartItem.id,
      ),
    ).thenThrow(
      (invocation) async => MockException(),
    );

    final result = await cartRepository.deleteFromCart(
      item: fakeCartItem,
    );
    expect(result.isLeft(), true);
  });

  test('Test Add Remark To Cart Item - Success', () async {
    final material = fakeCartItem.materials.first;
    final itemWithRemark = fakeCartItem.copyWith(materials: [
      material.copyWith.materialInfo(
        remarks: 'FakeRemark',
      ),
    ]);

    when(
      () => cartStorageMock.put(
        id: itemWithRemark.id,
        item: CartItemDto.fromDomain(itemWithRemark),
      ),
    ).thenAnswer(
      (invocation) async => const Right(unit),
    );

    final result = await cartRepository.addRemarkToCartItem(
      item: fakeCartItem,
      remarkMessage: 'FakeRemark',
    );
    expect(result.isRight(), false);
  });

  test('Test Add Remark To Cart Item - Bundle - Success', () async {
    when(
      () => cartStorageMock.get(
        id: fakeCartItem.id,
      ),
    ).thenAnswer(
      (invocation) => CartItemDto.fromDomain(
        fakeCartItem.copyWith(
          itemType: CartItemType.bundle,
          materials: [
            fakeCartItem.materials.first.copyWith(
              bundle: Bundle.empty().copyWith(bundleCode: '1'),
            ),
          ],
        ),
      ),
    );

    final material = fakeCartItem.materials.first;
    final itemWithRemark = fakeCartItem.copyWith(
      itemType: CartItemType.bundle,
      materials: [
        fakeCartItem.materials.first.copyWith(
          bundle: Bundle.empty().copyWith(bundleCode: '1'),
          materialInfo: material.materialInfo.copyWith(
            remarks: 'FakeRemark',
          ),
        ),
      ],
    );

    when(
      () => cartStorageMock.put(
        id: itemWithRemark.id,
        item: CartItemDto.fromDomain(itemWithRemark),
      ),
    ).thenAnswer(
      (invocation) async => const Right(unit),
    );

    final result = await cartRepository.addRemarkToCartItem(
      item: fakeCartItem.copyWith(
        materials: [
          fakeCartItem.materials.first.copyWith(
            bundle: Bundle.empty().copyWith(bundleCode: '1'),
          ),
        ],
      ),
      remarkMessage: 'FakeRemark',
    );
    expect(result.isRight(), true);
  });

  test('Test Add Remark To Cart Item - Failure', () async {
    final material = fakeCartItem.materials.first;
    final itemWithRemark = fakeCartItem.copyWith(materials: [
      material.copyWith.materialInfo(
        remarks: 'FakeRemark',
      ),
    ]);

    when(
      () => cartStorageMock.get(
        id: fakeCartItem.id,
      ),
    ).thenThrow(
      (invocation) async => MockException(),
    );

    when(
      () => cartStorageMock.put(
        id: itemWithRemark.id,
        item: CartItemDto.fromDomain(itemWithRemark),
      ),
    ).thenThrow(
      (invocation) async => MockException(),
    );

    final result = await cartRepository.addRemarkToCartItem(
      item: fakeCartItem,
      remarkMessage: 'FakeRemark',
    );
    expect(result.isLeft(), true);
  });

  test('Test Add Bonus To Cart Item - Success', () async {
    when(
      () => cartStorageMock.get(
        id: fakeCartItem.id,
      ),
    ).thenAnswer(
      (invocation) => CartItemDto.fromDomain(
        fakeCartItem.copyWith(
          materials: [
            fakeCartItem.materials.first.copyWith(
              addedBonusList: [
                MaterialItemBonus.empty().copyWith(
                  additionalBonusFlag: true,
                  materialInfo: MaterialInfo.empty().copyWith(
                    materialNumber: MaterialNumber('123'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    when(
      () => cartStorageMock.put(
        id: fakeCartItem.id,
        item: CartItemDto.fromDomain(
          fakeCartItem.copyWith(
            materials: [
              fakeCartItem.materials.first.copyWith(
                addedBonusList: [
                  MaterialItemBonus.empty().copyWith(
                    additionalBonusFlag: true,
                    materialInfo: MaterialInfo.empty().copyWith(
                      materialNumber: MaterialNumber('123'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ).thenAnswer(
      (invocation) async => const Right(unit),
    );

    final result = await cartRepository.addBonusToCartItem(
      item: fakeCartItem.copyWith(
        materials: [
          fakeCartItem.materials.first.copyWith(
            addedBonusList: [
              MaterialItemBonus.empty().copyWith(
                additionalBonusFlag: true,
                materialInfo: MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber('123'),
                ),
              ),
            ],
          ),
        ],
      ),
      newBonus: MaterialItemBonus.empty().copyWith(
        additionalBonusFlag: true,
        materialInfo: MaterialInfo.empty().copyWith(
          materialNumber: MaterialNumber('123'),
        ),
      ),
      overrideQty: true,
      salesOrganisationConfigs: mockSalesOrganisationConfigs,
      customerCodeInfo: fakeCustomerCodeInfo,
      salesOrganisation: mockSalesOrganisation,
      shipToInfo: fakeShipToInfo,
      doNotAllowOutOfStockMaterials: false,
    );
    expect(result.isRight(), false);
  });

  test('Test Add Bonus To Cart Item - Bundle - Success', () async {
    when(
      () => cartStorageMock.get(
        id: fakeCartItem.id,
      ),
    ).thenAnswer(
      (invocation) => CartItemDto.fromDomain(
        fakeCartItem.copyWith(
          itemType: CartItemType.bundle,
          materials: [
            fakeCartItem.materials.first.copyWith(
              bundle: Bundle.empty().copyWith(bundleCode: '1'),
              addedBonusList: [
                MaterialItemBonus.empty().copyWith(
                  additionalBonusFlag: true,
                  materialInfo: MaterialInfo.empty().copyWith(
                    materialNumber: MaterialNumber('123'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    when(
      () => cartStorageMock.put(
        id: fakeCartItem.id,
        item: CartItemDto.fromDomain(
          fakeCartItem.copyWith(
            itemType: CartItemType.bundle,
            materials: [
              fakeCartItem.materials.first.copyWith(
                bundle: Bundle.empty().copyWith(bundleCode: '1'),
                addedBonusList: [
                  MaterialItemBonus.empty().copyWith(
                    additionalBonusFlag: true,
                    materialInfo: MaterialInfo.empty().copyWith(
                      materialNumber: MaterialNumber('123'),
                    ),
                    inStock: 'Yes',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ).thenAnswer(
      (invocation) async => const Right(unit),
    );

    when(
      () => stockInfoLocalDataSource.getStockInfo(),
    ).thenAnswer(
      (invocation) async => StockInfo.empty().copyWith(
        inStock: MaterialInStock('Yes'),
        materialNumber: MaterialNumber('123'),
      ),
    );

    final result = await cartRepository.addBonusToCartItem(
      item: fakeCartItem.copyWith(
        itemType: CartItemType.bundle,
        materials: [
          fakeCartItem.materials.first.copyWith(
            bundle: Bundle.empty().copyWith(bundleCode: '1'),
            addedBonusList: [
              MaterialItemBonus.empty().copyWith(
                additionalBonusFlag: true,
                materialInfo: MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber('123'),
                ),
              ),
            ],
          ),
        ],
      ),
      newBonus: MaterialItemBonus.empty().copyWith(
        additionalBonusFlag: true,
        materialInfo: MaterialInfo.empty().copyWith(
          materialNumber: MaterialNumber('123'),
        ),
      ),
      overrideQty: true,
      salesOrganisationConfigs: mockSalesOrganisationConfigs,
      customerCodeInfo: fakeCustomerCodeInfo,
      salesOrganisation: mockSalesOrganisation,
      shipToInfo: fakeShipToInfo,
      doNotAllowOutOfStockMaterials: false,
    );
    expect(result.isRight(), true);
  });

  test('Test Add Bonus To Cart Item - Override False - Success', () async {
    when(
      () => cartStorageMock.get(
        id: fakeCartItem.id,
      ),
    ).thenAnswer(
      (invocation) => CartItemDto.fromDomain(
        fakeCartItem.copyWith(
          materials: [
            fakeCartItem.materials.first.copyWith(
              addedBonusList: [
                MaterialItemBonus.empty().copyWith(
                  additionalBonusFlag: true,
                  materialInfo: MaterialInfo.empty().copyWith(
                    materialNumber: MaterialNumber('123'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    when(
      () => cartStorageMock.put(
        id: fakeCartItem.id,
        item: CartItemDto.fromDomain(
          fakeCartItem.copyWith(
            materials: [
              fakeCartItem.materials.first.copyWith(
                addedBonusList: [
                  MaterialItemBonus.empty().copyWith(
                    additionalBonusFlag: true,
                    materialInfo: MaterialInfo.empty().copyWith(
                      materialNumber: MaterialNumber('123'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ).thenAnswer(
      (invocation) async => const Right(unit),
    );
    final result = await cartRepository.addBonusToCartItem(
      item: fakeCartItem.copyWith(
        materials: [
          fakeCartItem.materials.first.copyWith(
            addedBonusList: [
              MaterialItemBonus.empty().copyWith(
                additionalBonusFlag: true,
                materialInfo: MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber('123'),
                ),
              ),
            ],
          ),
        ],
      ),
      newBonus: MaterialItemBonus.empty().copyWith(
        additionalBonusFlag: true,
        materialInfo: MaterialInfo.empty().copyWith(
          materialNumber: MaterialNumber('123'),
        ),
      ),
      overrideQty: false,
      salesOrganisationConfigs: mockSalesOrganisationConfigs,
      customerCodeInfo: fakeCustomerCodeInfo,
      salesOrganisation: mockSalesOrganisation,
      shipToInfo: fakeShipToInfo,
      doNotAllowOutOfStockMaterials: false,
    );
    expect(result.isRight(), false);
  });

  test('Test Add Bonus To Cart Item - additionalBonusFlag False - Success',
      () async {
    when(
      () => cartStorageMock.get(
        id: fakeCartItem.id,
      ),
    ).thenAnswer(
      (invocation) => CartItemDto.fromDomain(
        fakeCartItem.copyWith(
          materials: [
            fakeCartItem.materials.first.copyWith(
              addedBonusList: [
                MaterialItemBonus.empty().copyWith(
                  additionalBonusFlag: false,
                  materialInfo: MaterialInfo.empty().copyWith(
                    materialNumber: MaterialNumber('1234'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    when(
      () => cartStorageMock.put(
        id: fakeCartItem.id,
        item: CartItemDto.fromDomain(
          fakeCartItem.copyWith(
            materials: [
              fakeCartItem.materials.first.copyWith(
                addedBonusList: [
                  MaterialItemBonus.empty().copyWith(
                    additionalBonusFlag: false,
                    materialInfo: MaterialInfo.empty().copyWith(
                      materialNumber: MaterialNumber('123'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ).thenAnswer(
      (invocation) async => const Right(unit),
    );
    final result = await cartRepository.addBonusToCartItem(
      item: fakeCartItem.copyWith(
        materials: [
          fakeCartItem.materials.first.copyWith(
            addedBonusList: [
              MaterialItemBonus.empty().copyWith(
                additionalBonusFlag: true,
                materialInfo: MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber('123'),
                ),
              ),
            ],
          ),
        ],
      ),
      newBonus: MaterialItemBonus.empty().copyWith(
        additionalBonusFlag: true,
        materialInfo: MaterialInfo.empty().copyWith(
          materialNumber: MaterialNumber('123'),
        ),
      ),
      overrideQty: false,
      salesOrganisationConfigs: mockSalesOrganisationConfigs,
      customerCodeInfo: fakeCustomerCodeInfo,
      salesOrganisation: mockSalesOrganisation,
      shipToInfo: fakeShipToInfo,
      doNotAllowOutOfStockMaterials: false,
    );
    expect(result.isRight(), false);
  });

  test('Test Add Bonus To Cart Item - Failure', () async {
    when(
      () => cartStorageMock.put(
        id: fakeCartItem.id,
        item: CartItemDto.fromDomain(fakeCartItem.copyWith(materials: [
          fakeCartItem.materials.first.copyWith(
            addedBonusList: [MaterialItemBonus.empty()],
          )
        ])),
      ),
    ).thenThrow(
      (invocation) async => MockException(),
    );

    final result = await cartRepository.addBonusToCartItem(
      item: fakeCartItem,
      newBonus: MaterialItemBonus.empty(),
      overrideQty: true,
      salesOrganisationConfigs: mockSalesOrganisationConfigs,
      customerCodeInfo: fakeCustomerCodeInfo,
      salesOrganisation: mockSalesOrganisation,
      shipToInfo: fakeShipToInfo,
      doNotAllowOutOfStockMaterials: false,
    );
    expect(result.isLeft(), true);
  });

  test('Test Delete Bonus From Cart Item - Success', () async {
    when(
      () => cartStorageMock.get(
        id: fakeCartItem.id,
      ),
    ).thenAnswer(
      (invocation) => CartItemDto.fromDomain(
        fakeCartItem.copyWith(
          materials: [
            fakeCartItem.materials.first.copyWith(
              addedBonusList: [
                MaterialItemBonus.empty().copyWith(
                  additionalBonusFlag: true,
                  materialInfo: MaterialInfo.empty().copyWith(
                    materialNumber: MaterialNumber('123'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    final result = await cartRepository.deleteBonusFromCartItem(
      item: fakeCartItem,
      deletedBonus: MaterialItemBonus.empty().copyWith(
        additionalBonusFlag: true,
        materialInfo: MaterialInfo.empty().copyWith(
          materialNumber: MaterialNumber('123'),
        ),
      ),
    );
    expect(result.isRight(), false);
  });

  test('Test Delete Bonus From Cart Item - Bundle - Success', () async {
    when(
      () => cartStorageMock.get(
        id: fakeCartItem.id,
      ),
    ).thenAnswer(
      (invocation) => CartItemDto.fromDomain(
        fakeCartItem.copyWith(
          itemType: CartItemType.bundle,
          materials: [
            fakeCartItem.materials.first.copyWith(
              bundle: Bundle.empty().copyWith(bundleCode: '1'),
              addedBonusList: [
                MaterialItemBonus.empty().copyWith(
                  additionalBonusFlag: true,
                  materialInfo: MaterialInfo.empty().copyWith(
                    materialNumber: MaterialNumber('123'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    final result = await cartRepository.deleteBonusFromCartItem(
      item: fakeCartItem.copyWith(
        itemType: CartItemType.bundle,
        materials: [
          fakeCartItem.materials.first.copyWith(
            bundle: Bundle.empty().copyWith(bundleCode: '1'),
          ),
        ],
      ),
      deletedBonus: MaterialItemBonus.empty().copyWith(
        additionalBonusFlag: true,
        materialInfo: MaterialInfo.empty().copyWith(
          materialNumber: MaterialNumber('123'),
        ),
      ),
    );
    expect(result.isRight(), true);
  });

  test('Test Delete Bonus From Cart Item - Failure', () async {
    when(
      () => cartStorageMock.get(
        id: fakeCartItem.id,
      ),
    ).thenThrow(
      (invocation) async => MockException(),
    );

    when(
      () => cartStorageMock.put(
        id: fakeCartItem.id,
        item: CartItemDto.fromDomain(fakeCartItem),
      ),
    ).thenThrow(
      (invocation) async => MockException(),
    );

    final result = await cartRepository.deleteBonusFromCartItem(
      item: fakeCartItem,
      deletedBonus: MaterialItemBonus.empty(),
    );
    expect(result.isLeft(), true);
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

    final result = await cartRepository.updateMaterialDealBonus(
      material: fakeCartItem.materials.first.copyWith(
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
      ),
      shipToInfo: fakeShipToInfo,
      salesOrganisation: mockSalesOrganisation,
      customerCodeInfo: fakeCustomerCodeInfo,
      salesOrganisationConfigs: mockSalesOrganisationConfigs.copyWith(
        enableBatchNumber: false,
      ),
    );
    expect(result.isRight(), false);
  });

  test('Test Update Material Deal Bonus - getStockInfo - Failure', () async {
    when(
      () => stockInfoLocalDataSource.getStockInfo(),
    ).thenThrow(
      (invocation) async => MockException(),
    );

    final result = await cartRepository.updateMaterialDealBonus(
      material: fakeCartItem.materials.first.copyWith(
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
      ),
      shipToInfo: fakeShipToInfo,
      salesOrganisation: mockSalesOrganisation,
      customerCodeInfo: fakeCustomerCodeInfo,
      salesOrganisationConfigs: mockSalesOrganisationConfigs.copyWith(
        enableBatchNumber: false,
      ),
    );
    expect(result.isRight(), false);
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
    when(
      () => cartStorageMock.put(
        id: fakeCartItem.id,
        item: CartItemDto.fromDomain(fakeCartItem),
      ),
    ).thenThrow(
      (invocation) async => MockException(),
    );

    final result = await cartRepository.updateMaterialDealBonus(
      material: fakeCartItem.materials.first,
      shipToInfo: fakeShipToInfo,
      salesOrganisation: mockSalesOrganisation,
      customerCodeInfo: fakeCustomerCodeInfo,
      salesOrganisationConfigs: mockSalesOrganisationConfigs,
    );
    expect(result.isLeft(), true);
  });

  test('Test Add Remark To Bonus Item - Success', () async {
    when(
      () => cartStorageMock.get(
        id: fakeCartItem.id,
      ),
    ).thenAnswer(
      (invocation) => CartItemDto.fromDomain(
        fakeCartItem.copyWith(
          materials: [
            fakeCartItem.materials.first.copyWith(
              addedBonusList: [
                MaterialItemBonus.empty().copyWith(
                  additionalBonusFlag: true,
                  materialInfo: MaterialInfo.empty().copyWith(
                    materialNumber: MaterialNumber('123'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    when(
      () => cartStorageMock.put(
        id: fakeCartItem.id,
        item: CartItemDto.fromDomain(
          fakeCartItem.copyWith(
            materials: [
              fakeCartItem.materials.first.copyWith(
                addedBonusList: [
                  MaterialItemBonus.empty().copyWith(
                    additionalBonusFlag: true,
                    materialInfo: MaterialInfo.empty().copyWith(
                      materialNumber: MaterialNumber('123'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ).thenAnswer(
      (invocation) async => const Right(unit),
    );

    final result = await cartRepository.addRemarkToBonusItem(
      item: fakeCartItem,
      bonus: MaterialItemBonus.empty().copyWith(
        additionalBonusFlag: true,
        materialInfo: MaterialInfo.empty().copyWith(
          materialNumber: MaterialNumber('123'),
        ),
      ),
      remarkMessage: 'FakeBonusRemarks',
    );
    expect(result.isRight(), false);
  });

  test('Test Add Remark To Bonus Item - Bundle - Success', () async {
    when(
      () => cartStorageMock.get(
        id: fakeCartItem.id,
      ),
    ).thenAnswer(
      (invocation) => CartItemDto.fromDomain(
        fakeCartItem.copyWith(
          itemType: CartItemType.bundle,
          materials: [
            fakeCartItem.materials.first.copyWith(
              bundle: Bundle.empty().copyWith(bundleCode: '1'),
              addedBonusList: [
                MaterialItemBonus.empty().copyWith(
                  additionalBonusFlag: true,
                  materialInfo: MaterialInfo.empty().copyWith(
                    materialNumber: MaterialNumber('123'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    when(
      () => cartStorageMock.put(
        id: fakeCartItem.id,
        item: CartItemDto.fromDomain(
          fakeCartItem.copyWith(
            itemType: CartItemType.bundle,
            materials: [
              fakeCartItem.materials.first.copyWith(
                bundle: Bundle.empty().copyWith(bundleCode: '1'),
                addedBonusList: [
                  MaterialItemBonus.empty().copyWith(
                    additionalBonusFlag: true,
                    materialInfo: MaterialInfo.empty().copyWith(
                      materialNumber: MaterialNumber('123'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ).thenAnswer(
      (invocation) async => const Right(unit),
    );

    final result = await cartRepository.addRemarkToBonusItem(
      item: fakeCartItem.copyWith(
        itemType: CartItemType.bundle,
        materials: [
          fakeCartItem.materials.first.copyWith(
            bundle: Bundle.empty().copyWith(bundleCode: '1'),
          ),
        ],
      ),
      bonus: MaterialItemBonus.empty().copyWith(
        additionalBonusFlag: true,
        materialInfo: MaterialInfo.empty().copyWith(
          materialNumber: MaterialNumber('123'),
        ),
      ),
      remarkMessage: 'FakeBonusRemarks',
    );
    expect(result.isRight(), true);
  });

  test('Test Add Remark To Bonus Item - Failure', () async {
    when(
      () => cartStorageMock.get(
        id: fakeCartItem.id,
      ),
    ).thenThrow(
      (invocation) async => MockException(),
    );

    when(
      () => cartStorageMock.put(
        id: fakeCartItem.id,
        item: CartItemDto.fromDomain(fakeCartItem),
      ),
    ).thenThrow(
      (invocation) async => MockException(),
    );

    final result = await cartRepository.addRemarkToBonusItem(
      item: fakeCartItem,
      bonus: MaterialItemBonus.empty(),
      remarkMessage: 'FakeBonusRemarks',
    );
    expect(result.isLeft(), true);
  });

  test('Test Override Cart Item Price - Bundle - Success', () async {
    when(
      () => cartStorageMock.get(
        id: fakeCartItem.id,
      ),
    ).thenAnswer(
      (invocation) => CartItemDto.fromDomain(
        fakeCartItem.copyWith(
          itemType: CartItemType.bundle,
          materials: [
            fakeCartItem.materials.first.copyWith(
              bundle: Bundle.empty().copyWith(bundleCode: '1'),
              addedBonusList: [
                MaterialItemBonus.empty().copyWith(
                  additionalBonusFlag: true,
                  materialInfo: MaterialInfo.empty().copyWith(
                    materialNumber: MaterialNumber('123'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    when(
      () => cartStorageMock.put(
        id: fakeCartItem.id,
        item: CartItemDto.fromDomain(
          fakeCartItem.copyWith(
            materials: [
              fakeCartItem.materials.first.copyWith(
                price: Price.empty().copyWith(
                  materialNumber:
                      fakeCartItem.materials.first.materialInfo.materialNumber,
                ),
              ),
            ],
          ),
        ),
      ),
    ).thenAnswer(
      (invocation) async => const Right(unit),
    );

    final result = await cartRepository.overrideCartItemPrice(
      item: fakeCartItem,
      overridePriceList: [
        Price.empty().copyWith(
          materialNumber:
              fakeCartItem.materials.first.materialInfo.materialNumber,
        ),
      ],
    );
    expect(result.isRight(), true);
  });

  test('Test Override Cart Item Price - Success', () async {
    when(
      () => cartStorageMock.get(
        id: fakeCartItem.id,
      ),
    ).thenAnswer(
      (invocation) => CartItemDto.fromDomain(fakeCartItem),
    );

    when(
      () => cartStorageMock.put(
        id: fakeCartItem.id,
        item: CartItemDto.fromDomain(
          fakeCartItem.copyWith(
            materials: [
              fakeCartItem.materials.first.copyWith(
                price: Price.empty().copyWith(
                  materialNumber:
                      fakeCartItem.materials.first.materialInfo.materialNumber,
                ),
              ),
            ],
          ),
        ),
      ),
    ).thenAnswer(
      (invocation) async => const Right(unit),
    );

    final result = await cartRepository.overrideCartItemPrice(
      item: fakeCartItem,
      overridePriceList: [
        Price.empty().copyWith(
          materialNumber:
              fakeCartItem.materials.first.materialInfo.materialNumber,
        ),
      ],
    );
    expect(result.isRight(), false);
  });

  test('Test Override Cart Item Price - Failure', () async {
    when(
      () => cartStorageMock.get(
        id: fakeCartItem.id,
      ),
    ).thenThrow(
      (invocation) async => MockException(),
    );

    when(
      () => cartStorageMock.put(
        id: fakeCartItem.id,
        item: CartItemDto.fromDomain(
          fakeCartItem.copyWith(
            materials: [
              fakeCartItem.materials.first.copyWith(
                price: Price.empty().copyWith(
                  materialNumber:
                      fakeCartItem.materials.first.materialInfo.materialNumber,
                ),
              ),
            ],
          ),
        ),
      ),
    ).thenThrow(
      (invocation) async => MockException(),
    );

    final result = await cartRepository.overrideCartItemPrice(
      item: fakeCartItem,
      overridePriceList: [
        Price.empty().copyWith(
          materialNumber:
              fakeCartItem.materials.first.materialInfo.materialNumber,
        ),
      ],
    );
    expect(result.isLeft(), true);
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

  test('Test Update Selection In Cart - Success', () async {
    final result = await cartRepository.updateSelectionInCart(
      updatedItem: fakeCartItem,
    );
    expect(result.isRight(), false);
  });

  test('Test Update Selection In Cart - Failure', () async {
    when(
      () => cartStorageMock.put(
        id: fakeCartItem.id,
        item: CartItemDto.fromDomain(fakeCartItem),
      ),
    ).thenThrow(
      (invocation) async => MockException(),
    );

    final result = await cartRepository.updateSelectionInCart(
      updatedItem: fakeCartItem,
    );
    expect(result.isLeft(), true);
  });

  test('Test Update All Selection In Cart - Selected - Success', () async {
    final result = await cartRepository.updateAllSelectionInCart(
      currentCart: [fakeCartItem],
    );
    expect(result.isRight(), false);
  });

  test('Test Update All Selection In Cart - Not Selected - Success', () async {
    final result = await cartRepository.updateAllSelectionInCart(
      currentCart: [
        fakeCartItem.copyWith(
          isSelected: false,
        ),
      ],
    );
    expect(result.isRight(), false);
  });

  test('Test Update All Selection In Cart - Failure', () async {
    when(
      () => cartStorageMock.put(
        id: fakeCartItem.id,
        item: CartItemDto.fromDomain(fakeCartItem),
      ),
    ).thenThrow(
      (invocation) async => MockException(),
    );

    final result = await cartRepository.updateAllSelectionInCart(
      currentCart: [fakeCartItem],
    );
    expect(result.isLeft(), true);
  });

  test('Test Save To Cart With Updated Stock Info - Success', () async {
    final result = await cartRepository.saveToCartWithUpdatedStockInfo(
      salesOrganisationConfigs: mockSalesOrganisationConfigs,
      customerCodeInfo: fakeCustomerCodeInfo,
      salesOrganisation: mockSalesOrganisation,
      shipToInfo: fakeShipToInfo,
      cartItem: [fakeCartItem],
    );
    expect(result.isRight(), false);
  });

  test('Test Save To Cart With Updated Stock Info - Failure', () async {
    when(
      () => cartStorageMock.putAll(
        items: {'1': CartItemDto.fromDomain(fakeCartItem)},
      ),
    ).thenThrow(
      (invocation) async => MockException(),
    );

    final result = await cartRepository.saveToCartWithUpdatedStockInfo(
      salesOrganisationConfigs: mockSalesOrganisationConfigs,
      customerCodeInfo: fakeCustomerCodeInfo,
      salesOrganisation: mockSalesOrganisation,
      shipToInfo: fakeShipToInfo,
      cartItem: [fakeCartItem],
    );
    expect(result.isLeft(), true);
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
        plant: fakeShipToInfo.plant,
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

  test('Test Replace Cart With Items - Success', () async {
    when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

    final result = await cartRepository.replaceCartWithItems(
      items: [fakeCartItem],
      salesOrganisationConfigs: mockSalesOrganisationConfigs,
      customerCodeInfo: fakeCustomerCodeInfo,
      salesOrganisation: mockSalesOrganisation,
      shipToInfo: fakeShipToInfo,
      doNotAllowOutOfStockMaterials: false,
    );
    expect(result.isRight(), false);
  });

  test('Test Replace Cart With Items - Failure', () async {
    when(
      () => cartStorageMock.putAll(
        items: {'1': CartItemDto.fromDomain(fakeCartItem)},
      ),
    ).thenThrow(
      (invocation) async => MockException(),
    );

    final result = await cartRepository.replaceCartWithItems(
      items: [fakeCartItem],
      salesOrganisationConfigs: mockSalesOrganisationConfigs,
      customerCodeInfo: fakeCustomerCodeInfo,
      salesOrganisation: mockSalesOrganisation,
      shipToInfo: fakeShipToInfo,
      doNotAllowOutOfStockMaterials: false,
    );
    expect(result.isLeft(), true);
  });
}

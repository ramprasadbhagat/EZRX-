import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_item_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/price_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/price_tier.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/repository/cart_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class CartRepositoryMock extends Mock implements CartRepository {}

class MockSalesOrgBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class MockCustomerCodeBloc
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

void main() {
  final cartRepositoryMock = CartRepositoryMock();
  final mockSalesOrgBloc = MockSalesOrgBloc();
  final mockCustomerBloc = MockCustomerCodeBloc();

  final mockCartItemList = [
    PriceAggregate.empty().copyWith(
        quantity: 1,
        materialInfo: MaterialInfo.empty().copyWith(
          materialNumber: MaterialNumber('000000000023168451'),
          materialDescription: ' Triglyceride Mosys D',
          principalData: PrincipalData.empty().copyWith(
            principalName: '台灣拜耳股份有限公司',
          ),
          remarks: '',
        ),
        stockInfo: StockInfo.empty().copyWith(
          materialNumber: MaterialNumber('8949542'),
          inStock: MaterialInStock('Yes'),
          expiryDate: ExpiryDate('NA'),
          salesDistrict: '',
          batch: '',
        )),
    PriceAggregate.empty().copyWith(
        quantity: 1,
        materialInfo: MaterialInfo.empty().copyWith(
          materialNumber: MaterialNumber('000000000023168452'),
          materialDescription: ' Triglyceride Mosys D',
          principalData: PrincipalData.empty().copyWith(
            principalName: '台灣拜耳股份有限公司',
          ),
          remarks: '',
        ),
        stockInfo: StockInfo.empty().copyWith(
          materialNumber: MaterialNumber('8949542'),
          inStock: MaterialInStock('Yes'),
          expiryDate: ExpiryDate('NA'),
          salesDistrict: '',
          batch: '',
        )),
  ];

  // final mockCartItemList2 = [
  //   PriceAggregate.empty().copyWith(
  //     quantity: 1,
  //     materialInfo: MaterialInfo.empty().copyWith(
  //       materialNumber: MaterialNumber('000000000023168451'),
  //       materialDescription: ' Triglyceride Mosys D',
  //       principalData: PrincipalData.empty().copyWith(
  //         principalName: '台灣拜耳股份有限公司',
  //       ),
  //       remarks: '',
  //     ),
  //   ),
  //   PriceAggregate.empty().copyWith(
  //     quantity: 1,
  //     materialInfo: MaterialInfo.empty().copyWith(
  //       materialNumber: MaterialNumber('000000000023168456'),
  //       materialDescription: ' Triglyceride Mosys D',
  //       principalData: PrincipalData.empty().copyWith(
  //         principalName: '台灣拜耳股份有限公司',
  //       ),
  //       remarks: '',
  //     ),
  //   ),
  // ];

  final mockStockInfo = StockInfo.empty().copyWith(
    materialNumber: MaterialNumber('8949542'),
    inStock: MaterialInStock('Yes'),
    expiryDate: ExpiryDate('NA'),
    salesDistrict: '',
    batch: '',
  );

  final mockMaterialItemList = [
    MaterialNumber('111111111'),
  ];
  // final mockMaterialItemList2 = [
  //   MaterialNumber('111111111'),
  //   MaterialNumber('000000000023168451'),
  // ];

  const remarkText = '1234';

  final mockItemWithRemarks = PriceAggregate.empty().copyWith(
    quantity: 1,
    materialInfo: MaterialInfo.empty().copyWith(
      materialNumber: MaterialNumber('000000000023168451'),
      materialDescription: ' Triglyceride Mosys D',
      principalData: PrincipalData.empty().copyWith(
        principalName: '台灣拜耳股份有限公司',
      ),
      remarks: remarkText,
    ),
  );

  final priceTierItem1 = PriceTierItem.empty().copyWith(
    type: '',
    applyBonus: false,
    sequence: 1,
    quantity: 1,
    rate: 800,
  );
  final priceTierItem2 = PriceTierItem.empty().copyWith(
    type: '',
    applyBonus: false,
    sequence: 1,
    quantity: 3,
    rate: 850,
  );
  final priceTierItem3 = PriceTierItem.empty().copyWith(
    type: '',
    applyBonus: false,
    sequence: 1,
    quantity: 5,
    rate: 900,
  );

  final priceTierItem4 = PriceTierItem.empty().copyWith(
    type: '',
    applyBonus: false,
    sequence: 1,
    quantity: 1,
    rate: 900,
  );
  final priceTierItem5 = PriceTierItem.empty().copyWith(
    type: '',
    applyBonus: false,
    sequence: 1,
    quantity: 3,
    rate: 950,
  );
  final priceTierItem6 = PriceTierItem.empty().copyWith(
    type: '',
    applyBonus: false,
    sequence: 1,
    quantity: 5,
    rate: 1000,
  );

  final mockZmgCartItemList = <PriceAggregate>[
    PriceAggregate.empty().copyWith(
      quantity: 1,
      materialInfo: MaterialInfo.empty().copyWith(
        materialNumber: MaterialNumber('000000000023168459'),
        materialDescription: ' Triglyceride Mosys D',
        principalData: PrincipalData.empty().copyWith(
          principalName: '台灣拜耳股份有限公司',
        ),
      ),
      price: Price.empty().copyWith(
        materialNumber: MaterialNumber('000000000023168459'),
        zmgDiscount: true,
        tiers: [
          PriceTier.empty().copyWith(
            tier: 'c',
            items: [
              priceTierItem1,
              priceTierItem2,
              priceTierItem3,
            ],
          ),
        ],
      ),
    ),
    PriceAggregate.empty().copyWith(
      quantity: 1,
      materialInfo: MaterialInfo.empty().copyWith(
        materialNumber: MaterialNumber('000000000023168460'),
        materialDescription: ' Triglyceride Mosys D',
        principalData: PrincipalData.empty().copyWith(
          principalName: '台灣拜耳股份有限公司',
        ),
      ),
      price: Price.empty().copyWith(
        materialNumber: MaterialNumber('000000000023168460'),
        zmgDiscount: true,
        tiers: [
          PriceTier.empty().copyWith(
            tier: 'c',
            items: [
              priceTierItem4,
              priceTierItem5,
              priceTierItem6,
            ],
          ),
        ],
      ),
    ),
  ];

  group(
    'Testing CartBloc',
    () {
      setUp(() {
        when(() => cartRepositoryMock.initCartStorage())
            .thenAnswer((invocation) async => const Right(unit));
        when(() => mockCustomerBloc.state)
            .thenReturn(CustomerCodeState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          isFetching: false,
        ));
        when(() => mockSalesOrgBloc.state)
            .thenReturn(SalesOrgState.initial().copyWith());
      });
      blocTest<CartBloc, CartState>(
        'Initialize CartBloc adn fetch',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(() => cartRepositoryMock.getStockInfoMaterialList(
                    materialList: <PriceAggregate>[],
                    customerCodeInfo: CustomerCodeInfo.empty(),
                    salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
                    salesOrganisation: SalesOrganisation.empty(),
                    shipToInfo: ShipToInfo.empty(),
                  ))
              .thenAnswer(
                  (invocation) async => const Right(<PriceAggregate>[]));
          when(() => cartRepositoryMock.fetchCartItems()).thenAnswer(
              (invocation) async => const Right(<PriceAggregate>[]));
        },
        act: (bloc) => bloc
          ..add(const CartEvent.initialized())
          ..add(CartEvent.fetch(
            customerCodeInfo: CustomerCodeInfo.empty(),
            doNotAllowOutOfStockMaterials: true,
            salesOrganisation: SalesOrganisation.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            shipToInfo: ShipToInfo.empty(),
          )),
        expect: () => [
          CartState.initial(),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: none(),
            cartItemList: <PriceAggregate>[],
            isFetching: false,
          ),
        ],
      );

      blocTest<CartBloc, CartState>(
        'Initialize CartBloc adn fetch Stock Fail',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(() => cartRepositoryMock.getStockInfoMaterialList(
                materialList: <PriceAggregate>[mockCartItemList.first],
                customerCodeInfo: CustomerCodeInfo.empty(),
                salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
                salesOrganisation: SalesOrganisation.empty(),
                shipToInfo: ShipToInfo.empty(),
              )).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('Fake-Error'),
            ),
          );
          when(() => cartRepositoryMock.fetchCartItems()).thenAnswer(
              (invocation) async =>
                  Right(<PriceAggregate>[mockCartItemList.first]));
        },
        act: (bloc) => bloc
          ..add(const CartEvent.initialized())
          ..add(CartEvent.fetch(
            customerCodeInfo: CustomerCodeInfo.empty(),
            doNotAllowOutOfStockMaterials: true,
            salesOrganisation: SalesOrganisation.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            shipToInfo: ShipToInfo.empty(),
          )),
        expect: () => [
          CartState.initial(),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: none(),
            cartItemList: <PriceAggregate>[],
            isFetching: false,
          ),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: none(),
            cartItemList: <PriceAggregate>[mockCartItemList.first],
            isFetching: false,
          ),
        ],
      );
      blocTest<CartBloc, CartState>(
        'Fetch with Data CartBloc',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(() => cartRepositoryMock.getStockInfoMaterialList(
                materialList: mockCartItemList,
                customerCodeInfo: CustomerCodeInfo.empty(),
                salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
                salesOrganisation: SalesOrganisation.empty(),
                shipToInfo: ShipToInfo.empty(),
              )).thenAnswer((invocation) async => Right(mockCartItemList));
          when(() => cartRepositoryMock.fetchCartItems())
              .thenAnswer((invocation) async => Right(mockCartItemList));
        },
        act: (bloc) => bloc.add(CartEvent.fetch(
          customerCodeInfo: CustomerCodeInfo.empty(),
          doNotAllowOutOfStockMaterials: true,
          salesOrganisation: SalesOrganisation.empty(),
          salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
          shipToInfo: ShipToInfo.empty(),
        )),
        expect: () => [
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: none(),
            cartItemList: <PriceAggregate>[],
            isFetching: true,
          ),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: none(),
            cartItemList: mockCartItemList,
            isFetching: false,
          ),
        ],
      );
      blocTest<CartBloc, CartState>(
        'Fetch with APIError CartBloc',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(() => cartRepositoryMock.fetchCartItems()).thenAnswer(
              (invocation) async => const Left(ApiFailure.other('Fake-Error')));
        },
        act: (bloc) => bloc.add(CartEvent.fetch(
          customerCodeInfo: CustomerCodeInfo.empty(),
          doNotAllowOutOfStockMaterials: true,
          salesOrganisation: SalesOrganisation.empty(),
          salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
          shipToInfo: ShipToInfo.empty(),
        )),
        expect: () => [
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: none(),
            cartItemList: <PriceAggregate>[],
          ),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('Fake-Error'),
              ),
            ),
          ),
        ],
      );
      blocTest<CartBloc, CartState>(
        'Add to Cart Success CartBloc',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(() => cartRepositoryMock.getStockInfo(
                material: MaterialInfo.empty(),
                customerCodeInfo: CustomerCodeInfo.empty(),
                salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
                salesOrganisation: SalesOrganisation.empty(),
                shipToInfo: ShipToInfo.empty(),
              )).thenAnswer((invocation) async => Right(mockStockInfo));
          when(() => cartRepositoryMock.addToCart(
                cartItem: PriceAggregate.empty().copyWith(
                  stockInfo: mockStockInfo,
                ),
              )).thenAnswer((invocation) async => Right(mockCartItemList));

          when(() => cartRepositoryMock.fetchCartItems())
              .thenAnswer((invocation) async => Right(mockCartItemList));

          when((() => cartRepositoryMock.getUpdatedMaterialList(
                  cartItemList: [],
                  selectedItemsMaterialNumber: [],
                  items: [PriceAggregate.empty()])))
              .thenAnswer((invocation) => mockMaterialItemList);
        },
        act: (bloc) => bloc.add(CartEvent.addToCart(
          item: PriceAggregate.empty(),
          customerCodeInfo: CustomerCodeInfo.empty(),
          salesOrganisation: SalesOrganisation.empty(),
          shipToInfo: ShipToInfo.empty(),
          doNotallowOutOfStockMaterial: true,
          salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
        )),
        expect: () => [
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: none(),
            selectedItemsMaterialNumber: [],
            isFetching: true,
          ),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: none(),
            cartItemList: mockCartItemList,
            selectedItemsMaterialNumber: mockMaterialItemList,
            isFetching: false,
          ),
        ],
      );
      blocTest<CartBloc, CartState>(
        'Add to Cart Failure CartBloc',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(() => cartRepositoryMock.getStockInfo(
                material: MaterialInfo.empty(),
                customerCodeInfo: CustomerCodeInfo.empty(),
                salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
                salesOrganisation: SalesOrganisation.empty(),
                shipToInfo: ShipToInfo.empty(),
              )).thenAnswer((invocation) async => Right(mockStockInfo));
          when(() => cartRepositoryMock.addToCart(
                    cartItem: PriceAggregate.empty().copyWith(
                      stockInfo: mockStockInfo,
                    ),
                  ))
              .thenAnswer((invocation) async =>
                  const Left(ApiFailure.other('Fake-Error')));
          when(() => cartRepositoryMock.fetchCartItems()).thenAnswer(
              (invocation) async => const Left(ApiFailure.other('Fake-Error')));
        },
        act: (bloc) => bloc.add(
          CartEvent.addToCart(
            item: PriceAggregate.empty(),
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganisation: SalesOrganisation.empty(),
            shipToInfo: ShipToInfo.empty(),
            doNotallowOutOfStockMaterial: true,
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: none(),
            isFetching: true,
          ),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('Fake-Error'),
              ),
            ),
            isFetching: false,
          ),
        ],
      );

      blocTest<CartBloc, CartState>(
        'Add to Cart fail for No Stock CartBloc',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(() => cartRepositoryMock.getStockInfo(
                material: MaterialInfo.empty(),
                customerCodeInfo: CustomerCodeInfo.empty(),
                salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
                salesOrganisation: SalesOrganisation.empty(),
                shipToInfo: ShipToInfo.empty(),
              )).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('Fake-Error')),
          );
        },
        act: (bloc) => bloc.add(CartEvent.addToCart(
          item: PriceAggregate.empty(),
          customerCodeInfo: CustomerCodeInfo.empty(),
          salesOrganisation: SalesOrganisation.empty(),
          shipToInfo: ShipToInfo.empty(),
          doNotallowOutOfStockMaterial: true,
          salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
        )),
        expect: () => [
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: none(),
            selectedItemsMaterialNumber: [],
            isFetching: true,
          ),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('Product Not Available'))),
            selectedItemsMaterialNumber: [],
            isFetching: false,
          ),
        ],
      );
      blocTest<CartBloc, CartState>(
        'Add to Cart Successful With No Stock',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(() => cartRepositoryMock.getStockInfo(
                material: MaterialInfo.empty(),
                customerCodeInfo: CustomerCodeInfo.empty(),
                salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
                salesOrganisation: SalesOrganisation.empty(),
                shipToInfo: ShipToInfo.empty(),
              )).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('Fake-Error')),
          );
          when(() => cartRepositoryMock.addToCart(
                cartItem: PriceAggregate.empty().copyWith(
                  stockInfo: StockInfo.empty(),
                ),
              )).thenAnswer((invocation) async => Right(mockCartItemList));

          when(() => cartRepositoryMock.fetchCartItems())
              .thenAnswer((invocation) async => Right(mockCartItemList));

          when((() => cartRepositoryMock.getUpdatedMaterialList(
                  cartItemList: [],
                  selectedItemsMaterialNumber: [],
                  items: [PriceAggregate.empty()])))
              .thenAnswer((invocation) => mockMaterialItemList);
        },
        act: (bloc) => bloc.add(CartEvent.addToCart(
          item: PriceAggregate.empty(),
          customerCodeInfo: CustomerCodeInfo.empty(),
          salesOrganisation: SalesOrganisation.empty(),
          shipToInfo: ShipToInfo.empty(),
          doNotallowOutOfStockMaterial: false,
          salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
        )),
        expect: () => [
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: none(),
            selectedItemsMaterialNumber: [],
            isFetching: true,
          ),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: none(),
            cartItemList: mockCartItemList,
            selectedItemsMaterialNumber: mockMaterialItemList,
            isFetching: false,
          ),
        ],
      );

      blocTest<CartBloc, CartState>(
        'Add to Cart Successful With No Stock with doNotAllowOutOfStockMaterials false',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(() => cartRepositoryMock.getStockInfo(
                material: MaterialInfo.empty(),
                customerCodeInfo: CustomerCodeInfo.empty(),
                salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
                salesOrganisation: SalesOrganisation.empty(),
                shipToInfo: ShipToInfo.empty(),
              )).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('Fake-Error')),
          );
          when(() => cartRepositoryMock.addToCart(
                cartItem: PriceAggregate.empty().copyWith(
                  stockInfo: StockInfo.empty(),
                ),
              )).thenAnswer((invocation) async => Right(mockCartItemList));

          when(() => cartRepositoryMock.fetchCartItems())
              .thenAnswer((invocation) async => Right(mockCartItemList));

          when((() => cartRepositoryMock.getUpdatedMaterialList(
                  cartItemList: [],
                  selectedItemsMaterialNumber: [],
                  items: [PriceAggregate.empty()])))
              .thenAnswer((invocation) => mockMaterialItemList);
        },
        act: (bloc) => bloc.add(CartEvent.addToCart(
          item: PriceAggregate.empty(),
          customerCodeInfo: CustomerCodeInfo.empty(),
          salesOrganisation: SalesOrganisation.empty(),
          shipToInfo: ShipToInfo.empty(),
          doNotallowOutOfStockMaterial: false,
          salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
        )),
        expect: () => [
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: none(),
            selectedItemsMaterialNumber: [],
            isFetching: true,
          ),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: none(),
            cartItemList: mockCartItemList,
            selectedItemsMaterialNumber: mockMaterialItemList,
            isFetching: false,
          ),
        ],
      );

      blocTest<CartBloc, CartState>(
        'Remove from Cart Success CartBloc',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(() => cartRepositoryMock.deleteFromCart(
                  cartItem: PriceAggregate.empty()))
              .thenAnswer(
                  (invocation) async => Right([PriceAggregate.empty()]));
          when(() => cartRepositoryMock.fetchCartItems()).thenAnswer(
              (invocation) async => Right([PriceAggregate.empty()]));
        },
        act: (bloc) =>
            bloc.add(CartEvent.removeFromCart(item: PriceAggregate.empty())),
        expect: () => [
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: none(),
            cartItemList: [PriceAggregate.empty()],
            isFetching: false,
          ),
        ],
      );
      blocTest<CartBloc, CartState>(
        'Remove from Cart Failure CartBloc',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(() =>
              cartRepositoryMock.deleteFromCart(
                  cartItem: PriceAggregate.empty())).thenAnswer(
              (invocation) async => const Left(ApiFailure.other('Fake-Error')));
          when(() => cartRepositoryMock.fetchCartItems()).thenAnswer(
              (invocation) async => const Left(ApiFailure.other('Fake-Error')));
        },
        act: (bloc) =>
            bloc.add(CartEvent.removeFromCart(item: PriceAggregate.empty())),
        expect: () => [
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('Fake-Error'),
              ),
            ),
            isFetching: false,
          ),
        ],
      );

      blocTest<CartBloc, CartState>(
        'Select Item from cart',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        seed: () => CartState.initial().copyWith(
          selectedItemsMaterialNumber: [],
          cartItemList: [
            mockCartItemList.first.copyWith(
              quantity: 1,
            )
          ],
          isFetching: false,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.updateSelectedItem(
              cartItem: mockCartItemList.first.copyWith(
                quantity: 1,
              ),
              selectedMaterialList: [],
            ),
          ).thenReturn([mockCartItemList.first.getMaterialNumber]);
        },
        act: (bloc) => bloc.add(
          CartEvent.updateSelectedItem(
            item: mockCartItemList.first.copyWith(quantity: 1),
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [
              mockCartItemList.first.getMaterialNumber
            ],
            cartItemList: [
              mockCartItemList.first.copyWith(
                quantity: 1,
              )
            ],
            isFetching: false,
          ),
        ],
      );

      blocTest<CartBloc, CartState>(
        'Deselect all Item from cart',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        seed: () => CartState.initial().copyWith(
          selectedItemsMaterialNumber: [
            mockCartItemList.first.getMaterialNumber,
            mockCartItemList.last.getMaterialNumber
          ],
          cartItemList: [
            mockCartItemList.first.copyWith(
              quantity: 1,
            ),
            mockCartItemList.last.copyWith(
              quantity: 1,
            )
          ],
          isFetching: false,
        ),
        act: (bloc) => bloc.add(
          const CartEvent.updateSelectAllItems(),
        ),
        expect: () => [
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [],
            cartItemList: [
              mockCartItemList.first.copyWith(
                quantity: 1,
              ),
              mockCartItemList.last.copyWith(
                quantity: 1,
              )
            ],
            isFetching: false,
          ),
        ],
      );

      blocTest<CartBloc, CartState>(
        'Select all Item from cart',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        seed: () => CartState.initial().copyWith(
          selectedItemsMaterialNumber: [],
          cartItemList: [
            mockCartItemList.first.copyWith(
              quantity: 1,
            ),
            mockCartItemList.last.copyWith(
              quantity: 1,
            )
          ],
          isFetching: false,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.updateSelectAll(
              cartItemList: [
                mockCartItemList.first.copyWith(
                  quantity: 1,
                ),
                mockCartItemList.last.copyWith(
                  quantity: 1,
                )
              ],
            ),
          ).thenReturn([
            mockCartItemList.first.getMaterialNumber,
            mockCartItemList.last.getMaterialNumber,
          ]);
        },
        act: (bloc) => bloc.add(
          const CartEvent.updateSelectAllItems(),
        ),
        expect: () => [
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [
              mockCartItemList.first.getMaterialNumber,
              mockCartItemList.last.getMaterialNumber,
            ],
            cartItemList: [
              mockCartItemList.first.copyWith(
                quantity: 1,
              ),
              mockCartItemList.last.copyWith(
                quantity: 1,
              )
            ],
            isFetching: false,
          ),
        ],
      );

      blocTest<CartBloc, CartState>(
        'Add Remarks Failure CartBloc',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        act: (bloc) {
          bloc.add(const CartEvent.remarksChanged(''));
          bloc.add(CartEvent.addRemarksToCartItem(
            item: PriceAggregate.empty(),
            isDelete: false,
          ));
        },
        expect: () => [
          CartState.initial().copyWith(
            isRemarksAdding: false,
            showErrorMessages: false,
          ),
          CartState.initial().copyWith(
            isRemarksAdding: true,
            isFetching: true,
            showErrorMessages: false,
          ),
          CartState.initial().copyWith(
            isRemarksAdding: false,
            isFetching: false,
            showErrorMessages: true,
          ),
        ],
      );

      blocTest<CartBloc, CartState>(
        'Add Remarks fail CartBloc',
        build: () => CartBloc(
          cartRepository: cartRepositoryMock,
        ),
        seed: () => CartState.initial().copyWith(
          cartItemList: mockCartItemList,
          isFetching: false,
          remarks: Remarks('test'),
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.updateCartItem(
              cartItem: mockCartItemList.first.copyWith(
                materialInfo: mockCartItemList.first.materialInfo.copyWith(
                  remarks: 'test',
                ),
              ),
            ),
          ).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('Fake-Error'),
            ),
          );
        },
        act: (bloc) {
          bloc.add(CartEvent.addRemarksToCartItem(
            item: mockCartItemList.first,
            isDelete: false,
          ));
        },
        expect: () => [
          CartState.initial().copyWith(
              cartItemList: mockCartItemList,
              isRemarksAdding: true,
              showErrorMessages: false,
              remarks: Remarks('test')),
          CartState.initial().copyWith(
            cartItemList: mockCartItemList,
            isFetching: false,
            isRemarksAdding: false,
            showErrorMessages: false,
            apiFailureOrSuccessOption: optionOf(const Left(
              ApiFailure.other('Fake-Error'),
            )),
            remarks: Remarks('test'),
          ),
        ],
      );

      blocTest<CartBloc, CartState>(
        'Add Remarks to bonus item fail',
        build: () => CartBloc(
          cartRepository: cartRepositoryMock,
        ),
        seed: () => CartState.initial().copyWith(
          cartItemList: [
            mockCartItemList.first.copyWith(
              addedBonusList: [
                MaterialItemBonus.empty().copyWith(
                  materialInfo: MaterialInfo.empty().copyWith(
                    materialNumber: mockCartItemList.first.getMaterialNumber,
                  ),
                  additionalBonusFlag: false,
                  qty: 1,
                ),
              ],
            ),
          ],
          isFetching: false,
          remarks: Remarks(''),
        ),
        act: (bloc) {
          bloc.add(CartEvent.addRemarksToBonusItem(
            item: mockCartItemList.first,
            bonusItem: MaterialInfo.empty().copyWith(
              materialNumber: mockCartItemList.first.getMaterialNumber,
            ),
            isDelete: false,
          ));
        },
        expect: () => [
          CartState.initial().copyWith(
              cartItemList: [
                mockCartItemList.first.copyWith(
                  addedBonusList: [
                    MaterialItemBonus.empty().copyWith(
                      materialInfo: MaterialInfo.empty().copyWith(
                        materialNumber:
                            mockCartItemList.first.getMaterialNumber,
                      ),
                      additionalBonusFlag: false,
                      qty: 1,
                    ),
                  ],
                ),
              ],
              isRemarksAdding: true,
              showErrorMessages: false,
              remarks: Remarks('')),
          CartState.initial().copyWith(
            cartItemList: [
              mockCartItemList.first.copyWith(
                addedBonusList: [
                  MaterialItemBonus.empty().copyWith(
                    materialInfo: MaterialInfo.empty().copyWith(
                      materialNumber: mockCartItemList.first.getMaterialNumber,
                    ),
                    additionalBonusFlag: false,
                    qty: 1,
                  ),
                ],
              ),
            ],
            isFetching: false,
            isRemarksAdding: false,
            showErrorMessages: true,
            remarks: Remarks(''),
          ),
        ],
      );
      blocTest<CartBloc, CartState>(
        'Update Cart Successful With No Stock',
        seed: () => CartState.initial().copyWith(
          cartItemList: [
            mockCartItemList.first.copyWith(quantity: 1),
          ],
          selectedItemsMaterialNumber: [],
          isFetching: false,
        ),
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(() => cartRepositoryMock.getStockInfo(
                    material: mockCartItemList.first.materialInfo,
                    customerCodeInfo: CustomerCodeInfo.empty(),
                    salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
                    salesOrganisation: SalesOrganisation.empty(),
                    shipToInfo: ShipToInfo.empty(),
                  ))
              .thenAnswer((invocation) async =>
                  const Left(ApiFailure.other('Fake-Error')));
          when(
            () => cartRepositoryMock.updateCartItem(
              cartItem: mockCartItemList.first.copyWith(quantity: 4).copyWith(
                    stockInfo: StockInfo.empty(),
                  ),
            ),
          ).thenAnswer(
            (invocation) async => Right([
              mockCartItemList.first.copyWith(quantity: 4),
            ]),
          );
        },
        act: (bloc) => bloc.add(CartEvent.updateCartItem(
          item: mockCartItemList.first.copyWith(quantity: 4),
          customerCodeInfo: CustomerCodeInfo.empty(),
          doNotallowOutOfStockMaterial: false,
          salesOrganisation: SalesOrganisation.empty(),
          salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
          shipToInfo: ShipToInfo.empty(),
        )),
        expect: () => [
          CartState.initial().copyWith(
            cartItemList: [
              mockCartItemList.first.copyWith(quantity: 1),
            ],
            selectedItemsMaterialNumber: [],
            isFetching: true,
          ),
          CartState.initial().copyWith(
            cartItemList: [
              mockCartItemList.first.copyWith(quantity: 4),
            ],
            selectedItemsMaterialNumber: [],
            isFetching: false,
          ),
        ],
      );
      blocTest<CartBloc, CartState>(
        'Update Cart fail for No Stock',
        seed: () => CartState.initial().copyWith(
          cartItemList: [
            mockCartItemList.first.copyWith(quantity: 1),
          ],
          selectedItemsMaterialNumber: [],
          isFetching: false,
        ),
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(() => cartRepositoryMock.getStockInfo(
                    material: mockCartItemList.first.materialInfo,
                    customerCodeInfo: CustomerCodeInfo.empty(),
                    salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
                    salesOrganisation: SalesOrganisation.empty(),
                    shipToInfo: ShipToInfo.empty(),
                  ))
              .thenAnswer((invocation) async =>
                  const Left(ApiFailure.other('Fake-Error')));
        },
        act: (bloc) => bloc.add(CartEvent.updateCartItem(
          item: mockCartItemList.first.copyWith(quantity: 4),
          customerCodeInfo: CustomerCodeInfo.empty(),
          doNotallowOutOfStockMaterial: true,
          salesOrganisation: SalesOrganisation.empty(),
          salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
          shipToInfo: ShipToInfo.empty(),
        )),
        expect: () => [
          CartState.initial().copyWith(
            cartItemList: [
              mockCartItemList.first.copyWith(quantity: 1),
            ],
            selectedItemsMaterialNumber: [],
            isFetching: true,
          ),
          CartState.initial().copyWith(
            cartItemList: [
              mockCartItemList.first.copyWith(quantity: 1),
            ],
            selectedItemsMaterialNumber: [],
            isFetching: false,
            apiFailureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('Product Not Available'))),
          ),
        ],
      );
      blocTest<CartBloc, CartState>(
        'Add Remarks Success CartBloc',
        setUp: () {
          when(() => cartRepositoryMock.updateCartItem(
                  cartItem: mockItemWithRemarks))
              .thenAnswer((invocation) async => Right([mockItemWithRemarks]));
        },
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        seed: () => CartState.initial().copyWith(
          cartItemList: mockCartItemList,
        ),
        act: (bloc) {
          bloc.add(const CartEvent.remarksChanged(remarkText));
          bloc.add(CartEvent.addRemarksToCartItem(
            item: mockItemWithRemarks,
            isDelete: false,
          ));
        },
        expect: () => [
          CartState.initial().copyWith(
            cartItemList: mockCartItemList,
            remarks: Remarks(remarkText),
          ),
          CartState.initial().copyWith(
            cartItemList: mockCartItemList,
            remarks: Remarks(remarkText),
            isRemarksAdding: true,
            isFetching: true,
          ),
          CartState.initial().copyWith(
            cartItemList: [mockItemWithRemarks],
            isFetching: false,
            remarks: Remarks(''),
            isRemarksAdding: false,
          ),
        ],
      );

      blocTest<CartBloc, CartState>(
        'zmgMaterial 1 add to cart with empty cart',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(() => cartRepositoryMock.getStockInfo(
                material: mockZmgCartItemList.first.materialInfo,
                customerCodeInfo: CustomerCodeInfo.empty(),
                salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
                salesOrganisation: SalesOrganisation.empty(),
                shipToInfo: ShipToInfo.empty(),
              )).thenAnswer((invocation) async => Right(mockStockInfo));
          when(() => cartRepositoryMock.addToCart(
                cartItem: mockZmgCartItemList.first.copyWith(
                  stockInfo: mockStockInfo,
                ),
              )).thenAnswer(
            (invocation) async => Right([mockZmgCartItemList.first]),
          );

          when((() => cartRepositoryMock.getUpdatedMaterialList(
                    cartItemList: [],
                    selectedItemsMaterialNumber: [],
                    items: [mockZmgCartItemList.first],
                  )))
              .thenAnswer((invocation) =>
                  [mockZmgCartItemList.first.getMaterialNumber]);
        },
        act: (bloc) => bloc.add(CartEvent.addToCart(
            item: mockZmgCartItemList.first,
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganisation: SalesOrganisation.empty(),
            shipToInfo: ShipToInfo.empty(),
            doNotallowOutOfStockMaterial: true,
            salesOrganisationConfigs: SalesOrganisationConfigs.empty())),
        expect: () => [
          CartState.initial().copyWith(
            isFetching: true,
          ),
          CartState.initial().copyWith(
            cartItemList: [mockZmgCartItemList.first],
            selectedItemsMaterialNumber: [
              mockZmgCartItemList.first.getMaterialNumber
            ],
            isFetching: false,
          ),
          CartState.initial().copyWith(
            cartItemList: [
              mockZmgCartItemList.first.copyWith(discountedMaterialCount: 1)
            ],
            selectedItemsMaterialNumber: [
              mockZmgCartItemList.first.getMaterialNumber
            ],
            isFetching: false,
          ),
        ],
        verify: (CartBloc bloc) {
          expect(
            bloc.state.cartItemList.first.finalPrice,
            mockZmgCartItemList.first.price
                .copyWith(zmgDiscount: true)
                .priceTireItem
                .last
                .rate,
          );

          expect(
            bloc.state
                .onAddCartDiscountMaterialCount(bloc.state.cartItemList.first),
            1,
          );
        },
      );

      blocTest<CartBloc, CartState>(
        'zmgMaterial add to cart with material in cart',
        seed: () => CartState.initial().copyWith(
          cartItemList: [mockZmgCartItemList.first.copyWith(quantity: 2)],
          selectedItemsMaterialNumber: [],
        ),
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(() => cartRepositoryMock.getStockInfo(
                material: mockZmgCartItemList.last.materialInfo,
                customerCodeInfo: CustomerCodeInfo.empty(),
                salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
                salesOrganisation: SalesOrganisation.empty(),
                shipToInfo: ShipToInfo.empty(),
              )).thenAnswer((invocation) async => Right(mockStockInfo));
          when(
            () => cartRepositoryMock.addToCart(
              cartItem: mockZmgCartItemList.last.copyWith(quantity: 3).copyWith(
                    stockInfo: mockStockInfo,
                  ),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                mockZmgCartItemList.first.copyWith(quantity: 2),
                mockZmgCartItemList.last.copyWith(quantity: 3)
              ],
            ),
          );

          when((() => cartRepositoryMock.getUpdatedMaterialList(
                cartItemList: [
                  mockZmgCartItemList.first.copyWith(quantity: 2),
                ],
                selectedItemsMaterialNumber: [],
                items: [mockZmgCartItemList.last.copyWith(quantity: 3)],
              ))).thenAnswer(
            (invocation) => [mockZmgCartItemList.last.getMaterialNumber],
          );
        },
        act: (bloc) => bloc.add(CartEvent.addToCart(
          item: mockZmgCartItemList.last.copyWith(quantity: 3),
          customerCodeInfo: CustomerCodeInfo.empty(),
          salesOrganisation: SalesOrganisation.empty(),
          salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
          shipToInfo: ShipToInfo.empty(),
          doNotallowOutOfStockMaterial: true,
        )),
        expect: () => [
          CartState.initial().copyWith(
            cartItemList: [
              mockZmgCartItemList.first.copyWith(quantity: 2),
              mockZmgCartItemList.last.copyWith(quantity: 3)
            ],
            selectedItemsMaterialNumber: [
              mockZmgCartItemList.last.getMaterialNumber,
            ],
            isFetching: false,
          ),
          CartState.initial().copyWith(
            cartItemList: [
              mockZmgCartItemList.first
                  .copyWith(quantity: 2, discountedMaterialCount: 5),
              mockZmgCartItemList.last
                  .copyWith(quantity: 3, discountedMaterialCount: 5)
            ],
            selectedItemsMaterialNumber: [
              mockZmgCartItemList.last.getMaterialNumber
            ],
            isFetching: false,
          ),
        ],
        verify: (CartBloc bloc) {
          expect(
            bloc.state.cartItemList.first.finalPrice,
            mockZmgCartItemList.first.price.priceTireItem.first.rate,
          );
          expect(
            bloc.state.cartItemList.last.finalPrice,
            mockZmgCartItemList.last.price.priceTireItem.first.rate,
          );
        },
      );

      blocTest<CartBloc, CartState>(
        'zmgMaterial increment material in cart',
        seed: () => CartState.initial().copyWith(
          cartItemList: [
            mockZmgCartItemList.first.copyWith(quantity: 1),
            mockZmgCartItemList.last.copyWith(quantity: 1)
          ],
          selectedItemsMaterialNumber: [],
          isFetching: false,
        ),
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(() => cartRepositoryMock.getStockInfo(
                material: mockZmgCartItemList.last.materialInfo,
                customerCodeInfo: CustomerCodeInfo.empty(),
                salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
                salesOrganisation: SalesOrganisation.empty(),
                shipToInfo: ShipToInfo.empty(),
              )).thenAnswer((invocation) async => Right(mockStockInfo));
          when(
            () => cartRepositoryMock.updateCartItem(
              cartItem: mockZmgCartItemList.last.copyWith(quantity: 4).copyWith(
                    stockInfo: mockStockInfo,
                  ),
            ),
          ).thenAnswer(
            (invocation) async => Right([
              mockZmgCartItemList.first.copyWith(quantity: 1),
              mockZmgCartItemList.last.copyWith(quantity: 4),
            ]),
          );
        },
        act: (bloc) => bloc.add(CartEvent.updateCartItem(
          item: mockZmgCartItemList.last.copyWith(quantity: 4),
          customerCodeInfo: CustomerCodeInfo.empty(),
          doNotallowOutOfStockMaterial: true,
          salesOrganisation: SalesOrganisation.empty(),
          salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
          shipToInfo: ShipToInfo.empty(),
        )),
        expect: () => [
          CartState.initial().copyWith(
            cartItemList: [
              mockZmgCartItemList.first.copyWith(quantity: 1),
              mockZmgCartItemList.last.copyWith(quantity: 1),
            ],
            selectedItemsMaterialNumber: [],
            isFetching: true,
          ),
          CartState.initial().copyWith(
            cartItemList: [
              mockZmgCartItemList.first.copyWith(quantity: 1),
              mockZmgCartItemList.last.copyWith(quantity: 4),
            ],
            selectedItemsMaterialNumber: [],
            isFetching: false,
          ),
          CartState.initial().copyWith(
            cartItemList: [
              mockZmgCartItemList.first
                  .copyWith(quantity: 1, discountedMaterialCount: 5),
              mockZmgCartItemList.last
                  .copyWith(quantity: 4, discountedMaterialCount: 5),
            ],
            selectedItemsMaterialNumber: [],
            isFetching: false,
          ),
        ],
        verify: (CartBloc bloc) {
          expect(
            bloc.state.cartItemList.first.finalPrice,
            mockZmgCartItemList.first.price
                .copyWith(zmgDiscount: true)
                .priceTireItem
                .first
                .rate,
          );

          expect(
            bloc.state.cartItemList.last.finalPrice,
            mockZmgCartItemList.last.price
                .copyWith(zmgDiscount: true)
                .priceTireItem
                .first
                .rate,
          );
          expect(
            bloc.state
                .onUpdateDiscountMaterialCount(bloc.state.cartItemList.first),
            4,
          );
          expect(bloc.state.zmgMaterialCount, 5);
        },
      );

      blocTest<CartBloc, CartState>(
        'zmgMaterial decrement material in cart',
        seed: () => CartState.initial().copyWith(
          cartItemList: [
            mockZmgCartItemList.first.copyWith(quantity: 1),
            mockZmgCartItemList.last.copyWith(quantity: 4)
          ],
          selectedItemsMaterialNumber: [],
          isFetching: false,
        ),
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(() => cartRepositoryMock.getStockInfo(
                material: mockZmgCartItemList.last.materialInfo,
                customerCodeInfo: CustomerCodeInfo.empty(),
                salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
                salesOrganisation: SalesOrganisation.empty(),
                shipToInfo: ShipToInfo.empty(),
              )).thenAnswer((invocation) async => Right(mockStockInfo));
          when(
            () => cartRepositoryMock.updateCartItem(
              cartItem: mockZmgCartItemList.last.copyWith(quantity: 1).copyWith(
                    stockInfo: mockStockInfo,
                  ),
            ),
          ).thenAnswer(
            (invocation) async => Right([
              mockZmgCartItemList.first.copyWith(quantity: 1),
              mockZmgCartItemList.last.copyWith(quantity: 1),
            ]),
          );
        },
        act: (bloc) => bloc.add(CartEvent.updateCartItem(
          item: mockZmgCartItemList.last.copyWith(quantity: 1),
          customerCodeInfo: CustomerCodeInfo.empty(),
          doNotallowOutOfStockMaterial: true,
          salesOrganisation: SalesOrganisation.empty(),
          salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
          shipToInfo: ShipToInfo.empty(),
        )),
        expect: () => [
          CartState.initial().copyWith(
            cartItemList: [
              mockZmgCartItemList.first.copyWith(quantity: 1),
              mockZmgCartItemList.last.copyWith(quantity: 4),
            ],
            selectedItemsMaterialNumber: [],
            isFetching: true,
          ),
          CartState.initial().copyWith(
            cartItemList: [
              mockZmgCartItemList.first.copyWith(quantity: 1),
              mockZmgCartItemList.last.copyWith(quantity: 1),
            ],
            selectedItemsMaterialNumber: [],
            isFetching: false,
          ),
          CartState.initial().copyWith(
            cartItemList: [
              mockZmgCartItemList.first
                  .copyWith(quantity: 1, discountedMaterialCount: 2),
              mockZmgCartItemList.last
                  .copyWith(quantity: 1, discountedMaterialCount: 2),
            ],
            selectedItemsMaterialNumber: [],
            isFetching: false,
          ),
        ],
        verify: (CartBloc bloc) {
          expect(
            bloc.state.cartItemList.first.finalPrice,
            mockZmgCartItemList.first.price.priceTireItem.last.rate,
          );
          expect(
            bloc.state.cartItemList.last.finalPrice,
            mockZmgCartItemList.last.price.priceTireItem.last.rate,
          );
        },
      );

      blocTest<CartBloc, CartState>(
        'zmgMaterial cart Item update failure',
        seed: () => CartState.initial().copyWith(
          cartItemList: [
            mockZmgCartItemList.first.copyWith(quantity: 1),
          ],
          selectedItemsMaterialNumber: [],
          isFetching: false,
        ),
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(() => cartRepositoryMock.getStockInfo(
                material: mockZmgCartItemList.first.materialInfo,
                customerCodeInfo: CustomerCodeInfo.empty(),
                salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
                salesOrganisation: SalesOrganisation.empty(),
                shipToInfo: ShipToInfo.empty(),
              )).thenAnswer((invocation) async => Right(mockStockInfo));
          when(
            () => cartRepositoryMock.updateCartItem(
              cartItem:
                  mockZmgCartItemList.first.copyWith(quantity: 4).copyWith(
                        stockInfo: mockStockInfo,
                      ),
            ),
          ).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('Fake-Error')),
          );
        },
        act: (bloc) => bloc.add(CartEvent.updateCartItem(
          item: mockZmgCartItemList.first.copyWith(quantity: 4),
          customerCodeInfo: CustomerCodeInfo.empty(),
          doNotallowOutOfStockMaterial: true,
          salesOrganisation: SalesOrganisation.empty(),
          salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
          shipToInfo: ShipToInfo.empty(),
        )),
        expect: () => [
          CartState.initial().copyWith(
            cartItemList: [
              mockZmgCartItemList.first.copyWith(quantity: 1),
            ],
            selectedItemsMaterialNumber: [],
            isFetching: true,
          ),
          CartState.initial().copyWith(
            cartItemList: [
              mockZmgCartItemList.first.copyWith(quantity: 1),
            ],
            apiFailureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('Fake-Error'),
              ),
            ),
            selectedItemsMaterialNumber: [],
            isFetching: false,
          ),
        ],
        verify: (CartBloc bloc) {
          expect(
            bloc.state.cartItemList.first.finalPrice,
            mockZmgCartItemList.first.price.priceTireItem.last.rate,
          );
        },
      );
      blocTest<CartBloc, CartState>(
        'zmgMaterial remove from cart',
        seed: () => CartState.initial().copyWith(
          cartItemList: [
            mockZmgCartItemList.first.copyWith(quantity: 1),
            mockZmgCartItemList.last.copyWith(quantity: 4)
          ],
          selectedItemsMaterialNumber: [],
          isFetching: false,
        ),
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(
            () => cartRepositoryMock.deleteFromCart(
              cartItem: mockZmgCartItemList.last,
            ),
          ).thenAnswer(
            (invocation) async => Right([
              mockZmgCartItemList.first.copyWith(quantity: 1),
            ]),
          );
        },
        act: (bloc) =>
            bloc.add(CartEvent.removeFromCart(item: mockZmgCartItemList.last)),
        expect: () => [
          CartState.initial().copyWith(
            cartItemList: [
              mockZmgCartItemList.first.copyWith(quantity: 1),
            ],
            selectedItemsMaterialNumber: [],
            isFetching: false,
          ),
          CartState.initial().copyWith(
            cartItemList: [
              mockZmgCartItemList.first
                  .copyWith(quantity: 1, discountedMaterialCount: 1),
            ],
            selectedItemsMaterialNumber: [],
            isFetching: false,
          ),
        ],
        verify: (CartBloc bloc) {
          expect(
            bloc.state.cartItemList.first.finalPrice,
            mockZmgCartItemList.first.price.priceTireItem.last.rate,
          );
        },
      );

      blocTest<CartBloc, CartState>(
        'Tire add to cart with material in cart',
        seed: () => CartState.initial().copyWith(
          cartItemList: [
            mockZmgCartItemList.last.copyWith(
              price:
                  mockZmgCartItemList.last.price.copyWith(zmgDiscount: false),
            ),
          ],
          selectedItemsMaterialNumber: [],
        ),
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(() => cartRepositoryMock.getStockInfo(
                material: mockZmgCartItemList.first.materialInfo,
                customerCodeInfo: CustomerCodeInfo.empty(),
                salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
                salesOrganisation: SalesOrganisation.empty(),
                shipToInfo: ShipToInfo.empty(),
              )).thenAnswer((invocation) async => Right(mockStockInfo));
          when(
            () => cartRepositoryMock.addToCart(
              cartItem: mockZmgCartItemList.first.copyWith(
                quantity: 4,
                price: mockZmgCartItemList.first.price
                    .copyWith(zmgDiscount: false),
                stockInfo: mockStockInfo,
              ),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                mockZmgCartItemList.first.copyWith(
                  quantity: 5,
                  price: mockZmgCartItemList.first.price
                      .copyWith(zmgDiscount: false),
                ),
                mockZmgCartItemList.last.copyWith(
                  price: mockZmgCartItemList.last.price
                      .copyWith(zmgDiscount: false),
                ),
              ],
            ),
          );

          when(
            (() => cartRepositoryMock.getUpdatedMaterialList(
                  cartItemList: [
                    mockZmgCartItemList.last.copyWith(
                      price: mockZmgCartItemList.last.price
                          .copyWith(zmgDiscount: false),
                    ),
                  ],
                  selectedItemsMaterialNumber: [],
                  items: [
                    mockZmgCartItemList.first.copyWith(
                      quantity: 4,
                      price: mockZmgCartItemList.first.price
                          .copyWith(zmgDiscount: false),
                    )
                  ],
                )),
          ).thenAnswer(
            (invocation) => [mockZmgCartItemList.first.getMaterialNumber],
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.addToCart(
            item: mockZmgCartItemList.first.copyWith(
              quantity: 4,
              price:
                  mockZmgCartItemList.first.price.copyWith(zmgDiscount: false),
            ),
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganisation: SalesOrganisation.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            shipToInfo: ShipToInfo.empty(),
            doNotallowOutOfStockMaterial: true,
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            cartItemList: [
              mockZmgCartItemList.first.copyWith(
                quantity: 5,
                price: mockZmgCartItemList.first.price
                    .copyWith(zmgDiscount: false),
              ),
              mockZmgCartItemList.last.copyWith(
                price:
                    mockZmgCartItemList.last.price.copyWith(zmgDiscount: false),
              ),
            ],
            selectedItemsMaterialNumber: [
              mockZmgCartItemList.first.getMaterialNumber
            ],
            isFetching: false,
          ),
          CartState.initial().copyWith(
            cartItemList: [
              mockZmgCartItemList.first.copyWith(
                quantity: 5,
                price: mockZmgCartItemList.first.price
                    .copyWith(zmgDiscount: false),
                discountedMaterialCount: 5,
              ),
              mockZmgCartItemList.last.copyWith(
                price:
                    mockZmgCartItemList.last.price.copyWith(zmgDiscount: false),
                discountedMaterialCount: 1,
              ),
            ],
            selectedItemsMaterialNumber: [
              mockZmgCartItemList.first.getMaterialNumber
            ],
            isFetching: false,
          ),
        ],
        verify: (CartBloc bloc) {
          expect(
            bloc.state.cartItemList.first.finalPrice,
            mockZmgCartItemList.first.price.priceTireItem.first.rate,
          );
          expect(
            bloc.state.cartItemList.last.finalPrice,
            mockZmgCartItemList.last.price.priceTireItem.last.rate,
          );
        },
      );

      blocTest<CartBloc, CartState>(
        'Tire update Tire material in cart',
        seed: () => CartState.initial().copyWith(
          cartItemList: [
            mockZmgCartItemList.first.copyWith(
              price:
                  mockZmgCartItemList.first.price.copyWith(zmgDiscount: false),
            ),
            mockZmgCartItemList.last.copyWith(
              price:
                  mockZmgCartItemList.last.price.copyWith(zmgDiscount: false),
            ),
          ],
          selectedItemsMaterialNumber: [],
          isFetching: false,
        ),
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(() => cartRepositoryMock.getStockInfo(
                material: mockZmgCartItemList.first.materialInfo,
                customerCodeInfo: CustomerCodeInfo.empty(),
                salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
                salesOrganisation: SalesOrganisation.empty(),
                shipToInfo: ShipToInfo.empty(),
              )).thenAnswer((invocation) async => Right(mockStockInfo));
          when(
            () => cartRepositoryMock.updateCartItem(
              cartItem: mockZmgCartItemList.first.copyWith(
                quantity: 4,
                price: mockZmgCartItemList.first.price
                    .copyWith(zmgDiscount: false),
                stockInfo: mockStockInfo,
              ),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                mockZmgCartItemList.first.copyWith(
                  quantity: 5,
                  price: mockZmgCartItemList.first.price
                      .copyWith(zmgDiscount: false),
                ),
                mockZmgCartItemList.last.copyWith(
                  price: mockZmgCartItemList.last.price
                      .copyWith(zmgDiscount: false),
                ),
              ],
            ),
          );

          when(
            (() => cartRepositoryMock.getUpdatedMaterialList(
                  cartItemList: [
                    mockZmgCartItemList.first.copyWith(
                      price: mockZmgCartItemList.first.price
                          .copyWith(zmgDiscount: false),
                    ),
                    mockZmgCartItemList.last.copyWith(
                      price: mockZmgCartItemList.last.price
                          .copyWith(zmgDiscount: false),
                    ),
                  ],
                  selectedItemsMaterialNumber: [],
                  items: [
                    mockZmgCartItemList.first.copyWith(
                      quantity: 4,
                      price: mockZmgCartItemList.first.price
                          .copyWith(zmgDiscount: false),
                    )
                  ],
                )),
          ).thenAnswer(
            (invocation) => [mockZmgCartItemList.first.getMaterialNumber],
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.updateCartItem(
            item: mockZmgCartItemList.first.copyWith(
              quantity: 4,
              price:
                  mockZmgCartItemList.first.price.copyWith(zmgDiscount: false),
            ),
            customerCodeInfo: CustomerCodeInfo.empty(),
            doNotallowOutOfStockMaterial: true,
            salesOrganisation: SalesOrganisation.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            cartItemList: [
              mockZmgCartItemList.first.copyWith(
                price: mockZmgCartItemList.first.price
                    .copyWith(zmgDiscount: false),
              ),
              mockZmgCartItemList.last.copyWith(
                price:
                    mockZmgCartItemList.last.price.copyWith(zmgDiscount: false),
              ),
            ],
            selectedItemsMaterialNumber: [],
            isFetching: true,
          ),
          CartState.initial().copyWith(
            cartItemList: [
              mockZmgCartItemList.first.copyWith(
                quantity: 5,
                price: mockZmgCartItemList.first.price
                    .copyWith(zmgDiscount: false),
              ),
              mockZmgCartItemList.last.copyWith(
                price:
                    mockZmgCartItemList.last.price.copyWith(zmgDiscount: false),
              ),
            ],
            selectedItemsMaterialNumber: [],
            isFetching: false,
          ),
          CartState.initial().copyWith(
            cartItemList: [
              mockZmgCartItemList.first.copyWith(
                quantity: 5,
                price: mockZmgCartItemList.first.price
                    .copyWith(zmgDiscount: false),
                discountedMaterialCount: 5,
              ),
              mockZmgCartItemList.last.copyWith(
                price:
                    mockZmgCartItemList.last.price.copyWith(zmgDiscount: false),
                discountedMaterialCount: 1,
              ),
            ],
            selectedItemsMaterialNumber: [],
            isFetching: false,
          ),
        ],
        verify: (CartBloc bloc) {
          expect(
            bloc.state.cartItemList.first.finalPrice,
            mockZmgCartItemList.first.price.priceTireItem.first.rate,
          );
          expect(
            bloc.state.cartItemList.last.finalPrice,
            mockZmgCartItemList.last.price.priceTireItem.last.rate,
          );
        },
      );
      blocTest<CartBloc, CartState>(
        'add a bonus item',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(() => cartRepositoryMock.updateBonusItem(
                cartItem: PriceAggregate.empty(),
                bonusItem: MaterialItemBonus.empty(),
                isUpdatedFromCart: false,
                quantity: 10,
              )).thenAnswer(
            (invocation) async => Right(
              [PriceAggregate.empty()],
            ),
          );
          when(() => cartRepositoryMock.fetchCartItems()).thenAnswer(
            (invocation) async => Right(
              [PriceAggregate.empty()],
            ),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.updateBonusItem(
            cartItem: PriceAggregate.empty(),
            bonusItem: MaterialItemBonus.empty(),
            isUpdateFromCart: false,
            bonusItemCount: 10,
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: none(),
            isFetching: true,
          ),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: none(),
            cartItemList: [PriceAggregate.empty()],
            isFetching: false,
          ),
        ],
      );

      blocTest<CartBloc, CartState>(
        'add a bonus item fail',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(() => cartRepositoryMock.updateBonusItem(
                cartItem: PriceAggregate.empty(),
                bonusItem: MaterialItemBonus.empty(),
                isUpdatedFromCart: false,
                quantity: 10,
              )).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('Fake-Error'),
            ),
          );
          when(() => cartRepositoryMock.fetchCartItems()).thenAnswer(
            (invocation) async => Right(
              [PriceAggregate.empty()],
            ),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.updateBonusItem(
            cartItem: PriceAggregate.empty(),
            bonusItem: MaterialItemBonus.empty(),
            isUpdateFromCart: false,
            bonusItemCount: 10,
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: none(),
            isFetching: true,
          ),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: optionOf(const Left(
              ApiFailure.other('Fake-Error'),
            )),
            cartItemList: [],
            isFetching: false,
          ),
        ],
      );
      blocTest<CartBloc, CartState>(
        'update  bonus item from cart screen',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(() => cartRepositoryMock.updateBonusItem(
                cartItem: PriceAggregate.empty(),
                bonusItem: MaterialItemBonus.empty(),
                isUpdatedFromCart: true,
                quantity: 10,
              )).thenAnswer(
            (invocation) async => Right(
              [PriceAggregate.empty()],
            ),
          );
          when(() => cartRepositoryMock.fetchCartItems()).thenAnswer(
            (invocation) async => Right(
              [PriceAggregate.empty()],
            ),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.updateBonusItem(
            cartItem: PriceAggregate.empty(),
            bonusItem: MaterialItemBonus.empty(),
            isUpdateFromCart: true,
            bonusItemCount: 10,
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: none(),
            isFetching: true,
          ),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: none(),
            cartItemList: [PriceAggregate.empty()],
            isFetching: false,
          ),
        ],
      );
      blocTest<CartBloc, CartState>(
        'remove  bonus item from cart screen',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(() => cartRepositoryMock.deleteBonusItem(
                cartItem: PriceAggregate.empty(),
                bonusItem: MaterialItemBonus.empty(),
                isUpdateFromCart: true,
              )).thenAnswer(
            (invocation) async => Right(
              [PriceAggregate.empty()],
            ),
          );
          when(() => cartRepositoryMock.fetchCartItems()).thenAnswer(
            (invocation) async => Right(
              [PriceAggregate.empty()],
            ),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.deleteBonusItem(
            cartItem: PriceAggregate.empty(),
            bonusItem: MaterialItemBonus.empty(),
            isUpdateFromCart: true,
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: none(),
            isFetching: true,
          ),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: none(),
            cartItemList: [PriceAggregate.empty()],
            isFetching: false,
          ),
        ],
      );

      blocTest<CartBloc, CartState>(
        'update stock info from cart screen',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(() => cartRepositoryMock.updateStockInfo(
                customerCodeInfo: CustomerCodeInfo.empty(),
                salesOrganisation: SalesOrganisation.empty(),
                salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
                shipToInfo: ShipToInfo.empty(),
                user: User.empty(),
              )).thenAnswer(
            (invocation) async => Right(
              [PriceAggregate.empty()],
            ),
          );
          when(() => cartRepositoryMock.fetchCartItems()).thenAnswer(
            (invocation) async => Right(
              [PriceAggregate.empty()],
            ),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.updateStockInfo(
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganisation: SalesOrganisation.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            shipToInfo: ShipToInfo.empty(),
            user: User.empty(),
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: none(),
            isFetching: true,
          ),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: none(),
            cartItemList: [PriceAggregate.empty()],
            isFetching: false,
          ),
        ],
      );
      blocTest<CartBloc, CartState>(
        'failed to load update stock info',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(() => cartRepositoryMock.updateStockInfo(
                    customerCodeInfo: CustomerCodeInfo.empty(),
                    salesOrganisation: SalesOrganisation.empty(),
                    salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
                    shipToInfo: ShipToInfo.empty(),
                    user: User.empty(),
                  ))
              .thenAnswer((invocation) async =>
                  const Left(ApiFailure.other('Fake-Error')));
          when(() => cartRepositoryMock.fetchCartItems()).thenAnswer(
            (invocation) async => Right(
              [PriceAggregate.empty()],
            ),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.updateStockInfo(
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganisation: SalesOrganisation.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            shipToInfo: ShipToInfo.empty(),
            user: User.empty(),
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: none(),
            isFetching: true,
          ),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('Fake-Error'),
              ),
            ),
            cartItemList: [],
            isFetching: false,
          ),
        ],
      );
      blocTest<CartBloc, CartState>(
        'Add remark to the bonus item',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        seed: () => CartState.initial().copyWith(cartItemList: [
          mockCartItemList.first.copyWith(addedBonusList: [
            MaterialItemBonus.empty().copyWith(
              materialInfo: mockCartItemList.first.materialInfo,
            )
          ])
        ], remarks: Remarks('test')),
        setUp: () {
          when(() => cartRepositoryMock.updateBonusItem(
                bonusItem: MaterialItemBonus.empty().copyWith(
                  comment: 'test',
                  materialInfo: mockCartItemList.first.materialInfo
                      .copyWith(remarks: 'test'),
                ),
                cartItem: mockCartItemList.first.copyWith(addedBonusList: [
                  MaterialItemBonus.empty().copyWith(
                    materialInfo: mockCartItemList.first.materialInfo,
                  )
                ]),
                isUpdatedFromCart: true,
                quantity: 0,
              )).thenAnswer(
            (invocation) async => Right(mockCartItemList),
          );
          when(() => cartRepositoryMock.fetchCartItems()).thenAnswer(
            (invocation) async => Right(
              mockCartItemList,
            ),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.addRemarksToBonusItem(
            bonusItem: mockCartItemList.first.materialInfo,
            isDelete: true,
            item: mockCartItemList.first.copyWith(addedBonusList: [
              MaterialItemBonus.empty().copyWith(
                materialInfo: mockCartItemList.first.materialInfo,
              )
            ]),
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
              cartItemList: [
                mockCartItemList.first.copyWith(addedBonusList: [
                  MaterialItemBonus.empty().copyWith(
                    materialInfo: mockCartItemList.first.materialInfo,
                  )
                ])
              ],
              isRemarksAdding: true,
              apiFailureOrSuccessOption: none(),
              isFetching: true,
              remarks: Remarks('test')),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: none(),
            cartItemList: mockCartItemList,
            isFetching: false,
            remarks: Remarks(''),
            isRemarksAdding: false,
          ),
        ],
      );
      blocTest<CartBloc, CartState>(
        'Failed to load remark to the bonus item',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        seed: () => CartState.initial().copyWith(cartItemList: [
          mockCartItemList.first.copyWith(addedBonusList: [
            MaterialItemBonus.empty().copyWith(
              materialInfo: mockCartItemList.first.materialInfo,
            )
          ])
        ], remarks: Remarks('test')),
        setUp: () {
          when(() => cartRepositoryMock.updateBonusItem(
                bonusItem: MaterialItemBonus.empty().copyWith(
                  comment: 'test',
                  materialInfo: mockCartItemList.first.materialInfo
                      .copyWith(remarks: 'test'),
                ),
                cartItem: mockCartItemList.first.copyWith(addedBonusList: [
                  MaterialItemBonus.empty().copyWith(
                    materialInfo: mockCartItemList.first.materialInfo,
                  )
                ]),
                isUpdatedFromCart: true,
                quantity: 0,
              )).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('Fake Error')),
          );
          when(() => cartRepositoryMock.fetchCartItems()).thenAnswer(
            (invocation) async => Right(
              mockCartItemList,
            ),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.addRemarksToBonusItem(
            bonusItem: mockCartItemList.first.materialInfo,
            isDelete: true,
            item: mockCartItemList.first.copyWith(addedBonusList: [
              MaterialItemBonus.empty().copyWith(
                materialInfo: mockCartItemList.first.materialInfo,
              )
            ]),
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
              cartItemList: [
                mockCartItemList.first.copyWith(addedBonusList: [
                  MaterialItemBonus.empty().copyWith(
                    materialInfo: mockCartItemList.first.materialInfo,
                  )
                ])
              ],
              isRemarksAdding: true,
              apiFailureOrSuccessOption: none(),
              isFetching: true,
              remarks: Remarks('test')),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('Fake Error'))),
            cartItemList: [
              mockCartItemList.first.copyWith(addedBonusList: [
                MaterialItemBonus.empty().copyWith(
                  materialInfo: mockCartItemList.first.materialInfo,
                )
              ])
            ],
            isFetching: false,
            remarks: Remarks('test'),
            isRemarksAdding: false,
          ),
        ],
      );

      blocTest<CartBloc, CartState>(
        'update cart',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(() => cartRepositoryMock.updateCart(
                cartItem: [mockCartItemList[0].price],
                materialNumber: mockMaterialItemList[0].displayMatNo,
              )).thenAnswer(
            (invocation) async => Right(mockCartItemList),
          );
          when(() => cartRepositoryMock.fetchCartItems()).thenAnswer(
            (invocation) async => Right(
              mockCartItemList,
            ),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.updateCart(
            item: [mockCartItemList[0].price],
            materialNumber: mockMaterialItemList[0].displayMatNo,
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: none(),
            isFetching: true,
          ),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: none(),
            cartItemList: mockCartItemList,
            isFetching: false,
          ),
        ],
      );
      blocTest<CartBloc, CartState>(
        'Failed to update cart',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(() => cartRepositoryMock.updateCart(
                cartItem: [mockCartItemList[0].price],
                materialNumber: mockMaterialItemList[0].displayMatNo,
              )).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('Fake-Error'),
            ),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.updateCart(
            item: [mockCartItemList[0].price],
            materialNumber: mockMaterialItemList[0].displayMatNo,
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: none(),
            isFetching: true,
          ),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('Fake-Error'),
              ),
            ),
            cartItemList: [],
            isFetching: false,
          ),
        ],
      );

      blocTest<CartBloc, CartState>(
        'Clear cart',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(() => cartRepositoryMock.clear()).thenAnswer(
            (invocation) async => const Right(unit),
          );
        },
        act: (bloc) => bloc.add(
          const CartEvent.clearCart(),
        ),
        expect: () => [
          CartState.initial(),
        ],
      );
    },
  );

  final bonusMaterialNumber = MaterialNumber('000000000023063913');
  final bonus913MockCartItem = PriceAggregate.empty().copyWith(
    quantity: 1,
    materialInfo: MaterialInfo.empty().copyWith(
      materialNumber: bonusMaterialNumber,
      materialDescription: ' Triglyceride Mosys D',
      principalData: PrincipalData.empty().copyWith(
        principalName: '台灣拜耳股份有限公司',
      ),
      remarks: '',
    ),
    stockInfo: StockInfo.empty().copyWith(
      materialNumber: bonusMaterialNumber,
      inStock: MaterialInStock('Yes'),
      expiryDate: ExpiryDate('NA'),
      salesDistrict: '',
      batch: '',
    ),
    price: Price.empty().copyWith(
      materialNumber: bonusMaterialNumber,
      finalPrice: MaterialPrice(540),
      bonuses: [
        PriceBonus(
          items: [
            PriceBonusItem.empty().copyWith(
              calculation: BonusMaterialCalculation('913'),
              qualifyingQuantity: 3,
              bonusMaterials: [
                BonusMaterial.empty().copyWith(
                    materialNumber: bonusMaterialNumber,
                    materialDescription: '(M) TEOSYAL PS RD I 1ML PRFS 2S',
                    bonusQuantity: 1,
                    bonusRatio: 1,
                    qualifyingQuantity: 3,
                    calculation: BonusMaterialCalculation('913'))
              ],
            ),
            PriceBonusItem.empty().copyWith(
              calculation: BonusMaterialCalculation('913'),
              qualifyingQuantity: 5,
              bonusMaterials: [
                BonusMaterial.empty().copyWith(
                    materialNumber: bonusMaterialNumber,
                    materialDescription: '(M) TEOSYAL PS RD I 1ML PRFS 2S',
                    bonusQuantity: 2,
                    bonusRatio: 2,
                    qualifyingQuantity: 5,
                    calculation: BonusMaterialCalculation('913'))
              ],
            ),
            PriceBonusItem.empty().copyWith(
              calculation: BonusMaterialCalculation('913'),
              qualifyingQuantity: 10,
              bonusMaterials: [
                BonusMaterial.empty().copyWith(
                    materialNumber: bonusMaterialNumber,
                    materialDescription: '(M) TEOSYAL PS RD I 1ML PRFS 2S',
                    bonusQuantity: 3,
                    bonusRatio: 3,
                    qualifyingQuantity: 10,
                    calculation: BonusMaterialCalculation('913'))
              ],
            ),
          ],
        ),
      ],
    ),
  );

  final bonus911MockCartItem = PriceAggregate.empty().copyWith(
    quantity: 1,
    materialInfo: MaterialInfo.empty().copyWith(
      materialNumber: bonusMaterialNumber,
      materialDescription: ' Triglyceride Mosys D',
      principalData: PrincipalData.empty().copyWith(
        principalName: '台灣拜耳股份有限公司',
      ),
      remarks: '',
    ),
    stockInfo: StockInfo.empty().copyWith(
      materialNumber: bonusMaterialNumber,
      inStock: MaterialInStock('Yes'),
      expiryDate: ExpiryDate('NA'),
      salesDistrict: '',
      batch: '',
    ),
    price: Price.empty().copyWith(
      materialNumber: bonusMaterialNumber,
      finalPrice: MaterialPrice(540),
      bonuses: [
        PriceBonus(
          items: [
            PriceBonusItem.empty().copyWith(
              calculation: BonusMaterialCalculation('911'),
              qualifyingQuantity: 3,
              bonusMaterials: [
                BonusMaterial.empty().copyWith(
                    materialNumber: bonusMaterialNumber,
                    materialDescription: '(M) TEOSYAL PS RD I 1ML PRFS 2S',
                    bonusQuantity: 1,
                    bonusRatio: 1,
                    qualifyingQuantity: 3,
                    calculation: BonusMaterialCalculation('911'))
              ],
            ),
            PriceBonusItem.empty().copyWith(
              calculation: BonusMaterialCalculation('911'),
              qualifyingQuantity: 5,
              bonusMaterials: [
                BonusMaterial.empty().copyWith(
                    materialNumber: bonusMaterialNumber,
                    materialDescription: '(M) TEOSYAL PS RD I 1ML PRFS 2S',
                    bonusQuantity: 2,
                    bonusRatio: 2,
                    qualifyingQuantity: 5,
                    calculation: BonusMaterialCalculation('911'))
              ],
            ),
            PriceBonusItem.empty().copyWith(
              calculation: BonusMaterialCalculation('911'),
              qualifyingQuantity: 10,
              bonusMaterials: [
                BonusMaterial.empty().copyWith(
                    materialNumber: bonusMaterialNumber,
                    materialDescription: '(M) TEOSYAL PS RD I 1ML PRFS 2S',
                    bonusQuantity: 3,
                    bonusRatio: 3,
                    qualifyingQuantity: 10,
                    calculation: BonusMaterialCalculation('911'))
              ],
            ),
          ],
        ),
      ],
    ),
  );

  final bonus914MockCartItem = PriceAggregate.empty().copyWith(
    quantity: 1,
    materialInfo: MaterialInfo.empty().copyWith(
      materialNumber: bonusMaterialNumber,
      materialDescription: ' Triglyceride Mosys D',
      principalData: PrincipalData.empty().copyWith(
        principalName: '台灣拜耳股份有限公司',
      ),
      remarks: '',
    ),
    stockInfo: StockInfo.empty().copyWith(
      materialNumber: bonusMaterialNumber,
      inStock: MaterialInStock('Yes'),
      expiryDate: ExpiryDate('NA'),
      salesDistrict: '',
      batch: '',
    ),
    price: Price.empty().copyWith(
      materialNumber: bonusMaterialNumber,
      finalPrice: MaterialPrice(540),
      bonuses: [
        PriceBonus(
          items: [
            PriceBonusItem.empty().copyWith(
              calculation: BonusMaterialCalculation('914'),
              qualifyingQuantity: 3,
              bonusMaterials: [
                BonusMaterial.empty().copyWith(
                    materialNumber: bonusMaterialNumber,
                    materialDescription: '(M) TEOSYAL PS RD I 1ML PRFS 2S',
                    bonusQuantity: 1,
                    bonusRatio: 1,
                    qualifyingQuantity: 3,
                    calculation: BonusMaterialCalculation('914'))
              ],
            ),
            PriceBonusItem.empty().copyWith(
              calculation: BonusMaterialCalculation('914'),
              qualifyingQuantity: 5,
              bonusMaterials: [
                BonusMaterial.empty().copyWith(
                    materialNumber: bonusMaterialNumber,
                    materialDescription: '(M) TEOSYAL PS RD I 1ML PRFS 2S',
                    bonusQuantity: 2,
                    bonusRatio: 1,
                    qualifyingQuantity: 5,
                    calculation: BonusMaterialCalculation('914'))
              ],
            ),
            PriceBonusItem.empty().copyWith(
              calculation: BonusMaterialCalculation('914'),
              qualifyingQuantity: 10,
              bonusMaterials: [
                BonusMaterial.empty().copyWith(
                    materialNumber: bonusMaterialNumber,
                    materialDescription: '(M) TEOSYAL PS RD I 1ML PRFS 2S',
                    bonusQuantity: 3,
                    bonusRatio: 1,
                    qualifyingQuantity: 10,
                    calculation: BonusMaterialCalculation('914'))
              ],
            ),
          ],
        ),
      ],
    ),
  );

  final bonus915MockCartItem = PriceAggregate.empty().copyWith(
    quantity: 1,
    materialInfo: MaterialInfo.empty().copyWith(
      materialNumber: bonusMaterialNumber,
      materialDescription: ' Triglyceride Mosys D',
      principalData: PrincipalData.empty().copyWith(
        principalName: '台灣拜耳股份有限公司',
      ),
      remarks: '',
    ),
    stockInfo: StockInfo.empty().copyWith(
      materialNumber: bonusMaterialNumber,
      inStock: MaterialInStock('Yes'),
      expiryDate: ExpiryDate('NA'),
      salesDistrict: '',
      batch: '',
    ),
    price: Price.empty().copyWith(
      materialNumber: bonusMaterialNumber,
      finalPrice: MaterialPrice(540),
      bonuses: [
        PriceBonus(
          items: [
            PriceBonusItem.empty().copyWith(
              calculation: BonusMaterialCalculation('915'),
              qualifyingQuantity: 3,
              bonusMaterials: [
                BonusMaterial.empty().copyWith(
                    materialNumber: bonusMaterialNumber,
                    materialDescription: '(M) TEOSYAL PS RD I 1ML PRFS 2S',
                    bonusQuantity: 1,
                    bonusRatio: 1,
                    qualifyingQuantity: 3,
                    calculation: BonusMaterialCalculation('915'))
              ],
            ),
            PriceBonusItem.empty().copyWith(
              calculation: BonusMaterialCalculation('915'),
              qualifyingQuantity: 5,
              bonusMaterials: [
                BonusMaterial.empty().copyWith(
                    materialNumber: bonusMaterialNumber,
                    materialDescription: '(M) TEOSYAL PS RD I 1ML PRFS 2S',
                    bonusQuantity: 2,
                    bonusRatio: 1,
                    qualifyingQuantity: 5,
                    calculation: BonusMaterialCalculation('915'))
              ],
            ),
            PriceBonusItem.empty().copyWith(
              calculation: BonusMaterialCalculation('915'),
              qualifyingQuantity: 10,
              bonusMaterials: [
                BonusMaterial.empty().copyWith(
                    materialNumber: bonusMaterialNumber,
                    materialDescription: '(M) TEOSYAL PS RD I 1ML PRFS 2S',
                    bonusQuantity: 3,
                    bonusRatio: 1,
                    qualifyingQuantity: 10,
                    calculation: BonusMaterialCalculation('915'))
              ],
            ),
          ],
        ),
      ],
    ),
  );

  group(
    'Test Bonus CartBloc',
    () {
      setUpAll(() {
        when(
          () => cartRepositoryMock.getStockInfoList(
            customerCodeInfo: CustomerCodeInfo.empty(),
            materialInfoList: [
              MaterialInfo.empty().copyWith(
                materialNumber: bonusMaterialNumber,
              ),
            ],
            salesOrganisation: SalesOrganisation.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ).thenAnswer(
          (invocation) async => Right(
            <StockInfo>[
              StockInfo.empty().copyWith(materialNumber: bonusMaterialNumber),
            ],
          ),
        );
      });
      blocTest<CartBloc, CartState>(
        'Bonus item added to cart with no quantity Bonus',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(
            () => cartRepositoryMock.getStockInfo(
              material: bonus913MockCartItem.materialInfo,
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              mockStockInfo.copyWith(
                materialNumber: bonusMaterialNumber,
              ),
            ),
          );
          when(
            () => cartRepositoryMock.addToCart(
              cartItem: bonus913MockCartItem.copyWith(
                quantity: 2,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                bonus913MockCartItem.copyWith(
                  quantity: 2,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                )
              ],
            ),
          );

          when(
            () => cartRepositoryMock.getUpdatedMaterialList(
              cartItemList: [],
              selectedItemsMaterialNumber: [],
              items: [
                bonus913MockCartItem.copyWith(
                  quantity: 2,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                ),
              ],
            ),
          ).thenAnswer((invocation) => [bonusMaterialNumber]);
        },
        act: (bloc) => bloc.add(
          CartEvent.addToCart(
            item: bonus913MockCartItem.copyWith(quantity: 2),
            customerCodeInfo: CustomerCodeInfo.empty(),
            doNotallowOutOfStockMaterial: true,
            salesOrganisation: SalesOrganisation.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            isFetching: true,
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: 2,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ],
            apiFailureOrSuccessOption: none(),
            isFetching: false,
          )
        ],
        verify: (CartBloc bloc) {
          expect(
            bloc.state.cartItemList.first.finalPrice,
            bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0),
          );
          expect(
            bloc.state.cartItemList.first.finalPriceTotal,
            bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0) * 2,
          );
          expect(
            // ignore: invalid_use_of_protected_member
            bloc.state.cartItemList.first.addedDealBonusMaterial.isEmpty,
            true,
          );
        },
      );

      blocTest<CartBloc, CartState>(
        'Bonus item added to cart with Tire 1 bonus quantity Bonus fail',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(
            () => cartRepositoryMock.getStockInfo(
              material: bonus913MockCartItem.materialInfo,
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              mockStockInfo.copyWith(
                materialNumber: bonusMaterialNumber,
              ),
            ),
          );
          when(
            () => cartRepositoryMock.addToCart(
              cartItem: bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                bonus913MockCartItem.copyWith(
                  quantity: bonus913MockCartItem
                      .price.priceBonusItem.last.qualifyingQuantity,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                )
              ],
            ),
          );

          when(
            () => cartRepositoryMock.getUpdatedMaterialList(
              cartItemList: [],
              selectedItemsMaterialNumber: [],
              items: [
                bonus913MockCartItem.copyWith(
                  quantity: bonus913MockCartItem
                      .price.priceBonusItem.last.qualifyingQuantity,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                ),
              ],
            ),
          ).thenAnswer((invocation) => [bonusMaterialNumber]);
          when(
            () => cartRepositoryMock.getStockInfoList(
              customerCodeInfo: CustomerCodeInfo.empty(),
              materialInfoList: [
                MaterialInfo.empty().copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ],
              salesOrganisation: SalesOrganisation.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              shipToInfo: ShipToInfo.empty(),
            ),
          ).thenAnswer((invocation) async => const Right(<StockInfo>[]));
          when(
            () => cartRepositoryMock.updateDealBonusItem(
              cartItem: bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ),
              bonusItem: bonus913MockCartItem
                  .copyWith(
                    quantity: bonus913MockCartItem
                        .price.priceBonusItem.last.qualifyingQuantity,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  )
                  .getMaterialItemBonus,
            ),
          ).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('Fake-Error')),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.addToCart(
            item: bonus913MockCartItem.copyWith(
              quantity: bonus913MockCartItem
                  .price.priceBonusItem.last.qualifyingQuantity,
            ),
            customerCodeInfo: CustomerCodeInfo.empty(),
            doNotallowOutOfStockMaterial: true,
            salesOrganisation: SalesOrganisation.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            isFetching: true,
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ],
            apiFailureOrSuccessOption: none(),
            isFetching: false,
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ],
            apiFailureOrSuccessOption: none(),
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ],
            apiFailureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('Fake-Error'),
              ),
            ),
            isFetching: false,
          ),
        ],
        verify: (CartBloc bloc) {
          expect(
            bloc.state.cartItemList.first.finalPrice,
            bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0),
          );
          expect(
            bloc.state.cartItemList.first.finalPriceTotal,
            bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0) * 3,
          );
          expect(
            bloc.state.cartItemList.first.addedDealBonusMaterial.isEmpty,
            true,
          );
        },
      );
      blocTest<CartBloc, CartState>(
        'Bonus item added to cart with Tire 1 quantity Bonus for 911',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(
            () => cartRepositoryMock.getStockInfo(
              material: bonus911MockCartItem.materialInfo,
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              mockStockInfo.copyWith(
                materialNumber: bonusMaterialNumber,
              ),
            ),
          );
          when(
            () => cartRepositoryMock.addToCart(
              cartItem: bonus911MockCartItem.copyWith(
                quantity: bonus911MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                bonus911MockCartItem.copyWith(
                  quantity: bonus911MockCartItem
                      .price.priceBonusItem.last.qualifyingQuantity,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                )
              ],
            ),
          );

          when(
            () => cartRepositoryMock.getUpdatedMaterialList(
              cartItemList: [],
              selectedItemsMaterialNumber: [],
              items: [
                bonus911MockCartItem.copyWith(
                  quantity: bonus911MockCartItem
                      .price.priceBonusItem.last.qualifyingQuantity,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                ),
              ],
            ),
          ).thenAnswer((invocation) => [bonusMaterialNumber]);
          when(
            () => cartRepositoryMock.updateDealBonusItem(
              cartItem: bonus911MockCartItem.copyWith(
                quantity: bonus911MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ),
              bonusItem: bonus911MockCartItem
                  .copyWith(
                    quantity: bonus911MockCartItem
                        .price.priceBonusItem.last.qualifyingQuantity,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  )
                  .getMaterialItemBonus,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                bonus913MockCartItem.copyWith(
                  quantity: bonus911MockCartItem
                      .price.priceBonusItem.last.qualifyingQuantity,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                  addedBonusList: bonus911MockCartItem
                      .copyWith(
                        quantity: bonus911MockCartItem
                            .price.priceBonusItem.last.qualifyingQuantity,
                        stockInfo: mockStockInfo.copyWith(
                          materialNumber: bonusMaterialNumber,
                        ),
                      )
                      .getMaterialItemBonus,
                )
              ],
            ),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.addToCart(
            item: bonus911MockCartItem.copyWith(
              quantity: bonus911MockCartItem
                  .price.priceBonusItem.last.qualifyingQuantity,
            ),
            customerCodeInfo: CustomerCodeInfo.empty(),
            doNotallowOutOfStockMaterial: true,
            salesOrganisation: SalesOrganisation.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            isFetching: true,
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus911MockCartItem.copyWith(
                quantity: bonus911MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ],
            apiFailureOrSuccessOption: none(),
            isFetching: false,
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus911MockCartItem.copyWith(
                quantity: bonus911MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ],
            apiFailureOrSuccessOption: none(),
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: bonus911MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus911MockCartItem
                    .copyWith(
                      quantity: bonus911MockCartItem
                          .price.priceBonusItem.last.qualifyingQuantity,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              )
            ],
            apiFailureOrSuccessOption: none(),
            isFetching: false,
          ),
        ],
        verify: (CartBloc bloc) {
          expect(
            bloc.state.cartItemList.first.finalPrice,
            bonus911MockCartItem.price.finalPrice.getOrDefaultValue(0),
          );
          expect(
            bloc.state.cartItemList.first.finalPriceTotal,
            bonus911MockCartItem.price.finalPrice.getOrDefaultValue(0) * 3,
          );
          expect(
            // ignore: invalid_use_of_protected_member
            bloc.state.cartItemList.first.addedDealBonusMaterial.isNotEmpty,
            true,
          );
        },
      );

      blocTest<CartBloc, CartState>(
        'Bonus item added to cart with Tire 1 quantity Bonus for 914',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(
            () => cartRepositoryMock.getStockInfo(
              material: bonus914MockCartItem.materialInfo,
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              mockStockInfo.copyWith(
                materialNumber: bonusMaterialNumber,
              ),
            ),
          );
          when(
            () => cartRepositoryMock.addToCart(
              cartItem: bonus914MockCartItem.copyWith(
                quantity: bonus914MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                bonus914MockCartItem.copyWith(
                  quantity: bonus914MockCartItem
                      .price.priceBonusItem.last.qualifyingQuantity,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                )
              ],
            ),
          );

          when(
            () => cartRepositoryMock.getUpdatedMaterialList(
              cartItemList: [],
              selectedItemsMaterialNumber: [],
              items: [
                bonus914MockCartItem.copyWith(
                  quantity: bonus914MockCartItem
                      .price.priceBonusItem.last.qualifyingQuantity,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                ),
              ],
            ),
          ).thenAnswer((invocation) => [bonusMaterialNumber]);
          when(
            () => cartRepositoryMock.updateDealBonusItem(
              cartItem: bonus914MockCartItem.copyWith(
                quantity: bonus914MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ),
              bonusItem: bonus914MockCartItem
                  .copyWith(
                    quantity: bonus914MockCartItem
                        .price.priceBonusItem.last.qualifyingQuantity,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  )
                  .getMaterialItemBonus,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                bonus914MockCartItem.copyWith(
                  quantity: bonus914MockCartItem
                      .price.priceBonusItem.last.qualifyingQuantity,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                  addedBonusList: bonus914MockCartItem
                      .copyWith(
                        quantity: bonus914MockCartItem
                            .price.priceBonusItem.last.qualifyingQuantity,
                        stockInfo: mockStockInfo.copyWith(
                          materialNumber: bonusMaterialNumber,
                        ),
                      )
                      .getMaterialItemBonus,
                )
              ],
            ),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.addToCart(
            item: bonus914MockCartItem.copyWith(
              quantity: bonus914MockCartItem
                  .price.priceBonusItem.last.qualifyingQuantity,
            ),
            customerCodeInfo: CustomerCodeInfo.empty(),
            doNotallowOutOfStockMaterial: true,
            salesOrganisation: SalesOrganisation.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            isFetching: true,
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus914MockCartItem.copyWith(
                quantity: bonus914MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ],
            apiFailureOrSuccessOption: none(),
            isFetching: false,
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus914MockCartItem.copyWith(
                quantity: bonus914MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ],
            apiFailureOrSuccessOption: none(),
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus914MockCartItem.copyWith(
                quantity: bonus914MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus914MockCartItem
                    .copyWith(
                      quantity: bonus914MockCartItem
                          .price.priceBonusItem.last.qualifyingQuantity,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              )
            ],
            apiFailureOrSuccessOption: none(),
            isFetching: false,
          ),
        ],
        verify: (CartBloc bloc) {
          expect(
            bloc.state.cartItemList.first.finalPrice,
            bonus914MockCartItem.price.finalPrice.getOrDefaultValue(0),
          );
          expect(
            bloc.state.cartItemList.first.finalPriceTotal,
            bonus914MockCartItem.price.finalPrice.getOrDefaultValue(0) * 3,
          );
          expect(
            // ignore: invalid_use_of_protected_member
            bloc.state.cartItemList.first.addedDealBonusMaterial.isNotEmpty,
            true,
          );
        },
      );

      blocTest<CartBloc, CartState>(
        'Bonus item added to cart with Tire 1 quantity Bonus for 915',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(
            () => cartRepositoryMock.getStockInfo(
              material: bonus915MockCartItem.materialInfo,
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              mockStockInfo.copyWith(
                materialNumber: bonusMaterialNumber,
              ),
            ),
          );
          when(
            () => cartRepositoryMock.addToCart(
              cartItem: bonus915MockCartItem.copyWith(
                quantity: bonus915MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                bonus915MockCartItem.copyWith(
                  quantity: bonus915MockCartItem
                      .price.priceBonusItem.last.qualifyingQuantity,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                )
              ],
            ),
          );

          when(
            () => cartRepositoryMock.getUpdatedMaterialList(
              cartItemList: [],
              selectedItemsMaterialNumber: [],
              items: [
                bonus915MockCartItem.copyWith(
                  quantity: bonus915MockCartItem
                      .price.priceBonusItem.last.qualifyingQuantity,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                ),
              ],
            ),
          ).thenAnswer((invocation) => [bonusMaterialNumber]);
          when(
            () => cartRepositoryMock.updateDealBonusItem(
              cartItem: bonus915MockCartItem.copyWith(
                quantity: bonus915MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ),
              bonusItem: bonus915MockCartItem
                  .copyWith(
                    quantity: bonus915MockCartItem
                        .price.priceBonusItem.last.qualifyingQuantity,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  )
                  .getMaterialItemBonus,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                bonus915MockCartItem.copyWith(
                  quantity: bonus915MockCartItem
                      .price.priceBonusItem.last.qualifyingQuantity,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                  addedBonusList: bonus915MockCartItem
                      .copyWith(
                        quantity: bonus915MockCartItem
                            .price.priceBonusItem.last.qualifyingQuantity,
                        stockInfo: mockStockInfo.copyWith(
                          materialNumber: bonusMaterialNumber,
                        ),
                      )
                      .getMaterialItemBonus,
                )
              ],
            ),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.addToCart(
            item: bonus915MockCartItem.copyWith(
              quantity: bonus915MockCartItem
                  .price.priceBonusItem.last.qualifyingQuantity,
            ),
            customerCodeInfo: CustomerCodeInfo.empty(),
            doNotallowOutOfStockMaterial: true,
            salesOrganisation: SalesOrganisation.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            isFetching: true,
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus915MockCartItem.copyWith(
                quantity: bonus915MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ],
            apiFailureOrSuccessOption: none(),
            isFetching: false,
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus915MockCartItem.copyWith(
                quantity: bonus915MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ],
            apiFailureOrSuccessOption: none(),
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus915MockCartItem.copyWith(
                quantity: bonus915MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus915MockCartItem
                    .copyWith(
                      quantity: bonus915MockCartItem
                          .price.priceBonusItem.last.qualifyingQuantity,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              )
            ],
            apiFailureOrSuccessOption: none(),
            isFetching: false,
          ),
        ],
        verify: (CartBloc bloc) {
          expect(
            bloc.state.cartItemList.first.finalPrice,
            bonus915MockCartItem.price.finalPrice.getOrDefaultValue(0),
          );
          expect(
            bloc.state.cartItemList.first.finalPriceTotal,
            bonus915MockCartItem.price.finalPrice.getOrDefaultValue(0) * 3,
          );
          expect(
            // ignore: invalid_use_of_protected_member
            bloc.state.cartItemList.first.addedDealBonusMaterial.isNotEmpty,
            true,
          );
        },
      );
      blocTest<CartBloc, CartState>(
        'Bonus item added to cart with Tire 1 quantity Bonus',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(
            () => cartRepositoryMock.getStockInfo(
              material: bonus913MockCartItem.materialInfo,
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              mockStockInfo.copyWith(
                materialNumber: bonusMaterialNumber,
              ),
            ),
          );
          when(
            () => cartRepositoryMock.addToCart(
              cartItem: bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                bonus913MockCartItem.copyWith(
                  quantity: bonus913MockCartItem
                      .price.priceBonusItem.last.qualifyingQuantity,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                )
              ],
            ),
          );

          when(
            () => cartRepositoryMock.getUpdatedMaterialList(
              cartItemList: [],
              selectedItemsMaterialNumber: [],
              items: [
                bonus913MockCartItem.copyWith(
                  quantity: bonus913MockCartItem
                      .price.priceBonusItem.last.qualifyingQuantity,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                ),
              ],
            ),
          ).thenAnswer((invocation) => [bonusMaterialNumber]);
          when(
            () => cartRepositoryMock.updateDealBonusItem(
              cartItem: bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ),
              bonusItem: bonus913MockCartItem
                  .copyWith(
                    quantity: bonus913MockCartItem
                        .price.priceBonusItem.last.qualifyingQuantity,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  )
                  .getMaterialItemBonus,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                bonus913MockCartItem.copyWith(
                  quantity: bonus913MockCartItem
                      .price.priceBonusItem.last.qualifyingQuantity,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                  addedBonusList: bonus913MockCartItem
                      .copyWith(
                        quantity: bonus913MockCartItem
                            .price.priceBonusItem.last.qualifyingQuantity,
                        stockInfo: mockStockInfo.copyWith(
                          materialNumber: bonusMaterialNumber,
                        ),
                      )
                      .getMaterialItemBonus,
                )
              ],
            ),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.addToCart(
            item: bonus913MockCartItem.copyWith(
              quantity: bonus913MockCartItem
                  .price.priceBonusItem.last.qualifyingQuantity,
            ),
            customerCodeInfo: CustomerCodeInfo.empty(),
            doNotallowOutOfStockMaterial: true,
            salesOrganisation: SalesOrganisation.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            isFetching: true,
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ],
            apiFailureOrSuccessOption: none(),
            isFetching: false,
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ],
            apiFailureOrSuccessOption: none(),
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: bonus913MockCartItem
                          .price.priceBonusItem.last.qualifyingQuantity,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              )
            ],
            apiFailureOrSuccessOption: none(),
            isFetching: false,
          ),
        ],
        verify: (CartBloc bloc) {
          expect(
            bloc.state.cartItemList.first.finalPrice,
            bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0),
          );
          expect(
            bloc.state.cartItemList.first.finalPriceTotal,
            bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0) * 3,
          );
          expect(
            // ignore: invalid_use_of_protected_member
            bloc.state.cartItemList.first.addedDealBonusMaterial.isNotEmpty,
            true,
          );
        },
      );

      blocTest<CartBloc, CartState>(
        'Bonus item added to cart with Tire 2 quantity Bonus',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(
            () => cartRepositoryMock.getStockInfo(
              material: bonus913MockCartItem.materialInfo,
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              mockStockInfo.copyWith(
                materialNumber: bonusMaterialNumber,
              ),
            ),
          );
          when(
            () => cartRepositoryMock.getStockInfoList(
              customerCodeInfo: CustomerCodeInfo.empty(),
              materialInfoList: [
                MaterialInfo.empty().copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ],
              salesOrganisation: SalesOrganisation.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              shipToInfo: ShipToInfo.empty(),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              <StockInfo>[
                StockInfo.empty().copyWith(materialNumber: bonusMaterialNumber),
              ],
            ),
          );
          when(
            () => cartRepositoryMock.addToCart(
              cartItem: bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem.price.priceBonusItem
                    .elementAt(1)
                    .qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                bonus913MockCartItem.copyWith(
                  quantity: bonus913MockCartItem.price.priceBonusItem
                      .elementAt(1)
                      .qualifyingQuantity,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                )
              ],
            ),
          );

          when(
            () => cartRepositoryMock.getUpdatedMaterialList(
              cartItemList: [],
              selectedItemsMaterialNumber: [],
              items: [
                bonus913MockCartItem.copyWith(
                  quantity: bonus913MockCartItem.price.priceBonusItem
                      .elementAt(1)
                      .qualifyingQuantity,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                ),
              ],
            ),
          ).thenAnswer((invocation) => [bonusMaterialNumber]);
          when(
            () => cartRepositoryMock.updateDealBonusItem(
              cartItem: bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem.price.priceBonusItem
                    .elementAt(1)
                    .qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ),
              bonusItem: bonus913MockCartItem
                  .copyWith(
                    quantity: bonus913MockCartItem.price.priceBonusItem
                        .elementAt(1)
                        .qualifyingQuantity,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  )
                  .getMaterialItemBonus,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                bonus913MockCartItem.copyWith(
                  quantity: bonus913MockCartItem.price.priceBonusItem
                      .elementAt(1)
                      .qualifyingQuantity,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                  addedBonusList: bonus913MockCartItem
                      .copyWith(
                        quantity: bonus913MockCartItem.price.priceBonusItem
                            .elementAt(1)
                            .qualifyingQuantity,
                        stockInfo: mockStockInfo.copyWith(
                          materialNumber: bonusMaterialNumber,
                        ),
                      )
                      .getMaterialItemBonus,
                )
              ],
            ),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.addToCart(
            item: bonus913MockCartItem.copyWith(
              quantity: bonus913MockCartItem.price.priceBonusItem
                  .elementAt(1)
                  .qualifyingQuantity,
            ),
            customerCodeInfo: CustomerCodeInfo.empty(),
            doNotallowOutOfStockMaterial: true,
            salesOrganisation: SalesOrganisation.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            isFetching: true,
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem.price.priceBonusItem
                    .elementAt(1)
                    .qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ],
            apiFailureOrSuccessOption: none(),
            isFetching: false,
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem.price.priceBonusItem
                    .elementAt(1)
                    .qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ],
            apiFailureOrSuccessOption: none(),
            isFetching: true,
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem.price.priceBonusItem
                    .elementAt(1)
                    .qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: bonus913MockCartItem.price.priceBonusItem
                          .elementAt(1)
                          .qualifyingQuantity,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              )
            ],
            apiFailureOrSuccessOption: none(),
            isFetching: false,
          ),
        ],
        verify: (CartBloc bloc) {
          expect(
            bloc.state.cartItemList.first.finalPrice,
            bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0),
          );
          expect(
            bloc.state.cartItemList.first.finalPriceTotal,
            bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0) * 5,
          );
          expect(
            // ignore: invalid_use_of_protected_member
            bloc.state.cartItemList.first.addedDealBonusMaterial.isNotEmpty,
            true,
          );
        },
      );

      blocTest<CartBloc, CartState>(
        'Bonus item added to cart with Tire 3 quantity Bonus',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(
            () => cartRepositoryMock.getStockInfo(
              material: bonus913MockCartItem.materialInfo,
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              mockStockInfo.copyWith(
                materialNumber: bonusMaterialNumber,
              ),
            ),
          );
          when(
            () => cartRepositoryMock.addToCart(
              cartItem: bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem
                    .price.priceBonusItem.first.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                bonus913MockCartItem.copyWith(
                  quantity: bonus913MockCartItem
                      .price.priceBonusItem.first.qualifyingQuantity,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                )
              ],
            ),
          );

          when(
            () => cartRepositoryMock.getUpdatedMaterialList(
              cartItemList: [],
              selectedItemsMaterialNumber: [],
              items: [
                bonus913MockCartItem.copyWith(
                  quantity: bonus913MockCartItem
                      .price.priceBonusItem.first.qualifyingQuantity,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                ),
              ],
            ),
          ).thenAnswer((invocation) => [bonusMaterialNumber]);
          when(
            () => cartRepositoryMock.getStockInfoList(
              customerCodeInfo: CustomerCodeInfo.empty(),
              materialInfoList: [
                MaterialInfo.empty().copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ],
              salesOrganisation: SalesOrganisation.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              shipToInfo: ShipToInfo.empty(),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              <StockInfo>[
                StockInfo.empty().copyWith(materialNumber: bonusMaterialNumber),
              ],
            ),
          );
          when(
            () => cartRepositoryMock.updateDealBonusItem(
              cartItem: bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem
                    .price.priceBonusItem.first.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ),
              bonusItem: bonus913MockCartItem
                  .copyWith(
                    quantity: bonus913MockCartItem
                        .price.priceBonusItem.first.qualifyingQuantity,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  )
                  .getMaterialItemBonus,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                bonus913MockCartItem.copyWith(
                  quantity: bonus913MockCartItem
                      .price.priceBonusItem.first.qualifyingQuantity,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                  addedBonusList: bonus913MockCartItem
                      .copyWith(
                        quantity: bonus913MockCartItem
                            .price.priceBonusItem.first.qualifyingQuantity,
                        stockInfo: mockStockInfo.copyWith(
                          materialNumber: bonusMaterialNumber,
                        ),
                      )
                      .getMaterialItemBonus,
                )
              ],
            ),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.addToCart(
            item: bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem
                    .price.priceBonusItem.first.qualifyingQuantity),
            customerCodeInfo: CustomerCodeInfo.empty(),
            doNotallowOutOfStockMaterial: true,
            salesOrganisation: SalesOrganisation.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            isFetching: true,
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem
                    .price.priceBonusItem.first.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ],
            apiFailureOrSuccessOption: none(),
            isFetching: false,
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem
                    .price.priceBonusItem.first.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ],
            apiFailureOrSuccessOption: none(),
            isFetching: true,
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem
                    .price.priceBonusItem.first.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: bonus913MockCartItem
                          .price.priceBonusItem.first.qualifyingQuantity,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              )
            ],
            apiFailureOrSuccessOption: none(),
            isFetching: false,
          ),
        ],
        verify: (CartBloc bloc) {
          expect(
            bloc.state.cartItemList.first.finalPrice,
            bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0),
          );
          expect(
            bloc.state.cartItemList.first.finalPriceTotal,
            bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0) * 10,
          );
          expect(
            // ignore: invalid_use_of_protected_member
            bloc.state.cartItemList.first.addedDealBonusMaterial.isNotEmpty,
            true,
          );
        },
      );

      blocTest<CartBloc, CartState>(
        'Bonus item added to cart with Tire 1 and Tire 2 quantity Bonus',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(
            () => cartRepositoryMock.getStockInfo(
              material: bonus913MockCartItem.materialInfo,
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              mockStockInfo.copyWith(
                materialNumber: bonusMaterialNumber,
              ),
            ),
          );
          when(
            () => cartRepositoryMock.addToCart(
              cartItem: bonus913MockCartItem.copyWith(
                quantity: 8,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                bonus913MockCartItem.copyWith(
                  quantity: 8,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                )
              ],
            ),
          );

          when(
            () => cartRepositoryMock.getUpdatedMaterialList(
              cartItemList: [],
              selectedItemsMaterialNumber: [],
              items: [
                bonus913MockCartItem.copyWith(
                  quantity: 8,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                ),
              ],
            ),
          ).thenAnswer((invocation) => [bonusMaterialNumber]);
          when(
            () => cartRepositoryMock.updateDealBonusItem(
              cartItem: bonus913MockCartItem.copyWith(
                quantity: 8,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ),
              bonusItem: bonus913MockCartItem
                  .copyWith(
                    quantity: 8,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  )
                  .getMaterialItemBonus,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                bonus913MockCartItem.copyWith(
                  quantity: 8,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                  addedBonusList: bonus913MockCartItem
                      .copyWith(
                        quantity: 8,
                        stockInfo: mockStockInfo.copyWith(
                          materialNumber: bonusMaterialNumber,
                        ),
                      )
                      .getMaterialItemBonus,
                )
              ],
            ),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.addToCart(
            item: bonus913MockCartItem.copyWith(quantity: 8),
            customerCodeInfo: CustomerCodeInfo.empty(),
            doNotallowOutOfStockMaterial: false,
            salesOrganisation: SalesOrganisation.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            isFetching: true,
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: 8,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ],
            apiFailureOrSuccessOption: none(),
            isFetching: false,
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: 8,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ],
            apiFailureOrSuccessOption: none(),
            isFetching: true,
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: 8,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: 8,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              )
            ],
            apiFailureOrSuccessOption: none(),
            isFetching: false,
          ),
        ],
        verify: (CartBloc bloc) {
          expect(
            bloc.state.cartItemList.first.finalPrice,
            bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0),
          );
          expect(
            bloc.state.cartItemList.first.finalPriceTotal,
            bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0) * 8,
          );
          expect(
            // ignore: invalid_use_of_protected_member
            bloc.state.cartItemList.first.addedDealBonusMaterial.isNotEmpty,
            true,
          );
        },
      );

      blocTest<CartBloc, CartState>(
        'Bonus item added to cart with Tire 1 and Tire 3 quantity Bonus',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(
            () => cartRepositoryMock.getStockInfo(
              material: bonus913MockCartItem.materialInfo,
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              mockStockInfo.copyWith(
                materialNumber: bonusMaterialNumber,
              ),
            ),
          );
          when(
            () => cartRepositoryMock.addToCart(
              cartItem: bonus913MockCartItem.copyWith(
                quantity: 13,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                bonus913MockCartItem.copyWith(
                  quantity: 13,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                )
              ],
            ),
          );

          when(
            () => cartRepositoryMock.getUpdatedMaterialList(
              cartItemList: [],
              selectedItemsMaterialNumber: [],
              items: [
                bonus913MockCartItem.copyWith(
                  quantity: 13,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                ),
              ],
            ),
          ).thenAnswer((invocation) => [bonusMaterialNumber]);
          when(
            () => cartRepositoryMock.updateDealBonusItem(
              cartItem: bonus913MockCartItem.copyWith(
                quantity: 13,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ),
              bonusItem: bonus913MockCartItem
                  .copyWith(
                    quantity: 13,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  )
                  .getMaterialItemBonus,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                bonus913MockCartItem.copyWith(
                  quantity: 13,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                  addedBonusList: bonus913MockCartItem
                      .copyWith(
                        quantity: 13,
                        stockInfo: mockStockInfo.copyWith(
                          materialNumber: bonusMaterialNumber,
                        ),
                      )
                      .getMaterialItemBonus,
                )
              ],
            ),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.addToCart(
            item: bonus913MockCartItem.copyWith(quantity: 13),
            customerCodeInfo: CustomerCodeInfo.empty(),
            doNotallowOutOfStockMaterial: false,
            salesOrganisation: SalesOrganisation.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            isFetching: true,
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: 13,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ],
            apiFailureOrSuccessOption: none(),
            isFetching: false,
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: 13,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ],
            apiFailureOrSuccessOption: none(),
            isFetching: true,
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: 13,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: 13,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              )
            ],
            apiFailureOrSuccessOption: none(),
            isFetching: false,
          ),
        ],
        verify: (CartBloc bloc) {
          expect(
            bloc.state.cartItemList.first.finalPrice,
            bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0),
          );
          expect(
            bloc.state.cartItemList.first.finalPriceTotal,
            bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0) * 13,
          );
          expect(
            // ignore: invalid_use_of_protected_member
            bloc.state.cartItemList.first.addedDealBonusMaterial.isNotEmpty,
            true,
          );
        },
      );

      blocTest<CartBloc, CartState>(
        'Bonus item added to cart with Tire 2 and Tire 3 quantity Bonus',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(
            () => cartRepositoryMock.getStockInfo(
              material: bonus913MockCartItem.materialInfo,
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              mockStockInfo.copyWith(
                materialNumber: bonusMaterialNumber,
              ),
            ),
          );
          when(
            () => cartRepositoryMock.addToCart(
              cartItem: bonus913MockCartItem.copyWith(
                quantity: 15,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                bonus913MockCartItem.copyWith(
                  quantity: 15,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                )
              ],
            ),
          );

          when(
            () => cartRepositoryMock.getUpdatedMaterialList(
              cartItemList: [],
              selectedItemsMaterialNumber: [],
              items: [
                bonus913MockCartItem.copyWith(
                  quantity: 15,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                ),
              ],
            ),
          ).thenAnswer((invocation) => [bonusMaterialNumber]);
          when(
            () => cartRepositoryMock.updateDealBonusItem(
              cartItem: bonus913MockCartItem.copyWith(
                quantity: 15,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ),
              bonusItem: bonus913MockCartItem
                  .copyWith(
                    quantity: 15,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  )
                  .getMaterialItemBonus,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                bonus913MockCartItem.copyWith(
                  quantity: 15,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                  addedBonusList: bonus913MockCartItem
                      .copyWith(
                        quantity: 15,
                        stockInfo: mockStockInfo.copyWith(
                          materialNumber: bonusMaterialNumber,
                        ),
                      )
                      .getMaterialItemBonus,
                )
              ],
            ),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.addToCart(
            item: bonus913MockCartItem.copyWith(quantity: 15),
            customerCodeInfo: CustomerCodeInfo.empty(),
            doNotallowOutOfStockMaterial: false,
            salesOrganisation: SalesOrganisation.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            isFetching: true,
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: 15,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ],
            apiFailureOrSuccessOption: none(),
            isFetching: false,
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: 15,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ],
            apiFailureOrSuccessOption: none(),
            isFetching: true,
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: 15,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: 15,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              )
            ],
            apiFailureOrSuccessOption: none(),
            isFetching: false,
          ),
        ],
        verify: (CartBloc bloc) {
          expect(
            bloc.state.cartItemList.first.finalPrice,
            bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0),
          );
          expect(
            bloc.state.cartItemList.first.finalPriceTotal,
            bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0) * 15,
          );
          expect(
            // ignore: invalid_use_of_protected_member
            bloc.state.cartItemList.first.addedDealBonusMaterial.isNotEmpty,
            true,
          );
        },
      );

      blocTest<CartBloc, CartState>(
        'Bonus item added to cart with Tire 1 and and Tire 2 Tire 3 quantity Bonus',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(
            () => cartRepositoryMock.getStockInfo(
              material: bonus913MockCartItem.materialInfo,
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              mockStockInfo.copyWith(
                materialNumber: bonusMaterialNumber,
              ),
            ),
          );
          when(
            () => cartRepositoryMock.addToCart(
              cartItem: bonus913MockCartItem.copyWith(
                quantity: 18,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                bonus913MockCartItem.copyWith(
                  quantity: 18,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                )
              ],
            ),
          );

          when(
            () => cartRepositoryMock.getUpdatedMaterialList(
              cartItemList: [],
              selectedItemsMaterialNumber: [],
              items: [
                bonus913MockCartItem.copyWith(
                  quantity: 18,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                ),
              ],
            ),
          ).thenAnswer((invocation) => [bonusMaterialNumber]);
          when(
            () => cartRepositoryMock.updateDealBonusItem(
              cartItem: bonus913MockCartItem.copyWith(
                quantity: 18,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ),
              bonusItem: bonus913MockCartItem
                  .copyWith(
                    quantity: 18,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  )
                  .getMaterialItemBonus,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                bonus913MockCartItem.copyWith(
                  quantity: 18,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                  addedBonusList: bonus913MockCartItem
                      .copyWith(
                        quantity: 18,
                        stockInfo: mockStockInfo.copyWith(
                          materialNumber: bonusMaterialNumber,
                        ),
                      )
                      .getMaterialItemBonus,
                )
              ],
            ),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.addToCart(
            item: bonus913MockCartItem.copyWith(quantity: 18),
            customerCodeInfo: CustomerCodeInfo.empty(),
            doNotallowOutOfStockMaterial: false,
            salesOrganisation: SalesOrganisation.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ),
        expect: () => [
          CartState.initial(),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: 18,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ],
            apiFailureOrSuccessOption: none(),
            isFetching: false,
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: 18,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ],
            apiFailureOrSuccessOption: none(),
            isFetching: true,
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: 18,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: 18,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              )
            ],
            apiFailureOrSuccessOption: none(),
            isFetching: false,
          ),
        ],
        verify: (CartBloc bloc) {
          expect(
            bloc.state.cartItemList.first.finalPrice,
            bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0),
          );
          expect(
            bloc.state.cartItemList.first.finalPriceTotal,
            bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0) * 18,
          );
          expect(
            // ignore: invalid_use_of_protected_member
            bloc.state.cartItemList.first.addedDealBonusMaterial.isNotEmpty,
            true,
          );
        },
      );
      blocTest<CartBloc, CartState>(
        'Bonus item increment - no Tire discount to Tire 1 discount',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        seed: () => CartState.initial().copyWith(
          selectedItemsMaterialNumber: [bonusMaterialNumber],
          cartItemList: [
            bonus913MockCartItem.copyWith(
              quantity: 2,
              stockInfo: mockStockInfo.copyWith(
                materialNumber: bonusMaterialNumber,
              ),
            )
          ],
          apiFailureOrSuccessOption: none(),
          isFetching: true,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.getStockInfo(
              material: bonus913MockCartItem.materialInfo,
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              mockStockInfo.copyWith(
                materialNumber: bonusMaterialNumber,
              ),
            ),
          );
          when(
            () => cartRepositoryMock.addToCart(
              cartItem: bonus913MockCartItem.copyWith(
                quantity: 1,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                bonus913MockCartItem.copyWith(
                  quantity: 3,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                )
              ],
            ),
          );

          when(
            () => cartRepositoryMock.getUpdatedMaterialList(
              cartItemList: [
                bonus913MockCartItem.copyWith(
                  quantity: 2,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                ),
              ],
              selectedItemsMaterialNumber: [bonusMaterialNumber],
              items: [
                bonus913MockCartItem.copyWith(
                  quantity: 1,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                ),
              ],
            ),
          ).thenAnswer((invocation) => [bonusMaterialNumber]);
          when(
            () => cartRepositoryMock.updateDealBonusItem(
              cartItem: bonus913MockCartItem.copyWith(
                quantity: 3,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ),
              bonusItem: bonus913MockCartItem
                  .copyWith(
                    quantity: 3,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  )
                  .getMaterialItemBonus,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                bonus913MockCartItem.copyWith(
                  quantity: 3,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                  addedBonusList: bonus913MockCartItem
                      .copyWith(
                        quantity: 3,
                        stockInfo: mockStockInfo.copyWith(
                          materialNumber: bonusMaterialNumber,
                        ),
                      )
                      .getMaterialItemBonus,
                )
              ],
            ),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.addToCart(
            item: bonus913MockCartItem.copyWith(quantity: 1),
            customerCodeInfo: CustomerCodeInfo.empty(),
            doNotallowOutOfStockMaterial: false,
            salesOrganisation: SalesOrganisation.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: 3,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ],
            isFetching: false,
            apiFailureOrSuccessOption: none(),
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: 3,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ],
            apiFailureOrSuccessOption: none(),
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: 3,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: 3,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              )
            ],
            apiFailureOrSuccessOption: none(),
            isFetching: false,
          ),
        ],
        verify: (CartBloc bloc) {
          expect(
            bloc.state.cartItemList.first.finalPrice,
            bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0),
          );
          expect(
            bloc.state.cartItemList.first.finalPriceTotal,
            bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0) * 3,
          );
          expect(
            // ignore: invalid_use_of_protected_member
            bloc.state.cartItemList.first.addedDealBonusMaterial.isNotEmpty,
            true,
          );
        },
      );

      blocTest<CartBloc, CartState>(
        'Bonus item decrement-  Tire 1 discount to no discount',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        seed: () => CartState.initial().copyWith(
          selectedItemsMaterialNumber: [bonusMaterialNumber],
          cartItemList: [
            bonus913MockCartItem.copyWith(
              quantity: 3,
              stockInfo: mockStockInfo.copyWith(
                materialNumber: bonusMaterialNumber,
              ),
              addedBonusList: bonus913MockCartItem
                  .copyWith(
                    quantity: 3,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  )
                  .getMaterialItemBonus,
            )
          ],
          apiFailureOrSuccessOption: none(),
          isFetching: true,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.getStockInfo(
              material: bonus913MockCartItem.materialInfo,
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              mockStockInfo.copyWith(
                materialNumber: bonusMaterialNumber,
              ),
            ),
          );
          when(
            () => cartRepositoryMock.addToCart(
              cartItem: bonus913MockCartItem.copyWith(
                quantity: -1,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                bonus913MockCartItem.copyWith(
                  quantity: 2,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                )
              ],
            ),
          );

          when(
            () => cartRepositoryMock.getUpdatedMaterialList(
              cartItemList: [
                bonus913MockCartItem.copyWith(
                  quantity: 3,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                  addedBonusList: bonus913MockCartItem
                      .copyWith(
                        quantity: 3,
                      )
                      .getMaterialItemBonus,
                ),
              ],
              selectedItemsMaterialNumber: [bonusMaterialNumber],
              items: [
                bonus913MockCartItem.copyWith(
                  quantity: -1,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                ),
              ],
            ),
          ).thenAnswer((invocation) => [bonusMaterialNumber]);
          when(
            () => cartRepositoryMock.updateDealBonusItem(
              cartItem: bonus913MockCartItem.copyWith(
                quantity: -1,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ),
              bonusItem: bonus913MockCartItem
                  .copyWith(
                    quantity: 3,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  )
                  .getMaterialItemBonus,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                bonus913MockCartItem.copyWith(
                  quantity: 2,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                )
              ],
            ),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.addToCart(
            item: bonus913MockCartItem.copyWith(quantity: -1),
            customerCodeInfo: CustomerCodeInfo.empty(),
            doNotallowOutOfStockMaterial: false,
            salesOrganisation: SalesOrganisation.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: 2,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              )
            ],
            apiFailureOrSuccessOption: none(),
            isFetching: false,
          ),
        ],
        verify: (CartBloc bloc) {
          expect(
            bloc.state.cartItemList.first.finalPrice,
            bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0),
          );
          expect(
            bloc.state.cartItemList.first.finalPriceTotal,
            bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0) * 2,
          );
          expect(
            // ignore: invalid_use_of_protected_member
            bloc.state.cartItemList.first.addedDealBonusMaterial.isEmpty,
            true,
          );
        },
      );

      blocTest<CartBloc, CartState>(
        'Bonus item increment - Tire 1 discount to Tire 2 discount',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        seed: () => CartState.initial().copyWith(
          selectedItemsMaterialNumber: [bonusMaterialNumber],
          cartItemList: [
            bonus913MockCartItem.copyWith(
              quantity: 4,
              stockInfo: mockStockInfo.copyWith(
                materialNumber: bonusMaterialNumber,
              ),
              addedBonusList: bonus913MockCartItem
                  .copyWith(
                    quantity: 4,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  )
                  .getMaterialItemBonus,
            )
          ],
          apiFailureOrSuccessOption: none(),
          isFetching: false,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.getStockInfo(
              material: bonus913MockCartItem.materialInfo,
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              mockStockInfo.copyWith(
                materialNumber: bonusMaterialNumber,
              ),
            ),
          );
          when(
            () => cartRepositoryMock.addToCart(
              cartItem: bonus913MockCartItem.copyWith(
                quantity: 1,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: [
                  MaterialItemBonus.empty().copyWith(
                    materialInfo: MaterialInfo.empty().copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                    qty: 1,
                  ),
                ],
              ),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                bonus913MockCartItem.copyWith(
                  quantity: 5,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                  addedBonusList: bonus913MockCartItem
                      .copyWith(
                        quantity: 4,
                        stockInfo: mockStockInfo.copyWith(
                          materialNumber: bonusMaterialNumber,
                        ),
                      )
                      .getMaterialItemBonus,
                ),
              ],
            ),
          );

          when(
            () => cartRepositoryMock.getUpdatedMaterialList(
              cartItemList: [
                bonus913MockCartItem.copyWith(
                  quantity: 4,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                  addedBonusList: bonus913MockCartItem
                      .copyWith(
                        quantity: 4,
                        stockInfo: mockStockInfo.copyWith(
                          materialNumber: bonusMaterialNumber,
                        ),
                      )
                      .getMaterialItemBonus,
                ),
              ],
              selectedItemsMaterialNumber: [bonusMaterialNumber],
              items: [
                bonus913MockCartItem.copyWith(
                  quantity: 1,
                  addedBonusList: [
                    MaterialItemBonus.empty().copyWith(
                      materialInfo: MaterialInfo.empty().copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                      qty: 1,
                    ),
                  ],
                ),
              ],
            ),
          ).thenAnswer((invocation) => [bonusMaterialNumber]);
          when(
            () => cartRepositoryMock.updateDealBonusItem(
              cartItem: bonus913MockCartItem.copyWith(
                quantity: 5,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: 4,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              ),
              bonusItem: bonus913MockCartItem
                  .copyWith(
                    quantity: 5,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  )
                  .getMaterialItemBonus,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                bonus913MockCartItem.copyWith(
                  quantity: 5,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                  addedBonusList: bonus913MockCartItem
                      .copyWith(
                        quantity: 5,
                        stockInfo: mockStockInfo.copyWith(
                          materialNumber: bonusMaterialNumber,
                        ),
                      )
                      .getMaterialItemBonus,
                )
              ],
            ),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.addToCart(
            item: bonus913MockCartItem.copyWith(
              quantity: 1,
              addedBonusList: [
                MaterialItemBonus.empty().copyWith(
                  materialInfo: MaterialInfo.empty().copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                  qty: 1,
                ),
              ],
            ),
            customerCodeInfo: CustomerCodeInfo.empty(),
            doNotallowOutOfStockMaterial: false,
            salesOrganisation: SalesOrganisation.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: 4,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: 4,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              )
            ],
            apiFailureOrSuccessOption: none(),
            isFetching: true,
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: 5,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: 4,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              )
            ],
            apiFailureOrSuccessOption: none(),
            isFetching: false,
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: 5,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: 4,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              )
            ],
            apiFailureOrSuccessOption: none(),
            isFetching: true,
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: 5,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: 5,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              )
            ],
            apiFailureOrSuccessOption: none(),
            isFetching: false,
          ),
        ],
        verify: (CartBloc bloc) {
          expect(
            bloc.state.cartItemList.first.finalPrice,
            bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0),
          );
          expect(
            bloc.state.cartItemList.first.finalPriceTotal,
            bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0) * 5,
          );
          expect(
            // ignore: invalid_use_of_protected_member
            bloc.state.cartItemList.first.addedDealBonusMaterial.isEmpty,
            false,
          );
        },
      );
      blocTest<CartBloc, CartState>(
        'Bonus item decrement - Tire 2 discount to Tire 1 discount',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        seed: () => CartState.initial().copyWith(
          selectedItemsMaterialNumber: [bonusMaterialNumber],
          cartItemList: [
            bonus913MockCartItem.copyWith(
              quantity: 5,
              stockInfo: mockStockInfo.copyWith(
                materialNumber: bonusMaterialNumber,
              ),
              addedBonusList: bonus913MockCartItem
                  .copyWith(
                    quantity: 5,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  )
                  .getMaterialItemBonus,
            )
          ],
          apiFailureOrSuccessOption: none(),
          isFetching: false,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.getStockInfo(
              material: bonus913MockCartItem.materialInfo,
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              mockStockInfo.copyWith(
                materialNumber: bonusMaterialNumber,
              ),
            ),
          );
          when(
            () => cartRepositoryMock.addToCart(
              cartItem: bonus913MockCartItem.copyWith(
                quantity: -1,
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: 5,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              ),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                bonus913MockCartItem.copyWith(
                  quantity: 4,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                  addedBonusList: bonus913MockCartItem
                      .copyWith(
                        quantity: 5,
                        stockInfo: mockStockInfo.copyWith(
                          materialNumber: bonusMaterialNumber,
                        ),
                      )
                      .getMaterialItemBonus,
                )
              ],
            ),
          );

          when(
            () => cartRepositoryMock.getUpdatedMaterialList(
              cartItemList: [
                bonus913MockCartItem.copyWith(
                  quantity: 5,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                  addedBonusList: bonus913MockCartItem
                      .copyWith(
                        quantity: 5,
                        stockInfo: mockStockInfo.copyWith(
                          materialNumber: bonusMaterialNumber,
                        ),
                      )
                      .getMaterialItemBonus,
                ),
              ],
              selectedItemsMaterialNumber: [bonusMaterialNumber],
              items: [
                bonus913MockCartItem.copyWith(
                  quantity: -1,
                  addedBonusList: bonus913MockCartItem
                      .copyWith(
                        quantity: 5,
                        stockInfo: mockStockInfo.copyWith(
                          materialNumber: bonusMaterialNumber,
                        ),
                      )
                      .getMaterialItemBonus,
                ),
              ],
            ),
          ).thenAnswer((invocation) => [bonusMaterialNumber]);
          when(
            () => cartRepositoryMock.updateDealBonusItem(
              cartItem: bonus913MockCartItem.copyWith(
                quantity: 4,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: 5,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              ),
              bonusItem: bonus913MockCartItem
                  .copyWith(
                    quantity: 4,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  )
                  .getMaterialItemBonus,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                bonus913MockCartItem.copyWith(
                  quantity: 4,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                  addedBonusList: bonus913MockCartItem
                      .copyWith(
                        quantity: 4,
                        stockInfo: mockStockInfo.copyWith(
                          materialNumber: bonusMaterialNumber,
                        ),
                      )
                      .getMaterialItemBonus,
                )
              ],
            ),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.addToCart(
            item: bonus913MockCartItem.copyWith(
              quantity: -1,
              addedBonusList: bonus913MockCartItem
                  .copyWith(
                    quantity: 5,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  )
                  .getMaterialItemBonus,
            ),
            customerCodeInfo: CustomerCodeInfo.empty(),
            doNotallowOutOfStockMaterial: false,
            salesOrganisation: SalesOrganisation.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: 5,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: 5,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              )
            ],
            apiFailureOrSuccessOption: none(),
            isFetching: true,
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: 4,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: 5,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              ),
            ],
            apiFailureOrSuccessOption: none(),
            isFetching: false,
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: 4,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: 5,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              ),
            ],
            apiFailureOrSuccessOption: none(),
            isFetching: true,
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: 4,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: 4,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              ),
            ],
            apiFailureOrSuccessOption: none(),
            isFetching: false,
          ),
        ],
        verify: (CartBloc bloc) {
          expect(
            bloc.state.cartItemList.first.finalPrice,
            bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0),
          );
          expect(
            bloc.state.cartItemList.first.finalPriceTotal,
            bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0) * 4,
          );
          expect(
            // ignore: invalid_use_of_protected_member
            bloc.state.cartItemList.first.addedDealBonusMaterial.isNotEmpty,
            true,
          );
        },
      );

      blocTest<CartBloc, CartState>(
        'Bonus item increment - 2 Tire discount to Tire 3 discount',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        seed: () => CartState.initial().copyWith(
          selectedItemsMaterialNumber: [bonusMaterialNumber],
          cartItemList: [
            bonus913MockCartItem.copyWith(
              quantity: bonus913MockCartItem.price.priceBonusItem
                  .elementAt(1)
                  .qualifyingQuantity,
              stockInfo: mockStockInfo.copyWith(
                materialNumber: bonusMaterialNumber,
              ),
              addedBonusList: bonus913MockCartItem
                  .copyWith(
                    quantity: bonus913MockCartItem.price.priceBonusItem
                        .elementAt(1)
                        .qualifyingQuantity,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  )
                  .getMaterialItemBonus,
            )
          ],
          isFetching: false,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.getStockInfo(
              material: bonus913MockCartItem.materialInfo,
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              mockStockInfo.copyWith(
                materialNumber: bonusMaterialNumber,
              ),
            ),
          );
          when(
            () => cartRepositoryMock.addToCart(
              cartItem: bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem.price.priceBonusItem
                    .elementAt(1)
                    .qualifyingQuantity,
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: bonus913MockCartItem.price.priceBonusItem
                          .elementAt(1)
                          .qualifyingQuantity,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              ),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                bonus913MockCartItem.copyWith(
                  quantity: bonus913MockCartItem
                      .price.priceBonusItem.first.qualifyingQuantity,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                  addedBonusList: bonus913MockCartItem
                      .copyWith(
                        quantity: bonus913MockCartItem.price.priceBonusItem
                            .elementAt(1)
                            .qualifyingQuantity,
                        stockInfo: mockStockInfo.copyWith(
                          materialNumber: bonusMaterialNumber,
                        ),
                      )
                      .getMaterialItemBonus,
                )
              ],
            ),
          );

          when(
            () => cartRepositoryMock.getUpdatedMaterialList(
              cartItemList: [
                bonus913MockCartItem.copyWith(
                  quantity: bonus913MockCartItem.price.priceBonusItem
                      .elementAt(1)
                      .qualifyingQuantity,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                  addedBonusList: bonus913MockCartItem
                      .copyWith(
                        quantity: bonus913MockCartItem.price.priceBonusItem
                            .elementAt(1)
                            .qualifyingQuantity,
                        stockInfo: mockStockInfo.copyWith(
                          materialNumber: bonusMaterialNumber,
                        ),
                      )
                      .getMaterialItemBonus,
                ),
              ],
              selectedItemsMaterialNumber: [bonusMaterialNumber],
              items: [
                bonus913MockCartItem.copyWith(
                  quantity: bonus913MockCartItem.price.priceBonusItem
                      .elementAt(1)
                      .qualifyingQuantity,
                  addedBonusList: bonus913MockCartItem
                      .copyWith(
                        quantity: bonus913MockCartItem.price.priceBonusItem
                            .elementAt(1)
                            .qualifyingQuantity,
                        stockInfo: mockStockInfo.copyWith(
                          materialNumber: bonusMaterialNumber,
                        ),
                      )
                      .getMaterialItemBonus,
                ),
              ],
            ),
          ).thenAnswer((invocation) => [bonusMaterialNumber]);
          when(
            () => cartRepositoryMock.updateDealBonusItem(
              cartItem: bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem
                    .price.priceBonusItem.first.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: bonus913MockCartItem.price.priceBonusItem
                          .elementAt(1)
                          .qualifyingQuantity,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              ),
              bonusItem: bonus913MockCartItem
                  .copyWith(
                    quantity: bonus913MockCartItem
                        .price.priceBonusItem.first.qualifyingQuantity,
                  )
                  .getMaterialItemBonus,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                bonus913MockCartItem.copyWith(
                  quantity: bonus913MockCartItem
                      .price.priceBonusItem.first.qualifyingQuantity,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                  addedBonusList: bonus913MockCartItem
                      .copyWith(
                        quantity: bonus913MockCartItem
                            .price.priceBonusItem.first.qualifyingQuantity,
                        stockInfo: mockStockInfo.copyWith(
                          materialNumber: bonusMaterialNumber,
                        ),
                      )
                      .getMaterialItemBonus,
                )
              ],
            ),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.addToCart(
            item: bonus913MockCartItem.copyWith(
              quantity: bonus913MockCartItem.price.priceBonusItem
                  .elementAt(1)
                  .qualifyingQuantity,
              addedBonusList: bonus913MockCartItem
                  .copyWith(
                    quantity: bonus913MockCartItem.price.priceBonusItem
                        .elementAt(1)
                        .qualifyingQuantity,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  )
                  .getMaterialItemBonus,
            ),
            customerCodeInfo: CustomerCodeInfo.empty(),
            doNotallowOutOfStockMaterial: false,
            salesOrganisation: SalesOrganisation.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem.price.priceBonusItem
                    .elementAt(1)
                    .qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: bonus913MockCartItem.price.priceBonusItem
                          .elementAt(1)
                          .qualifyingQuantity,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              )
            ],
            apiFailureOrSuccessOption: none(),
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem
                    .price.priceBonusItem.first.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: bonus913MockCartItem.price.priceBonusItem
                          .elementAt(1)
                          .qualifyingQuantity,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              )
            ],
            apiFailureOrSuccessOption: none(),
            isFetching: false,
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem
                    .price.priceBonusItem.first.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: bonus913MockCartItem.price.priceBonusItem
                          .elementAt(1)
                          .qualifyingQuantity,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              )
            ],
            apiFailureOrSuccessOption: none(),
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem
                    .price.priceBonusItem.first.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: bonus913MockCartItem
                          .price.priceBonusItem.first.qualifyingQuantity,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              )
            ],
            apiFailureOrSuccessOption: none(),
            isFetching: false,
          ),
        ],
        verify: (CartBloc bloc) {
          expect(
            bloc.state.cartItemList.first.finalPrice,
            bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0),
          );
          expect(
            bloc.state.cartItemList.first.finalPriceTotal,
            bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0) * 10,
          );
          expect(
            // ignore: invalid_use_of_protected_member
            bloc.state.cartItemList.first.addedDealBonusMaterial.isNotEmpty,
            true,
          );
        },
      );

      blocTest<CartBloc, CartState>(
        'Bonus item decrement - 3 Tire  discount to Tire 2 discount',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        seed: () => CartState.initial().copyWith(
          selectedItemsMaterialNumber: [bonusMaterialNumber],
          cartItemList: [
            bonus913MockCartItem.copyWith(
              quantity: bonus913MockCartItem
                  .price.priceBonusItem.first.qualifyingQuantity,
              stockInfo: mockStockInfo.copyWith(
                materialNumber: bonusMaterialNumber,
              ),
              addedBonusList: bonus913MockCartItem
                  .copyWith(
                    quantity: bonus913MockCartItem
                        .price.priceBonusItem.first.qualifyingQuantity,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  )
                  .getMaterialItemBonus,
            ),
          ],
          isFetching: false,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.getStockInfo(
              material: bonus913MockCartItem.materialInfo,
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              mockStockInfo.copyWith(
                materialNumber: bonusMaterialNumber,
              ),
            ),
          );
          when(
            () => cartRepositoryMock.addToCart(
              cartItem: bonus913MockCartItem.copyWith(
                  quantity: -(bonus913MockCartItem.price.priceBonusItem
                      .elementAt(1)
                      .qualifyingQuantity),
                  addedBonusList: bonus913MockCartItem
                      .copyWith(
                        quantity: bonus913MockCartItem
                            .price.priceBonusItem.first.qualifyingQuantity,
                        stockInfo: mockStockInfo.copyWith(
                          materialNumber: bonusMaterialNumber,
                        ),
                      )
                      .getMaterialItemBonus),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                bonus913MockCartItem.copyWith(
                    quantity: bonus913MockCartItem.price.priceBonusItem
                        .elementAt(1)
                        .qualifyingQuantity,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                    addedBonusList: bonus913MockCartItem
                        .copyWith(
                          quantity: bonus913MockCartItem
                              .price.priceBonusItem.first.qualifyingQuantity,
                          stockInfo: mockStockInfo.copyWith(
                            materialNumber: bonusMaterialNumber,
                          ),
                        )
                        .getMaterialItemBonus)
              ],
            ),
          );

          when(
            () => cartRepositoryMock.getUpdatedMaterialList(
              cartItemList: [
                bonus913MockCartItem.copyWith(
                  quantity: bonus913MockCartItem
                      .price.priceBonusItem.first.qualifyingQuantity,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                  addedBonusList: bonus913MockCartItem
                      .copyWith(
                        quantity: bonus913MockCartItem
                            .price.priceBonusItem.first.qualifyingQuantity,
                        stockInfo: mockStockInfo.copyWith(
                          materialNumber: bonusMaterialNumber,
                        ),
                      )
                      .getMaterialItemBonus,
                )
              ],
              selectedItemsMaterialNumber: [bonusMaterialNumber],
              items: [
                bonus913MockCartItem.copyWith(
                    quantity: -bonus913MockCartItem.price.priceBonusItem
                        .elementAt(1)
                        .qualifyingQuantity,
                    addedBonusList: bonus913MockCartItem
                        .copyWith(
                          quantity: bonus913MockCartItem
                              .price.priceBonusItem.first.qualifyingQuantity,
                          stockInfo: mockStockInfo.copyWith(
                            materialNumber: bonusMaterialNumber,
                          ),
                        )
                        .getMaterialItemBonus),
              ],
            ),
          ).thenAnswer((invocation) => [bonusMaterialNumber]);
          when(() => cartRepositoryMock.updateDealBonusItem(
                cartItem: bonus913MockCartItem.copyWith(
                    quantity: bonus913MockCartItem.price.priceBonusItem
                        .elementAt(1)
                        .qualifyingQuantity,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                    addedBonusList: bonus913MockCartItem
                        .copyWith(
                          quantity: bonus913MockCartItem
                              .price.priceBonusItem.first.qualifyingQuantity,
                          stockInfo: mockStockInfo.copyWith(
                            materialNumber: bonusMaterialNumber,
                          ),
                        )
                        .getMaterialItemBonus),
                bonusItem: bonus913MockCartItem
                    .copyWith(
                      quantity: bonus913MockCartItem.price.priceBonusItem
                          .elementAt(1)
                          .qualifyingQuantity,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              )).thenAnswer(
            (invocation) async => Right(
              [
                bonus913MockCartItem.copyWith(
                    quantity: bonus913MockCartItem.price.priceBonusItem
                        .elementAt(1)
                        .qualifyingQuantity,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                    addedBonusList: bonus913MockCartItem
                        .copyWith(
                          quantity: bonus913MockCartItem.price.priceBonusItem
                              .elementAt(1)
                              .qualifyingQuantity,
                          stockInfo: mockStockInfo.copyWith(
                            materialNumber: bonusMaterialNumber,
                          ),
                        )
                        .getMaterialItemBonus),
              ],
            ),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.addToCart(
            item: bonus913MockCartItem.copyWith(
                quantity: -(bonus913MockCartItem.price.priceBonusItem
                    .elementAt(1)
                    .qualifyingQuantity),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: bonus913MockCartItem
                          .price.priceBonusItem.first.qualifyingQuantity,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus),
            customerCodeInfo: CustomerCodeInfo.empty(),
            doNotallowOutOfStockMaterial: false,
            salesOrganisation: SalesOrganisation.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem
                    .price.priceBonusItem.first.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: bonus913MockCartItem
                          .price.priceBonusItem.first.qualifyingQuantity,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              ),
            ],
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem.price.priceBonusItem
                    .elementAt(1)
                    .qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: bonus913MockCartItem
                          .price.priceBonusItem.first.qualifyingQuantity,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              )
            ],
            isFetching: false,
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem.price.priceBonusItem
                    .elementAt(1)
                    .qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: bonus913MockCartItem
                          .price.priceBonusItem.first.qualifyingQuantity,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              )
            ],
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem.price.priceBonusItem
                    .elementAt(1)
                    .qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: bonus913MockCartItem.price.priceBonusItem
                          .elementAt(1)
                          .qualifyingQuantity,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              )
            ],
            isFetching: false,
          ),
        ],
        verify: (CartBloc bloc) {
          expect(
            bloc.state.cartItemList.first.finalPrice,
            bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0),
          );
          expect(
            bloc.state.cartItemList.first.finalPriceTotal,
            bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0) * 5,
          );
          expect(
            // ignore: invalid_use_of_protected_member
            bloc.state.cartItemList.first.addedDealBonusMaterial.isNotEmpty,
            true,
          );
        },
      );

      blocTest<CartBloc, CartState>(
        'Bonus item update - no Tire  discount to Tire 3 discount',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        seed: () => CartState.initial().copyWith(
          selectedItemsMaterialNumber: [bonusMaterialNumber],
          cartItemList: [
            bonus913MockCartItem.copyWith(
              quantity: 1,
              stockInfo: mockStockInfo.copyWith(
                materialNumber: bonusMaterialNumber,
              ),
              addedBonusList: bonus913MockCartItem
                  .copyWith(
                    quantity: 1,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  )
                  .getMaterialItemBonus,
            )
          ],
          apiFailureOrSuccessOption: none(),
          isFetching: false,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.getStockInfo(
              material: bonus913MockCartItem.materialInfo,
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              mockStockInfo.copyWith(
                materialNumber: bonusMaterialNumber,
              ),
            ),
          );
          when(
            () => cartRepositoryMock.updateCartItem(
                cartItem: bonus913MockCartItem.copyWith(
              quantity: bonus913MockCartItem
                  .price.priceBonusItem.first.qualifyingQuantity,
              addedBonusList: bonus913MockCartItem
                  .copyWith(
                    quantity: 1,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  )
                  .getMaterialItemBonus,
            )),
          ).thenAnswer(
            (invocation) async => Right(
              [
                bonus913MockCartItem.copyWith(
                  quantity: bonus913MockCartItem
                      .price.priceBonusItem.first.qualifyingQuantity,
                  addedBonusList: bonus913MockCartItem
                      .copyWith(
                        quantity: 1,
                        stockInfo: mockStockInfo.copyWith(
                          materialNumber: bonusMaterialNumber,
                        ),
                      )
                      .getMaterialItemBonus,
                )
              ],
            ),
          );

          when(
            () => cartRepositoryMock.updateDealBonusItem(
                cartItem: bonus913MockCartItem.copyWith(
                  quantity: bonus913MockCartItem
                      .price.priceBonusItem.first.qualifyingQuantity,
                  addedBonusList: bonus913MockCartItem
                      .copyWith(
                        quantity: 1,
                        stockInfo: mockStockInfo.copyWith(
                          materialNumber: bonusMaterialNumber,
                        ),
                      )
                      .getMaterialItemBonus,
                ),
                bonusItem: bonus913MockCartItem
                    .copyWith(
                      quantity: bonus913MockCartItem
                          .price.priceBonusItem.first.qualifyingQuantity,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus),
          ).thenAnswer(
            (invocation) async => Right(
              [
                bonus913MockCartItem.copyWith(
                  quantity: bonus913MockCartItem
                      .price.priceBonusItem.first.qualifyingQuantity,
                  addedBonusList: bonus913MockCartItem
                      .copyWith(
                        quantity: bonus913MockCartItem
                            .price.priceBonusItem.first.qualifyingQuantity,
                        stockInfo: mockStockInfo.copyWith(
                          materialNumber: bonusMaterialNumber,
                        ),
                      )
                      .getMaterialItemBonus,
                )
              ],
            ),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.updateCartItem(
            item: bonus913MockCartItem.copyWith(
              quantity: bonus913MockCartItem
                  .price.priceBonusItem.first.qualifyingQuantity,
              addedBonusList: bonus913MockCartItem
                  .copyWith(
                    quantity: 1,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  )
                  .getMaterialItemBonus,
            ),
            customerCodeInfo: CustomerCodeInfo.empty(),
            doNotallowOutOfStockMaterial: false,
            salesOrganisation: SalesOrganisation.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: 1,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: 1,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              )
            ],
          ),
          CartState.initial().copyWith(selectedItemsMaterialNumber: [
            bonusMaterialNumber
          ], cartItemList: [
            bonus913MockCartItem.copyWith(
              quantity: bonus913MockCartItem
                  .price.priceBonusItem.first.qualifyingQuantity,
              stockInfo: mockStockInfo.copyWith(
                materialNumber: bonusMaterialNumber,
              ),
              addedBonusList: bonus913MockCartItem
                  .copyWith(
                    quantity: 1,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  )
                  .getMaterialItemBonus,
            )
          ], isFetching: false),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem
                    .price.priceBonusItem.first.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: 1,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              )
            ],
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem
                    .price.priceBonusItem.first.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: bonus913MockCartItem
                          .price.priceBonusItem.first.qualifyingQuantity,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              )
            ],
            isFetching: false,
          ),
        ],
        verify: (CartBloc bloc) {
          expect(
            bloc.state.cartItemList.first.finalPrice,
            bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0),
          );
          expect(
            bloc.state.cartItemList.first.finalPriceTotal,
            bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0) * 10,
          );
          expect(
            // ignore: invalid_use_of_protected_member
            bloc.state.cartItemList.first.addedDealBonusMaterial.isNotEmpty,
            true,
          );
        },
      );

      blocTest<CartBloc, CartState>(
        'Bonus item update - no Tire  discount to Tire 2 discount',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        seed: () => CartState.initial().copyWith(
          selectedItemsMaterialNumber: [bonusMaterialNumber],
          cartItemList: [
            bonus913MockCartItem.copyWith(
              quantity: 1,
              stockInfo: mockStockInfo.copyWith(
                materialNumber: bonusMaterialNumber,
              ),
              addedBonusList: bonus913MockCartItem
                  .copyWith(quantity: 1)
                  .getMaterialItemBonus,
            )
          ],
          isFetching: false,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.getStockInfo(
              material: bonus913MockCartItem.materialInfo,
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              mockStockInfo.copyWith(
                materialNumber: bonusMaterialNumber,
              ),
            ),
          );
          when(
            () => cartRepositoryMock.updateCartItem(
              cartItem: bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem.price.priceBonusItem
                    .elementAt(1)
                    .qualifyingQuantity,
                addedBonusList: bonus913MockCartItem
                    .copyWith(quantity: 1)
                    .getMaterialItemBonus,
              ),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                bonus913MockCartItem.copyWith(
                  quantity: bonus913MockCartItem.price.priceBonusItem
                      .elementAt(1)
                      .qualifyingQuantity,
                  addedBonusList: bonus913MockCartItem
                      .copyWith(quantity: 1)
                      .getMaterialItemBonus,
                ),
              ],
            ),
          );

          when(
            () => cartRepositoryMock.updateDealBonusItem(
              cartItem: bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem.price.priceBonusItem
                    .elementAt(1)
                    .qualifyingQuantity,
                addedBonusList: bonus913MockCartItem
                    .copyWith(quantity: 1)
                    .getMaterialItemBonus,
              ),
              bonusItem: bonus913MockCartItem
                  .copyWith(
                    quantity: bonus913MockCartItem.price.priceBonusItem
                        .elementAt(1)
                        .qualifyingQuantity,
                    addedBonusList: bonus913MockCartItem
                        .copyWith(
                            quantity: bonus913MockCartItem.price.priceBonusItem
                                .elementAt(1)
                                .qualifyingQuantity)
                        .getMaterialItemBonus,
                  )
                  .getMaterialItemBonus,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                bonus913MockCartItem.copyWith(
                  quantity: bonus913MockCartItem.price.priceBonusItem
                      .elementAt(1)
                      .qualifyingQuantity,
                  addedBonusList: bonus913MockCartItem
                      .copyWith(
                          quantity: bonus913MockCartItem.price.priceBonusItem
                              .elementAt(1)
                              .qualifyingQuantity)
                      .getMaterialItemBonus,
                )
              ],
            ),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.updateCartItem(
            item: bonus913MockCartItem.copyWith(
              quantity: bonus913MockCartItem.price.priceBonusItem
                  .elementAt(1)
                  .qualifyingQuantity,
              addedBonusList: bonus913MockCartItem
                  .copyWith(quantity: 1)
                  .getMaterialItemBonus,
            ),
            customerCodeInfo: CustomerCodeInfo.empty(),
            doNotallowOutOfStockMaterial: false,
            salesOrganisation: SalesOrganisation.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: 1,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(quantity: 1)
                    .getMaterialItemBonus,
              )
            ],
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem.price.priceBonusItem
                    .elementAt(1)
                    .qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(quantity: 1)
                    .getMaterialItemBonus,
              )
            ],
            isFetching: false,
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem.price.priceBonusItem
                    .elementAt(1)
                    .qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(quantity: 1)
                    .getMaterialItemBonus,
              )
            ],
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem.price.priceBonusItem
                    .elementAt(1)
                    .qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                        quantity: bonus913MockCartItem.price.priceBonusItem
                            .elementAt(1)
                            .qualifyingQuantity)
                    .getMaterialItemBonus,
              )
            ],
            isFetching: false,
          ),
        ],
        verify: (CartBloc bloc) {
          expect(
            bloc.state.cartItemList.first.finalPrice,
            bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0),
          );
          expect(
            bloc.state.cartItemList.first.finalPriceTotal,
            bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0) * 5,
          );
          expect(
            // ignore: invalid_use_of_protected_member
            bloc.state.cartItemList.first.addedDealBonusMaterial.isNotEmpty,
            true,
          );
        },
      );

      blocTest<CartBloc, CartState>(
        'Bonus item update - no Tire  discount to Tire 1 discount',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        seed: () => CartState.initial().copyWith(
          selectedItemsMaterialNumber: [bonusMaterialNumber],
          cartItemList: [
            bonus913MockCartItem.copyWith(
              quantity: 1,
              stockInfo: mockStockInfo.copyWith(
                materialNumber: bonusMaterialNumber,
              ),
              addedBonusList: bonus913MockCartItem
                  .copyWith(
                    quantity: 1,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  )
                  .getMaterialItemBonus,
            )
          ],
          isFetching: false,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.getStockInfo(
              material: bonus913MockCartItem.materialInfo,
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              mockStockInfo.copyWith(
                materialNumber: bonusMaterialNumber,
              ),
            ),
          );
          when(
            () => cartRepositoryMock.updateCartItem(
              cartItem: bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: 1,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              ),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                bonus913MockCartItem.copyWith(
                  quantity: bonus913MockCartItem
                      .price.priceBonusItem.last.qualifyingQuantity,
                  addedBonusList: bonus913MockCartItem
                      .copyWith(
                        quantity: 1,
                        stockInfo: mockStockInfo.copyWith(
                          materialNumber: bonusMaterialNumber,
                        ),
                      )
                      .getMaterialItemBonus,
                ),
              ],
            ),
          );

          when(
            () => cartRepositoryMock.updateDealBonusItem(
              cartItem: bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: 1,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              ),
              bonusItem: bonus913MockCartItem
                  .copyWith(
                    quantity: bonus913MockCartItem
                        .price.priceBonusItem.last.qualifyingQuantity,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  )
                  .getMaterialItemBonus,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                bonus913MockCartItem.copyWith(
                  quantity: bonus913MockCartItem
                      .price.priceBonusItem.last.qualifyingQuantity,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                  addedBonusList: bonus913MockCartItem
                      .copyWith(
                        quantity: bonus913MockCartItem
                            .price.priceBonusItem.last.qualifyingQuantity,
                        stockInfo: mockStockInfo.copyWith(
                          materialNumber: bonusMaterialNumber,
                        ),
                      )
                      .getMaterialItemBonus,
                )
              ],
            ),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.updateCartItem(
            item: bonus913MockCartItem.copyWith(
              quantity: bonus913MockCartItem
                  .price.priceBonusItem.last.qualifyingQuantity,
              addedBonusList: bonus913MockCartItem
                  .copyWith(
                    quantity: 1,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  )
                  .getMaterialItemBonus,
            ),
            customerCodeInfo: CustomerCodeInfo.empty(),
            doNotallowOutOfStockMaterial: false,
            salesOrganisation: SalesOrganisation.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: 1,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: 1,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              )
            ],
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: 1,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              )
            ],
            isFetching: false,
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: 1,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              )
            ],
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: bonus913MockCartItem
                          .price.priceBonusItem.last.qualifyingQuantity,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              )
            ],
            isFetching: false,
          ),
        ],
        verify: (CartBloc bloc) {
          expect(
            bloc.state.cartItemList.first.finalPrice,
            bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0),
          );
          expect(
            bloc.state.cartItemList.first.finalPriceTotal,
            bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0) * 3,
          );
          expect(
            // ignore: invalid_use_of_protected_member
            bloc.state.cartItemList.first.addedDealBonusMaterial.isNotEmpty,
            true,
          );
        },
      );

      blocTest<CartBloc, CartState>(
        'Bonus item update - Tire 1  discount to no Tire discount',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        seed: () => CartState.initial().copyWith(
          selectedItemsMaterialNumber: [bonusMaterialNumber],
          cartItemList: [
            bonus913MockCartItem.copyWith(
              quantity: bonus913MockCartItem
                  .price.priceBonusItem.last.qualifyingQuantity,
              stockInfo: mockStockInfo.copyWith(
                materialNumber: bonusMaterialNumber,
              ),
              addedBonusList: bonus913MockCartItem
                  .copyWith(
                    quantity: bonus913MockCartItem
                        .price.priceBonusItem.last.qualifyingQuantity,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  )
                  .getMaterialItemBonus,
            )
          ],
          isFetching: false,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.getStockInfo(
              material: bonus913MockCartItem.materialInfo,
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              mockStockInfo.copyWith(
                materialNumber: bonusMaterialNumber,
              ),
            ),
          );
          when(
            () => cartRepositoryMock.updateCartItem(
              cartItem: bonus913MockCartItem.copyWith(
                quantity: 1,
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: bonus913MockCartItem
                          .price.priceBonusItem.last.qualifyingQuantity,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              ),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                bonus913MockCartItem.copyWith(
                  quantity: 1,
                  addedBonusList: bonus913MockCartItem
                      .copyWith(
                        quantity: bonus913MockCartItem
                            .price.priceBonusItem.last.qualifyingQuantity,
                        stockInfo: mockStockInfo.copyWith(
                          materialNumber: bonusMaterialNumber,
                        ),
                      )
                      .getMaterialItemBonus,
                ),
              ],
            ),
          );

          when(
            () => cartRepositoryMock.updateDealBonusItem(
              cartItem: bonus913MockCartItem.copyWith(
                quantity: 1,
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: bonus913MockCartItem
                          .price.priceBonusItem.last.qualifyingQuantity,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              ),
              bonusItem: bonus913MockCartItem
                  .copyWith(
                    quantity: 1,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  )
                  .getMaterialItemBonus,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                bonus913MockCartItem.copyWith(
                  quantity: 1,
                  addedBonusList: bonus913MockCartItem
                      .copyWith(
                        quantity: 1,
                        stockInfo: mockStockInfo.copyWith(
                          materialNumber: bonusMaterialNumber,
                        ),
                      )
                      .getMaterialItemBonus,
                ),
              ],
            ),
          );
          when(
            () => cartRepositoryMock.getStockInfoList(
              customerCodeInfo: CustomerCodeInfo.empty(),
              materialInfoList: [],
              salesOrganisation: SalesOrganisation.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              shipToInfo: ShipToInfo.empty(),
            ),
          ).thenAnswer(
            (invocation) async => const Right(
              <StockInfo>[],
            ),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.updateCartItem(
            item: bonus913MockCartItem.copyWith(
              quantity: 1,
              addedBonusList: bonus913MockCartItem
                  .copyWith(
                    quantity: bonus913MockCartItem
                        .price.priceBonusItem.last.qualifyingQuantity,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  )
                  .getMaterialItemBonus,
            ),
            customerCodeInfo: CustomerCodeInfo.empty(),
            doNotallowOutOfStockMaterial: false,
            salesOrganisation: SalesOrganisation.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem
                    .price.priceBonusItem.last.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: bonus913MockCartItem
                          .price.priceBonusItem.last.qualifyingQuantity,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              )
            ],
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: 1,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: bonus913MockCartItem
                          .price.priceBonusItem.last.qualifyingQuantity,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              )
            ],
            isFetching: false,
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: 1,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: bonus913MockCartItem
                          .price.priceBonusItem.last.qualifyingQuantity,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              )
            ],
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: 1,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: 1,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              )
            ],
            isFetching: false,
          ),
        ],
        verify: (CartBloc bloc) {
          expect(
            bloc.state.cartItemList.first.finalPrice,
            bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0),
          );
          expect(
            bloc.state.cartItemList.first.finalPriceTotal,
            bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0) * 1,
          );
          expect(
            // ignore: invalid_use_of_protected_member
            bloc.state.cartItemList.first.addedDealBonusMaterial.isEmpty,
            true,
          );
        },
      );

      blocTest<CartBloc, CartState>(
        'Bonus item update - Tire 2  discount to no Tire discount',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        seed: () => CartState.initial().copyWith(
          selectedItemsMaterialNumber: [bonusMaterialNumber],
          cartItemList: [
            bonus913MockCartItem.copyWith(
              quantity: bonus913MockCartItem.price.priceBonusItem
                  .elementAt(1)
                  .qualifyingQuantity,
              stockInfo: mockStockInfo.copyWith(
                materialNumber: bonusMaterialNumber,
              ),
              addedBonusList: bonus913MockCartItem
                  .copyWith(
                    quantity: bonus913MockCartItem.price.priceBonusItem
                        .elementAt(1)
                        .qualifyingQuantity,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  )
                  .getMaterialItemBonus,
            )
          ],
          isFetching: false,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.getStockInfo(
              material: bonus913MockCartItem.materialInfo,
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              mockStockInfo.copyWith(
                materialNumber: bonusMaterialNumber,
              ),
            ),
          );
          when(
            () => cartRepositoryMock.updateCartItem(
              cartItem: bonus913MockCartItem.copyWith(
                quantity: 1,
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: bonus913MockCartItem.price.priceBonusItem
                          .elementAt(1)
                          .qualifyingQuantity,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              ),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                bonus913MockCartItem.copyWith(
                  quantity: 1,
                  addedBonusList: bonus913MockCartItem
                      .copyWith(
                        quantity: bonus913MockCartItem.price.priceBonusItem
                            .elementAt(1)
                            .qualifyingQuantity,
                        stockInfo: mockStockInfo.copyWith(
                          materialNumber: bonusMaterialNumber,
                        ),
                      )
                      .getMaterialItemBonus,
                ),
              ],
            ),
          );

          when(
            () => cartRepositoryMock.updateDealBonusItem(
              cartItem: bonus913MockCartItem.copyWith(
                quantity: 1,
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: bonus913MockCartItem.price.priceBonusItem
                          .elementAt(1)
                          .qualifyingQuantity,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              ),
              bonusItem: bonus913MockCartItem
                  .copyWith(
                    quantity: 1,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  )
                  .getMaterialItemBonus,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                bonus913MockCartItem.copyWith(
                  quantity: 1,
                  addedBonusList: bonus913MockCartItem
                      .copyWith(
                        quantity: 1,
                        stockInfo: mockStockInfo.copyWith(
                          materialNumber: bonusMaterialNumber,
                        ),
                      )
                      .getMaterialItemBonus,
                ),
              ],
            ),
          );
          when(
            () => cartRepositoryMock.getStockInfoList(
              customerCodeInfo: CustomerCodeInfo.empty(),
              materialInfoList: [],
              salesOrganisation: SalesOrganisation.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              shipToInfo: ShipToInfo.empty(),
            ),
          ).thenAnswer(
            (invocation) async => const Right(
              <StockInfo>[],
            ),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.updateCartItem(
            item: bonus913MockCartItem.copyWith(
              quantity: 1,
              addedBonusList: bonus913MockCartItem
                  .copyWith(
                    quantity: bonus913MockCartItem.price.priceBonusItem
                        .elementAt(1)
                        .qualifyingQuantity,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  )
                  .getMaterialItemBonus,
            ),
            customerCodeInfo: CustomerCodeInfo.empty(),
            doNotallowOutOfStockMaterial: false,
            salesOrganisation: SalesOrganisation.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem.price.priceBonusItem
                    .elementAt(1)
                    .qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: bonus913MockCartItem.price.priceBonusItem
                          .elementAt(1)
                          .qualifyingQuantity,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              )
            ],
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: 1,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: bonus913MockCartItem.price.priceBonusItem
                          .elementAt(1)
                          .qualifyingQuantity,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              )
            ],
            isFetching: false,
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: 1,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: bonus913MockCartItem.price.priceBonusItem
                          .elementAt(1)
                          .qualifyingQuantity,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              )
            ],
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: 1,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: 1,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              )
            ],
            isFetching: false,
          ),
        ],
        verify: (CartBloc bloc) {
          expect(
            bloc.state.cartItemList.first.finalPrice,
            bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0),
          );
          expect(
            bloc.state.cartItemList.first.finalPriceTotal,
            bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0) * 1,
          );
          expect(
            // ignore: invalid_use_of_protected_member
            bloc.state.cartItemList.first.addedDealBonusMaterial.isEmpty,
            true,
          );
        },
      );

      blocTest<CartBloc, CartState>(
        'Bonus item update - Tire 3  discount to no Tire discount',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        seed: () => CartState.initial().copyWith(
          selectedItemsMaterialNumber: [bonusMaterialNumber],
          cartItemList: [
            bonus913MockCartItem.copyWith(
              quantity: bonus913MockCartItem
                  .price.priceBonusItem.first.qualifyingQuantity,
              stockInfo: mockStockInfo.copyWith(
                materialNumber: bonusMaterialNumber,
              ),
              addedBonusList: bonus913MockCartItem
                  .copyWith(
                    quantity: bonus913MockCartItem
                        .price.priceBonusItem.first.qualifyingQuantity,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  )
                  .getMaterialItemBonus,
            ),
          ],
          isFetching: false,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.getStockInfo(
              material: bonus913MockCartItem.materialInfo,
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              mockStockInfo.copyWith(
                materialNumber: bonusMaterialNumber,
              ),
            ),
          );
          when(
            () => cartRepositoryMock.updateCartItem(
              cartItem: bonus913MockCartItem.copyWith(
                quantity: 1,
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: bonus913MockCartItem
                          .price.priceBonusItem.first.qualifyingQuantity,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              ),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                bonus913MockCartItem.copyWith(
                  quantity: 1,
                  addedBonusList: bonus913MockCartItem
                      .copyWith(
                        quantity: bonus913MockCartItem
                            .price.priceBonusItem.first.qualifyingQuantity,
                        stockInfo: mockStockInfo.copyWith(
                          materialNumber: bonusMaterialNumber,
                        ),
                      )
                      .getMaterialItemBonus,
                ),
              ],
            ),
          );

          when(
            () => cartRepositoryMock.updateDealBonusItem(
              cartItem: bonus913MockCartItem.copyWith(
                quantity: 1,
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: bonus913MockCartItem
                          .price.priceBonusItem.first.qualifyingQuantity,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              ),
              bonusItem: bonus913MockCartItem
                  .copyWith(
                    quantity: 1,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  )
                  .getMaterialItemBonus,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                bonus913MockCartItem.copyWith(
                  quantity: 1,
                  addedBonusList: bonus913MockCartItem
                      .copyWith(
                        quantity: 1,
                        stockInfo: mockStockInfo.copyWith(
                          materialNumber: bonusMaterialNumber,
                        ),
                      )
                      .getMaterialItemBonus,
                ),
              ],
            ),
          );
          when(
            () => cartRepositoryMock.getStockInfoList(
              customerCodeInfo: CustomerCodeInfo.empty(),
              materialInfoList: [],
              salesOrganisation: SalesOrganisation.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              shipToInfo: ShipToInfo.empty(),
            ),
          ).thenAnswer(
            (invocation) async => const Right(
              <StockInfo>[],
            ),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.updateCartItem(
            item: bonus913MockCartItem.copyWith(
              quantity: 1,
              addedBonusList: bonus913MockCartItem
                  .copyWith(
                    quantity: bonus913MockCartItem
                        .price.priceBonusItem.first.qualifyingQuantity,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  )
                  .getMaterialItemBonus,
            ),
            customerCodeInfo: CustomerCodeInfo.empty(),
            doNotallowOutOfStockMaterial: false,
            salesOrganisation: SalesOrganisation.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem
                    .price.priceBonusItem.first.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: bonus913MockCartItem
                          .price.priceBonusItem.first.qualifyingQuantity,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              ),
            ],
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: 1,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: bonus913MockCartItem
                          .price.priceBonusItem.first.qualifyingQuantity,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              ),
            ],
            isFetching: false,
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: 1,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: bonus913MockCartItem
                          .price.priceBonusItem.first.qualifyingQuantity,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              ),
            ],
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: 1,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: 1,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              ),
            ],
            isFetching: false,
          ),
        ],
        verify: (CartBloc bloc) {
          expect(
            bloc.state.cartItemList.first.finalPrice,
            bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0),
          );
          expect(
            bloc.state.cartItemList.first.finalPriceTotal,
            bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0) * 1,
          );
          expect(
            // ignore: invalid_use_of_protected_member
            bloc.state.cartItemList.first.addedDealBonusMaterial.isEmpty,
            true,
          );
        },
      );
      blocTest<CartBloc, CartState>(
        'Deal Bonus update fail for stock fail',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        seed: () => CartState.initial().copyWith(
          selectedItemsMaterialNumber: [bonusMaterialNumber],
          cartItemList: [
            bonus913MockCartItem.copyWith(
              quantity: bonus913MockCartItem
                  .price.priceBonusItem.first.qualifyingQuantity,
              stockInfo: mockStockInfo.copyWith(
                materialNumber: bonusMaterialNumber,
              ),
              addedBonusList: bonus913MockCartItem
                  .copyWith(
                    quantity: bonus913MockCartItem
                        .price.priceBonusItem.first.qualifyingQuantity,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  )
                  .getMaterialItemBonus,
            ),
          ],
          isFetching: false,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.getStockInfo(
              material: bonus913MockCartItem.materialInfo,
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              mockStockInfo.copyWith(
                materialNumber: bonusMaterialNumber,
              ),
            ),
          );
          when(
            () => cartRepositoryMock.addToCart(
              cartItem: bonus913MockCartItem.copyWith(
                  quantity: -(bonus913MockCartItem.price.priceBonusItem
                      .elementAt(1)
                      .qualifyingQuantity),
                  addedBonusList: bonus913MockCartItem
                      .copyWith(
                        quantity: bonus913MockCartItem
                            .price.priceBonusItem.first.qualifyingQuantity,
                        stockInfo: mockStockInfo.copyWith(
                          materialNumber: bonusMaterialNumber,
                        ),
                      )
                      .getMaterialItemBonus),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                bonus913MockCartItem.copyWith(
                    quantity: bonus913MockCartItem.price.priceBonusItem
                        .elementAt(1)
                        .qualifyingQuantity,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                    addedBonusList: bonus913MockCartItem
                        .copyWith(
                          quantity: bonus913MockCartItem
                              .price.priceBonusItem.first.qualifyingQuantity,
                          stockInfo: mockStockInfo.copyWith(
                            materialNumber: bonusMaterialNumber,
                          ),
                        )
                        .getMaterialItemBonus)
              ],
            ),
          );

          when(
            () => cartRepositoryMock.getUpdatedMaterialList(
              cartItemList: [
                bonus913MockCartItem.copyWith(
                  quantity: bonus913MockCartItem
                      .price.priceBonusItem.first.qualifyingQuantity,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                  addedBonusList: bonus913MockCartItem
                      .copyWith(
                        quantity: bonus913MockCartItem
                            .price.priceBonusItem.first.qualifyingQuantity,
                        stockInfo: mockStockInfo.copyWith(
                          materialNumber: bonusMaterialNumber,
                        ),
                      )
                      .getMaterialItemBonus,
                )
              ],
              selectedItemsMaterialNumber: [bonusMaterialNumber],
              items: [
                bonus913MockCartItem.copyWith(
                    quantity: -bonus913MockCartItem.price.priceBonusItem
                        .elementAt(1)
                        .qualifyingQuantity,
                    addedBonusList: bonus913MockCartItem
                        .copyWith(
                          quantity: bonus913MockCartItem
                              .price.priceBonusItem.first.qualifyingQuantity,
                          stockInfo: mockStockInfo.copyWith(
                            materialNumber: bonusMaterialNumber,
                          ),
                        )
                        .getMaterialItemBonus),
              ],
            ),
          ).thenAnswer((invocation) => [bonusMaterialNumber]);
          when(() => cartRepositoryMock.updateDealBonusItem(
                cartItem: bonus913MockCartItem.copyWith(
                    quantity: bonus913MockCartItem.price.priceBonusItem
                        .elementAt(1)
                        .qualifyingQuantity,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                    addedBonusList: bonus913MockCartItem
                        .copyWith(
                          quantity: bonus913MockCartItem
                              .price.priceBonusItem.first.qualifyingQuantity,
                          stockInfo: mockStockInfo.copyWith(
                            materialNumber: bonusMaterialNumber,
                          ),
                        )
                        .getMaterialItemBonus),
                bonusItem: bonus913MockCartItem
                    .copyWith(
                      quantity: bonus913MockCartItem.price.priceBonusItem
                          .elementAt(1)
                          .qualifyingQuantity,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              )).thenAnswer(
            (invocation) async => Right(
              [
                bonus913MockCartItem.copyWith(
                    quantity: bonus913MockCartItem.price.priceBonusItem
                        .elementAt(1)
                        .qualifyingQuantity,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                    addedBonusList: bonus913MockCartItem
                        .copyWith(
                          quantity: bonus913MockCartItem.price.priceBonusItem
                              .elementAt(1)
                              .qualifyingQuantity,
                          stockInfo: mockStockInfo.copyWith(
                            materialNumber: bonusMaterialNumber,
                          ),
                        )
                        .getMaterialItemBonus),
              ],
            ),
          );
          when(
            () => cartRepositoryMock.getStockInfoList(
              customerCodeInfo: CustomerCodeInfo.empty(),
              materialInfoList: [
                MaterialInfo.empty().copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ],
              salesOrganisation: SalesOrganisation.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              shipToInfo: ShipToInfo.empty(),
            ),
          ).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('Fake-Error'),
            ),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.addToCart(
            item: bonus913MockCartItem.copyWith(
                quantity: -(bonus913MockCartItem.price.priceBonusItem
                    .elementAt(1)
                    .qualifyingQuantity),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: bonus913MockCartItem
                          .price.priceBonusItem.first.qualifyingQuantity,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus),
            customerCodeInfo: CustomerCodeInfo.empty(),
            doNotallowOutOfStockMaterial: false,
            salesOrganisation: SalesOrganisation.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem
                    .price.priceBonusItem.first.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: bonus913MockCartItem
                          .price.priceBonusItem.first.qualifyingQuantity,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              ),
            ],
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem.price.priceBonusItem
                    .elementAt(1)
                    .qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: bonus913MockCartItem
                          .price.priceBonusItem.first.qualifyingQuantity,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              )
            ],
            isFetching: false,
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem.price.priceBonusItem
                    .elementAt(1)
                    .qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: bonus913MockCartItem
                          .price.priceBonusItem.first.qualifyingQuantity,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              )
            ],
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem.price.priceBonusItem
                    .elementAt(1)
                    .qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: bonus913MockCartItem
                          .price.priceBonusItem.first.qualifyingQuantity,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              )
            ],
            apiFailureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('Fake-Error'),
              ),
            ),
            isFetching: false,
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem.price.priceBonusItem
                    .elementAt(1)
                    .qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: bonus913MockCartItem.price.priceBonusItem
                          .elementAt(1)
                          .qualifyingQuantity,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              )
            ],
            isFetching: false,
          ),
        ],
        verify: (CartBloc bloc) {
          expect(
            bloc.state.cartItemList.first.finalPrice,
            bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0),
          );
          expect(
            bloc.state.cartItemList.first.finalPriceTotal,
            bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0) * 5,
          );
          expect(
            // ignore: invalid_use_of_protected_member
            bloc.state.cartItemList.first.addedDealBonusMaterial.isNotEmpty,
            true,
          );
        },
      );
      blocTest<CartBloc, CartState>(
        'Bonus item update - Tire change api failure',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        seed: () => CartState.initial().copyWith(
          selectedItemsMaterialNumber: [bonusMaterialNumber],
          cartItemList: [
            bonus913MockCartItem.copyWith(
              quantity: bonus913MockCartItem
                  .price.priceBonusItem.first.qualifyingQuantity,
              stockInfo: mockStockInfo.copyWith(
                materialNumber: bonusMaterialNumber,
              ),
              addedBonusList: bonus913MockCartItem
                  .copyWith(
                    quantity: bonus913MockCartItem
                        .price.priceBonusItem.first.qualifyingQuantity,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  )
                  .getMaterialItemBonus,
            )
          ],
          isFetching: false,
        ),
        setUp: () {
          when(
            () => cartRepositoryMock.getStockInfo(
              material: bonus913MockCartItem.materialInfo,
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              mockStockInfo.copyWith(
                materialNumber: bonusMaterialNumber,
              ),
            ),
          );
          when(
            () => cartRepositoryMock.updateCartItem(
              cartItem: bonus913MockCartItem.copyWith(
                quantity: 1,
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: bonus913MockCartItem
                          .price.priceBonusItem.first.qualifyingQuantity,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              ),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [
                bonus913MockCartItem.copyWith(
                  quantity: 1,
                  addedBonusList: bonus913MockCartItem
                      .copyWith(
                        quantity: bonus913MockCartItem
                            .price.priceBonusItem.first.qualifyingQuantity,
                        stockInfo: mockStockInfo.copyWith(
                          materialNumber: bonusMaterialNumber,
                        ),
                      )
                      .getMaterialItemBonus,
                ),
              ],
            ),
          );

          when(
            () => cartRepositoryMock.updateDealBonusItem(
              cartItem: bonus913MockCartItem.copyWith(
                quantity: 1,
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: bonus913MockCartItem
                          .price.priceBonusItem.first.qualifyingQuantity,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              ),
              bonusItem: bonus913MockCartItem
                  .copyWith(
                    quantity: 1,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  )
                  .getMaterialItemBonus,
            ),
          ).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('Fake-Error')),
          );
          when(
            () => cartRepositoryMock.getStockInfoList(
              customerCodeInfo: CustomerCodeInfo.empty(),
              materialInfoList: [],
              salesOrganisation: SalesOrganisation.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              shipToInfo: ShipToInfo.empty(),
            ),
          ).thenAnswer(
            (invocation) async => const Right(
              <StockInfo>[],
            ),
          );
        },
        act: (bloc) => bloc.add(
          CartEvent.updateCartItem(
            item: bonus913MockCartItem.copyWith(
              quantity: 1,
              addedBonusList: bonus913MockCartItem
                  .copyWith(
                    quantity: bonus913MockCartItem
                        .price.priceBonusItem.first.qualifyingQuantity,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                  )
                  .getMaterialItemBonus,
            ),
            customerCodeInfo: CustomerCodeInfo.empty(),
            doNotallowOutOfStockMaterial: false,
            salesOrganisation: SalesOrganisation.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ),
        expect: () => [
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: bonus913MockCartItem
                    .price.priceBonusItem.first.qualifyingQuantity,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: bonus913MockCartItem
                          .price.priceBonusItem.first.qualifyingQuantity,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              )
            ],
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: 1,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: bonus913MockCartItem
                          .price.priceBonusItem.first.qualifyingQuantity,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              )
            ],
            isFetching: false,
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: 1,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: bonus913MockCartItem
                          .price.priceBonusItem.first.qualifyingQuantity,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              )
            ],
          ),
          CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: 1,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: bonus913MockCartItem
                    .copyWith(
                      quantity: bonus913MockCartItem
                          .price.priceBonusItem.first.qualifyingQuantity,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              )
            ],
            apiFailureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('Fake-Error'))),
            isFetching: false,
          ),
        ],
        verify: (CartBloc bloc) {
          expect(
            bloc.state.cartItemList.first.finalPrice,
            bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0),
          );
          expect(
            bloc.state.cartItemList.first.finalPriceTotal,
            bonus913MockCartItem.price.finalPrice.getOrDefaultValue(0) * 1,
          );
          expect(
            // ignore: invalid_use_of_protected_member
            bloc.state.cartItemList.first.addedDealBonusMaterial.isNotEmpty,
            true,
          );
        },
      );

      group('Test Material Bonus + Additional Bonus CartBloc', () {
        blocTest<CartBloc, CartState>(
          'Add Additional Bonus with existing material bonus',
          build: () => CartBloc(cartRepository: cartRepositoryMock),
          seed: () => CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: 5,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: [
                  MaterialItemBonus.empty().copyWith(
                    materialInfo: MaterialInfo.empty().copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                    additionalBonusFlag: false,
                    qty: 1,
                  ),
                ],
              )
            ],
            apiFailureOrSuccessOption: none(),
            isFetching: false,
          ),
          setUp: () {
            when(
              () => cartRepositoryMock.updateBonusItem(
                cartItem: bonus913MockCartItem.copyWith(
                  quantity: 5,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                  addedBonusList: [
                    MaterialItemBonus.empty().copyWith(
                      materialInfo: MaterialInfo.empty().copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                      additionalBonusFlag: false,
                      qty: 1,
                    ),
                  ],
                ),
                bonusItem: MaterialItemBonus.empty().copyWith(
                  materialInfo: bonus913MockCartItem.materialInfo,
                  additionalBonusFlag: true,
                  bonusOverrideFlag: true,
                ),
                isUpdatedFromCart: false,
                quantity: 1,
              ),
            ).thenAnswer(
              (invocation) async => Right(
                [
                  bonus913MockCartItem.copyWith(
                    quantity: 5,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                    addedBonusList: [
                      MaterialItemBonus.empty().copyWith(
                        materialInfo: MaterialInfo.empty().copyWith(
                          materialNumber: bonusMaterialNumber,
                        ),
                        additionalBonusFlag: false,
                        qty: 1,
                      ),
                      MaterialItemBonus.empty().copyWith(
                        materialInfo: MaterialInfo.empty().copyWith(
                          materialNumber: bonusMaterialNumber,
                        ),
                        additionalBonusFlag: true,
                        qty: 1,
                      ),
                    ],
                  )
                ],
              ),
            );
          },
          act: (bloc) => bloc.add(
            CartEvent.updateBonusItem(
              cartItem: bonus913MockCartItem.copyWith(
                quantity: 5,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: [
                  MaterialItemBonus.empty().copyWith(
                    materialInfo: MaterialInfo.empty().copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                    additionalBonusFlag: false,
                    qty: 1,
                  ),
                ],
              ),
              bonusItem: MaterialItemBonus.empty().copyWith(
                materialInfo: bonus913MockCartItem.materialInfo,
                additionalBonusFlag: true,
                bonusOverrideFlag: true,
              ),
              isUpdateFromCart: false,
              bonusItemCount: 1,
            ),
          ),
          expect: () => [
            CartState.initial().copyWith(
              selectedItemsMaterialNumber: [bonusMaterialNumber],
              cartItemList: [
                bonus913MockCartItem.copyWith(
                  quantity: 5,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                  addedBonusList: [
                    MaterialItemBonus.empty().copyWith(
                      materialInfo: MaterialInfo.empty().copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                      additionalBonusFlag: false,
                      qty: 1,
                    ),
                  ],
                )
              ],
              apiFailureOrSuccessOption: none(),
              isFetching: true,
            ),
            CartState.initial().copyWith(
              selectedItemsMaterialNumber: [bonusMaterialNumber],
              cartItemList: [
                bonus913MockCartItem.copyWith(
                  quantity: 5,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                  addedBonusList: [
                    MaterialItemBonus.empty().copyWith(
                      materialInfo: MaterialInfo.empty().copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                      additionalBonusFlag: false,
                      qty: 1,
                    ),
                    MaterialItemBonus.empty().copyWith(
                      materialInfo: MaterialInfo.empty().copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                      additionalBonusFlag: true,
                      qty: 1,
                    ),
                  ],
                )
              ],
              apiFailureOrSuccessOption: none(),
              isFetching: false,
            ),
          ],
          verify: (CartBloc bloc) {
            expect(
              bloc.state.cartItemList.first.addedBonusList.length,
              2,
            );
            expect(
              bloc.state.cartItemList.first.addedBonusList.first
                  .additionalBonusFlag,
              false,
            );
            expect(
              bloc.state.cartItemList.first.addedBonusList.last
                  .additionalBonusFlag,
              true,
            );
            expect(
              bloc.state.cartItemList.first.getAddedBonusList.first
                  .additionalBonusFlag,
              false,
            );
          },
        );

        blocTest<CartBloc, CartState>(
          'remove bonus Item when same item aditional bonus and bonus item is available on cart',
          build: () => CartBloc(cartRepository: cartRepositoryMock),
          seed: () => CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: 3,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: [
                  MaterialItemBonus.empty().copyWith(
                    materialInfo: MaterialInfo.empty().copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                    additionalBonusFlag: true,
                    qty: 1,
                  ),
                  ...bonus913MockCartItem
                      .copyWith(
                        quantity: 3,
                        stockInfo: mockStockInfo.copyWith(
                          materialNumber: bonusMaterialNumber,
                        ),
                      )
                      .getMaterialItemBonus,
                ],
              )
            ],
            isFetching: false,
          ),
          setUp: () {
            when(
              () => cartRepositoryMock.getStockInfo(
                material: bonus913MockCartItem.materialInfo,
                customerCodeInfo: CustomerCodeInfo.empty(),
                salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
                salesOrganisation: SalesOrganisation.empty(),
                shipToInfo: ShipToInfo.empty(),
              ),
            ).thenAnswer(
              (invocation) async => Right(
                mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
              ),
            );
            when(
              () => cartRepositoryMock.addToCart(
                cartItem: bonus913MockCartItem.copyWith(
                  quantity: -1,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                  addedBonusList: [
                    MaterialItemBonus.empty().copyWith(
                      materialInfo: MaterialInfo.empty().copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                      additionalBonusFlag: true,
                      qty: 1,
                    ),
                    ...bonus913MockCartItem
                        .copyWith(
                          quantity: 5,
                          stockInfo: mockStockInfo.copyWith(
                            materialNumber: bonusMaterialNumber,
                          ),
                        )
                        .getMaterialItemBonus,
                  ],
                ),
              ),
            ).thenAnswer(
              (invocation) async => Right(
                [
                  bonus913MockCartItem.copyWith(
                    quantity: 2,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                    addedBonusList: [
                      MaterialItemBonus.empty().copyWith(
                        materialInfo: MaterialInfo.empty().copyWith(
                          materialNumber: bonusMaterialNumber,
                        ),
                        additionalBonusFlag: true,
                        qty: 1,
                      ),
                      ...bonus913MockCartItem
                          .copyWith(
                            quantity: 3,
                            stockInfo: mockStockInfo.copyWith(
                              materialNumber: bonusMaterialNumber,
                            ),
                          )
                          .getMaterialItemBonus,
                    ],
                  ),
                ],
              ),
            );

            when(
              () => cartRepositoryMock.getUpdatedMaterialList(
                cartItemList: [
                  bonus913MockCartItem.copyWith(
                    quantity: 3,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                    addedBonusList: [
                      MaterialItemBonus.empty().copyWith(
                        materialInfo: MaterialInfo.empty().copyWith(
                          materialNumber: bonusMaterialNumber,
                        ),
                        additionalBonusFlag: true,
                        qty: 1,
                      ),
                      ...bonus913MockCartItem
                          .copyWith(
                            quantity: 3,
                            stockInfo: mockStockInfo.copyWith(
                              materialNumber: bonusMaterialNumber,
                            ),
                          )
                          .getMaterialItemBonus,
                    ],
                  )
                ],
                selectedItemsMaterialNumber: [bonusMaterialNumber],
                items: [
                  bonus913MockCartItem.copyWith(
                    quantity: -1,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                    addedBonusList: [
                      MaterialItemBonus.empty().copyWith(
                        materialInfo: MaterialInfo.empty().copyWith(
                          materialNumber: bonusMaterialNumber,
                        ),
                        additionalBonusFlag: true,
                        qty: 1,
                      ),
                      ...bonus913MockCartItem
                          .copyWith(
                            quantity: 5,
                            stockInfo: mockStockInfo.copyWith(
                              materialNumber: bonusMaterialNumber,
                            ),
                          )
                          .getMaterialItemBonus,
                    ],
                  ),
                ],
              ),
            ).thenAnswer((invocation) => [bonusMaterialNumber]);
            when(
              () => cartRepositoryMock.updateDealBonusItem(
                cartItem: bonus913MockCartItem.copyWith(
                  quantity: 2,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                  addedBonusList: [
                    MaterialItemBonus.empty().copyWith(
                      materialInfo: MaterialInfo.empty().copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                      additionalBonusFlag: true,
                      qty: 1,
                    ),
                    ...bonus913MockCartItem
                        .copyWith(
                          quantity: 3,
                          stockInfo: mockStockInfo.copyWith(
                            materialNumber: bonusMaterialNumber,
                          ),
                        )
                        .getMaterialItemBonus,
                  ],
                ),
                bonusItem: bonus913MockCartItem
                    .copyWith(
                      quantity: 2,
                      stockInfo: mockStockInfo.copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                    )
                    .getMaterialItemBonus,
              ),
            ).thenAnswer(
              (invocation) async => Right(
                [
                  bonus913MockCartItem.copyWith(
                    quantity: 2,
                    stockInfo: mockStockInfo.copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                    addedBonusList: [
                      MaterialItemBonus.empty().copyWith(
                        materialInfo: MaterialInfo.empty().copyWith(
                          materialNumber: bonusMaterialNumber,
                        ),
                        qty: 1,
                        additionalBonusFlag: true,
                      ),
                      ...bonus913MockCartItem
                          .copyWith(
                            quantity: 2,
                            stockInfo: mockStockInfo.copyWith(
                              materialNumber: bonusMaterialNumber,
                            ),
                          )
                          .getMaterialItemBonus,
                    ],
                  )
                ],
              ),
            );
            when(
              () => cartRepositoryMock.getStockInfoList(
                customerCodeInfo: CustomerCodeInfo.empty(),
                materialInfoList: [],
                salesOrganisation: SalesOrganisation.empty(),
                salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
                shipToInfo: ShipToInfo.empty(),
              ),
            ).thenAnswer(
              (invocation) async => const Right(
                <StockInfo>[],
              ),
            );
          },
          act: (bloc) => bloc.add(
            CartEvent.addToCart(
              item: bonus913MockCartItem.copyWith(
                quantity: -1,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: [
                  MaterialItemBonus.empty().copyWith(
                    materialInfo: MaterialInfo.empty().copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                    additionalBonusFlag: true,
                    qty: 1,
                  ),
                  ...bonus913MockCartItem
                      .copyWith(
                        quantity: 5,
                        stockInfo: mockStockInfo.copyWith(
                          materialNumber: bonusMaterialNumber,
                        ),
                      )
                      .getMaterialItemBonus,
                ],
              ),
              customerCodeInfo: CustomerCodeInfo.empty(),
              doNotallowOutOfStockMaterial: true,
              salesOrganisation: SalesOrganisation.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              shipToInfo: ShipToInfo.empty(),
            ),
          ),
          expect: () => [
            CartState.initial().copyWith(
              selectedItemsMaterialNumber: [bonusMaterialNumber],
              cartItemList: [
                bonus913MockCartItem.copyWith(
                  quantity: 3,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                  addedBonusList: [
                    MaterialItemBonus.empty().copyWith(
                      materialInfo: MaterialInfo.empty().copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                      additionalBonusFlag: true,
                      qty: 1,
                    ),
                    ...bonus913MockCartItem
                        .copyWith(
                          quantity: 3,
                          stockInfo: mockStockInfo.copyWith(
                            materialNumber: bonusMaterialNumber,
                          ),
                        )
                        .getMaterialItemBonus,
                  ],
                )
              ],
            ),
            CartState.initial().copyWith(
              selectedItemsMaterialNumber: [bonusMaterialNumber],
              cartItemList: [
                bonus913MockCartItem.copyWith(
                  quantity: 2,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                  addedBonusList: [
                    MaterialItemBonus.empty().copyWith(
                      materialInfo: MaterialInfo.empty().copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                      additionalBonusFlag: true,
                      qty: 1,
                    ),
                    ...bonus913MockCartItem
                        .copyWith(
                          quantity: 3,
                          stockInfo: mockStockInfo.copyWith(
                            materialNumber: bonusMaterialNumber,
                          ),
                        )
                        .getMaterialItemBonus,
                  ],
                )
              ],
              isFetching: false,
            ),
            CartState.initial().copyWith(
              selectedItemsMaterialNumber: [bonusMaterialNumber],
              cartItemList: [
                bonus913MockCartItem.copyWith(
                  quantity: 2,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                  addedBonusList: [
                    MaterialItemBonus.empty().copyWith(
                      materialInfo: MaterialInfo.empty().copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                      additionalBonusFlag: true,
                      qty: 1,
                    ),
                    ...bonus913MockCartItem
                        .copyWith(
                          quantity: 3,
                          stockInfo: mockStockInfo.copyWith(
                            materialNumber: bonusMaterialNumber,
                          ),
                        )
                        .getMaterialItemBonus,
                  ],
                )
              ],
            ),
            CartState.initial().copyWith(
              selectedItemsMaterialNumber: [bonusMaterialNumber],
              cartItemList: [
                bonus913MockCartItem.copyWith(
                  quantity: 2,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                  addedBonusList: [
                    MaterialItemBonus.empty().copyWith(
                      materialInfo: MaterialInfo.empty().copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                      additionalBonusFlag: true,
                      qty: 1,
                    ),
                    ...bonus913MockCartItem
                        .copyWith(
                          quantity: 2,
                          stockInfo: mockStockInfo.copyWith(
                            materialNumber: bonusMaterialNumber,
                          ),
                        )
                        .getMaterialItemBonus,
                  ],
                )
              ],
              isFetching: false,
            ),
          ],
        );
        blocTest<CartBloc, CartState>(
          'remove bonus Item Fail',
          build: () => CartBloc(cartRepository: cartRepositoryMock),
          seed: () => CartState.initial().copyWith(
            selectedItemsMaterialNumber: [bonusMaterialNumber],
            cartItemList: [
              bonus913MockCartItem.copyWith(
                quantity: 1,
                stockInfo: mockStockInfo.copyWith(
                  materialNumber: bonusMaterialNumber,
                ),
                addedBonusList: [
                  MaterialItemBonus.empty().copyWith(
                    materialInfo: MaterialInfo.empty().copyWith(
                      materialNumber: bonusMaterialNumber,
                    ),
                    additionalBonusFlag: true,
                    qty: 1,
                  ),
                ],
              )
            ],
            isFetching: false,
          ),
          setUp: () {
            when(
              () => cartRepositoryMock.deleteBonusItem(
                cartItem: bonus913MockCartItem.copyWith(
                  quantity: 1,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                  addedBonusList: [
                    MaterialItemBonus.empty().copyWith(
                      materialInfo: MaterialInfo.empty().copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                      additionalBonusFlag: true,
                      qty: 1,
                    ),
                  ],
                ),
                bonusItem: MaterialItemBonus.empty().copyWith(
                  materialInfo: MaterialInfo.empty().copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                  additionalBonusFlag: true,
                  qty: 1,
                ),
                isUpdateFromCart: true,
              ),
            ).thenAnswer(
              (invocation) async => const Left(ApiFailure.other('Fake-Error')),
            );
          },
          act: (bloc) => bloc.add(CartEvent.deleteBonusItem(
            cartItem: bonus913MockCartItem.copyWith(
              quantity: 1,
              stockInfo: mockStockInfo.copyWith(
                materialNumber: bonusMaterialNumber,
              ),
              addedBonusList: [
                MaterialItemBonus.empty().copyWith(
                  materialInfo: MaterialInfo.empty().copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                  additionalBonusFlag: true,
                  qty: 1,
                ),
              ],
            ),
            bonusItem: MaterialItemBonus.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
                materialNumber: bonusMaterialNumber,
              ),
              additionalBonusFlag: true,
              qty: 1,
            ),
            isUpdateFromCart: true,
          )),
          expect: () => [
            CartState.initial().copyWith(
              selectedItemsMaterialNumber: [bonusMaterialNumber],
              cartItemList: [
                bonus913MockCartItem.copyWith(
                  quantity: 1,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                  addedBonusList: [
                    MaterialItemBonus.empty().copyWith(
                      materialInfo: MaterialInfo.empty().copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                      additionalBonusFlag: true,
                      qty: 1,
                    ),
                  ],
                )
              ],
            ),
            CartState.initial().copyWith(
              selectedItemsMaterialNumber: [bonusMaterialNumber],
              cartItemList: [
                bonus913MockCartItem.copyWith(
                  quantity: 1,
                  stockInfo: mockStockInfo.copyWith(
                    materialNumber: bonusMaterialNumber,
                  ),
                  addedBonusList: [
                    MaterialItemBonus.empty().copyWith(
                      materialInfo: MaterialInfo.empty().copyWith(
                        materialNumber: bonusMaterialNumber,
                      ),
                      additionalBonusFlag: true,
                      qty: 1,
                    ),
                  ],
                )
              ],
              apiFailureOrSuccessOption: optionOf(
                const Left(
                  ApiFailure.other('Fake-Error'),
                ),
              ),
              isFetching: false,
            ),
          ],
        );
      });
    },
  );
  group('Save Order To Cart', () {
    blocTest<CartBloc, CartState>(
      'Add To Empty Cart From Save Order',
      build: () => CartBloc(cartRepository: cartRepositoryMock),
      setUp: () {
        when(
          () => cartRepositoryMock.getStockInfoMaterialList(
            materialList: mockCartItemList,
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            salesOrganisation: SalesOrganisation.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ).thenAnswer(
          (invocation) async => Right(mockCartItemList),
        );
        when(() => cartRepositoryMock.addToCartList(items: mockCartItemList))
            .thenAnswer(
          (invocation) async => Right(
            mockCartItemList,
          ),
        );
        when(
          () => cartRepositoryMock.getUpdatedMaterialList(
            cartItemList: [],
            items: mockCartItemList,
            selectedItemsMaterialNumber: [],
          ),
        ).thenReturn(
          [],
        );
      },
      act: (bloc) => bloc.add(
        CartEvent.addToCartFromList(
          customerCodeInfo: CustomerCodeInfo.empty(),
          salesOrganisation: SalesOrganisation.empty(),
          salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
          shipToInfo: ShipToInfo.empty(),
          doNotAllowOutOfStockMaterials: false,
          items: mockCartItemList,
        ),
      ),
      expect: () => [
        CartState.initial(),
        CartState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          isFetching: false,
          cartItemList: mockCartItemList,
        ),
      ],
    );

    blocTest<CartBloc, CartState>(
      'Add To Cart With Existing Item From Save Order',
      build: () => CartBloc(cartRepository: cartRepositoryMock),
      seed: () => CartState.initial().copyWith(
        cartItemList: mockCartItemList,
        isFetching: false,
      ),
      setUp: () {
        when(() => cartRepositoryMock.getStockInfoMaterialList(
              materialList: mockCartItemList,
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
            )).thenAnswer((invocation) async => Right(mockCartItemList));
        when(() => cartRepositoryMock.addToCartList(items: mockCartItemList))
            .thenAnswer(
          (invocation) async => Right(
            mockCartItemList,
          ),
        );
        when(
          () => cartRepositoryMock.getUpdatedMaterialList(
            cartItemList: mockCartItemList,
            items: mockCartItemList,
            selectedItemsMaterialNumber: [],
          ),
        ).thenReturn(
          [],
        );
      },
      act: (bloc) => bloc.add(
        CartEvent.addToCartFromList(
          customerCodeInfo: CustomerCodeInfo.empty(),
          salesOrganisation: SalesOrganisation.empty(),
          salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
          shipToInfo: ShipToInfo.empty(),
          doNotAllowOutOfStockMaterials: false,
          items: mockCartItemList,
        ),
      ),
      expect: () => [
        CartState.initial().copyWith(
          cartItemList: mockCartItemList,
        ),
        CartState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          isFetching: false,
          cartItemList: mockCartItemList,
        ),
      ],
    );
    blocTest<CartBloc, CartState>(
      'Add To Cart From Save Order fail',
      build: () => CartBloc(cartRepository: cartRepositoryMock),
      seed: () => CartState.initial().copyWith(
        isFetching: false,
      ),
      setUp: () {
        when(
          () => cartRepositoryMock.getStockInfoMaterialList(
            materialList: mockCartItemList,
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            salesOrganisation: SalesOrganisation.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ).thenAnswer(
          (invocation) async => Right(mockCartItemList),
        );
        when(
          () => cartRepositoryMock.addToCartList(items: mockCartItemList),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('Fake-Error'),
          ),
        );
        when(
          () => cartRepositoryMock.getUpdatedMaterialList(
            cartItemList: mockCartItemList,
            items: mockCartItemList,
            selectedItemsMaterialNumber: [],
          ),
        ).thenReturn(
          [],
        );
      },
      act: (bloc) => bloc.add(
        CartEvent.addToCartFromList(
          customerCodeInfo: CustomerCodeInfo.empty(),
          salesOrganisation: SalesOrganisation.empty(),
          salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
          shipToInfo: ShipToInfo.empty(),
          doNotAllowOutOfStockMaterials: false,
          items: mockCartItemList,
        ),
      ),
      expect: () => [
        CartState.initial(),
        CartState.initial().copyWith(
          apiFailureOrSuccessOption: optionOf(
            const Left(ApiFailure.other('Fake-Error')),
          ),
          isFetching: false,
          cartItemList: [],
        ),
      ],
    );
    blocTest<CartBloc, CartState>(
      'Add To Cart From Save Order fail for Out of Stock',
      build: () => CartBloc(cartRepository: cartRepositoryMock),
      seed: () => CartState.initial().copyWith(
        isFetching: false,
      ),
      setUp: () {
        when(
          () => cartRepositoryMock.getStockInfoMaterialList(
            materialList: mockCartItemList,
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            salesOrganisation: SalesOrganisation.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ).thenAnswer(
          (invocation) async => Right(mockCartItemList),
        );
        when(
          () => cartRepositoryMock.addToCartList(items: mockCartItemList),
        ).thenAnswer(
          (invocation) async => Right(
            mockCartItemList,
          ),
        );
        when(
          () => cartRepositoryMock.getUpdatedMaterialList(
            cartItemList: mockCartItemList,
            items: mockCartItemList,
            selectedItemsMaterialNumber: [],
          ),
        ).thenReturn(
          [],
        );
        when(
          () => cartRepositoryMock.getStockInfoMaterialList(
            materialList: mockCartItemList,
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            salesOrganisation: SalesOrganisation.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ).thenAnswer(
          (invocation) async => const Right([]),
        );
      },
      act: (bloc) => bloc.add(
        CartEvent.addToCartFromList(
          customerCodeInfo: CustomerCodeInfo.empty(),
          salesOrganisation: SalesOrganisation.empty(),
          salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
          shipToInfo: ShipToInfo.empty(),
          doNotAllowOutOfStockMaterials: false,
          items: mockCartItemList,
        ),
      ),
      expect: () => [
        CartState.initial(),
        CartState.initial().copyWith(
          isFetching: false,
          cartItemList: [],
        ),
      ],
    );
    blocTest<CartBloc, CartState>(
      'Add To Cart From Save Order fail for Stock Load Fail',
      build: () => CartBloc(cartRepository: cartRepositoryMock),
      seed: () => CartState.initial().copyWith(
        isFetching: false,
      ),
      setUp: () {
        when(
          () => cartRepositoryMock.getStockInfoMaterialList(
            materialList: mockCartItemList,
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            salesOrganisation: SalesOrganisation.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ).thenAnswer(
          (invocation) async => Right(mockCartItemList),
        );
        when(
          () => cartRepositoryMock.addToCartList(items: mockCartItemList),
        ).thenAnswer(
          (invocation) async => Right(
            mockCartItemList,
          ),
        );
        when(
          () => cartRepositoryMock.getUpdatedMaterialList(
            cartItemList: mockCartItemList,
            items: mockCartItemList,
            selectedItemsMaterialNumber: [],
          ),
        ).thenReturn(
          [],
        );
        when(() => cartRepositoryMock.getStockInfoMaterialList(
              materialList: mockCartItemList,
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              shipToInfo: ShipToInfo.empty(),
            )).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('Fake-Error'),
          ),
        );
      },
      act: (bloc) => bloc.add(
        CartEvent.addToCartFromList(
          customerCodeInfo: CustomerCodeInfo.empty(),
          salesOrganisation: SalesOrganisation.empty(),
          salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
          shipToInfo: ShipToInfo.empty(),
          doNotAllowOutOfStockMaterials: false,
          items: mockCartItemList,
        ),
      ),
      expect: () => [
        CartState.initial(),
        CartState.initial().copyWith(
          isFetching: false,
          cartItemList: [],
        ),
      ],
    );

    blocTest<CartBloc, CartState>(
      'Add To Cart From Save Order fail Materail Out of Stock and out of stock material not allowed',
      build: () => CartBloc(cartRepository: cartRepositoryMock),
      seed: () => CartState.initial().copyWith(
        isFetching: false,
      ),
      setUp: () {
        when(
          () => cartRepositoryMock.getStockInfoMaterialList(
            materialList: mockCartItemList,
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            salesOrganisation: SalesOrganisation.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ).thenAnswer(
          (invocation) async => const Right([]),
        );
        when(
          () => cartRepositoryMock.getStockInfoMaterialList(
            materialList: mockCartItemList,
            customerCodeInfo: CustomerCodeInfo.empty(),
            salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
            salesOrganisation: SalesOrganisation.empty(),
            shipToInfo: ShipToInfo.empty(),
          ),
        ).thenAnswer(
          (invocation) async => Right(
            mockCartItemList
                .map(
                  (e) => e.copyWith(
                    stockInfo: StockInfo.empty(),
                  ),
                )
                .toList(),
          ),
        );
      },
      act: (bloc) => bloc.add(
        CartEvent.addToCartFromList(
          customerCodeInfo: CustomerCodeInfo.empty(),
          salesOrganisation: SalesOrganisation.empty(),
          salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
          shipToInfo: ShipToInfo.empty(),
          doNotAllowOutOfStockMaterials: true,
          items: mockCartItemList,
        ),
      ),
      expect: () => [
        CartState.initial(),
        CartState.initial().copyWith(
          isFetching: false,
          cartItemList: [],
        ),
      ],
    );
  });
}

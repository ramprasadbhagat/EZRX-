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
  late CartRepository cartRepositoryMock;
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
          expiryDate: '-',
          salesDistrict: '',
          batch: '',
        )),
  ];

  final mockCartItemList2 = [
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
    ),
    PriceAggregate.empty().copyWith(
      quantity: 1,
      materialInfo: MaterialInfo.empty().copyWith(
        materialNumber: MaterialNumber('000000000023168456'),
        materialDescription: ' Triglyceride Mosys D',
        principalData: PrincipalData.empty().copyWith(
          principalName: '台灣拜耳股份有限公司',
        ),
        remarks: '',
      ),
    ),
  ];

  final mockStockInfo = StockInfo.empty().copyWith(
    materialNumber: MaterialNumber('8949542'),
    inStock: MaterialInStock('Yes'),
    expiryDate: '-',
    salesDistrict: '',
    batch: '',
  );

  final mockMaterialItemList = [
    MaterialNumber('111111111'),
  ];
  final mockMaterialItemList2 = [
    MaterialNumber('111111111'),
    MaterialNumber('000000000023168451'),
  ];

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
        cartRepositoryMock = CartRepositoryMock();
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
          ),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: none(),
            cartItemList: mockCartItemList,
            selectedItemsMaterialNumber: mockMaterialItemList,
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
          CartState.initial(),
          CartState.initial().copyWith(
            cartItemList: [mockZmgCartItemList.first],
            selectedItemsMaterialNumber: [
              mockZmgCartItemList.first.getMaterialNumber
            ],
          ),
          CartState.initial().copyWith(
            cartItemList: [
              mockZmgCartItemList.first.copyWith(discountedMaterialCount: 1)
            ],
            selectedItemsMaterialNumber: [
              mockZmgCartItemList.first.getMaterialNumber
            ],
          ),
        ],
        verify: (CartBloc bloc) {
          expect(
            bloc.state.cartItemList.first.listPrice,
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
          ),
        ],
        verify: (CartBloc bloc) {
          expect(
            bloc.state.cartItemList.first.listPrice,
            mockZmgCartItemList.first.price.priceTireItem.first.rate,
          );
          expect(
            bloc.state.cartItemList.last.listPrice,
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
            bloc.state.cartItemList.first.listPrice,
            mockZmgCartItemList.first.price
                .copyWith(zmgDiscount: true)
                .priceTireItem
                .first
                .rate,
          );

          expect(
            bloc.state.cartItemList.last.listPrice,
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
            bloc.state.cartItemList.first.listPrice,
            mockZmgCartItemList.first.price.priceTireItem.last.rate,
          );
          expect(
            bloc.state.cartItemList.last.listPrice,
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
            bloc.state.cartItemList.first.listPrice,
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
            bloc.state.cartItemList.first.listPrice,
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
          ),
        ],
        verify: (CartBloc bloc) {
          expect(
            bloc.state.cartItemList.first.listPrice,
            mockZmgCartItemList.first.price.priceTireItem.first.rate,
          );
          expect(
            bloc.state.cartItemList.last.listPrice,
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
            bloc.state.cartItemList.first.listPrice,
            mockZmgCartItemList.first.price.priceTireItem.first.rate,
          );
          expect(
            bloc.state.cartItemList.last.listPrice,
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
}

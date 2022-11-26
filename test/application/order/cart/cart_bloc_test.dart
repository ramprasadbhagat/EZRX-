import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/price_tier.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/repository/cart_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class CartRepositoryMock extends Mock implements CartRepository {}

void main() {
  late CartRepository cartRepositoryMock;
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
    ),
  ];

  final mockMaterialItemList = [
    MaterialNumber('111111111'),
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
      });
      blocTest<CartBloc, CartState>(
        'Initialize CartBloc adn fetch',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(() => cartRepositoryMock.fetchCartItems()).thenAnswer(
              (invocation) async => const Right(<PriceAggregate>[]));
        },
        act: (bloc) => bloc
          ..add(const CartEvent.initialized())
          ..add(const CartEvent.fetch()),
        expect: () => [
          CartState.initial(),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: none(),
            cartItemList: <PriceAggregate>[],
            isFetching: true,
          ),
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
          when(() => cartRepositoryMock.fetchCartItems())
              .thenAnswer((invocation) async => Right(mockCartItemList));
        },
        act: (bloc) => bloc.add(const CartEvent.fetch()),
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
        act: (bloc) => bloc.add(const CartEvent.fetch()),
        expect: () => [
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: none(),
            cartItemList: <PriceAggregate>[],
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
        'Add to Cart Success CartBloc',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(() => cartRepositoryMock.addToCart(
                cartItem: PriceAggregate.empty(),
                customerCodeInfo: CustomerCodeInfo.empty(),
                salesOrganisation: SalesOrganisation.empty(),
                salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
                shipToInfo: ShipToInfo.empty(),
                doNotallowOutOfStockMaterial: true,
              )).thenAnswer((invocation) async => Right(mockCartItemList));

          when(() => cartRepositoryMock.fetchCartItems())
              .thenAnswer((invocation) async => Right(mockCartItemList));

          when((() => cartRepositoryMock.getUpdatedMaterialList(
                  cartItemList: [],
                  selectedItemsMaterialNumber: [],
                  item: PriceAggregate.empty())))
              .thenAnswer((invocation) => mockMaterialItemList);
        },
        act: (bloc) => bloc.add(CartEvent.addToCart(
          item: PriceAggregate.empty(),
          customerCodeInfo: CustomerCodeInfo.empty(),
          salesOrganisation: SalesOrganisation.empty(),
          salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
          shipToInfo: ShipToInfo.empty(),
          doNotallowOutOfStockMaterial: true,
        )),
        expect: () => [
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: none(),
            isFetching: true,
            selectedItemsMaterialNumber: [],
          ),
          CartState.initial().copyWith(
            apiFailureOrSuccessOption: none(),
            cartItemList: mockCartItemList,
            isFetching: false,
            selectedItemsMaterialNumber: mockMaterialItemList,
          ),
        ],
      );
      blocTest<CartBloc, CartState>(
        'Add to Cart Failure CartBloc',
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(() => cartRepositoryMock.addToCart(
                    cartItem: PriceAggregate.empty(),
                    customerCodeInfo: CustomerCodeInfo.empty(),
                    salesOrganisation: SalesOrganisation.empty(),
                    salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
                    shipToInfo: ShipToInfo.empty(),
                    doNotallowOutOfStockMaterial: true,
                  ))
              .thenAnswer((invocation) async =>
                  const Left(ApiFailure.other('Fake-Error')));
          when(() => cartRepositoryMock.fetchCartItems()).thenAnswer(
              (invocation) async => const Left(ApiFailure.other('Fake-Error')));
        },
        act: (bloc) => bloc.add(CartEvent.addToCart(
          item: PriceAggregate.empty(),
          customerCodeInfo: CustomerCodeInfo.empty(),
          salesOrganisation: SalesOrganisation.empty(),
          salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
          shipToInfo: ShipToInfo.empty(),
          doNotallowOutOfStockMaterial: true,
        )),
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
          when(() => cartRepositoryMock.addToCart(
                cartItem: mockZmgCartItemList.first,
                customerCodeInfo: CustomerCodeInfo.empty(),
                salesOrganisation: SalesOrganisation.empty(),
                salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
                shipToInfo: ShipToInfo.empty(),
                doNotallowOutOfStockMaterial: true,
              )).thenAnswer(
            (invocation) async => Right([mockZmgCartItemList.first]),
          );

          when((() => cartRepositoryMock.getUpdatedMaterialList(
                    cartItemList: [],
                    selectedItemsMaterialNumber: [],
                    item: mockZmgCartItemList.first,
                  )))
              .thenAnswer((invocation) =>
                  [mockZmgCartItemList.first.getMaterialNumber]);
        },
        act: (bloc) => bloc.add(CartEvent.addToCart(
          item: mockZmgCartItemList.first,
          customerCodeInfo: CustomerCodeInfo.empty(),
          salesOrganisation: SalesOrganisation.empty(),
          salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
          shipToInfo: ShipToInfo.empty(),
          doNotallowOutOfStockMaterial: true,
        )),
        expect: () => [
          CartState.initial().copyWith(isFetching: true),
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
          isFetching: false,
        ),
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(
            () => cartRepositoryMock.addToCart(
              cartItem: mockZmgCartItemList.last.copyWith(quantity: 3),
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              shipToInfo: ShipToInfo.empty(),
              doNotallowOutOfStockMaterial: true,
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
                item: mockZmgCartItemList.last.copyWith(quantity: 3),
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
            cartItemList: [mockZmgCartItemList.first.copyWith(quantity: 2)],
            selectedItemsMaterialNumber: [],
            isFetching: true,
          ),
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
          when(
            () => cartRepositoryMock.updateCartItem(
              cartItem: mockZmgCartItemList.last.copyWith(quantity: 4),
            ),
          ).thenAnswer(
            (invocation) async => Right([
              mockZmgCartItemList.first.copyWith(quantity: 1),
              mockZmgCartItemList.last.copyWith(quantity: 4),
            ]),
          );
        },
        act: (bloc) => bloc.add(CartEvent.updateCartItem(
            item: mockZmgCartItemList.last.copyWith(quantity: 4))),
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
          when(
            () => cartRepositoryMock.updateCartItem(
              cartItem: mockZmgCartItemList.last.copyWith(quantity: 1),
            ),
          ).thenAnswer(
            (invocation) async => Right([
              mockZmgCartItemList.first.copyWith(quantity: 1),
              mockZmgCartItemList.last.copyWith(quantity: 1),
            ]),
          );
        },
        act: (bloc) => bloc.add(CartEvent.updateCartItem(
            item: mockZmgCartItemList.last.copyWith(quantity: 1))),
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
          when(
            () => cartRepositoryMock.updateCartItem(
              cartItem: mockZmgCartItemList.first.copyWith(quantity: 4),
            ),
          ).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('Fake-Error')),
          );
        },
        act: (bloc) => bloc.add(CartEvent.updateCartItem(
            item: mockZmgCartItemList.first.copyWith(quantity: 4))),
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
          isFetching: false,
        ),
        build: () => CartBloc(cartRepository: cartRepositoryMock),
        setUp: () {
          when(
            () => cartRepositoryMock.addToCart(
              cartItem: mockZmgCartItemList.first.copyWith(
                quantity: 4,
                price: mockZmgCartItemList.first.price
                    .copyWith(zmgDiscount: false),
              ),
              customerCodeInfo: CustomerCodeInfo.empty(),
              salesOrganisation: SalesOrganisation.empty(),
              salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
              shipToInfo: ShipToInfo.empty(),
              doNotallowOutOfStockMaterial: true,
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
                  item: mockZmgCartItemList.first.copyWith(
                    quantity: 4,
                    price: mockZmgCartItemList.first.price
                        .copyWith(zmgDiscount: false),
                  ),
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
          when(
            () => cartRepositoryMock.updateCartItem(
              cartItem: mockZmgCartItemList.first.copyWith(
                quantity: 4,
                price: mockZmgCartItemList.first.price
                    .copyWith(zmgDiscount: false),
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
                  item: mockZmgCartItemList.first.copyWith(
                    quantity: 4,
                    price: mockZmgCartItemList.first.price
                        .copyWith(zmgDiscount: false),
                  ),
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
                bonusItem: MaterialInfo.empty(),
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
            bonusItem: MaterialInfo.empty(),
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
                bonusItem: MaterialInfo.empty(),
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
            bonusItem: MaterialInfo.empty(),
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
                bonusItem: MaterialInfo.empty(),
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
            bonusItem: MaterialInfo.empty(),
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
    },
  );
}

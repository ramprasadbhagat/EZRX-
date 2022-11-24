import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
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
                  cartItem: PriceAggregate.empty()))
              .thenAnswer((invocation) async => Right(mockCartItemList));

          when(() => cartRepositoryMock.fetchCartItems())
              .thenAnswer((invocation) async => Right(mockCartItemList));

          when((() => cartRepositoryMock.getUpdatedMaterialList(
                  cartItemList: [],
                  selectedItemsMaterialNumber: [],
                  item: PriceAggregate.empty())))
              .thenAnswer((invocation) => mockMaterialItemList);
        },
        act: (bloc) =>
            bloc.add(CartEvent.addToCart(item: PriceAggregate.empty())),
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
          when(() =>
              cartRepositoryMock.addToCart(
                  cartItem: PriceAggregate.empty())).thenAnswer(
              (invocation) async => const Left(ApiFailure.other('Fake-Error')));
          when(() => cartRepositoryMock.fetchCartItems()).thenAnswer(
              (invocation) async => const Left(ApiFailure.other('Fake-Error')));
        },
        act: (bloc) =>
            bloc.add(CartEvent.addToCart(item: PriceAggregate.empty())),
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
    },
  );
}

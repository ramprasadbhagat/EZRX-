import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/order_history_details/order_history_details_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/aggregate/bonus_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items_details.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items_tender_contract_details.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/repository/order_history_details_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockOrderHistoryDetailsRepository extends Mock
    implements OrderHistoryDetailsRepository {}

void main() {
  group('OrderHistoryDetailsBloc should - ', () {
    late OrderHistoryDetailsBloc orderHistoryDetailsBloc;
    late OrderHistoryDetailsRepository orderHistoryDetailsRepository;
    final emptyUser = User.empty();
    final emptyOrderHistoryItem = OrderHistoryItem.empty();
    final emptyOrderHistoryDetails = OrderHistoryDetails.empty().copyWith(
      orderHistoryDetailsOrderItem: [
        OrderHistoryDetailsOrderItem.empty().copyWith(
          details: [
            OrderHistoryDetailsOrderItemDetails.empty(),
          ],
          tenderContractDetails:
              OrderHistoryDetailsOrderItemTenderContractDetails.empty(),
        )
      ],
    );
    final validOrderHistoryDetails = OrderHistoryDetails.empty().copyWith(
      orderHistoryDetailsOrderItem: [
        OrderHistoryDetailsOrderItem.empty().copyWith(
          type: OrderItemType('Comm'),
          details: [
            OrderHistoryDetailsOrderItemDetails.empty(),
          ],
          tenderContractDetails:
              OrderHistoryDetailsOrderItemTenderContractDetails.empty(),
        ),
        OrderHistoryDetailsOrderItem.empty().copyWith(
          type: OrderItemType('Non-Comm'),
          details: [
            OrderHistoryDetailsOrderItemDetails.empty(),
          ],
          tenderContractDetails:
              OrderHistoryDetailsOrderItemTenderContractDetails.empty(),
        ),
      ],
    );
    const apiServerTimeOut = ApiFailure.serverTimeout();

    OrderHistoryDetailsBloc getOrderHistoryDetailsBloc() {
      return OrderHistoryDetailsBloc(
          orderHistoryDetailsRepository: orderHistoryDetailsRepository);
    }

    setUpAll(() {
      orderHistoryDetailsRepository = MockOrderHistoryDetailsRepository();
      orderHistoryDetailsBloc = getOrderHistoryDetailsBloc();
    });
    test('have initial state as OrderHistoryDetailsState.initial()', () {
      expect(
        orderHistoryDetailsBloc.state,
        OrderHistoryDetailsState.initial(),
      );
    });

    blocTest<OrderHistoryDetailsBloc, OrderHistoryDetailsState>(
      'emit correct data on initialized() event',
      setUp: () {
        when(
          () => orderHistoryDetailsRepository.getOrderHistoryDetails(
            user: emptyUser,
            orderHistoryItem: emptyOrderHistoryItem,
          ),
        ).thenAnswer((invocation) async => const Left(apiServerTimeOut));
      },
      build: () => getOrderHistoryDetailsBloc(),
      act: (bloc) => bloc.add(
        const OrderHistoryDetailsEvent.initialized(),
      ),
      expect: () => [
        OrderHistoryDetailsState.initial(),
      ],
    );

    blocTest<OrderHistoryDetailsBloc, OrderHistoryDetailsState>(
      'emit correct data on successful fetch() event',
      setUp: () {
        when(
          () => orderHistoryDetailsRepository.getOrderHistoryDetails(
            user: emptyUser,
            orderHistoryItem: emptyOrderHistoryItem,
          ),
        ).thenAnswer((invocation) async => Right(emptyOrderHistoryDetails));
      },
      build: () => getOrderHistoryDetailsBloc(),
      act: (bloc) => bloc.add(
        OrderHistoryDetailsEvent.fetch(
          user: emptyUser,
          orderHistoryItem: emptyOrderHistoryItem,
        ),
      ),
      expect: () => [
        OrderHistoryDetailsState.initial().copyWith(
          isLoading: true,
          showErrorMessage: false,
          failureOrSuccessOption: none(),
        ),
        OrderHistoryDetailsState.initial().copyWith(
          orderHistoryDetails: emptyOrderHistoryDetails,
          failureOrSuccessOption: none(),
          isLoading: false,
        ),
      ],
    );

    blocTest<OrderHistoryDetailsBloc, OrderHistoryDetailsState>(
      'emit correct data on successful fetch() event with OrderItemType as COMM',
      setUp: () {
        when(
          () => orderHistoryDetailsRepository.getOrderHistoryDetails(
            user: emptyUser,
            orderHistoryItem: emptyOrderHistoryItem,
          ),
        ).thenAnswer((invocation) async => Right(validOrderHistoryDetails));
      },
      build: () => getOrderHistoryDetailsBloc(),
      act: (bloc) => bloc.add(
        OrderHistoryDetailsEvent.fetch(
          user: emptyUser,
          orderHistoryItem: emptyOrderHistoryItem,
        ),
      ),
      expect: () => [
        OrderHistoryDetailsState.initial().copyWith(
          isLoading: true,
          showErrorMessage: false,
          failureOrSuccessOption: none(),
        ),
        OrderHistoryDetailsState.initial().copyWith(
          orderHistoryDetails: validOrderHistoryDetails,
          failureOrSuccessOption: none(),
          isLoading: false,
          bonusItem: [
            OrderHistoryDetailsBonusAggregate.empty().copyWith(
              orderItem: OrderHistoryDetailsOrderItem.empty().copyWith(
                type: OrderItemType('Comm'),
                details: [
                  OrderHistoryDetailsOrderItemDetails.empty(),
                ],
              ),
              details: [
                OrderHistoryDetailsOrderItemDetails.empty(),
              ],
              bonusList: [
                OrderHistoryDetailsOrderItem.empty().copyWith(
                  type: OrderItemType('Non-Comm'),
                  details: [
                    OrderHistoryDetailsOrderItemDetails.empty(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );

    blocTest<OrderHistoryDetailsBloc, OrderHistoryDetailsState>(
      'emit correct data on unsuccessful fetch() event',
      setUp: () {
        when(
          () => orderHistoryDetailsRepository.getOrderHistoryDetails(
            user: emptyUser,
            orderHistoryItem: emptyOrderHistoryItem,
          ),
        ).thenAnswer((invocation) async => const Left(apiServerTimeOut));
      },
      build: () => getOrderHistoryDetailsBloc(),
      act: (bloc) => bloc.add(
        OrderHistoryDetailsEvent.fetch(
          user: emptyUser,
          orderHistoryItem: emptyOrderHistoryItem,
        ),
      ),
      expect: () => [
        OrderHistoryDetailsState.initial().copyWith(
          isLoading: true,
          showErrorMessage: false,
          failureOrSuccessOption: none(),
        ),
        OrderHistoryDetailsState.initial().copyWith(
          failureOrSuccessOption: optionOf(const Left(apiServerTimeOut)),
          isLoading: false,
          showErrorMessage: true,
        ),
      ],
    );
  });
}

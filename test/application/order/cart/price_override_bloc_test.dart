import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/cart/price_override/price_override_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/infrastructure/order/repository/price_override_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class PriceOverrideRepositoryMock extends Mock
    implements PriceOverrideRepository {}

void main() {
  late PriceOverrideRepository priceOverrideRepositoryMock;

  group(
    'Testing price override bloc',
    () {
      setUp(
        () {
          priceOverrideRepositoryMock = PriceOverrideRepositoryMock();
        },
      );
      blocTest<PriceOverrideBloc, PriceOverrideState>(
        'Fetch the overrided price',
        build: () => PriceOverrideBloc(
            priceOverrideRepository: priceOverrideRepositoryMock),
        setUp: () {
          when(
            () => priceOverrideRepositoryMock.updateItemPrice(
              customerCodeInfo: CustomerCodeInfo.empty(),
              item: PriceAggregate.empty(),
              newPrice: '70',
              salesOrganisation: SalesOrganisation.empty(),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [Price.empty()],
            ),
          );
        },
        act: (bloc) => bloc.add(
          PriceOverrideEvent.fetch(
            customerCodeInfo: CustomerCodeInfo.empty(),
            item: PriceAggregate.empty(),
            newPrice: '70',
            salesOrganisation: SalesOrganisation.empty(),
          ),
        ),
        expect: () => [
          PriceOverrideState.initial().copyWith(
            isFetching: true,
            cartItemList: [],
          ),
          PriceOverrideState.initial().copyWith(
            isFetching: false,
            cartItemList: [Price.empty()],
          ),
        ],
      );

      blocTest<PriceOverrideBloc, PriceOverrideState>(
        'failed to Fetch the overrided price',
        build: () => PriceOverrideBloc(
            priceOverrideRepository: priceOverrideRepositoryMock),
        setUp: () {
          when(
            () => priceOverrideRepositoryMock.updateItemPrice(
              customerCodeInfo: CustomerCodeInfo.empty(),
              item: PriceAggregate.empty(),
              newPrice: '70',
              salesOrganisation: SalesOrganisation.empty(),
            ),
          ).thenAnswer(
            // ignore: prefer_const_constructors
            (invocation) async => Left(
              const ApiFailure.priceOverrideNotFound(),
            ),
          );
        },
        act: (bloc) => bloc.add(
          PriceOverrideEvent.fetch(
            customerCodeInfo: CustomerCodeInfo.empty(),
            item: PriceAggregate.empty(),
            newPrice: '70',
            salesOrganisation: SalesOrganisation.empty(),
          ),
        ),
        expect: () => [
          PriceOverrideState.initial().copyWith(
            isFetching: true,
            cartItemList: [],
          ),
          PriceOverrideState.initial().copyWith(
            isFetching: false,
            cartItemList: [],
            apiFailureOrSuccessOption: optionOf(
              const Left(ApiFailure.priceOverrideNotFound()),
            ),
          ),
        ],
      );
    },
  );
}

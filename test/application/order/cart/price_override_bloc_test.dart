import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/cart/price_override/price_override_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
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
        'initial to Fetch the overrided price',
        build: () => PriceOverrideBloc(
            priceOverrideRepository: priceOverrideRepositoryMock),
        setUp: () {
          when(
            () => priceOverrideRepositoryMock.updateItemPrice(
              customerCodeInfo: CustomerCodeInfo.empty(),
              item: PriceAggregate.empty(),
              newPrice: 0.0,
              salesOrganisation: SalesOrganisation.empty(),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [Price.empty()],
            ),
          );
        },
        act: (bloc) => bloc.add(
          const PriceOverrideEvent.initialized(),
        ),
        expect: () => [
          PriceOverrideState.initial().copyWith(
            isFetching: false,
            cartItemList: [],
          ),
        ],
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
              newPrice: 70.0,
              salesOrganisation: SalesOrganisation.empty(),
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [Price.empty()],
            ),
          );
        },
        act: (bloc) => bloc
          ..add(
            const PriceOverrideEvent.priceOverrideValueChanged(
              newPrice: '70.0',
            ),
          )
          ..add(
            PriceOverrideEvent.fetch(
              customerCodeInfo: CustomerCodeInfo.empty(),
              item: PriceAggregate.empty(),
              salesOrganisation: SalesOrganisation.empty(),
            ),
          ),
        expect: () => [
          PriceOverrideState.initial().copyWith(
            priceOverrideValue: PriceOverrideValue(70.0),
            showErrorMessages: false,
          ),
          PriceOverrideState.initial().copyWith(
            priceOverrideValue: PriceOverrideValue(70.0),
            isFetching: true,
            cartItemList: [],
          ),
          PriceOverrideState.initial().copyWith(
            isFetching: false,
            priceOverrideValue: PriceOverrideValue(70.0),
            cartItemList: [
              Price.empty().copyWith(
                priceOverride: PriceOverrideValue(70.0),
                isPriceOverride: true,
              ),
            ],
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
              newPrice: 70.0,
              salesOrganisation: SalesOrganisation.empty(),
            ),
          ).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.priceOverrideNotFound(),
            ),
          );
        },
        act: (bloc) => bloc
          ..add(
            const PriceOverrideEvent.priceOverrideValueChanged(
              newPrice: '70.0',
            ),
          )
          ..add(
            PriceOverrideEvent.fetch(
              customerCodeInfo: CustomerCodeInfo.empty(),
              item: PriceAggregate.empty(),
              salesOrganisation: SalesOrganisation.empty(),
            ),
          ),
        expect: () => [
          PriceOverrideState.initial().copyWith(
            priceOverrideValue: PriceOverrideValue(70.0),
            showErrorMessages: false,
          ),
          PriceOverrideState.initial().copyWith(
            priceOverrideValue: PriceOverrideValue(70.0),
            isFetching: true,
            cartItemList: [],
          ),
          PriceOverrideState.initial().copyWith(
            priceOverrideValue: PriceOverrideValue(70.0),
            isFetching: false,
            cartItemList: [],
            showErrorMessages: true,
            apiFailureOrSuccessOption: optionOf(
              const Left(ApiFailure.priceOverrideNotFound()),
            ),
          ),
        ],
      );
    },
  );
}

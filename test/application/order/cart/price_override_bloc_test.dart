import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/cart/price_override/price_override_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';
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
        'Price Override Bloc Initial',
        build: () => PriceOverrideBloc(
          priceOverrideRepository: priceOverrideRepositoryMock,
        ),
        act: (bloc) => bloc.add(
          const PriceOverrideEvent.initialized(),
        ),
        expect: () => [PriceOverrideState.initial()],
      );

      blocTest<PriceOverrideBloc, PriceOverrideState>(
        'Price Override Bloc onPriceValueChange',
        build: () => PriceOverrideBloc(
          priceOverrideRepository: priceOverrideRepositoryMock,
        ),
        act: (bloc) => bloc.add(
          const PriceOverrideEvent.onPriceValueChange(newPrice: '20'),
        ),
        expect: () => [
          PriceOverrideState.initial().copyWith(
            counterOfferDetails: RequestCounterOfferDetails.empty().copyWith(
              counterOfferPrice: CounterOfferValue('20'),
            ),
          )
        ],
      );

      blocTest<PriceOverrideBloc, PriceOverrideState>(
        'Price Override Bloc onRemarksValueChange',
        build: () => PriceOverrideBloc(
          priceOverrideRepository: priceOverrideRepositoryMock,
        ),
        act: (bloc) => bloc.add(
          const PriceOverrideEvent.onRemarksValueChange(
            newRemarks: 'fake-test',
          ),
        ),
        expect: () => [
          PriceOverrideState.initial().copyWith(
            counterOfferDetails: RequestCounterOfferDetails.empty().copyWith(
              comment: StringValue('fake-test'),
            ),
          )
        ],
      );

      blocTest<PriceOverrideBloc, PriceOverrideState>(
        'Fetch the overrided price',
        build: () => PriceOverrideBloc(
          priceOverrideRepository: priceOverrideRepositoryMock,
        ),
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
              Price.empty(),
            ),
          );
        },
        seed: () => PriceOverrideState.initial().copyWith(
          counterOfferDetails: RequestCounterOfferDetails.empty().copyWith(
            counterOfferPrice: CounterOfferValue('70'),
            comment: StringValue('fake-comment'),
          ),
        ),
        act: (bloc) => bloc.add(
          PriceOverrideEvent.fetch(
            customerCodeInfo: CustomerCodeInfo.empty(),
            item: PriceAggregate.empty(),
            salesOrganisation: SalesOrganisation.empty(),
          ),
        ),
        expect: () => [
          PriceOverrideState.initial().copyWith(
            counterOfferDetails: RequestCounterOfferDetails.empty().copyWith(
              counterOfferPrice: CounterOfferValue('70'),
              comment: StringValue('fake-comment'),
            ),
            isFetching: true,
          ),
          PriceOverrideState.initial().copyWith(
            isFetching: false,
            counterOfferDetails: RequestCounterOfferDetails.empty().copyWith(
              counterOfferPrice: CounterOfferValue('70'),
              comment: StringValue('fake-comment'),
            ),
            apiFailureOrSuccessOption: none(),
            overriddenMaterialPrice:
                Price.empty().copyWith(isPriceOverride: true),
            cartItemList: [
              Price.empty().copyWith(
                priceOverride: PriceOverrideValue(0),
                isPriceOverride: true,
              ),
            ],
          ),
        ],
      );

      blocTest<PriceOverrideBloc, PriceOverrideState>(
        'failed to Fetch the overrided price',
        build: () => PriceOverrideBloc(
          priceOverrideRepository: priceOverrideRepositoryMock,
        ),
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
        seed: () => PriceOverrideState.initial().copyWith(
          counterOfferDetails: RequestCounterOfferDetails.empty().copyWith(
            counterOfferPrice: CounterOfferValue('70'),
            comment: StringValue('fake-comment'),
          ),
        ),
        act: (bloc) => bloc.add(
          PriceOverrideEvent.fetch(
            customerCodeInfo: CustomerCodeInfo.empty(),
            item: PriceAggregate.empty(),
            salesOrganisation: SalesOrganisation.empty(),
          ),
        ),
        expect: () => [
          PriceOverrideState.initial().copyWith(
            counterOfferDetails: RequestCounterOfferDetails.empty().copyWith(
              counterOfferPrice: CounterOfferValue('70'),
              comment: StringValue('fake-comment'),
            ),
            isFetching: true,
          ),
          PriceOverrideState.initial().copyWith(
            showErrorMessages: true,
            apiFailureOrSuccessOption: optionOf(
              const Left(ApiFailure.priceOverrideNotFound()),
            ),
            isFetching: false,
            counterOfferDetails: RequestCounterOfferDetails.empty().copyWith(
              counterOfferPrice: CounterOfferValue('70'),
              comment: StringValue('fake-comment'),
            ),
          ),
        ],
      );
    },
  );
}

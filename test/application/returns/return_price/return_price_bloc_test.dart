import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/returns/return_price/return_price_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
import 'package:ezrxmobile/domain/returns/entities/return_price.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_price_local.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/return_price_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockReturnPriceRepository extends Mock implements ReturnPriceRepository {}

void main() {
  late MockReturnPriceRepository mockReturnPriceRepository;

  late final ReturnPrice returnPrice;
  late final Map<String, ReturnPrice> returnPriceMap;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    mockReturnPriceRepository = MockReturnPriceRepository();
    returnPrice = await ReturnPriceLocalDataSource().fetchReturnPrice();
    returnPriceMap = {'unique-key': returnPrice};
  });

  group(
    'Return Price Bloc',
    () {
      blocTest(
        'Get Return Price failure',
        build: () =>
            ReturnPriceBloc(returnPriceRepository: mockReturnPriceRepository),
        setUp: () {
          when(
            () => mockReturnPriceRepository.fetchReturnPrice(
              returnItemsList: [ReturnItem.empty()],
              salesOrg: SalesOrganisation.empty(),
            ),
          ).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('mock-error'),
            ),
          );
        },
        act: (ReturnPriceBloc bloc) => bloc.add(
          ReturnPriceEvent.fetchReturnPrice(
            returnItemList: [ReturnItem.empty()],
            salesOrg: SalesOrganisation.empty(),
          ),
        ),
        expect: () => [
          ReturnPriceState.initial().copyWith(
            failureOrSuccessOption: none(),
            isFetching: true,
            returnPrice: {},
          ),
          ReturnPriceState.initial().copyWith(
            failureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('mock-error'))),
          )
        ],
      );

      blocTest(
        'Fetch Return Price success',
        build: () =>
            ReturnPriceBloc(returnPriceRepository: mockReturnPriceRepository),
        setUp: () {
          when(
            () => mockReturnPriceRepository.fetchReturnPrice(
              returnItemsList: [ReturnItem.empty()],
              salesOrg: SalesOrganisation.empty(),
            ),
          ).thenAnswer(
            (invocation) async => Right(returnPriceMap),
          );
        },
        act: (ReturnPriceBloc bloc) => bloc.add(
          ReturnPriceEvent.fetchReturnPrice(
            returnItemList: [ReturnItem.empty()],
            salesOrg: SalesOrganisation.empty(),
          ),
        ),
        expect: () => [
          ReturnPriceState.initial().copyWith(
            failureOrSuccessOption: none(),
            isFetching: true,
            returnPrice: {},
          ),
          ReturnPriceState.initial().copyWith(
            returnPrice: returnPriceMap,
            failureOrSuccessOption: none(),
          ),
        ],
      );
    },
  );
}

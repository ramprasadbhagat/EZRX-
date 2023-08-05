import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/payments/soa/soa_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/soa.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:ezrxmobile/infrastructure/payments/repository/soa_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class SoaRepositoryMock extends Mock implements SoaRepository {}

void main() {
  late SoaRepository soaRepositoryMock;

  final mockCustomerCodeInfo =
      CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: 'mockCustomerCode');
  final mockSoaList = <Soa>[
    Soa(
      soaData: SoaData('mockData'),
    ),
  ];

  setUpAll(() async {
    soaRepositoryMock = SoaRepositoryMock();
  });

  group('Soa Bloc', () {
    blocTest(
      'Initialize',
      build: () => SoaBloc(
        repository: soaRepositoryMock,
      ),
      act: (SoaBloc bloc) => bloc.add(
        const SoaEvent.initialized(),
      ),
      expect: () => [
        SoaState.initial(),
      ],
    );

    blocTest(
      'Fetch Success',
      build: () => SoaBloc(
        repository: soaRepositoryMock,
      ),
      setUp: () {
        when(
          () => soaRepositoryMock.fetchSoa(
            customerCodeInfo: mockCustomerCodeInfo,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            mockSoaList,
          ),
        );
      },
      act: (SoaBloc bloc) => bloc.add(
        SoaEvent.fetch(customerCodeInfo: mockCustomerCodeInfo),
      ),
      expect: () => [
        SoaState.initial().copyWith(
          failureOrSuccessOption: none(),
          isFetching: false,
          soaList: mockSoaList,
        ),
      ],
      verify: (SoaBloc bloc) => [
        expect(bloc.state.soaList.length, 1),
      ],
    );

    blocTest(
      'Fetch Failure',
      build: () => SoaBloc(
        repository: soaRepositoryMock,
      ),
      setUp: () {
        when(
          () => soaRepositoryMock.fetchSoa(
            customerCodeInfo: mockCustomerCodeInfo,
          ),
        ).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('api-failure'),
          ),
        );
      },
      act: (SoaBloc bloc) => bloc.add(
        SoaEvent.fetch(customerCodeInfo: mockCustomerCodeInfo),
      ),
      expect: () => [
        SoaState.initial().copyWith(
          failureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('api-failure'),
            ),
          ),
          isFetching: false,
        ),
      ],
      verify: (SoaBloc bloc) => [
        expect(bloc.state.soaList.length, 0),
      ],
    );
  });
}

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/returns/usage_code/usage_code_bloc.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/usage.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/usage_code_local.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/usage_code_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUsageCodeRepository extends Mock implements UsageRepository {}

void main() {
  late MockUsageCodeRepository mockUsageCodeRepository;
  final mockSalesOrg = SalesOrg('fake-1234');
  final salesOrg2601 = SalesOrg('2601');
  late final List<Usage> usages;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    mockUsageCodeRepository = MockUsageCodeRepository();
    usages = await UsageCodeLocalDataSource().getUsages();
  });

  group(
    'Usage Code Bloc',
    () {
      blocTest(
        'Initialize',
        build: () => UsageCodeBloc(usageRepository: mockUsageCodeRepository),
        act: (UsageCodeBloc bloc) =>
            bloc.add(const UsageCodeEvent.initialized()),
        expect: () => [UsageCodeState.initial()],
      );

      blocTest(
        'Get usage code failure',
        build: () => UsageCodeBloc(usageRepository: mockUsageCodeRepository),
        setUp: () {
          when(() => mockUsageCodeRepository.getUsages(salesOrg: mockSalesOrg))
              .thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('mock-error'),
            ),
          );
        },
        act: (UsageCodeBloc bloc) =>
            bloc.add(UsageCodeEvent.fetch(salesOrg: mockSalesOrg)),
        expect: () => [
          UsageCodeState.initial().copyWith(
            failureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('mock-error'))),
          )
        ],
      );

      blocTest(
        'Get usage code success',
        build: () => UsageCodeBloc(usageRepository: mockUsageCodeRepository),
        setUp: () {
          when(() => mockUsageCodeRepository.getUsages(salesOrg: salesOrg2601))
              .thenAnswer(
            (invocation) async => Right(usages),
          );
        },
        act: (UsageCodeBloc bloc) =>
            bloc.add(UsageCodeEvent.fetch(salesOrg: salesOrg2601)),
        expect: () => [
          UsageCodeState.initial().copyWith(
            usages: usages,
            failureOrSuccessOption: none(),
          ),
        ],
      );
    },
  );
}

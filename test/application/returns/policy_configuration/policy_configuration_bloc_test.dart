import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/returns/policy_configuration/policy_configuration_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/policy_configuration.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/policy_configuration_local.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/policy_configuration_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class PolicyConfigurationRepositoryMock extends Mock
    implements PolicyConfigurationRepository {}

void main() {
  final repository = PolicyConfigurationRepositoryMock();
  final mockSalesOrg = SalesOrganisation.empty();
  late final List<PolicyConfiguration> policyConfigurationListMock;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    policyConfigurationListMock =
        await PolicyConfigurationLocalDataSource().getPolicyConfiguration();
  });

  group(
    'Policy Configuration Bloc',
    () {
      blocTest('Initialize',
          build: () => PolicyConfigurationBloc(
              policyConfigurationRepository: repository),
          act: (PolicyConfigurationBloc bloc) =>
              bloc.add(const PolicyConfigurationEvent.initialized()),
          expect: () => [PolicyConfigurationState.initial()]);

      blocTest(
        'Get policy configuration list failure',
        build: () =>
            PolicyConfigurationBloc(policyConfigurationRepository: repository),
        setUp: () {
          when(() => repository.getPolicyConfiguration(
              salesOrganisation: mockSalesOrg)).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
        },
        act: (PolicyConfigurationBloc bloc) => bloc.add(
            PolicyConfigurationEvent.fetch(salesOrganisation: mockSalesOrg)),
        expect: () => [
          PolicyConfigurationState.initial().copyWith(
            isLoading: true,
            failureOrSuccessOption: none(),
          ),
          PolicyConfigurationState.initial().copyWith(
            isLoading: false,
            policyConfigurationList: [],
            failureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('fake-error'))),
          ),
        ],
      );

      blocTest(
        'Get policy configuration list success',
        build: () =>
            PolicyConfigurationBloc(policyConfigurationRepository: repository),
        setUp: () {
          when(() => repository.getPolicyConfiguration(
              salesOrganisation: mockSalesOrg)).thenAnswer(
            (invocation) async => Right(policyConfigurationListMock),
          );
        },
        act: (PolicyConfigurationBloc bloc) => bloc.add(
            PolicyConfigurationEvent.fetch(salesOrganisation: mockSalesOrg)),
        expect: () => [
          PolicyConfigurationState.initial().copyWith(
            isLoading: true,
            failureOrSuccessOption: none(),
          ),
          PolicyConfigurationState.initial().copyWith(
            isLoading: false,
            policyConfigurationList: policyConfigurationListMock,
            failureOrSuccessOption: none(),
          ),
        ],
      );
    },
  );
}

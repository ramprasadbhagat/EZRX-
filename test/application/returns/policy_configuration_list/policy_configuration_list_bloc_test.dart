import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/returns/policy_configuration_list/policy_configuration_list_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/policy_configuration.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/policy_configuration_list_local.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/policy_configuration_list_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class PolicyConfigurationRepositoryMock extends Mock
    implements PolicyConfigurationRepository {}

void main() {
  final repository = PolicyConfigurationRepositoryMock();
  final mockSalesOrg = SalesOrganisation.empty();
  late final List<PolicyConfigurationList> policyConfigurationListMock;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    policyConfigurationListMock =
        await PolicyConfigurationLocalDataSource().getPolicyConfigurationList();
  });

  group(
    'Policy Configuration Bloc',
    () {
      blocTest('Initialize',
          build: () => PolicyConfigurationListBloc(
              policyConfigurationRepository: repository),
          act: (PolicyConfigurationListBloc bloc) =>
              bloc.add(const PolicyConfigurationListEvent.initialized()),
          expect: () => [PolicyConfigurationListState.initial()]);

      blocTest(
        'Get policy configuration list failure',
        build: () => PolicyConfigurationListBloc(
            policyConfigurationRepository: repository),
        setUp: () {
          when(() => repository.getPolicyConfigurationList(
              salesOrganisation: mockSalesOrg)).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
        },
        act: (PolicyConfigurationListBloc bloc) => bloc.add(
            PolicyConfigurationListEvent.fetch(
                salesOrganisation: mockSalesOrg)),
        expect: () => [
          PolicyConfigurationListState.initial().copyWith(
            isLoading: true,
            failureOrSuccessOption: none(),
          ),
          PolicyConfigurationListState.initial().copyWith(
            isLoading: false,
            policyConfigurationList: [],
            failureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('fake-error'))),
          ),
        ],
      );

      blocTest(
        'Get policy configuration list success',
        build: () => PolicyConfigurationListBloc(
            policyConfigurationRepository: repository),
        setUp: () {
          when(() => repository.getPolicyConfigurationList(
              salesOrganisation: mockSalesOrg)).thenAnswer(
            (invocation) async => Right(policyConfigurationListMock),
          );
        },
        act: (PolicyConfigurationListBloc bloc) => bloc.add(
            PolicyConfigurationListEvent.fetch(
                salesOrganisation: mockSalesOrg)),
        expect: () => [
          PolicyConfigurationListState.initial().copyWith(
            isLoading: true,
            failureOrSuccessOption: none(),
          ),
          PolicyConfigurationListState.initial().copyWith(
            isLoading: false,
            policyConfigurationList: policyConfigurationListMock,
            failureOrSuccessOption: none(),
          ),
        ],
      );
    },
  );
}

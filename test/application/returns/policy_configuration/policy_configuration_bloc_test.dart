import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/returns/policy_configuration/policy_configuration_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/policy_configuration.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/policy_configuration_local.dart';
import 'package:ezrxmobile/infrastructure/returns/repository/policy_configuration_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class PolicyConfigurationRepositoryMock extends Mock
    implements PolicyConfigurationRepository {}

const _pageSize = 20;


void main() {
  final repository = PolicyConfigurationRepositoryMock();
  final mockSalesOrg = SalesOrganisation.empty();
  late final List<PolicyConfiguration> policyConfigurationListMock;
  final fakePolicyConfigurationOne = PolicyConfiguration.empty().copyWith(
    salesOrg: SalesOrg('2601'),
    principalCode: PrincipalCode('1234'),
    monthsBeforeExpiry: MonthsBeforeExpiry.change('4'),
    monthsAfterExpiry: MonthsAfterExpiry.change('5'),
    uuid: 'fake_uuid1',
    returnsAllowed: ReturnsAllowed(true),
    principalName: PrincipalName('fake_name1'),
    status: '',
  );
  final fakePolicyConfigurationTwo = PolicyConfiguration.empty().copyWith(
    salesOrg: SalesOrg('2601'),
    principalCode: PrincipalCode('1235'),
    monthsBeforeExpiry: MonthsBeforeExpiry.change('6'),
    monthsAfterExpiry: MonthsAfterExpiry.change('5'),
    uuid: 'fake_uuid2',
    returnsAllowed: ReturnsAllowed(true),
    principalName: PrincipalName('fake_name2'),
    status: '',
  );

  final fakepolicyConfigurationList = <PolicyConfiguration>[
    fakePolicyConfigurationOne,
    fakePolicyConfigurationTwo,
  ];
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
              salesOrganisation: mockSalesOrg,
              offset: 0,
              pageSize: _pageSize,
              searchKey: SearchKey(''))).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
        },
        act: (PolicyConfigurationBloc bloc) => bloc.add(
            PolicyConfigurationEvent.fetch(salesOrganisation: mockSalesOrg,searchKey: '',)),
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
              salesOrganisation: mockSalesOrg,
              offset: 0,
                pageSize: _pageSize,
              searchKey: SearchKey(''),)).thenAnswer(
            (invocation) async => Right(policyConfigurationListMock),
          );
        },
        act: (PolicyConfigurationBloc bloc) => bloc.add(
            PolicyConfigurationEvent.fetch(salesOrganisation: mockSalesOrg, searchKey: '',)),
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
      blocTest(
        'Get returnsAllowedSwitch  success',
        build: () =>
            PolicyConfigurationBloc(policyConfigurationRepository: repository),
        setUp: () {
          when(() => repository.getPolicyConfiguration(
              salesOrganisation: mockSalesOrg,
              offset: 0,
              pageSize: 10,
              searchKey: SearchKey(''),)).thenAnswer(
            (invocation) async => Right(policyConfigurationListMock),
          );
        },
        act: (PolicyConfigurationBloc bloc) =>
            bloc.add(const PolicyConfigurationEvent.returnsAllowedSwitch()),
        expect: () => [
          PolicyConfigurationState.initial()
              .copyWith(returnsAllowed: ReturnsAllowed(false)),
        ],
      );
      blocTest(
        'Get add PolicyConfiguration success',
        build: () =>
            PolicyConfigurationBloc(policyConfigurationRepository: repository),
        setUp: () {
          when(() => repository.getAddPolicy(
              policyConfigurationItems: fakePolicyConfigurationOne,
              policyConfigurationList: fakepolicyConfigurationList)).thenAnswer(
            (invocation) async => Right([fakePolicyConfigurationTwo]),
          );
        },
        act: (PolicyConfigurationBloc bloc) => bloc.add(
            PolicyConfigurationEvent.add(
                policyConfigurationItems: fakePolicyConfigurationOne)),
        seed: () => PolicyConfigurationState.initial()
            .copyWith(policyConfigurationList: fakepolicyConfigurationList),
        expect: () => [
          PolicyConfigurationState.initial().copyWith(
              isLoading: true,
              policyConfigurationList: fakepolicyConfigurationList),
          PolicyConfigurationState.initial().copyWith(
              isLoading: false,
              policyConfigurationList: [fakePolicyConfigurationTwo]),
        ],
      );
      blocTest(
        'Get add PolicyConfiguration failure',
        build: () =>
            PolicyConfigurationBloc(policyConfigurationRepository: repository),
        setUp: () {
          when(() => repository.getAddPolicy(
              policyConfigurationItems: fakePolicyConfigurationOne,
              policyConfigurationList: fakepolicyConfigurationList)).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
        },
        act: (PolicyConfigurationBloc bloc) => bloc.add(
            PolicyConfigurationEvent.add(
                policyConfigurationItems: fakePolicyConfigurationOne)),
        seed: () => PolicyConfigurationState.initial()
            .copyWith(policyConfigurationList: fakepolicyConfigurationList),
        expect: () => [
          PolicyConfigurationState.initial().copyWith(
              isLoading: true,
              policyConfigurationList: fakepolicyConfigurationList),
          PolicyConfigurationState.initial().copyWith(
            isLoading: false,
            policyConfigurationList: fakepolicyConfigurationList,
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('fake-error'),
              ),
            ),
          ),
        ],
      );

      blocTest(
        'Get delete PolicyConfiguration success',
        build: () =>
            PolicyConfigurationBloc(policyConfigurationRepository: repository),
        act: (PolicyConfigurationBloc bloc) => bloc.add(
            PolicyConfigurationEvent.delete(
                policyConfigurationItem: fakePolicyConfigurationOne)),
        seed: () => PolicyConfigurationState.initial()
            .copyWith(policyConfigurationList: fakepolicyConfigurationList),
        setUp: () {
          when(() => repository.getDeletePolicy(
              policyConfigurationList: fakepolicyConfigurationList,
              policyConfigurationItem: fakePolicyConfigurationOne)).thenAnswer(
            (invocation) async => Right([fakePolicyConfigurationTwo]),
          );
        },
        expect: () => [
          PolicyConfigurationState.initial()
              .copyWith(policyConfigurationList: [fakePolicyConfigurationTwo]),
        ],
      );
      blocTest(
        'Get delete PolicyConfiguration failure',
        build: () =>
            PolicyConfigurationBloc(policyConfigurationRepository: repository),
        act: (PolicyConfigurationBloc bloc) => bloc.add(
            PolicyConfigurationEvent.delete(
                policyConfigurationItem: fakePolicyConfigurationOne)),
        seed: () => PolicyConfigurationState.initial()
            .copyWith(policyConfigurationList: fakepolicyConfigurationList),
        setUp: () {
          when(() => repository.getDeletePolicy(
              policyConfigurationList: fakepolicyConfigurationList,
              policyConfigurationItem: fakePolicyConfigurationOne)).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
        },
        expect: () => [
          PolicyConfigurationState.initial().copyWith(
            policyConfigurationList: fakepolicyConfigurationList,
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('fake-error'),
              ),
            ),
          ),
        ],
      );
    },
  );
}

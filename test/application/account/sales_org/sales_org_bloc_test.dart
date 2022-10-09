import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/account/repository/sales_org_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class SalesOrgRepositoryMock extends Mock implements SalesOrgRepository {}

void main() {
  late SalesOrgRepository salesOrgRepositoryMock;
  group('Sales_Org BLOC Testing', () {
    setUp(() {
      salesOrgRepositoryMock = SalesOrgRepositoryMock();
    });
    blocTest<SalesOrgBloc, SalesOrgState>(
      'For "initialized" Event',
      build: () => SalesOrgBloc(salesOrgRepository: salesOrgRepositoryMock),
      act: (bloc) => bloc.add(const SalesOrgEvent.initialized()),
      expect: () => [SalesOrgState.initial()],
    );
    blocTest<SalesOrgBloc, SalesOrgState>(
      'For "selected" Event with Error',
      build: () => SalesOrgBloc(salesOrgRepository: salesOrgRepositoryMock),
      setUp: () {
        when(() =>
            salesOrgRepositoryMock.getSalesOrganisationConfigs(
                SalesOrganisation.empty())).thenAnswer(
            (invocation) async => const Left(ApiFailure.other('Fake Error')));
      },
      act: (bloc) => bloc.add(
          SalesOrgEvent.selected(salesOrganisation: SalesOrganisation.empty())),
      expect: () => [
        SalesOrgState.initial().copyWith(
          configs: SalesOrganisationConfigs.empty(),
          salesOrgFailureOrSuccessOption: none(),
        ),
        SalesOrgState.initial().copyWith(
          configs: SalesOrganisationConfigs.empty(),
          salesOrgFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('Fake Error'))),
        )
      ],
    );
    blocTest<SalesOrgBloc, SalesOrgState>(
      'For "selected" Event with Data',
      build: () => SalesOrgBloc(salesOrgRepository: salesOrgRepositoryMock),
      setUp: () {
        when(() => salesOrgRepositoryMock
            .getSalesOrganisationConfigs(SalesOrganisation.empty())).thenAnswer(
          (invocation) async => Right(
            SalesOrganisationConfigs.empty().copyWith(
              currency: Currency('myr'),
            ),
          ),
        );
      },
      act: (bloc) => bloc.add(
          SalesOrgEvent.selected(salesOrganisation: SalesOrganisation.empty())),
      expect: () => [
        SalesOrgState.initial().copyWith(
          salesOrganisation: SalesOrganisation.empty(),
        ),
        SalesOrgState.initial().copyWith(
          configs: SalesOrganisationConfigs.empty().copyWith(
            currency: Currency('myr'),
          ),
        )
      ],
    );
    // blocTest<SalesOrgBloc, SalesOrgState>(
    //   'For "Stream Listener"',
    //   build: () => SalesOrgBloc(
    //       userBloc: userBlocMock, salesOrgRepository: salesOrgRepositoryMock),
    //   setUp: () {
    //     when(() => userBlocMock.stream).thenAnswer((invocation) {
    //       return Stream.value(UserState.initial().copyWith(
    //           user: User.empty().copyWith(
    //               userSalesOrganisations: [SalesOrganisation.empty()])));
    //     });
    //     when(() => salesOrgRepositoryMock
    //             .getSalesOrganisationConfigs(SalesOrganisation.empty()))
    //         .thenAnswer(
    //             (invocation) async => Right(SalesOrganisationConfigs.empty()));
    //   },
    //   act: (bloc) => bloc.add(
    //       SalesOrgEvent.selected(salesOrganisation: SalesOrganisation.empty())),
    //   expect: () => [
    //     SalesOrgState.initial().copyWith(
    //       salesOrganisation: SalesOrganisation.empty(),
    //       configs: SalesOrganisationConfigs.empty(),
    //       salesOrgFailureOrSuccessOption: none(),
    //     )
    //   ],
    // );
  });
}

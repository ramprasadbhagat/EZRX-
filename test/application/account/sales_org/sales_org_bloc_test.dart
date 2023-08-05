import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/account_selector.dart';
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

  final fakeSalesOrgList = [
    SalesOrganisation(salesOrg: SalesOrg('fake-salesOrg'), customerInfos: [])
  ];
  group('Sales_Org BLOC Testing', () {
    setUp(
      () {
        salesOrgRepositoryMock = SalesOrgRepositoryMock();
        when(() => salesOrgRepositoryMock.initSalesOrgStorage()).thenAnswer(
          (invocation) async => const Right(unit),
        );
      },
    );
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
        when(
          () => salesOrgRepositoryMock.storeSalesOrg(
            salesOrg: 'mockSalesOrg - Unknown',
          ),
        ).thenAnswer(
          (invocation) async => const Right(unit),
        );
        when(
          () => salesOrgRepositoryMock.getSalesOrganisationConfigs(
            SalesOrganisation.empty().copyWith(
              salesOrg: SalesOrg('mockSalesOrg'),
            ),
          ),
        ).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('Fake Error')),
        );
      },
      act: (bloc) => bloc.add(
        SalesOrgEvent.selected(
          salesOrganisation: SalesOrganisation.empty().copyWith(
            salesOrg: SalesOrg('mockSalesOrg'),
          ),
        ),
      ),
      expect: () => [
        SalesOrgState.initial().copyWith(
          salesOrganisation: SalesOrganisation.empty().copyWith(
            salesOrg: SalesOrg('mockSalesOrg'),
          ),
        ),
        SalesOrgState.initial().copyWith(
          salesOrganisation: SalesOrganisation.empty().copyWith(
            salesOrg: SalesOrg('mockSalesOrg'),
          ),
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
        when(
          () => salesOrgRepositoryMock
              .getSalesOrganisationConfigs(SalesOrganisation.empty()),
        ).thenAnswer(
          (invocation) async => Right(
            SalesOrganisationConfigs.empty().copyWith(
              currency: Currency('myr'),
            ),
          ),
        );
        when(
          () => salesOrgRepositoryMock.storeSalesOrg(
            salesOrg: ' - Unknown',
          ),
        ).thenAnswer(
          (invocation) async => const Right(unit),
        );
      },
      act: (bloc) => bloc.add(
        SalesOrgEvent.selected(salesOrganisation: SalesOrganisation.empty()),
      ),
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

    blocTest<SalesOrgBloc, SalesOrgState>(
      'should emit saved sales Org when [SalesOrgEvent.loadSavedOrganisation()] event is added',
      build: () => SalesOrgBloc(salesOrgRepository: salesOrgRepositoryMock),
      setUp: () {
        when(() => salesOrgRepositoryMock.getSalesOrg()).thenAnswer(
          (invocation) async => Right(
            AccountSelector.empty(),
          ),
        );

        when(
          () => salesOrgRepositoryMock
              .getSalesOrganisationConfigs(SalesOrganisation.empty()),
        ).thenAnswer(
          (invocation) async => Right(
            SalesOrganisationConfigs.empty().copyWith(
              currency: Currency('myr'),
            ),
          ),
        );

        when(
          () => salesOrgRepositoryMock.storeSalesOrg(
            salesOrg: ' - Unknown',
          ),
        ).thenAnswer(
          (invocation) async => const Right(unit),
        );
      },
      act: (bloc) => bloc.add(
        SalesOrgEvent.loadSavedOrganisation(
          salesOrganisations: [
            SalesOrganisation.empty(),
            SalesOrganisation.empty(),
          ],
        ),
      ),
      expect: () => [
        SalesOrgState.initial().copyWith(
          salesOrganisation: SalesOrganisation.empty(),
        ),
        SalesOrgState.initial().copyWith(
          configs: SalesOrganisationConfigs.empty().copyWith(
            currency: Currency('myr'),
          ),
        ),
      ],
    );

    blocTest<SalesOrgBloc, SalesOrgState>(
      'should emit event sales Org when [SalesOrgEvent.loadSavedOrganisation()] event is added',
      build: () => SalesOrgBloc(salesOrgRepository: salesOrgRepositoryMock),
      setUp: () {
        when(
          () => salesOrgRepositoryMock.storeSalesOrg(
            salesOrg: ' - Unknown',
          ),
        ).thenAnswer(
          (invocation) async => const Right(unit),
        );

        when(() => salesOrgRepositoryMock.getSalesOrg()).thenAnswer(
          (invocation) async => const Left(
            ApiFailure.other('mock'),
          ),
        );

        when(
          () => salesOrgRepositoryMock.getSalesOrganisationConfigs(
            SalesOrganisation.empty(),
          ),
        ).thenAnswer(
          (invocation) async => Right(
            SalesOrganisationConfigs.empty().copyWith(
              currency: Currency('myr'),
            ),
          ),
        );
      },
      act: (bloc) => bloc.add(
        SalesOrgEvent.loadSavedOrganisation(
          salesOrganisations: [
            SalesOrganisation.empty(),
            SalesOrganisation.empty(),
          ],
        ),
      ),
      expect: () => [
        SalesOrgState.initial().copyWith(
          salesOrganisation: SalesOrganisation.empty(),
        ),
        SalesOrgState.initial().copyWith(
          salesOrganisation: SalesOrganisation.empty(),
          configs: SalesOrganisationConfigs.empty().copyWith(
            currency: Currency('myr'),
          ),
        ),
      ],
    );

    blocTest<SalesOrgBloc, SalesOrgState>(
      '=> Test if hideCustomer',
      build: () => SalesOrgBloc(
        salesOrgRepository: salesOrgRepositoryMock,
      ),
      act: (bloc) {
        final isHideCustomer = SalesOrgState.initial().hideCustomer;
        expect(isHideCustomer, false);
      },
    );

    blocTest<SalesOrgBloc, SalesOrgState>(
      '=> Test currency getter',
      build: () => SalesOrgBloc(
        salesOrgRepository: salesOrgRepositoryMock,
      ),
      act: (bloc) {
        final currency = SalesOrgState.initial()
            .copyWith(
              configs: SalesOrganisationConfigs.empty().copyWith(
                currency: Currency('PHP'),
              ),
            )
            .currency;
        expect(currency.getOrCrash(), 'PHP');
      },
    );

    blocTest<SalesOrgBloc, SalesOrgState>(
      '=> Test disableBundles getter',
      build: () => SalesOrgBloc(
        salesOrgRepository: salesOrgRepositoryMock,
      ),
      act: (bloc) {
        final isDisableBundles = SalesOrgState.initial()
            .copyWith(
              configs: SalesOrganisationConfigs.empty().copyWith(
                disableBundles: true,
              ),
            )
            .disableBundles;
        expect(isDisableBundles, true);
      },
    );
    blocTest<SalesOrgBloc, SalesOrgState>(
      '=> Test fetch available sales org',
      build: () => SalesOrgBloc(
        salesOrgRepository: salesOrgRepositoryMock,
      ),
      act: (bloc) => bloc.add(
        const SalesOrgEvent.fetchAvailableSalesOrg(avialableSalesOrgList: []),
      ),
      expect: () => [
        SalesOrgState.initial().copyWith(
          availableSalesOrg: [],
          salesOrgFailureOrSuccessOption: none(),
        ),
      ],
    );
    blocTest<SalesOrgBloc, SalesOrgState>(
      '=> Test search sales org',
      build: () => SalesOrgBloc(
        salesOrgRepository: salesOrgRepositoryMock,
      ),
      act: (bloc) => bloc.add(
        SalesOrgEvent.searchSalesOrg(
          keyWord: 'fake-salesOrg',
          salesOrgList: fakeSalesOrgList,
        ),
      ),
      expect: () => [
        SalesOrgState.initial().copyWith(
          availableSalesOrg: fakeSalesOrgList,
          salesOrgFailureOrSuccessOption: none(),
        ),
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

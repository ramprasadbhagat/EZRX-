import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/account/entities/account_selector.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/infrastructure/account/repository/sales_org_repository.dart';

import '../../../common_mock_data/sales_org_config_mock/fake_id_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_ph_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';

class SalesOrgRepositoryMock extends Mock implements SalesOrgRepository {}

void main() {
  late SalesOrgRepository salesOrgRepositoryMock;
  const fakeError = ApiFailure.other('Fake Error');
  final fakeSalesOrgList = [fakeSalesOrganisation];
  group('Sales_Org Bloc Testing', () {
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
            salesOrg: '${fakeSalesOrg.getOrCrash()} - Unknown',
          ),
        ).thenAnswer(
          (invocation) async => const Right(unit),
        );
        when(
          () => salesOrgRepositoryMock.getSalesOrganisationConfigs(
            fakeSalesOrganisation,
          ),
        ).thenAnswer(
          (invocation) async => const Left(fakeError),
        );
      },
      act: (bloc) => bloc.add(
        SalesOrgEvent.selected(
          salesOrganisation: fakeSalesOrganisation,
        ),
      ),
      expect: () => [
        SalesOrgState.initial().copyWith(
          isLoading: true,
        ),
        SalesOrgState.initial().copyWith(
          salesOrganisation: fakeSalesOrganisation,
          salesOrgFailureOrSuccessOption: optionOf(const Left(fakeError)),
        ),
      ],
    );
    blocTest<SalesOrgBloc, SalesOrgState>(
      'For "selected" Event with Data',
      build: () => SalesOrgBloc(salesOrgRepository: salesOrgRepositoryMock),
      setUp: () {
        when(
          () => salesOrgRepositoryMock.getSalesOrganisationConfigs(
            fakeMYSalesOrganisation,
          ),
        ).thenAnswer(
          (invocation) async => Right(fakeMYSalesOrgConfigs),
        );
        when(
          () => salesOrgRepositoryMock.storeSalesOrg(
            salesOrg: fakeMYSalesOrg.fullName,
          ),
        ).thenAnswer(
          (invocation) async => const Right(unit),
        );
      },
      act: (bloc) => bloc.add(
        SalesOrgEvent.selected(salesOrganisation: fakeMYSalesOrganisation),
      ),
      expect: () => [
        SalesOrgState.initial().copyWith(
          isLoading: true,
        ),
        SalesOrgState.initial().copyWith(
          salesOrganisation: fakeMYSalesOrganisation,
          configs: fakeMYSalesOrgConfigs,
        ),
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
              .getSalesOrganisationConfigs(fakeMYSalesOrganisation),
        ).thenAnswer(
          (invocation) async => Right(fakeMYSalesOrgConfigs),
        );
      },
      seed: () => SalesOrgState.initial().copyWith(
        salesOrganisation: fakeMYSalesOrganisation,
        configs: fakeMYSalesOrgConfigs,
      ),
      act: (bloc) => bloc.add(
        SalesOrgEvent.loadSavedOrganisation(
          salesOrganisations: [
            fakeMYSalesOrganisation,
            fakeSGSalesOrganisation,
          ],
        ),
      ),
      expect: () => [
        SalesOrgState.initial().copyWith(
          isLoading: true,
          salesOrganisation: fakeMYSalesOrganisation,
          configs: fakeMYSalesOrgConfigs,
        ),
        SalesOrgState.initial().copyWith(
          salesOrganisation: fakeMYSalesOrganisation,
          configs: fakeMYSalesOrgConfigs,
        ),
      ],
    );

    blocTest<SalesOrgBloc, SalesOrgState>(
      'should emit event sales Org when [SalesOrgEvent.loadSavedOrganisation()] event is added',
      build: () => SalesOrgBloc(salesOrgRepository: salesOrgRepositoryMock),
      setUp: () {
        when(
          () => salesOrgRepositoryMock.storeSalesOrg(
            salesOrg: fakeMYSalesOrg.fullName,
          ),
        ).thenAnswer(
          (invocation) async => const Right(unit),
        );

        when(() => salesOrgRepositoryMock.getSalesOrg()).thenAnswer(
          (invocation) async => const Left(fakeError),
        );

        when(
          () => salesOrgRepositoryMock.getSalesOrganisationConfigs(
            fakeMYSalesOrganisation,
          ),
        ).thenAnswer(
          (invocation) async => Right(fakeMYSalesOrgConfigs),
        );
      },
      act: (bloc) => bloc.add(
        SalesOrgEvent.loadSavedOrganisation(
          salesOrganisations: [
            fakeMYSalesOrganisation,
            fakeSGSalesOrganisation,
          ],
        ),
      ),
      expect: () => [
        SalesOrgState.initial().copyWith(
          isLoading: true,
        ),
        SalesOrgState.initial().copyWith(
          salesOrganisation: fakeMYSalesOrganisation,
          configs: fakeMYSalesOrgConfigs,
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
              configs: fakePHSalesOrgConfigs,
            )
            .currency;
        expect(currency.getOrCrash(), 'php');
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
              configs: fakeIDSalesOrgConfigs,
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
        SalesOrgState.initial(),
      ],
    );
    blocTest<SalesOrgBloc, SalesOrgState>(
      '=> Test search sales org',
      build: () => SalesOrgBloc(
        salesOrgRepository: salesOrgRepositoryMock,
      ),
      act: (bloc) => bloc.add(
        SalesOrgEvent.searchSalesOrg(
          searchKey: SearchKey.search(fakeSalesOrg.getOrCrash()),
          salesOrgList: fakeSalesOrgList,
        ),
      ),
      expect: () => [
        SalesOrgState.initial().copyWith(
          availableSalesOrg: fakeSalesOrgList,
          searchKey: SearchKey.search(fakeSalesOrg.getOrCrash()),
        ),
      ],
    );
    blocTest<SalesOrgBloc, SalesOrgState>(
      '=> Test sales org with Philippine market',
      build: () => SalesOrgBloc(salesOrgRepository: salesOrgRepositoryMock),
      setUp: () {
        when(
          () => salesOrgRepositoryMock.getSalesOrganisationConfigs(
            fakePHSalesOrganisation,
          ),
        ).thenAnswer(
          (invocation) async => Right(fakePHSalesOrgConfigs),
        );
        when(
          () => salesOrgRepositoryMock.storeSalesOrg(
            salesOrg: fakePHSalesOrg.fullName,
          ),
        ).thenAnswer(
          (invocation) async => const Right(unit),
        );
      },
      act: (bloc) => bloc.add(
        SalesOrgEvent.selected(salesOrganisation: fakePHSalesOrganisation),
      ),
      expect: () => [
        SalesOrgState.initial().copyWith(
          isLoading: true,
        ),
        SalesOrgState.initial().copyWith(
          salesOrganisation: fakePHSalesOrganisation,
          configs: fakePHSalesOrgConfigs,
        ),
      ],
    );

    blocTest<SalesOrgBloc, SalesOrgState>(
      'For "selected" Event with same SaleOrg',
      build: () => SalesOrgBloc(salesOrgRepository: salesOrgRepositoryMock),
      setUp: () {
        when(
          () => salesOrgRepositoryMock.getSalesOrganisationConfigs(
            fakeMYSalesOrganisation,
          ),
        ).thenAnswer(
          (invocation) async => Right(fakeMYSalesOrgConfigs),
        );
      },
      act: (bloc) => bloc.add(
        SalesOrgEvent.selected(salesOrganisation: fakeMYSalesOrganisation),
      ),
      seed: () => SalesOrgState.initial().copyWith(
        salesOrganisation: fakeMYSalesOrganisation,
        configs: fakeMYSalesOrgConfigs,
      ),
      expect: () => [
        SalesOrgState.initial().copyWith(
          isLoading: true,
          salesOrganisation: fakeMYSalesOrganisation,
          configs: fakeMYSalesOrgConfigs,
        ),
        SalesOrgState.initial().copyWith(
          salesOrganisation: fakeMYSalesOrganisation,
          configs: fakeMYSalesOrgConfigs,
        ),
      ],
    );

    blocTest<SalesOrgBloc, SalesOrgState>(
      'For "selected" Event with difference SaleOrg',
      build: () => SalesOrgBloc(salesOrgRepository: salesOrgRepositoryMock),
      setUp: () {
        when(
          () => salesOrgRepositoryMock.getSalesOrganisationConfigs(
            fakePhMDISalesOrganisation,
          ),
        ).thenAnswer(
          (invocation) async => Right(
            fakePHSalesOrgConfigs.copyWith(
              salesOrg: fakePhMDISalesOrg,
            ),
          ),
        );
        when(
          () => salesOrgRepositoryMock.storeSalesOrg(
            salesOrg: fakePhMDISalesOrg.fullName,
          ),
        ).thenAnswer(
          (invocation) async => const Right(unit),
        );
      },
      act: (bloc) => bloc.add(
        SalesOrgEvent.selected(
          salesOrganisation: fakePhMDISalesOrganisation,
        ),
      ),
      seed: () => SalesOrgState.initial().copyWith(
        salesOrganisation: fakePhMDISalesOrganisation,
        configs: fakePHSalesOrgConfigs.copyWith(
          salesOrg: fakePhMDISalesOrg,
        ),
      ),
      expect: () => [
        SalesOrgState.initial().copyWith(
          isLoading: true,
          salesOrganisation: fakePhMDISalesOrganisation,
          configs: fakePHSalesOrgConfigs.copyWith(
            salesOrg: fakePhMDISalesOrg,
          ),
        ),
        SalesOrgState.initial().copyWith(
          salesOrganisation: fakePhMDISalesOrganisation,
          configs: fakePHSalesOrgConfigs.copyWith(
            salesOrg: fakePhMDISalesOrg,
          ),
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

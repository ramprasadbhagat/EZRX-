import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/banner/banner_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/banner/entities/banner.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/account/repository/user_repository.dart';
import 'package:ezrxmobile/infrastructure/banner/repository/banner_repository.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

class MockBannerBloc extends MockBloc<BannerEvent, BannerState>
    implements BannerBloc {}

class MockBannerRepository extends Mock implements BannerRepository {}

class MockSalesOrgBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class UserRepoMock extends Mock implements UserRepository {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

void main() {
  late GetIt locator;
  late BannerRepository mockBannerRepository;
  late SalesOrgBloc mockSalesOrgBloc;

  final mockSalesOrg = SalesOrg('mock-salesOrg');
  final salesOrg2601 = SalesOrg('2601');
  final mockSalesOrganisation = SalesOrganisation(
      salesOrg: mockSalesOrg, customerInfos: <CustomerInfo>[]);
  final salesOrganisation2601 = SalesOrganisation(
      salesOrg: salesOrg2601, customerInfos: <CustomerInfo>[]);

  final UserRepository mockUserRepo = UserRepoMock();
  final AuthBloc mockAuthBloc = AuthBlocMock();
  final BannerBloc mockBannerBloc = MockBannerBloc();

  setUpAll(() {
    locator = GetIt.instance;
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
    locator.registerLazySingleton(
      () => CountlyService(),
    );
    locator.registerLazySingleton<HttpService>(
      () => HttpService(
        config: locator<Config>(),
        interceptors: [],
      ),
    );
    mockBannerRepository = MockBannerRepository();
    mockSalesOrgBloc = MockSalesOrgBloc();
  });

  group('Banner Bloc Test Group 1', () {
    blocTest<BannerBloc, BannerState>(
      'Init Banner Bloc',
      build: () => BannerBloc(
        bannerRepository: mockBannerRepository,
        salesOrgBloc: mockSalesOrgBloc,
      ),
      setUp: () {},
      expect: () => [],
    );

    blocTest<BannerBloc, BannerState>(
      'Init Banner Bloc and raise event Initialized',
      build: () => BannerBloc(
        bannerRepository: mockBannerRepository,
        salesOrgBloc: mockSalesOrgBloc,
      ),
      setUp: () {},
      act: (bloc) {
        bloc.add(const BannerEvent.initialized());
      },
      expect: () => [BannerState.initial()],
    );

    blocTest<BannerBloc, BannerState>(
      'Simulate error during fetch banner',
      build: () => BannerBloc(
        bannerRepository: mockBannerRepository,
        salesOrgBloc: mockSalesOrgBloc,
      ),
      setUp: () {
        when(() => mockBannerRepository.getBanner(
              isPreSalesOrg: false,
              salesOrganisation: mockSalesOrganisation,
            )).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('mock-error')),
        );
      },
      act: (bloc) {
        bloc.add(BannerEvent.fetch(
          isPreSalesOrg: false,
          salesOrganisation: mockSalesOrganisation,
        ));
      },
      expect: () => [
        BannerState.initial().copyWith(
          bannerFailureOrSuccessOption: optionOf( const Left(ApiFailure.other('mock-error')))
        )
      ],
    );    
    
    blocTest<BannerBloc, BannerState>(
      'Simulate successful fetch banner',
      build: () => BannerBloc(
        bannerRepository: mockBannerRepository,
        salesOrgBloc: mockSalesOrgBloc,
      ),
      setUp: () {
        when(() => mockBannerRepository.getBanner(
              isPreSalesOrg: false,
              salesOrganisation: salesOrganisation2601,
            )).thenAnswer(
          (invocation) async => Right([BannerItem.empty()]),
        );
      },
      act: (bloc) {
        bloc.add(BannerEvent.fetch(
          isPreSalesOrg: false,
          salesOrganisation: salesOrganisation2601,
        ));
      },
      expect: () => [
        BannerState.initial().copyWith(
          banner: [BannerItem.empty()],
          bannerFailureOrSuccessOption: none(),
        )
      ],
    );
  });
}

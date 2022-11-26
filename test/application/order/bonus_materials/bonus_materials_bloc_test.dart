import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/additional_bonus/bonus_material_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/infrastructure/account/repository/user_repository.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/repository/bonus_material_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

class MockUserBloc extends MockBloc<UserEvent, UserState> implements UserBloc {}

class MockBonusMaterial extends MockBloc<BonusMaterialEvent, BonusMaterialState>
    implements BonusMaterialBloc {}

class MockBonusMaterialRepository extends Mock
    implements BonusMaterialRepository {}

class UserRepoMock extends Mock implements UserRepository {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late GetIt locator;
  late BonusMaterialRepository mockBonusMaterialRepository;
  // final shipToCodeMockBloc = ShipToCodeMockBloc();

  final mockUserBloc = MockUserBloc();
  final mockUser = User.empty();

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
    mockBonusMaterialRepository = MockBonusMaterialRepository();

    when(() => mockUserBloc.state).thenReturn(UserState.initial());
  });

  group(
    'BonusMaterial Bloc Test Group',
    () {
      blocTest<BonusMaterialBloc, BonusMaterialState>(
        'Init Bonus Material Bloc',
        build: () {
          return BonusMaterialBloc(
              bonusMaterialRepository: mockBonusMaterialRepository);
        },
        act: (BonusMaterialBloc bloc) =>
            bloc.add(const BonusMaterialEvent.initialized()),
        expect: () => [BonusMaterialState.initial()],
      );

      blocTest<BonusMaterialBloc, BonusMaterialState>(
        'No BonusMaterial items found',
        build: () {
          return BonusMaterialBloc(
              bonusMaterialRepository: mockBonusMaterialRepository);
        },
        act: (BonusMaterialBloc bloc) => bloc.add(
          BonusMaterialEvent.fetch(
            user: mockUser,
            configs: SalesOrganisationConfigs.empty(),
            customerInfo: CustomerCodeInfo.empty(),
            pickAndPack: 'include',
            salesOrganisation: SalesOrganisation.empty(),
            searchKey: '',
            shipInfo: ShipToInfo.empty(),
          ),
        ),
        setUp: () => when(() => mockBonusMaterialRepository.getMaterialBonus(
              user: mockUser,
              configs: SalesOrganisationConfigs.empty(),
              customerInfo: CustomerCodeInfo.empty(),
              pickAndPack: 'include',
              salesOrganisation: SalesOrganisation.empty(),
              searchKey: '',
              shipInfo: ShipToInfo.empty(),
            )).thenAnswer(
          (invocation) async => const Right([]),
        ),
        expect: () => [
          BonusMaterialState.initial().copyWith(
            failureOrSuccessOption: none(),
            bonus: [],
            isFetching: true,
            isStarting: false,
          ),
          BonusMaterialState.initial().copyWith(
            failureOrSuccessOption: none(),
            bonus: [],
            isFetching: false,
            isStarting: false,
          )
        ],
      );
      blocTest<BonusMaterialBloc, BonusMaterialState>(
        'Bonus Material items found',
        build: () {
          return BonusMaterialBloc(
              bonusMaterialRepository: mockBonusMaterialRepository);
        },
        act: (BonusMaterialBloc bloc) => bloc.add(
          BonusMaterialEvent.fetch(
            user: mockUser,
            configs: SalesOrganisationConfigs.empty(),
            customerInfo: CustomerCodeInfo.empty(),
            pickAndPack: 'include',
            salesOrganisation: SalesOrganisation.empty(),
            searchKey: '',
            shipInfo: ShipToInfo.empty(),
          ),
        ),
        setUp: () => when(() => mockBonusMaterialRepository.getMaterialBonus(
              user: mockUser,
              configs: SalesOrganisationConfigs.empty(),
              customerInfo: CustomerCodeInfo.empty(),
              pickAndPack: 'include',
              salesOrganisation: SalesOrganisation.empty(),
              searchKey: '',
              shipInfo: ShipToInfo.empty(),
            )).thenAnswer(
          (invocation) async => Right([MaterialInfo.empty()]),
        ),
        expect: () => [
          BonusMaterialState.initial().copyWith(
            failureOrSuccessOption: none(),
            bonus: [],
            isStarting: false,
            isFetching: true,
          ),
          BonusMaterialState.initial().copyWith(
            failureOrSuccessOption: none(),
            bonus: [MaterialInfo.empty()],
            isStarting: false,
            isFetching: false,
          )
        ],
      );

      blocTest<BonusMaterialBloc, BonusMaterialState>(
        'Bonus Material items errors',
        build: () {
          return BonusMaterialBloc(
              bonusMaterialRepository: mockBonusMaterialRepository);
        },
        setUp: () {
          when(
            () => mockBonusMaterialRepository.getMaterialBonus(
              user: mockUser,
              configs: SalesOrganisationConfigs.empty(),
              customerInfo: CustomerCodeInfo.empty(),
              pickAndPack: 'include',
              salesOrganisation: SalesOrganisation.empty(),
              searchKey: '',
              shipInfo: ShipToInfo.empty(),
            ),
          ).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
        },
        act: (BonusMaterialBloc bloc) => bloc.add(
          BonusMaterialEvent.fetch(
            user: mockUser,
            configs: SalesOrganisationConfigs.empty(),
            customerInfo: CustomerCodeInfo.empty(),
            pickAndPack: 'include',
            salesOrganisation: SalesOrganisation.empty(),
            searchKey: '',
            shipInfo: ShipToInfo.empty(),
          ),
        ),
        expect: () => [
          BonusMaterialState.initial().copyWith(
            failureOrSuccessOption: none(),
            bonus: [],
            isStarting: false,
            isFetching: true,
          ),
          BonusMaterialState.initial().copyWith(
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('fake-error'),
              ),
            ),
            bonus: [],
            isStarting: false,
            isFetching: false,
          ),
        ],
      );
      blocTest<BonusMaterialBloc, BonusMaterialState>(
        'update the search key',
        build: () {
          return BonusMaterialBloc(
              bonusMaterialRepository: mockBonusMaterialRepository);
        },
        setUp: () {},
        act: (BonusMaterialBloc bloc) => bloc.add(
          const BonusMaterialEvent.updateSearchKey(
            searchKey: '1234',
          ),
        ),
        expect: () => [
          BonusMaterialState.initial().copyWith(searchKey: SearchKey('1234')),
        ],
      );
      blocTest<BonusMaterialBloc, BonusMaterialState>(
        'reset bloc',
        build: () {
          return BonusMaterialBloc(
              bonusMaterialRepository: mockBonusMaterialRepository);
        },
        setUp: () {},
        act: (BonusMaterialBloc bloc) => bloc.add(
          const BonusMaterialEvent.reset(),
        ),
        expect: () => [
          BonusMaterialState.initial().copyWith(
            searchKey: SearchKey(''),
            bonus: [],
            isFetching: false,
            isStarting: true,
          ),
        ],
      );
    },
  );
}

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/favourites/favourite_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/favourites/entities/favourite_item.dart';
import 'package:ezrxmobile/domain/material/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/repository/user_repository.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/favourites/repository/favourite_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

class MockUserBloc extends MockBloc<UserEvent, UserState> implements UserBloc {}

class MockFavouriteBloc extends MockBloc<FavouriteEvent, FavouriteState>
    implements FavouriteBloc {}

class MockFavouriteRepository extends Mock implements FavouriteRepository {}

class UserRepoMock extends Mock implements UserRepository {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

// class ShipToCodeMockBloc extends MockBloc<ShipToCodeEvent, ShipToCodeState>
//     implements ShipToCodeBloc {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late GetIt locator;
  late FavouriteRepository mockFavouriteRepository;
  // final shipToCodeMockBloc = ShipToCodeMockBloc();

  final mockUserBloc = MockUserBloc();
  final mockUser = User.empty();

  final favouriteItems = <Favourite>[
    Favourite(
      id: '',
      isFOC: false,
      isTenderContract: false,
      materialDescription: '',
      materialNumber: MaterialNumber(''),
    )
  ];

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
    mockFavouriteRepository = MockFavouriteRepository();

    when(() => mockUserBloc.state).thenReturn(UserState.initial());
  });

  group(
    'Favourite Bloc Test Group',
    () {
      blocTest<FavouriteBloc, FavouriteState>(
        'Init Favourite Bloc and raise fetch event',
        build: () {
          when(() => mockFavouriteRepository.getFavourites(
                user: mockUser,
              )).thenAnswer(
            (invocation) async => Right([Favourite.empty()]),
          );
          return FavouriteBloc(
            favouriteRepository: mockFavouriteRepository,
            // shipToCodeBloc: shipToCodeMockBloc,
          );
        },
        act: (FavouriteBloc bloc) =>
            bloc.add(FavouriteEvent.fetch(user: mockUser)),
        expect: () => [
          FavouriteState.initial().copyWith(isLoading: true),
          FavouriteState.initial().copyWith(
            failureOrSuccessOption: none(),
            isLoading: false,
            favouriteItems: [
              Favourite(
                id: '',
                isFOC: false,
                isTenderContract: false,
                materialDescription: '',
                materialNumber: MaterialNumber(''),
              )
            ],
          )
        ],
      );

      blocTest<FavouriteBloc, FavouriteState>(
        'No favourite items found',
        build: () {
          when(() => mockFavouriteRepository.getFavourites(
                user: mockUser,
              )).thenAnswer(
            (invocation) async => const Right([]),
          );
          return FavouriteBloc(
            favouriteRepository: mockFavouriteRepository,

            // shipToCodeBloc: shipToCodeMockBloc,
          );
        },
        act: (FavouriteBloc bloc) =>
            bloc.add(FavouriteEvent.fetch(user: mockUser)),
        expect: () => [
          FavouriteState.initial().copyWith(isLoading: true),
          FavouriteState.initial().copyWith(
            failureOrSuccessOption: none(),
            isLoading: false,
            favouriteItems: [],
          )
        ],
      );
      blocTest<FavouriteBloc, FavouriteState>(
        'delete favourite item ',
        build: () {
          return FavouriteBloc(
            favouriteRepository: mockFavouriteRepository,

            // shipToCodeBloc: shipToCodeMockBloc,
          );
        },
        act: (FavouriteBloc bloc) {
          bloc.add(FavouriteEvent.fetch(user: User.empty()));

          bloc.add(FavouriteEvent.delete(
              item: Favourite.empty(), user: User.empty()));
        },
        setUp: () {
          when(
            () => mockFavouriteRepository.getFavourites(
              user: mockUser,
            ),
          ).thenAnswer((invocation) async => Right(favouriteItems));
          when(
            () => mockFavouriteRepository.deleteFavourites(
                favouriteItems: favouriteItems, item: Favourite.empty()),
          ).thenAnswer((invocation) async => Right(favouriteItems));
        },
        expect: () => [
          FavouriteState.initial().copyWith(isLoading: true),
          FavouriteState.initial().copyWith(
            failureOrSuccessOption: none(),
            isLoading: false,
            favouriteItems: favouriteItems,
          ),
          FavouriteState.initial().copyWith(
            failureOrSuccessOption: none(),
            isLoading: true,
            favouriteItems: favouriteItems,
          ),
          FavouriteState.initial().copyWith(
            failureOrSuccessOption: none(),
            isLoading: false,
            favouriteItems: favouriteItems,
          )
        ],
      );
      blocTest<FavouriteBloc, FavouriteState>(
        'add favourite item ',
        build: () {
          return FavouriteBloc(
            favouriteRepository: mockFavouriteRepository,
          );
        },
        setUp: () {
          when(
            () => mockFavouriteRepository.getFavourites(
              user: mockUser,
            ),
          ).thenAnswer((invocation) async => Right(favouriteItems));
          when(() => mockFavouriteRepository.addFavourites(
                isPackAndPick: false,
                favouriteItems: favouriteItems,
                item: Favourite(
                  id: '1',
                  isFOC: false,
                  isTenderContract: false,
                  materialDescription: '',
                  materialNumber: MaterialNumber(''),
                ),
                user: mockUser,
              )).thenAnswer((invocation) async => Right(favouriteItems));
        },
        act: (FavouriteBloc bloc) {
          bloc.add(FavouriteEvent.fetch(user: mockUser));
          bloc.add(FavouriteEvent.add(
              user: mockUser,
              item: Favourite(
                id: '1',
                isFOC: false,
                isTenderContract: false,
                materialDescription: '',
                materialNumber: MaterialNumber(''),
              ),
              isPackAndPick: false));
        },
        expect: () => [
          FavouriteState.initial().copyWith(isLoading: true),
          FavouriteState.initial().copyWith(
            failureOrSuccessOption: none(),
            isLoading: false,
            favouriteItems: favouriteItems,
          ),
          FavouriteState.initial().copyWith(
            failureOrSuccessOption: none(),
            isLoading: true,
            favouriteItems: favouriteItems,
          ),
          FavouriteState.initial().copyWith(
            failureOrSuccessOption: none(),
            isLoading: false,
            favouriteItems: favouriteItems,
          )
        ],
      );

      blocTest(
        'Simulate error for add favourite item ',
        build: () =>
            FavouriteBloc(favouriteRepository: mockFavouriteRepository),
        setUp: () {
          when(
            () => mockFavouriteRepository.addFavourites(
              isPackAndPick: false,
              favouriteItems: favouriteItems,
              item: Favourite.empty(),
              user: mockUser,
            ),
          ).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
        },
        act: (FavouriteBloc bloc) {
          bloc.add(FavouriteEvent.fetch(user: mockUser));
          bloc.add(
            FavouriteEvent.add(
                item: Favourite.empty(), isPackAndPick: false, user: mockUser),
          );
        },
        expect: () => [
          FavouriteState.initial().copyWith(isLoading: true),
          FavouriteState.initial().copyWith(
            isLoading: false,
            favouriteItems: [
              Favourite.empty(),
            ],
          ),
          FavouriteState.initial().copyWith(
            isLoading: true,
            favouriteItems: [
              Favourite.empty(),
            ],
          ),
          FavouriteState.initial().copyWith(
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('fake-error'),
              ),
            ),
            isLoading: false,
            favouriteItems: favouriteItems,
          )
        ],
      );

      blocTest(
        'Simulate error for delete favourite item ',
        build: () => FavouriteBloc(favouriteRepository: mockFavouriteRepository
            // shipToCodeBloc: shipToCodeMockBloc,
            ),
        setUp: () {
          when(
            () => mockFavouriteRepository.deleteFavourites(
                favouriteItems: favouriteItems, item: Favourite.empty()),
          ).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
        },
        act: (FavouriteBloc bloc) {
          bloc.add(FavouriteEvent.fetch(user: mockUser));
          bloc.add(
            FavouriteEvent.delete(item: Favourite.empty(), user: mockUser),
          );
        },
        expect: () => [
          FavouriteState.initial().copyWith(isLoading: true),
          FavouriteState.initial().copyWith(
            isLoading: false,
            favouriteItems: [
              Favourite.empty(),
            ],
          ),
          FavouriteState.initial().copyWith(
            isLoading: true,
            favouriteItems: [
              Favourite.empty(),
            ],
          ),
          FavouriteState.initial().copyWith(
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('fake-error'),
              ),
            ),
            isLoading: false,
            favouriteItems: favouriteItems,
          )
        ],
      );
    },
  );
}

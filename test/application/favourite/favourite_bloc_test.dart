import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/favourites/favourite_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/favourites/entities/favourite_item.dart';
import 'package:ezrxmobile/domain/material/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/repository/user_repository.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/favourites/repository/favourite_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

class MockFavouriteBloc extends MockBloc<FavouriteEvent, FavouriteState>
    implements FavouriteBloc {}

class MockFavouriteRepository extends Mock implements FavouriteRepository {}

class UserRepoMock extends Mock implements UserRepository {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

// class ShipToCodeMockBloc extends MockBloc<ShipToCodeEvent, ShipToCodeState>
//     implements ShipToCodeBloc {}

void main() {
  late GetIt locator;
  late FavouriteRepository mockFavouriteRepository;
  // final shipToCodeMockBloc = ShipToCodeMockBloc();
  var favouriteItems = <Favourite>[
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
  });

  group(
    'Favourite Bloc Test Group',
    () {
      blocTest<FavouriteBloc, FavouriteState>(
        'Init Favourite Bloc and raise fetch event',
        build: () {
          when(() => mockFavouriteRepository.getFavourites()).thenAnswer(
            (invocation) async => Right([Favourite.empty()]),
          );
          return FavouriteBloc(
            favouriteRepository: mockFavouriteRepository,
            // shipToCodeBloc: shipToCodeMockBloc,
          );
        },
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
          when(() => mockFavouriteRepository.getFavourites()).thenAnswer(
            (invocation) async => const Right([]),
          );
          return FavouriteBloc(
            favouriteRepository: mockFavouriteRepository,
            // shipToCodeBloc: shipToCodeMockBloc,
          );
        },
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
        setUp: () {
          when(
            () => mockFavouriteRepository.getFavourites(),
          ).thenAnswer((invocation) async => Right(favouriteItems));
          when(() => mockFavouriteRepository.deleteFavourites(
                favouriteItems: favouriteItems,
                item: Favourite(
                  id: '1',
                  isFOC: false,
                  isTenderContract: false,
                  materialDescription: '',
                  materialNumber: MaterialNumber(''),
                ),
              )).thenAnswer((invocation) async => Right(favouriteItems));
        },
        expect: () => [
          FavouriteState.initial().copyWith(isLoading: true),
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
            // shipToCodeBloc: shipToCodeMockBloc,
          );
        },
        setUp: () {
          when(
            () => mockFavouriteRepository.getFavourites(),
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
              )).thenAnswer((invocation) async => Right(favouriteItems));
        },
        expect: () => [
          FavouriteState.initial().copyWith(isLoading: true),
          FavouriteState.initial().copyWith(
            failureOrSuccessOption: none(),
            isLoading: false,
            favouriteItems: favouriteItems,
          )
        ],
      );

      blocTest(
        'Simulate error for add favourite item ',
        build: () => FavouriteBloc(
          favouriteRepository: mockFavouriteRepository,
          // shipToCodeBloc: shipToCodeMockBloc,
        ),
        setUp: () {
          when(
            () => mockFavouriteRepository.addFavourites(
              isPackAndPick: false,
              favouriteItems: favouriteItems,
              item: Favourite(
                id: '1',
                isFOC: false,
                isTenderContract: false,
                materialDescription: '',
                materialNumber: MaterialNumber(''),
              ),
            ),
          ).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
        },
        act: (FavouriteBloc bloc) => bloc.add(
          FavouriteEvent.add(
              Favourite(
                id: '1',
                isFOC: false,
                isTenderContract: false,
                materialDescription: '',
                materialNumber: MaterialNumber(''),
              ),
              false),
        ),
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
        build: () => FavouriteBloc(
          favouriteRepository: mockFavouriteRepository,
          // shipToCodeBloc: shipToCodeMockBloc,
        ),
        setUp: () {
          when(
            () => mockFavouriteRepository.deleteFavourites(
              favouriteItems: favouriteItems,
              item: Favourite(
                id: '1',
                isFOC: false,
                isTenderContract: false,
                materialDescription: '',
                materialNumber: MaterialNumber(''),
              ),
            ),
          ).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
        },
        act: (FavouriteBloc bloc) => bloc.add(
          FavouriteEvent.delete(Favourite(
            id: '1',
            isFOC: false,
            isTenderContract: false,
            materialDescription: '',
            materialNumber: MaterialNumber(''),
          )),
        ),
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

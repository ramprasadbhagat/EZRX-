import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/favourites/favourite_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/favourites/entities/favourite_item.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/favourites/repository/favourite_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFavouriteRepository extends Mock implements FavouriteRepository {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late FavouriteRepository mockFavouriteRepository;
  final fakeUser = User.empty();
  final fakeFavoriteItemOne = Favourite(
    id: 'fake-id-1',
    isFOC: false,
    isTenderContract: false,
    materialDescription: '',
    materialNumber: MaterialNumber(''),
  );
  final fakeFavoriteItemTwo = Favourite(
    id: 'fake-id-2',
    isFOC: false,
    isTenderContract: false,
    materialDescription: '',
    materialNumber: MaterialNumber(''),
  );

  final favouriteItems = <Favourite>[
    fakeFavoriteItemOne,
    fakeFavoriteItemTwo,
  ];

  setUpAll(() {
    mockFavouriteRepository = MockFavouriteRepository();
  });

  group(
    'Favourite Bloc Test Group',
    () {
      blocTest<FavouriteBloc, FavouriteState>(
        'Initialize',
        build: () => FavouriteBloc(
          favouriteRepository: mockFavouriteRepository,
        ),
        act: (FavouriteBloc bloc) =>
            bloc.add(const FavouriteEvent.initialized()),
        expect: () => [
          FavouriteState.initial(),
        ],
      );

      blocTest<FavouriteBloc, FavouriteState>(
        'Fetch favorite success',
        build: () => FavouriteBloc(
          favouriteRepository: mockFavouriteRepository,
        ),
        setUp: () {
          when(() => mockFavouriteRepository.getFavourites(
                user: fakeUser,
              )).thenAnswer(
            (invocation) async => Right(favouriteItems),
          );
        },
        act: (FavouriteBloc bloc) =>
            bloc.add(FavouriteEvent.fetch(user: fakeUser)),
        expect: () => [
          FavouriteState.initial().copyWith(isLoading: true),
          FavouriteState.initial().copyWith(
            isLoading: false,
            favouriteItems: favouriteItems,
          )
        ],
      );

      blocTest<FavouriteBloc, FavouriteState>(
        'Fetch favorite failure',
        build: () => FavouriteBloc(
          favouriteRepository: mockFavouriteRepository,
        ),
        setUp: () {
          when(() => mockFavouriteRepository.getFavourites(
                user: fakeUser,
              )).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
        },
        act: (FavouriteBloc bloc) =>
            bloc.add(FavouriteEvent.fetch(user: fakeUser)),
        expect: () => [
          FavouriteState.initial().copyWith(isLoading: true),
          FavouriteState.initial().copyWith(
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('fake-error'),
              ),
            ),
            isLoading: false,
          )
        ],
      );

      blocTest<FavouriteBloc, FavouriteState>(
        'delete favourite item success',
        build: () => FavouriteBloc(
          favouriteRepository: mockFavouriteRepository,
        ),
        act: (FavouriteBloc bloc) {
          bloc.add(
            FavouriteEvent.delete(
              item: fakeFavoriteItemOne,
              user: fakeUser,
            ),
          );
        },
        seed: () => FavouriteState.initial().copyWith(
          favouriteItems: favouriteItems,
        ),
        setUp: () {
          when(
            () => mockFavouriteRepository.deleteFavourites(
              favouriteItems: favouriteItems,
              item: fakeFavoriteItemOne,
            ),
          ).thenAnswer(
            (invocation) async => Right(
              [fakeFavoriteItemTwo],
            ),
          );
        },
        expect: () => [
          FavouriteState.initial().copyWith(
            favouriteItems: [
              fakeFavoriteItemOne.copyWith(isWaitingStatusUpdate: true),
              fakeFavoriteItemTwo,
            ],
          ),
          FavouriteState.initial().copyWith(
            favouriteItems: [
              fakeFavoriteItemTwo,
            ],
          )
        ],
      );

      blocTest<FavouriteBloc, FavouriteState>(
        'delete favourite item failure',
        build: () => FavouriteBloc(
          favouriteRepository: mockFavouriteRepository,
        ),
        act: (FavouriteBloc bloc) {
          bloc.add(
            FavouriteEvent.delete(
              item: fakeFavoriteItemOne,
              user: fakeUser,
            ),
          );
        },
        seed: () => FavouriteState.initial().copyWith(
          favouriteItems: favouriteItems,
        ),
        setUp: () {
          when(
            () => mockFavouriteRepository.deleteFavourites(
              favouriteItems: favouriteItems,
              item: fakeFavoriteItemOne,
            ),
          ).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
        },
        expect: () => [
          FavouriteState.initial().copyWith(
            favouriteItems: [
              fakeFavoriteItemOne.copyWith(isWaitingStatusUpdate: true),
              fakeFavoriteItemTwo,
            ],
          ),
          FavouriteState.initial().copyWith(
            favouriteItems: favouriteItems,
            failureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('fake-error'),
              ),
            ),
          )
        ],
      );
      blocTest<FavouriteBloc, FavouriteState>(
        'add favourite item success',
        build: () => FavouriteBloc(
          favouriteRepository: mockFavouriteRepository,
        ),
        setUp: () {
          when(() => mockFavouriteRepository.addFavourites(
                isPackAndPick: false,
                favouriteItems: favouriteItems,
                item: fakeFavoriteItemOne,
                user: fakeUser,
              )).thenAnswer((invocation) async => Right([fakeFavoriteItemTwo]));
        },
        act: (FavouriteBloc bloc) {
          bloc.add(
            FavouriteEvent.add(
              user: fakeUser,
              item: fakeFavoriteItemOne,
              isPackAndPick: false,
            ),
          );
        },
        seed: () => FavouriteState.initial().copyWith(
          isLoading: false,
          favouriteItems: favouriteItems,
        ),
        expect: () => [
          FavouriteState.initial().copyWith(
            isLoading: true,
            favouriteItems: favouriteItems,
          ),
          FavouriteState.initial().copyWith(
            isLoading: false,
            favouriteItems: [fakeFavoriteItemTwo],
          )
        ],
      );

      blocTest(
        'Add favourite item error',
        build: () =>
            FavouriteBloc(favouriteRepository: mockFavouriteRepository),
        setUp: () {
          when(
            () => mockFavouriteRepository.addFavourites(
              isPackAndPick: false,
              favouriteItems: favouriteItems,
              item: fakeFavoriteItemOne,
              user: fakeUser,
            ),
          ).thenAnswer(
            (invocation) async => const Left(
              ApiFailure.other('fake-error'),
            ),
          );
        },
        seed: () => FavouriteState.initial().copyWith(
          favouriteItems: favouriteItems,
          isLoading: false,
        ),
        act: (FavouriteBloc bloc) {
          bloc.add(
            FavouriteEvent.add(
              item: fakeFavoriteItemOne,
              isPackAndPick: false,
              user: fakeUser,
            ),
          );
        },
        expect: () => [
          FavouriteState.initial().copyWith(
            isLoading: true,
            favouriteItems: favouriteItems,
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

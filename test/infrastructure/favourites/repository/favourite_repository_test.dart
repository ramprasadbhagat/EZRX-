import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/favourites/entities/favourite_item.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/favourites/datasource/favourite_remote.dart';
import 'package:ezrxmobile/infrastructure/favourites/datasource/favourites_local.dart';
import 'package:ezrxmobile/infrastructure/favourites/repository/favourite_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockConfig extends Mock implements Config {}

class FavoriteLocalDataSourceMock extends Mock
    implements FavouriteLocalDataSource {}

class FavoriteRemoteDataSourceMock extends Mock
    implements FavouriteRemoteDataSource {}

class CountlyServiceMock extends Mock implements CountlyService {}

void main() {
  late FavouriteRepository favoriteRepo;
  late Config mockConfig;
  late FavouriteLocalDataSource favoriteLocalSource;
  late FavouriteRemoteDataSource favoriteRemoteSource;
  late CountlyService countlyService;
  //data
  final favoriteMockList = [
    Favourite.empty(),
    Favourite.empty(),
  ];
  final mockUser = User.empty();
  final mockFavorite = Favourite.empty().copyWith(
    materialNumber: MaterialNumber('123'),
  );

  setUpAll(() {
    mockConfig = MockConfig();
    favoriteLocalSource = FavoriteLocalDataSourceMock();
    favoriteRemoteSource = FavoriteRemoteDataSourceMock();
    countlyService = CountlyServiceMock();
    favoriteRepo = FavouriteRepository(
      config: mockConfig,
      localDataSource: favoriteLocalSource,
      remoteDataSource: favoriteRemoteSource,
      countlyService: countlyService,
    );
  });

  group('FavoriteRepository should - ', () {
    test('get Favorites successfully locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => favoriteLocalSource.getFavouriteList())
          .thenAnswer((invocation) async => favoriteMockList);

      final result = await favoriteRepo.getFavourites(user: mockUser);
      expect(
        result.isRight(),
        true,
      );
    });

    test('get Favorites fail locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);
      when(() => favoriteLocalSource.getFavouriteList())
          .thenThrow(const ApiFailure.serverTimeout());

      final result = await favoriteRepo.getFavourites(user: mockUser);
      expect(
        result.isLeft(),
        true,
      );
    });

    test('get Favorites successfully remotely', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => favoriteRemoteSource.getFavouriteList(
          userId: mockUser.id,
        ),
      ).thenAnswer((invocation) async => favoriteMockList);

      final result = await favoriteRepo.getFavourites(user: mockUser);
      expect(
        result.isRight(),
        true,
      );
    });

    test('get Favorites fail remotely', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => favoriteRemoteSource.getFavouriteList(
          userId: mockUser.id,
        ),
      ).thenThrow(const ApiFailure.serverTimeout());

      final result = await favoriteRepo.getFavourites(user: mockUser);
      expect(
        result.isLeft(),
        true,
      );
    });

    test('add Favorites successfully locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      final result = await favoriteRepo.addFavourites(
          isPackAndPick: false,
          item: mockFavorite,
          favouriteItems: favoriteMockList,
          user: mockUser);
      expect(
        result.isRight(),
        true,
      );
    });

    test('add Favorites successfully remotely', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => favoriteRemoteSource.addFavourite(
          type: 'Comm',
          isFOC: mockFavorite.isFOC,
          materialDescription: mockFavorite.materialDescription,
          isTenderContract: mockFavorite.isTenderContract,
          userId: mockUser.id,
          materialNumber: mockFavorite.materialNumber.getOrCrash(),
        ),
      ).thenAnswer((invocation) async => mockFavorite);
      when(
        () => countlyService.addCountlyEvent(
          'Add to favourite',
          segmentation: {
            'materialNum': mockFavorite.materialNumber.getOrCrash()
          },
        ),
      ).thenAnswer((invocation) => Future.value());

      final result = await favoriteRepo.addFavourites(
          isPackAndPick: false,
          item: mockFavorite,
          favouriteItems: favoriteMockList,
          user: mockUser);
      expect(
        result.isRight(),
        true,
      );
    });

    test('add Favorites successfully remotely with isPackAndPick', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => favoriteRemoteSource.addFavourite(
          type: 'P&P',
          isFOC: mockFavorite.isFOC,
          materialDescription: mockFavorite.materialDescription,
          isTenderContract: mockFavorite.isTenderContract,
          userId: mockUser.id,
          materialNumber: mockFavorite.materialNumber.getOrCrash(),
        ),
      ).thenAnswer((invocation) async => mockFavorite);
      when(
        () => countlyService.addCountlyEvent(
          'Add to favourite',
          segmentation: {
            'materialNum': mockFavorite.materialNumber.getOrCrash()
          },
        ),
      ).thenAnswer((invocation) => Future.value());

      final result = await favoriteRepo.addFavourites(
          isPackAndPick: true,
          item: mockFavorite,
          favouriteItems: favoriteMockList,
          user: mockUser);
      expect(
        result.isRight(),
        true,
      );
    });

    test('add Favorites successfully remotely with isFOC', () async {
      final favorite = mockFavorite.copyWith(
        isFOC: true,
      );
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => favoriteRemoteSource.addFavourite(
          type: '6A1',
          isFOC: favorite.isFOC,
          materialDescription: favorite.materialDescription,
          isTenderContract: favorite.isTenderContract,
          userId: mockUser.id,
          materialNumber: favorite.materialNumber.getOrCrash(),
        ),
      ).thenAnswer((invocation) async => favorite);
      when(
        () => countlyService.addCountlyEvent(
          'Add to favourite',
          segmentation: {'materialNum': favorite.materialNumber.getOrCrash()},
        ),
      ).thenAnswer((invocation) => Future.value());

      final result = await favoriteRepo.addFavourites(
          isPackAndPick: false,
          item: favorite,
          favouriteItems: favoriteMockList,
          user: mockUser);
      expect(
        result.isRight(),
        true,
      );
    });

    test('add Favorites fail remotely', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => favoriteRemoteSource.addFavourite(
          type: 'Comm',
          isFOC: mockFavorite.isFOC,
          materialDescription: mockFavorite.materialDescription,
          isTenderContract: mockFavorite.isTenderContract,
          userId: mockUser.id,
          materialNumber: mockFavorite.materialNumber.getOrCrash(),
        ),
      ).thenThrow(const ApiFailure.serverTimeout());

      final result = await favoriteRepo.addFavourites(
          isPackAndPick: false,
          item: mockFavorite,
          favouriteItems: favoriteMockList,
          user: mockUser);
      expect(
        result.isLeft(),
        true,
      );
    });

    test('delete Favorites successfully locally', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.mock);

      final result = await favoriteRepo.deleteFavourites(
        item: mockFavorite,
        favouriteItems: favoriteMockList,
      );
      expect(
        result.isRight(),
        true,
      );
    });

    test('delete Favorites successfully remotely', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => favoriteRemoteSource.deleteFavourite(
          itemId: mockFavorite.id,
        ),
      ).thenAnswer((invocation) async => mockFavorite);
      when(
        () => countlyService.addCountlyEvent(
          'remove_favourite',
          segmentation: {'materialNum': mockFavorite.id},
        ),
      ).thenAnswer((invocation) => Future.value());

      final result = await favoriteRepo.deleteFavourites(
        item: mockFavorite,
        favouriteItems: favoriteMockList,
      );
      expect(
        result.isRight(),
        true,
      );
    });
    test('delete Favorites fail remotely', () async {
      when(() => mockConfig.appFlavor).thenReturn(Flavor.dev);
      when(
        () => favoriteRemoteSource.deleteFavourite(
          itemId: mockFavorite.id,
        ),
      ).thenThrow(const ApiFailure.serverTimeout());

      final result = await favoriteRepo.deleteFavourites(
        item: mockFavorite,
        favouriteItems: favoriteMockList,
      );
      expect(
        result.isLeft(),
        true,
      );
    });
  });
}

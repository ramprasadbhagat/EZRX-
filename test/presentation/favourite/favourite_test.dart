import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/favourites/favourite_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/favourites/entities/favourite_item.dart';
import 'package:ezrxmobile/domain/material/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/favourites/repository/favourite_repository.dart';
import 'package:ezrxmobile/presentation/favorites/favorites_tab.dart';
import 'package:ezrxmobile/presentation/favorites/favourite_tile.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/widget_utils.dart';

class MockHTTPService extends Mock implements HttpService {}

class MockFavouriteBloc extends MockBloc<FavouriteEvent, FavouriteState>
    implements FavouriteBloc {}

class MockFavouriteRepository extends Mock implements FavouriteRepository {}

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

void main() {
  late GetIt locator;
  final mockFavouriteBloc = MockFavouriteBloc();
  late MockHTTPService mockHTTPService;
  late AppRouter autoRouterMock;

  final mockFavourite1 = Favourite.empty().copyWith(
    id: '1',
    isFOC: false,
    isTenderContract: false,
    materialDescription: 'desc',
    materialNumber: MaterialNumber('131312312'),
  );

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();

    locator = GetIt.instance;
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => CountlyService());
    locator.registerLazySingleton(() => mockFavouriteBloc);
    autoRouterMock = locator<AppRouter>();
    mockHTTPService = MockHTTPService();
    locator.registerLazySingleton<HttpService>(
      () => mockHTTPService,
    );
  });

  group(
    'Favourite',
    () {
      setUp(() {
        when(() => mockFavouriteBloc.state)
            .thenReturn(FavouriteState.initial());
      });

      StackRouterScope getWUT() {
        return WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          providers: [
            BlocProvider<FavouriteBloc>(create: (context) => mockFavouriteBloc),
          ],
          child: const Scaffold(body: FavoritesTab()),
        );
      }

      testWidgets('Favourite test  - Many items for favourite', (tester) async {
        final favouriteBloc = locator<MockFavouriteBloc>();

        when(() => favouriteBloc.stream).thenAnswer((invocation) {
          return Stream.fromIterable([
            FavouriteState.initial().copyWith(
              isLoading: false,
              failureOrSuccessOption: none(),
              favouriteItems: [mockFavourite1],
            ),
          ]);
        });

        await tester.pumpWidget(getWUT());
        await tester.pump();

        expect(
          find.byKey(const Key('scrollList')),
          findsOneWidget,
        );
        final favouriteListTile = find.byType(FavouriteListTile);
        expect(favouriteListTile, findsAtLeastNWidgets(1));

        await tester.pump();
      });

      testWidgets('Favourite test - is Snackbar shown?', (tester) async {
        final favouriteBloc = locator<MockFavouriteBloc>();

        when(() => favouriteBloc.stream).thenAnswer((invocation) {
          return Stream.fromIterable(
            [
              FavouriteState.initial(),
              FavouriteState.initial().copyWith(
                  isLoading: false,
                  favouriteItems: [
                    Favourite.empty(),
                    Favourite.empty(),
                  ],
                  failureOrSuccessOption: optionOf(
                    const Left(ApiFailure.other('Fake Error')),
                  )),
            ],
          );
        });

        await tester.pumpWidget(getWUT());
        await tester.pump();

        expect(
          find.byKey(const Key('snackBarMessage')),
          findsOneWidget,
        );
      });

      testWidgets(
        'Favourite test - No Favourite item found',
        (tester) async {
          final favouriteBloc = locator<MockFavouriteBloc>();
          when(() => favouriteBloc.stream).thenAnswer(
            (invocation) {
              return Stream.fromIterable(
                [
                  FavouriteState.initial(),
                  FavouriteState.initial().copyWith(
                    isLoading: false,
                    favouriteItems: [],
                    failureOrSuccessOption: none(),
                  ),
                ],
              );
            },
          );

          await tester.pumpWidget(getWUT());
          await tester.pump();

          expect(
            find.text('No favorite found'),
            findsWidgets,
          );
        },
      );
      testWidgets(
        'Favourite test - No API error',
        (tester) async {
          final favouriteBloc = locator<MockFavouriteBloc>();
          when(() => favouriteBloc.stream).thenAnswer(
            (invocation) {
              return Stream.fromIterable(
                [
                  FavouriteState.initial(),
                  FavouriteState.initial().copyWith(
                    isLoading: false,
                    favouriteItems: [
                      Favourite.empty(),
                      Favourite.empty(),
                    ],
                    failureOrSuccessOption:
                        optionOf(const Right('No API error')),
                  ),
                ],
              );
            },
          );

          await tester.pumpWidget(getWUT());
          await tester.pump();

          expect(
            find.byKey(const Key('scrollList')),
            findsWidgets,
          );
        },
      );
    },
  );
}

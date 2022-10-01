import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/favourites/entities/favourite_item.dart';
import 'package:ezrxmobile/domain/material/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/presentation/favorites/favourite_list.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/widget_utils.dart';

class MockHTTPService extends Mock implements HttpService {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class AutoRouterMock extends Mock implements AppRouter {}

void main() {
  late GetIt locator;
  late HttpService mockHTTPService;
  late UserBloc userBlocMock;
  late AppRouter autoRouterMock;
  final mockFavourite1 = Favourite(
    id: '1',
    isFOC: false,
    isTenderContract: false,
    materialDescription: 'desc',
    materialNumber: MaterialNumber('131312312'),
  );

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    WidgetsFlutterBinding.ensureInitialized();
    locator = GetIt.instance;
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => CountlyService());
    userBlocMock = UserBlocMock();

    mockHTTPService = MockHTTPService();

    locator.registerLazySingleton<HttpService>(
      () => mockHTTPService,
    );
  });

  group('Favourite List', () {
    setUp(() {
      autoRouterMock = locator<AppRouter>();
    });

    Widget getWUT(Config config) {
      return FavouriteList(
        item: mockFavourite1,
      );
    }

    StackRouterScope getScopedWidget(Config config) {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<UserBloc>(create: (context) => userBlocMock),
        ],
        child: getWUT(config),
      );
    }

    testWidgets('Favourite test 1 - Mock Flavour', (tester) async {
      final config = locator<Config>();
      config.appFlavor = Flavor.mock;
      await tester.pumpWidget(getScopedWidget(config));
      await tester.pump();

      final favouriteTile = find.byType(Card);
      expect(
        favouriteTile,
        findsOneWidget,
      );
    });

    testWidgets('favourite test 2 - Non Mock Flavour', (tester) async {
      final config = locator<Config>();
      config.appFlavor = Flavor.uat;
      await tester.pumpWidget(getScopedWidget(config));
      await tester.pump();

      final favouriteTile = find.byType(FavouriteList);
      expect(
        favouriteTile,
        findsOneWidget,
      );
    });

    testWidgets('favourite test 3 - favourite delete icon', (tester) async {
      final config = locator<Config>();
      config.appFlavor = Flavor.uat;
      await tester.pumpWidget(getScopedWidget(config));
      await tester.pump();

      final favouriteTile = find.byKey(
        const Key('deleteFavouriteFavPage'),
      );
      expect(
        favouriteTile,
        findsOneWidget,
      );
    });
    testWidgets('favourite test 4 - favourite item clicked', (tester) async {
      final config = locator<Config>();
      config.appFlavor = Flavor.uat;
      await tester.pumpWidget(getScopedWidget(config));
      await tester.pump();

      final favouriteTile = find.byKey(
        const Key('itemClicked'),
      );
      expect(
        favouriteTile,
        findsOneWidget,
      );
    });
  });
}

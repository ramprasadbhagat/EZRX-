import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/intro/intro_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/intro/intro_page.dart';
import 'package:ezrxmobile/presentation/intro/intro_step.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import '../../utils/widget_utils.dart';

class IntroBlocMock extends MockBloc<IntroEvent, IntroState>
    implements IntroBloc {}

final locator = GetIt.instance;

void main() {
  late IntroBloc introBlocMock;
  late AppRouter autoRouterMock;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerLazySingleton(() => AppRouter());
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
    autoRouterMock = locator<AppRouter>();
    introBlocMock = IntroBlocMock();
    when(() => introBlocMock.state).thenReturn(IntroState.initial());
  });

  Widget getIntroPage() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      providers: [
        BlocProvider<IntroBloc>(
          create: (context) => introBlocMock,
        ),
      ],
      child: const IntroPage(),
    );
  }

  group('Test "Intro Page"', () {
    testWidgets('Content Display', (tester) async {
      await tester.pumpWidget(getIntroPage());
      await tester.pump();
      expect(find.byType(PageView), findsOneWidget);
      expect(find.byType(IntroStep), findsAtLeastNWidgets(1));
      final haveHeaderTextFinder = find.text('Fuss-free returns');
      expect(haveHeaderTextFinder, findsOneWidget);
      final haveDescriptionTextFinder = find.text(
        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.',
      );
      expect(haveDescriptionTextFinder, findsOneWidget);
      final introGetStatedButtonFinder =
          find.byKey(WidgetKeys.introGetStartedButton);
      expect(introGetStatedButtonFinder, findsOneWidget);
      final haveButtonTextFinder = find.text(
        'Get started',
      );
      expect(haveButtonTextFinder, findsOneWidget);
    });

    testWidgets('Get Started Button On Tap', (tester) async {
      await tester.pumpWidget(getIntroPage());
      await tester.pump();

      final introGetStatedButtonFinder =
          find.byKey(WidgetKeys.introGetStartedButton);
      await tester.tap(introGetStatedButtonFinder);
      verify(
        () => introBlocMock.add(
          const IntroEvent.setAppFirstLaunch(),
        ),
      ).called(1);
      verify(
        () => introBlocMock.add(
          const IntroEvent.initialIndex(),
        ),
      ).called(1);
    });
  });
}

import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_info_bloc.dart';
import 'package:ezrxmobile/application/articles_info/articles_info_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/home/announcement_section/announcement_articles_tab/announcements/announcements_tab.dart';
import 'package:ezrxmobile/presentation/home/announcement_section/announcement_articles_tab/announcements_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/widget_utils.dart';

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class AnnouncementInfoBlocMock
    extends MockBloc<AnnouncementInfoEvent, AnnouncementInfoState>
    implements AnnouncementInfoBloc {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class ArticlesInfoBlocMock
    extends MockBloc<ArticlesInfoEvent, ArticlesInfoState>
    implements ArticlesInfoBloc {}

class ConfigMock extends Mock implements Config {}

void main() {
  late AppRouter autoRouterMock;
  late AnnouncementInfoBloc announcementInfoBloc;
  late AnnouncementBloc announcementBloc;
  late ArticlesInfoBloc articlesInfoBloc;
  late AuthBloc authBloc;
  late Config configMock;
  const fakeKeyWord = 'fake-keyword';

  setUpAll(() {
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => Config());
    autoRouterMock = locator<AppRouter>();
    configMock = locator<Config>();
    announcementInfoBloc = AnnouncementInfoBlocMock();
    announcementBloc = AnnouncementBlocMock();
    articlesInfoBloc = ArticlesInfoBlocMock();
    authBloc = AuthBlocMock();
    when(() => announcementInfoBloc.state)
        .thenReturn(AnnouncementInfoState.initial());
    when(() => announcementBloc.state).thenReturn(AnnouncementState.initial());
    when(() => authBloc.state).thenReturn(const AuthState.initial());
    when(() => articlesInfoBloc.state).thenReturn(ArticlesInfoState.initial());
  });

  Future setUpWidgetArticleTab(WidgetTester tester) async {
    await tester.tap(find.byKey(WidgetKeys.genericKey(key: 'Articles')));
    await tester.pumpAndSettle();
  }

  Widget getWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      routeName: AnnouncementsPageRoute.name,
      usingLocalization: true,
      providers: [
        BlocProvider<AnnouncementInfoBloc>(
          create: (context) => announcementInfoBloc,
        ),
        BlocProvider<AnnouncementBloc>(
          create: (context) => announcementBloc,
        ),
        BlocProvider<AuthBloc>(
          create: (context) => authBloc,
        ),
        BlocProvider<ArticlesInfoBloc>(
          create: (context) => articlesInfoBloc,
        ),
      ],
      child: const AnnouncementsPage(),
    );
  }

  group('Announcements Page Test', () {
    testWidgets('Default Display', (tester) async {
      await tester.pumpWidget(getWidget());
      await tester.pump();
      expect(find.byKey(WidgetKeys.announcementsTab), findsOneWidget);
      expect(find.text('Announcements & articles'.tr()), findsOneWidget);
      expect(find.byType(AnnouncementsTab), findsOneWidget);
      expect(
        find.byKey(WidgetKeys.genericKey(key: 'Announcements')),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.genericKey(key: 'Articles')),
        findsOneWidget,
      );
      expect(
        find.byKey(WidgetKeys.searchSectionTab('Announcements')),
        findsOneWidget,
      );
    });

    group('Announcements Search Bar', () {
      testWidgets('Announcements Search Bar On Change', (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final searchFieldFinder = find.byKey(
          WidgetKeys.genericKey(
            key: announcementInfoBloc.state.searchKey.searchValueOrEmpty,
          ),
        );
        await tester.enterText(searchFieldFinder, fakeKeyWord);
        await tester.pump(Duration(milliseconds: configMock.autoSearchTimeout));
        verify(
          () => announcementInfoBloc.add(
            const AnnouncementInfoEvent.updateSearchKey(
              searchKey: fakeKeyWord,
            ),
          ),
        ).called(1);
      });

      testWidgets('Announcements Search Bar On Submit', (tester) async {
        final expectStates = [
          AnnouncementInfoState.initial().copyWith(
            isLoading: true,
          ),
          AnnouncementInfoState.initial(),
        ];
        whenListen(announcementInfoBloc, Stream.fromIterable(expectStates));
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final searchFieldFinder = find.byKey(
          WidgetKeys.genericKey(
            key: announcementInfoBloc.state.searchKey.searchValueOrEmpty,
          ),
        );
        await tester.enterText(searchFieldFinder, fakeKeyWord);
        await tester.testTextInput.receiveAction(TextInputAction.done);
        verify(
          () => announcementInfoBloc.add(
            const AnnouncementInfoEvent.updateSearchKey(
              searchKey: fakeKeyWord,
            ),
          ),
        ).called(1);
      });

      testWidgets('Announcements Search Bar On Tap Clear Button',
          (tester) async {
        when(() => announcementInfoBloc.state).thenReturn(
          AnnouncementInfoState.initial().copyWith(
            searchKey: SearchKey.searchFilter(fakeKeyWord),
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();

        await tester.tap(find.byKey(WidgetKeys.clearIconKey));
        verify(
          () => announcementInfoBloc.add(
            const AnnouncementInfoEvent.updateSearchKey(
              searchKey: '',
            ),
          ),
        ).called(1);
      });
    });

    group('Articles Search Bar', () {
      testWidgets('Articles Search Bar On Change', (tester) async {
        await tester.pumpWidget(getWidget());
        await tester.pump();
        await setUpWidgetArticleTab(tester);
        expect(
          find.byKey(WidgetKeys.searchSectionTab('Articles')),
          findsOneWidget,
        );
        final searchFieldFinder = find.byKey(
          WidgetKeys.genericKey(
            key: articlesInfoBloc.state.searchKey.searchValueOrEmpty,
          ),
        );
        await tester.enterText(searchFieldFinder, fakeKeyWord);
        await tester.pump(Duration(milliseconds: configMock.autoSearchTimeout));
        verify(
          () => articlesInfoBloc.add(
            const ArticlesInfoEvent.setSearchKey(searchKey: fakeKeyWord),
          ),
        ).called(1);
      });

      testWidgets('Articles Search Bar On Submit', (tester) async {
        final expectStates = [
          ArticlesInfoState.initial().copyWith(
            isFetching: true,
          ),
          ArticlesInfoState.initial(),
        ];
        whenListen(articlesInfoBloc, Stream.fromIterable(expectStates));
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        await setUpWidgetArticleTab(tester);
        final searchFieldFinder = find.byKey(
          WidgetKeys.genericKey(
            key: articlesInfoBloc.state.searchKey.searchValueOrEmpty,
          ),
        );
        await tester.enterText(searchFieldFinder, fakeKeyWord);
        await tester.testTextInput.receiveAction(TextInputAction.done);
        verify(
          () => articlesInfoBloc.add(
            const ArticlesInfoEvent.setSearchKey(
              searchKey: fakeKeyWord,
            ),
          ),
        ).called(1);
      });

      testWidgets('Articles Search Bar On Tap Clear Button', (tester) async {
        when(() => articlesInfoBloc.state).thenReturn(
          ArticlesInfoState.initial().copyWith(
            searchKey: SearchKey.searchFilter(fakeKeyWord),
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();
        await setUpWidgetArticleTab(tester);
        await tester.tap(find.byKey(WidgetKeys.clearIconKey));
        verify(
          () => articlesInfoBloc.add(
            const ArticlesInfoEvent.setSearchKey(
              searchKey: '',
            ),
          ),
        ).called(1);
      });
    });
  });
}

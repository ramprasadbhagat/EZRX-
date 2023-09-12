import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/articles_info/articles_info_bloc.dart';
import 'package:ezrxmobile/domain/announcement_info/entities/announcement_article_info.dart';
import 'package:ezrxmobile/domain/announcement_info/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/home/announcement_section/announcement_articles_tab/articles/articles_tab.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../../utils/widget_utils.dart';

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class ArticlesInfoBlocMock
    extends MockBloc<ArticlesInfoEvent, ArticlesInfoState>
    implements ArticlesInfoBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

final locator = GetIt.instance;
void main() {
  late GetIt locator;
  TestWidgetsFlutterBinding.ensureInitialized();
  late UserBloc userBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late ArticlesInfoBloc articlesInfoBlocMock;
  late AppRouter autoRouterMock;
  late List<AnnouncementArticleItem> announcementListMock;
  setUpAll(() {
    locator = GetIt.instance;
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => articlesInfoBlocMock);
    autoRouterMock = locator<AppRouter>();
    userBlocMock = UserBlocMock();
    articlesInfoBlocMock = ArticlesInfoBlocMock();
    salesOrgBlocMock = SalesOrgBlocMock();
    announcementListMock = [
      AnnouncementArticleItem.empty().copyWith(
        id: 'fakeID',
        title: 'fakeTitle1',
        summary: '',
        thumbnail: '',
        content: HtmlContent(''),
        publishedDate: DateTimeStringValue(''),
      ),
      AnnouncementArticleItem.empty().copyWith(
        id: 'fakeID2',
        title: 'fakeTitle2',
        summary: '',
        thumbnail: '',
        content: HtmlContent(''),
        publishedDate: DateTimeStringValue(''),
      ),
      AnnouncementArticleItem.empty().copyWith(
        id: 'fakeID3',
        title: 'fakeTitle3',
        summary: '',
        thumbnail: '',
        content: HtmlContent(''),
        publishedDate: DateTimeStringValue(''),
      ),
      AnnouncementArticleItem.empty().copyWith(
        id: 'fakeID4',
        title: 'fakeTitle4',
        summary: '',
        thumbnail: '',
        content: HtmlContent(''),
        publishedDate: DateTimeStringValue(''),
      ),
      AnnouncementArticleItem.empty().copyWith(
        id: 'fakeID5',
        title: 'fakeTitle5',
        summary: '',
        thumbnail: '',
        content: HtmlContent(''),
        publishedDate: DateTimeStringValue(''),
      ),
      AnnouncementArticleItem.empty().copyWith(
        id: 'fakeID6',
        title: 'fakeTitle6',
        summary: '',
        thumbnail: '',
        content: HtmlContent(''),
        publishedDate: DateTimeStringValue(''),
      ),
      AnnouncementArticleItem.empty().copyWith(
        id: 'fakeID7',
        title: 'fakeTitle7',
        summary: '',
        thumbnail: '',
        content: HtmlContent(''),
        publishedDate: DateTimeStringValue(''),
      ),
      AnnouncementArticleItem.empty().copyWith(
        id: 'fakeID8',
        title: 'fakeTitle8',
        summary: '',
        thumbnail: '',
        content: HtmlContent(''),
        publishedDate: DateTimeStringValue(''),
      )
    ];
  });
  group('test article tab', () {
    setUp(() {
      when(() => articlesInfoBlocMock.state)
          .thenReturn(ArticlesInfoState.initial());
      when(() => userBlocMock.state).thenReturn(UserState.initial());
      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    });
    Widget getWUT() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<ArticlesInfoBloc>(
            create: (context) => articlesInfoBlocMock,
          ),
          BlocProvider<SalesOrgBloc>(
            create: (context) => salesOrgBlocMock,
          ),
          BlocProvider<UserBloc>(
            create: (context) => userBlocMock,
          ),
        ],
        child: const ArticlesTab(),
      );
    }

    testWidgets('should show loading for the first time', (tester) async {
      whenListen(
        articlesInfoBlocMock,
        Stream.fromIterable(
          [ArticlesInfoState.initial().copyWith(isFetching: true)],
        ),
      );
      await tester.pumpWidget(getWUT());
      await tester.pump(const Duration(seconds: 2));
      expect(find.byKey(WidgetKeys.loaderImage), findsOneWidget);
    });
    testWidgets('should show articles list after successfully get Data',
        (tester) async {
      final articlesInfoState = [
        ArticlesInfoState.initial().copyWith(isFetching: true),
        ArticlesInfoState.initial().copyWith(
          isFetching: false,
          articleInfo: AnnouncementArticleInfo(
            total: 2,
            endCursor: '',
            announcementList: announcementListMock,
          ),
        ),
      ];
      whenListen(
        articlesInfoBlocMock,
        Stream.fromIterable(articlesInfoState),
      );
      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle();
      expect(find.text('fakeTitle1'), findsOneWidget);
    });
    testWidgets('should add fetch data again when refresh', (tester) async {
      final articlesInfoBloc = locator<ArticlesInfoBloc>();
      final articlesInfoState = [
        ArticlesInfoState.initial().copyWith(isFetching: true),
        ArticlesInfoState.initial().copyWith(
          isFetching: false,
          articleInfo: AnnouncementArticleInfo(
            total: 2,
            endCursor: '',
            announcementList: announcementListMock,
          ),
        ),
      ];
      whenListen(
        articlesInfoBlocMock,
        Stream.fromIterable(articlesInfoState),
      );
      await tester.pumpWidget(getWUT());
      await tester.fling(
        find.byType(CustomScrollView),
        const Offset(0.0, 300.0),
        1000.0,
      );
      await tester.pumpAndSettle();
      verify(
        () => articlesInfoBloc.add(
          ArticlesInfoEvent.getArticles(
            salesOrg: salesOrgBlocMock.state.salesOrg,
            user: userBlocMock.state.user,
          ),
        ),
      ).called(1);
    });
    testWidgets('should add loadMoreArticles again when pull down to load more',
        (tester) async {
      final articlesInfoBloc = locator<ArticlesInfoBloc>();
      final articlesInfoState = [
        ArticlesInfoState.initial().copyWith(isFetching: true),
        ArticlesInfoState.initial().copyWith(
          isFetching: false,
          articleInfo: AnnouncementArticleInfo(
            total: 2,
            endCursor: '',
            announcementList: announcementListMock,
          ),
        ),
      ];
      whenListen(
        articlesInfoBlocMock,
        Stream.fromIterable(articlesInfoState),
      );
      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle();
      expect(find.text('fakeTitle1'), findsOneWidget);
      await tester.drag(
        find.text('fakeTitle1'),
        const Offset(0.0, -500),
      );
      await tester.pumpAndSettle(const Duration(microseconds: 500));
      verify(
        () => articlesInfoBloc.add(
          ArticlesInfoEvent.getArticles(
            salesOrg: salesOrgBlocMock.state.salesOrg,
            user: userBlocMock.state.user,
          ),
        ),
      ).called(1);
    });
    testWidgets('The first item should be visible when press scrollToTop',
        (tester) async {
      final articlesInfoState = [
        ArticlesInfoState.initial().copyWith(isFetching: true),
        ArticlesInfoState.initial().copyWith(
          isFetching: false,
          articleInfo: AnnouncementArticleInfo(
            total: 2,
            endCursor: '',
            announcementList: announcementListMock,
          ),
        ),
      ];
      whenListen(
        articlesInfoBlocMock,
        Stream.fromIterable(articlesInfoState),
      );
      await tester.pumpWidget(getWUT());
      await tester.fling(
        find.byType(CustomScrollView),
        const Offset(0.0, -1000.0),
        1000.0,
      );
      await tester.pumpAndSettle();
      expect(find.text('fakeTitle1'), findsNothing);
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();
      expect(find.text('fakeTitle1'), findsOneWidget);
    });
  });
}

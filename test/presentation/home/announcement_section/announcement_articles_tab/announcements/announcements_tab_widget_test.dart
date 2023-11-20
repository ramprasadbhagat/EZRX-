import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_info_bloc.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_info_details/announcement_info_details_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/announcement_info/entities/announcement_article_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/datasource/announcement_info_local.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/home/announcement_section/announcement_articles_tab/announcements/announcements_tab.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../utils/widget_utils.dart';

class AnnouncementInfoBlocMock
    extends MockBloc<AnnouncementInfoEvent, AnnouncementInfoState>
    implements AnnouncementInfoBloc {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class AnnouncementInfoDetailsBlocMock
    extends MockBloc<AnnouncementInfoDetailsEvent, AnnouncementInfoDetailsState>
    implements AnnouncementInfoDetailsBloc {}

final locator = GetIt.instance;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late AnnouncementInfoBloc announcementInfoBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late AnnouncementInfoDetailsBloc announcementInfoDetailsBlocMock;
  late AuthBloc authBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  late AppRouter autoRouterMock;
  late AnnouncementArticleInfo announcementInfo;

  setUpAll(() {
    locator.registerLazySingleton(() => AppRouter());
  });

  Widget getAnnouncementListPage() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      providers: [
        BlocProvider<AnnouncementInfoBloc>(
          create: (context) => announcementInfoBlocMock,
        ),
        BlocProvider<AnnouncementBloc>(
          create: (context) => announcementBlocMock,
        ),
        BlocProvider<AuthBloc>(
          create: (context) => authBlocMock,
        ),
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBlocMock,
        ),
        BlocProvider<AnnouncementInfoDetailsBloc>(
          create: (context) => announcementInfoDetailsBlocMock,
        ),
      ],
      child: const AnnouncementsTab(),
    );
  }

  void verifyAnnouncementTabPage() {
    final announcementListPageKey =
        find.byKey(WidgetKeys.announcementListPageKey);
    expect(announcementListPageKey, findsOneWidget);
  }

  void verifyNoRecordFoundWidget() {
    final announcementNotFoundRecordKey =
        find.byKey(WidgetKeys.announcementNotFoundRecordKey);
    expect(announcementNotFoundRecordKey, findsOneWidget);
  }

  group(
    'Test "announcement_tab" widget test => ',
    () {
      setUp(() async {
        autoRouterMock = locator<AppRouter>();
        announcementInfoBlocMock = AnnouncementInfoBlocMock();
        announcementBlocMock = AnnouncementBlocMock();
        eligibilityBlocMock = EligibilityBlocMock();
        authBlocMock = AuthBlocMock();
        announcementInfoDetailsBlocMock = AnnouncementInfoDetailsBlocMock();
        when(() => announcementInfoBlocMock.state)
            .thenReturn(AnnouncementInfoState.initial());
        when(() => announcementBlocMock.state)
            .thenReturn(AnnouncementState.initial());
        when(() => authBlocMock.state).thenReturn(const AuthState.initial());
        when(() => eligibilityBlocMock.state)
            .thenReturn(EligibilityState.initial());
        when(() => announcementInfoDetailsBlocMock.state)
            .thenReturn(AnnouncementInfoDetailsState.initial());
        announcementInfo =
            await AnnouncementInfoLocalDataSource().getAnnouncementInfo();
      });

      testWidgets(
        'Load announcement_tab with no data',
        (tester) async {
          await tester.pumpWidget(getAnnouncementListPage());
          await tester.pump();
          verifyAnnouncementTabPage();
          verifyNoRecordFoundWidget();
        },
      );

      testWidgets(
        'Load announcement_tab with no data and then pull to refresh',
        (tester) async {
          final handle = tester.ensureSemantics();
          await tester.pumpWidget(getAnnouncementListPage());
          await tester.pump();
          verifyAnnouncementTabPage();
          verifyNoRecordFoundWidget();
          final announcementNotFoundRecordKey =
              find.byKey(WidgetKeys.announcementNotFoundRecordKey);
          await tester.drag(
            announcementNotFoundRecordKey,
            const Offset(0.0, 1000.0),
            warnIfMissed: false,
          );
          await tester.pump(const Duration(seconds: 1));

          expect(
            tester.getSemantics(find.byType(RefreshProgressIndicator)),
            matchesSemantics(
              label: 'Refresh',
            ),
          );

          await tester.pump(const Duration(seconds: 1));
          await tester.pump(const Duration(seconds: 1));
          await tester.pump(const Duration(seconds: 1));
          verify(
            () => announcementInfoBlocMock.add(
              AnnouncementInfoEvent.fetch(
                salesOrg: SalesOrg(''),
              ),
            ),
          ).called(1);
          handle.dispose();
        },
      );

      testWidgets(
        'Load announcement_tab with initially loading and then data shown',
        (tester) async {
          when(() => announcementInfoBlocMock.state).thenReturn(
            AnnouncementInfoState.initial().copyWith(
              isLoading: false,
              announcementInfo: announcementInfo,
            ),
          );

          await tester.pumpWidget(getAnnouncementListPage());
          await tester.pump();
          verifyAnnouncementTabPage();
          final loaderImage = find.byKey(WidgetKeys.loaderImage);
          expect(loaderImage, findsNothing);
        },
      );

      testWidgets(
        'Load announcement_tab with loader',
        (tester) async {
          when(() => announcementInfoBlocMock.state).thenReturn(
            AnnouncementInfoState.initial().copyWith(
              isLoading: true,
            ),
          );
          await tester.pumpWidget(getAnnouncementListPage());
          await tester.pump();
          verifyAnnouncementTabPage();
          final loaderImage = find.byKey(WidgetKeys.loaderImage);
          expect(loaderImage, findsOneWidget);
        },
      );

      testWidgets(
        'Load announcement_tab with loading failure',
        (tester) async {
          final expectedState = Stream.fromIterable(
            [
              AnnouncementInfoState.initial().copyWith(isLoading: true),
              AnnouncementInfoState.initial().copyWith(
                isLoading: false,
                apiFailureOrSuccessOption: optionOf(
                  const Left(
                    ApiFailure.other('BE Error'),
                  ),
                ),
              ),
            ],
          );
          whenListen(announcementInfoBlocMock, expectedState);
          await tester.pumpWidget(getAnnouncementListPage());
          await tester.pumpAndSettle();
          verifyAnnouncementTabPage();
          expect(find.text(('BE Error')), findsOneWidget);
        },
      );

      testWidgets(
        'Load announcement_tab with data',
        (tester) async {
          when(() => announcementInfoBlocMock.state).thenReturn(
            AnnouncementInfoState.initial().copyWith(
              announcementInfo: announcementInfo,
            ),
          );
          await tester.pumpWidget(getAnnouncementListPage());
          await tester.pump();
          verifyAnnouncementTabPage();
          final announcementNotFoundRecordKey =
              find.byKey(WidgetKeys.announcementNotFoundRecordKey);
          expect(announcementNotFoundRecordKey, findsNothing);
          final itemKey =
              find.byKey(Key(announcementInfo.announcementList.first.id));
          expect(itemKey, findsOneWidget);
          final scrollToTopArrowIcon =
              find.byKey(WidgetKeys.scrollToTopArrowIcon);
          expect(scrollToTopArrowIcon, findsNothing);
        },
      );

      testWidgets(
        'Load announcement_tab with data then do onRefresh',
        (tester) async {
          final handle = tester.ensureSemantics();
          when(() => announcementInfoBlocMock.state).thenReturn(
            AnnouncementInfoState.initial().copyWith(
              announcementInfo: announcementInfo,
            ),
          );
          await tester.pumpWidget(getAnnouncementListPage());
          await tester.pump();
          verifyAnnouncementTabPage();
          final announcementNotFoundRecordKey =
              find.byKey(WidgetKeys.announcementNotFoundRecordKey);
          expect(announcementNotFoundRecordKey, findsNothing);
          final itemKey =
              find.byKey(Key(announcementInfo.announcementList.first.id));
          expect(itemKey, findsOneWidget);
          final scrollToTopArrowIcon =
              find.byKey(WidgetKeys.scrollToTopArrowIcon);
          expect(scrollToTopArrowIcon, findsNothing);

          await tester.drag(
            itemKey,
            const Offset(0.0, 1000.0),
            warnIfMissed: false,
          );
          await tester.pump(const Duration(seconds: 1));

          expect(
            tester.getSemantics(find.byType(RefreshProgressIndicator)),
            matchesSemantics(
              label: 'Refresh',
            ),
          );

          await tester.pump(const Duration(seconds: 1));
          await tester.pump(const Duration(seconds: 1));
          await tester.pump(const Duration(seconds: 1));
          verify(
            () => announcementInfoBlocMock.add(
              AnnouncementInfoEvent.fetch(
                salesOrg: SalesOrg(''),
              ),
            ),
          ).called(1);
          handle.dispose();
        },
      );

      testWidgets(
        'Load announcement_tab with data and start scrolling should display scroll to top button',
        (tester) async {
          when(() => announcementInfoBlocMock.state).thenReturn(
            AnnouncementInfoState.initial().copyWith(
              announcementInfo: announcementInfo,
            ),
          );
          await tester.pumpWidget(getAnnouncementListPage());
          await tester.pump();
          verifyAnnouncementTabPage();
          final announcementNotFoundRecordKey =
              find.byKey(WidgetKeys.announcementNotFoundRecordKey);
          expect(announcementNotFoundRecordKey, findsNothing);
          final itemKey =
              find.byKey(Key(announcementInfo.announcementList.first.id));
          expect(itemKey, findsOneWidget);
          final scrollToTopArrowIcon =
              find.byKey(WidgetKeys.scrollToTopArrowIcon);
          expect(scrollToTopArrowIcon, findsNothing);
          final scrollWidget = find.byWidgetPredicate((w) => w is ScrollList);
          expect(scrollWidget, findsOneWidget);
          final itemKey2 =
              find.byKey(Key(announcementInfo.announcementList[3].id));
          expect(itemKey2, findsOneWidget);
          await tester.drag(
            itemKey2,
            const Offset(0, -500),
          );
          await tester.pumpAndSettle();
          await tester.pump(const Duration(seconds: 1));
          await tester.pump(const Duration(seconds: 1));
          expect(itemKey, findsNothing);
          expect(scrollToTopArrowIcon, findsOneWidget);
          await tester.tap(scrollToTopArrowIcon);
          await tester.pumpAndSettle();
          expect(itemKey, findsOneWidget);
        },
      );

      testWidgets(
        'Load announcement_tab with data AND then loadMore',
        (tester) async {
          when(() => announcementInfoBlocMock.state).thenReturn(
            AnnouncementInfoState.initial().copyWith(
              announcementInfo: announcementInfo,
              canLoadMore: true,
            ),
          );
          await tester.pumpWidget(getAnnouncementListPage());
          await tester.pump();
          verifyAnnouncementTabPage();
          final announcementNotFoundRecordKey =
              find.byKey(WidgetKeys.announcementNotFoundRecordKey);
          expect(announcementNotFoundRecordKey, findsNothing);
          final itemKey =
              find.byKey(Key(announcementInfo.announcementList.first.id));
          expect(itemKey, findsOneWidget);
          final scrollToTopArrowIcon =
              find.byKey(WidgetKeys.scrollToTopArrowIcon);
          expect(scrollToTopArrowIcon, findsNothing);
          final itemKey2 =
              find.byKey(Key(announcementInfo.announcementList[3].id));
          expect(itemKey2, findsOneWidget);
          await tester.drag(
            itemKey2,
            const Offset(0, -2000),
          );
          await tester.pump();

          expect(itemKey, findsNothing);
          expect(scrollToTopArrowIcon, findsOneWidget);

          verify(
            () => announcementInfoBlocMock.add(
              AnnouncementInfoEvent.loadMore(
                salesOrg: SalesOrg(''),
              ),
            ),
          ).called(1);
        },
      );

      testWidgets(
        'Load announcement_tab with data and then tap item',
        (tester) async {
          when(() => announcementInfoBlocMock.state).thenReturn(
            AnnouncementInfoState.initial().copyWith(
              announcementInfo: announcementInfo,
            ),
          );
          await tester.pumpWidget(getAnnouncementListPage());

          await tester.pump();
          verifyAnnouncementTabPage();
          final announcementNotFoundRecordKey =
              find.byKey(WidgetKeys.announcementNotFoundRecordKey);
          expect(announcementNotFoundRecordKey, findsNothing);
          final itemKey =
              find.byKey(Key(announcementInfo.announcementList.first.id));
          expect(itemKey, findsOneWidget);
          final scrollToTopArrowIcon =
              find.byKey(WidgetKeys.scrollToTopArrowIcon);
          expect(scrollToTopArrowIcon, findsNothing);
          await tester.tap(itemKey);
          verify(
            () => announcementInfoDetailsBlocMock.add(
              AnnouncementInfoDetailsEvent.fetch(
                itemId: announcementInfo.announcementList.first.id,
                salesOrg: SalesOrg(''),
              ),
            ),
          ).called(1);
        },
      );
    },
  );
}

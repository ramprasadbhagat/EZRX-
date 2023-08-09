import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_info_bloc.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_info_details/announcement_info_details_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/announcement_info/entities/announcement_info_details.dart';
import 'package:ezrxmobile/domain/announcement_info/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/datasource/announcement_info_local.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/home/announcement_section/announcement_articles_tab/announcements/announcement_info_details_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:universal_io/io.dart';

import '../../../../../utils/widget_utils.dart';
import 'announcements_tab_widget_test.dart';

void main() {
  late AnnouncementInfoDetailsBloc announcementInfoDetailsBlocMock;
  late AnnouncementInfoBloc announcementInfoBlocMock;

  late SalesOrgBloc salesOrgBlocMock;
  late AppRouter autoRouterMock;

  final mockAnnouncementInfoDetailsState =
      AnnouncementInfoDetailsState.initial().copyWith(
    isLoading: false,
    announcementInfoDetails: AnnouncementInfoDetails(
      id: '123',
      title: 'Announcement title',
      content: HtmlContent(''),
      summary: 'Summary',
      thumbnail: 'https://picsum.photos/200/300',
      publishedDate: DateTimeStringValue(''),
      manufacturer: Manufacturer('Manufacturer'),
      source: Source(''),
      tag: '',
    ),
  );

  setUpAll(() async {
    HttpOverrides.global = null;
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerLazySingleton(() => AppRouter());
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
    autoRouterMock = locator<AppRouter>();
    announcementInfoDetailsBlocMock = AnnouncementInfoDetailsBlocMock();
    announcementInfoBlocMock = AnnouncementInfoBlocMock();
    salesOrgBlocMock = SalesOrgBlocMock();

    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    when(() => announcementInfoDetailsBlocMock.state)
        .thenReturn(AnnouncementInfoDetailsState.initial());
    when(() => announcementInfoBlocMock.state)
        .thenReturn(AnnouncementInfoState.initial());
  });

  Widget getAnnouncementInfoDetailsPage() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      providers: [
        BlocProvider<AnnouncementInfoBloc>(
          create: (context) => announcementInfoBlocMock,
        ),
        BlocProvider<SalesOrgBloc>(
          create: (context) => salesOrgBlocMock,
        ),
        BlocProvider<AnnouncementInfoDetailsBloc>(
          create: (context) => announcementInfoDetailsBlocMock,
        ),
      ],
      child: const AnnouncementInfoDetailsPage(),
    );
  }

  group('Test "announcement_info_details_page" widget test => ', () {
    testWidgets(
      'when data is loading',
      (tester) async {
        await tester.runAsync(() async {
          when(() => announcementInfoDetailsBlocMock.state).thenReturn(
            AnnouncementInfoDetailsState.initial().copyWith(isLoading: true),
          );
          await tester.pumpWidget(getAnnouncementInfoDetailsPage());
          final announcementInfoDetailsPage =
              find.byKey(WidgetKeys.announcementDetailsPageKey);
          expect(announcementInfoDetailsPage, findsOneWidget);
          final loadingWidgets = find.byKey(WidgetKeys.loaderImage);
          expect(loadingWidgets, findsOneWidget);
        });
      },
    );

    testWidgets(
      'when data is loaded',
      (tester) async {
        await tester.runAsync(() async {
          when(() => announcementInfoDetailsBlocMock.state).thenReturn(
            mockAnnouncementInfoDetailsState,
          );
          final mockAnnouncementInfo =
              await AnnouncementInfoLocalDataSource().getAnnouncementInfo();
          when(() => announcementInfoBlocMock.state).thenReturn(
            AnnouncementInfoState.initial().copyWith(
              announcementInfo: mockAnnouncementInfo,
            ),
          );
          await tester.pumpFrames(
            getAnnouncementInfoDetailsPage(),
            const Duration(seconds: 5),
          );
          final announcementInfoDetailsPage =
              find.byKey(WidgetKeys.announcementDetailsPageKey);
          expect(announcementInfoDetailsPage, findsOneWidget);
          final announcementDetailsItem = find.byKey(
            WidgetKeys.announcementDetailsItem('0'),
          );
          expect(announcementDetailsItem, findsOneWidget);
        });
      },
    );

    testWidgets(
      'tap announcement item',
      (tester) async {
        await tester.runAsync(() async {
          when(() => announcementInfoDetailsBlocMock.state).thenReturn(
            mockAnnouncementInfoDetailsState,
          );
          final mockAnnouncementInfo =
              await AnnouncementInfoLocalDataSource().getAnnouncementInfo();
          when(() => announcementInfoBlocMock.state).thenReturn(
            AnnouncementInfoState.initial().copyWith(
              announcementInfo: mockAnnouncementInfo,
            ),
          );
          await tester.pumpFrames(
            getAnnouncementInfoDetailsPage(),
            const Duration(seconds: 5),
          );
          final announcementInfoDetailsPage =
              find.byKey(WidgetKeys.announcementDetailsPageKey);
          expect(announcementInfoDetailsPage, findsOneWidget);
          final announcementDetailsItem = find.byKey(
            WidgetKeys.announcementDetailsItem('0'),
          );
          expect(announcementDetailsItem, findsOneWidget);
          await tester.ensureVisible(announcementDetailsItem);
          await tester.tap(announcementDetailsItem);
        });
      },
    );

    testWidgets(
      'tap back button',
      (tester) async {
        await tester.runAsync(() async {
          when(() => announcementInfoDetailsBlocMock.state).thenReturn(
            mockAnnouncementInfoDetailsState,
          );
          final mockAnnouncementInfo =
              await AnnouncementInfoLocalDataSource().getAnnouncementInfo();
          when(() => announcementInfoBlocMock.state).thenReturn(
            AnnouncementInfoState.initial().copyWith(
              announcementInfo: mockAnnouncementInfo,
            ),
          );
          await tester.pumpFrames(
            getAnnouncementInfoDetailsPage(),
            const Duration(seconds: 5),
          );
          final announcementInfoDetailsPage =
              find.byKey(WidgetKeys.announcementDetailsPageKey);
          expect(announcementInfoDetailsPage, findsOneWidget);
          final backButton =
              find.byKey(WidgetKeys.announcementDetailsBackButton);
          expect(backButton, findsOneWidget);
          await tester.ensureVisible(backButton);
          await tester.tap(backButton);
        });
      },
    );
  });
}

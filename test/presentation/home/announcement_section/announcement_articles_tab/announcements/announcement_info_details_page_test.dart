import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_attachment_bloc/announcement_attachment_bloc.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_info_bloc.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_info_details/announcement_info_details_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/announcement_info/entities/announcement_info_details.dart';
import 'package:ezrxmobile/domain/announcement_info/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/datasource/announcement_info_local.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/home/announcement_section/announcement_articles_tab/announcements/announcement_info_details_page.dart';
import 'package:ezrxmobile/presentation/home/announcement_section/announcement_articles_tab/announcements/widgets/new_announcement_icon.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:universal_io/io.dart';

import '../../../../../utils/widget_utils.dart';
import 'announcements_tab_widget_test.dart';

class AnnouncementAttachmentBlocMock
    extends MockBloc<AnnouncementAttachmentEvent, AnnouncementAttachmentState>
    implements AnnouncementAttachmentBloc {}

void main() {
  late AnnouncementInfoDetailsBloc announcementInfoDetailsBlocMock;
  late AnnouncementInfoBloc announcementInfoBlocMock;
  late AnnouncementAttachmentBloc announcementAttachmentBlocMock;

  late SalesOrgBloc salesOrgBlocMock;
  late AppRouter autoRouterMock;
  late AnnouncementInfoDetails moclAnnouncementInfoDetails;

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
      releaseDate: DateTimeStringValue('20240101'),
      manufacturer: Manufacturer('Manufacturer'),
      source: Source(''),
      tag: '',
      documents: [],
    ),
  );

  setUpAll(() async {
    HttpOverrides.global = null;
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerLazySingleton(() => AppRouter());
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
    locator.registerFactory<AnnouncementAttachmentBloc>(
      () => announcementAttachmentBlocMock,
    );
    autoRouterMock = locator<AppRouter>();
    announcementInfoDetailsBlocMock = AnnouncementInfoDetailsBlocMock();
    announcementAttachmentBlocMock = AnnouncementAttachmentBlocMock();
    announcementInfoBlocMock = AnnouncementInfoBlocMock();
    salesOrgBlocMock = SalesOrgBlocMock();
    moclAnnouncementInfoDetails =
        await AnnouncementInfoLocalDataSource().getAnnouncementInfoDetails();

    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    when(() => announcementInfoDetailsBlocMock.state)
        .thenReturn(AnnouncementInfoDetailsState.initial());
    when(() => announcementInfoBlocMock.state)
        .thenReturn(AnnouncementInfoState.initial());
    when(() => announcementAttachmentBlocMock.state)
        .thenReturn(AnnouncementAttachmentState.initial());
  });

  Widget getAnnouncementInfoDetailsPage() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
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
        BlocProvider<AnnouncementAttachmentBloc>(
          create: (context) => announcementAttachmentBlocMock,
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
          await tester.pump();
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
      'Tap scrollToTopArrowIcon button',
      (tester) async {
        await tester.runAsync(() async {
          when(() => announcementInfoDetailsBlocMock.state).thenReturn(
            AnnouncementInfoDetailsState.initial().copyWith(
              isLoading: false,
              announcementInfoDetails: moclAnnouncementInfoDetails,
            ),
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
          await tester.pump();
          final scrollToTopArrowIcon =
              find.byKey(WidgetKeys.materialDetailsFloatingButton);
          final customScrollView =
              find.byKey(WidgetKeys.announcementInfoDetailList);
          await tester.drag(
            customScrollView,
            const Offset(0, -200),
            warnIfMissed: false,
          );
          await tester.pump(const Duration(seconds: 1));
          await tester.pump(const Duration(seconds: 1));
          await tester.pump(const Duration(seconds: 1));
          await tester.pump(const Duration(seconds: 1));
          expect(scrollToTopArrowIcon, findsOneWidget);
          await tester.tap(scrollToTopArrowIcon);
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

    testWidgets(
      'tap announcement Details Bottom Back Button',
      (tester) async {
        await tester.runAsync(() async {
          final content =
              moclAnnouncementInfoDetails.content.value.getOrElse(() => '');
          when(() => announcementInfoDetailsBlocMock.state).thenReturn(
            AnnouncementInfoDetailsState.initial().copyWith(
              isLoading: false,
              announcementInfoDetails: moclAnnouncementInfoDetails.copyWith(
                content: HtmlContent(content * 10),
              ),
            ),
          );
          await tester.pumpFrames(
            getAnnouncementInfoDetailsPage(),
            const Duration(seconds: 5),
          );
          final announcementInfoDetailsPage =
              find.byKey(WidgetKeys.announcementDetailsPageKey);
          expect(announcementInfoDetailsPage, findsOneWidget);
          await tester.dragFrom(
            const Offset(100, 400),
            const Offset(100, -221),
          );
          await tester.pump(const Duration(seconds: 4));
          final backButton =
              find.byKey(WidgetKeys.announcementDetailsBottomBackButtonKey);
          expect(backButton, findsOneWidget);
          await tester.ensureVisible(backButton);
          await tester.tap(backButton);
        });
      },
    );
    testWidgets(
      'test error section while faceing some error in data fatching',
      (tester) async {
        await tester.runAsync(() async {
          when(() => announcementInfoDetailsBlocMock.state).thenReturn(
            AnnouncementInfoDetailsState.initial().copyWith(
              isLoading: false,
              apiFailureOrSuccessOption:
                  optionOf(const Left(ApiFailure.other('Some Error'))),
            ),
          );
          final expectedState = [
            AnnouncementInfoDetailsState.initial().copyWith(
              isLoading: true,
              apiFailureOrSuccessOption: none(),
            ),
            AnnouncementInfoDetailsState.initial().copyWith(
              isLoading: false,
              apiFailureOrSuccessOption:
                  optionOf(const Left(ApiFailure.other('Some Error'))),
            ),
          ];
          whenListen(
            announcementInfoDetailsBlocMock,
            Stream.fromIterable(expectedState),
          );
          await tester.pumpFrames(
            getAnnouncementInfoDetailsPage(),
            const Duration(seconds: 5),
          );
          final announcementInfoDetailsPage =
              find.byKey(WidgetKeys.announcementDetailsPageKey);
          expect(announcementInfoDetailsPage, findsOneWidget);
          final errorSnackBar = find.byKey(WidgetKeys.customSnackBar);
          expect(errorSnackBar, findsOneWidget);
        });
      },
    );

    testWidgets(
      'Test New AnnounceMent Icon not visible for announcements that has been released before 7 days from now',
      (tester) async {
        await tester.runAsync(() async {
          when(() => announcementInfoDetailsBlocMock.state).thenReturn(
            mockAnnouncementInfoDetailsState,
          );

          await tester.pumpFrames(
            getAnnouncementInfoDetailsPage(),
            const Duration(seconds: 5),
          );
          final announcementInfoDetailsPage =
              find.byKey(WidgetKeys.announcementDetailsPageKey);
          expect(announcementInfoDetailsPage, findsOneWidget);
          final newIcon = find.byType(NewAnnouncementIcon);
          expect(newIcon, findsNothing);
        });
      },
    );
  });
}

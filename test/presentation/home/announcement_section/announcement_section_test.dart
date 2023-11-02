import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_info_bloc.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_info_details/announcement_info_details_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/announcement_info/datasource/announcement_info_local.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/home/announcement_section/announcement_section.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/locator.dart';

import '../../../utils/widget_utils.dart';

class AnnouncementInfoBlocMock
    extends MockBloc<AnnouncementInfoEvent, AnnouncementInfoState>
    implements AnnouncementInfoBloc {}

class AnnouncementInfoDetailsBlocMock
    extends MockBloc<AnnouncementInfoDetailsEvent, AnnouncementInfoDetailsState>
    implements AnnouncementInfoDetailsBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  final announcementArticleInfo =
      await AnnouncementInfoLocalDataSource().getAnnouncementInfo();
  final announcementInfoBloc = AnnouncementInfoBlocMock();
  final announcementInfoDetailsBloc = AnnouncementInfoDetailsBlocMock();
  final eligibilityBloc = EligibilityBlocMock();
  locator.registerLazySingleton(() => AppRouter());
  locator.registerLazySingleton(() => announcementInfoBloc);
  final autoRouterMock = locator<AppRouter>();

  group('Announcement Section - ', () {
    setUp(() {
      when(() => announcementInfoBloc.state)
          .thenReturn(AnnouncementInfoState.initial());
      when(() => announcementInfoDetailsBloc.state)
          .thenReturn(AnnouncementInfoDetailsState.initial());
      when(() => eligibilityBloc.state).thenReturn(EligibilityState.initial());
    });
    RouteDataScope getWUT() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        providers: [
          BlocProvider<AnnouncementInfoBloc>(
            create: (context) => announcementInfoBloc,
          ),
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBloc,
          ),
          BlocProvider<AnnouncementInfoDetailsBloc>(
            create: (context) => announcementInfoDetailsBloc,
          ),
        ],
        child: const Scaffold(body: AnnouncementSection()),
      );
    }

    testWidgets('Loading state', (tester) async {
      final announcementInfoExpectState = [
        AnnouncementInfoState.initial().copyWith(
          isLoading: true,
        ),
      ];
      whenListen(
        announcementInfoBloc,
        Stream.fromIterable(announcementInfoExpectState),
      );
      await tester.pumpWidget(getWUT());
      await tester.pump(const Duration(seconds: 1));
      await tester.pump();

      expect(find.byType(LoadingShimmer), findsOneWidget);
    });

    testWidgets('List fetched', (tester) async {
      when(() => announcementInfoBloc.state).thenReturn(
        AnnouncementInfoState.initial().copyWith(
          announcementInfo: announcementArticleInfo,
        ),
      );
      await tester.pumpWidget(getWUT());
      await tester.pump();

      expect(find.byKey(WidgetKeys.announcementIcon), findsOneWidget);
      expect(find.byKey(WidgetKeys.announcementsList), findsWidgets);
      expect(find.text('New'.tr()), findsWidgets);
    });

    testWidgets('section button Tapped', (tester) async {
      when(() => announcementInfoBloc.state).thenReturn(
        AnnouncementInfoState.initial().copyWith(
          announcementInfo: announcementArticleInfo,
        ),
      );
      await tester.pumpWidget(getWUT());
      await tester.pump();

      final announcementIconButton = find.byKey(WidgetKeys.announcementIcon);
      expect(announcementIconButton, findsOneWidget);
      await tester.tap(find.byKey(WidgetKeys.sectionTileIcon('Announcements'.tr())));
      expect(autoRouterMock.current.path, 'announcements_page');
    });

    testWidgets('Item Tapped', (tester) async {
      final salesOrg = SalesOrg('2201');
      when(() => announcementInfoBloc.state).thenReturn(
        AnnouncementInfoState.initial().copyWith(
          announcementInfo: announcementArticleInfo,
        ),
      );
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: salesOrg),
        ),
      );
      await tester.pumpWidget(getWUT());
      await tester.pump();

      expect(find.byKey(WidgetKeys.announcementIcon), findsOneWidget);
      final firstItem = find.byKey(WidgetKeys.announcementsList).first;
      expect(firstItem, findsOneWidget);

      await tester.tap(firstItem);
      verify(
        () => announcementInfoDetailsBloc.add(
          AnnouncementInfoDetailsEvent.fetch(
            itemId: '532E19B7CF044A1D92DA00B2A551FC34',
            salesOrg: salesOrg,
          ),
        ),
      ).called(1);
      expect(autoRouterMock.current.path, 'announcement_info_details');
    });
  });
}

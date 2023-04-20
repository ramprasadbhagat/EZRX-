import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/account/contact_us/contact_us_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';
import '../../order_history/order_history_details_widget_test.dart';

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

void main() {
  final binding = TestWidgetsFlutterBinding.ensureInitialized();

  WidgetsFlutterBinding.ensureInitialized();
  late SalesOrgBloc salesOrgBlocMock;
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late AppRouter autoRouterMock;
  setUpAll(() async {
    setupLocator();
    locator<MixpanelService>().init(mixpanel: MixpanelMock());
  });

  group('Contact Us Page', () {
    setUp(() {
      autoRouterMock = locator<AppRouter>();
      salesOrgBlocMock = SalesOrgBlocMock();
      authBlocMock = AuthBlocMock();
      announcementBlocMock = AnnouncementBlocMock();
      when(() => salesOrgBlocMock.state)
          .thenReturn(SalesOrgState.initial().copyWith(
        salesOrganisation:
            SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2001')),
      ));
      when(() => authBlocMock.state).thenReturn(const AuthState.initial());
      when(() => announcementBlocMock.state)
          .thenReturn(AnnouncementState.initial());
    });

    StackRouterScope getScopedWidget() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<SalesOrgBloc>(create: (context) => salesOrgBlocMock),
          BlocProvider<AuthBloc>(create: (context) => authBlocMock),
          BlocProvider<AnnouncementBloc>(
              create: (context) => announcementBlocMock),
        ],
        child: const ContactUsPage(),
      );
    }

    testWidgets('Load contact_us widget', (tester) async {
      await tester.pumpWidget(getScopedWidget());
      final titleFinder = find.text('Contact Us'.tr());
      final finder = find.byWidgetPredicate((w) => w is ListTile);
      expect(find.byType(Scaffold), findsOneWidget);
      expect(titleFinder, findsOneWidget);
      expect(finder, findsAtLeastNWidgets(2));
      expect(find.byType(Scaffold), findsOneWidget);
      expect(titleFinder, findsOneWidget);
    });

    testWidgets('Name Tile Widget Test', (widgetTester) async {
      final expectedStates = [
        SalesOrgState.initial().copyWith(
            salesOrganisation:
                SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('3090'))),
      ];
      whenListen(salesOrgBlocMock, Stream.fromIterable(expectedStates));
      await widgetTester.pumpWidget(getScopedWidget());
      final salesOrgEmail =
          salesOrgBlocMock.state.salesOrganisation.salesOrg.contactPersonName;
      final salesOrgName =
          salesOrgBlocMock.state.salesOrganisation.salesOrg.contactPersonName;

      final nameTile = find.byKey(const Key('nameTile'));
      final emailTile = find.byKey(const Key('emailTile'));
      final phoneNumberTile = find.byKey(const Key('phoneNumberTile'));
      final emailTxt = find.text(salesOrgEmail);
      final personNameTxt = find.text(salesOrgName);
      await widgetTester.pumpAndSettle();
      expect(nameTile, findsOneWidget);
      expect(emailTile, findsOneWidget);
      expect(emailTxt, findsOneWidget);
      expect(personNameTxt, findsOneWidget);
      expect(phoneNumberTile, findsOneWidget);

      await widgetTester.tap(emailTile);
      await widgetTester.pumpAndSettle();

      await widgetTester.tap(phoneNumberTile);
      await widgetTester.pumpAndSettle();
    });

    testWidgets('Screen size test', (tester) async {
      final expectedStates = [
        SalesOrgState.initial().copyWith(
            salesOrganisation:
                SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('3090'))),
      ];
      whenListen(salesOrgBlocMock, Stream.fromIterable(expectedStates));
      await tester.pumpWidget(getScopedWidget());
      await binding.setSurfaceSize(const Size(400, 800));
      expect(find.byType(ListTile), findsAtLeastNWidgets(2));
      await tester.pumpAndSettle();

      whenListen(salesOrgBlocMock, Stream.fromIterable(expectedStates));
      await binding.setSurfaceSize(const Size(392.72, 802.90));
      expect(find.byType(ListTile), findsAtLeastNWidgets(2));
      await tester.pumpAndSettle();
    });
  });
}

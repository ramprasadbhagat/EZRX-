import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/notification/notification_bloc.dart';
import 'package:ezrxmobile/application/returns/return_summary_details/return_summary_details_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/notification/entities/notification.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_code_local.dart';
import 'package:ezrxmobile/infrastructure/notification/datasource/notification_local.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/notification/notification_tab.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/widget_utils.dart';

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class ReturnSummaryDetailsBlocMock
    extends MockBloc<ReturnSummaryDetailsEvent, ReturnSummaryDetailsState>
    implements ReturnSummaryDetailsBloc {}

class AutoRouterMock extends Mock implements AppRouter {}

class MockNotificationBloc
    extends MockBloc<NotificationEvent, NotificationState>
    implements NotificationBloc {}

final locator = GetIt.instance;
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  late UserBloc userBlocMock;
  late AppRouter autoRouterMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late NotificationBloc notificationBlocMock;
  late Notifications notifications;
  late List<CustomerCodeInfo> customerCodeListMock;
  late ReturnSummaryDetailsBloc returnSummaryDetailsBlocMock;

  setUpAll(() {
    locator.registerLazySingleton(() => AppRouter());
  });
  group('Notification Screen', () {
    setUp(() async {
      userBlocMock = UserBlocMock();
      autoRouterMock = locator<AppRouter>();
      customerCodeBlocMock = CustomerCodeBlocMock();
      notificationBlocMock = MockNotificationBloc();
      returnSummaryDetailsBlocMock = ReturnSummaryDetailsBlocMock();
      when(() => userBlocMock.state).thenReturn(UserState.initial());
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => notificationBlocMock.state)
          .thenReturn(NotificationState.initial());
      notifications = await NotificationLocalDataSource().getNotificationList();
      customerCodeListMock =
          await CustomerCodeLocalDataSource().getCustomerCodeList();
    });
    Widget getScopedWidget() {
      return EasyLocalization(
        supportedLocales: const [
          Locale('en'),
        ],
        path: 'assets/langs/langs.csv',
        startLocale: const Locale('en'),
        fallbackLocale: const Locale('en'),
        saveLocale: true,
        useOnlyLangCode: true,
        assetLoader: CsvAssetLoader(),
        child: WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          providers: [
            BlocProvider<UserBloc>(create: (context) => userBlocMock),
            BlocProvider<CustomerCodeBloc>(
              create: (context) => customerCodeBlocMock,
            ),
            BlocProvider<NotificationBloc>(
              create: (context) => notificationBlocMock,
            ),
             BlocProvider<ReturnSummaryDetailsBloc>(
              create: (context) => returnSummaryDetailsBlocMock,
            ),
          ],
          child: const Material(child: NotificationTab()),
        ),
      );
    }

    testWidgets('Load notification_tab widget', (tester) async {
      await tester.pumpWidget(getScopedWidget());
      final titleFinder = find.text('Notifications'.tr());
      expect(find.byType(Scaffold), findsOneWidget);
      expect(titleFinder, findsOneWidget);

      await tester.pump();
      final deleteIcon = find.byIcon(
        Icons.delete_outline,
      );
      expect(deleteIcon, findsOneWidget);

      await tester.tap(
        deleteIcon,
        warnIfMissed: true,
      );
      await tester.pump(const Duration(seconds: 1));
      verify(
        () => notificationBlocMock.add(
          const NotificationEvent.deleteAllNotifications(),
        ),
      ).called(1);
    });
    testWidgets('loaderImage  test ', (tester) async {
      when(() => notificationBlocMock.state).thenReturn(
        NotificationState.initial().copyWith(
          isFetching: true,
          notificationList: Notifications.empty(),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final loaderImage = find.byKey(
        WidgetKeys.loaderImage,
      );
      expect(loaderImage, findsOneWidget);
    });
    testWidgets('NoRecordFound test ', (tester) async {
      when(() => notificationBlocMock.state).thenReturn(
        NotificationState.initial().copyWith(
          isFetching: false,
          notificationList: Notifications.empty(),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final noRecordFoundWidget = find.byType(
        NoRecordFound,
      );
      expect(noRecordFoundWidget, findsOneWidget);
    });
    testWidgets('=> Body Test onRefresh', (tester) async {
      when(() => notificationBlocMock.state).thenReturn(
        NotificationState.initial().copyWith(
          isFetching: false,
          notificationList: Notifications.empty(),
        ),
      );
      final handle = tester.ensureSemantics();
      await tester.pumpWidget(getScopedWidget());
      await tester.pump(const Duration(milliseconds: 100));

      final notificationNotFoundRecordKey =
          find.byKey(WidgetKeys.notificationNotFoundRecordKey);
      await tester.drag(
        notificationNotFoundRecordKey,
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
        () => notificationBlocMock.add(
          const NotificationEvent.fetch(),
        ),
      ).called(1);
      handle.dispose();
    });
    testWidgets(
      'Load notification_tab with  data ',
      (tester) async {
        when(() => notificationBlocMock.state).thenReturn(
          NotificationState.initial().copyWith(
            notificationList: notifications,
            isFetching: false,
            isReadNotification: true,
          ),
        );
        when(() => userBlocMock.state).thenReturn(
          UserState.initial().copyWith(
            user: User.empty().copyWith(
              role: Role.empty().copyWith(
                type: RoleType('external_sales_rep'),
              ),
            ),
          ),
        );
        when(() => customerCodeBlocMock.state).thenReturn(
          CustomerCodeState.initial().copyWith(
            customerCodeInfo: customerCodeListMock.first,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final customerDetails = find.text(
          '${customerCodeListMock.first.customerName}(${customerCodeListMock.first.customerCodeSoldTo})',
        );
        expect(customerDetails, findsNWidgets(5));
        final itemKey =
            find.byKey(Key(notifications.notificationData.first.description));
        expect(itemKey, findsOneWidget);
        await tester.tap(
          itemKey,
          warnIfMissed: true,
        );
        await tester.pump(const Duration(seconds: 1));
        verify(
          () => notificationBlocMock.add(
            NotificationEvent.readNotifications(
              notificationId: notifications.notificationData.first.id,
            ),
          ),
        ).called(1);
      },
    );
    testWidgets('Test SnackBarMessage when delete the notification ',
        (tester) async {
      when(() => notificationBlocMock.state).thenReturn(
        NotificationState.initial().copyWith(
          isDeletedAllSuccess: false,
          notificationList: notifications,
          isFetching: false,
          isReadNotification: false,
        ),
      );
      final expectedStates = [
        NotificationState.initial().copyWith(
          notificationList: notifications,
          isDeletedAllSuccess: true,
          isFetching: true,
          isReadNotification: true,
        ),
      ];
      whenListen(notificationBlocMock, Stream.fromIterable(expectedStates));
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));
      final msg = find.textContaining(
        'Notification has been deleted'.tr(),
      );
      expect(msg, findsOneWidget);
    });
    testWidgets(
      'Load notification list with data AND then loadMore',
      (tester) async {
        when(() => notificationBlocMock.state).thenReturn(
          NotificationState.initial().copyWith(
            notificationList: Notifications.empty().copyWith(
              notificationData: [
                ...notifications.notificationData,
                ...notifications.notificationData
              ],
            ),
            canLoadMore: true,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final itemKey =
            find.byKey(Key(notifications.notificationData.first.description));
        expect(itemKey, findsWidgets);

        final itemKey2 =
            find.byKey(Key(notifications.notificationData[4].description));
        expect(itemKey2, findsOneWidget);
        await tester.drag(
          itemKey2,
          const Offset(0, -10000),
        );

        await tester.pumpAndSettle();

        verify(
          () => notificationBlocMock.add(
            const NotificationEvent.loadMore(),
          ),
        ).called(1);
      },
    );
  });
}

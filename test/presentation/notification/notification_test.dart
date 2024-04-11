import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/notification/notification_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary_details/payment_summary_details_bloc.dart';
import 'package:ezrxmobile/application/returns/return_summary_details/return_summary_details_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_information.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/notification/entities/notification.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_code_local.dart';
import 'package:ezrxmobile/infrastructure/notification/datasource/notification_local.dart';
import 'package:ezrxmobile/presentation/core/market_place/market_place_icon.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/notification/notification_tab.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../common_mock_data/customer_code_mock.dart';
import '../../common_mock_data/sales_org_config_mock/fake_my_sales_org_config.dart';
import '../../common_mock_data/sales_organsiation_mock.dart';
import '../../common_mock_data/user_mock.dart';
import '../../utils/widget_utils.dart';

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class ReturnSummaryDetailsBlocMock
    extends MockBloc<ReturnSummaryDetailsEvent, ReturnSummaryDetailsState>
    implements ReturnSummaryDetailsBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class PaymentSummaryDetailsBlocMock
    extends MockBloc<PaymentSummaryDetailsEvent, PaymentSummaryDetailsState>
    implements PaymentSummaryDetailsBloc {}

class ViewByOrderDetailBlocMock
    extends MockBloc<ViewByOrderDetailsEvent, ViewByOrderDetailsState>
    implements ViewByOrderDetailsBloc {}

class ViewByItemDetailBlocMock
    extends MockBloc<ViewByItemDetailsEvent, ViewByItemDetailsState>
    implements ViewByItemDetailsBloc {}

class AutoRouterMock extends Mock implements AppRouter {}

class MockNotificationBloc
    extends MockBloc<NotificationEvent, NotificationState>
    implements NotificationBloc {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

final locator = GetIt.instance;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  late AnnouncementBloc announcementBlocMock;
  late UserBloc userBlocMock;
  late AppRouter autoRouterMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  late NotificationBloc notificationBlocMock;
  late Notifications notifications;
  late CustomerInformation customerInformationMock;
  late ReturnSummaryDetailsBloc returnSummaryDetailsBlocMock;
  late PaymentSummaryDetailsBloc paymentSummaryDetailsBlockMock;
  late ViewByOrderDetailsBloc viewByOrderDetailsBlocMock;
  late ViewByItemDetailsBloc viewByItemDetailsBlocMock;

  setUpAll(() async {
    locator.registerLazySingleton(() => AppRouter());
    notifications = await NotificationLocalDataSource().getNotificationList();
    customerInformationMock =
        await CustomerCodeLocalDataSource().getCustomerCodeList();
  });
  group('Notification Screen', () {
    setUp(() async {
      announcementBlocMock = AnnouncementBlocMock();
      userBlocMock = UserBlocMock();
      autoRouterMock = locator<AppRouter>();
      customerCodeBlocMock = CustomerCodeBlocMock();
      eligibilityBlocMock = EligibilityBlocMock();
      paymentSummaryDetailsBlockMock = PaymentSummaryDetailsBlocMock();
      notificationBlocMock = MockNotificationBloc();
      returnSummaryDetailsBlocMock = ReturnSummaryDetailsBlocMock();
      eligibilityBlocMock = EligibilityBlocMock();
      viewByItemDetailsBlocMock = ViewByItemDetailBlocMock();
      viewByOrderDetailsBlocMock = ViewByOrderDetailBlocMock();
      when(() => announcementBlocMock.state)
          .thenReturn(AnnouncementState.initial());
      when(() => eligibilityBlocMock.state)
          .thenReturn(EligibilityState.initial());
      when(() => paymentSummaryDetailsBlockMock.state)
          .thenReturn(PaymentSummaryDetailsState.initial());
      when(() => userBlocMock.state).thenReturn(UserState.initial());
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => notificationBlocMock.state)
          .thenReturn(NotificationState.initial());
      when(() => viewByItemDetailsBlocMock.state)
          .thenReturn(ViewByItemDetailsState.initial());
      when(() => viewByOrderDetailsBlocMock.state)
          .thenReturn(ViewByOrderDetailsState.initial());
    });
    Widget getScopedWidget() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        providers: [
          BlocProvider<AnnouncementBloc>(
            create: (context) => announcementBlocMock,
          ),
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
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBlocMock,
          ),
          BlocProvider<PaymentSummaryDetailsBloc>(
            create: (context) => paymentSummaryDetailsBlockMock,
          ),
          BlocProvider<ViewByItemDetailsBloc>(
            create: (context) => viewByItemDetailsBlocMock,
          ),
          BlocProvider<ViewByOrderDetailsBloc>(
            create: (context) => viewByOrderDetailsBlocMock,
          ),
        ],
        child: const Material(child: NotificationTab()),
      );
    }

    testWidgets('Load notification_tab widget', (tester) async {
      when(() => notificationBlocMock.state).thenReturn(
        NotificationState.initial().copyWith(
          notificationList: notifications,
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final titleFinder = find.text('Notifications'.tr());
      expect(find.byType(Scaffold), findsOneWidget);
      expect(titleFinder, findsOneWidget);

      await tester.pump();
      final deleteIcon = find.byIcon(
        Icons.delete_outline,
      );
      expect(deleteIcon, findsOneWidget);

      await tester.tap(deleteIcon);
      await tester.pumpAndSettle();

      final confirmBtn = find.byKey(WidgetKeys.confirmBottomSheetConfirmButton);
      await tester.tap(confirmBtn);

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
      final noRecordFoundWidget = find.byType(NoRecordFound);

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

      await tester.pumpAndSettle();
      verify(
        () => notificationBlocMock.add(
          const NotificationEvent.fetch(),
        ),
      ).called(1);
      handle.dispose();
    });
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
      await tester.pumpFrames(
        getScopedWidget(),
        const Duration(seconds: 1),
      );
      final msg = find.textContaining(
        'Notification has been deleted',
      );
      expect(msg, findsOneWidget);
      await tester.pump();
    });
    testWidgets(
      'Load notification list with data AND then loadMore',
      (tester) async {
        when(() => notificationBlocMock.state).thenReturn(
          NotificationState.initial().copyWith(
            notificationList: Notifications.empty().copyWith(
              notificationData: [
                ...notifications.notificationData,
                ...notifications.notificationData,
              ],
            ),
            canLoadMore: true,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();

        final itemKey = find.byKey(
          WidgetKeys.genericKey(
            key: notifications.notificationData.first.description,
          ),
        );
        expect(itemKey, findsWidgets);
        await tester.drag(itemKey.first, const Offset(0, -1000));
        await tester.pump();

        verify(
          () => notificationBlocMock.add(
            const NotificationEvent.loadMore(),
          ),
        ).called(1);
      },
    );

    testWidgets(
      'Stop Navigate to Return page when disableReturn true',
      (tester) async {
        final fakeUser = User.empty().copyWith(
          username: Username('fake-user'),
          role: Role.empty().copyWith(
            type: RoleType('client_user'),
          ),
          disableReturns: true,
        );
        when(() => notificationBlocMock.state).thenReturn(
          NotificationState.initial().copyWith(
            notificationList: notifications,
            isFetching: false,
            isReadNotification: true,
          ),
        );

        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: fakeUser,
          ),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final itemKey = find.byKey(
          WidgetKeys.genericKey(
            key: notifications.notificationData.first.description,
          ),
        );
        final snackBarFinder = find.byKey(WidgetKeys.customSnackBar);
        expect(itemKey, findsOneWidget);
        await tester.tap(itemKey);
        await tester.pumpAndSettle();
        expect(snackBarFinder, findsOneWidget);
        final msg = find.textContaining(
          "You don't have access".tr(),
        );
        expect(msg, findsOneWidget);
        expect(
          autoRouterMock.current.name ==
              'ReturnRequestSummaryByItemDetailsRoute',
          false,
        );
      },
    );

    testWidgets('Should navigate to view by order detail when eligible',
        (tester) async {
      final fakeUser = User.empty().copyWith.role(type: RoleType('root_admin'));
      final notificationList = notifications.notificationData
          .where((e) => e.isOrderEligible)
          .toList();
      when(() => notificationBlocMock.state).thenReturn(
        NotificationState.initial().copyWith(
          notificationList:
              notifications.copyWith(notificationData: notificationList),
        ),
      );

      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          user: fakeUser,
          customerCodeInfo: fakeCustomerCodeInfo,
          shipToInfo: fakeShipToInfo,
          salesOrgConfigs: fakeMYSalesOrgConfigs,
          salesOrganisation: fakeSalesOrganisation,
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final itemKey = find.byKey(
        WidgetKeys.genericKey(key: notificationList.first.description),
      );

      expect(itemKey, findsOneWidget);
      await tester.tap(itemKey);
      await tester.pumpAndSettle();
      verify(
        () => viewByOrderDetailsBlocMock.add(
          ViewByOrderDetailsEvent.fetch(
            orderNumber: notificationList.first.orderNumber,
          ),
        ),
      ).called(1);

      verify(
        () => viewByItemDetailsBlocMock.add(
          ViewByItemDetailsEvent.searchOrderHistory(
            searchKey: SearchKey(notificationList.first.orderNumber.getValue()),
          ),
        ),
      );
    });

    testWidgets(
      'Stop Navigate to ViewbyOrderDetails page when userCanAccessOrderHistory false',
      (tester) async {
        final fakeUser = User.empty().copyWith(
          username: Username('fake-user'),
          role: Role.empty().copyWith(
            type: RoleType('root_admin'),
          ),
          disableReturns: true,
        );
        when(() => notificationBlocMock.state).thenReturn(
          NotificationState.initial().copyWith(
            notificationList: notifications,
            isFetching: false,
            isReadNotification: true,
          ),
        );
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            user: fakeUser,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final itemKey = find.byKey(
          WidgetKeys.genericKey(
            key: notifications.notificationData.first.description,
          ),
        );
        expect(itemKey, findsOneWidget);
        await tester.tap(itemKey);
        await tester.pumpAndSettle();
        expect(
          autoRouterMock.current.name == 'view_by_order_details_page',
          false,
        );
      },
    );

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
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            customerCodeInfo: customerInformationMock.soldToInformation.first,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();

        final itemKey = find.byKey(
          WidgetKeys.genericKey(
            key: notifications.notificationData.first.description,
          ),
        );
        expect(itemKey, findsOneWidget);
        await tester.tap(itemKey);
        await tester.pumpAndSettle();
        verify(
          () => notificationBlocMock.add(
            NotificationEvent.readNotifications(
              notificationId: notifications.notificationData.first.id,
            ),
          ),
        ).called(1);
      },
    );

    testWidgets(
      'Test User selected customerCodeInfo not visible in notificationList',
      (tester) async {
        when(() => notificationBlocMock.state).thenReturn(
          NotificationState.initial().copyWith(notificationList: notifications),
        );
        when(() => userBlocMock.state).thenReturn(
          UserState.initial().copyWith(
            user: fakeExternalSalesRepUser,
          ),
        );
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            customerCodeInfo: customerInformationMock.soldToInformation.first,
          ),
        );
        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final customerDetails = find.text(
          '${customerInformationMock.soldToInformation.first.customerName}(${customerInformationMock.soldToInformation.first.customerCodeSoldTo})',
        );
        expect(customerDetails, findsNothing);
      },
    );

    testWidgets(
      'Should navigate to payment detail when eligible',
      (tester) async {
        final fakeUser =
            User.empty().copyWith.role(type: RoleType('root_admin'));
        final notificationList = notifications.notificationData
            .where((e) => e.isPaymentEligible)
            .toList();
        when(() => notificationBlocMock.state).thenReturn(
          NotificationState.initial().copyWith(
            notificationList:
                notifications.copyWith(notificationData: notificationList),
            isFetching: false,
            isReadNotification: true,
          ),
        );

        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(user: fakeUser),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final itemKey = find.byKey(
          WidgetKeys.genericKey(key: notificationList.first.description),
        );

        expect(itemKey, findsOneWidget);
        await tester.tap(itemKey);
        await tester.pumpAndSettle();
        verify(
          () => paymentSummaryDetailsBlockMock.add(
            PaymentSummaryDetailsEvent.fetchPaymentSummaryDetailsInfo(
              details: PaymentSummaryDetails.empty().copyWith(
                paymentBatchAdditionalInfo:
                    notificationList.last.paymentBatchAdditionalInfo,
                zzAdvice: notificationList.last.paymentNumber,
              ),
            ),
          ),
        ).called(1);
      },
    );

    testWidgets(
      'Should show snackbar when tap on payment notification when not eligible',
      (tester) async {
        final notificationList = notifications.notificationData
            .where((e) => e.isPaymentEligible)
            .toList();
        when(() => notificationBlocMock.state).thenReturn(
          NotificationState.initial().copyWith(
            notificationList:
                notifications.copyWith(notificationData: notificationList),
            isFetching: false,
            isReadNotification: true,
          ),
        );

        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial()
              .copyWith
              .salesOrgConfigs(disablePayment: true),
        );

        await tester.pumpWidget(getScopedWidget());
        await tester.pump();
        final itemKey = find.byKey(
          WidgetKeys.genericKey(key: notificationList.first.description),
        );

        expect(itemKey, findsOneWidget);
        await tester.tap(itemKey);
        await tester.pumpAndSettle();
        expect(find.byType(CustomSnackBar), findsOneWidget);
        expect(find.text("You don't have access"), findsOneWidget);
      },
    );

    testWidgets(
        'Delete button should not be visible when notification list is empty ',
        (tester) async {
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final titleFinder = find.text('Notifications'.tr());
      expect(titleFinder, findsOneWidget);

      final deleteIconFinder = find.byKey(WidgetKeys.notificationDeleteButton);
      expect(deleteIconFinder, findsNothing);
    });

    testWidgets('Show MP logo if item is from market place ', (tester) async {
      when(() => notificationBlocMock.state).thenReturn(
        NotificationState.initial().copyWith(
          notificationList: Notifications.empty().copyWith(
            notificationData: [
              notifications.notificationData
                  .firstWhere((element) => element.isMarketPlace),
            ],
          ),
          canLoadMore: false,
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      expect(find.byType(MarketPlaceIcon), findsOneWidget);
    });

    testWidgets('Do not show MP logo if no notification from MP',
        (tester) async {
      when(() => notificationBlocMock.state).thenReturn(
        NotificationState.initial().copyWith(
          notificationList: Notifications.empty().copyWith(
            notificationData: [
              notifications.notificationData
                  .firstWhere((element) => !element.isMarketPlace),
            ],
          ),
          canLoadMore: false,
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      expect(find.byType(MarketPlaceIcon), findsNothing);
    });
  });
}

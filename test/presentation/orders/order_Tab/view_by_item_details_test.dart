import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/order/entities/order_status_tracker.dart';
import 'package:ezrxmobile/infrastructure/core/http/http.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/order_status_tracker/order_status_tracker_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/status_tracker.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_item_details/view_by_item_details.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';

class MockHTTPService extends Mock implements HttpService {}

class MockAppRouter extends Mock implements AppRouter {}

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class ViewByItemsBlocMock extends MockBloc<ViewByItemsEvent, ViewByItemsState>
    implements ViewByItemsBloc {}

class UserMockBloc extends MockBloc<UserEvent, UserState> implements UserBloc {}

class SalesOrgMockBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class ViewByItemDetailsBlockMock
    extends MockBloc<ViewByItemDetailsEvent, ViewByItemDetailsState>
    implements ViewByItemDetailsBloc {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class ProductImageBlocMock
    extends MockBloc<ProductImageEvent, ProductImageState>
    implements ProductImageBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  final mockViewByItemsBloc = ViewByItemsBlocMock();
  final mockViewByItemDetailsBloc = ViewByItemDetailsBlockMock();
  final mockSalesOrgBloc = SalesOrgMockBloc();
  final userBlocMock = UserMockBloc();
  late AuthBloc mockAuthBloc;
  late CustomerCodeBloc customerCodeBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late AppRouter autoRouterMock;
  late EligibilityBlocMock eligibilityBlocMock;
  late ProductImageBlocMock productImageBlocMock;
  late List<OrderStatusTracker> fakeOrderStatusTracker;
  late OrderHistoryItem fakeOrderHistoryItem;

  final fakeUser = User.empty().copyWith(
    username: Username('fake-user'),
    role: Role.empty().copyWith(
      type: RoleType('client'),
    ),
    enableOrderType: true,
  );
  const fakeCreatedDate = '20230412';
  setUpAll(() async {
    locator.registerLazySingleton(() => AppRouter());
    registerFallbackValue(CustomerCodeInfo.empty());
    registerFallbackValue(SalesOrganisation.empty());
    registerFallbackValue(ShipToInfo.empty());

    autoRouterMock = locator<AppRouter>();
    fakeOrderStatusTracker =
        await OrderStatusTrackerLocalDataSource().getOrderStatusTracker();
    fakeOrderHistoryItem = OrderHistoryItem.empty().copyWith(
      status: StatusType('Picking in progress'),
      createdDate: DateTimeStringValue(fakeCreatedDate),
      orderStatusTracker: fakeOrderStatusTracker,
    );
  });
  group('Order History Details By Item Page', () {
    setUp(() {
      customerCodeBlocMock = CustomerCodeBlocMock();
      eligibilityBlocMock = EligibilityBlocMock();
      announcementBlocMock = AnnouncementBlocMock();
      productImageBlocMock = ProductImageBlocMock();
      mockAuthBloc = MockAuthBloc();
      when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());

      when(() => userBlocMock.state).thenReturn(
        UserState.initial().copyWith(
          user: fakeUser,
        ),
      );
      when(() => mockViewByItemsBloc.state)
          .thenReturn(ViewByItemsState.initial());

      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => announcementBlocMock.state)
          .thenReturn(AnnouncementState.initial());
      when(() => mockViewByItemDetailsBloc.state)
          .thenReturn(ViewByItemDetailsState.initial());
      when(() => productImageBlocMock.state)
          .thenReturn(ProductImageState.initial());

      when(() => mockSalesOrgBloc.state).thenReturn(SalesOrgState.initial());
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          user: User.empty().copyWith(
            role: Role(
              description: '',
              name: '',
              id: '',
              type: RoleType('client'),
            ),
          ),
          salesOrganisation:
              SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('SG')),
          customerCodeInfo: CustomerCodeInfo.empty().copyWith(
            customerAttr7: CustomerAttr7('ZEV'),
            customerGrp4: CustomerGrp4('VR'),
          ),
        ),
      );
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
            BlocProvider<AuthBloc>(
              create: (context) => mockAuthBloc,
            ),
            BlocProvider<UserBloc>(create: (context) => userBlocMock),
            BlocProvider<AnnouncementBloc>(
              create: (context) => announcementBlocMock,
            ),
            BlocProvider<ViewByItemsBloc>(
              create: (context) => mockViewByItemsBloc,
            ),
            BlocProvider<CustomerCodeBloc>(
              create: (context) => customerCodeBlocMock,
            ),
            BlocProvider<ViewByItemDetailsBloc>(
              create: (context) => mockViewByItemDetailsBloc,
            ),
            BlocProvider<SalesOrgBloc>(create: (context) => mockSalesOrgBloc),
            BlocProvider<EligibilityBloc>(
              create: ((context) => eligibilityBlocMock),
            ),
            BlocProvider<ProductImageBloc>(
              create: ((context) => productImageBlocMock),
            ),
          ],
          child: const Material(
            child: ViewByItemDetailsPage(),
          ),
        ),
      );
    }

    testWidgets('loaderImage  test ', (tester) async {
      when(() => mockViewByItemDetailsBloc.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          isLoading: true,
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final loaderImage = find.byKey(
        WidgetKeys.loaderImage,
      );
      expect(loaderImage, findsOneWidget);
      final viewByOrderDetailsPageListView =
          find.byKey(WidgetKeys.viewByOrderDetailsPageListView);
      expect(viewByOrderDetailsPageListView, findsNothing);
    });

    testWidgets('When disableDeliveryDate is false', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: SalesOrganisationConfigs.empty()
              .copyWith(disableDeliveryDate: false),
        ),
      );
      when(() => mockViewByItemDetailsBloc.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          isLoading: true,
        ),
      );
      final expectedStates = [
        ViewByItemDetailsState.initial().copyWith(
          isLoading: false,
          orderHistoryItem:
              fakeOrderHistoryItem.copyWith(orderStatusTracker: []),
          viewByItemDetails: OrderHistory.empty().copyWith(
            orderHistoryItems: [fakeOrderHistoryItem],
          ),
        ),
      ];
      whenListen(
        mockViewByItemDetailsBloc,
        Stream.fromIterable(expectedStates),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final statusTrackerSection = find.byType(
        StatusTrackerSection,
      );

      expect(statusTrackerSection, findsOneWidget);
      await tester.tap(statusTrackerSection);
      await tester.pump();
      final expectedDelivery = find.textContaining('Expected delivery');
      expect(expectedDelivery, findsOneWidget);
    });
    testWidgets('When disableDeliveryDate is true ', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: SalesOrganisationConfigs.empty()
              .copyWith(disableDeliveryDate: true),
        ),
      );
      when(() => mockViewByItemDetailsBloc.state).thenReturn(
        ViewByItemDetailsState.initial().copyWith(
          isLoading: true,
        ),
      );
      final expectedStates = [
        ViewByItemDetailsState.initial().copyWith(
          isLoading: false,
          orderHistoryItem:
              fakeOrderHistoryItem.copyWith(orderStatusTracker: []),
          viewByItemDetails: OrderHistory.empty().copyWith(
            orderHistoryItems: [fakeOrderHistoryItem],
          ),
        ),
      ];
      whenListen(
        mockViewByItemDetailsBloc,
        Stream.fromIterable(expectedStates),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final statusTrackerSection = find.byType(
        StatusTrackerSection,
      );

      expect(statusTrackerSection, findsOneWidget);
      await tester.tap(statusTrackerSection);
      await tester.pump();
      final expectedDelivery = find.textContaining('Expected delivery');
      expect(expectedDelivery, findsNothing);
    });
  });
}

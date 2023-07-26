import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_item/return_list_by_item_bloc.dart';
import 'package:ezrxmobile/application/returns/return_summary_details/return_summary_details_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/return_list/return_by_item_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/widget_utils.dart';

class MockUserBloc extends MockBloc<UserEvent, UserState> implements UserBloc {}

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class ReturnListByItemBlocMock
    extends MockBloc<ReturnListByItemEvent, ReturnListByItemState>
    implements ReturnListByItemBloc {}

class MockSalesOrgBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class MockAnnouncementBloc
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class MockCustomerCodeBloc
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class AutoRouterMock extends Mock implements AppRouter {}

class MockProductImageBloc
    extends MockBloc<ProductImageEvent, ProductImageState>
    implements ProductImageBloc {}

class MockReturnSummaryDetailsBloc
    extends MockBloc<ReturnSummaryDetailsEvent, ReturnSummaryDetailsState>
    implements ReturnSummaryDetailsBloc {}

final locator = GetIt.instance;

void main() {
  late SalesOrgBloc mockSalesOrgBloc;
  late AppRouter autoRouterMock;
  late UserBloc mockUserBloc;
  late CustomerCodeBloc mockCustomerCodeBloc;
  late ReturnListByItemBloc mockReturnListByItemBloc;
  late AnnouncementBloc mockAnnouncementBloc;
  late ProductImageBloc mockProductImageBloc;
  late ReturnSummaryDetailsBloc mockReturnSummaryDetailsBloc;
  late AuthBloc mockAuthBloc;
  late List<ReturnItem> fakeReturhItemList;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => mockSalesOrgBloc);
    locator.registerLazySingleton(() => mockCustomerCodeBloc);
  });
  setUp(() async {
    mockSalesOrgBloc = MockSalesOrgBloc();
    mockUserBloc = MockUserBloc();
    autoRouterMock = locator<AppRouter>();
    mockCustomerCodeBloc = MockCustomerCodeBloc();
    mockAuthBloc = MockAuthBloc();
    mockAnnouncementBloc = MockAnnouncementBloc();
    mockReturnSummaryDetailsBloc = MockReturnSummaryDetailsBloc();
    mockProductImageBloc = MockProductImageBloc();
    mockReturnListByItemBloc = ReturnListByItemBlocMock();

    fakeReturhItemList = [
      ReturnItem.empty().copyWith(
        requestId: '1234567',
        invoiceID: '1234567',
      )
    ];
  });

  group('Return By Item Page', () {
    setUp(() {
      when(() => mockSalesOrgBloc.state).thenReturn(SalesOrgState.initial());
      when(() => mockUserBloc.state).thenReturn(UserState.initial());
      when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());
      when(() => mockCustomerCodeBloc.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => mockReturnListByItemBloc.state)
          .thenReturn(ReturnListByItemState.initial());
      when(() => mockAnnouncementBloc.state)
          .thenReturn(AnnouncementState.initial());
      when(() => mockProductImageBloc.state)
          .thenReturn(ProductImageState.initial());
      when(() => mockReturnSummaryDetailsBloc.state)
          .thenReturn(ReturnSummaryDetailsState.initial());
    });

    RouteDataScope getWUT() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => mockAuthBloc,
          ),
          BlocProvider<ProductImageBloc>(
            create: (context) => mockProductImageBloc,
          ),
          BlocProvider<AnnouncementBloc>(
            create: (context) => mockAnnouncementBloc,
          ),
          BlocProvider<CustomerCodeBloc>(
              create: (context) => mockCustomerCodeBloc),
          BlocProvider<SalesOrgBloc>(create: (context) => mockSalesOrgBloc),
          BlocProvider<UserBloc>(create: (context) => mockUserBloc),
          BlocProvider<ReturnListByItemBloc>(
            create: (context) => mockReturnListByItemBloc,
          ),
          BlocProvider<ReturnSummaryDetailsBloc>(
            create: (context) => mockReturnSummaryDetailsBloc,
          )
        ],
        child: const Scaffold(body: ReturnByItemPage()),
      );
    }

    testWidgets('Return Item page Body Test - loading', (tester) async {
      when(() => mockCustomerCodeBloc.state)
          .thenReturn(CustomerCodeState.initial().copyWith(
        customerCodeInfo: CustomerCodeInfo.empty().copyWith(
          customerCodeSoldTo: 'mock-customerCodeSoldTo',
        ),
      ));
      when(() => mockReturnListByItemBloc.state)
          .thenReturn(ReturnListByItemState.initial().copyWith(
        isFetching: true,
      ));
      final expectedStates = [
        ReturnListByItemState.initial()
            .copyWith(isFetching: true, returnItemList: []),
      ];
      whenListen(mockReturnListByItemBloc, Stream.fromIterable(expectedStates));

      await tester.pumpWidget(getWUT());
      await tester.pump();

      await tester.pump(const Duration(seconds: 2));
      expect(
        find.byKey(WidgetKeys.loaderImage),
        findsOneWidget,
      );
      await tester.pump();
    });

    testWidgets('Return Item page Body Test - Success', (tester) async {
      when(() => mockCustomerCodeBloc.state)
          .thenReturn(CustomerCodeState.initial().copyWith(
        customerCodeInfo: CustomerCodeInfo.empty().copyWith(
          customerCodeSoldTo: 'mock-customerCodeSoldTo',
        ),
      ));
      when(() => mockReturnListByItemBloc.state)
          .thenReturn(ReturnListByItemState.initial().copyWith(
        isFetching: true,
      ));
      final expectedStates = [
        ReturnListByItemState.initial()
            .copyWith(isFetching: false, returnItemList: fakeReturhItemList),
      ];
      whenListen(mockReturnListByItemBloc, Stream.fromIterable(expectedStates));

      await tester.pumpWidget(getWUT());
      await tester.pump();

      await tester.pump(const Duration(seconds: 2));
      expect(
        find.byKey(WidgetKeys.returnItem('0')),
        findsOneWidget,
      );
      await tester.pump();
    });
    testWidgets('Return Item page Body Test - Return Item Tap', (tester) async {
      when(() => mockReturnListByItemBloc.state)
          .thenReturn(ReturnListByItemState.initial());
      final expectedStates = [
        ReturnListByItemState.initial().copyWith(
          isFetching: true,
        ),
        ReturnListByItemState.initial()
            .copyWith(isFetching: false, returnItemList: fakeReturhItemList)
      ];
      whenListen(mockReturnListByItemBloc, Stream.fromIterable(expectedStates));

      await tester.pumpWidget(getWUT());
      await tester.pump();

      await tester.pump(const Duration(seconds: 2));
      expect(
        find.byKey(WidgetKeys.returnItem('0')),
        findsOneWidget,
      );
      final findReturnItemTile = find.byKey(WidgetKeys.returnItemTile);
      expect(
        findReturnItemTile,
        findsOneWidget,
      );
      await tester.tap(findReturnItemTile);
      await tester.pump();
      expect(
        autoRouterMock.current.name == 'ReturnRequestSummaryByItemDetailsRoute',
        true,
      );
      await tester.pump();
    });
  });
}

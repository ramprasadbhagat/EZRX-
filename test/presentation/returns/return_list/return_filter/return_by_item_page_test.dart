import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_item/return_list_by_item_bloc.dart';
import 'package:ezrxmobile/application/returns/return_summary_details/return_summary_details_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/presentation/core/bonus_tag.dart';
import 'package:ezrxmobile/presentation/core/common_tile_item.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/return_list/return_by_item_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../common_mock_data/sales_organsiation_mock.dart';
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

class MockEligibilityBloc extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class AutoRouterMock extends Mock implements AppRouter {}

class MockProductImageBloc
    extends MockBloc<ProductImageEvent, ProductImageState>
    implements ProductImageBloc {}

class MockReturnSummaryDetailsBloc
    extends MockBloc<ReturnSummaryDetailsEvent, ReturnSummaryDetailsState>
    implements ReturnSummaryDetailsBloc {}

class MockMixpanelService extends Mock implements MixpanelService {}

final locator = GetIt.instance;

void main() {
  late SalesOrgBloc mockSalesOrgBloc;
  late AppRouter autoRouterMock;
  late UserBloc mockUserBloc;
  late CustomerCodeBloc mockCustomerCodeBloc;
  late EligibilityBloc mockEligibilityBloc;
  late ReturnListByItemBloc mockReturnListByItemBloc;
  late AnnouncementBloc mockAnnouncementBloc;
  late ProductImageBloc mockProductImageBloc;
  late ReturnSummaryDetailsBloc mockReturnSummaryDetailsBloc;
  late AuthBloc mockAuthBloc;
  late List<ReturnItem> fakeReturnItemList;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => mockSalesOrgBloc);
    locator.registerLazySingleton(() => mockCustomerCodeBloc);
    locator.registerLazySingleton<MixpanelService>(() => MockMixpanelService());
  });
  setUp(() async {
    mockSalesOrgBloc = MockSalesOrgBloc();
    mockUserBloc = MockUserBloc();
    autoRouterMock = locator<AppRouter>();
    mockCustomerCodeBloc = MockCustomerCodeBloc();
    mockEligibilityBloc = MockEligibilityBloc();
    mockAuthBloc = MockAuthBloc();
    mockAnnouncementBloc = MockAnnouncementBloc();
    mockReturnSummaryDetailsBloc = MockReturnSummaryDetailsBloc();
    mockProductImageBloc = MockProductImageBloc();
    mockReturnListByItemBloc = ReturnListByItemBlocMock();

    fakeReturnItemList = [
      ReturnItem.empty().copyWith(
        requestId: '1234567',
        invoiceID: '1234567',
        status: StatusType('PENDING'),
      )
    ];
  });

  group(
    'Return By Item Page',
    () {
      setUp(() {
        when(() => mockSalesOrgBloc.state).thenReturn(SalesOrgState.initial());
        when(() => mockUserBloc.state).thenReturn(UserState.initial());
        when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());
        when(() => mockCustomerCodeBloc.state)
            .thenReturn(CustomerCodeState.initial());
        when(() => mockEligibilityBloc.state)
            .thenReturn(EligibilityState.initial());
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
          usingLocalization: true,
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
              create: (context) => mockCustomerCodeBloc,
            ),
            BlocProvider<EligibilityBloc>(
              create: (context) => mockEligibilityBloc,
            ),
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
        when(() => mockCustomerCodeBloc.state).thenReturn(
          CustomerCodeState.initial().copyWith(
            customerCodeInfo: CustomerCodeInfo.empty().copyWith(
              customerCodeSoldTo: 'mock-customerCodeSoldTo',
            ),
          ),
        );
        when(() => mockReturnListByItemBloc.state).thenReturn(
          ReturnListByItemState.initial().copyWith(
            isFetching: true,
          ),
        );
        final expectedStates = [
          ReturnListByItemState.initial()
              .copyWith(isFetching: true, returnItemList: []),
        ];
        whenListen(
          mockReturnListByItemBloc,
          Stream.fromIterable(expectedStates),
        );

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
        when(() => mockCustomerCodeBloc.state).thenReturn(
          CustomerCodeState.initial().copyWith(
            customerCodeInfo: CustomerCodeInfo.empty().copyWith(
              customerCodeSoldTo: 'mock-customerCodeSoldTo',
            ),
          ),
        );
        when(() => mockReturnListByItemBloc.state).thenReturn(
          ReturnListByItemState.initial().copyWith(
            isFetching: true,
          ),
        );
        final expectedStates = [
          ReturnListByItemState.initial()
              .copyWith(isFetching: false, returnItemList: fakeReturnItemList),
        ];
        whenListen(
          mockReturnListByItemBloc,
          Stream.fromIterable(expectedStates),
        );

        await tester.pumpWidget(getWUT());
        await tester.pump();

        await tester.pump(const Duration(seconds: 2));
        expect(
          find.byKey(WidgetKeys.returnItem('0')),
          findsOneWidget,
        );
        expect(
          find.byType(StatusLabel),
          findsOneWidget,
        );
        expect(
          find.textContaining(
            mockReturnListByItemBloc
                .state.returnItemList.first.status.displayStatus,
          ),
          findsOneWidget,
        );
        await tester.pump();
      });
      testWidgets(
        'Return Item page Body Test - Return Item Tap',
        (tester) async {
          when(() => mockReturnListByItemBloc.state).thenReturn(
            ReturnListByItemState.initial(),
          );
          final expectedStates = [
            ReturnListByItemState.initial().copyWith(
              isFetching: true,
            ),
            ReturnListByItemState.initial().copyWith(
              isFetching: false,
              returnItemList: fakeReturnItemList,
            )
          ];
          whenListen(
            mockReturnListByItemBloc,
            Stream.fromIterable(expectedStates),
          );

          await tester.pumpWidget(getWUT());
          await tester.pump();

          await tester.pump(
            const Duration(seconds: 2),
          );
          expect(
            find.byKey(WidgetKeys.returnItem('0')),
            findsOneWidget,
          );
          expect(
            find.byKey(WidgetKeys.returnInvoiceId),
            findsOneWidget,
          );
          expect(
            find.text('Invoice #1234567'),
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
            autoRouterMock.current.name ==
                'ReturnRequestSummaryByItemDetailsRoute',
            true,
          );
        },
      );

      testWidgets(
        '=> display outside return policy tag',
        (tester) async {
          when(() => mockEligibilityBloc.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeSalesOrgConfigAllowReturnsOutsidePolicy,
            ),
          );
          when(() => mockReturnListByItemBloc.state).thenReturn(
            ReturnListByItemState.initial().copyWith(
              returnItemList: [
                ReturnItem.empty().copyWith(outsidePolicy: true),
                ReturnItem.empty().copyWith(outsidePolicy: false),
              ],
            ),
          );
          await tester.pumpWidget(getWUT());
          await tester.pump();
          final cardFinder = find.byType(CommonTileItem);
          expect(cardFinder, findsNWidgets(2));
          expect(
            find.descendant(
              of: cardFinder.first,
              matching: find.byKey(WidgetKeys.outsideReturnPolicyTag),
            ),
            findsOneWidget,
          );
          expect(
            find.descendant(
              of: cardFinder.last,
              matching: find.byKey(WidgetKeys.outsideReturnPolicyTag),
            ),
            findsNothing,
          );
        },
      );
      testWidgets(
        '=> display outside return policy tag when toggle is off',
        (tester) async {
          when(() => mockReturnListByItemBloc.state).thenReturn(
            ReturnListByItemState.initial().copyWith(
              returnItemList: [
                ReturnItem.empty().copyWith(outsidePolicy: true),
                ReturnItem.empty().copyWith(outsidePolicy: false),
              ],
            ),
          );
          await tester.pumpWidget(getWUT());
          await tester.pump();
          final cardFinder = find.byType(CommonTileItem);
          expect(cardFinder, findsNWidgets(2));
          expect(
            find.descendant(
              of: cardFinder.first,
              matching: find.byKey(WidgetKeys.outsideReturnPolicyTag),
            ),
            findsNothing,
          );
          expect(
            find.descendant(
              of: cardFinder.last,
              matching: find.byKey(WidgetKeys.outsideReturnPolicyTag),
            ),
            findsNothing,
          );
        },
      );

      testWidgets('Return Item bonus', (tester) async {
        when(() => mockReturnListByItemBloc.state).thenReturn(
          ReturnListByItemState.initial().copyWith(
            returnItemList: [
              fakeReturnItemList.first,
              fakeReturnItemList.first.copyWith(
                prsfd: Prsfd('B'),
              )
            ],
          ),
        );

        await tester.pumpWidget(getWUT());
        await tester.pump();

        await tester.pump(const Duration(seconds: 2));
        expect(
          find.byKey(WidgetKeys.returnItem('0')),
          findsOneWidget,
        );
        expect(
          find.byType(BonusTag),
          findsOneWidget,
        );
      });

      testWidgets(
        '=> Find Customer name',
        (tester) async {
          when(() => mockReturnListByItemBloc.state).thenReturn(
            ReturnListByItemState.initial().copyWith(
              returnItemList: [
                ReturnItem.empty().copyWith(customerName: 'fake-customerName'),
              ],
            ),
          );
          await tester.pumpWidget(getWUT());
          await tester.pump();
          final cardFinder = find.byType(CommonTileItem);
          final customerName = find.text('fake-customerName');
          expect(cardFinder, findsOneWidget);
          expect(customerName, findsOneWidget);
        },
      );
    },
  );
}

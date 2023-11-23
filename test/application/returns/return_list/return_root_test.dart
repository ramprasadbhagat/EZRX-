import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_item/return_list_by_item_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_request/return_list_by_request_bloc.dart';
import 'package:ezrxmobile/application/returns/return_summary_details/return_summary_details_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/return_list/return_root/return_root.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';

class MockUserBloc extends MockBloc<UserEvent, UserState> implements UserBloc {}

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class ReturnListByItemBlocMock
    extends MockBloc<ReturnListByItemEvent, ReturnListByItemState>
    implements ReturnListByItemBloc {}

class ReturnListByRequestBlocMock
    extends MockBloc<ReturnListByRequestEvent, ReturnListByRequestState>
    implements ReturnListByRequestBloc {}

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

class MockReturnListByRequestBloc
    extends MockBloc<ReturnListByRequestEvent, ReturnListByRequestState>
    implements ReturnListByRequestBloc {}

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
  late ReturnListByRequestBloc mockReturnListByRequestBloc;
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
    mockReturnListByRequestBloc = ReturnListByRequestBlocMock();
  });

  group(
    'Return Root Page Test',
    () {
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
        when(() => mockReturnListByRequestBloc.state)
            .thenReturn(ReturnListByRequestState.initial());
      });

      Widget getWUT() {
        return WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          routeName: ReturnRootRoute.name,
          usingLocalization: true,
          providers: [
            BlocProvider<AuthBloc>(
              create: (context) => mockAuthBloc,
            ),
            BlocProvider<AnnouncementBloc>(
              create: (context) => mockAnnouncementBloc,
            ),
            BlocProvider<CustomerCodeBloc>(
              create: (context) => mockCustomerCodeBloc,
            ),
            BlocProvider<SalesOrgBloc>(
              create: (context) => mockSalesOrgBloc,
            ),
            BlocProvider<UserBloc>(
              create: (context) => mockUserBloc,
            ),
            BlocProvider<ReturnListByRequestBloc>(
              create: (context) => mockReturnListByRequestBloc,
            ),
            BlocProvider<ReturnListByItemBloc>(
              create: (context) => mockReturnListByItemBloc,
            ),
          ],
          child: const ReturnRoot(),
        );
      }

      testWidgets('Return Root Page ', (tester) async {
        await tester.pumpWidget(getWUT());
        await tester.pump();
        final viewByItemTab = find.byKey(
          Key(
            StringUtils.changeToCamelCase(sentence: 'View by items'),
          ),
        );
        expect(viewByItemTab, findsOneWidget);
        final viewByRequest = find.byKey(
          Key(
            StringUtils.changeToCamelCase(sentence: 'View by return requests'),
          ),
        );
        expect(viewByRequest, findsOneWidget);
        final returnByItemPage = find.byKey(WidgetKeys.returnByItemPage);
        expect(returnByItemPage, findsOneWidget);
        await tester.tap(viewByRequest);
        await tester.pumpAndSettle();
        final returnByRequestRootPage =
            find.byKey(WidgetKeys.returnByRequestRootPage);
        expect(returnByRequestRootPage, findsOneWidget);
      });
    },
  );
}

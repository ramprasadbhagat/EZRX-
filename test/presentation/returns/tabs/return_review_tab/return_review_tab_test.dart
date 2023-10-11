import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/new_request_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_request/details/return_details_by_request_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_request/return_list_by_request_bloc.dart';
import 'package:ezrxmobile/application/returns/usage_code/usage_code_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material_list.dart';
import 'package:ezrxmobile/domain/returns/entities/usage.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_request_local.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/usage_code_local.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/new_request/tabs/return_review_tab/return_review_tab.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/widget_utils.dart';

class MockUserBloc extends MockBloc<UserEvent, UserState> implements UserBloc {}

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

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

class MockEligibilityBloc extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class MockReturnDetailsByRequestBloc
    extends MockBloc<ReturnDetailsByRequestEvent, ReturnDetailsByRequestState>
    implements ReturnDetailsByRequestBloc {}

class MockPoAttachmentBloc
    extends MockBloc<PoAttachmentEvent, PoAttachmentState>
    implements PoAttachmentBloc {}

class MockNewRequestBloc extends MockBloc<NewRequestEvent, NewRequestState>
    implements NewRequestBloc {}

class MockUsageCodeBloc extends MockBloc<UsageCodeEvent, UsageCodeState>
    implements UsageCodeBloc {}

final locator = GetIt.instance;

void main() {
  late SalesOrgBloc mockSalesOrgBloc;
  late AppRouter autoRouterMock;
  late UserBloc mockUserBloc;
  late CustomerCodeBloc mockCustomerCodeBloc;
  late ReturnListByRequestBloc mockReturnListByRequestBloc;
  late AnnouncementBloc mockAnnouncementBloc;
  late ProductImageBloc mockProductImageBloc;
  late ReturnDetailsByRequestBloc mockReturnDetailsByRequestBloc;
  late PoAttachmentBloc mockPoAttachmentBloc;
  late NewRequestBloc mockNewRequestBloc;
  late UsageCodeBloc mockUsageCodeBloc;
  late AuthBloc mockAuthBloc;
  late EligibilityBloc eligibilityBlocMock;
  late ReturnMaterialList fakeReturnMaterialList;
  late List<ReturnMaterial> selectedMaterials;
  late List<Usage> fakeUsageList;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => mockSalesOrgBloc);
    locator.registerLazySingleton(() => mockCustomerCodeBloc);
    fakeReturnMaterialList =
        await ReturnRequestLocalDataSource().searchReturnMaterials();
    selectedMaterials = fakeReturnMaterialList.items;
    fakeUsageList = await UsageCodeLocalDataSource().getUsages();
  });
  setUp(() async {
    mockSalesOrgBloc = MockSalesOrgBloc();
    mockUserBloc = MockUserBloc();
    autoRouterMock = locator<AppRouter>();
    mockCustomerCodeBloc = MockCustomerCodeBloc();
    mockAuthBloc = MockAuthBloc();
    mockAnnouncementBloc = MockAnnouncementBloc();
    mockReturnDetailsByRequestBloc = MockReturnDetailsByRequestBloc();
    mockProductImageBloc = MockProductImageBloc();
    mockReturnListByRequestBloc = ReturnListByRequestBlocMock();
    mockPoAttachmentBloc = MockPoAttachmentBloc();
    mockNewRequestBloc = MockNewRequestBloc();
    mockUsageCodeBloc = MockUsageCodeBloc();
    eligibilityBlocMock = MockEligibilityBloc();
  });

  group('Return Review Tab', () {
    setUp(() {
      when(() => mockSalesOrgBloc.state).thenReturn(SalesOrgState.initial());
      when(() => mockUserBloc.state).thenReturn(UserState.initial());
      when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());
      when(() => eligibilityBlocMock.state)
          .thenReturn(EligibilityState.initial());
      when(() => mockCustomerCodeBloc.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => mockReturnListByRequestBloc.state)
          .thenReturn(ReturnListByRequestState.initial());
      when(() => mockAnnouncementBloc.state)
          .thenReturn(AnnouncementState.initial());
      when(() => mockProductImageBloc.state)
          .thenReturn(ProductImageState.initial());
      when(() => mockReturnDetailsByRequestBloc.state)
          .thenReturn(ReturnDetailsByRequestState.initial());
      when(() => mockPoAttachmentBloc.state)
          .thenReturn(PoAttachmentState.initial());
      when(() => mockNewRequestBloc.state)
          .thenReturn(NewRequestState.initial());
      when(() => mockUsageCodeBloc.state).thenReturn(UsageCodeState.initial());
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
          BlocProvider<SalesOrgBloc>(create: (context) => mockSalesOrgBloc),
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBlocMock,
          ),
          BlocProvider<UserBloc>(create: (context) => mockUserBloc),
          BlocProvider<ReturnListByRequestBloc>(
            create: (context) => mockReturnListByRequestBloc,
          ),
          BlocProvider<ReturnDetailsByRequestBloc>(
            create: (context) => mockReturnDetailsByRequestBloc,
          ),
          BlocProvider<PoAttachmentBloc>(
            create: (context) => mockPoAttachmentBloc,
          ),
          BlocProvider<NewRequestBloc>(
            create: (context) => mockNewRequestBloc,
          ),
          BlocProvider<UsageCodeBloc>(
            create: (context) => mockUsageCodeBloc,
          ),
        ],
        child: const Scaffold(
          body: ReturnReviewTab(),
        ),
      );
    }

    testWidgets(' Body Test', (tester) async {
      when(() => mockNewRequestBloc.state).thenReturn(
        NewRequestState.initial().copyWith(
          selectedItems: selectedMaterials,
        ),
      );

      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle();
      expect(
        find.byKey(WidgetKeys.returnReviewTabBodyKey),
        findsOneWidget,
      );
    });

    testWidgets(' Body Test - Return details section', (tester) async {
      when(() => mockNewRequestBloc.state).thenReturn(
        NewRequestState.initial().copyWith(
          selectedItems: selectedMaterials,
        ),
      );

      when(() => mockUsageCodeBloc.state).thenReturn(
        UsageCodeState.initial().copyWith(
          usages: fakeUsageList,
        ),
      );

      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle();
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.genericKey(key: 'selectedItem#0')),
          matching: find.byKey(WidgetKeys.returnDetailsSectionKey),
        ),
        findsOneWidget,
      );
    });
  });
}

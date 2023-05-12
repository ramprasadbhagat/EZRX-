import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/admin_po_attachment/filter/admin_po_attachment_filter_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/admin_po_attachment_filter.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:ezrxmobile/presentation/account/admin_po_attachment/filter/admin_po_attachment_filter.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class AdminPoAttachmentFilterBlocMock extends MockBloc<AdminPoAttachmentFilterEvent, AdminPoAttachmentFilterState>
    implements AdminPoAttachmentFilterBloc {}

class CustomerCodeBlocMock extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState>
    implements UserBloc {}


void main(){
  TestWidgetsFlutterBinding.ensureInitialized();
  late GetIt locator;
  late AppRouter autoRouterMock;
  late EligibilityBlocMock mockEligibilityBlocMock;
  late AdminPoAttachmentFilterBloc mockAdminPoAttachmentFilterBloc;
  late CustomerCodeBloc mockCustomerCodeBloc;
  late UserBloc mockUserBloc;

  final fakeToDate = DateTime.parse(
    DateFormat('yyyyMMdd').format(
      DateTime.now(),
    ),
  );

  final fakeFromDate = DateTime.parse(
    DateFormat('yyyyMMdd').format(
      DateTime.now().subtract(
        const Duration(days: 7),
      ),
    ),
  );

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator = GetIt.instance;
    locator.registerLazySingleton(() => AppRouter());
    autoRouterMock = locator<AppRouter>();
    locator.registerLazySingleton(() => mockEligibilityBlocMock);
    locator.registerLazySingleton(() => mockAdminPoAttachmentFilterBloc);
    locator.registerLazySingleton(() => mockCustomerCodeBloc);
    locator.registerLazySingleton(() => mockUserBloc);
  });

  group('admin po attachment filter', () {

    setUp(() {
      mockEligibilityBlocMock = EligibilityBlocMock();
      when(() => mockEligibilityBlocMock.state).thenReturn(EligibilityState.initial());
      mockAdminPoAttachmentFilterBloc = AdminPoAttachmentFilterBlocMock();
      when(() => mockAdminPoAttachmentFilterBloc.state).thenReturn(AdminPoAttachmentFilterState.initial());
      mockCustomerCodeBloc = CustomerCodeBlocMock();
      when(() => mockCustomerCodeBloc.state).thenReturn(CustomerCodeState.initial());
      mockUserBloc = UserBlocMock();
      when(() => mockUserBloc.state).thenReturn(UserState.initial());
    });

    Widget getWUT() {
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
            BlocProvider<CustomerCodeBloc>(create: (context) => mockCustomerCodeBloc),
            BlocProvider<AdminPoAttachmentFilterBloc>(create: (context) => mockAdminPoAttachmentFilterBloc),
            BlocProvider<EligibilityBloc>(create: (context) => mockEligibilityBlocMock),
            BlocProvider<UserBloc>(create: (context) => mockUserBloc),
          ],
          child: const Material(child: AdminPoAttachmentFilterDrawer()),
        ),
      );
    }

    testWidgets('admin po attachment filter test', (tester) async {

      when(() => mockUserBloc.state).thenReturn(UserState.initial().copyWith(
        user: User.empty().copyWith(
          userSalesOrganisations: [
            SalesOrganisation.empty().copyWith(
              salesOrg: SalesOrg('mock_sales_org'),
            ),
          ],
        ),
      ),
      );

      final expectedStates = [
        AdminPoAttachmentFilterState.initial().copyWith(
          isSubmitting: false,
          showErrorMessages: false,
          adminPoAttachmentFilter: AdminPoAttachmentFilter.empty().copyWith(
            orderNumber: SearchKey.searchFilter('orderNo'),
            exRxNo: SearchKey('ezRxNo'),
            salesOrg: SalesOrg('salesOrg'),
            soldTo: CustomerCodeInfo.empty(),
          ),
        ),
        AdminPoAttachmentFilterState.initial().copyWith(
          isSubmitting: false,
          showErrorMessages: true,
          adminPoAttachmentFilter: AdminPoAttachmentFilter.empty().copyWith(
            orderNumber: SearchKey.searchFilter('orderNo1'),
            exRxNo: SearchKey('ezRxNo1'),
            salesOrg: SalesOrg('salesOrg'),
            soldTo: CustomerCodeInfo.empty(),
          ),
        ),
        AdminPoAttachmentFilterState.initial().copyWith(
          isSubmitting: true,
          showErrorMessages: true,
          adminPoAttachmentFilter: AdminPoAttachmentFilter.empty().copyWith(
            orderNumber: SearchKey.searchFilter(''),
            exRxNo: SearchKey(''),
            salesOrg: SalesOrg(''),
            soldTo: CustomerCodeInfo.empty(),
            fromDate:
            DateTimeStringValue(getDateStringByDateTime(fakeFromDate)),
            toDate:
            DateTimeStringValue(getDateStringByDateTime(fakeToDate)),
          ),
        ),
      ];
      whenListen(mockAdminPoAttachmentFilterBloc, Stream.fromIterable(expectedStates));

      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle(const Duration(seconds: 1));

      final filterCrossButtonKey = find.byKey(const Key('filterCrossButton'));
      expect(filterCrossButtonKey, findsOneWidget);
      await tester.tap(filterCrossButtonKey);

      final filterOrderNoFieldKey = find.byKey(const Key('filterOrderNoField'));
      expect(filterOrderNoFieldKey, findsOneWidget);
      await tester.enterText(filterOrderNoFieldKey,'1234');

      final filterEzrxNumberFieldKey = find.byKey(const Key('filterEzrxNumberField'));
      expect(filterEzrxNumberFieldKey, findsOneWidget);
      await tester.enterText(filterEzrxNumberFieldKey,'1234');

      final filterCustomerCodeSearchFieldKey = find.byKey(const Key('filterCustomerCodeSearchField ${''}'));
      expect(filterCustomerCodeSearchFieldKey, findsOneWidget);
      await tester.tap(filterCustomerCodeSearchFieldKey);

      final filterApplyButtonKey = find.byKey(const Key('filterApplyButton'));
      expect(filterApplyButtonKey, findsOneWidget);
      await tester.tap(filterApplyButtonKey);

      final filterClearButtonKey = find.byKey(const Key('filterClearButton'));
      expect(filterClearButtonKey, findsOneWidget);
      await tester.tap(filterClearButtonKey);

      final filterAdminPoAttachmentDateFieldKey = find.ancestor(of: find.text('Order Date'.tr()), matching: find.byType(TextFormField));
      expect(filterAdminPoAttachmentDateFieldKey, findsOneWidget);
      await tester.tap(filterAdminPoAttachmentDateFieldKey);
      await tester.pumpAndSettle(const Duration(seconds: 4));

      final saveButton = find.text('SAVE');
      expect(saveButton, findsOneWidget);
      await tester.tap(saveButton);
      await tester.pumpAndSettle();
      expect(saveButton, findsNothing);

      final filterSalesOrgdKey = find.byKey(const Key('filterSalesOrgSearchField${''}'));
      expect(filterSalesOrgdKey, findsOneWidget);
      await tester.tap(filterSalesOrgdKey);

      await tester.pumpAndSettle(const Duration(seconds: 4));

      final selectSalesOrg = find.text('Please select a Sales Org'.tr());
      expect(selectSalesOrg, findsOneWidget);

      final salesOrgOptionKey = find.byKey(const Key('salesOrgOption${'mock_sales_org'}'));
      expect(salesOrgOptionKey, findsOneWidget);
      await tester.tap(salesOrgOptionKey);

      await tester.pump();
    });

  });

}
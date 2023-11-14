import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/config.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/presentation/payments/credit_details/section/credit_details_section.dart';
import 'package:ezrxmobile/application/payments/credit_and_invoice_details/credit_and_invoice_details_bloc.dart';

import '../../../../utils/widget_utils.dart';
import '../../../account/account_tab_test.dart';

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class CreditAndInvoiceDetailsBlocMock
    extends MockBloc<CreditAndInvoiceDetailsEvent, CreditAndInvoiceDetailsState>
    implements CreditAndInvoiceDetailsBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class ProductImageBlocMock
    extends MockBloc<ProductImageEvent, ProductImageState>
    implements ProductImageBloc {}

void main() {
  late AppRouter autoRouterMock;
  final locator = GetIt.instance;

  late SalesOrgBloc salesOrgBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late CreditAndInvoiceDetailsBloc creditAndInvoiceDetailsBlocMock;
  late ProductImageBloc productImageBlocMock;
  late UserBloc userBlocMock;
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late EligibilityBlocMock eligibilityBlocMock;

  final fakeInvoice = CreditAndInvoiceItem.empty().copyWith(
    bpCustomerNumber: '0030032223',
    fiscalYear: '2023',
    accountingDocumentItem: '001',
    invoiceProcessingStatus: StatusType('Cleared'),
    postingKeyName: 'fake-PK',
    searchKey: StringValue('fake-SK'),
    postingDate: DateTimeStringValue('20230528'),
    amountInTransactionCurrency: 100,
  );

  setUpAll(() async {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(
      () => MixpanelService(config: locator<Config>()),
    );
    autoRouterMock = locator<AppRouter>();
  });

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    creditAndInvoiceDetailsBlocMock = CreditAndInvoiceDetailsBlocMock();
    customerCodeBlocMock = CustomerCodeBlocMock();

    userBlocMock = UserBlocMock();
    salesOrgBlocMock = SalesOrgBlocMock();
    authBlocMock = AuthBlocMock();
    announcementBlocMock = AnnouncementBlocMock();
    eligibilityBlocMock = EligibilityBlocMock();
    productImageBlocMock = ProductImageBlocMock();

    when(() => creditAndInvoiceDetailsBlocMock.state)
        .thenReturn(CreditAndInvoiceDetailsState.initial());
    when(() => customerCodeBlocMock.state)
        .thenReturn(CustomerCodeState.initial());

    when(() => userBlocMock.state).thenReturn(UserState.initial());
    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    when(() => authBlocMock.state).thenReturn(const AuthState.initial());
    when(() => announcementBlocMock.state)
        .thenReturn(AnnouncementState.initial());
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
  });

  Future getWidget(tester) async {
    return tester.pumpWidget(
      WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        providers: [
          BlocProvider<ProductImageBloc>(
            create: (context) => productImageBlocMock,
          ),
          BlocProvider<CreditAndInvoiceDetailsBloc>(
            create: (context) => creditAndInvoiceDetailsBlocMock,
          ),
          BlocProvider<CustomerCodeBloc>(
            create: (context) => customerCodeBlocMock,
          ),
          BlocProvider<UserBloc>(
            create: (context) => userBlocMock,
          ),
          BlocProvider<SalesOrgBloc>(
            create: (context) => salesOrgBlocMock,
          ),
          BlocProvider<AuthBloc>(create: (context) => authBlocMock),
          BlocProvider<AnnouncementBloc>(
            create: (context) => announcementBlocMock,
          ),
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBlocMock,
          ),
        ],
        child: Scaffold(
          body: CreditDetailsSection(creditItem: fakeInvoice),
        ),
      ),
    );
  }

  testWidgets('credit details section ...', (tester) async {
    when(() => salesOrgBlocMock.state).thenReturn(
      SalesOrgState.initial().copyWith(
        configs: SalesOrganisationConfigs.empty().copyWith(
          currency: Currency('myr'),
        ),
      ),
    );

    when(() => customerCodeBlocMock.state).thenReturn(
      CustomerCodeState.initial(),
    );

    await getWidget(tester);
    await tester.pump();

    final item = find.byType(CreditDetailsSection);
    expect(item, findsOneWidget);

    final textKey = find.text('fake-PK #fake-SK');
    expect(textKey, findsOneWidget);

    final textStatus = find.text('Cleared');
    expect(textStatus, findsOneWidget);

    final textDocumentDate = find.byKey(const Key('Document date28 May 2023'));
    expect(textDocumentDate, findsOneWidget);

    final textDocumentType = find.byKey(const Key('Document typefake-PK'));
    expect(textDocumentType, findsOneWidget);

    final textReturnNumber = find.byKey(const Key('Return numberNA'));
    expect(textReturnNumber, findsOneWidget);

    final textDetail = find.byKey(const Key('Detailsfake-PK'));
    expect(textDetail, findsOneWidget);

    final textCreditSummary = find.text('Credit summary');
    expect(textCreditSummary, findsOneWidget);

    final textCreditTotal = find.text('Credit total:');
    expect(textCreditTotal, findsOneWidget);
  });
}

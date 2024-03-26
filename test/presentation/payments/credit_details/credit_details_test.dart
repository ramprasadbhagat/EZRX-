import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/payments/credit_and_invoice_details/credit_and_invoice_details_bloc.dart';
import 'package:ezrxmobile/application/payments/download_e_credit/download_e_credit_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_document_detail.dart';
import 'package:ezrxmobile/domain/payments/entities/download_payment_attachments.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/payments/datasource/all_credits_and_invoices_local.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/credit_details/credit_details.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_sg_sales_org_config.dart';
import '../../../common_mock_data/sales_organsiation_mock.dart';
import '../../../utils/widget_utils.dart';
import '../../order_history/order_history_details_widget_test.dart';

class CreditAndInvoiceDetailsBlocMock
    extends MockBloc<CreditAndInvoiceDetailsEvent, CreditAndInvoiceDetailsState>
    implements CreditAndInvoiceDetailsBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class ProductImageBlocMock
    extends MockBloc<ProductImageEvent, ProductImageState>
    implements ProductImageBloc {}

class DownloadECreditBlocMock
    extends MockBloc<DownloadECreditEvent, DownloadECreditState>
    implements DownloadECreditBloc {}

void main() {
  late CreditAndInvoiceDetailsBloc creditAndInvoiceDetailsBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;

  late UserBloc userBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late AppRouter autoRouterMock;
  final locator = GetIt.instance;
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late EligibilityBlocMock eligibilityBlocMock;
  late ProductImageBloc productImageBlocMock;
  late List<CreditAndInvoiceItem> customerDocumentDetails;
  late DownloadECreditBloc downloadECreditBlocMock;

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
    downloadECreditBlocMock = DownloadECreditBlocMock();

    userBlocMock = UserBlocMock();
    salesOrgBlocMock = SalesOrgBlocMock();
    authBlocMock = AuthBlocMock();
    announcementBlocMock = AnnouncementBlocMock();
    eligibilityBlocMock = EligibilityBlocMock();
    productImageBlocMock = ProductImageBlocMock();
    customerDocumentDetails =
        await AllCreditsAndInvoicesLocalDataSource().getDocumentHeaderList();

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
    when(() => downloadECreditBlocMock.state)
        .thenReturn(DownloadECreditState.initial());
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
          BlocProvider<DownloadECreditBloc>(
            create: (context) => downloadECreditBlocMock,
          ),
        ],
        child: const CreditDetailsPage(),
      ),
    );
  }

  group('Credit Details Screen Test', () {
    testWidgets('=> LoadingImage  Test', (tester) async {
      when(() => creditAndInvoiceDetailsBlocMock.state).thenReturn(
        CreditAndInvoiceDetailsState.initial().copyWith(
          isLoading: true,
        ),
      );
      await getWidget(tester);
      await tester.pump();
      final loaderImage = find.byKey(
        WidgetKeys.loaderImage,
      );
      expect(loaderImage, findsOneWidget);
      final creditDetailsPageListView =
          find.byKey(WidgetKeys.creditDetailsPageListView);
      expect(creditDetailsPageListView, findsNothing);
    });

    testWidgets('=> Detail view  Test', (tester) async {
      when(() => productImageBlocMock.state).thenReturn(
        ProductImageState.initial(),
      );
      await getWidget(tester);
      await tester.pump();
      final loaderImage = find.byKey(
        WidgetKeys.loaderImage,
      );
      expect(loaderImage, findsNothing);

      final creditDetailsPageListView =
          find.byKey(WidgetKeys.creditDetailsPageListView);
      expect(creditDetailsPageListView, findsOneWidget);
    });

    testWidgets('Find Gov.No in Credit Details Page', (tester) async {
      when(() => creditAndInvoiceDetailsBlocMock.state).thenReturn(
        CreditAndInvoiceDetailsState.initial()
            .copyWith(basicInfo: customerDocumentDetails.first),
      );

      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeVNSalesOrganisation,
        ),
      );

      await getWidget(tester);
      await tester.pump();

      final documentReferenceID =
          find.byKey(WidgetKeys.balanceTextRow('Gov. no', '0810234244'));
      expect(documentReferenceID, findsOneWidget);
    });

    testWidgets('Find Tax Amount', (tester) async {
      when(() => creditAndInvoiceDetailsBlocMock.state).thenReturn(
        CreditAndInvoiceDetailsState.initial().copyWith(
          basicInfo: customerDocumentDetails.first,
          itemsInfo: [
            CustomerDocumentDetail.empty().copyWith(
              taxAmount: 15,
            ),
          ],
        ),
      );
      when(() => productImageBlocMock.state).thenReturn(
        ProductImageState.initial(),
      );

      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: fakeSGSalesOrganisation,
          salesOrgConfigs: fakeSGSalesOrgConfigs,
        ),
      );

      await getWidget(tester);
      await tester.pumpAndSettle();

      final tax = find.text('Tax');
      final totalTaxAmount = find.text('SGD 15.00', findRichText: true);

      expect(tax, findsOneWidget);
      expect(totalTaxAmount, findsOneWidget);
    });

    testWidgets('Find download e credit button', (tester) async {
      when(() => creditAndInvoiceDetailsBlocMock.state).thenReturn(
        CreditAndInvoiceDetailsState.initial().copyWith(
          basicInfo: customerDocumentDetails.first,
        ),
      );
      when(() => downloadECreditBlocMock.state).thenReturn(
        DownloadECreditState.initial().copyWith(
          fileUrl: DownloadPaymentAttachment.empty()
              .copyWith(url: 'fake-eCredit-url'),
        ),
      );
      await getWidget(tester);
      await tester.pumpAndSettle();
      final downloadECreditButton =
          find.byKey(WidgetKeys.downloadECreditButton);
      expect(downloadECreditButton, findsOneWidget);
      await tester.tap(downloadECreditButton);
      verify(
        () => downloadECreditBlocMock.add(
          const DownloadECreditEvent.downloadECredit(),
        ),
      ).called(1);
    });

    testWidgets(
        'test download e credit button not clickable when download is in progress ',
        (tester) async {
      when(() => creditAndInvoiceDetailsBlocMock.state).thenReturn(
        CreditAndInvoiceDetailsState.initial().copyWith(
          basicInfo: customerDocumentDetails.first,
        ),
      );

      when(() => downloadECreditBlocMock.state).thenReturn(
        DownloadECreditState.initial().copyWith(
          isDownloading: true,
          fileUrl: DownloadPaymentAttachment.empty()
              .copyWith(url: 'fake-eCredit-url'),
        ),
      );

      await getWidget(tester);
      await tester.pump();
      final downloadECreditLoadingAnimationWidget =
          find.byKey(WidgetKeys.downloadECreditLoadingAnimationWidget);

      expect(downloadECreditLoadingAnimationWidget, findsOneWidget);
      await tester.tap(downloadECreditLoadingAnimationWidget);
      verifyNever(
        () => downloadECreditBlocMock.add(
          const DownloadECreditEvent.downloadECredit(),
        ),
      );
      await tester.pump();
    });

    testWidgets(
      ' -> Find Account Suspended Banner when Customer Code is blocked',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            customerCodeInfo: fakeBlockedCustomerCodeInfo,
          ),
        );
        await getWidget(tester);
        await tester.pump();

        final customerBlockedBanner =
            find.byKey(WidgetKeys.customerBlockedBanner);

        expect(customerBlockedBanner, findsOneWidget);
      },
    );

    testWidgets(
      ' -> Find Account Suspended Banner when ship to Code is blocked',
      (WidgetTester tester) async {
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            shipToInfo: fakeBlockedShipToInfo,
          ),
        );
        await getWidget(tester);
        await tester.pump();

        final customerBlockedBanner =
            find.byKey(WidgetKeys.customerBlockedBanner);

        expect(customerBlockedBanner, findsOneWidget);
      },
    );
  });
}

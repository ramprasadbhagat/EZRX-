import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/payments/all_invoices/all_invoices_bloc.dart';
import 'package:ezrxmobile/application/payments/all_invoices/filter/all_invoices_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/download_payment_attachments/download_payment_attachments_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_address.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_name.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/all_invoices_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/presentation/payments/all_invoices/all_invoices.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';
import '../../order_history/order_history_details_widget_test.dart';

class AllInvoicesBlocMock extends MockBloc<AllInvoicesEvent, AllInvoicesState>
    implements AllInvoicesBloc {}

class AllInvoicesFilterBlocMock
    extends MockBloc<AllInvoicesFilterEvent, AllInvoicesFilterState>
    implements AllInvoicesFilterBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class DownloadPaymentAttachmentsBlocMock extends MockBloc<
        DownloadPaymentAttachmentEvent, DownloadPaymentAttachmentsState>
    implements DownloadPaymentAttachmentsBloc {}

class ShipToCodeBlocMock extends MockBloc<ShipToCodeEvent, ShipToCodeState>
    implements ShipToCodeBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

void main() {
  late AllInvoicesBloc allInvoicesBlocMock;
  late AllInvoicesFilterBloc allInvoicesFilterBlocMock;
  late DownloadPaymentAttachmentsBloc downloadPaymentAttachmentsBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late ShipToCodeBloc shipToCodeBlocMock;
  late UserBloc userBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late AppRouter autoRouterMock;
  final locator = GetIt.instance;
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;

  setUpAll(() async {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => MixpanelService());
    autoRouterMock = locator<AppRouter>();
    locator<MixpanelService>().init(mixpanel: MixpanelMock());
  });

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    allInvoicesBlocMock = AllInvoicesBlocMock();
    allInvoicesFilterBlocMock = AllInvoicesFilterBlocMock();
    customerCodeBlocMock = CustomerCodeBlocMock();
    downloadPaymentAttachmentsBlocMock = DownloadPaymentAttachmentsBlocMock();
    shipToCodeBlocMock = ShipToCodeBlocMock();
    userBlocMock = UserBlocMock();
    salesOrgBlocMock = SalesOrgBlocMock();
    authBlocMock = AuthBlocMock();
    announcementBlocMock = AnnouncementBlocMock();

    when(() => allInvoicesBlocMock.state)
        .thenReturn(AllInvoicesState.initial());
    when(() => allInvoicesFilterBlocMock.state)
        .thenReturn(AllInvoicesFilterState.initial());
    when(() => customerCodeBlocMock.state)
        .thenReturn(CustomerCodeState.initial());
    when(() => downloadPaymentAttachmentsBlocMock.state)
        .thenReturn(DownloadPaymentAttachmentsState.initial());
    when(() => shipToCodeBlocMock.state).thenReturn(ShipToCodeState.initial());
    when(() => userBlocMock.state).thenReturn(UserState.initial());
    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    when(() => authBlocMock.state).thenReturn(const AuthState.initial());
    when(() => announcementBlocMock.state)
        .thenReturn(AnnouncementState.initial());
  });

  Future getWidget(tester) async {
    return tester.pumpWidget(
      WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<AllInvoicesBloc>(
            create: (context) => allInvoicesBlocMock,
          ),
          BlocProvider<AllInvoicesFilterBloc>(
            create: (context) => allInvoicesFilterBlocMock,
          ),
          BlocProvider<DownloadPaymentAttachmentsBloc>(
            create: (context) => downloadPaymentAttachmentsBlocMock,
          ),
          BlocProvider<CustomerCodeBloc>(
            create: (context) => customerCodeBlocMock,
          ),
          BlocProvider<ShipToCodeBloc>(
            create: (context) => shipToCodeBlocMock,
          ),
          BlocProvider<UserBloc>(
            create: (context) => userBlocMock,
          ),
          BlocProvider<SalesOrgBloc>(
            create: (context) => salesOrgBlocMock,
          ),
          BlocProvider<AuthBloc>(create: (context) => authBlocMock),
          BlocProvider<AnnouncementBloc>(
              create: (context) => announcementBlocMock),
        ],
        child: const AllInvoicesPage(),
      ),
    );
  }

  group('All Invoices Screen', () {
    testWidgets('=> AppBar Test', (tester) async {
      when(() => allInvoicesBlocMock.state)
          .thenReturn(AllInvoicesState.initial().copyWith(
        isLoading: true,
      ));
      final expectedState = [
        AllInvoicesFilterState.initial(),
        AllInvoicesFilterState.initial().copyWith(
          changed: true,
        ),
        AllInvoicesFilterState.initial().copyWith(
          allInvoicesFilter: AllInvoicesFilter.empty(),
        ),
      ];
      whenListen(allInvoicesFilterBlocMock, Stream.fromIterable(expectedState));

      await getWidget(tester);

      await tester.pump(const Duration(milliseconds: 100));
      final allInvoicesText = find.text('Invoices'.tr());
      expect(allInvoicesText, findsOneWidget);
    });

    testWidgets('=> Body Test when loading', (tester) async {
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial().copyWith(
        customerCodeInfo: CustomerCodeInfo.empty().copyWith(
          customerCodeSoldTo: 'mock-customerCodeSoldTo',
        ),
      ));
      when(() => shipToCodeBlocMock.state)
          .thenReturn(ShipToCodeState.initial().copyWith(
        shipToInfo: ShipToInfo.empty().copyWith(
          shipToCustomerCode: 'mock-shipToCustomerCode',
        ),
      ));
      when(() => allInvoicesBlocMock.state)
          .thenReturn(AllInvoicesState.initial().copyWith(
        isLoading: true,
      ));

      final expectedState = [
        AllInvoicesFilterState.initial().copyWith(
          changed: true,
        ),
        AllInvoicesFilterState.initial().copyWith(
          changed: true,
          allInvoicesFilter: AllInvoicesFilter.empty(),
        ),
      ];
      whenListen(allInvoicesFilterBlocMock, Stream.fromIterable(expectedState));

      await getWidget(tester);
      await tester.pump(const Duration(milliseconds: 100));

      final loaderImage = find.byKey(const Key('LoaderImage'));
      expect(loaderImage, findsOneWidget);
      await tester.pump();
    });

    testWidgets('=> Body Test onRefresh', (tester) async {
      when(() => allInvoicesBlocMock.state)
          .thenReturn(AllInvoicesState.initial());
      when(() => shipToCodeBlocMock.state)
          .thenReturn(ShipToCodeState.initial().copyWith(
        shipToInfo: ShipToInfo(
            defaultShipToAddress: true,
            shipToCustomerCode: '',
            shipToName: ShipToName.empty(),
            shipToAddress: ShipToAddress.empty(),
            status: Status(''),
            building: '',
            city1: '',
            city2: '',
            postalCode: '',
            houseNumber1: '',
            telephoneNumber: '',
            region: '',
            floor: '',
            plant: '',
            licenses: [],
            country: ''),
      ));

      final expectedState = [
        AllInvoicesState.initial().copyWith(
          isLoading: true,
        ),
        AllInvoicesState.initial().copyWith(
          isLoading: true,
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('mock-error'))),
        ),
        AllInvoicesState.initial().copyWith(
          isLoading: true,
          failureOrSuccessOption: none(),
        ),
        AllInvoicesState.initial().copyWith(
          isLoading: false,
          failureOrSuccessOption: optionOf(const Right('')),
          items: [
            CreditAndInvoiceItem.empty().copyWith(
              accountingDocument: '123456789',
              netDueDate: DateTimeStringValue('2023-12-25'),
              documentDate: DateTimeStringValue('2023-12-25'),
              amountInTransactionCurrency: 15.72,
              invoiceProcessingStatus: StatusType('Cleared'),
            )
          ],
          totalCount: 1,
        ),
      ];
      whenListen(allInvoicesBlocMock, Stream.fromIterable(expectedState));

      final handle = tester.ensureSemantics();
      await getWidget(tester);
      await tester.pump(const Duration(milliseconds: 100));

      await tester.drag(
        find.textContaining('123456789'),
        const Offset(0.0, 1000.0),
      );
      await tester.pump(const Duration(seconds: 1));
      expect(
        tester.getSemantics(find.byType(RefreshProgressIndicator)),
        matchesSemantics(
          label: 'Refresh',
        ),
      );

      await tester
          .pump(const Duration(seconds: 1)); // finish the scroll animation
      await tester.pump(
          const Duration(seconds: 1)); // finish the indicator settle animation
      await tester.pump(
          const Duration(seconds: 1)); // finish the indicator hide animation

      handle.dispose();
      await tester.pump();
    });

    testWidgets('=> Body Test onLoadMore', (tester) async {
      when(() => allInvoicesFilterBlocMock.state)
          .thenReturn(AllInvoicesFilterState.initial());
      when(() => allInvoicesBlocMock.state).thenReturn(
        AllInvoicesState.initial().copyWith(
          isLoading: false,
          canLoadMore: true,
          items: [
            CreditAndInvoiceItem.empty().copyWith(
              accountingDocument: '123456780',
              netDueDate: DateTimeStringValue('2023-12-25'),
              documentDate: DateTimeStringValue('2023-12-25'),
              amountInTransactionCurrency: 15.72,
              invoiceProcessingStatus: StatusType('Cleared'),
            ),
            CreditAndInvoiceItem.empty().copyWith(
              accountingDocument: '123456780',
              netDueDate: DateTimeStringValue('2023-12-25'),
              documentDate: DateTimeStringValue('2023-12-25'),
              amountInTransactionCurrency: 15.72,
              invoiceProcessingStatus: StatusType('Cleared'),
            ),
            CreditAndInvoiceItem.empty().copyWith(
              accountingDocument: '123456780',
              netDueDate: DateTimeStringValue('2023-12-25'),
              documentDate: DateTimeStringValue('2023-12-25'),
              amountInTransactionCurrency: 15.72,
              invoiceProcessingStatus: StatusType('Cleared'),
            ),
            CreditAndInvoiceItem.empty().copyWith(
              accountingDocument: '123456780',
              netDueDate: DateTimeStringValue('2023-12-25'),
              documentDate: DateTimeStringValue('2023-12-25'),
              amountInTransactionCurrency: 15.72,
              invoiceProcessingStatus: StatusType('Cleared'),
            ),
            CreditAndInvoiceItem.empty().copyWith(
              accountingDocument: '123456780',
              netDueDate: DateTimeStringValue('2023-12-25'),
              documentDate: DateTimeStringValue('2023-12-25'),
              amountInTransactionCurrency: 15.72,
              invoiceProcessingStatus: StatusType('Cleared'),
            ),
            CreditAndInvoiceItem.empty().copyWith(
              accountingDocument: '123456780',
              netDueDate: DateTimeStringValue('2023-12-25'),
              documentDate: DateTimeStringValue('2023-12-25'),
              amountInTransactionCurrency: 15.72,
              invoiceProcessingStatus: StatusType('Cleared'),
            ),
          ],
          totalCount: 6,
        ),
      );

      await getWidget(tester);
      await tester.drag(
        find.textContaining('123456780').last,
        const Offset(0.0, -1000.0),
      );
      await tester.pump(const Duration(seconds: 1));
      await tester
          .pump(const Duration(seconds: 1)); // finish the scroll animation
      await tester.pump(
          const Duration(seconds: 1)); // finish the indicator settle animation
      await tester.pump(
          const Duration(seconds: 1)); // finish the indicator hide animation
      await tester.pump();
    });
  });
}

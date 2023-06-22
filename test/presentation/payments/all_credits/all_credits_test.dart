import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/payments/all_credits/all_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/all_credits/all_credits_filter/all_credits_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/download_payment_attachments/download_payment_attachments_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_address.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_name.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/all_credits_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/presentation/payments/all_credits/all_credits.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';
import '../../order_history/order_history_details_widget_test.dart';

class AllCreditsBlocMock extends MockBloc<AllCreditsEvent, AllCreditsState>
    implements AllCreditsBloc {}

class AllCreditsFilterBlocMock
    extends MockBloc<AllCreditsFilterEvent, AllCreditsFilterState>
    implements AllCreditsFilterBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class ShipToCodeBlocMock extends MockBloc<ShipToCodeEvent, ShipToCodeState>
    implements ShipToCodeBloc {}

class DownloadPaymentAttachmentsBlocMock extends MockBloc<
        DownloadPaymentAttachmentEvent, DownloadPaymentAttachmentsState>
    implements DownloadPaymentAttachmentsBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

void main() {
  late AllCreditsBloc allCreditsBlocMock;
  late AllCreditsFilterBloc allCreditsFilterBlocMock;
  late DownloadPaymentAttachmentsBloc downloadPaymentAttachmentsBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late ShipToCodeBloc shipToCodeBlocMock;
  late UserBloc userBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late AppRouter autoRouterMock;
  final locator = GetIt.instance;
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;
  //late List<CreditAndInvoiceItem> creditList;
  // final fakeToDate = DateTime.parse(
  //   DateFormat('yyyy-MM-dd').format(
  //     DateTime.now(),
  //   ),
  // );

  // final fakeFromDate = DateTime.parse(
  //   DateFormat('yyyy-MM-dd').format(
  //     DateTime.now().subtract(
  //       const Duration(days: 28),
  //     ),
  //   ),
  // );
  setUpAll(() async {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => MixpanelService());
    autoRouterMock = locator<AppRouter>();
    locator<MixpanelService>().init(mixpanel: MixpanelMock());
    //creditList = [CreditAndInvoiceItem.empty()];
  });

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    allCreditsBlocMock = AllCreditsBlocMock();
    allCreditsFilterBlocMock = AllCreditsFilterBlocMock();
    downloadPaymentAttachmentsBlocMock = DownloadPaymentAttachmentsBlocMock();
    customerCodeBlocMock = CustomerCodeBlocMock();
    shipToCodeBlocMock = ShipToCodeBlocMock();
    userBlocMock = UserBlocMock();
    salesOrgBlocMock = SalesOrgBlocMock();
    authBlocMock = AuthBlocMock();
    announcementBlocMock = AnnouncementBlocMock();

    when(() => allCreditsBlocMock.state).thenReturn(AllCreditsState.initial());
    when(() => allCreditsFilterBlocMock.state)
        .thenReturn(AllCreditsFilterState.initial());
    when(() => downloadPaymentAttachmentsBlocMock.state)
        .thenReturn(DownloadPaymentAttachmentsState.initial());
    when(() => customerCodeBlocMock.state)
        .thenReturn(CustomerCodeState.initial());
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
          BlocProvider<AllCreditsBloc>(
            create: (context) => allCreditsBlocMock,
          ),
          BlocProvider<AllCreditsFilterBloc>(
            create: (context) => allCreditsFilterBlocMock,
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
        child: AllCredits(),
      ),
    );
  }

  group('All Credits Screen', () {
    // testWidgets('=> AppBar Test', (tester) async {
    //   when(() => allCreditsBlocMock.state)
    //       .thenReturn(AllCreditsState.initial().copyWith(
    //     isLoading: true,
    //   ));
    //   final expectedState = [
    //     AllCreditsFilterState.initial(),
    //     AllCreditsFilterState.initial().copyWith(
    //       isSubmitting: true,
    //     ),
    //     AllCreditsFilterState.initial().copyWith(
    //       allCreditsFilter: AllCreditsFilter.empty(),
    //     ),
    //   ];
    //   whenListen(allCreditsFilterBlocMock, Stream.fromIterable(expectedState));

    //   await getWidget(tester);

    //   await tester.pump(const Duration(milliseconds: 100));
    //   final filterButton = find.byType(FilterCountButton);
    //   expect(filterButton, findsOneWidget);
    //   await tester.tap(filterButton);
    //   final allInvoicesText = find.text('All Credits'.tr());
    //   expect(allInvoicesText, findsOneWidget);

    //   final statusText = find.textContaining('Status'.tr());
    //   expect(statusText, findsOneWidget);
    //   await tester.tap(statusText, warnIfMissed: false);
    //   await tester.pump();
    // });

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
      when(() => allCreditsBlocMock.state)
          .thenReturn(AllCreditsState.initial().copyWith(
        isLoading: true,
      ));
      final expectedState = [
        AllCreditsFilterState.initial().copyWith(
          isSubmitting: true,
        ),
        AllCreditsFilterState.initial().copyWith(
          isSubmitting: true,
          allCreditsFilter: AllCreditsFilter.empty().copyWith(sortBy: 'Open'),
        ),
      ];
      whenListen(allCreditsFilterBlocMock, Stream.fromIterable(expectedState));

      await getWidget(tester);
      await tester.pump(const Duration(milliseconds: 100));

      final loaderImage = find.byKey(const Key('LoaderImage'));
      expect(loaderImage, findsOneWidget);
      await tester.pump();
    });

    testWidgets('=> Body Test onRefresh', (tester) async {
      when(() => allCreditsBlocMock.state)
          .thenReturn(AllCreditsState.initial());
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
        AllCreditsState.initial().copyWith(
          isLoading: true,
        ),
        AllCreditsState.initial().copyWith(
          isLoading: true,
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('mock-error'))),
        ),
        AllCreditsState.initial().copyWith(
          isLoading: true,
          failureOrSuccessOption: none(),
        ),
        AllCreditsState.initial().copyWith(
          isLoading: false,
          failureOrSuccessOption: optionOf(const Right('')),
          credits: [
            CreditAndInvoiceItem.empty().copyWith(
              accountingDocument: '1234567890',
              netDueDate: DateTimeStringValue('2023-12-25'),
              documentDate: DateTimeStringValue('2023-12-25'),
              amountInTransactionCurrency: 15.72,
              invoiceProcessingStatus: StatusType('Cleared'),
            )
          ],
          totalCount: 1,
        ),
      ];
      whenListen(allCreditsBlocMock, Stream.fromIterable(expectedState));

      final handle = tester.ensureSemantics();
      await getWidget(tester);
      await tester.pump(const Duration(milliseconds: 100));

      await tester.drag(
        find.textContaining('1234567890'),
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

    // testWidgets('=> Body Test onLoadMore', (tester) async {
    //   when(() => allCreditsBlocMock.state).thenReturn(
    //     AllCreditsState.initial().copyWith(
    //       isLoading: false,
    //       canLoadMore: true,
    //       credits: List.filled(20, creditList.first),
    //       totalCount: 22,
    //     ),
    //   );
    //   when(() => allCreditsFilterBlocMock.state).thenReturn(
    //     AllCreditsFilterState.initial().copyWith(
    //       allCreditsFilter: AllCreditsFilter.empty().copyWith(
    //         documentDateTo: DateTimeStringValue(
    //           getDateStringByDateTime(fakeToDate),
    //         ),
    //         documentDateFrom: DateTimeStringValue(
    //           getDateStringByDateTime(fakeFromDate),
    //         ),
    //       ),
    //     ),
    //   );
    //   await getWidget(tester);
    //   final creditItemTile = find.byKey(const Key('creditItemTile'));
    //   expect(creditItemTile, findsWidgets);
    //   await tester.drag(
    //     creditItemTile.first,
    //     const Offset(0.0, -10000.0),
    //   );
    //   await tester.pumpAndSettle();
    //   verify(
    //     () => allCreditsBlocMock.add(
    //       AllCreditsEvent.loadMoreAllCreditsList(
    //         allCreditsFilter: AllCreditsFilter.empty().copyWith(
    //           documentDateTo: DateTimeStringValue(
    //             getDateStringByDateTime(fakeToDate),
    //           ),
    //           documentDateFrom: DateTimeStringValue(
    //             getDateStringByDateTime(fakeFromDate),
    //           ),
    //         ),
    //         customerCodeInfo: CustomerCodeInfo.empty(),
    //         salesOrganisation: SalesOrganisation.empty(),
    //       ),
    //     ),
    //   ).called(1);
    // });

    // testWidgets('=> All Credits AttentionRow visible', (tester) async {
    //   when(() => allCreditsBlocMock.state)
    //       .thenReturn(AllCreditsState.initial());

    //   await getWidget(tester);
    //   await tester.pump();

    //   await tester.pump(const Duration(milliseconds: 100));
    //   final attentionRow = find.byType(AttentionRow);
    //   expect(attentionRow, findsOneWidget);
    // });

    // testWidgets('=> All Credits Filter By Status Test', (tester) async {
    //   when(() => allCreditsBlocMock.state)
    //       .thenReturn(AllCreditsState.initial().copyWith(isLoading: true));

    //   when(() => allCreditsFilterBlocMock.state)
    //       .thenReturn(AllCreditsFilterState.initial().copyWith(
    //     allCreditsStatuses: [
    //       'Open',
    //       'Cleared',
    //     ],
    //     allCreditsFilter: AllCreditsFilter.empty().copyWith(
    //       documentDateTo: DateTimeStringValue(
    //         getDateStringByDateTime(fakeToDate),
    //       ),
    //       documentDateFrom: DateTimeStringValue(
    //         getDateStringByDateTime(fakeFromDate),
    //       ),
    //     ),
    //   ));
    //   final expectedState = [
    //     AllCreditsFilterState.initial().copyWith(
    //       allCreditsFilter: AllCreditsFilter.empty().copyWith(
    //         sortBy: 'Cleared',
    //       ),
    //     ),
    //     AllCreditsFilterState.initial().copyWith(
    //       allCreditsFilter: AllCreditsFilter.empty().copyWith(
    //         sortBy: 'Open',
    //       ),
    //     ),
    //   ];
    //   await getWidget(tester);
    //   await tester.pump();

    //   final statusFilterButton = find.byKey(const Key('statusFilterButton'));
    //   expect(statusFilterButton, findsOneWidget);
    //   await tester.tap(statusFilterButton);
    //   await tester.pump(const Duration(seconds: 1));

    //   final statusFilter =
    //       find.byKey(const ValueKey('all_credits_filter_by_status'));
    //   expect(statusFilter, findsOneWidget);

    //   final findRadioListText = find.text('Open');
    //   await tester.tap(findRadioListText);

    //   await tester.pump();

    //   final closeButton = find.byKey(const Key('closeButton'));
    //   expect(closeButton, findsOneWidget);
    //   await tester.tap(closeButton);
    //   await tester.pump();

    //   whenListen(
    //     allCreditsFilterBlocMock,
    //     Stream.fromIterable(expectedState),
    //   );
    //   await tester.tap(statusFilterButton);
    //   await tester.pump();
    // });
  });
}

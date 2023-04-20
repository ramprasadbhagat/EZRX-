import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/application/returns/return_summary_details/return_summary_details_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/request_information.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_information.dart';
import 'package:ezrxmobile/domain/returns/entities/return_summary_requests.dart';

import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/presentation/returns/return_summary_details/return_summary_details.dart';
import 'package:ezrxmobile/presentation/returns/return_summary_details/section/customer_details_section.dart';
import 'package:ezrxmobile/presentation/returns/return_summary_details/section/return_details_section.dart';
import 'package:ezrxmobile/presentation/returns/return_summary_details/section/return_items_section.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';
import '../../order_history/order_history_details_widget_test.dart';

class ReturnSummaryDetailsBlocMock
    extends MockBloc<ReturnSummaryDetailsEvent, ReturnSummaryDetailsState>
    implements ReturnSummaryDetailsBloc {}

class ShipToCodeBlocMock extends MockBloc<ShipToCodeEvent, ShipToCodeState>
    implements ShipToCodeBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class PoAttachmentBlocMock
    extends MockBloc<PoAttachmentEvent, PoAttachmentState>
    implements PoAttachmentBloc {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

void main() {
  late ReturnSummaryDetailsBloc returnSummaryDetailsBlocMock;
  late ShipToCodeBloc shipToCodeBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late PoAttachmentBloc poAttachmentBlocMock;
  final locator = GetIt.instance;
  late AppRouter autoRouterMock;
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;

  setUpAll(() async {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => MixpanelService());
    autoRouterMock = locator<AppRouter>();
    locator<MixpanelService>().init(mixpanel: MixpanelMock());
  });

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    returnSummaryDetailsBlocMock = ReturnSummaryDetailsBlocMock();
    shipToCodeBlocMock = ShipToCodeBlocMock();
    customerCodeBlocMock = CustomerCodeBlocMock();
    salesOrgBlocMock = SalesOrgBlocMock();
    poAttachmentBlocMock = PoAttachmentBlocMock();
    authBlocMock = AuthBlocMock();
    announcementBlocMock = AnnouncementBlocMock();
    when(() => returnSummaryDetailsBlocMock.state)
        .thenReturn(ReturnSummaryDetailsState.initial());
    when(() => shipToCodeBlocMock.state).thenReturn(ShipToCodeState.initial());
    when(() => customerCodeBlocMock.state)
        .thenReturn(CustomerCodeState.initial());
    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
    when(() => poAttachmentBlocMock.state)
        .thenReturn(PoAttachmentState.initial());
    when(() => authBlocMock.state).thenReturn(const AuthState.initial());
    when(() => announcementBlocMock.state)
        .thenReturn(AnnouncementState.initial());
  });

  Future getWidget(tester) async {
    return tester.pumpWidget(
      WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<ReturnSummaryDetailsBloc>(
            create: (context) => returnSummaryDetailsBlocMock,
          ),
          BlocProvider<ShipToCodeBloc>(
            create: (context) => shipToCodeBlocMock,
          ),
          BlocProvider<CustomerCodeBloc>(
            create: (context) => customerCodeBlocMock,
          ),
          BlocProvider<SalesOrgBloc>(
            create: (context) => salesOrgBlocMock,
          ),
          BlocProvider<PoAttachmentBloc>(
            create: (context) => poAttachmentBlocMock,
          ),
          BlocProvider<AuthBloc>(create: (context) => authBlocMock),
          BlocProvider<AnnouncementBloc>(
              create: (context) => announcementBlocMock),
        ],
        child: ReturnSummaryDetails(
          customerCodeInfo: CustomerCodeInfo.empty(),
          shipToInfo: ShipToInfo.empty(),
          returnSummaryRequests:
              ReturnSummaryRequest.empty().copyWith(returnId: 'mock_id'),
        ),
      ),
    );
  }

  group('Return Summary Details Test', () {
    testWidgets('=> ReturnSummaryDetails screen test', (tester) async {
      final expectedState = [
        ReturnSummaryDetailsState.initial().copyWith(
          failureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('mock-error'))),
        ),
        ReturnSummaryDetailsState.initial().copyWith(
          failureOrSuccessOption: none(),
          isLoading: false,
        ),
        ReturnSummaryDetailsState.initial().copyWith(
          isLoading: true,
          failureOrSuccessOption: optionOf(const Right('')),
          requestInformation: RequestInformation.empty().copyWith(
            requestInformation: [
              ReturnRequestInformation.empty(),
            ],
          ),
        ),
      ];
      whenListen(
          returnSummaryDetailsBlocMock, Stream.fromIterable(expectedState));

      await getWidget(tester);
      await tester.pump(const Duration(milliseconds: 100));

      final findReturnIdText = find.text('mock_id');
      expect(findReturnIdText, findsOneWidget);

      expect(find.byType(ReturnSummaryCustomerDetailsSection), findsOneWidget);
      expect(find.byType(ReturnSummaryDetailsSection), findsOneWidget);
      expect(find.byType(ReturnItemsSection), findsOneWidget);

      final findCustomerDetailsText = find.text('Customer Details'.tr());
      expect(findCustomerDetailsText, findsOneWidget);

      final findCustomerNameText = find.text('Customer Name'.tr());
      expect(findCustomerNameText, findsOneWidget);

      final findSoldToText = find.text('Sold To'.tr());
      expect(findSoldToText, findsOneWidget);

      final findShipToText = find.text('Ship To'.tr());
      expect(findShipToText, findsOneWidget);

      final findReturnDetailsText = find.text('Return Details'.tr());
      expect(findReturnDetailsText, findsOneWidget);

      final findSubmittedDateText = find.text('Submitted Date'.tr());
      expect(findSubmittedDateText, findsOneWidget);

      final findReturnIDText = find.text('Return ID'.tr());
      expect(findReturnIDText, findsOneWidget);

      final findCreatedByText = find.text('Created By'.tr());
      expect(findCreatedByText, findsOneWidget);

      final findRefundTotalText = find.text('Refund Total (w/o tax)'.tr());
      expect(findRefundTotalText, findsOneWidget);

      final findReturnStatusText = find.text('Return Status'.tr());
      expect(findReturnStatusText, findsOneWidget);

      final findReturnItemDetailsText = find.text('Return Item Details'.tr());
      expect(findReturnItemDetailsText, findsOneWidget);

      final findStatusText = find.text('Status'.tr());
      expect(findStatusText, findsOneWidget);

      final findMaterialNameText = find.text('Material Name'.tr());
      expect(findMaterialNameText, findsOneWidget);

      final findMaterialNumberText = find.text('Material Number'.tr());
      expect(findMaterialNumberText, findsOneWidget);

      final findApproveRejectReasonText =
          find.text('Approve/Reject Reason'.tr());
      expect(findApproveRejectReasonText, findsOneWidget);

      final findSapRoCreationText = find.text('SAP RO Creation'.tr());
      expect(findSapRoCreationText, findsOneWidget);

      final findInvoiceNoText = find.text('Invoice No'.tr());
      expect(findInvoiceNoText, findsOneWidget);

      final findInvoiceDateText = find.text('Invoice Date'.tr());
      expect(findInvoiceDateText, findsOneWidget);

      final findExpiryDateText = find.text('Expiry Date'.tr());
      expect(findExpiryDateText, findsOneWidget);

      final findBatchText = find.text('Batch'.tr());
      expect(findBatchText, findsOneWidget);

      final findReturnQuantityText = find.text('Return Quantity'.tr());
      expect(findReturnQuantityText, findsOneWidget);

      final findUnitPriceText = find.text('Unit Price (w/o tax) '.tr());
      expect(findUnitPriceText, findsOneWidget);

      final findOverrideValueText = find.text('Override Value (w/o tax)'.tr());
      expect(findOverrideValueText, findsOneWidget);

      final findCommentsText = find.text('Comments'.tr());
      expect(findCommentsText, findsOneWidget);

      final findIcon = find.byIcon(Icons.arrow_back_ios_new_sharp);
      expect(findIcon, findsOneWidget);
      await tester.tap(findIcon);
      await tester.pump();
    });
  });
}

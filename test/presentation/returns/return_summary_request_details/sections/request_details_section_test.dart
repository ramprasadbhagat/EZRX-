import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_request/details/return_details_by_request_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_request/return_list_by_request_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/request_information.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_information.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_information_header.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_details_by_request_local.dart';
import 'package:ezrxmobile/presentation/core/status_tracker.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/return_summary_request_details/return_request_details.dart';
import 'package:ezrxmobile/presentation/returns/return_summary_request_details/sections/request_details_section.dart';
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
  late AuthBloc mockAuthBloc;
  late EligibilityBloc eligibilityBlocMock;
  late RequestInformation requestInformation;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => mockSalesOrgBloc);
    locator.registerLazySingleton(() => mockCustomerCodeBloc);
    requestInformation = await ReturnSummaryDetailsByRequestLocal()
        .getReturnSummaryDetailsByRequest();
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
    eligibilityBlocMock = MockEligibilityBloc();
  });

  /////////////////////Finder///////////////////////////////////////////////////
  final bonusPriceComponent = find.byKey(WidgetKeys.bonusPriceComponent);
  /////////////////////////////////////////////////////////////////////////////

  group('Return By Item Page', () {
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
          )
        ],
        child: const Scaffold(
          body: ReturnRequestDetails(),
        ),
      );
    }

    testWidgets('Return Request Details Body Test - loading', (tester) async {
      when(() => mockReturnDetailsByRequestBloc.state).thenReturn(
        ReturnDetailsByRequestState.initial().copyWith(
          isLoading: true,
        ),
      );
      final expectedStates = [
        ReturnDetailsByRequestState.initial().copyWith(
          isLoading: true,
        ),
      ];
      whenListen(
        mockReturnDetailsByRequestBloc,
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
    testWidgets('Return Request Details Body Test - Sucess', (tester) async {
      when(() => mockReturnDetailsByRequestBloc.state).thenReturn(
        ReturnDetailsByRequestState.initial().copyWith(
          isLoading: true,
          requestInformationHeader:
              ReturnRequestInformationHeader.empty().copyWith(
            bapiStatus: StatusType('PENDING'),
            requestID: 'fake-id',
          ),
        ),
      );
      final expectedStates = [
        ReturnDetailsByRequestState.initial().copyWith(
          isLoading: false,
          requestInformation: [
            ReturnRequestInformation.empty()
                .copyWith(returnQuantity: '1', status: StatusType('PENDING'))
          ],
          requestInformationHeader:
              ReturnRequestInformationHeader.empty().copyWith(
            bapiStatus: StatusType('PENDING'),
            requestID: 'fake-id',
          ),
        ),
      ];
      whenListen(
        mockReturnDetailsByRequestBloc,
        Stream.fromIterable(expectedStates),
      );

      await tester.pumpWidget(getWUT());
      await tester.pump();

      await tester.pump(const Duration(seconds: 2));
      expect(
        find.byType(RequestDetailsSection),
        findsOneWidget,
      );
      await tester.pump();
      expect(
        find.byType(StatusTrackerSection),
        findsOneWidget,
      );
      expect(
        find.byType(StatusTrackerSection),
        findsOneWidget,
      );
      expect(
        find.textContaining(
          mockReturnDetailsByRequestBloc.state.requestInformation.first.status
              .displayStatusForViewByRequest,
        ),
        findsNWidgets(2),
      );
      await tester.pump();
    });

    testWidgets('Show comment', (tester) async {
      final fakeComment = Remarks('fake-comment');
      when(() => mockReturnDetailsByRequestBloc.state).thenReturn(
        ReturnDetailsByRequestState.initial().copyWith(
          requestInformation: [
            ReturnRequestInformation.empty().copyWith(
              remarks: fakeComment,
              returnQuantity: '1',
            ),
          ],
        ),
      );
      await tester.pumpWidget(getWUT());
      await tester.pump();
      final showButtonFinder =
          find.byKey(WidgetKeys.returnDetailShowDetailButton);
      await tester.dragUntilVisible(
        showButtonFinder,
        find.byKey(WidgetKeys.returnRequestDetailScrollList),
        const Offset(0, 1000),
      );
      await tester.pumpAndSettle();
      await tester.tap(showButtonFinder);
      await tester.pumpAndSettle();
      final commentTextFinder = find.byKey(
        WidgetKeys.balanceTextRow(
          'Comments'.tr(),
          fakeComment.displayText,
        ),
      );
      expect(
        find.descendant(
          of: commentTextFinder,
          matching: find.text(
            fakeComment.displayText,
          ),
        ),
        findsOneWidget,
      );
    });

    testWidgets('Return request fail => Bonus return reason', (tester) async {
      when(() => mockReturnDetailsByRequestBloc.state).thenReturn(
        ReturnDetailsByRequestState.initial().copyWith(
          requestInformation: requestInformation.returnRequestInformationList
              .map(
                (e) => e.copyWith(
                  bapiStatus: StatusType('FAILED'),
                ),
              )
              .toList(),
        ),
      );
      await tester.pumpWidget(getWUT());
      await tester.pump();
      final showButtonFinder =
          find.byKey(WidgetKeys.returnDetailShowDetailButton);
      await tester.dragUntilVisible(
        showButtonFinder,
        find.byKey(WidgetKeys.returnRequestDetailScrollList),
        const Offset(0, 1000),
      );
      await tester.pumpAndSettle();
      await tester.tap(showButtonFinder);
      await tester.pumpAndSettle();
      final bonusReturnReason = find.byKey(
        WidgetKeys.balanceTextRow(
          'Reason for return',
          requestInformation.returnRequestInformationList.first.returnOrderDesc,
        ),
      );
      expect(bonusReturnReason, findsOneWidget);
      expect(bonusPriceComponent, findsNothing);
    });

    testWidgets('Return request not fail => Bonus Price', (tester) async {
      when(() => mockReturnDetailsByRequestBloc.state).thenReturn(
        ReturnDetailsByRequestState.initial().copyWith(
          requestInformation: requestInformation.returnRequestInformationList,
        ),
      );
      await tester.pumpWidget(getWUT());
      await tester.pump();
      final showButtonFinder =
          find.byKey(WidgetKeys.returnDetailShowDetailButton);
      await tester.dragUntilVisible(
        showButtonFinder,
        find.byKey(WidgetKeys.returnRequestDetailScrollList),
        const Offset(0, 1000),
      );
      await tester.pumpAndSettle();
      await tester.tap(showButtonFinder);
      await tester.pumpAndSettle();
      expect(bonusPriceComponent, findsOneWidget);
    });

    testWidgets('Bonus return request fail => Bonus return reason',
        (tester) async {
      const bonusRejectReason = 'Bonus reject reason';
      const bonusRejectComment = 'Bonus reject comment';
      const approvalNumber = 'fake-approval-number';

      when(() => mockReturnDetailsByRequestBloc.state).thenReturn(
        ReturnDetailsByRequestState.initial().copyWith(
          requestInformation: [
            requestInformation.returnRequestInformationList.first.copyWith(
              bonusInformation: [
                requestInformation.returnRequestInformationList.first.copyWith(
                  remarks: Remarks(bonusRejectComment),
                  returnOrderDesc: bonusRejectReason,
                  status: StatusType('APPROVED'),
                  bapiSalesDocNumber: approvalNumber,
                ),
              ],
            )
          ],
        ),
      );
      await tester.pumpWidget(getWUT());
      await tester.pumpAndSettle();
      await tester.fling(
        find.byKey(
          WidgetKeys.returnRequestDetailScrollList,
        ),
        const Offset(0.0, -1000.0),
        1000.0,
      );
      final showBonusDetail = find.text('Show details');
      expect(showBonusDetail, findsOneWidget);
      await tester.tap(showBonusDetail);
      await tester.pumpAndSettle();

      final hideBonusDetail = find.text('Hide details');
      expect(hideBonusDetail, findsOneWidget);
      await tester.fling(
        find.byKey(
          WidgetKeys.returnRequestDetailScrollList,
        ),
        const Offset(0.0, -1000.0),
        1000.0,
      );
      expect(find.text('Bonus Approval details'), findsOneWidget);
      WidgetKeys.balanceTextRow(
        'Approval number',
        approvalNumber,
      );
      expect(find.text('Bonus Return details'), findsOneWidget);
      final bonusReturnReason = find.byKey(
        WidgetKeys.balanceTextRow(
          'Reason',
          bonusRejectReason,
        ),
      );
      expect(bonusReturnReason, findsNWidgets(2));
      final bonusComment = find.byKey(
        WidgetKeys.balanceTextRow(
          'Comments',
          bonusRejectComment,
        ),
      );
      expect(bonusComment, findsOneWidget);
    });

    testWidgets(
      'Return Request Details Subtotal text',
      (tester) async {
        when(() => mockReturnDetailsByRequestBloc.state).thenReturn(
          ReturnDetailsByRequestState.initial().copyWith(
            isLoading: false,
            requestInformation: [
              ReturnRequestInformation.empty()
                  .copyWith(returnQuantity: '1')
            ],
            requestInformationHeader:
                ReturnRequestInformationHeader.empty().copyWith(
              requestID: 'fake-id',
            ),
          ),
        );
        final currentSalesOrgVariant =
            salesOrgVariant.currentValue ?? fakeSalesOrg;
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: SalesOrganisation.empty().copyWith(
              salesOrg: currentSalesOrgVariant,
            ),
          ),
        );
        await tester.pumpWidget(getWUT());
        await tester.pump();

        expect(
          find.byType(RequestDetailsSection),
          findsOneWidget,
        );
        expect(
          find.text('${currentSalesOrgVariant.returnSubTotalText}:'),
          findsOneWidget,
        );
      },
      variant: salesOrgVariant,
    );
  });
}

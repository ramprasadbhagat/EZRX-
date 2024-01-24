import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/application/returns/return_summary_details/return_summary_details_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_information.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_information_header.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/return_summary_details_local.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/common_tile_item.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/status_tracker.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/return_summary_by_item_details/return_summary_by_item_details.dart';
import 'package:ezrxmobile/presentation/returns/return_summary_by_item_details/sections/return_request_summary_item_section.dart';
import 'package:ezrxmobile/presentation/returns/return_summary_by_item_details/sections/return_summary_bonus_item_section.dart';
import 'package:ezrxmobile/presentation/returns/return_summary_by_item_details/sections/return_summary_details_section.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../common_mock_data/sales_org_config_mock/fake_id_sales_org_config.dart';
import '../../../common_mock_data/sales_org_config_mock/fake_th_sales_org_config.dart';
import '../../../utils/widget_utils.dart';

class ReturnSummaryDetailsBlocMock
    extends MockBloc<ReturnSummaryDetailsEvent, ReturnSummaryDetailsState>
    implements ReturnSummaryDetailsBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class ProductImageBlocMock
    extends MockBloc<ProductImageEvent, ProductImageState>
    implements ProductImageBloc {}

final locator = GetIt.instance;
void main() {
  late ReturnSummaryDetailsBlocMock returnSummaryDetailsBlocMock;
  late EligibilityBlocMock eligibilityBlocMock;
  late AnnouncementBlocMock announcementBlocMock;
  late CustomerCodeBlocMock customerCodeBlocMock;
  late AuthBlocMock authBlocMock;
  late ProductImageBlocMock productImageBlocMock;
  late AppRouter autoRouterMock;
  late ReturnRequestInformation requestInformationMock;
  late ReturnRequestInformationHeader returnRequestInformationHeader;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerLazySingleton(() => AppRouter());
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
    autoRouterMock = locator<AppRouter>();
    requestInformationMock =
        (await ReturnSummaryDetailsRequestInformationLocal()
                .getRequestInformation())
            .returnRequestInformationList
            .first;
    returnRequestInformationHeader =
        (await ReturnSummaryDetailsRequestInformationLocal()
                .getRequestInformation())
            .requestInformationHeader;
  });

  setUp(() {
    returnSummaryDetailsBlocMock = ReturnSummaryDetailsBlocMock();
    announcementBlocMock = AnnouncementBlocMock();
    eligibilityBlocMock = EligibilityBlocMock();
    customerCodeBlocMock = CustomerCodeBlocMock();
    productImageBlocMock = ProductImageBlocMock();
    authBlocMock = AuthBlocMock();
    when(() => returnSummaryDetailsBlocMock.state)
        .thenReturn(ReturnSummaryDetailsState.initial());
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
    when(() => announcementBlocMock.state)
        .thenReturn(AnnouncementState.initial());
    when(() => customerCodeBlocMock.state)
        .thenReturn(CustomerCodeState.initial());
    when(() => productImageBlocMock.state)
        .thenReturn(ProductImageState.initial());
    when(() => authBlocMock.state).thenReturn(const AuthState.initial());
  });

  ////////////////////Finder/////////////////////////////////////////////
  final returnItemDetailCopyButton =
      find.byKey(WidgetKeys.returnItemDetailCopyButton);
  final returnItemDetailRequestDate =
      find.byKey(WidgetKeys.returnItemDetailRequestDate);
  final returnDetailSummary = find.byKey(WidgetKeys.returnDetailSummary);
  ///////////////////////////////////////////////////////////////////

  Widget getScopedWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      useMediaQuery: false,
      providers: [
        BlocProvider<ReturnSummaryDetailsBloc>(
          create: (context) => returnSummaryDetailsBlocMock,
        ),
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBlocMock,
        ),
        BlocProvider<AnnouncementBloc>(
          create: (context) => announcementBlocMock,
        ),
        BlocProvider<CustomerCodeBloc>(
          create: (context) => customerCodeBlocMock,
        ),
        BlocProvider<AuthBloc>(
          create: (context) => authBlocMock,
        ),
        BlocProvider<ProductImageBloc>(
          create: (context) => productImageBlocMock,
        ),
      ],
      child: const ReturnRequestSummaryByItemDetails(),
    );
  }

  group(
    'Test "Return Summary By Item Details"',
    () {
      testWidgets(
        '=> Test page app bar and body',
        (tester) async {
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          expect(find.text('Return item details'.tr()), findsOneWidget);
          expect(find.byType(AnnouncementBanner), findsOneWidget);
        },
      );

      testWidgets(
        '=> return details section',
        (tester) async {
          when(() => returnSummaryDetailsBlocMock.state).thenReturn(
            ReturnSummaryDetailsState.initial().copyWith(
              requestInformation: requestInformationMock,
              requestInformationHeader: returnRequestInformationHeader,
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          expect(
            find.text(
              '${'Return'.tr()} #${returnRequestInformationHeader.requestID}',
            ),
            findsOneWidget,
          );
          expect(
            returnItemDetailCopyButton,
            findsOneWidget,
          );
          expect(
            returnItemDetailRequestDate,
            findsOneWidget,
          );
          final returnReference = find.byKey(
            WidgetKeys.balanceTextRow(
              'Return reference',
              returnRequestInformationHeader.returnReference.displayNAIfEmpty,
            ),
          );
          expect(returnReference, findsOneWidget);
          final specialInstructions = find.byKey(
            WidgetKeys.balanceTextRow(
              'Special instructions',
              returnRequestInformationHeader
                  .specialInstructions.displaySpecialInstructions,
            ),
          );
          expect(specialInstructions, findsOneWidget);
          expect(
            find.descendant(
              of: find.byType(StatusTrackerSection),
              matching: find.text('Return request status'),
            ),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        '=> return items approver details test',
        (tester) async {
          await tester.binding.setSurfaceSize(const Size(480, 900));
          when(() => returnSummaryDetailsBlocMock.state).thenReturn(
            ReturnSummaryDetailsState.initial().copyWith(
              requestInformation: requestInformationMock.copyWith(
                status: StatusType('APPROVED'),
              ),
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          expect(find.byType(ReturnSummaryItemSection), findsOneWidget);
          expect(find.byType(ReturnItemSection), findsOneWidget);
          expect(find.byType(CommonTileItem), findsOneWidget);
          final showDetailButtonFinder =
              find.byKey(WidgetKeys.returnDetailShowDetailButton);
          expect(showDetailButtonFinder, findsOneWidget);
          await tester.tap(showDetailButtonFinder);
          await tester.pumpAndSettle();
          await tester.fling(
            find.byKey(WidgetKeys.returnItemDetailScrollList),
            const Offset(0.0, -1000.0),
            1000.0,
          );
          expect(returnDetailSummary, findsOneWidget);
          expect(find.text('Approval details'), findsOneWidget);
          final reason = find.byKey(
            WidgetKeys.balanceTextRow(
              'Reason',
              requestInformationMock.returnOrderDesc,
            ),
          );
          expect(reason, findsWidgets);
          final approvalNumber = find.byKey(
            WidgetKeys.balanceTextRow(
              'Approval number',
              requestInformationMock.displayBapiStatus,
            ),
          );
          expect(approvalNumber, findsWidgets);
        },
      );

      testWidgets(
        '=> return bonus item test',
        (tester) async {
          await tester.binding.setSurfaceSize(const Size(480, 900));
          when(() => returnSummaryDetailsBlocMock.state).thenReturn(
            ReturnSummaryDetailsState.initial().copyWith(
              requestInformation: requestInformationMock.copyWith(
                prsfd: Prsfd('B'),
              ),
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          expect(find.text('Bonus Details'), findsOneWidget);
          expect(
            find.descendant(
              of: find.byType(StatusLabel),
              matching: find.text(requestInformationMock.status.displayStatus),
            ),
            findsOneWidget,
          );
          expect(
            find.text(requestInformationMock.materialNumber.displayMatNo),
            findsOneWidget,
          );
          expect(
            find.descendant(
              of: find.byType(ReturnSummaryBonusItemSection),
              matching: find.text('Bonus'),
            ),
            findsOneWidget,
          );

          expect(
            find.descendant(
              of: find.byType(ReturnSummaryBonusItemSection),
              matching: find.text(
                'Batch ${requestInformationMock.batch} (Expires ${requestInformationMock.expiryDate.dateString})',
              ),
            ),
            findsOneWidget,
          );
          expect(find.byType(PriceComponent), findsWidgets);

          expect(
            find.descendant(
              of: find.byType(ReturnSummaryBonusItemSection),
              matching: find.text(
                'Qty: ${requestInformationMock.returnQuantity} ',
              ),
            ),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        '=> return bonus item test for ID',
        (tester) async {
          await tester.binding.setSurfaceSize(const Size(480, 900));
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeIDSalesOrgConfigs,
            ),
          );
          when(() => returnSummaryDetailsBlocMock.state).thenReturn(
            ReturnSummaryDetailsState.initial().copyWith(
              requestInformation: requestInformationMock.copyWith(
                prsfd: Prsfd('B'),
              ),
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          expect(find.text('Bonus Details'), findsOneWidget);
          expect(
            find.descendant(
              of: find.byType(StatusLabel),
              matching: find.text(requestInformationMock.status.displayStatus),
            ),
            findsOneWidget,
          );
          expect(
            find.text(requestInformationMock.materialNumber.displayMatNo),
            findsOneWidget,
          );
          expect(
            find.descendant(
              of: find.byType(ReturnSummaryBonusItemSection),
              matching: find.text('Bonus'),
            ),
            findsNothing,
          );
        },
      );

      testWidgets(
        '=> return bonus item details test',
        (tester) async {
          await tester.binding.setSurfaceSize(const Size(480, 900));
          when(() => returnSummaryDetailsBlocMock.state).thenReturn(
            ReturnSummaryDetailsState.initial().copyWith(
              requestInformation: requestInformationMock.copyWith(
                prsfd: Prsfd('B'),
              ),
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          expect(find.text('Bonus Details'), findsOneWidget);
          expect(
            find.descendant(
              of: find.byType(StatusLabel),
              matching: find.text(requestInformationMock.status.displayStatus),
            ),
            findsOneWidget,
          );
          expect(
            find.text(requestInformationMock.materialNumber.displayMatNo),
            findsOneWidget,
          );
          expect(
            find.descendant(
              of: find.byType(ReturnSummaryBonusItemSection),
              matching: find.text('Bonus'),
            ),
            findsOneWidget,
          );
          final showDetailsButton = find.text('Show details');
          final hideDetailsButton = find.text('Hide details');

          expect(hideDetailsButton, findsOneWidget);
          await tester.tap(hideDetailsButton);
          await tester.pumpAndSettle();
          expect(
            find.descendant(
              of: find.byType(ReturnSummaryBonusItemSection),
              matching: find.text('Bonus return details'),
            ),
            findsNothing,
          );
          expect(showDetailsButton, findsOneWidget);
          await tester.tap(showDetailsButton);
          await tester.pumpAndSettle();
          expect(
            find.descendant(
              of: find.byType(ReturnSummaryBonusItemSection),
              matching: find.text('Bonus return details'),
            ),
            findsOneWidget,
          );
          final reason = find.byKey(
            WidgetKeys.balanceTextRow(
              'Reason',
              requestInformationMock.returnOrderDesc,
            ),
          );
          expect(reason, findsWidgets);
          final comment = find.byKey(
            WidgetKeys.balanceTextRow(
              'Comments',
              requestInformationMock.comment.getOrDefaultValue(''),
            ),
          );
          expect(comment, findsWidgets);
        },
      );

      testWidgets(
        '=> Test loading display',
        (tester) async {
          when(() => returnSummaryDetailsBlocMock.state).thenReturn(
            ReturnSummaryDetailsState.initial().copyWith(
              isLoading: true,
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          expect(find.byKey(WidgetKeys.loaderImage), findsOneWidget);
        },
      );
      testWidgets(
        '=> Fetch data failed',
        (tester) async {
          const errorMessage = 'Mock Error';
          final expectedState = [
            ReturnSummaryDetailsState.initial().copyWith(
              isLoading: true,
            ),
            ReturnSummaryDetailsState.initial().copyWith(
              failureOrSuccessOption:
                  optionOf(const Left(ApiFailure.other(errorMessage))),
            ),
          ];
          whenListen(
            returnSummaryDetailsBlocMock,
            Stream.fromIterable(expectedState),
          );

          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          expect(find.byKey(WidgetKeys.customSnackBar), findsOneWidget);
          expect(find.text(errorMessage), findsOneWidget);
        },
      );

      testWidgets(
        '=> Fetch data success',
        (tester) async {
          final expectedState = [
            ReturnSummaryDetailsState.initial().copyWith(
              isLoading: true,
            ),
            ReturnSummaryDetailsState.initial().copyWith(
              requestInformation: requestInformationMock,
            ),
          ];
          whenListen(
            returnSummaryDetailsBlocMock,
            Stream.fromIterable(expectedState),
          );

          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          final scrollListFinder =
              find.byKey(WidgetKeys.returnItemDetailScrollList);
          expect(
            scrollListFinder,
            findsOneWidget,
          );
          expect(find.byType(ReturnSummaryDetailsSection), findsOneWidget);
          expect(find.byType(ReturnSummaryItemSection), findsOneWidget);

          final copyIdButtonFinder =
              find.byKey(WidgetKeys.returnItemDetailCopyButton);
          expect(copyIdButtonFinder, findsOneWidget);
          await tester.tap(copyIdButtonFinder);

          final showDetailButtonFinder =
              find.byKey(WidgetKeys.returnDetailShowDetailButton);
          expect(showDetailButtonFinder, findsOneWidget);
          await tester.scrollUntilVisible(showDetailButtonFinder, -500);
          await tester.pump();
          await tester.tap(showDetailButtonFinder);
          await tester.pump();
          expect(find.byKey(WidgetKeys.returnDetailSummary), findsOneWidget);
        },
      );

      testWidgets(
        '=> display outside return policy tag',
        (tester) async {
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: fakeTHSalesOrgConfigs,
            ),
          );
          when(() => returnSummaryDetailsBlocMock.state).thenReturn(
            ReturnSummaryDetailsState.initial().copyWith(
              requestInformation: requestInformationMock.copyWith(
                outsidePolicy: true,
              ),
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          expect(
            find.byKey(WidgetKeys.outsideReturnPolicyTag),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        '=> hide outside return policy tag',
        (tester) async {
          when(() => returnSummaryDetailsBlocMock.state).thenReturn(
            ReturnSummaryDetailsState.initial().copyWith(
              requestInformation: requestInformationMock.copyWith(
                outsidePolicy: false,
              ),
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          expect(
            find.byKey(WidgetKeys.outsideReturnPolicyTag),
            findsNothing,
          );
        },
      );

      testWidgets(
        '=> hide outside return policy tag when toggle is off',
        (tester) async {
          when(() => returnSummaryDetailsBlocMock.state).thenReturn(
            ReturnSummaryDetailsState.initial().copyWith(
              requestInformation: requestInformationMock.copyWith(
                outsidePolicy: true,
              ),
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          expect(
            find.byKey(WidgetKeys.outsideReturnPolicyTag),
            findsNothing,
          );
        },
      );

      testWidgets(
        '=> display comment',
        (tester) async {
          final fakeComment = Remarks('fake-comment');
          when(() => returnSummaryDetailsBlocMock.state).thenReturn(
            ReturnSummaryDetailsState.initial().copyWith(
              requestInformation: requestInformationMock.copyWith(
                remarks: fakeComment,
              ),
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();
          final showButtonFinder =
              find.byKey(WidgetKeys.returnDetailShowDetailButton);
          await tester.dragUntilVisible(
            showButtonFinder,
            find.byKey(WidgetKeys.returnItemDetailScrollList),
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
        },
      );

      testWidgets(
        '=> Find Bonus Price in Bonus details Section',
        (tester) async {
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
                currency: Currency('MYR'),
              ),
            ),
          );
          when(() => returnSummaryDetailsBlocMock.state).thenReturn(
            ReturnSummaryDetailsState.initial().copyWith(
              requestInformation: requestInformationMock.copyWith(
                bonusInformation: [
                  ReturnRequestInformation.empty().copyWith(
                    totalPrice: 200,
                    returnQuantity: '1',
                  )
                ],
              ),
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          final scrollListFinder =
              find.byKey(WidgetKeys.returnItemDetailScrollList);
          expect(
            scrollListFinder,
            findsOneWidget,
          );
          final showDetailButtonFinder =
              find.byKey(WidgetKeys.returnDetailShowDetailButton);
          expect(showDetailButtonFinder, findsOneWidget);
          await tester.scrollUntilVisible(showDetailButtonFinder, -500);
          await tester.pump();
          await tester.tap(showDetailButtonFinder);
          await tester.pumpAndSettle();
          final bonusPrice = find.text('MYR 200.00', findRichText: true);
          expect(bonusPrice, findsOneWidget);
        },
      );

      group('=> Attachment section', () {
        final scrollList = find.byKey(WidgetKeys.returnItemDetailScrollList);
        const scrollOffset = Offset(0, -300);
        const attachmentTestIndex = 0;

        testWidgets('=> Tap Download attachment', (tester) async {
          final attachmentCount = requestInformationMock.attachmentUrl.length;
          when(() => returnSummaryDetailsBlocMock.state).thenReturn(
            ReturnSummaryDetailsState.initial().copyWith(
              requestInformation: requestInformationMock.copyWith(
                status: StatusType(''),
                bonusInformation: [],
              ),
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();

          final expandButton =
              find.byKey(WidgetKeys.returnDetailShowDetailButton);
          await tester.dragUntilVisible(
            expandButton,
            scrollList,
            scrollOffset,
          );
          await tester.pump();
          await tester.tap(expandButton);
          await tester.pump();
          expect(find.byKey(WidgetKeys.returnDetailSummary), findsOneWidget);
          await tester.dragUntilVisible(
            find.byKey(WidgetKeys.returnAttachmentSection),
            scrollList,
            scrollOffset,
          );
          await tester.pump();
          final attachmentTile = find.byKey(WidgetKeys.returnAttachmentTile);
          final downloadButton =
              find.byKey(WidgetKeys.returnAttachmentDownloadButton);
          expect(
            attachmentTile,
            findsNWidgets(attachmentCount),
          );
          expect(
            find.descendant(of: attachmentTile, matching: downloadButton),
            findsNWidgets(attachmentCount),
          );
          await tester.tap(downloadButton.at(attachmentTestIndex));
          await tester.pump();
          verify(
            () => returnSummaryDetailsBlocMock.add(
              ReturnSummaryDetailsEvent.downloadFile(
                file: requestInformationMock.attachmentUrl[attachmentTestIndex],
              ),
            ),
          ).called(1);
        });

        testWidgets('=> Attachment is downloading', (tester) async {
          final attachmentCount = requestInformationMock.attachmentUrl.length;
          when(() => returnSummaryDetailsBlocMock.state).thenReturn(
            ReturnSummaryDetailsState.initial().copyWith(
              downloadingAttachments: [
                requestInformationMock.attachmentUrl[attachmentTestIndex]
              ],
              requestInformation: requestInformationMock.copyWith(
                status: StatusType(''),
                bonusInformation: [],
              ),
            ),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pump();

          final expandButton =
              find.byKey(WidgetKeys.returnDetailShowDetailButton);
          await tester.dragUntilVisible(
            expandButton,
            scrollList,
            scrollOffset,
          );
          await tester.pump();
          await tester.tap(expandButton);
          await tester.pump();
          expect(find.byKey(WidgetKeys.returnDetailSummary), findsOneWidget);
          await tester.dragUntilVisible(
            find.byKey(WidgetKeys.returnAttachmentSection),
            scrollList,
            scrollOffset,
          );
          await tester.pump();
          final attachmentTile = find.byKey(WidgetKeys.returnAttachmentTile);
          final downloadButton =
              find.byKey(WidgetKeys.returnAttachmentDownloadButton);
          expect(
            attachmentTile,
            findsNWidgets(attachmentCount),
          );
          expect(
            find.descendant(of: attachmentTile, matching: downloadButton),
            findsNWidgets(attachmentCount - 1),
          );
          expect(
            find.descendant(
              of: attachmentTile,
              matching: find.byKey(WidgetKeys.loadMoreLoader),
            ),
            findsOneWidget,
          );
          await tester.tap(downloadButton.at(attachmentTestIndex));
          await tester.pump();
          verifyNever(
            () => returnSummaryDetailsBlocMock.add(
              ReturnSummaryDetailsEvent.downloadFile(
                file: requestInformationMock.attachmentUrl[attachmentTestIndex],
              ),
            ),
          );
        });

        testWidgets('=> Download attachment successfully', (tester) async {
          whenListen(
            returnSummaryDetailsBlocMock,
            Stream.fromIterable([
              ReturnSummaryDetailsState.initial().copyWith(
                downloadFailureOrSuccessOption:
                    optionOf(const Right('success')),
                downloadedAttachment:
                    requestInformationMock.attachmentUrl[attachmentTestIndex],
              ),
            ]),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          expect(find.byKey(WidgetKeys.customSnackBar), findsOneWidget);
          final snackBarMessage = tester
              .widget<Text>(find.byKey(WidgetKeys.customSnackBarMessage))
              .data;
          expect(
            snackBarMessage,
            equals('Attachments downloaded successfully.'.tr()),
          );
        });

        testWidgets('=> Download attachment failure', (tester) async {
          const errorMessage = 'fake-error';

          whenListen(
            returnSummaryDetailsBlocMock,
            Stream.fromIterable([
              ReturnSummaryDetailsState.initial().copyWith(
                downloadFailureOrSuccessOption:
                    optionOf(const Left(ApiFailure.other(errorMessage))),
                downloadedAttachment:
                    requestInformationMock.attachmentUrl[attachmentTestIndex],
              ),
            ]),
          );
          await tester.pumpWidget(getScopedWidget());
          await tester.pumpAndSettle();
          expect(find.byKey(WidgetKeys.customSnackBar), findsOneWidget);
          final snackBarMessage = tester
              .widget<Text>(find.byKey(WidgetKeys.customSnackBarMessage))
              .data;
          expect(
            snackBarMessage,
            equals(errorMessage.tr()),
          );
        });
      });
    },
  );
}

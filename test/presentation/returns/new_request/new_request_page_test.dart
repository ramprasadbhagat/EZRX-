import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/product_image/product_image_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/attachments/return_request_attachment_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/new_request_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/return_items/return_items_bloc.dart';
import 'package:ezrxmobile/application/returns/usage_code/usage_code_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/invoice_details.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item_details.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/presentation/core/confirm_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/new_request/new_request_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';

import '../../../common_mock_data/customer_code_mock.dart';
import '../../../common_mock_data/user_mock.dart';
import '../../../utils/widget_utils.dart';

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class ReturnItemsBlocMock extends MockBloc<ReturnItemsEvent, ReturnItemsState>
    implements ReturnItemsBloc {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class NewRequestMockBloc extends MockBloc<NewRequestEvent, NewRequestState>
    implements NewRequestBloc {}

class SalesOrgMockBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class UsageCodeBlocMock extends MockBloc<UsageCodeEvent, UsageCodeState>
    implements UsageCodeBloc {}

class ProductImageBlocMock
    extends MockBloc<ProductImageEvent, ProductImageState>
    implements ProductImageBloc {}

class ReturnRequestAttachmentBlocMock
    extends MockBloc<ReturnRequestAttachmentEvent, ReturnRequestAttachmentState>
    implements ReturnRequestAttachmentBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class AutoRouterMock extends Mock implements AppRouter {}

class MixpanelServiceMock extends Mock implements MixpanelService {}

final locator = GetIt.instance;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late ReturnItemsBloc returnItemsBlocMock;
  late AppRouter autoRouterMock;
  late CustomerCodeBloc customerCodeBlocMock;
  final salesOrgBlocMock = SalesOrgMockBloc();
  late EligibilityBloc eligibilityBlocMock;
  late NewRequestBloc newRequestBlocMock;
  final usageCodeBlocMock = UsageCodeBlocMock();
  late ReturnRequestAttachmentBloc returnRequestAttachmentBlocMock;
  late ProductImageBloc productImageBlocMock;
  late ReturnMaterial fakeReturnMaterial;

  final fakeSalesOrganisation = SalesOrganisation.empty().copyWith(
    salesOrg: SalesOrg('fake-SalesOrg'),
  );

  final sgSalesOrganisation = SalesOrganisation.empty().copyWith(
    salesOrg: SalesOrg('2601'),
  );
  final nextButtonFinder = find.byKey(WidgetKeys.nextButton);

  setUpAll(() async {
    fakeReturnMaterial = ReturnMaterial.empty().copyWith(
      unitPrice: RangeValue('100'),
    );
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton<MixpanelService>(() => MixpanelServiceMock());
  });

  group('New Request page', () {
    setUp(() {
      authBlocMock = AuthBlocMock();
      autoRouterMock = locator<AppRouter>();
      newRequestBlocMock = NewRequestMockBloc();
      announcementBlocMock = AnnouncementBlocMock();
      returnItemsBlocMock = ReturnItemsBlocMock();
      customerCodeBlocMock = CustomerCodeBlocMock();
      returnRequestAttachmentBlocMock = ReturnRequestAttachmentBlocMock();
      productImageBlocMock = ProductImageBlocMock();
      eligibilityBlocMock = EligibilityBlocMock();
      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
      when(() => returnItemsBlocMock.state)
          .thenReturn(ReturnItemsState.initial());
      when(() => announcementBlocMock.state)
          .thenReturn(AnnouncementState.initial());
      when(() => eligibilityBlocMock.state)
          .thenReturn(EligibilityState.initial());
      when(() => newRequestBlocMock.state)
          .thenReturn(NewRequestState.initial());
      when(() => authBlocMock.state).thenReturn(const AuthState.initial());
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => usageCodeBlocMock.state).thenReturn(UsageCodeState.initial());
      when(() => returnRequestAttachmentBlocMock.state)
          .thenReturn(ReturnRequestAttachmentState.initial());
      when(() => productImageBlocMock.state)
          .thenReturn(ProductImageState.initial());
    });

    Widget getScopedWidget() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        routeName: NewRequestPageRoute.name,
        providers: [
          BlocProvider<AnnouncementBloc>(
            create: (context) => announcementBlocMock,
          ),
          BlocProvider<AuthBloc>(create: (context) => authBlocMock),
          BlocProvider<SalesOrgBloc>(create: (context) => salesOrgBlocMock),
          BlocProvider<ReturnItemsBloc>(
            create: (context) => returnItemsBlocMock,
          ),
          BlocProvider<NewRequestBloc>(
            create: (context) => newRequestBlocMock,
          ),
          BlocProvider<CustomerCodeBloc>(
            create: (context) => customerCodeBlocMock,
          ),
          BlocProvider<UsageCodeBloc>(create: (context) => usageCodeBlocMock),
          BlocProvider<ReturnRequestAttachmentBloc>(
            create: ((context) => returnRequestAttachmentBlocMock),
          ),
          BlocProvider<ProductImageBloc>(
            create: ((context) => productImageBlocMock),
          ),
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBlocMock,
          ),
        ],
        child: const NewRequestPage(),
      );
    }

    testWidgets(
        ' => showing invalidSelectedReturnItemError when return items are from the different principals',
        (WidgetTester tester) async {
      when(() => newRequestBlocMock.state).thenReturn(
        NewRequestState.initial().copyWith(
          salesOrg: fakeSalesOrganisation.salesOrg,
          selectedItems: [
            fakeReturnMaterial.copyWith(
              itemNumber: '1',
              principalCode: PrincipalCode('fake-PrincipalCode-1'),
            ),
            fakeReturnMaterial.copyWith(
              itemNumber: '2',
              principalCode: PrincipalCode('fake-PrincipalCode-2'),
            ),
          ],
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      final invalidSelectedReturnItemError =
          find.byKey(WidgetKeys.invalidSelectedReturnItemError);
      expect(invalidSelectedReturnItemError, findsOneWidget);
    });

    testWidgets(
        ' => showing invalidSelectedReturnItemError when return items are from both ZP and MP',
        (WidgetTester tester) async {
      when(() => newRequestBlocMock.state).thenReturn(
        NewRequestState.initial().copyWith(
          salesOrg: fakeSalesOrganisation.salesOrg,
          selectedItems: [
            fakeReturnMaterial.copyWith(
              isMarketPlace: true,
            ),
            fakeReturnMaterial.copyWith(
              isMarketPlace: false,
            ),
          ],
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();

      final invalidSelectedReturnItemError =
          find.byKey(WidgetKeys.invalidSelectedReturnItemError);
      expect(invalidSelectedReturnItemError, findsOneWidget);
    });

    testWidgets(
        ' => Disable Next Button when the condition to pass step 1 is not meet',
        (WidgetTester tester) async {
      when(() => newRequestBlocMock.state).thenReturn(
        NewRequestState.initial().copyWith(
          salesOrg: fakeSalesOrganisation.salesOrg,
          selectedItems: [],
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final nextButtonFinder =
          tester.widget(find.byKey(WidgetKeys.nextButton)) as ElevatedButton;
      expect(nextButtonFinder.enabled, true);

      when(() => newRequestBlocMock.state).thenReturn(
        NewRequestState.initial().copyWith(
          salesOrg: fakeSalesOrganisation.salesOrg,
          selectedItems: [
            fakeReturnMaterial.copyWith(
              isMarketPlace: true,
            ),
            fakeReturnMaterial.copyWith(
              isMarketPlace: false,
            ),
          ],
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final nextButtonFinder2 =
          tester.widget(find.byKey(WidgetKeys.nextButton)) as ElevatedButton;
      expect(nextButtonFinder2.enabled, true);
    });

    testWidgets(
        ' => [SG market] NOT showing invalidSelectedReturnItemError when return items are from the different principals',
        (WidgetTester tester) async {
      when(() => newRequestBlocMock.state).thenReturn(
        NewRequestState.initial().copyWith(
          salesOrg: sgSalesOrganisation.salesOrg,
          selectedItems: [
            fakeReturnMaterial.copyWith(
              itemNumber: '1',
              principalCode: PrincipalCode('fake-PrincipalCode-1'),
            ),
            fakeReturnMaterial.copyWith(
              itemNumber: '2',
              principalCode: PrincipalCode('fake-PrincipalCode-2'),
            ),
          ],
        ),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final invalidSelectedReturnItemErrorMsg =
          find.byKey(WidgetKeys.invalidSelectedReturnItemErrorMsg);
      expect(invalidSelectedReturnItemErrorMsg, findsNothing);
    });
    testWidgets(' => rebuild widget when selectedItems is different',
        (WidgetTester tester) async {
      whenListen(
        newRequestBlocMock,
        Stream.fromIterable([
          NewRequestState.initial(),
          NewRequestState.initial().copyWith(
            salesOrg: sgSalesOrganisation.salesOrg,
            selectedItems: [
              fakeReturnMaterial.copyWith(
                itemNumber: '1',
                principalCode: PrincipalCode('fake-PrincipalCode-1'),
              ),
              fakeReturnMaterial.copyWith(
                itemNumber: '2',
                principalCode: PrincipalCode('fake-PrincipalCode-2'),
              ),
            ],
          ),
        ]),
      );

      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      final invalidSelectedReturnItemErrorMsg =
          find.byKey(WidgetKeys.invalidSelectedReturnItemErrorMsg);
      expect(invalidSelectedReturnItemErrorMsg, findsNothing);
    });
    testWidgets('=> show the SummaryInfo when press Return for',
        (tester) async {
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(WidgetKeys.newRequestReturnFor));
      await tester.pumpAndSettle();
      expect(
        find.byKey(WidgetKeys.addressInfoSectionActionLabel),
        findsOneWidget,
      );
    });
    testWidgets('=> Previous Button test for step 1', (tester) async {
      when(() => newRequestBlocMock.state).thenReturn(
        NewRequestState.initial().copyWith(
          salesOrg: sgSalesOrganisation.salesOrg,
          selectedItems: [
            fakeReturnMaterial.copyWith(
              itemNumber: '1',
              principalCode: PrincipalCode('fake-PrincipalCode-1'),
            ),
            fakeReturnMaterial.copyWith(
              itemNumber: '2',
              principalCode: PrincipalCode('fake-PrincipalCode-1'),
            ),
          ],
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      expect(
        find.byKey(WidgetKeys.closeButton),
        findsOneWidget,
      );
      await tester.tap(find.byKey(WidgetKeys.closeButton));
      await tester.pumpAndSettle();
      expect(find.byType(ConfirmBottomSheet), findsOneWidget);
    });

    testWidgets('=> Previous Button test for step 2', (tester) async {
      when(() => newRequestBlocMock.state).thenReturn(
        NewRequestState.initial().copyWith(
          salesOrg: sgSalesOrganisation.salesOrg,
          selectedItems: [
            fakeReturnMaterial.copyWith(
              itemNumber: '1',
              principalCode: PrincipalCode('fake-PrincipalCode-1'),
            ),
            fakeReturnMaterial.copyWith(
              itemNumber: '2',
              principalCode: PrincipalCode('fake-PrincipalCode-1'),
            ),
          ],
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      expect(
        nextButtonFinder,
        findsOneWidget,
      );
      await tester.tap(nextButtonFinder);
      await tester.pumpAndSettle();
      expect(
        find.byKey(WidgetKeys.backButton),
        findsOneWidget,
      );
      await tester.tap(find.byKey(WidgetKeys.backButton));
      await tester.pumpAndSettle();
      expect(find.byType(ConfirmBottomSheet), findsNothing);
    });

    testWidgets('=> Next Button test for step 1', (tester) async {
      when(() => newRequestBlocMock.state).thenReturn(
        NewRequestState.initial().copyWith(
          salesOrg: sgSalesOrganisation.salesOrg,
          selectedItems: [
            fakeReturnMaterial.copyWith(
              itemNumber: '1',
              principalCode: PrincipalCode('fake-PrincipalCode-1'),
            ),
            fakeReturnMaterial.copyWith(
              itemNumber: '2',
              principalCode: PrincipalCode('fake-PrincipalCode-1'),
            ),
          ],
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      expect(
        nextButtonFinder,
        findsOneWidget,
      );
      await tester.tap(nextButtonFinder);
      await tester.pumpAndSettle();
      verify(
        () => newRequestBlocMock.add(
          const NewRequestEvent.validateStep(step: 1),
        ),
      ).called(1);
    });

    testWidgets('=> Next Button test for step 2', (tester) async {
      when(() => newRequestBlocMock.state).thenReturn(
        NewRequestState.initial().copyWith(
          salesOrg: sgSalesOrganisation.salesOrg,
          invoiceDetails: [
            InvoiceDetails.empty().copyWith(
              invoiceNumber: fakeReturnMaterial.itemNumber,
              returnItemDetailsList: [
                ReturnItemDetails.empty().copyWith(
                  balanceQty: IntegerValue('1'),
                  returnReason: 'fake_reason',
                  returnQuantity: ReturnQuantity('1'),
                ),
              ],
            ),
          ],
          selectedItems: [
            fakeReturnMaterial.copyWith(
              itemNumber: '1',
              principalCode: PrincipalCode('fake-PrincipalCode-1'),
            ),
            fakeReturnMaterial.copyWith(
              itemNumber: '2',
              principalCode: PrincipalCode('fake-PrincipalCode-1'),
            ),
          ],
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      expect(
        nextButtonFinder,
        findsOneWidget,
      );
      await tester.tap(nextButtonFinder);
      await tester.pumpAndSettle();
      verify(
        () => newRequestBlocMock.add(
          const NewRequestEvent.validateStep(step: 1),
        ),
      ).called(1);
      expect(
        nextButtonFinder,
        findsOneWidget,
      );
      await tester.tap(nextButtonFinder);
      await tester.pumpAndSettle();
      verify(
        () => newRequestBlocMock.add(
          const NewRequestEvent.validateStep(step: 2),
        ),
      ).called(1);
      verify(
        () => trackMixpanelEvent(
          TrackingEvents.newReturnRequestStep,
          props: <String, dynamic>{
            TrackingProps.step: 2,
            TrackingProps.stepName: 'Fill in return details',
          },
        ),
      ).called(1);
    });
    testWidgets('=> Submit Button test ', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeRootAdminUser,
        ),
      );
      when(() => newRequestBlocMock.state).thenReturn(
        NewRequestState.initial().copyWith(
          salesOrg: sgSalesOrganisation.salesOrg,
          invoiceDetails: [
            InvoiceDetails.empty().copyWith(
              invoiceNumber: fakeReturnMaterial.itemNumber,
              returnItemDetailsList: [
                ReturnItemDetails.empty().copyWith(
                  balanceQty: IntegerValue('1'),
                  returnReason: 'fake_reason',
                  returnQuantity: ReturnQuantity('1'),
                ),
              ],
            ),
          ],
          selectedItems: [
            fakeReturnMaterial.copyWith(
              itemNumber: '1',
              principalCode: PrincipalCode('fake-PrincipalCode-1'),
            ),
            fakeReturnMaterial.copyWith(
              itemNumber: '2',
              principalCode: PrincipalCode('fake-PrincipalCode-1'),
            ),
          ],
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      expect(
        nextButtonFinder,
        findsOneWidget,
      );
      await tester.tap(nextButtonFinder);
      await tester.pumpAndSettle();
      expect(
        nextButtonFinder,
        findsOneWidget,
      );
      await tester.tap(nextButtonFinder);
      await tester.pumpAndSettle();
      expect(
        find.byKey(WidgetKeys.submitButton),
        findsOneWidget,
      );
      await tester.tap(find.byKey(WidgetKeys.submitButton));
      await tester.pumpAndSettle();
      verify(
        () => trackMixpanelEvent(
          TrackingEvents.newReturnRequestStep,
          props: <String, dynamic>{
            TrackingProps.step: 3,
            TrackingProps.stepName: 'Review return details',
          },
        ),
      ).called(1);
      verify(
        () => newRequestBlocMock.add(
          NewRequestEvent.submit(
            customerCodeInfo: fakeCustomerCodeInfo,
            user: fakeRootAdminUser,
          ),
        ),
      ).called(1);
    });
    testWidgets('=> Submit Button error section test ', (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeRootAdminUser,
        ),
      );
      when(() => newRequestBlocMock.state).thenReturn(
        NewRequestState.initial().copyWith(
          salesOrg: sgSalesOrganisation.salesOrg,
          invoiceDetails: [
            InvoiceDetails.empty().copyWith(
              invoiceNumber: fakeReturnMaterial.itemNumber,
              returnItemDetailsList: [
                ReturnItemDetails.empty().copyWith(
                  balanceQty: IntegerValue('1'),
                  returnReason: 'fake_reason',
                  returnQuantity: ReturnQuantity('1'),
                ),
              ],
            ),
          ],
          selectedItems: [
            fakeReturnMaterial.copyWith(
              itemNumber: '1',
              principalCode: PrincipalCode('fake-PrincipalCode-1'),
            ),
            fakeReturnMaterial.copyWith(
              itemNumber: '2',
              principalCode: PrincipalCode('fake-PrincipalCode-1'),
            ),
          ],
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      expect(
        nextButtonFinder,
        findsOneWidget,
      );
      await tester.tap(nextButtonFinder);
      await tester.pumpAndSettle();
      expect(
        nextButtonFinder,
        findsOneWidget,
      );
      whenListen(
        newRequestBlocMock,
        Stream.fromIterable([
          NewRequestState.initial().copyWith(isSubmitting: true),
          NewRequestState.initial().copyWith(
            failureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('fake_error'))),
          ),
        ]),
      );
      await tester.tap(nextButtonFinder);
      await tester.pumpAndSettle();
      verify(
        () => trackMixpanelEvent(
          TrackingEvents.returnRequestFailure,
          props: {
            TrackingProps.errorMessage: 'fake_error',
          },
        ),
      ).called(1);
    });

    testWidgets('=> Submit Button test when failureOrSuccessOption is none ',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          customerCodeInfo: fakeCustomerCodeInfo,
          user: fakeRootAdminUser,
        ),
      );
      when(() => newRequestBlocMock.state).thenReturn(
        NewRequestState.initial().copyWith(
          salesOrg: sgSalesOrganisation.salesOrg,
          invoiceDetails: [
            InvoiceDetails.empty().copyWith(
              invoiceNumber: fakeReturnMaterial.itemNumber,
              returnItemDetailsList: [
                ReturnItemDetails.empty().copyWith(
                  balanceQty: IntegerValue('1'),
                  returnReason: 'fake_reason',
                  returnQuantity: ReturnQuantity('1'),
                ),
              ],
            ),
          ],
          selectedItems: [
            fakeReturnMaterial.copyWith(
              itemNumber: '1',
              principalCode: PrincipalCode('fake-PrincipalCode-1'),
            ),
            fakeReturnMaterial.copyWith(
              itemNumber: '2',
              principalCode: PrincipalCode('fake-PrincipalCode-1'),
            ),
          ],
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      expect(
        nextButtonFinder,
        findsOneWidget,
      );
      await tester.tap(nextButtonFinder);
      await tester.pumpAndSettle();
      expect(
        nextButtonFinder,
        findsOneWidget,
      );
      whenListen(
        newRequestBlocMock,
        Stream.fromIterable([
          NewRequestState.initial().copyWith(isSubmitting: true),
          NewRequestState.initial(),
        ]),
      );
      await tester.tap(nextButtonFinder);
      await tester.pumpAndSettle();
      verify(
        () => trackMixpanelEvent(
          TrackingEvents.returnRequestSuccess,
          props: {
            TrackingProps.returnId: '',
            TrackingProps.totalQty: 0,
            TrackingProps.totalPrice: 0.0,
            TrackingProps.isSingle: false,
            TrackingProps.isBonusIncluded: false,
            TrackingProps.returnReason: [],
            TrackingProps.productName: [],
            TrackingProps.productManufacturer: [],
            TrackingProps.unitPrice: [],
          },
        ),
      ).called(1);
      expect(autoRouterMock.current.path, 'returns/new_request_successful');
    });
  });
}

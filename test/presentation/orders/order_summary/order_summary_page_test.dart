import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_filter/order_history_filter_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_list/order_history_list_bloc.dart';
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/application/order/order_template_list/order_template_list_bloc.dart';
import 'package:ezrxmobile/application/order/payment_term/payment_term_bloc.dart';
import 'package:ezrxmobile/application/order/saved_order/saved_order_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/bill_to_address.dart';
import 'package:ezrxmobile/domain/account/entities/bill_to_alt_name.dart';
import 'package:ezrxmobile/domain/account/entities/bill_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/bill_to_name.dart';
import 'package:ezrxmobile/domain/account/entities/customer_address.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_address.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/additional_details_data.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/payment_term.dart' as pt;
import 'package:ezrxmobile/domain/order/entities/submit_order_response.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/orders/create_order/order_summary_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';

class OrderSummaryBlocMock
    extends MockBloc<OrderSummaryEvent, OrderSummaryState>
    implements OrderSummaryBloc {}

class ShipToCodeBlocMock extends MockBloc<ShipToCodeEvent, ShipToCodeState>
    implements ShipToCodeBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class OrderTemplateListBlocMock
    extends MockBloc<OrderTemplateListEvent, OrderTemplateListState>
    implements OrderTemplateListBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class SavedOrderListBlocMock
    extends MockBloc<SavedOrderListEvent, SavedOrderListState>
    implements SavedOrderListBloc {}

class MaterialPriceBlocMock
    extends MockBloc<MaterialPriceEvent, MaterialPriceState>
    implements MaterialPriceBloc {}

class PaymentTermBlocMock extends MockBloc<PaymentTermEvent, PaymentTermState>
    implements PaymentTermBloc {}

class OrderDocumentTypeBlocMock
    extends MockBloc<OrderDocumentTypeEvent, OrderDocumentTypeState>
    implements OrderDocumentTypeBloc {}

class OrderEligibilityBlocMock
    extends MockBloc<OrderEligibilityEvent, OrderEligibilityState>
    implements OrderEligibilityBloc {}

class OrderHistoryListBlocMock
    extends MockBloc<OrderHistoryListEvent, OrderHistoryListState>
    implements OrderHistoryListBloc {}

class OrderHistoryFilterBlocMock
    extends MockBloc<OrderHistoryFilterEvent, OrderHistoryFilterState>
    implements OrderHistoryFilterBloc {}

class AdditionalDetailsBlocMock
    extends MockBloc<AdditionalDetailsEvent, AdditionalDetailsState>
    implements AdditionalDetailsBloc {}

class AutoRouterMock extends Mock implements AppRouter {}

class TenderContractBlocMock
    extends MockBloc<TenderContractEvent, TenderContractState>
    implements TenderContractBloc {}

enum StepVariant {
  three,
  five,
}

OrderSummaryState _getState(StepVariant? value) {
  switch (value!.name) {
    case 'three':
      return OrderSummaryState.initial().copyWith(
        step: 3,
        maxSteps: 4,
      );
    case 'five':
      return OrderSummaryState.initial().copyWith(
        step: 4,
        maxSteps: 4,
      );
    default:
      return OrderSummaryState.initial().copyWith(
        step: 3,
        maxSteps: 4,
      );
  }
}

final variants = ValueVariant({...StepVariant.values});

void main() {
  late OrderSummaryBloc orderSummaryBlocMock;
  late ShipToCodeBloc shipToCodeBlocMock;
  late UserBloc userBlocMock;
  late CartBloc cartBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late OrderTemplateListBloc orderTemplateListBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  late SavedOrderListBloc savedOrderListBlocMock;
  late MaterialPriceBloc materialPriceBlocMock;
  late PaymentTermBloc paymentTermBlocMock;
  late OrderDocumentTypeBloc orderDocumentTypeBlocMock;
  late AppRouter autoRouterMock;
  late OrderEligibilityBloc orderEligibilityBlocMock;
  late OrderHistoryListBloc orderHistoryListBlocMock;
  late OrderHistoryFilterBloc orderHistoryFilterBlocMock;
  late AdditionalDetailsBloc additionalDetailsBlocMock;
  late TenderContractBloc tenderContractBlocMock;
  setUpAll(
    () {
      locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
      locator.registerLazySingleton(() => AppRouter());
      locator.registerLazySingleton(
          () => CountlyService(config: locator<Config>()));
    },
  );
  setUp(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      orderSummaryBlocMock = OrderSummaryBlocMock();
      shipToCodeBlocMock = ShipToCodeBlocMock();
      userBlocMock = UserBlocMock();
      cartBlocMock = CartBlocMock();
      customerCodeBlocMock = CustomerCodeBlocMock();
      salesOrgBlocMock = SalesOrgBlocMock();
      orderTemplateListBlocMock = OrderTemplateListBlocMock();
      eligibilityBlocMock = EligibilityBlocMock();
      savedOrderListBlocMock = SavedOrderListBlocMock();
      materialPriceBlocMock = MaterialPriceBlocMock();
      paymentTermBlocMock = PaymentTermBlocMock();
      orderDocumentTypeBlocMock = OrderDocumentTypeBlocMock();
      orderEligibilityBlocMock = OrderEligibilityBlocMock();
      orderHistoryListBlocMock = OrderHistoryListBlocMock();
      orderHistoryFilterBlocMock = OrderHistoryFilterBlocMock();
      additionalDetailsBlocMock = AdditionalDetailsBlocMock();
      tenderContractBlocMock = TenderContractBlocMock();

      autoRouterMock = locator<AppRouter>();

      when(() => orderSummaryBlocMock.state)
          .thenReturn(OrderSummaryState.initial().copyWith(
        step: 3,
        maxSteps: 5,
      ));
      when(() => orderTemplateListBlocMock.state)
          .thenReturn(OrderTemplateListState.initial());
      when(() => additionalDetailsBlocMock.state)
          .thenReturn(AdditionalDetailsState.initial());
      when(() => paymentTermBlocMock.state)
          .thenReturn(PaymentTermState.initial());
      when(() => orderDocumentTypeBlocMock.state)
          .thenReturn(OrderDocumentTypeState.initial());
      when(() => materialPriceBlocMock.state)
          .thenReturn(MaterialPriceState.initial());
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial().copyWith(
        customerCodeInfo:
            CustomerCodeInfo.empty().copyWith(shipToInfos: <ShipToInfo>[
          ShipToInfo.empty().copyWith(),
        ]),
      ));
      when(
        () => orderEligibilityBlocMock.state,
      ).thenReturn(OrderEligibilityState.initial().copyWith());
      when(() => salesOrgBlocMock.state)
          .thenReturn(SalesOrgState.initial().copyWith(
        configs: SalesOrganisationConfigs.empty().copyWith(
          enableReferenceNote: true,
          enableVat: true,
          enableFutureDeliveryDay: true,
          enableMobileNumber: true,
          enableSpecialInstructions: true,
          disableOrderType: false,
          enableCollectiveNumber: true,
          enablePaymentTerms: true,
          ponRequired: true,
        ),
        salesOrganisation: SalesOrganisation.empty().copyWith(
          salesOrg: SalesOrg('2601'),
        ),
      ));
      when(() => cartBlocMock.state).thenReturn(CartState.initial());
      when(() => shipToCodeBlocMock.state)
          .thenReturn(ShipToCodeState.initial());
      when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
              customerCodeInfo:
                  CustomerCodeInfo.empty().copyWith(status: Status('EDI'))));
      when(() => userBlocMock.state).thenReturn(UserState.initial().copyWith(
          user: User.empty().copyWith(
              role: Role.empty()
                  .copyWith(type: RoleType('external_sales_rep')))));
      when(() => savedOrderListBlocMock.state)
          .thenReturn(SavedOrderListState.initial());
      when(() => tenderContractBlocMock.state)
          .thenReturn(TenderContractState.initial());
    },
  );
  group(
    'Test Order Summary Page',
    () {
      Widget getWidget() {
        return WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          providers: [
            BlocProvider<OrderSummaryBloc>(
                create: (context) => orderSummaryBlocMock),
            BlocProvider<CartBloc>(create: (context) => cartBlocMock),
            BlocProvider<UserBloc>(create: (context) => userBlocMock),
            BlocProvider<ShipToCodeBloc>(
                create: (context) => shipToCodeBlocMock),
            BlocProvider<CustomerCodeBloc>(
                create: (context) => customerCodeBlocMock),
            BlocProvider<SalesOrgBloc>(create: (context) => salesOrgBlocMock),
            BlocProvider<OrderTemplateListBloc>(
                create: (context) => orderTemplateListBlocMock),
            BlocProvider<EligibilityBloc>(
                create: (context) => eligibilityBlocMock),
            BlocProvider<SavedOrderListBloc>(
                create: (context) => savedOrderListBlocMock),
            BlocProvider<MaterialPriceBloc>(
                create: (context) => materialPriceBlocMock),
            BlocProvider<PaymentTermBloc>(
                create: (context) => paymentTermBlocMock),
            BlocProvider<OrderDocumentTypeBloc>(
                create: (context) => orderDocumentTypeBlocMock),
            BlocProvider<OrderEligibilityBloc>(
                create: (context) => orderEligibilityBlocMock),
            BlocProvider<OrderHistoryListBloc>(
                create: (context) => orderHistoryListBlocMock),
            BlocProvider<OrderHistoryFilterBloc>(
                create: (context) => orderHistoryFilterBlocMock),
            BlocProvider<AdditionalDetailsBloc>(
                create: (context) => additionalDetailsBlocMock),
            BlocProvider<TenderContractBloc>(
                create: (context) => tenderContractBlocMock),
          ],
          child: const OrderSummaryPage(),
        );
      }

      testWidgets(
        'Load Order Summary',
        (tester) async {
          await tester.pumpWidget(getWidget());
          await tester.pump();
          final orderSummaryPage = find.byKey(const Key('orderSummaryKey'));
          expect(orderSummaryPage, findsOneWidget);
        },
      );
      testWidgets(
        'Load Order Summary and StepContinue',
        (tester) async {
          when(() => salesOrgBlocMock.state)
              .thenReturn(SalesOrgState.initial().copyWith(
            configs: SalesOrganisationConfigs.empty().copyWith(
              salesOrg: SalesOrg('3000'),
              enableReferenceNote: true,
              enableVat: true,
              enableFutureDeliveryDay: true,
              enableMobileNumber: true,
              enableSpecialInstructions: true,
              disableOrderType: false,
              enableCollectiveNumber: true,
              enablePaymentTerms: true,
              ponRequired: true,
            ),
            salesOrganisation: SalesOrganisation.empty().copyWith(
              salesOrg: SalesOrg('2601'),
            ),
          ));
          when(() => orderSummaryBlocMock.state)
              .thenReturn(OrderSummaryState.initial().copyWith(
            step: 1,
            maxSteps: 4,
          ));
          await tester.pumpWidget(getWidget());
          await tester.pump();
          tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);
          tester.binding.window.devicePixelRatioTestValue = 1.0;
          final orderSummaryPage = find.byKey(const Key('orderSummaryKey'));
          expect(orderSummaryPage, findsOneWidget);
          final ediUserBanner = find.byKey(const ValueKey('EdiUserBanner'));
          expect(ediUserBanner, findsOneWidget);
          final continueKey =
              find.byKey(const Key('continueButtonKey'), skipOffstage: false);
          expect(continueKey, findsNWidgets(5));
          await tester.tap(continueKey.at(1));
          await tester.pumpAndSettle();
        },
      );

      testWidgets(
        'test CustomerDetailsStep',
        (tester) async {
          when(() => customerCodeBlocMock.state)
              .thenReturn(CustomerCodeState.initial().copyWith(
            customerCodeInfo:
                CustomerCodeInfo.empty().copyWith(shipToInfos: <ShipToInfo>[
              ShipToInfo.empty().copyWith(),
            ], emailAddresses: [
              EmailAddress('test@gmail.com')
            ]),
          ));
          when(() => salesOrgBlocMock.state)
              .thenReturn(SalesOrgState.initial().copyWith(
            configs: SalesOrganisationConfigs.empty().copyWith(
              salesOrg: SalesOrg('2800'),
              enableReferenceNote: true,
              enableVat: true,
              enableFutureDeliveryDay: true,
              enableMobileNumber: true,
              enableSpecialInstructions: true,
              disableOrderType: false,
              enableCollectiveNumber: true,
              enablePaymentTerms: true,
              ponRequired: true,
            ),
            salesOrganisation: SalesOrganisation.empty().copyWith(
              salesOrg: SalesOrg('2601'),
            ),
          ));
          when(() => orderSummaryBlocMock.state)
              .thenReturn(OrderSummaryState.initial().copyWith(
            step: 1,
            maxSteps: 5,
          ));
          final expectedStates = [
            CustomerCodeState.initial().copyWith(
              customerCodeInfo: CustomerCodeInfo.empty().copyWith(
                telephoneNumber: '1234567890',
                customerCodeSoldTo: '123456789',
                shipToInfos: <ShipToInfo>[
                  ShipToInfo.empty().copyWith(
                    shipToCustomerCode: '12345678',
                  ),
                ],
                paymentTermDescription: '30 days',
              ),
            ),
            CustomerCodeState.initial().copyWith(
              customerCodeInfo: CustomerCodeInfo.empty().copyWith(
                telephoneNumber: '1234567890',
                customerCodeSoldTo: '987654321',
                shipToInfos: <ShipToInfo>[
                  ShipToInfo.empty().copyWith(
                    shipToCustomerCode: '987654321',
                  ),
                ],
                paymentTermDescription: '30 days',
              ),
            ),
          ];
          whenListen(customerCodeBlocMock, Stream.fromIterable(expectedStates));
          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();
          final customerDetailsKey =
              find.byKey(const Key('_CustomerDetailsStepperKey'));

          final paymentDescription = find.textContaining('30 days');
          final phoneNumber = find.textContaining('1234567890');
          expect(paymentDescription, findsOneWidget);
          expect(customerDetailsKey, findsOneWidget);
          expect(phoneNumber, findsOneWidget);
        },
      );

      testWidgets(
        'test SoldToAddressStep',
        (tester) async {
          when(() => salesOrgBlocMock.state)
              .thenReturn(SalesOrgState.initial().copyWith(
            configs: SalesOrganisationConfigs.empty().copyWith(
              salesOrg: SalesOrg('PH02'),
              enableReferenceNote: true,
              enableVat: true,
              enableFutureDeliveryDay: true,
              enableMobileNumber: true,
              enableSpecialInstructions: true,
              disableOrderType: false,
              enableCollectiveNumber: true,
              enablePaymentTerms: true,
              ponRequired: true,
            ),
            salesOrganisation: SalesOrganisation.empty().copyWith(
              salesOrg: SalesOrg('2601'),
            ),
          ));
          when(() => orderSummaryBlocMock.state)
              .thenReturn(OrderSummaryState.initial().copyWith(
            step: 1,
            maxSteps: 5,
          ));
          final expectedStates = [
            CustomerCodeState.initial().copyWith(
              customerCodeInfo: CustomerCodeInfo.empty().copyWith(
                telephoneNumber: '1234567890',
                customerCodeSoldTo: '123456789',
                shipToInfos: <ShipToInfo>[
                  ShipToInfo.empty().copyWith(
                    shipToCustomerCode: '12345678',
                  ),
                ],
                paymentTermDescription: 'NA',
                customerAddress: CustomerAddress.empty().copyWith(
                  city1: 'city1',
                  city2: 'city2',
                  street1: 'street',
                ),
              ),
            ),
            CustomerCodeState.initial().copyWith(
              customerCodeInfo: CustomerCodeInfo.empty().copyWith(
                telephoneNumber: '1234567890',
                customerCodeSoldTo: '987654321',
                shipToInfos: <ShipToInfo>[
                  ShipToInfo.empty().copyWith(
                    shipToCustomerCode: '987654321',
                  ),
                ],
                customerAddress: CustomerAddress.empty().copyWith(
                  city1: 'city1',
                  city2: 'city2',
                  street1: 'street',
                ),
                paymentTermDescription: '30 days',
              ),
            ),
          ];
          whenListen(customerCodeBlocMock, Stream.fromIterable(expectedStates));
          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();

          final address = find.textContaining('street, city2, city1');
          expect(address, findsOneWidget);
        },
      );

      /*testWidgets(
        '=> test SubmitOrder',
        (tester) async {
          when(() => orderSummaryBlocMock.state)
              .thenReturn(OrderSummaryState.initial().copyWith(
            step: 3,
            maxSteps: 4,
          ));
          final expectedStates = [
            ShipToCodeState.initial().copyWith(
              shipToInfo: ShipToInfo.empty().copyWith(
                city1: 'Kolkata',
              ),
            ),
            ShipToCodeState.initial().copyWith(
              shipToInfo: ShipToInfo.empty().copyWith(
                city1: 'Bangkok',
              ),
            ),
          ];
          when(() => userBlocMock.state).thenReturn(
            UserState.initial().copyWith(
              user: User.empty().copyWith(
                role: Role.empty().copyWith(
                  type: RoleType('internal_sales_rep'),
                ),
                enableOrderType: true,
              ),
            ),
          );
          whenListen(shipToCodeBlocMock, Stream.fromIterable(expectedStates));
          tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);
          tester.binding.window.devicePixelRatioTestValue = 1.0;
          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();
          final customerDetailsKey =
              find.byKey(const Key('additionalDetailsFormKey'));
          expect(customerDetailsKey, findsOneWidget);
          final continueButtonKey = find.byKey(const Key('continueButtonKey'));
          expect(continueButtonKey, findsNWidgets(5));
          await tester.tap(continueButtonKey.at(3));
          await tester.pumpAndSettle();
        },
      );*/

      testWidgets(
        '=> test AdditionalInformationStep',
        (tester) async {
          when(() => orderSummaryBlocMock.state)
              .thenReturn(OrderSummaryState.initial().copyWith(
            step: 3,
            maxSteps: 4,
          ));
          final expectedStates = [
            ShipToCodeState.initial().copyWith(
              shipToInfo: ShipToInfo.empty().copyWith(
                city1: 'city1',
                shipToAddress: ShipToAddress.empty().copyWith(
                  street: 'street',
                  city1: 'city1',
                  city2: 'city2',
                ),
              ),
            ),
            ShipToCodeState.initial().copyWith(
              shipToInfo: ShipToInfo.empty().copyWith(
                city1: 'city1',
                city2: 'city2',
                shipToAddress: ShipToAddress.empty().copyWith(
                  street: 'street',
                  city1: 'city1',
                  city2: 'city2',
                ),
              ),
            )
          ];
          when(() => userBlocMock.state).thenReturn(
            UserState.initial().copyWith(
              user: User.empty().copyWith(
                role: Role.empty().copyWith(
                  type: RoleType('internal_sales_rep'),
                ),
                enableOrderType: true,
              ),
            ),
          );
          whenListen(shipToCodeBlocMock, Stream.fromIterable(expectedStates));
          tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);
          tester.binding.window.devicePixelRatioTestValue = 1.0;
          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();
          final customerDetailsKey =
              find.byKey(const Key('additionalDetailsFormKey'));
          expect(customerDetailsKey, findsOneWidget);
          final address = find.textContaining('street, city2, city1');
          expect(address, findsOneWidget);
          final continueButtonKey = find.byKey(const Key('continueButtonKey'));
          expect(continueButtonKey, findsNWidgets(5));
          await tester.tap(continueButtonKey.at(3));
          await tester.pumpAndSettle();
        },
      );

      testWidgets(
        '=> test saveOrder',
        (tester) async {
          when(
            () => orderSummaryBlocMock.state,
          ).thenReturn(
            OrderSummaryState.initial().copyWith(
              step: 4,
              maxSteps: 4,
            ),
          );
          when(
            () => orderEligibilityBlocMock.state,
          ).thenReturn(OrderEligibilityState.initial().copyWith());
          tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);
          tester.binding.window.devicePixelRatioTestValue = 1.0;
          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();
          final cartDetailsKey = find.byKey(const Key('_cartDetailsKey'));
          expect(cartDetailsKey, findsOneWidget);
          final saveButtonKey = find.text('Save');
          expect(saveButtonKey, findsNWidgets(5));
          await tester.tap(saveButtonKey.at(4));
          await tester.pumpAndSettle();
        },
      );

      /*testWidgets(
        '=> test submitOrder not validated',
        (tester) async {
          when(
            () => shipToCodeBlocMock.state,
          ).thenReturn(
            ShipToCodeState.initial().copyWith(
              shipToInfo: ShipToInfo.empty().copyWith(
                shipToAddress: ShipToAddress.empty().copyWith(street2: '1'),
                shipToCustomerCode: '1234567890',
                region: '11111',
                postalCode: '2222',
                telephoneNumber: '11111',
              ),
            ),
          );
          final expectedStates = [
            AdditionalDetailsState.initial().copyWith(
              additionalDetailsData: AdditionalDetailsData.empty(),
              isValidated: false,
              showErrorMessages: true,
            ),
            AdditionalDetailsState.initial().copyWith(
              additionalDetailsData: AdditionalDetailsData.empty(),
              isValidated: false,
              showErrorMessages: true,
            ),
          ];
          whenListen(shipToCodeBlocMock, Stream.fromIterable(expectedStates));
          when(
            () => orderSummaryBlocMock.state,
          ).thenReturn(
            OrderSummaryState.initial().copyWith(
              step: 4,
              maxSteps: 4,
            ),
          );
          when(
            () => orderEligibilityBlocMock.state,
          ).thenReturn(
            OrderEligibilityState.initial().copyWith(
              eligibleForOrderSubmit: true,
            ),
          );
          tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);
          tester.binding.window.devicePixelRatioTestValue = 1.0;
          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();
          final cartDetailsKey = find.byKey(const Key('_cartDetailsKey'));
          expect(cartDetailsKey, findsOneWidget);
          final submitButtonKey = find.text('Submit');
          expect(submitButtonKey, findsNWidgets(1));
          await tester.tap(submitButtonKey.at(0));
          await tester.pumpAndSettle();
        },
      );*/

      testWidgets('=>Goto Handle Listener', (tester) async {
        when(
          () => orderHistoryFilterBlocMock.state,
        ).thenReturn(OrderHistoryFilterState.initial());
        final orderSUmmaryExpectedStates = [
          OrderSummaryState.initial().copyWith(
            isSubmitSuccess: false,
            isSubmitting: true,
          ),
          OrderSummaryState.initial().copyWith(
              isSubmitSuccess: true,
              isSubmitting: false,
              submitOrderResponse: SubmitOrderResponse.empty()
                  .copyWith(salesDocument: 'XXXX-YYYY-ZZZZ')),
        ];
        whenListen(orderSummaryBlocMock,
            Stream.fromIterable(orderSUmmaryExpectedStates));
        await tester.pumpWidget(getWidget());
        await tester.pump();
        final orderSuccess = find.byKey(const Key('additionalDetailsFormKey'));
        expect(orderSuccess, findsOneWidget);
      });

      testWidgets(
        '=>Goto Order Success',
        (tester) async {
          final orderSUmmaryExpectedStates = [
            _getState(variants.currentValue!)
          ];
          whenListen(orderSummaryBlocMock,
              Stream.fromIterable(orderSUmmaryExpectedStates));
          final additionalDetailsExpectedStates = [
            AdditionalDetailsState.initial().copyWith(
              isValidated: false,
              showErrorMessages: true,
              additionalDetailsData: AdditionalDetailsData.empty().copyWith(
                customerPoReference: CustomerPoReference('REF'),
                contactNumber: ContactNumber('123456'),
                contactPerson: ContactPerson('CP'),
                paymentTerm: PaymentTerm('0001-TEST'),
              ),
            ),
            AdditionalDetailsState.initial().copyWith(
              isValidated: true,
              showErrorMessages: false,
              additionalDetailsData: AdditionalDetailsData.empty().copyWith(
                customerPoReference: CustomerPoReference('REF'),
                contactNumber: ContactNumber('123456'),
                contactPerson: ContactPerson('CP'),
                paymentTerm: PaymentTerm('0001-TEST'),
              ),
            ),
          ];
          whenListen(additionalDetailsBlocMock,
              Stream.fromIterable(additionalDetailsExpectedStates));
          await tester.pumpWidget(getWidget());
          await tester.pump();
          final orderSuccess =
              find.byKey(const Key('additionalDetailsFormKey'));
          expect(orderSuccess, findsOneWidget);
        },
        variant: variants,
      );

      testWidgets(
        '=> test submitOrder success',
        (tester) async {
          tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);
          tester.binding.window.devicePixelRatioTestValue = 1.0;
          final expectedStates = [_getState(variants.currentValue!)];
          whenListen(orderSummaryBlocMock, Stream.fromIterable(expectedStates));
          when(() => salesOrgBlocMock.state)
              .thenReturn(SalesOrgState.initial().copyWith(
            configs: SalesOrganisationConfigs.empty().copyWith(
              enableReferenceNote: true,
              enableVat: true,
              enableFutureDeliveryDay: true,
              enableMobileNumber: true,
              enableSpecialInstructions: true,
              disableOrderType: false,
              enableCollectiveNumber: true,
              enablePaymentTerms: true,
              ponRequired: true,
            ),
            salesOrganisation: SalesOrganisation.empty().copyWith(
              salesOrg: SalesOrg('2601'),
            ),
          ));
          when(() => paymentTermBlocMock.state)
              .thenReturn(PaymentTermState.initial().copyWith(
            paymentTermsDisplayLevels: ['0001-Test'],
          ));
          when(
            () => orderEligibilityBlocMock.state,
          ).thenReturn(OrderEligibilityState.initial().copyWith());

          await tester.pumpWidget(getWidget());
          await tester.pump();
          if (orderSummaryBlocMock.state.step == 3) {
            final contactNumberKey = find.byKey(const Key('contactNumberKey'));
            expect(contactNumberKey, findsOneWidget);
            await tester.enterText(contactNumberKey, '1234567890');
            await tester.pump(const Duration(seconds: 2));
            final contactPersonKey = find.byKey(const Key('contactPersonKey'));
            expect(contactPersonKey, findsOneWidget);
            await tester.enterText(contactPersonKey, 'Lionel Messi');
            await tester.pump(const Duration(seconds: 2));
            final customerPOReferenceKey =
                find.byKey(const Key('customerPOReferenceKey'));
            expect(customerPOReferenceKey, findsOneWidget);
            await tester.enterText(customerPOReferenceKey, 'PO Reference');
            await tester.pump(const Duration(seconds: 2));

            final paymentTermKey = find.byKey(const Key('_paymentTermTextKey'));
            expect(paymentTermKey, findsOneWidget);
            final dropDownFieldKey =
                find.byKey(const Key('_paymentTermTextKey'));
            expect(dropDownFieldKey, findsOneWidget);
            await tester.tap(dropDownFieldKey, warnIfMissed: false);
            await tester.pump(const Duration(seconds: 1));
            await tester.tap(find.text('0001-Test').last, warnIfMissed: false);
            await tester.pump(const Duration(seconds: 1));
            final continueButtonKey = find.text('Continue');
            expect(continueButtonKey, findsNWidgets(5));
            await tester.tap(continueButtonKey.at(3));
            await tester.pump();
          } else {
            final submitButtonKey = find.text('Submit');
            expect(submitButtonKey, findsNWidgets(5));
            await tester.tap(submitButtonKey.last, warnIfMissed: false);
            await tester.pump();
          }
        },
        variant: variants,
      );

      testWidgets(
        '=> test cancel',
        (tester) async {
          when(
            () => orderSummaryBlocMock.state,
          ).thenReturn(
            OrderSummaryState.initial().copyWith(
              step: 3,
              maxSteps: 4,
            ),
          );
          tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);
          tester.binding.window.devicePixelRatioTestValue = 1.0;
          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();
          final cartDetailsKey = find.byKey(const Key('_cartDetailsKey'));
          expect(cartDetailsKey, findsOneWidget);
          final saveButtonKey = find.text('Back');
          expect(saveButtonKey, findsNWidgets(5));
          await tester.tap(
            saveButtonKey.at(3),
            warnIfMissed: false,
          );
          await tester.pumpAndSettle();
        },
      );

      testWidgets(
        '=> test Stepper State Change',
        (tester) async {
          final expectedStates = [
            OrderSummaryState.initial().copyWith(
              step: 3,
              maxSteps: 5,
            ),
            OrderSummaryState.initial().copyWith(
              step: 4,
              maxSteps: 5,
            ),
          ];
          whenListen(orderSummaryBlocMock, Stream.fromIterable(expectedStates));
          tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);
          tester.binding.window.devicePixelRatioTestValue = 1.0;
          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();
          final cartDetailsKey = find.byKey(const Key('_cartDetailsKey'));
          expect(cartDetailsKey, findsOneWidget);
        },
      );

      testWidgets(
        '=> test Stepper with Step tapped',
        (tester) async {
          when(() => orderSummaryBlocMock.state).thenReturn(
            OrderSummaryState.initial().copyWith(
              step: 2,
              maxSteps: 5,
            ),
          );
          tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);
          tester.binding.window.devicePixelRatioTestValue = 1.0;
          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();
          final cartDetailsKey = find.text('Additional Information');
          expect(cartDetailsKey, findsOneWidget);
          await tester.tap(cartDetailsKey);
        },
      );

      testWidgets(
        '=> test AdditionalInformationStep with futureDeliveryDate',
        (tester) async {
          final config = SalesOrganisationConfigs.empty().copyWith(
            enableReferenceNote: true,
            enableVat: true,
            enableFutureDeliveryDay: true,
            enableMobileNumber: true,
            enableSpecialInstructions: true,
            disableOrderType: false,
            enableCollectiveNumber: true,
            enablePaymentTerms: true,
            futureDeliveryDay: '2',
            currency: Currency('sgd'),
          );
          final salesOrg = SalesOrganisation.empty().copyWith(
            salesOrg: SalesOrg('2601'),
          );
          when(() => salesOrgBlocMock.state).thenReturn(
            SalesOrgState.initial().copyWith(
              configs: config,
              salesOrganisation: salesOrg,
            ),
          );
          final ust = User.empty().copyWith(
            role: Role.empty().copyWith(
              type: RoleType('internal_sales_rep'),
            ),
            enableOrderType: true,
          );
          when(() => eligibilityBlocMock.state)
              .thenReturn(EligibilityState.initial().copyWith(
            salesOrganisation: salesOrg,
            salesOrgConfigs: config,
            user: ust,
          ));
          when(() => userBlocMock.state).thenReturn(
            UserState.initial().copyWith(
              user: User.empty().copyWith(
                role: Role.empty().copyWith(
                  type: RoleType('internal_sales_rep'),
                ),
                enableOrderType: true,
              ),
            ),
          );
          tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);
          tester.binding.window.devicePixelRatioTestValue = 1.0;
          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();
          final customerDetailsKey =
              find.byKey(const Key('additionalDetailsFormKey'));
          final datePickerKey = find.byKey(const Key('_DatePickerFieldKey'));
          expect(customerDetailsKey, findsOneWidget);
          expect(datePickerKey, findsOneWidget);
          await tester.ensureVisible(datePickerKey);
          await tester.tap(datePickerKey);
          await tester.pumpAndSettle();
          expect(find.text(DateTime.now().day.toString()), findsWidgets);

          await tester.tap(find.text('OK'));
          await tester.pump(const Duration(milliseconds: 500));
        },
      );

      testWidgets(
        '=> test AdditionalInformationStep with PaymentTerm',
        (tester) async {
          when(() => orderSummaryBlocMock.state)
              .thenReturn(OrderSummaryState.initial().copyWith(
            step: 3,
            maxSteps: 5,
          ));
          final expectedStates = [
            PaymentTermState.initial().copyWith(
              paymentTerms: <pt.PaymentTerm>[
                pt.PaymentTerm.empty().copyWith(
                  paymentTermCode: '0001',
                  paymentTermDescription: 'Test',
                ),
              ],
            ),
            PaymentTermState.initial().copyWith(
              paymentTerms: <pt.PaymentTerm>[
                pt.PaymentTerm.empty().copyWith(
                  paymentTermCode: 'CCP',
                  paymentTermDescription: 'COD',
                ),
              ],
            ),
          ];
          whenListen(paymentTermBlocMock, Stream.fromIterable(expectedStates));
          tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);
          tester.binding.window.devicePixelRatioTestValue = 1.0;
          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();
          final paymentTermKey = find.byKey(const Key('_paymentTermKey'));
          expect(paymentTermKey, findsOneWidget);
          final paymentTermTextKey =
              find.byKey(const Key('_paymentTermTextKey'));
          await tester.tap(paymentTermTextKey);
          await tester.pumpAndSettle();
          expect(paymentTermTextKey, findsOneWidget);
        },
      );

      testWidgets(
        '=> test Disclaimer',
        (tester) async {
          when(() => orderSummaryBlocMock.state)
              .thenReturn(OrderSummaryState.initial().copyWith(
            step: 4,
            maxSteps: 5,
          ));
          when(() => salesOrgBlocMock.state)
              .thenReturn(SalesOrgState.initial().copyWith(
            configs: SalesOrganisationConfigs.empty().copyWith(
              enableReferenceNote: true,
              enableVat: true,
              enableFutureDeliveryDay: true,
              enableMobileNumber: true,
              enableSpecialInstructions: true,
              disableOrderType: false,
              enableCollectiveNumber: true,
              enablePaymentTerms: true,
            ),
            salesOrganisation: SalesOrganisation.empty().copyWith(
              salesOrg: SalesOrg('2601'),
            ),
          ));
          when(() => userBlocMock.state).thenReturn(UserState.initial()
              .copyWith(
                  user: User.empty().copyWith(
                      role: Role.empty().copyWith(type: RoleType('client')))));

          await tester.pumpWidget(getWidget());
          await tester.pump();
          final customerDetailsKey = find.byKey(
            const Key('disclaimerKey'),
            skipOffstage: false,
          );
          expect(customerDetailsKey, findsOneWidget);
        },
      );

      testWidgets(
        '=> test BillToCustomerInfo',
        (tester) async {
          when(() => orderSummaryBlocMock.state)
              .thenReturn(OrderSummaryState.initial().copyWith(
            step: 4,
            maxSteps: 5,
          ));

          when(() => customerCodeBlocMock.state).thenReturn(
            CustomerCodeState.initial().copyWith(
              customerCodeInfo: CustomerCodeInfo.empty().copyWith(
                billToInfos: <BillToInfo>[
                  BillToInfo.empty().copyWith(
                    billToCustomerCode: '123456789',
                    billToAddress: BillToAddress.empty().copyWith(
                      city1: 'city1',
                      city2: 'city2',
                      street: 'street',
                    ),
                    billToAltName: BillToAltName.empty(),
                    billToName: BillToName.empty(),
                  ),
                ],
                shipToInfos: <ShipToInfo>[
                  ShipToInfo.empty().copyWith(city1: 'KOL'),
                ],
                customerCodeSoldTo: '987654321',
              ),
            ),
          );

          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              customerCodeInfo: CustomerCodeInfo.empty().copyWith(
                billToInfos: <BillToInfo>[
                  BillToInfo.empty().copyWith(
                    billToCustomerCode: '123456789',
                    billToAddress: BillToAddress.empty().copyWith(
                      city1: 'city1',
                      city2: 'city2',
                      street: 'street',
                    ),
                  ),
                ],
                shipToInfos: <ShipToInfo>[
                  ShipToInfo.empty().copyWith(city1: 'KOL'),
                ],
                customerCodeSoldTo: '987654321',
              ),
              salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
                enableReferenceNote: true,
                enableVat: true,
                enableFutureDeliveryDay: true,
                enableMobileNumber: true,
                enableSpecialInstructions: true,
                disableOrderType: false,
                enableCollectiveNumber: true,
                enablePaymentTerms: true,
                enableBillTo: true,
              ),
            ),
          );

          await tester.pumpWidget(getWidget());
          await tester.pump();

          final billToKey = find.byKey(
            const Key('billToCustomer'),
            skipOffstage: false,
          );
          expect(billToKey, findsOneWidget);
          final address = find.textContaining('street, city2, city1');
          expect(address, findsOneWidget);
        },
      );

      testWidgets(
        '=> test move to order success',
        (tester) async {
          final state = OrderSummaryState.initial().copyWith(
            step: 3,
          );
          final expectedStates = [
            state.copyWith(
              isSubmitting: true,
            ),
            state.copyWith(
              isSubmitting: false,
              step: 5,
            ),
            state.copyWith(
              isSubmitting: false,
              step: 5,
            ),
            state.copyWith(
              isSubmitting: false,
              step: 3,
            ),
            state.copyWith(
              isSubmitting: false,
            ),
            state.copyWith(
              isSubmitting: true,
              apiFailureOrSuccessOption: optionOf(
                const Left(
                  ApiFailure.other('Fake-Error'),
                ),
              ),
            ),
          ];
          whenListen(orderSummaryBlocMock, Stream.fromIterable(expectedStates));

          when(() => orderHistoryFilterBlocMock.state).thenReturn(
            OrderHistoryFilterState.initial().copyWith(
              isSubmitting: false,
            ),
          );

          await tester.pumpWidget(getWidget());
          await tester.pump();
          final orderSummary = find.byKey(
            const Key('orderSUmmaryBlocConsumer'),
            skipOffstage: false,
          );
          expect(orderSummary, findsOneWidget);
        },
      );

      testWidgets(
        '=> test cart items',
        (tester) async {
          when(() => orderSummaryBlocMock.state)
              .thenReturn(OrderSummaryState.initial().copyWith(
            step: 4,
            maxSteps: 4,
          ));
          final expectedStates = [
            CartState.initial().copyWith(
              selectedItemsMaterialNumber: <MaterialNumber>[
                MaterialNumber('123456789'),
              ],
              cartItemList: <PriceAggregate>[
                PriceAggregate.empty().copyWith(
                  materialInfo: MaterialInfo.empty().copyWith(
                    materialNumber: MaterialNumber('123456789'),
                  ),
                ),
                PriceAggregate.empty().copyWith(
                  materialInfo: MaterialInfo.empty().copyWith(
                    materialNumber: MaterialNumber('987654321'),
                  ),
                ),
              ],
            ),
          ];
          whenListen(cartBlocMock, Stream.fromIterable(expectedStates));

          when(() => orderHistoryFilterBlocMock.state).thenReturn(
            OrderHistoryFilterState.initial().copyWith(
              isSubmitting: false,
            ),
          );

          await tester.pumpWidget(getWidget());
          await tester.pump();
          final cartDetails = find.byKey(
            const Key('_cartDetailsKey'),
            skipOffstage: false,
          );
          expect(cartDetails, findsOneWidget);
        },
      );

      // ignore: todo
      // TODO: Biswaranjan
      // testWidgets(
      //   '=> test CartDetails',
      //   (tester) async {
      //     final expectedStates = [
      //       CartState.initial().copyWith(
      //         cartItemList: <PriceAggregate>[
      //           PriceAggregate.empty().copyWith(
      //             materialInfo: MaterialInfo.empty().copyWith(
      //               materialNumber: MaterialNumber('12345678'),
      //             ),
      //           ),
      //         ],
      //       ),
      //       CartState.initial().copyWith(
      //         cartItemList: <PriceAggregate>[
      //           PriceAggregate.empty().copyWith(
      //             materialInfo: MaterialInfo.empty().copyWith(
      //               materialNumber: MaterialNumber('87654321'),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ];
      //     when(() => orderSummaryBlocMock.state)
      //         .thenReturn(OrderSummaryState.initial().copyWith(
      //       step: 5,
      //       maxSteps: 5,
      //     ));
      //     when(() => salesOrgBlocMock.state)
      //         .thenReturn(SalesOrgState.initial().copyWith(
      //       configs: SalesOrganisationConfigs.empty().copyWith(
      //           enableReferenceNote: true,
      //           enableVat: true,
      //           enableFutureDeliveryDay: true,
      //           enableMobileNumber: true,
      //           enableSpecialInstructions: true,
      //           disableOrderType: false,
      //           enableCollectiveNumber: true,
      //           enablePaymentTerms: true,
      //           currency: Currency('vnd')),
      //       salesOrganisation: SalesOrganisation.empty().copyWith(
      //         salesOrg: SalesOrg('2601'),
      //       ),
      //     ));
      //     whenListen(cartBlocMock, Stream.fromIterable(expectedStates));
      //     await tester.pumpWidget(getWidget());
      //     await tester.pumpAndSettle();
      //     final customerDetailsKey = find.byKey(
      //       const Key('_cartDetailsKey'),
      //       skipOffstage: false,
      //     );
      //     expect(customerDetailsKey, findsOneWidget);
      //   },
      // );

      testWidgets(
        '=> test BodyContent',
        (tester) async {
          final expectedStates = [
            SavedOrderListState.initial().copyWith(
              isCreating: true,
              isDraftOrderCreated: false,
            ),
            SavedOrderListState.initial().copyWith(
              isCreating: false,
              isDraftOrderCreated: true,
            ),
            SavedOrderListState.initial().copyWith(
                isCreating: false,
                isDraftOrderCreated: false,
                apiFailureOrSuccessOption:
                    optionOf(const Left(ApiFailure.other('FAKE-ERROR')))),
          ];
          whenListen(
              savedOrderListBlocMock, Stream.fromIterable(expectedStates));

          await tester.pumpWidget(getWidget());
          await tester.pump();
          final customerDetailsKey = find.byKey(
            const Key('orderSummaryKey'),
            skipOffstage: false,
          );
          expect(customerDetailsKey, findsOneWidget);
        },
      );

      testWidgets(
        '=> test SaveTemplate',
        (tester) async {
          final expectedStates = [
            OrderTemplateListState.initial().copyWith(
              apiFailureOrSuccessOption: none(),
            ),
            OrderTemplateListState.initial().copyWith(
              apiFailureOrSuccessOption: optionOf(
                const Left(
                  ApiFailure.other('Fake-Error'),
                ),
              ),
            ),
            OrderTemplateListState.initial().copyWith(
              apiFailureOrSuccessOption: optionOf(
                const Right('succes'),
              ),
            ),
          ];
          whenListen(
              orderTemplateListBlocMock, Stream.fromIterable(expectedStates));

          await tester.pumpWidget(getWidget());
          await tester.pump();
          final customerDetailsKey = find.byKey(
            const Key('orderSummaryKey'),
            skipOffstage: false,
          );
          expect(customerDetailsKey, findsOneWidget);
          final deleteWidget =
              tester.widget(find.byIcon(Icons.featured_play_list_outlined));
          await tester.tap(find.byWidget(deleteWidget));
          await tester.pump();
          final saveButton = find.byKey(const Key('saveButton'));
          expect(saveButton, findsOneWidget);
          await tester.tap(saveButton);
          await tester.pump();
        },
      );
    },
  );
}

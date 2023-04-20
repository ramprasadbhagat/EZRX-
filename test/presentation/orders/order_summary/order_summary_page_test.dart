import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/cart/add_to_cart/add_to_cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_filter/order_history_filter_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_list/order_history_list_bloc.dart';
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/application/order/order_template_list/order_template_list_bloc.dart';
import 'package:ezrxmobile/application/order/payment_term/payment_term_bloc.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
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
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_item_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/order_document_type.dart';
import 'package:ezrxmobile/domain/order/entities/payment_term.dart' as pt;
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/entities/submit_order_response.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';

import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/orders/create_order/order_summary_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';
import '../../order_history/order_history_details_widget_test.dart';

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

class AddToCartBlocMock extends MockBloc<AddToCartEvent, AddToCartState>
    implements AddToCartBloc {}

class PoAttachmentBlocMock
    extends MockBloc<PoAttachmentEvent, PoAttachmentState>
    implements PoAttachmentBloc {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

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
  late AddToCartBloc addToCartBlocMock;
  late PoAttachmentBloc poAttachmentBlocMock;
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;

  setUpAll(
    () async {
      locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
      locator.registerLazySingleton(() => AppRouter());
      locator.registerLazySingleton(() => MixpanelService());
      locator<MixpanelService>().init(mixpanel: MixpanelMock());
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
      addToCartBlocMock = AddToCartBlocMock();
      poAttachmentBlocMock = PoAttachmentBlocMock();
      authBlocMock = AuthBlocMock();
      announcementBlocMock = AnnouncementBlocMock();

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
      when(() => orderDocumentTypeBlocMock.state).thenReturn(
          OrderDocumentTypeState.initial().copyWith(
              selectedOrderType: OrderDocumentType.empty()
                  .copyWith(documentType: DocumentType('ZPOR Test (ZPOR)'))));
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
          poNumberRequired: true,
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
      when(() => poAttachmentBlocMock.state)
          .thenReturn(PoAttachmentState.initial());
      when(() => authBlocMock.state).thenReturn(const AuthState.initial());
      when(() => announcementBlocMock.state)
          .thenReturn(AnnouncementState.initial());
    },
  );
  group('Test Order Summary Page', () {
    Widget getWidget() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<OrderSummaryBloc>(
              create: (context) => orderSummaryBlocMock),
          BlocProvider<CartBloc>(create: (context) => cartBlocMock),
          BlocProvider<UserBloc>(create: (context) => userBlocMock),
          BlocProvider<ShipToCodeBloc>(create: (context) => shipToCodeBlocMock),
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
          BlocProvider<AddToCartBloc>(create: (context) => addToCartBlocMock),
          BlocProvider<PoAttachmentBloc>(
              create: (context) => poAttachmentBlocMock),
          BlocProvider<AuthBloc>(create: (context) => authBlocMock),
          BlocProvider<AnnouncementBloc>(
              create: (context) => announcementBlocMock),
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
            poNumberRequired: true,
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
        whenListen(
            orderEligibilityBlocMock,
            Stream.fromIterable([
              OrderEligibilityState.initial(),
              OrderEligibilityState.initial().copyWith(grandTotal: 5)
            ]));
        await tester.pumpWidget(getWidget());
        await tester.pump();
        tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);
        tester.binding.window.devicePixelRatioTestValue = 1.0;
        final orderSummaryPage = find.byKey(const Key('orderSummaryKey'));
        expect(orderSummaryPage, findsOneWidget);
        final ediUserBanner = find.byKey(const ValueKey('ediUserBanner'));
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
            poNumberRequired: true,
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
              telephoneNumber: PhoneNumber('1234567890'),
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
              telephoneNumber: PhoneNumber('1234567890'),
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
            poNumberRequired: true,
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
              telephoneNumber: PhoneNumber('1234567890'),
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
              telephoneNumber: PhoneNumber('1234567890'),
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
      '=> test AdditionalInformationStep with validation check',
      (tester) async {
        when(() => additionalDetailsBlocMock.state)
            .thenReturn(AdditionalDetailsState.initial().copyWith(
                showErrorMessages: true,
                additionalDetailsData: AdditionalDetailsData.empty().copyWith(
                  customerPoReference: CustomerPoReference(''),
                  contactNumber: ContactNumber(''),
                  contactPerson: ContactPerson(''),
                )));
        when(() => orderSummaryBlocMock.state)
            .thenReturn(OrderSummaryState.initial().copyWith(
          step: 3,
          maxSteps: 4,
        ));
        when(() => eligibilityBlocMock.state)
            .thenReturn(EligibilityState.initial().copyWith(
                salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
          showPOAttachment: true,
        )));
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
        await tester.tap(customerDetailsKey);
        await tester.pump(const Duration(seconds: 2));
        await tester.enterText(
            find.byKey(const Key('customerPOReferenceKey')), '12');

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
        final orderSUmmaryExpectedStates = [_getState(variants.currentValue!)];
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
        final orderSuccess = find.byKey(const Key('additionalDetailsFormKey'));
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
            poNumberRequired: true,
          ),
          salesOrganisation: SalesOrganisation.empty().copyWith(
            salesOrg: SalesOrg('2601'),
          ),
        ));

        when(() => paymentTermBlocMock.state)
            .thenReturn(PaymentTermState.initial().copyWith(
          paymentTerms: [
            pt.PaymentTerm.empty().copyWith(
              paymentTermCode: '0001',
              paymentTermDescription: 'Test',
            ),
          ],
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
          final dropDownFieldKey = find.byKey(const Key('_paymentTermTextKey'));
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
      '=> test submitOrder button disabled and find warning text',
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
            poNumberRequired: true,
          ),
          salesOrganisation: SalesOrganisation.empty().copyWith(
            salesOrg: SalesOrg('2601'),
          ),
        ));

        when(
          () => orderEligibilityBlocMock.state,
        ).thenReturn(OrderEligibilityState.initial()
            .copyWith(orderType: 'ZPOR', cartItems: [
          PriceAggregate.empty().copyWith(
              materialInfo: MaterialInfo.empty().copyWith(
            isSampleMaterial: true,
          ))
        ]));

        await tester.pumpWidget(getWidget());
        await tester.pump();
        if (orderSummaryBlocMock.state.step == 4) {
          if (!orderEligibilityBlocMock.state.validateRegularOrderType) {
            final warningText = find.textContaining(
                'Regular orders cannot contain only sample and/or FOC materials. Please add a commercial material to proceed.'
                    .tr());
            expect(warningText, findsWidgets);
          }
          final submitButtonKey = find.text('Submit');

          expect(submitButtonKey, findsNWidgets(5));
          if (orderEligibilityBlocMock.state.eligibleForOrderSubmit) {
            await tester.tap(submitButtonKey.last, warnIfMissed: false);
            await tester.pump();
          }
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
          futureDeliveryDay: FutureDeliveryDay('2'),
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
        expect(
            find.text(
                DateTime.now().add(const Duration(days: 2)).day.toString()),
            findsWidgets);
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
        final paymentTermTextKey = find.byKey(const Key('_paymentTermTextKey'));
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
        when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
                salesOrganisation: SalesOrganisation.empty()
                    .copyWith(salesOrg: SalesOrg('2601'))));
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
        when(() => userBlocMock.state).thenReturn(UserState.initial().copyWith(
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
      '=> test price when special order type with market TH',
      (tester) async {
        when(() => orderSummaryBlocMock.state)
            .thenReturn(OrderSummaryState.initial().copyWith(
          step: 4,
          maxSteps: 4,
          additionalDetailsStep: 3,
        ));
        when(() => cartBlocMock.state).thenReturn(
          CartState.initial().copyWith(
            cartItems: [
              CartItem.material(
                PriceAggregate.empty().copyWith(
                  price: Price.empty().copyWith(
                    finalPrice: MaterialPrice(108),
                  ),
                  addedBonusList: [
                    MaterialItemBonus.empty().copyWith(
                      materialInfo: MaterialInfo.empty().copyWith(
                        materialNumber: MaterialNumber('0000000000111111'),
                      ),
                      materialDescription: ' Mosys D',
                    ),
                  ],
                  quantity: 1,
                  materialInfo: MaterialInfo.empty().copyWith(
                    materialNumber: MaterialNumber('000000000023168451'),
                    materialDescription: ' Triglyceride Mosys D',
                    principalData: PrincipalData.empty().copyWith(
                      principalName:
                          PrincipalName('å�°ç�£æ‹œè€³è‚¡ä»½æœ‰é™�å…¬å�¸'),
                    ),
                    remarks: '',
                  ),
                  stockInfo: StockInfo.empty().copyWith(
                    inStock: MaterialInStock('Yes'),
                  ),
                ),
              ),
            ],
          ),
        );
        when(() => orderDocumentTypeBlocMock.state).thenReturn(
          OrderDocumentTypeState.initial().copyWith(
              isOrderTypeSelected: true,
              selectedOrderType: OrderDocumentType.empty().copyWith(
                documentType: DocumentType('ZPFB'),
              )),
        );
        when(() => eligibilityBlocMock.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrganisation: SalesOrganisation.empty().copyWith(
              salesOrg: SalesOrg('2900'),
            ),
            selectedOrderType: OrderDocumentType.empty().copyWith(
              documentType: DocumentType('ZPFB'),
            ),
          ),
        );
        when(() => salesOrgBlocMock.state)
            .thenReturn(SalesOrgState.initial().copyWith(
          configs: SalesOrganisationConfigs.empty().copyWith(
            enableVat: true,
          ),
          salesOrganisation: SalesOrganisation.empty().copyWith(
            salesOrg: SalesOrg('2900'),
          ),
        ));
        when(() => userBlocMock.state).thenReturn(
          UserState.initial().copyWith(
            user: User.empty(),
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();
        final cartDetailsKey = find.byKey(
          const Key('_cartDetailsKey'),
          skipOffstage: false,
        );
        expect(cartDetailsKey, findsOneWidget);
        expect(find.text('Subtotal'), findsOneWidget);
        expect(find.text('Grand Total'), findsOneWidget);
        final txt = find.text(': NA 108.00');
        expect(txt, findsAtLeastNWidgets(2));
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

    // testWidgets(
    //   '=> test cart items',
    //   (tester) async {
    //     when(() => orderSummaryBlocMock.state)
    //         .thenReturn(OrderSummaryState.initial().copyWith(
    //       step: 4,
    //       maxSteps: 4,
    //     ));
    //     final expectedStates = [
    //       CartState.initial().copyWith(
    //         selectedItemsMaterialNumber: <MaterialNumber>[
    //           MaterialNumber('123456789'),
    //         ],
    //         cartItemList: <PriceAggregate>[
    //           PriceAggregate.empty().copyWith(
    //             materialInfo: MaterialInfo.empty().copyWith(
    //               materialNumber: MaterialNumber('123456789'),
    //             ),
    //           ),
    //           PriceAggregate.empty().copyWith(
    //             materialInfo: MaterialInfo.empty().copyWith(
    //               materialNumber: MaterialNumber('987654321'),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ];
    //     whenListen(cartBlocMock, Stream.fromIterable(expectedStates));

    //     when(() => orderHistoryFilterBlocMock.state).thenReturn(
    //       OrderHistoryFilterState.initial().copyWith(
    //         isSubmitting: false,
    //       ),
    //     );

    //     await tester.pumpWidget(getWidget());
    //     await tester.pump();
    //     final cartDetails = find.byKey(
    //       const Key('_cartDetailsKey'),
    //       skipOffstage: false,
    //     );
    //     expect(cartDetails, findsOneWidget);
    //   },
    // );

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
          ),
          SavedOrderListState.initial().copyWith(
            isCreating: false,
          ),
          SavedOrderListState.initial().copyWith(
              isCreating: false,
              apiFailureOrSuccessOption:
                  optionOf(const Left(ApiFailure.other('FAKE-ERROR')))),
        ];
        whenListen(savedOrderListBlocMock, Stream.fromIterable(expectedStates));

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

    testWidgets('SaveTemplateDialog close button test', (tester) async {
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial().copyWith(
        customerCodeInfo: CustomerCodeInfo.empty().copyWith(
          shipToInfos: [
            ShipToInfo.empty(),
          ],
        ),
      ));

      when(() => orderTemplateListBlocMock.state)
          .thenReturn(OrderTemplateListState.initial().copyWith(
        isSubmitting: true,
      ));

      final expectedState = [
        OrderTemplateListState.initial().copyWith(
          isSubmitting: false,
          showErrorMessages: false,
          templateName: TemplateName('test-template'),
        ),
      ];

      await tester.pumpWidget(getWidget());

      final findButton = find.byKey(const Key('orderSummarySaveTemplate'));
      await tester.tap(findButton);
      whenListen(orderTemplateListBlocMock, Stream.fromIterable(expectedState));
      await tester.pumpAndSettle();
      final findCloseButton = find.byKey(const Key('closeButton'));
      await tester.tap(findCloseButton);
      await tester.pumpAndSettle();
    });

    testWidgets('SaveTemplateTextField validator test with empty template name',
        (tester) async {
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial().copyWith(
        customerCodeInfo: CustomerCodeInfo.empty().copyWith(
          shipToInfos: [
            ShipToInfo.empty(),
          ],
        ),
      ));

      when(() => orderTemplateListBlocMock.state)
          .thenReturn(OrderTemplateListState.initial().copyWith(
        isSubmitting: false,
        templateName: TemplateName(''),
        showErrorMessages: true,
        apiFailureOrSuccessOption:
            optionOf(const Left(ApiFailure.other(' error'))),
      ));
      whenListen(
          orderTemplateListBlocMock,
          Stream.fromIterable([
            orderTemplateListBlocMock.state,
            orderTemplateListBlocMock.state.copyWith(
              apiFailureOrSuccessOption: none(),
            )
          ]));

      await tester.pumpWidget(getWidget());

      final findButton = find.byKey(const Key('orderSummarySaveTemplate'));
      await tester.tap(findButton);
      await tester.pumpAndSettle();

      final findSaveTemplateInputField =
          find.byKey(const Key('saveTemplateInputField'));
      await tester.enterText(findSaveTemplateInputField, 'test');
      await tester.pump(const Duration(milliseconds: 500));
      expect(find.text('Template name cannot be empty.'.tr()), findsOneWidget);
    });
    testWidgets(
        'SaveTemplateTextField validator test with non empty template name',
        (tester) async {
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial().copyWith(
        customerCodeInfo: CustomerCodeInfo.empty().copyWith(
          shipToInfos: [
            ShipToInfo.empty(),
          ],
        ),
      ));

      when(() => orderTemplateListBlocMock.state)
          .thenReturn(OrderTemplateListState.initial().copyWith(
        isSubmitting: false,
        templateName: TemplateName('test'),
        showErrorMessages: true,
      ));

      await tester.pumpWidget(getWidget());

      final findButton = find.byKey(const Key('orderSummarySaveTemplate'));
      await tester.tap(findButton);
      await tester.pumpAndSettle();

      final findSaveTemplateInputField =
          find.byKey(const Key('saveTemplateInputField'));
      await tester.enterText(findSaveTemplateInputField, 'test');
      await tester.pump(const Duration(milliseconds: 500));
      expect(find.text('Template name cannot be empty.'.tr()), findsNothing);
    });
    testWidgets(
      '=> test cart item update',
      (tester) async {
        when(() => orderSummaryBlocMock.state)
            .thenReturn(OrderSummaryState.initial().copyWith(
          step: 4,
          maxSteps: 4,
        ));
        // final expectedStates = [
        //   CartState.initial().copyWith(
        //     selectedItemsMaterialNumber: <MaterialNumber>[
        //       MaterialNumber('123456789'),
        //     ],
        //     cartItemList: <PriceAggregate>[
        //       PriceAggregate.empty().copyWith(
        //         materialInfo: MaterialInfo.empty().copyWith(
        //           materialNumber: MaterialNumber('123456789'),
        //         ),
        //         quantity: 10,
        //       ),
        //     ],
        //   ),
        // ];
        final expectedStates = [
          CartState.initial().copyWith(
              // selectedItemsMaterialNumber: <MaterialNumber>[
              //   MaterialNumber('123456789'),
              // ],
              cartItems: [
                CartItem.material(
                  PriceAggregate.empty().copyWith(
                    materialInfo: MaterialInfo.empty().copyWith(
                      materialNumber: MaterialNumber('123456789'),
                    ),
                    quantity: 10,
                  ),
                )
              ]),
        ];
        whenListen(cartBlocMock, Stream.fromIterable(expectedStates));
      },
    );

    testWidgets(
        'should show green delivery box if roleType is external_sales_rep',
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
        futureDeliveryDay: FutureDeliveryDay('2'),
        currency: Currency('sgd'),
        enableGreenDelivery: true,
        greenDeliveryDelayInDays: 3,
        greenDeliveryUserRole: GreenDeliveryUserRole(3),
      );

      when(() => orderSummaryBlocMock.state)
          .thenReturn(OrderSummaryState.initial().copyWith(
        step: 4,
        maxSteps: 4,
      ));
      when(() => userBlocMock.state).thenReturn(UserState.initial().copyWith(
          user: User.empty().copyWith(
              role: Role.empty()
                  .copyWith(type: RoleType('external_sales_rep')))));

      when(() => salesOrgBlocMock.state)
          .thenReturn(SalesOrgState.initial().copyWith(
        configs: config,
      ));

      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
            salesOrganisation: SalesOrganisation.empty().copyWith(
              salesOrg: SalesOrg('2601'),
            ),
            salesOrgConfigs: config,
            user: User.empty().copyWith(
                role: Role.empty()
                    .copyWith(type: RoleType('external_sales_rep')))),
      );

      await tester.pumpWidget(getWidget());

      final greeenDeliveryBox = find.byKey(const Key('greenDeliveryBox'));
      expect(greeenDeliveryBox, findsOneWidget);
    });

    testWidgets(
        'should show green delivery box if roleType is internal_sales_rep',
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
        futureDeliveryDay: FutureDeliveryDay('2'),
        currency: Currency('sgd'),
        enableGreenDelivery: true,
        greenDeliveryDelayInDays: 3,
        greenDeliveryUserRole: GreenDeliveryUserRole(3),
      );

      final user = User.empty().copyWith(
          role: Role.empty().copyWith(type: RoleType('internal_sales_rep')));

      when(() => orderSummaryBlocMock.state)
          .thenReturn(OrderSummaryState.initial().copyWith(
        step: 4,
        maxSteps: 4,
      ));
      when(() => userBlocMock.state).thenReturn(UserState.initial().copyWith(
        user: user,
      ));

      when(() => salesOrgBlocMock.state)
          .thenReturn(SalesOrgState.initial().copyWith(
        configs: config,
      ));

      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: SalesOrganisation.empty().copyWith(
            salesOrg: SalesOrg('2601'),
          ),
          salesOrgConfigs: config,
          user: user,
        ),
      );

      await tester.pumpWidget(getWidget());

      final greeenDeliveryBox = find.byKey(const Key('greenDeliveryBox'));
      expect(greeenDeliveryBox, findsOneWidget);
    });

    testWidgets('should show green delivery box if roleType is client',
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
        futureDeliveryDay: FutureDeliveryDay('2'),
        currency: Currency('sgd'),
        enableGreenDelivery: true,
        greenDeliveryDelayInDays: 3,
        greenDeliveryUserRole: GreenDeliveryUserRole(1),
      );

      final user = User.empty()
          .copyWith(role: Role.empty().copyWith(type: RoleType('client_user')));

      when(() => orderSummaryBlocMock.state)
          .thenReturn(OrderSummaryState.initial().copyWith(
        step: 4,
        maxSteps: 4,
      ));
      when(() => userBlocMock.state).thenReturn(UserState.initial().copyWith(
        user: user,
      ));

      when(() => salesOrgBlocMock.state)
          .thenReturn(SalesOrgState.initial().copyWith(
        configs: config,
      ));

      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: SalesOrganisation.empty().copyWith(
            salesOrg: SalesOrg('2601'),
          ),
          salesOrgConfigs: config,
          user: user,
        ),
      );

      await tester.pumpWidget(getWidget());

      final greeenDeliveryBox = find.byKey(const Key('greenDeliveryBox'));
      expect(greeenDeliveryBox, findsOneWidget);
    });

    testWidgets('should show green delivery box if roleType is client_user',
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
        futureDeliveryDay: FutureDeliveryDay('2'),
        currency: Currency('sgd'),
        enableGreenDelivery: true,
        greenDeliveryDelayInDays: 3,
        greenDeliveryUserRole: GreenDeliveryUserRole(2),
      );

      final user = User.empty()
          .copyWith(role: Role.empty().copyWith(type: RoleType('client_user')));

      when(() => orderSummaryBlocMock.state)
          .thenReturn(OrderSummaryState.initial().copyWith(
        step: 4,
        maxSteps: 4,
      ));
      when(() => userBlocMock.state).thenReturn(UserState.initial().copyWith(
        user: user,
      ));

      when(() => salesOrgBlocMock.state)
          .thenReturn(SalesOrgState.initial().copyWith(
        configs: config,
      ));

      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: SalesOrganisation.empty().copyWith(
            salesOrg: SalesOrg('2601'),
          ),
          salesOrgConfigs: config,
          user: user,
        ),
      );

      await tester.pumpWidget(getWidget());

      final greeenDeliveryBox = find.byKey(const Key('greenDeliveryBox'));
      expect(greeenDeliveryBox, findsOneWidget);
    });

    testWidgets('should show green delivery box if roleType is client_admin',
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
        futureDeliveryDay: FutureDeliveryDay('2'),
        currency: Currency('sgd'),
        enableGreenDelivery: true,
        greenDeliveryDelayInDays: 3,
        greenDeliveryUserRole: GreenDeliveryUserRole(2),
      );

      final user = User.empty().copyWith(
          role: Role.empty().copyWith(type: RoleType('client_admin')));

      when(() => orderSummaryBlocMock.state)
          .thenReturn(OrderSummaryState.initial().copyWith(
        step: 4,
        maxSteps: 4,
      ));
      when(() => userBlocMock.state).thenReturn(UserState.initial().copyWith(
        user: user,
      ));

      when(() => salesOrgBlocMock.state)
          .thenReturn(SalesOrgState.initial().copyWith(
        configs: config,
      ));

      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: SalesOrganisation.empty().copyWith(
            salesOrg: SalesOrg('2601'),
          ),
          salesOrgConfigs: config,
          user: user,
        ),
      );

      await tester.pumpWidget(getWidget());

      final greeenDeliveryBox = find.byKey(const Key('greenDeliveryBox'));
      expect(greeenDeliveryBox, findsOneWidget);
    });

    testWidgets(
        'should not show green delivery box if greenDeliveryUserRole is 0',
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
        futureDeliveryDay: FutureDeliveryDay('2'),
        currency: Currency('sgd'),
        enableGreenDelivery: true,
        greenDeliveryDelayInDays: 3,
        greenDeliveryUserRole: GreenDeliveryUserRole(0),
      );

      final user = User.empty().copyWith(
          role: Role.empty().copyWith(type: RoleType('client_admin')));

      when(() => orderSummaryBlocMock.state)
          .thenReturn(OrderSummaryState.initial().copyWith(
        step: 4,
        maxSteps: 4,
      ));
      when(() => userBlocMock.state).thenReturn(UserState.initial().copyWith(
        user: user,
      ));

      when(() => salesOrgBlocMock.state)
          .thenReturn(SalesOrgState.initial().copyWith(
        configs: config,
      ));

      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: SalesOrganisation.empty().copyWith(
            salesOrg: SalesOrg('2601'),
          ),
          salesOrgConfigs: config,
          user: user,
        ),
      );

      await tester.pumpWidget(getWidget());

      final greeenDeliveryBox = find.byKey(const Key('greenDeliveryBox'));
      expect(greeenDeliveryBox, findsNothing);
    });

    testWidgets(
        'should not show green delivery box if greenDeliveryUserRole is 2 and userRole is root_admin',
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
        futureDeliveryDay: FutureDeliveryDay('2'),
        currency: Currency('sgd'),
        enableGreenDelivery: true,
        greenDeliveryDelayInDays: 3,
        greenDeliveryUserRole: GreenDeliveryUserRole(2),
      );

      final user = User.empty()
          .copyWith(role: Role.empty().copyWith(type: RoleType('root_admin')));

      when(() => orderSummaryBlocMock.state)
          .thenReturn(OrderSummaryState.initial().copyWith(
        step: 4,
        maxSteps: 4,
      ));
      when(() => userBlocMock.state).thenReturn(UserState.initial().copyWith(
        user: user,
      ));

      when(() => salesOrgBlocMock.state)
          .thenReturn(SalesOrgState.initial().copyWith(
        configs: config,
      ));

      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrganisation: SalesOrganisation.empty().copyWith(
            salesOrg: SalesOrg('2601'),
          ),
          salesOrgConfigs: config,
          user: user,
        ),
      );

      await tester.pumpWidget(getWidget());

      final greeenDeliveryBox = find.byKey(const Key('greenDeliveryBox'));
      expect(greeenDeliveryBox, findsNothing);
    });

    // testWidgets(
    //   '=> test cart item update',
    //   (tester) async {
    //     when(() => orderSummaryBlocMock.state)
    //         .thenReturn(OrderSummaryState.initial().copyWith(
    //       step: 4,
    //       maxSteps: 4,
    //     ));
    //     final expectedStates = [
    //       CartState.initial().copyWith(
    //         selectedItemsMaterialNumber: <MaterialNumber>[
    //           MaterialNumber('123456789'),
    //         ],
    //         cartItemList: <PriceAggregate>[
    //           PriceAggregate.empty().copyWith(
    //             materialInfo: MaterialInfo.empty().copyWith(
    //               materialNumber: MaterialNumber('123456789'),
    //             ),
    //             quantity: 10,
    //           ),
    //         ],
    //       ),
    //     ];
    //     whenListen(cartBlocMock, Stream.fromIterable(expectedStates));
    //     when(() => orderHistoryFilterBlocMock.state).thenReturn(
    //       OrderHistoryFilterState.initial().copyWith(
    //         isSubmitting: false,
    //       ),
    //     );

    //     when(() => addToCartBlocMock.state).thenReturn(
    //       AddToCartState.initial().copyWith(
    //         cartItem: PriceAggregate.empty().copyWith(
    //           materialInfo: MaterialInfo.empty().copyWith(
    //             materialNumber: MaterialNumber('123456789'),
    //           ),
    //         ),
    //         quantity: 10,
    //       ),
    //     );

    //     await tester.pumpWidget(getWidget());
    //     await tester.pump();

    //     final cartMaterialItemTile = find.byType(
    //       CartMaterialItemTile,
    //       skipOffstage: false,
    //     );
    //     expect(cartMaterialItemTile, findsOneWidget);

    //     await tester.dragUntilVisible(
    //       cartMaterialItemTile,
    //       cartMaterialItemTile,
    //       const Offset(0, -500),
    //     );
    //     await tester.pump();

    //     await tester.tap(cartMaterialItemTile);
    //     await tester.pump();

    //     final incrementQuantity = find.byKey(const Key('cartItemAdd'));
    //     expect(incrementQuantity, findsOneWidget);
    //     await tester.tap(incrementQuantity, warnIfMissed: false);
    //     await tester.pump();

    //     final updateCartButton = find.byKey(const Key('updateCart'));
    //     expect(updateCartButton, findsOneWidget);
    //     await tester.tap(updateCartButton, warnIfMissed: false);
    //     await tester.pump();

    //     final quantityUpdatedWidget = find.text('10');
    //     expect(quantityUpdatedWidget, findsOneWidget);
    //   },
    // );

    testWidgets(
      'Show Update Button when add to cart from Saved Order',
      (tester) async {
        when(() => orderSummaryBlocMock.state)
            .thenReturn(OrderSummaryState.initial().copyWith(
          step: 4,
          maxSteps: 4,
        ));

        when(() => additionalDetailsBlocMock.state).thenReturn(
          AdditionalDetailsState.initial().copyWith(
            orderId: 'fake-id',
          ),
        );

        when(() => userBlocMock.state).thenReturn(UserState.initial());

        when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
        tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);
        tester.binding.window.devicePixelRatioTestValue = 1.0;
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final updateButton = find.text('Update');
        expect(updateButton, findsNWidgets(5));
        await tester.tap(updateButton.at(4));

        verify(
          () => savedOrderListBlocMock.add(
            SavedOrderListEvent.updateDraft(
              shipToInfo: ShipToInfo.empty(),
              user: User.empty(),
              cartItems: [],
              grandTotal: 0,
              customerCodeInfo: CustomerCodeInfo.empty().copyWith(
                shipToInfos: <ShipToInfo>[
                  ShipToInfo.empty().copyWith(),
                ],
              ),
              salesOrganisation: SalesOrganisation.empty(),
              data: AdditionalDetailsData.empty(),
              orderId: 'fake-id',
            ),
          ),
        ).called(1);
      },
    );

    testWidgets(
      '=> test submit without batch number',
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
          () => cartBlocMock.state,
        ).thenReturn(
          CartState.initial().copyWith(cartItems: [
            CartItem.material(
              PriceAggregate.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  materialNumber: MaterialNumber('123456789'),
                ),
                stockInfo: StockInfo.empty(),
                salesOrgConfig: SalesOrganisationConfigs.empty().copyWith(
                  enableBatchNumber: true,
                ),
                quantity: 10,
              ),
            ),
          ]),
        );

        whenListen(
            additionalDetailsBlocMock,
            Stream.fromIterable(
              [
                AdditionalDetailsState.initial().copyWith(
                  isValidated: false,
                ),
                AdditionalDetailsState.initial().copyWith(
                  isValidated: true,
                ),
              ],
            ));
        tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);
        tester.binding.window.devicePixelRatioTestValue = 1.0;
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        final cartDetailsKey = find.byKey(const Key('_cartDetailsKey'));
        expect(cartDetailsKey, findsOneWidget);
        final disclaimer = find.textContaining('Batch Number is empty');
        expect(disclaimer, findsOneWidget);
      },
    );

    testWidgets(
      '=> test submit with batch number',
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
          () => cartBlocMock.state,
        ).thenReturn(
          CartState.initial().copyWith(
            cartItems: [
              CartItem.material(
                PriceAggregate.empty().copyWith(
                  materialInfo: MaterialInfo.empty().copyWith(
                    materialNumber: MaterialNumber('123456789'),
                  ),
                  stockInfo: StockInfo.empty(),
                  salesOrgConfig: SalesOrganisationConfigs.empty().copyWith(
                    enableBatchNumber: true,
                  ),
                  quantity: 10,
                ),
              ).copyWith(isSelected: false),
              CartItem.material(
                PriceAggregate.empty().copyWith(
                  materialInfo: MaterialInfo.empty().copyWith(
                    materialNumber: MaterialNumber('123456790'),
                  ),
                  stockInfo: StockInfo.empty().copyWith(
                    batch: BatchNumber('fake-batch'),
                  ),
                  salesOrgConfig: SalesOrganisationConfigs.empty().copyWith(
                    enableBatchNumber: true,
                  ),
                  quantity: 10,
                ),
              ),
            ],
          ),
        );

        whenListen(
            additionalDetailsBlocMock,
            Stream.fromIterable(
              [
                AdditionalDetailsState.initial().copyWith(
                  isValidated: false,
                ),
                AdditionalDetailsState.initial().copyWith(
                  isValidated: true,
                ),
              ],
            ));
        tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);
        tester.binding.window.devicePixelRatioTestValue = 1.0;
        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();
        final cartDetailsKey = find.byKey(const Key('_cartDetailsKey'));
        expect(cartDetailsKey, findsOneWidget);
        final disclaimer = find.textContaining('Batch Number is empty');
        expect(disclaimer, findsNothing);
      },
    );

    testWidgets(
      'Customer Details should display selected shipToCode not the default one',
      (tester) async {
        when(
          () => orderSummaryBlocMock.state,
        ).thenReturn(
          OrderSummaryState.initial().copyWith(
            step: 0,
            maxSteps: 4,
            additionalDetailsStep: 3,
          ),
        );

        when(
          () => salesOrgBlocMock.state,
        ).thenReturn(
          SalesOrgState.initial().copyWith(
            salesOrganisation: SalesOrganisation.empty().copyWith(
              salesOrg: SalesOrg('2800'),
            ),
          ),
        );

        when(
          () => customerCodeBlocMock.state,
        ).thenReturn(
          CustomerCodeState.initial().copyWith(
            customerCodeInfo: CustomerCodeInfo.empty().copyWith(
              customerCodeSoldTo: '0030038539',
              shipToInfos: [
                ShipToInfo.empty().copyWith(
                  shipToCustomerCode: '0070100094',
                  defaultShipToAddress: true,
                ),
                ShipToInfo.empty().copyWith(
                  shipToCustomerCode: '0070100095',
                  defaultShipToAddress: false,
                ),
              ],
            ),
          ),
        );

        when(
          () => shipToCodeBlocMock.state,
        ).thenReturn(
          ShipToCodeState.initial().copyWith(
            shipToInfo: ShipToInfo.empty().copyWith(
              shipToCustomerCode: '0070100095',
              defaultShipToAddress: false,
            ),
          ),
        );

        when(
          () => cartBlocMock.state,
        ).thenReturn(
          CartState.initial().copyWith(
            cartItems: [
              CartItem.material(
                PriceAggregate.empty().copyWith(
                  materialInfo: MaterialInfo.empty().copyWith(
                    materialNumber: MaterialNumber('123456789'),
                  ),
                ),
              ),
            ],
          ),
        );

        await tester.pumpWidget(getWidget());
        await tester.pumpAndSettle();

        final key = 'Customer ship to ID'.tr();
        expect(find.text(key), findsOneWidget);
        const value = ': 0070100095';
        expect(find.text(value), findsAtLeastNWidgets(2));
      },
    );
  });
}

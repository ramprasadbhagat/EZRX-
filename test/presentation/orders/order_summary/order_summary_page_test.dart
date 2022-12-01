import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/application/order/order_template_list/order_template_list_bloc.dart';
import 'package:ezrxmobile/application/order/payment_term/payment_term_bloc.dart';
import 'package:ezrxmobile/application/order/saved_order/saved_order_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/payment_term.dart';
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

class AutoRouterMock extends Mock implements AppRouter {}

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
  setUpAll(
    () {
      locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
      locator.registerLazySingleton(() => AppRouter());
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
      autoRouterMock = locator<AppRouter>();

      when(() => orderSummaryBlocMock.state)
          .thenReturn(OrderSummaryState.initial().copyWith(
        step: 3,
        maxSteps: 5,
      ));
      when(() => orderTemplateListBlocMock.state)
          .thenReturn(OrderTemplateListState.initial());
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
      when(() => cartBlocMock.state).thenReturn(CartState.initial());
      when(() => shipToCodeBlocMock.state)
          .thenReturn(ShipToCodeState.initial());
      when(() => eligibilityBlocMock.state)
          .thenReturn(EligibilityState.initial().copyWith());
      when(() => userBlocMock.state).thenReturn(UserState.initial().copyWith(
          user: User.empty().copyWith(
              role: Role.empty()
                  .copyWith(type: RoleType('external_sales_rep')))));
      when(() => savedOrderListBlocMock.state)
          .thenReturn(SavedOrderListState.initial());
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
      /*testWidgets(
        'Load Order Summary and StepContinue',
        (tester) async {
          await tester.pumpWidget(getWidget());
          await tester.pump();
          final orderSummaryPage = find.byKey(const Key('orderSummaryKey'));
          expect(orderSummaryPage, findsOneWidget);
          when(() => orderSummaryBlocMock.state)
              .thenReturn(OrderSummaryState.initial().copyWith(
            step: 2,
            maxSteps: 5,
          ));
          final continueKey =
              find.byKey(const Key('continueButtonKey'), skipOffstage: false);

          expect(continueKey, findsNWidgets(6));
          for (var i = 0; i <= 5; i++) {
            if (i == 5) {
              final submitButtonKey =
                  find.byKey(const Key('submitButtonKey'), skipOffstage: false);
              expect(submitButtonKey, findsOneWidget);
            } else {
              await tester.ensureVisible(continueKey.at(2));
              await tester.pumpAndSettle();
              await tester.tap(continueKey.at(2));
              await tester.pumpAndSettle();
            }
          }
        },
      );*/

      testWidgets(
        'test CustomerDetailsStep',
        (tester) async {
          final expectedStates = [
            CustomerCodeState.initial().copyWith(
              customerCodeInfo: CustomerCodeInfo.empty().copyWith(
                customerCodeSoldTo: '123456789',
                shipToInfos: <ShipToInfo>[
                  ShipToInfo.empty().copyWith(
                    shipToCustomerCode: '12345678',
                  ),
                ],
              ),
            ),
            CustomerCodeState.initial().copyWith(
              customerCodeInfo: CustomerCodeInfo.empty().copyWith(
                customerCodeSoldTo: '987654321',
                shipToInfos: <ShipToInfo>[
                  ShipToInfo.empty().copyWith(
                    shipToCustomerCode: '987654321',
                  ),
                ],
              ),
            ),
          ];
          whenListen(customerCodeBlocMock, Stream.fromIterable(expectedStates));
          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();
          final customerDetailsKey =
              find.byKey(const Key('_CustomerDetailsStepperKey'));
          expect(customerDetailsKey, findsOneWidget);
        },
      );

      testWidgets(
        '=> test AdditionalInformationStep',
        (tester) async {
          when(() => orderSummaryBlocMock.state)
              .thenReturn(OrderSummaryState.initial().copyWith(
            step: 3,
            maxSteps: 5,
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
              find.byKey(const Key('_additionalDetailsFormKey'));
          expect(customerDetailsKey, findsOneWidget);
          final continueButtonKey = find.byKey(const Key('continueButtonKey'));
          expect(continueButtonKey, findsNWidgets(6));
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
              step: 5,
              maxSteps: 5,
            ),
          );
          tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);
          tester.binding.window.devicePixelRatioTestValue = 1.0;
          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();
          final cartDetailsKey = find.byKey(const Key('_cartDetailsKey'));
          expect(cartDetailsKey, findsOneWidget);
          final saveButtonKey = find.text('Save');
          expect(saveButtonKey, findsNWidgets(6));
          await tester.tap(saveButtonKey.at(5));
          await tester.pumpAndSettle();
        },
      );

      testWidgets(
        '=> test cancel',
        (tester) async {
          when(
            () => orderSummaryBlocMock.state,
          ).thenReturn(
            OrderSummaryState.initial().copyWith(
              step: 4,
              maxSteps: 5,
            ),
          );
          tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);
          tester.binding.window.devicePixelRatioTestValue = 1.0;
          await tester.pumpWidget(getWidget());
          await tester.pumpAndSettle();
          final cartDetailsKey = find.byKey(const Key('_cartDetailsKey'));
          expect(cartDetailsKey, findsOneWidget);
          final saveButtonKey = find.text('Back');
          expect(saveButtonKey, findsNWidgets(6));
          await tester.tap(saveButtonKey.at(4));
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
              find.byKey(const Key('_additionalDetailsFormKey'));
          final datePickerKey = find.byKey(const Key('_DatePickerFieldKey'));
          expect(customerDetailsKey, findsOneWidget);
          expect(datePickerKey, findsOneWidget);
          await tester.ensureVisible(datePickerKey);
          await tester.tap(datePickerKey);
          await tester.pumpAndSettle();
          expect(find.text(DateTime.now().day.toString()),
              findsAtLeastNWidgets(1));

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
              paymentTerms: <PaymentTerm>[
                PaymentTerm.empty().copyWith(
                  paymentTermCode: '0001',
                  paymentTermDescription: 'Test',
                ),
              ],
            ),
            PaymentTermState.initial().copyWith(
              paymentTerms: <PaymentTerm>[
                PaymentTerm.empty().copyWith(
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

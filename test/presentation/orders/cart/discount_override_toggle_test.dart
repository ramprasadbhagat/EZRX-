import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/discount_override/discount_override_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';

import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/override/discount_override_toggle.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

class TenderContractBlocMock
    extends MockBloc<TenderContractEvent, TenderContractState>
    implements TenderContractBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class DiscountOverrideBlocMock
    extends MockBloc<DiscountOverrideEvent, DiscountOverrideState>
    implements DiscountOverrideBloc {}

void main() {
  late PriceAggregate cartItem;
  late SalesOrgBloc salesOrgBloc;
  late EligibilityBloc eligibilityBloc;
  late CustomerCodeBloc customerCodeBloc;

  late CartBloc cartBloc;
  late AppRouter autoRouter;
  late DiscountOverrideBloc discountOverrideBlocMock;
  late Price price;

  setUpAll(() {
    locator.registerFactory(() => AppRouter());
    autoRouter = locator<AppRouter>();
  });
  setUp(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      salesOrgBloc = SalesOrgBlocMock();
      eligibilityBloc = EligibilityBlocMock();
      customerCodeBloc = CustomerCodeBlocMock();
      cartBloc = CartBlocMock();
      discountOverrideBlocMock = DiscountOverrideBlocMock();
      price = Price.empty().copyWith(
        finalPrice: MaterialPrice(2),
      );
      cartItem = PriceAggregate.empty().copyWith(
        quantity: 2,
        materialInfo: MaterialInfo.empty().copyWith(
          materialNumber: MaterialNumber('000000000023168451'),
          materialDescription: ' Triglyceride Mosys D',
          principalData: PrincipalData.empty().copyWith(
            principalName: PrincipalName('台灣拜耳股份有限公司'),
          ),
          quantity: 2,
        ),
      );
      when(() => salesOrgBloc.state).thenReturn(SalesOrgState.initial());
      when(() => eligibilityBloc.state).thenReturn(EligibilityState.initial());
      when(() => customerCodeBloc.state).thenReturn(
        CustomerCodeState.initial(),
      );

      when(() => cartBloc.state).thenReturn(
        CartState.initial().copyWith(isFetching: false),
      );
      when(() => discountOverrideBlocMock.state)
          .thenReturn(DiscountOverrideState.initial());
    },
  );
  group('Test DiscountOverrideToggle', () {
    Widget getWidget() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouter,
        providers: [
          BlocProvider<EligibilityBloc>(create: (context) => eligibilityBloc),
          BlocProvider<SalesOrgBloc>(create: (context) => salesOrgBloc),
          BlocProvider<CustomerCodeBloc>(
            create: (context) => customerCodeBloc,
          ),
          BlocProvider<CartBloc>(create: (context) => cartBloc),
          BlocProvider<DiscountOverrideBloc>(
            create: (context) => discountOverrideBlocMock,
          ),
        ],
        child: Scaffold(
          body: DiscountOverrideToggle(
            cartItem: cartItem,
          ),
        ),
      );
    }

    Widget getDiscountOverrideFormWidget() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouter,
        providers: [
          BlocProvider<EligibilityBloc>(create: (context) => eligibilityBloc),
          BlocProvider<SalesOrgBloc>(create: (context) => salesOrgBloc),
          BlocProvider<CustomerCodeBloc>(
            create: (context) => customerCodeBloc,
          ),
          BlocProvider<CartBloc>(create: (context) => cartBloc),
          BlocProvider<DiscountOverrideBloc>(
            create: (context) => discountOverrideBlocMock,
          ),
        ],
        child: Scaffold(
          body: DiscountOverrideForm(
            controller: TextEditingController(),
          ),
        ),
      );
    }

    testWidgets(
      'DiscountOverride change from error state to valid state',
      (tester) async {
        final expectedStates = [
          DiscountOverrideState.initial().copyWith(
            apiFailureOrSuccessOption: optionOf(
              const Left(ApiFailure.other('Fake-Error')),
            ),
          ),
          DiscountOverrideState.initial().copyWith(
            materialPrice: price,
          ),
        ];
        whenListen(
          discountOverrideBlocMock,
          Stream.fromIterable(expectedStates),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();
        final discountOverride = find.byKey(const Key('discountOverride'));
        expect(discountOverride, findsOneWidget);
        // verify(
        //   () => cartBloc.add(
        //     CartEvent.updateCartItem(
        //       item: cartItem.copyWith(
        //         price: price,
        //       ),
        //       customerCodeInfo: CustomerCodeInfo.empty(),
        //       doNotallowOutOfStockMaterial: true,
        //       salesOrganisation: SalesOrganisation.empty(),
        //       salesOrganisationConfigs: SalesOrganisationConfigs.empty(),
        //       shipToInfo: ShipToInfo.empty(),
        //     ),
        //   ),
        // ).called(1);
      },
    );

    testWidgets(
      'DiscountOverride Switch toggel on',
      (tester) async {
        final expectedStates = [
          DiscountOverrideState.initial().copyWith(),
          DiscountOverrideState.initial().copyWith(
            apiFailureOrSuccessOption: optionOf(
              const Right(null),
            ),
            materialPrice: price,
            showErrorMessages: true,
          ),
        ];
        whenListen(
          discountOverrideBlocMock,
          Stream.fromIterable(expectedStates),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final discountOverride = find.byKey(const Key('discountOverride'));
        expect(discountOverride, findsOneWidget);
        final switchFinder = find.byType(CupertinoSwitch);
        await tester.drag(switchFinder, const Offset(2000, 0));
        await tester.pump();
        final discountOverridsDialog =
            find.byKey(const Key('discountOverridsDialog'));
        expect(discountOverridsDialog, findsOneWidget);
        final cancel = find.byKey(const Key('cancel'));
        expect(cancel, findsOneWidget);
        final submit = find.byKey(const Key('Submit'));
        expect(submit, findsOneWidget);
        final discountOvverrideField =
            find.byKey(const Key('discountOvverrideField'));
        expect(discountOvverrideField, findsOneWidget);
        await tester.enterText(discountOvverrideField, 'test');
        await tester.pump();
      },
    );

    testWidgets(
      'cancel DiscountOverride Dailog',
      (tester) async {
        final expectedStates = [
          DiscountOverrideState.initial().copyWith(),
          DiscountOverrideState.initial().copyWith(
            materialPrice: price,
            showErrorMessages: true,
          ),
        ];
        whenListen(
          discountOverrideBlocMock,
          Stream.fromIterable(expectedStates),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final discountOverride = find.byKey(const Key('discountOverride'));
        expect(discountOverride, findsOneWidget);
        final switchFinder = find.byType(CupertinoSwitch);
        await tester.drag(switchFinder, const Offset(2000, 0));
        await tester.pump();
        final discountOverridsDialog =
            find.byKey(const Key('discountOverridsDialog'));
        expect(discountOverridsDialog, findsOneWidget);
        final cancel = find.byKey(const Key('cancel'));
        expect(cancel, findsOneWidget);
        await tester.tap(cancel);
      },
    );
    testWidgets(
      'DiscountOverride submit',
      (tester) async {
        final expectedStates = [
          DiscountOverrideState.initial().copyWith(),
          DiscountOverrideState.initial().copyWith(
            materialPrice: price,
            showErrorMessages: true,
          ),
        ];
        whenListen(
          discountOverrideBlocMock,
          Stream.fromIterable(expectedStates),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final discountOverride = find.byKey(const Key('discountOverride'));
        expect(discountOverride, findsOneWidget);
        final switchFinder = find.byType(CupertinoSwitch);
        await tester.drag(switchFinder, const Offset(2000, 0));
        await tester.pump();
        final discountOverridsDialog =
            find.byKey(const Key('discountOverridsDialog'));
        expect(discountOverridsDialog, findsOneWidget);
        final submit = find.byKey(const Key('Submit'));
        expect(submit, findsOneWidget);
        await tester.tap(submit);
        verify(
          () => discountOverrideBlocMock.add(
            DiscountOverrideEvent.fetch(
              price: Price.empty().copyWith(
                zdp8Override: Zdp8OverrideValue(10),
              ),
              shipToInfo: ShipToInfo.empty(),
              customerCode: CustomerCodeInfo.empty(),
              materialNumber: cartItem.getMaterialNumber,
              salesOrganisation: SalesOrganisation.empty(),
              material: cartItem.materialInfo,
            ),
          ),
        ).called(1);
      },
    );

    testWidgets(
      'DiscountOverride submit failure snackbar visible',
      (tester) async {
        final expectedStates = [
          DiscountOverrideState.initial().copyWith(),
          DiscountOverrideState.initial().copyWith(
            apiFailureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('fake-error'),
              ),
            ),
          ),
        ];
        whenListen(
          discountOverrideBlocMock,
          Stream.fromIterable(expectedStates),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final discountOverride = find.byKey(const Key('discountOverride'));
        expect(discountOverride, findsOneWidget);
        final switchFinder = find.byType(CupertinoSwitch);
        await tester.drag(switchFinder, const Offset(2000, 0));
        await tester.pump();
        final discountOverridsDialog =
            find.byKey(const Key('discountOverridsDialog'));
        expect(discountOverridsDialog, findsOneWidget);
        final submit = find.byKey(const Key('Submit'));
        expect(submit, findsOneWidget);
        await tester.tap(submit);
        verify(
          () => discountOverrideBlocMock.add(
            DiscountOverrideEvent.fetch(
              price: Price.empty().copyWith(
                zdp8Override: Zdp8OverrideValue(10),
              ),
              shipToInfo: ShipToInfo.empty(),
              customerCode: CustomerCodeInfo.empty(),
              materialNumber: cartItem.getMaterialNumber,
              salesOrganisation: SalesOrganisation.empty(),
              material: cartItem.materialInfo,
            ),
          ),
        ).called(1);
        final snackBarMessage = find.byKey(WidgetKeys.customSnackBar);
        expect(snackBarMessage, findsOneWidget);
      },
    );

    testWidgets(
      'DiscountOverride submit success snackbar not visible',
      (tester) async {
        final expectedStates = [
          DiscountOverrideState.initial().copyWith(),
          DiscountOverrideState.initial().copyWith(
            materialPrice: price,
            showErrorMessages: true,
          ),
        ];
        whenListen(
          discountOverrideBlocMock,
          Stream.fromIterable(expectedStates),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();

        final discountOverride = find.byKey(const Key('discountOverride'));
        expect(discountOverride, findsOneWidget);
        final switchFinder = find.byType(CupertinoSwitch);
        await tester.drag(switchFinder, const Offset(2000, 0));
        await tester.pump();
        final discountOverridsDialog =
            find.byKey(const Key('discountOverridsDialog'));
        expect(discountOverridsDialog, findsOneWidget);
        final submit = find.byKey(const Key('Submit'));
        expect(submit, findsOneWidget);
        await tester.tap(submit);
        verify(
          () => discountOverrideBlocMock.add(
            DiscountOverrideEvent.fetch(
              price: Price.empty().copyWith(
                zdp8Override: Zdp8OverrideValue(10),
              ),
              shipToInfo: ShipToInfo.empty(),
              customerCode: CustomerCodeInfo.empty(),
              materialNumber: cartItem.getMaterialNumber,
              salesOrganisation: SalesOrganisation.empty(),
              material: cartItem.materialInfo,
            ),
          ),
        ).called(1);
        final snackBarMessage = find.byKey(WidgetKeys.customSnackBar);
        expect(snackBarMessage, findsNothing);
      },
    );

    testWidgets(
      'DiscountOverride submit empty',
      (tester) async {
        final expectedStates = [
          DiscountOverrideState.initial().copyWith(),
          DiscountOverrideState.initial().copyWith(
            materialPrice: price,
            showErrorMessages: true,
          ),
        ];
        whenListen(
          discountOverrideBlocMock,
          Stream.fromIterable(expectedStates),
        );

        await tester.pumpWidget(getWidget());
        await tester.pump();

        final discountOverride = find.byKey(const Key('discountOverride'));
        expect(discountOverride, findsOneWidget);
        final switchFinder = find.byType(CupertinoSwitch);
        await tester.drag(switchFinder, const Offset(2000, 0));
        await tester.pump();
        final discountOverridsDialog =
            find.byKey(const Key('discountOverridsDialog'));
        expect(discountOverridsDialog, findsOneWidget);
        final discountOvverrideField =
            find.byKey(const Key('discountOvverrideField'));
        expect(discountOvverrideField, findsOneWidget);
        await tester.enterText(discountOvverrideField, '');
        final submit = find.byKey(const Key('Submit'));
        expect(submit, findsOneWidget);
        await tester.tap(submit);
        verify(
          () => discountOverrideBlocMock.add(
            DiscountOverrideEvent.update(
              price: Price.empty(),
              showErrorMessages: true,
            ),
          ),
        ).called(1);
      },
    );

    testWidgets(
      'DiscountOverride DiscountOverride Text onTap ',
      (tester) async {
        final expectedStates = [
          DiscountOverrideState.initial().copyWith(),
          DiscountOverrideState.initial().copyWith(
            materialPrice: price.copyWith(zdp8Override: Zdp8OverrideValue(10)),
            showErrorMessages: true,
          ),
        ];
        whenListen(
          discountOverrideBlocMock,
          Stream.fromIterable(expectedStates),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();
        final discountOverride = find.byKey(const Key('discountOverride'));
        expect(discountOverride, findsOneWidget);
        final discountOverridsDialog =
            find.byKey(const Key('discountOverridsDialog'));
        expect(discountOverridsDialog, findsNothing);
        final discountOverridsText = find.byType(TextButton);
        expect(discountOverridsText, findsOneWidget);
        await tester.tap(discountOverridsText);
        await tester.pump();
        expect(discountOverridsDialog, findsOneWidget);
      },
    );

    testWidgets(
      'DiscountOverride switch toggle false',
      (tester) async {
        when(() => discountOverrideBlocMock.state).thenReturn(
          DiscountOverrideState.initial().copyWith(
            apiFailureOrSuccessOption: optionOf(
              const Right(null),
            ),
            materialPrice: price.copyWith(zdp8Override: Zdp8OverrideValue(10)),
          ),
        );
        await tester.pumpWidget(getWidget());
        await tester.pump();
        final discountOverride = find.byKey(const Key('discountOverride'));
        expect(discountOverride, findsOneWidget);
        final switchFinder = find.byType(CupertinoSwitch);
        final switchWdt = tester.widget<CupertinoSwitch>(switchFinder);
        expect(switchWdt.value, true);

        await tester.drag(switchFinder, const Offset(-2000, 0));
        await tester.pumpAndSettle();
        verify(
          () => discountOverrideBlocMock.add(
            DiscountOverrideEvent.fetch(
              price: Price.empty().copyWith(
                zdp8Override: Zdp8OverrideValue(0),
              ),
              shipToInfo: ShipToInfo.empty(),
              customerCode: CustomerCodeInfo.empty(),
              materialNumber: cartItem.getMaterialNumber,
              salesOrganisation: SalesOrganisation.empty(),
              material: cartItem.materialInfo,
            ),
          ),
        ).called(1);
      },
    );

    testWidgets(
      'DiscountOverrideForm Test',
      (tester) async {
        final expectedStates = [
          DiscountOverrideState.initial().copyWith(),
          DiscountOverrideState.initial().copyWith(
            materialPrice: price,
            showErrorMessages: true,
          ),
        ];
        whenListen(
          discountOverrideBlocMock,
          Stream.fromIterable(expectedStates),
        );

        await tester.pumpWidget(getDiscountOverrideFormWidget());
        await tester.pump();
        final discountOvverrideField =
            find.byKey(const Key('discountOvverrideField'));
        expect(discountOvverrideField, findsOneWidget);
      },
    );
  });
}

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/price_override/price_override_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/order/datasource/cart/cart_local_datasource.dart';
import 'package:ezrxmobile/infrastructure/order/repository/cart_repository.dart';
import 'package:ezrxmobile/infrastructure/order/repository/price_override_repository.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/cart_page.dart';
import 'package:ezrxmobile/presentation/orders/cart/override/request_counter_offer_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

class CartRepositoryMock extends Mock implements CartRepository {}

class PriceOverrideRepositoryMock extends Mock
    implements PriceOverrideRepository {}

class OrderEligibilityBlocMock
    extends MockBloc<OrderEligibilityEvent, OrderEligibilityState>
    implements OrderEligibilityBloc {}

class MaterialPriceBlocMock
    extends MockBloc<MaterialPriceEvent, MaterialPriceState>
    implements MaterialPriceBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class PriceOverrideBlocMock
    extends MockBloc<PriceOverrideEvent, PriceOverrideState>
    implements PriceOverrideBloc {}

class OrderSummaryBlocMock
    extends MockBloc<OrderSummaryEvent, OrderSummaryState>
    implements OrderSummaryBloc {}

void main() {
  late CartBloc cartBloc;
  late MaterialPriceBloc materialPriceBloc;
  late EligibilityBloc eligibilityBloc;
  late UserBloc userBloc;
  late SalesOrgBloc salesOrgBloc;
  late CustomerCodeBloc customerCodeBloc;
  late Map<MaterialNumber, Price> mockPriceList;
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late PriceOverrideBloc priceOverrideBloc;
  late AppRouter autoRouter;
  late OrderSummaryBloc orderSummaryBlocMock;
  late List<PriceAggregate> cartItems;
  late OrderEligibilityBloc orderEligibilityBloc;
  final cartPageFinder = find.byKey(WidgetKeys.cartPage);

  setUpAll(() async {
    locator.registerLazySingleton(
      () => MixpanelService(config: locator<Config>()),
    );
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerFactory(() => AppRouter());
    autoRouter = locator<AppRouter>();
    cartItems = await CartLocalDataSource().upsertCart();
  });

  group('Request Counter Offer Sheet Test', () {
    setUp(
      () {
        WidgetsFlutterBinding.ensureInitialized();
        cartItems = cartItems
            .map(
              (e) => e.copyWith(
                materialInfo: e.materialInfo.copyWith(
                  type: MaterialInfoType('material'),
                ),
              ),
            )
            .toList();
        cartBloc = CartBlocMock();
        materialPriceBloc = MaterialPriceBlocMock();
        salesOrgBloc = SalesOrgBlocMock();
        customerCodeBloc = CustomerCodeBlocMock();
        eligibilityBloc = EligibilityBlocMock();
        userBloc = UserBlocMock();
        orderEligibilityBloc = OrderEligibilityBlocMock();
        priceOverrideBloc = PriceOverrideBlocMock();
        orderSummaryBlocMock = OrderSummaryBlocMock();
        authBlocMock = AuthBlocMock();
        announcementBlocMock = AnnouncementBlocMock();

        mockPriceList = {};
        mockPriceList.putIfAbsent(
          MaterialNumber('000000000023168451'),
          () => Price.empty().copyWith(
            finalPrice: MaterialPrice(4.5),
          ),
        );

        when(() => materialPriceBloc.state).thenReturn(
          MaterialPriceState.initial().copyWith(
            isFetching: false,
            materialPrice: mockPriceList,
          ),
        );
        when(() => userBloc.state).thenReturn(UserState.initial());
        when(() => orderSummaryBlocMock.state).thenReturn(
          OrderSummaryState.initial().copyWith(),
        );
        when(() => orderEligibilityBloc.state).thenReturn(
          OrderEligibilityState.initial(),
        );
        when(() => salesOrgBloc.state).thenReturn(
          SalesOrgState.initial().copyWith(
            configs: SalesOrganisationConfigs.empty().copyWith(
              priceOverride: true,
            ),
            salesOrganisation: SalesOrganisation.empty().copyWith(
              salesOrg: SalesOrg('2001'),
            ),
          ),
        );
        when(() => customerCodeBloc.state).thenReturn(
          CustomerCodeState.initial().copyWith(
            customerCodeInfo: CustomerCodeInfo.empty().copyWith(
              customerCodeSoldTo: '1234',
            ),
          ),
        );
        when(() => userBloc.state).thenReturn(
          UserState.initial()
              .copyWith(user: User.empty().copyWith(hasBonusOverride: false)),
        );
        when(() => eligibilityBloc.state).thenReturn(
          EligibilityState.initial().copyWith(
            salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
              priceOverride: true,
            ),
            salesOrganisation: SalesOrganisation.empty().copyWith(
              salesOrg: SalesOrg('2001'),
            ),
            customerCodeInfo: CustomerCodeInfo.empty().copyWith(
              customerCodeSoldTo: '1234',
            ),
            user: User.empty().copyWith(hasBonusOverride: false),
          ),
        );
        when(() => priceOverrideBloc.state)
            .thenReturn(PriceOverrideState.initial());

        when(() => cartBloc.state).thenReturn(CartState.initial());

        when(() => announcementBlocMock.state)
            .thenReturn(AnnouncementState.initial());
        when(() => authBlocMock.state).thenReturn(const AuthState.initial());
      },
    );

    Widget getWidget({required Widget child}) {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouter,
        usingLocalization: true,
        providers: [
          BlocProvider<UserBloc>(create: (context) => userBloc),
          BlocProvider<CartBloc>(create: (context) => cartBloc),
          BlocProvider<MaterialPriceBloc>(
            create: (context) => materialPriceBloc,
          ),
          BlocProvider<SalesOrgBloc>(create: (context) => salesOrgBloc),
          BlocProvider<CustomerCodeBloc>(
            create: (context) => customerCodeBloc,
          ),
          BlocProvider<AuthBloc>(create: (context) => authBlocMock),
          BlocProvider<EligibilityBloc>(create: (context) => eligibilityBloc),
          BlocProvider<OrderEligibilityBloc>(
            create: (context) => orderEligibilityBloc,
          ),
          BlocProvider<PriceOverrideBloc>(
            create: (context) => priceOverrideBloc,
          ),
          BlocProvider<OrderSummaryBloc>(
            create: (context) => orderSummaryBlocMock,
          ),
          BlocProvider<AuthBloc>(create: (context) => authBlocMock),
          BlocProvider<AnnouncementBloc>(
            create: (context) => announcementBlocMock,
          ),
        ],
        child: child,
      );
    }

    testWidgets('Initialize Cart Page', (tester) async {
      when(() => cartBloc.state).thenReturn(
        CartState.initial().copyWith(
          isFetching: false,
          apiFailureOrSuccessOption: none(),
          cartProducts: cartItems,
        ),
      );

      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs:
              SalesOrganisationConfigs.empty().copyWith(priceOverride: false),
        ),
      );
      await tester.pumpWidget(
        getWidget(
          child: const CartPage(),
        ),
      );
      await tester.pump();
      final cartItemFinder = find.byKey(
        WidgetKeys.cartItemProductTile(
          cartItems.first.materialInfo.materialNumber.displayMatNo,
        ),
      );

      expect(cartPageFinder, findsOneWidget);
      expect(cartItemFinder, findsNWidgets(2));
    });

    testWidgets('Open counter offer sheet from cart', (tester) async {
      when(() => cartBloc.state).thenReturn(
        CartState.initial().copyWith(
          isFetching: false,
          apiFailureOrSuccessOption: none(),
          cartProducts: cartItems,
        ),
      );

      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs:
              SalesOrganisationConfigs.empty().copyWith(priceOverride: true),
        ),
      );

      await tester.pumpWidget(
        getWidget(
          child: const CartPage(),
        ),
      );
      await tester.pump();

      final cartItemFinder = find.byKey(
        WidgetKeys.cartItemProductTile(
          cartItems.first.materialInfo.materialNumber.displayMatNo,
        ),
      );
      final counterOfferPriceButtonFinder =
          find.byKey(WidgetKeys.counterOfferPriceButtonKey);
      final counterOfferBottomSheetFinder =
          find.byKey(WidgetKeys.counterOfferBottomSheet);
      expect(cartPageFinder, findsOneWidget);
      expect(cartItemFinder, findsNWidgets(2));
      expect(counterOfferPriceButtonFinder.first, findsOneWidget);

      await tester.tap(counterOfferPriceButtonFinder.first);
      await tester.pump();
      verify(
        () => priceOverrideBloc.add(
          PriceOverrideEvent.setProduct(item: cartItems.first),
        ),
      ).called(1);
      expect(counterOfferBottomSheetFinder, findsOneWidget);
    });

    testWidgets('Find and Test Counter Offer Price Field', (tester) async {
      when(() => cartBloc.state).thenReturn(
        CartState.initial().copyWith(
          isFetching: false,
          apiFailureOrSuccessOption: none(),
          cartProducts: cartItems,
        ),
      );

      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
            priceOverride: true,
          ),
        ),
      );

      await tester.pumpWidget(
        getWidget(
          child: const CartPage(),
        ),
      );
      await tester.pump();

      final cartItemFinder = find.byKey(
        WidgetKeys.cartItemProductTile(
          cartItems.first.materialInfo.materialNumber.displayMatNo,
        ),
      );
      final counterOfferPriceButtonFinder =
          find.byKey(WidgetKeys.counterOfferPriceButtonKey);
      final counterOfferBottomSheetFinder =
          find.byKey(WidgetKeys.counterOfferBottomSheet);
      expect(cartPageFinder, findsOneWidget);
      expect(cartItemFinder, findsNWidgets(2));
      expect(counterOfferPriceButtonFinder.first, findsOneWidget);

      await tester.tap(counterOfferPriceButtonFinder.first);
      await tester.pump();
      verify(
        () => priceOverrideBloc.add(
          PriceOverrideEvent.setProduct(item: cartItems.first),
        ),
      ).called(1);
      final counterOfferPriceFieldFinder =
          find.byKey(WidgetKeys.counterOfferPriceField);
      final counterOfferDiscountFieldFinder =
          find.byKey(WidgetKeys.counterOfferDiscountField);
      final discountedPriceWidgetFinder =
          find.byKey(WidgetKeys.counterOfferDiscountedPriceWidget);
      final counterOfferRemarksFieldFinder =
          find.byKey(WidgetKeys.counterOfferRemarksField);

      expect(counterOfferBottomSheetFinder, findsOneWidget);
      expect(counterOfferPriceFieldFinder, findsOneWidget);
      expect(counterOfferDiscountFieldFinder, findsNothing);
      expect(discountedPriceWidgetFinder, findsNothing);
      expect(counterOfferRemarksFieldFinder, findsOneWidget);

      await tester.enterText(counterOfferPriceFieldFinder, '100');
      await tester.pump();
      verify(
        () => priceOverrideBloc.add(
          const PriceOverrideEvent.onPriceValueChange(newPrice: '100'),
        ),
      ).called(1);
      await tester.enterText(counterOfferRemarksFieldFinder, 'Comments');
      await tester.pump();

      verify(
        () => priceOverrideBloc.add(
          const PriceOverrideEvent.onRemarksValueChange(newRemarks: 'Comments'),
        ),
      ).called(1);
    });

    testWidgets('Find and Test Counter Offer Discount Field', (tester) async {
      when(() => cartBloc.state).thenReturn(
        CartState.initial().copyWith(
          apiFailureOrSuccessOption: none(),
          cartProducts: cartItems,
        ),
      );

      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          user: User.empty().copyWith(
            role: Role.empty().copyWith(
              type: RoleType('internal_sales_rep'),
            ),
          ),
          salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
            enableZDP8Override: true,
          ),
        ),
      );

      await tester.pumpWidget(
        getWidget(
          child: const CartPage(),
        ),
      );
      await tester.pump();

      final cartItemFinder = find.byKey(
        WidgetKeys.cartItemProductTile(
          cartItems.first.materialInfo.materialNumber.displayMatNo,
        ),
      );
      final counterOfferPriceButtonFinder =
          find.byKey(WidgetKeys.counterOfferPriceButtonKey);
      final counterOfferBottomSheetFinder =
          find.byKey(WidgetKeys.counterOfferBottomSheet);
      expect(cartPageFinder, findsOneWidget);
      expect(cartItemFinder, findsNWidgets(2));
      expect(counterOfferPriceButtonFinder.first, findsOneWidget);

      await tester.tap(counterOfferPriceButtonFinder.first);
      await tester.pump();
      verify(
        () => priceOverrideBloc.add(
          PriceOverrideEvent.setProduct(item: cartItems.first),
        ),
      ).called(1);

      final counterOfferPriceFieldFinder =
          find.byKey(WidgetKeys.counterOfferPriceField);
      final counterOfferDiscountFieldFinder =
          find.byKey(WidgetKeys.counterOfferDiscountField);
      final discountedPriceWidgetFinder =
          find.byKey(WidgetKeys.counterOfferDiscountedPriceWidget);
      final counterOfferRemarksFieldFinder =
          find.byKey(WidgetKeys.counterOfferRemarksField);

      expect(counterOfferBottomSheetFinder, findsOneWidget);
      expect(counterOfferPriceFieldFinder, findsNothing);
      expect(counterOfferDiscountFieldFinder, findsOneWidget);
      expect(discountedPriceWidgetFinder, findsOneWidget);
      expect(counterOfferRemarksFieldFinder, findsOneWidget);

      await tester.enterText(counterOfferDiscountFieldFinder, '10');
      await tester.pump();
      verify(
        () => priceOverrideBloc.add(
          const PriceOverrideEvent.onDiscountValueChanged(newValue: '10'),
        ),
      ).called(1);

      await tester.enterText(counterOfferRemarksFieldFinder, 'Comments');
      await tester.pump();

      verify(
        () => priceOverrideBloc.add(
          const PriceOverrideEvent.onRemarksValueChange(newRemarks: 'Comments'),
        ),
      ).called(1);
    });

    testWidgets(
        'Test Counter Offer Discount Field when enableZDP8Override is false',
        (tester) async {
      when(() => cartBloc.state).thenReturn(
        CartState.initial().copyWith(
          cartProducts: cartItems,
        ),
      );

      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          user: User.empty().copyWith(
            role: Role.empty().copyWith(
              type: RoleType('internal_sales_rep'),
            ),
            hasPriceOverride: true,
          ),
          salesOrgConfigs: SalesOrganisationConfigs.empty(),
        ),
      );

      await tester.pumpWidget(
        getWidget(child: const CartPage()),
      );
      await tester.pump();

      final counterOfferPriceButtonFinder =
          find.byKey(WidgetKeys.counterOfferPriceButtonKey);
      final counterOfferBottomSheetFinder =
          find.byKey(WidgetKeys.counterOfferBottomSheet);
      expect(cartPageFinder, findsOneWidget);
      expect(counterOfferPriceButtonFinder.first, findsOneWidget);

      await tester.tap(counterOfferPriceButtonFinder.first);
      await tester.pump();
      verify(
        () => priceOverrideBloc.add(
          PriceOverrideEvent.setProduct(item: cartItems.first),
        ),
      ).called(1);

      final counterOfferDiscountFieldFinder =
          find.byKey(WidgetKeys.counterOfferDiscountField);
      final discountedPriceWidgetFinder =
          find.byKey(WidgetKeys.counterOfferDiscountedPriceWidget);

      expect(counterOfferBottomSheetFinder, findsOneWidget);
      expect(counterOfferDiscountFieldFinder, findsNothing);
      expect(discountedPriceWidgetFinder, findsNothing);
    });

    testWidgets(
        'Test Counter Offer Discount Field when enableZDP8Override is true but user role is not sales_rep',
        (tester) async {
      when(() => cartBloc.state).thenReturn(
        CartState.initial().copyWith(
          cartProducts: cartItems,
        ),
      );

      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          user: User.empty().copyWith(
            role: Role.empty().copyWith(
              type: RoleType('root_admin'),
            ),
          ),
          salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
            enableZDP8Override: true,
            priceOverride: true,
          ),
        ),
      );

      await tester.pumpWidget(
        getWidget(child: const CartPage()),
      );
      await tester.pump();

      final counterOfferPriceButtonFinder =
          find.byKey(WidgetKeys.counterOfferPriceButtonKey);
      final counterOfferBottomSheetFinder =
          find.byKey(WidgetKeys.counterOfferBottomSheet);
      expect(cartPageFinder, findsOneWidget);
      expect(counterOfferPriceButtonFinder.first, findsOneWidget);

      await tester.tap(counterOfferPriceButtonFinder.first);
      await tester.pump();
      verify(
        () => priceOverrideBloc.add(
          PriceOverrideEvent.setProduct(item: cartItems.first),
        ),
      ).called(1);

      final counterOfferDiscountFieldFinder =
          find.byKey(WidgetKeys.counterOfferDiscountField);
      final discountedPriceWidgetFinder =
          find.byKey(WidgetKeys.counterOfferDiscountedPriceWidget);

      expect(counterOfferBottomSheetFinder, findsOneWidget);
      expect(counterOfferDiscountFieldFinder, findsNothing);
      expect(discountedPriceWidgetFinder, findsNothing);
    });

    testWidgets('Submit Counter Offer Price', (tester) async {
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
            priceOverride: true,
          ),
          salesOrganisation: SalesOrganisation.empty().copyWith(
            salesOrg: SalesOrg('2001'),
          ),
          customerCodeInfo: CustomerCodeInfo.empty().copyWith(
            customerCodeSoldTo: '1234',
          ),
          user: User.empty().copyWith(hasBonusOverride: false),
        ),
      );

      final initialPriceOverrideState = PriceOverrideState.initial();

      final confirmedPriceOverrideState = initialPriceOverrideState.copyWith(
        item: cartItems.first.copyWith(
          materialInfo: cartItems.first.materialInfo.copyWith(
            counterOfferDetails: RequestCounterOfferDetails.empty().copyWith(
              counterOfferPrice: CounterOfferValue('100'),
            ),
          ),
          price: Price.empty().copyWith(
            finalPrice: MaterialPrice(100),
            lastPrice: MaterialPrice(200),
          ),
        ),
      );

      final item = confirmedPriceOverrideState.item.copyWith(
        price: Price.empty().copyWith(
          finalPrice: MaterialPrice(100),
          lastPrice: MaterialPrice(200),
        ),
      );

      final expectedPriceOverrideState =
          Stream<PriceOverrideState>.fromIterable([
        confirmedPriceOverrideState.copyWith(
          isFetching: true,
          apiFailureOrSuccessOption: none(),
        ),
        confirmedPriceOverrideState.copyWith(
          isFetching: false,
          apiFailureOrSuccessOption: optionOf(Right(item)),
          item: item,
        )
      ]);

      final expectedCartState = Stream<CartState>.fromIterable([
        CartState.initial().copyWith(
          isUpserting: true,
          apiFailureOrSuccessOption: none(),
        ),
        CartState.initial().copyWith(
          isUpserting: false,
          apiFailureOrSuccessOption: none(),
          cartProducts: [confirmedPriceOverrideState.item],
        ),
      ]);
      whenListen(
        cartBloc,
        expectedCartState,
        initialState: CartState.initial().copyWith(
          isUpserting: false,
          isFetching: false,
          apiFailureOrSuccessOption: none(),
          cartProducts: cartItems,
        ),
      );
      whenListen(
        priceOverrideBloc,
        expectedPriceOverrideState,
        initialState: confirmedPriceOverrideState,
      );
      await tester.pumpWidget(
        getWidget(
          child: Scaffold(
            body: RequestCounterOfferBottomSheet(
              cartItem: cartItems.first,
            ),
          ),
        ),
      );
      await tester.pump();

      final counterOfferBottomSheetFinder =
          find.byKey(WidgetKeys.counterOfferBottomSheet);

      expect(counterOfferBottomSheetFinder, findsOneWidget);
      final counterOfferTextFinder = find.text('Request counter offer'.tr());
      expect(counterOfferTextFinder, findsOneWidget);
      final confirmButtonFinder =
          find.byKey(WidgetKeys.counterOfferConfirmButton);

      expect(confirmButtonFinder, findsOneWidget);

      await tester.tap(confirmButtonFinder);
      await tester.pumpAndSettle();

      verify(
        () => priceOverrideBloc.add(
          const PriceOverrideEvent.validateInputFields(),
        ),
      ).called(1);

      verify(
        () => cartBloc.add(
          CartEvent.upsertCart(
            priceAggregate: confirmedPriceOverrideState.item,
            quantity: confirmedPriceOverrideState.item.quantity,
          ),
        ),
      ).called(1);

      verify(
        () => priceOverrideBloc.add(
          PriceOverrideEvent.fetch(
            customerCodeInfo: CustomerCodeInfo.empty().copyWith(
              customerCodeSoldTo: '1234',
            ),
            salesOrganisation: SalesOrganisation.empty().copyWith(
              salesOrg: SalesOrg('2001'),
            ),
          ),
        ),
      ).called(2);

      verify(
        () => cartBloc.add(
          CartEvent.updateCartProductWithCounterOffer(
            overriddenProductPrice: item.price,
          ),
        ),
      ).called(1);
    });

    testWidgets('Submit Counter Offer Discount', (tester) async {
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
            priceOverride: true,
            enableZDP8Override: true,
          ),
          salesOrganisation: SalesOrganisation.empty().copyWith(
            salesOrg: SalesOrg('2001'),
          ),
          customerCodeInfo: CustomerCodeInfo.empty().copyWith(
            customerCodeSoldTo: '1234',
          ),
          user: User.empty().copyWith(
            hasPriceOverride: true,
            role: Role.empty().copyWith(
              type: RoleType('internal_sales_rep'),
            ),
          ),
        ),
      );

      final initialPriceOverrideState = PriceOverrideState.initial();

      final confirmedPriceOverrideState = initialPriceOverrideState.copyWith(
        item: cartItems.first.copyWith(
          materialInfo: cartItems.first.materialInfo.copyWith(
            counterOfferDetails: RequestCounterOfferDetails.empty().copyWith(
              discountOverridePercentage: CounterOfferDiscountValue('10'),
            ),
          ),
          price: Price.empty().copyWith(
            finalPrice: MaterialPrice(100),
            lastPrice: MaterialPrice(200),
          ),
        ),
      );

      final item = confirmedPriceOverrideState.item.copyWith(
        price: Price.empty().copyWith(
          finalPrice: MaterialPrice(100),
          lastPrice: MaterialPrice(200),
        ),
      );

      final expectedPriceOverrideState =
          Stream<PriceOverrideState>.fromIterable([
        confirmedPriceOverrideState.copyWith(
          isFetching: true,
          apiFailureOrSuccessOption: none(),
        ),
        confirmedPriceOverrideState.copyWith(
          isFetching: false,
          apiFailureOrSuccessOption: optionOf(Right(item)),
          item: item,
        )
      ]);

      final expectedCartState = Stream<CartState>.fromIterable([
        CartState.initial().copyWith(
          isUpserting: true,
          apiFailureOrSuccessOption: none(),
        ),
        CartState.initial().copyWith(
          isUpserting: false,
          apiFailureOrSuccessOption: none(),
          cartProducts: [confirmedPriceOverrideState.item],
        ),
      ]);
      whenListen(
        cartBloc,
        expectedCartState,
        initialState: CartState.initial().copyWith(
          isUpserting: false,
          isFetching: false,
          apiFailureOrSuccessOption: none(),
          cartProducts: cartItems,
        ),
      );
      whenListen(
        priceOverrideBloc,
        expectedPriceOverrideState,
        initialState: confirmedPriceOverrideState,
      );

      await tester.pumpWidget(
        getWidget(
          child: Scaffold(
            body: RequestCounterOfferBottomSheet(
              cartItem: cartItems.first,
            ),
          ),
        ),
      );
      await tester.pump();

      final counterOfferBottomSheetFinder =
          find.byKey(WidgetKeys.counterOfferBottomSheet);

      expect(counterOfferBottomSheetFinder, findsOneWidget);
      final counterOfferTextFinder = find.text('Request counter offer'.tr());
      expect(counterOfferTextFinder, findsOneWidget);
      final confirmButtonFinder =
          find.byKey(WidgetKeys.counterOfferConfirmButton);

      expect(confirmButtonFinder, findsOneWidget);

      await tester.tap(confirmButtonFinder);
      await tester.pumpAndSettle();

      verify(
        () => priceOverrideBloc.add(
          const PriceOverrideEvent.validateInputFields(),
        ),
      ).called(1);

      verify(
        () => cartBloc.add(
          CartEvent.upsertCart(
            priceAggregate: confirmedPriceOverrideState.item,
            quantity: confirmedPriceOverrideState.item.quantity,
          ),
        ),
      ).called(1);

      verify(
        () => priceOverrideBloc.add(
          PriceOverrideEvent.fetch(
            customerCodeInfo: CustomerCodeInfo.empty().copyWith(
              customerCodeSoldTo: '1234',
            ),
            salesOrganisation: SalesOrganisation.empty().copyWith(
              salesOrg: SalesOrg('2001'),
            ),
          ),
        ),
      ).called(2);

      verify(
        () => cartBloc.add(
          CartEvent.updateCartProductWithCounterOffer(
            overriddenProductPrice: item.price,
          ),
        ),
      ).called(1);
    });

    testWidgets('Test Counter Offer Empty Field Error Message', (tester) async {
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          user: User.empty().copyWith(
            hasPriceOverride: true,
            role: Role.empty().copyWith(
              type: RoleType('internal_sales_rep'),
            ),
          ),
          salesOrgConfigs: SalesOrganisationConfigs.empty()
              .copyWith(priceOverride: true, enableZDP8Override: true),
        ),
      );

      final initialPriceOverrideState = PriceOverrideState.initial();

      final confirmedPriceOverrideState = initialPriceOverrideState.copyWith(
        item: cartItems.first.copyWith(
          materialInfo: cartItems.first.materialInfo.copyWith(
            counterOfferDetails: RequestCounterOfferDetails.empty().copyWith(
              discountOverridePercentage: CounterOfferDiscountValue(''),
              counterOfferPrice: CounterOfferValue(''),
            ),
          ),
          price: Price.empty().copyWith(
            finalPrice: MaterialPrice(100),
            lastPrice: MaterialPrice(200),
          ),
        ),
      );

      final expectedPriceOverrideState =
          Stream<PriceOverrideState>.fromIterable([
        confirmedPriceOverrideState.copyWith(
          showErrorMessages: false,
        ),
        confirmedPriceOverrideState.copyWith(
          showErrorMessages: true,
          item: confirmedPriceOverrideState.item,
        )
      ]);

      whenListen(
        priceOverrideBloc,
        expectedPriceOverrideState,
        initialState: confirmedPriceOverrideState,
      );
      await tester.pumpWidget(
        getWidget(
          child: Scaffold(
            body: RequestCounterOfferBottomSheet(
              cartItem: cartItems.first,
            ),
          ),
        ),
      );
      await tester.pump();

      final counterOfferBottomSheetFinder =
          find.byKey(WidgetKeys.counterOfferBottomSheet);

      expect(counterOfferBottomSheetFinder, findsOneWidget);
      final counterOfferTextFinder = find.text('Request counter offer'.tr());
      expect(counterOfferTextFinder, findsOneWidget);
      final confirmButtonFinder =
          find.byKey(WidgetKeys.counterOfferConfirmButton);

      expect(confirmButtonFinder, findsOneWidget);

      await tester.tap(confirmButtonFinder);
      await tester.pumpAndSettle();

      verify(
        () => priceOverrideBloc.add(
          const PriceOverrideEvent.validateInputFields(),
        ),
      ).called(1);

      final emptyFieldsErrorMessageFinder =
          find.byKey(WidgetKeys.counterOfferEmptyFieldErrorMessage);
      expect(emptyFieldsErrorMessageFinder, findsOneWidget);
    });

    testWidgets('Submit Counter Offer Error While Upserting Failed',
        (tester) async {
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs:
              SalesOrganisationConfigs.empty().copyWith(priceOverride: true),
        ),
      );

      final initialPriceOverrideState = PriceOverrideState.initial();

      final confirmedPriceOverrideState = initialPriceOverrideState.copyWith(
        item: cartItems.first.copyWith(
          materialInfo: cartItems.first.materialInfo.copyWith(
            counterOfferDetails: RequestCounterOfferDetails.empty().copyWith(
              counterOfferPrice: CounterOfferValue('100'),
            ),
          ),
          price: Price.empty().copyWith(
            finalPrice: MaterialPrice(100),
            lastPrice: MaterialPrice(200),
          ),
        ),
      );

      final item = confirmedPriceOverrideState.item.copyWith(
        price: Price.empty().copyWith(
          finalPrice: MaterialPrice(100),
          lastPrice: MaterialPrice(200),
        ),
      );

      final expectedPriceOverrideState =
          Stream<PriceOverrideState>.fromIterable([
        confirmedPriceOverrideState.copyWith(
          isFetching: true,
          apiFailureOrSuccessOption: none(),
        ),
        confirmedPriceOverrideState.copyWith(
          isFetching: false,
          apiFailureOrSuccessOption: optionOf(Right(item)),
          item: item,
        )
      ]);

      final expectedCartState = Stream<CartState>.fromIterable([
        CartState.initial().copyWith(
          isUpserting: true,
          apiFailureOrSuccessOption: none(),
        ),
        CartState.initial().copyWith(
          isUpserting: false,
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('Fake-Error Message'))),
          cartProducts: [confirmedPriceOverrideState.item],
        ),
      ]);
      whenListen(
        cartBloc,
        expectedCartState,
        initialState: CartState.initial().copyWith(
          isUpserting: false,
          isFetching: false,
          apiFailureOrSuccessOption: none(),
          cartProducts: cartItems,
        ),
      );
      whenListen(
        priceOverrideBloc,
        expectedPriceOverrideState,
        initialState: confirmedPriceOverrideState,
      );
      await tester.pumpWidget(
        getWidget(
          child: Scaffold(
            body: RequestCounterOfferBottomSheet(
              cartItem: cartItems.first,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final counterOfferBottomSheetFinder =
          find.byKey(WidgetKeys.counterOfferBottomSheet);

      expect(counterOfferBottomSheetFinder, findsOneWidget);
      final counterOfferTextFinder = find.text('Request counter offer'.tr());
      expect(counterOfferTextFinder, findsOneWidget);
      final confirmButtonFinder =
          find.byKey(WidgetKeys.counterOfferConfirmButton);

      expect(confirmButtonFinder, findsOneWidget);

      await tester.tap(confirmButtonFinder);
      await tester.pumpAndSettle();

      verify(
        () => priceOverrideBloc.add(
          const PriceOverrideEvent.validateInputFields(),
        ),
      ).called(1);

      verify(
        () => cartBloc.add(
          CartEvent.upsertCart(
            priceAggregate: confirmedPriceOverrideState.item,
            quantity: confirmedPriceOverrideState.item.quantity,
          ),
        ),
      ).called(1);

      final errorSnackBarFinder = find.byType(CustomSnackBar);
      expect(errorSnackBarFinder, findsOneWidget);
    });

    testWidgets('Submit Counter Offer Error While Price Fail', (tester) async {
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          salesOrgConfigs: SalesOrganisationConfigs.empty()
              .copyWith(priceOverride: true, enableZDP8Override: true),
          salesOrganisation: SalesOrganisation.empty().copyWith(
            salesOrg: SalesOrg('2001'),
          ),
          customerCodeInfo: CustomerCodeInfo.empty().copyWith(
            customerCodeSoldTo: '1234',
          ),
          user: User.empty().copyWith(
            hasPriceOverride: true,
            role: Role.empty().copyWith(
              type: RoleType('internal_sales_rep'),
            ),
          ),
        ),
      );

      final initialPriceOverrideState = PriceOverrideState.initial();

      final confirmedPriceOverrideState = initialPriceOverrideState.copyWith(
        item: cartItems.first.copyWith(
          materialInfo: cartItems.first.materialInfo.copyWith(
            counterOfferDetails: RequestCounterOfferDetails.empty().copyWith(
              discountOverridePercentage: CounterOfferDiscountValue('10'),
            ),
          ),
          price: Price.empty().copyWith(
            finalPrice: MaterialPrice(100),
            lastPrice: MaterialPrice(200),
          ),
        ),
      );

      final expectedCartState = Stream<CartState>.fromIterable([
        CartState.initial().copyWith(
          isUpserting: true,
          apiFailureOrSuccessOption: none(),
        ),
        CartState.initial().copyWith(
          isUpserting: false,
          apiFailureOrSuccessOption: none(),
          cartProducts: [confirmedPriceOverrideState.item],
        ),
      ]);

      final expectedPriceOverrideState =
          Stream<PriceOverrideState>.fromIterable([
        confirmedPriceOverrideState.copyWith(
          isFetching: true,
          apiFailureOrSuccessOption: none(),
        ),
        confirmedPriceOverrideState.copyWith(
          isFetching: false,
          showErrorMessages: true,
          apiFailureOrSuccessOption:
              optionOf(const Left(ApiFailure.other('Fake-Error Message'))),
        )
      ]);
      whenListen(
        cartBloc,
        expectedCartState,
        initialState: CartState.initial().copyWith(
          isUpserting: false,
          isFetching: false,
          apiFailureOrSuccessOption: none(),
          cartProducts: cartItems,
        ),
      );
      whenListen(
        priceOverrideBloc,
        expectedPriceOverrideState,
        initialState: confirmedPriceOverrideState,
      );
      await tester.pumpWidget(
        getWidget(
          child: Scaffold(
            body: RequestCounterOfferBottomSheet(
              cartItem: cartItems.first,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final counterOfferBottomSheetFinder =
          find.byKey(WidgetKeys.counterOfferBottomSheet);

      expect(counterOfferBottomSheetFinder, findsOneWidget);
      final counterOfferTextFinder = find.text('Request counter offer'.tr());
      expect(counterOfferTextFinder, findsOneWidget);
      final confirmButtonFinder =
          find.byKey(WidgetKeys.counterOfferConfirmButton);

      expect(confirmButtonFinder, findsOneWidget);

      await tester.tap(confirmButtonFinder);
      await tester.pumpAndSettle();

      verify(
        () => priceOverrideBloc.add(
          const PriceOverrideEvent.validateInputFields(),
        ),
      ).called(1);

      verify(
        () => cartBloc.add(
          CartEvent.upsertCart(
            priceAggregate: confirmedPriceOverrideState.item,
            quantity: confirmedPriceOverrideState.item.quantity,
          ),
        ),
      ).called(1);

      verify(
        () => priceOverrideBloc.add(
          PriceOverrideEvent.fetch(
            customerCodeInfo: CustomerCodeInfo.empty().copyWith(
              customerCodeSoldTo: '1234',
            ),
            salesOrganisation: SalesOrganisation.empty().copyWith(
              salesOrg: SalesOrg('2001'),
            ),
          ),
        ),
      ).called(2);

      final errorSnackBarFinder = find.byType(CustomSnackBar);
      expect(errorSnackBarFinder, findsOneWidget);
    });

    testWidgets('Test Counter Offer Price Fields Validations', (tester) async {
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          user: User.empty().copyWith(
            hasPriceOverride: true,
            role: Role.empty().copyWith(
              type: RoleType('internal_sales_rep'),
            ),
          ),
          salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
            priceOverride: true,
            enableZDP8Override: true,
          ),
        ),
      );

      final initialPriceOverrideState = PriceOverrideState.initial().copyWith(
        item: cartItems.first.copyWith(
          materialInfo: cartItems.first.materialInfo.copyWith(
            counterOfferDetails: RequestCounterOfferDetails.empty().copyWith(
              discountOverridePercentage: CounterOfferDiscountValue(''),
            ),
          ),
        ),
      );

      when(() => priceOverrideBloc.state).thenReturn(
        initialPriceOverrideState,
      );

      await tester.pumpWidget(
        getWidget(
          child: Scaffold(
            body: RequestCounterOfferBottomSheet(
              cartItem: cartItems.first,
            ),
          ),
        ),
      );
      await tester.pump();

      final counterOfferBottomSheetFinder =
          find.byKey(WidgetKeys.counterOfferBottomSheet);
      expect(counterOfferBottomSheetFinder, findsOneWidget);

      final counterOfferPriceTextFieldFinder =
          find.byKey(WidgetKeys.counterOfferPriceField);
      expect(counterOfferPriceTextFieldFinder, findsOneWidget);

      await tester.enterText(counterOfferPriceTextFieldFinder, '11');
      await tester.pump();

      await tester.enterText(counterOfferPriceTextFieldFinder, '');
      await tester.pump();

      final emptyErrorTextFinder =
          find.text('Please enter counter offer price'.tr());
      expect(emptyErrorTextFinder, findsOneWidget);
    });

    testWidgets('Test Counter Offer Discount Fields Validations',
        (tester) async {
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          user: User.empty().copyWith(
            hasPriceOverride: true,
            role: Role.empty().copyWith(
              type: RoleType('internal_sales_rep'),
            ),
          ),
          salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
            priceOverride: true,
            enableZDP8Override: true,
          ),
        ),
      );

      final initialPriceOverrideState = PriceOverrideState.initial().copyWith(
        item: cartItems.first.copyWith(
          materialInfo: cartItems.first.materialInfo.copyWith(
            counterOfferDetails: RequestCounterOfferDetails.empty().copyWith(
              discountOverridePercentage: CounterOfferDiscountValue(''),
            ),
          ),
        ),
      );

      when(() => priceOverrideBloc.state).thenReturn(
        initialPriceOverrideState,
      );

      await tester.pumpWidget(
        getWidget(
          child: Scaffold(
            body: RequestCounterOfferBottomSheet(
              cartItem: cartItems.first,
            ),
          ),
        ),
      );
      await tester.pump();

      final counterOfferBottomSheetFinder =
          find.byKey(WidgetKeys.counterOfferBottomSheet);
      expect(counterOfferBottomSheetFinder, findsOneWidget);

      final counterOfferDiscountTextFieldFinder =
          find.byKey(WidgetKeys.counterOfferDiscountField);
      expect(counterOfferDiscountTextFieldFinder, findsOneWidget);

      await tester.enterText(counterOfferDiscountTextFieldFinder, '100');
      await tester.pump();

      final maxValueEnteredErrorTextFinder = find.text(
        'Please input counter offer percentage discount of less than 100%'.tr(),
      );
      expect(maxValueEnteredErrorTextFinder, findsOneWidget);

      await tester.enterText(counterOfferDiscountTextFieldFinder, '');
      await tester.pump();

      final emptyErrorTextFinder =
          find.text('Please enter discount counter offer'.tr());
      expect(emptyErrorTextFinder, findsOneWidget);
    });

    testWidgets('Test Close Counter Offer BottomSheet', (tester) async {
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          user: User.empty().copyWith(
            hasPriceOverride: true,
            role: Role.empty().copyWith(
              type: RoleType('internal_sales_rep'),
            ),
          ),
          salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
            priceOverride: true,
            enableZDP8Override: true,
          ),
        ),
      );

      await tester.pumpWidget(
        getWidget(
          child: Scaffold(
            body: RequestCounterOfferBottomSheet(
              cartItem: cartItems.first,
            ),
          ),
        ),
      );
      await tester.pump();

      final counterOfferBottomSheetFinder =
          find.byKey(WidgetKeys.counterOfferBottomSheet);
      expect(counterOfferBottomSheetFinder, findsOneWidget);

      final counterOfferCancelButton =
          find.byKey(WidgetKeys.counterOfferCancelButton);
      expect(counterOfferCancelButton, findsOneWidget);

      await tester.tap(counterOfferCancelButton);
      expect(autoRouter.current.route.name, 'Root');
    });

    testWidgets('List Price Displayed Price Not Available for PnG material ',
        (tester) async {
      final cartItem = cartItems.first.copyWith(
        materialInfo: cartItems.first.materialInfo.copyWith(
          hidePrice: true,
          principalData: PrincipalData.empty().copyWith(
            principalName: PrincipalName('Procter And Gamble'),
            principalCode: PrincipalCode('000000105307'),
          ),
        ),
      );

      when(() => priceOverrideBloc.state).thenReturn(
        PriceOverrideState.initial().copyWith(
          item: cartItem,
        ),
      );

      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          user: User.empty().copyWith(
            hasPriceOverride: true,
            role: Role.empty().copyWith(
              type: RoleType('internal_sales_rep'),
            ),
          ),
          salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
            priceOverride: true,
            enableZDP8Override: true,
          ),
        ),
      );

      await tester.pumpWidget(
        getWidget(
          child: Scaffold(
            body: RequestCounterOfferBottomSheet(
              cartItem: cartItem,
            ),
          ),
        ),
      );
      await tester.pump();

      final counterOfferBottomSheetFinder =
          find.byKey(WidgetKeys.counterOfferBottomSheet);
      expect(counterOfferBottomSheetFinder, findsOneWidget);

      final counterOfferListPriceWidgetFinder =
          find.byKey(WidgetKeys.counterOfferListPriceWidget);
      expect(counterOfferListPriceWidgetFinder, findsOneWidget);

      final listPriceTextFinder = find.text(
        '${'List price'.tr()} : Price Not Available',
        findRichText: true,
      );
      expect(listPriceTextFinder, findsOneWidget);
    });

    testWidgets(
        'Offer Price Price Displayed Price Not Available for PnG material ',
        (tester) async {
      final cartItem = cartItems.first.copyWith(
        materialInfo: cartItems.first.materialInfo.copyWith(
          hidePrice: true,
          principalData: PrincipalData.empty().copyWith(
            principalName: PrincipalName('Procter And Gamble'),
            principalCode: PrincipalCode('000000105307'),
          ),
        ),
      );

      when(() => priceOverrideBloc.state).thenReturn(
        PriceOverrideState.initial().copyWith(
          item: cartItem,
        ),
      );

      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          user: User.empty().copyWith(
            hasPriceOverride: true,
            role: Role.empty().copyWith(
              type: RoleType('internal_sales_rep'),
            ),
          ),
          salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
            priceOverride: true,
            enableZDP8Override: true,
          ),
        ),
      );

      await tester.pumpWidget(
        getWidget(
          child: Scaffold(
            body: RequestCounterOfferBottomSheet(
              cartItem: cartItem,
            ),
          ),
        ),
      );
      await tester.pump();

      final counterOfferBottomSheetFinder =
          find.byKey(WidgetKeys.counterOfferBottomSheet);
      expect(counterOfferBottomSheetFinder, findsOneWidget);

      final counterOfferPriceWidgetFinder =
          find.byKey(WidgetKeys.counterOfferPriceWidget);
      expect(counterOfferPriceWidgetFinder, findsOneWidget);

      final counterOfferPriceTextFinder = find.text(
        '${'Offer price'.tr()} : Price Not Available',
        findRichText: true,
      );
      expect(counterOfferPriceTextFinder, findsOneWidget);
    });

    testWidgets(
        'Final counter offer price displayed Price Not Available for PnG material ',
        (tester) async {
      final cartItem = cartItems.first.copyWith(
        materialInfo: cartItems.first.materialInfo.copyWith(
          hidePrice: true,
          principalData: PrincipalData.empty().copyWith(
            principalName: PrincipalName('Procter And Gamble'),
            principalCode: PrincipalCode('000000105307'),
          ),
        ),
      );

      when(() => priceOverrideBloc.state).thenReturn(
        PriceOverrideState.initial().copyWith(
          item: cartItem,
        ),
      );

      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
          user: User.empty().copyWith(
            hasPriceOverride: true,
            role: Role.empty().copyWith(
              type: RoleType('internal_sales_rep'),
            ),
          ),
          salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
            priceOverride: true,
            enableZDP8Override: true,
          ),
        ),
      );

      await tester.pumpWidget(
        getWidget(
          child: Scaffold(
            body: RequestCounterOfferBottomSheet(
              cartItem: cartItem,
            ),
          ),
        ),
      );
      await tester.pump();

      final counterOfferBottomSheetFinder =
          find.byKey(WidgetKeys.counterOfferBottomSheet);
      expect(counterOfferBottomSheetFinder, findsOneWidget);

      final counterOfferListPriceWidgetFinder =
          find.byKey(WidgetKeys.counterOfferDiscountedPriceWidget);
      expect(counterOfferListPriceWidgetFinder, findsOneWidget);

      final priceNotAvailableFinder = find.textContaining(
        'Price Not Available',
        findRichText: true,
      );
      expect(priceNotAvailableFinder, findsNWidgets(3));
    });
  });
}

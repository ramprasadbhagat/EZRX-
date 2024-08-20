import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/price_override/price_override_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/override/request_counter_offer_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../common_mock_data/user_mock.dart';
import '../../../../utils/widget_utils.dart';

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class PriceOverrideBlocMock
    extends MockBloc<PriceOverrideEvent, PriceOverrideState>
    implements PriceOverrideBloc {}

void main() {
  late AppRouter autoRouterMock;
  late CartBloc cartBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  late PriceOverrideBloc priceOverrideBlocMock;
  setUpAll(() {
    locator.registerFactory(() => AppRouter());
    autoRouterMock = locator<AppRouter>();
    cartBlocMock = CartBlocMock();
    eligibilityBlocMock = EligibilityBlocMock();
    locator.registerSingleton<PriceOverrideBloc>(PriceOverrideBlocMock());
    priceOverrideBlocMock = locator.get<PriceOverrideBloc>();
  });

  setUp(() {
    when(() => cartBlocMock.state).thenReturn(
      CartState.initial(),
    );
    when(() => eligibilityBlocMock.state).thenReturn(
      EligibilityState.initial(),
    );
    when(() => priceOverrideBlocMock.state).thenReturn(
      PriceOverrideState.initial(),
    );
  });

  Widget getScopedWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      providers: [
        BlocProvider<CartBloc>(
          create: (context) => cartBlocMock,
        ),
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBlocMock,
        ),
        BlocProvider<PriceOverrideBloc>(
          create: (context) => priceOverrideBlocMock,
        ),
      ],
      child: Material(
        child: RequestCounterOfferBottomSheet(
          cartItem: PriceAggregate.empty(),
        ),
      ),
    );
  }

  group('Test resquest counter offer bottomsheet - ', () {
    testWidgets('Allow enter counter offer with dot', (tester) async {
      when(() => eligibilityBlocMock.state).thenAnswer(
        (invocation) => EligibilityState.initial().copyWith(
          user: fakeExternalSalesRepUser.copyWith(
            hasPriceOverride: true,
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final counterOfferFieldinder =
          find.byKey(WidgetKeys.counterOfferPriceField);
      await tester.enterText(counterOfferFieldinder, '10.12');
      final counterOfferfield =
          tester.widget<TextFormField>(counterOfferFieldinder);
      await tester.pump();
      expect(counterOfferfield.controller?.text, '10.12');
    });
    testWidgets(
        'Allow enter counter offer with comma and replace comma with dot',
        (tester) async {
      when(() => eligibilityBlocMock.state).thenAnswer(
        (invocation) => EligibilityState.initial().copyWith(
          user: fakeExternalSalesRepUser.copyWith(
            hasPriceOverride: true,
          ),
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final counterOfferFieldinder =
          find.byKey(WidgetKeys.counterOfferPriceField);
      await tester.enterText(counterOfferFieldinder, '10,12');
      final counterOfferfield =
          tester.widget<TextFormField>(counterOfferFieldinder);
      await tester.pump();
      expect(counterOfferfield.controller?.text, '10.12');
    });
  });
}

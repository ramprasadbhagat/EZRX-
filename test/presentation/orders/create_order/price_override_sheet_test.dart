import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/price_override/price_override_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/presentation/orders/cart/override/price_override_bottomsheet.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';

class CartMockBloc extends MockBloc<CartEvent, CartState> implements CartBloc {}

class PriceOverrideMockBloc
    extends MockBloc<PriceOverrideEvent, PriceOverrideState>
    implements PriceOverrideBloc {}

class AutoRouterMock extends Mock implements AppRouter {}

void main() {
  late CartBloc cartMockBloc;
  late AppRouter autoRouterMock;
  late PriceOverrideBloc priceOverrideMockBloc;
  late List<PriceAggregate> mockPriceAggregates;

  group('Price Override Sheet Test', () {
    setUp(() {
      cartMockBloc = CartMockBloc();
      autoRouterMock = AppRouter();
      priceOverrideMockBloc = PriceOverrideMockBloc();
      mockPriceAggregates = [
        PriceAggregate.empty().copyWith(
          price: Price.empty(),
          materialInfo: MaterialInfo.empty().copyWith(
            materialNumber: MaterialNumber('1'),
          ),
        ),
      ];

      // when(() => cartMockBloc.state).thenReturn(CartState.initial().copyWith(
      //   cartItemList: mockPriceAggregates,
      // ));
      when(() => priceOverrideMockBloc.state).thenReturn(
        PriceOverrideState.initial(),
      );
    });

    Widget getScopedWidget(Widget child,
        [List<BlocProvider> additionalProviders = const []]) {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<CartBloc>(create: (context) => cartMockBloc),
          BlocProvider<PriceOverrideBloc>(
            create: (context) => priceOverrideMockBloc,
          ),
          if (additionalProviders.isNotEmpty) ...additionalProviders,
        ],
        child: Scaffold(
          appBar: null,
          body: child,
        ),
      );
    }

    testWidgets('Initialisation Test', (tester) async {
      await tester.pumpWidget(getScopedWidget(PriceSheet(
        item: mockPriceAggregates.first,
      )));

      final priceSheetWidget = find.byKey(const Key('priceSheetKey'));
      final overridePriceButton =
          find.byKey(const Key('priceOverrideSubmitButton'));
      final formField = find.byType(TextFormField);
      final formFieldWidget = tester.widget<TextFormField>(formField);

      expect(priceSheetWidget, findsOneWidget);
      expect(overridePriceButton, findsOneWidget);
      expect(
        formFieldWidget.controller?.text,
        mockPriceAggregates.first.getNewPrice().toStringAsFixed(2),
      );
    });

    testWidgets('Change Price Test', (tester) async {
      await tester.pumpWidget(getScopedWidget(PriceSheet(
        item: mockPriceAggregates.first,
      )));

      final overridePriceButton =
          find.byKey(const Key('priceOverrideSubmitButton'));
      final formField = find.byType(TextFormField);
      final formFieldWidget = tester.widget<TextFormField>(formField);

      formFieldWidget.controller?.text = '0.11';

      await tester.tap(overridePriceButton);
    });

    testWidgets('Update cart test success', (tester) async {
      when(() => priceOverrideMockBloc.state).thenReturn(
        PriceOverrideState.initial().copyWith(
          isFetching: true,
        ),
      );

      final expectedState = [
        PriceOverrideState.initial().copyWith(
          isFetching: false,
          cartItemList: [
            Price.empty().copyWith(
              materialNumber: MaterialNumber('1'),
              finalPrice: MaterialPrice(1),
              finalTotalPrice: MaterialPrice(1),
              lastPrice: MaterialPrice(0.5),
            ),
          ],
        ),
      ];

      whenListen(priceOverrideMockBloc, Stream.fromIterable(expectedState));

      await tester.pumpWidget(getScopedWidget(PriceSheet(
        item: mockPriceAggregates.first,
      )));

      await tester.pump();

      expect(autoRouterMock.current.name, 'Root');
    });

    testWidgets('Update cart test failure', (tester) async {
      when(() => priceOverrideMockBloc.state).thenReturn(
        PriceOverrideState.initial().copyWith(
          isFetching: true,
        ),
      );

      final expectedState = [
        PriceOverrideState.initial().copyWith(
          isFetching: false,
          apiFailureOrSuccessOption: optionOf(
            const Left(ApiFailure.other('mock_error')),
          ),
        ),
      ];

      whenListen(priceOverrideMockBloc, Stream.fromIterable(expectedState));

      await tester.pumpWidget(getScopedWidget(PriceSheet(
        item: mockPriceAggregates.first,
      )));

      await tester.pump();

      const snackbarText = 'mock_error';
      final snackbarWidget = find.text(snackbarText);

      expect(snackbarWidget, findsOneWidget);
    });
  });
}

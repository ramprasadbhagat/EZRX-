import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/orders/cart/add_to_cart/update_cart_button.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/material_frame_wrapper.dart';
import '../../../../utils/widget_utils.dart';

class MockTenderContractBloc
    extends MockBloc<TenderContractEvent, TenderContractState>
    implements TenderContractBloc {}

class MockCartBloc extends MockBloc<CartEvent, CartState> implements CartBloc {}

class MockEligibilityBloc extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class MockOrderDocumentTypeBloc
    extends MockBloc<OrderDocumentTypeEvent, OrderDocumentTypeState>
    implements OrderDocumentTypeBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late TenderContractBloc tenderContractBlocMock;
  late CartBloc cartBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  late OrderDocumentTypeBloc orderDocumentTypeBlocMock;
  late AppRouter router;

  setUpAll(() {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
    router = locator<AppRouter>();
  });

  setUp(() {
    tenderContractBlocMock = MockTenderContractBloc();
    cartBlocMock = MockCartBloc();
    eligibilityBlocMock = MockEligibilityBloc();
    orderDocumentTypeBlocMock = MockOrderDocumentTypeBloc();
    when(() => tenderContractBlocMock.state)
        .thenReturn(TenderContractState.initial());
    when(() => cartBlocMock.state).thenReturn(CartState.initial());
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
    when(() => orderDocumentTypeBlocMock.state)
        .thenReturn(OrderDocumentTypeState.initial());
  });

  Widget testWidget({
    required PriceAggregate cartItem,
  }) {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: router,
      child: MaterialFrameWrapper(
        child: MultiBlocProvider(
          providers: [
            BlocProvider<TenderContractBloc>(
                create: (context) => tenderContractBlocMock),
            BlocProvider<CartBloc>(create: (context) => cartBlocMock),
            BlocProvider<EligibilityBloc>(
                create: (context) => eligibilityBlocMock),
            BlocProvider<OrderDocumentTypeBloc>(
                create: (context) => orderDocumentTypeBlocMock),
          ],
          child: Material(
            child: UpdateCartButton(
              cartItem: cartItem,
            ),
          ),
        ),
      ),
    );
  }

  PriceAggregate initPriceAggregate(String materialNumber) =>
      PriceAggregate.empty().copyWith(
          quantity: 2,
          tenderContract: TenderContract.empty()
              .copyWith(tenderOrderReason: TenderContractReason('730')));

  final cartItemList = [
    CartItem.materialEmpty().copyWith(materials: [
      initPriceAggregate('fake-1').copyWith(
          tenderContract: TenderContract.empty()
              .copyWith(tenderOrderReason: TenderContractReason('fake-2'))),
      initPriceAggregate('fake-1').copyWith(
          tenderContract: TenderContract.empty()
              .copyWith(tenderOrderReason: TenderContractReason('fake-3')))
    ])
  ];

  testWidgets('layout children widgets', (widgetTester) async {
    when(() => tenderContractBlocMock.state)
        .thenReturn(TenderContractState.initial().copyWith(
      selectedTenderContract: initPriceAggregate('fake-1').tenderContract,
      isFetching: true,
    ));
    when(() => cartBlocMock.state).thenReturn(CartState.initial().copyWith(
      cartItems: cartItemList,
      isFetching: true,
    ));
    await widgetTester.pumpWidget(
      testWidget(
        cartItem: initPriceAggregate('fake-1'),
      ),
    );

    expect(
        find.text(
            'Tender material 730 cannot be combined with any other material in the cart.'),
        findsOneWidget);
    final button = find.byKey(const Key('updateCart'));

    expect(button, findsOneWidget);
    await widgetTester.tap(button);
    await widgetTester.pump();
    verifyNever(() => cartBlocMock.add(CartEvent.addMaterialToCart(
          item: initPriceAggregate('fake-1'),
          customerCodeInfo: EligibilityState.initial().customerCodeInfo,
          overrideQty: true,
          doNotallowOutOfStockMaterial:
              EligibilityState.initial().doNotAllowOutOfStockMaterials,
          salesOrganisation: EligibilityState.initial().salesOrganisation,
          salesOrganisationConfigs: EligibilityState.initial().salesOrgConfigs,
          shipToInfo: EligibilityState.initial().shipToInfo,
          isSpecialOrderType:
              OrderDocumentTypeState.initial().isSpecialOrderType,
        )));
  });

  testWidgets('enable button', (widgetTester) async {
    final cartItemList = [
      CartItem.materialEmpty().copyWith(materials: [
        initPriceAggregate('fake-1'),
      ])
    ];
    when(() => tenderContractBlocMock.state)
        .thenReturn(TenderContractState.initial().copyWith(
      selectedTenderContract: PriceAggregate.empty().tenderContract,
      isFetching: false,
    ));
    when(() => cartBlocMock.state).thenReturn(CartState.initial().copyWith(
      cartItems: cartItemList,
      isFetching: false,
    ));
    await widgetTester.pumpWidget(
      testWidget(
        cartItem: PriceAggregate.empty(),
      ),
    );

    final button = find.byKey(const Key('updateCart'));

    expect(button, findsOneWidget);
    await widgetTester.tap(button);
    await widgetTester.pump();
    verify(() => cartBlocMock.add(CartEvent.addMaterialToCart(
          item: PriceAggregate.empty(),
          customerCodeInfo: EligibilityState.initial().customerCodeInfo,
          overrideQty: true,
          doNotallowOutOfStockMaterial:
              EligibilityState.initial().doNotAllowOutOfStockMaterials,
          salesOrganisation: EligibilityState.initial().salesOrganisation,
          salesOrganisationConfigs: EligibilityState.initial().salesOrgConfigs,
          shipToInfo: EligibilityState.initial().shipToInfo,
          isSpecialOrderType:
              OrderDocumentTypeState.initial().isSpecialOrderType,
        ))).called(1);
  });
}

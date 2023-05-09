import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_details/order_history_details_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/bonus_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items_details.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items_tender_contract_details.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/history/detail/widget/order_item_card.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/widget_utils.dart';

class MockOrderHistoryDetailsBloc
    extends MockBloc<OrderHistoryDetailsEvent, OrderHistoryDetailsState>
    implements OrderHistoryDetailsBloc {}

class MockEligibilityBloc extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class MockSalesOrgBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class MockMaterialPriceBloc
    extends MockBloc<MaterialPriceEvent, MaterialPriceState>
    implements MaterialPriceBloc {}

class MockMaterialPriceDetailBloc
    extends MockBloc<MaterialPriceDetailEvent, MaterialPriceDetailState>
    implements MaterialPriceDetailBloc {}

class MockUserBloc extends MockBloc<UserEvent, UserState> implements UserBloc {}

class AutoRouterMock extends Mock implements AppRouter {}

void main() {
  late OrderHistoryDetailsBloc orderHistoryDetailsBloc;
  late EligibilityBloc eligibilityBloc;
  late SalesOrgBloc salesOrgBloc;
  late MaterialPriceBloc materialPriceBloc;
  late MaterialPriceDetailBloc materialPriceDetailBloc;
  late UserBloc userBloc;
  late AppRouter autoRouterMock;
  late OrderHistoryDetailsBonusAggregate orderHistoryDetailsBonusAggregate;
  setUpAll(() async {
    setupLocator();
    TestWidgetsFlutterBinding.ensureInitialized();
    autoRouterMock = locator<AppRouter>();
  });

  setUp(() {
    orderHistoryDetailsBloc = MockOrderHistoryDetailsBloc();
    eligibilityBloc = MockEligibilityBloc();
    salesOrgBloc = MockSalesOrgBloc();
    materialPriceBloc = MockMaterialPriceBloc();
    materialPriceDetailBloc = MockMaterialPriceDetailBloc();
    userBloc = MockUserBloc();

    orderHistoryDetailsBonusAggregate =
        OrderHistoryDetailsBonusAggregate.empty()
            .copyWith(orderItem: OrderHistoryDetailsOrderItem.empty());
    when(() => orderHistoryDetailsBloc.state)
        .thenReturn(OrderHistoryDetailsState.initial());
    when(() => eligibilityBloc.state).thenReturn(EligibilityState.initial());
    when(() => salesOrgBloc.state).thenReturn(SalesOrgState.initial());
    when(() => materialPriceBloc.state)
        .thenReturn(MaterialPriceState.initial());
    when(() => materialPriceDetailBloc.state)
        .thenReturn(MaterialPriceDetailState.initial());
    when(() => userBloc.state).thenReturn(UserState.initial());
  });
  Widget getWUT(Widget widget) {
    return EasyLocalization(
      supportedLocales: const [
        Locale('en'),
      ],
      path: 'assets/langs/langs.csv',
      startLocale: const Locale('en'),
      fallbackLocale: const Locale('en'),
      saveLocale: true,
      useOnlyLangCode: true,
      assetLoader: CsvAssetLoader(),
      child: WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<SalesOrgBloc>(create: (context) => salesOrgBloc),
          BlocProvider<EligibilityBloc>(create: (context) => eligibilityBloc),
          BlocProvider<OrderHistoryDetailsBloc>(
              create: (context) => orderHistoryDetailsBloc),
          BlocProvider<SalesOrgBloc>(create: (context) => salesOrgBloc),
          BlocProvider<UserBloc>(create: (context) => userBloc),
          BlocProvider<MaterialPriceBloc>(
              create: (context) => materialPriceBloc),
          BlocProvider<MaterialPriceDetailBloc>(
              create: (context) => materialPriceDetailBloc),
        ],
        child: Material(child: widget),
      ),
    );
  }

  group('OrderItemCard Widget', () {
    testWidgets('should display Remarks', (WidgetTester tester) async {
      // Arrange
      const fakeNote = 'Remarks test';
      orderHistoryDetailsBonusAggregate =
          OrderHistoryDetailsBonusAggregate.empty().copyWith(
        orderItem: OrderHistoryDetailsOrderItem.empty().copyWith(
          type: OrderItemType('Comm'),
          lineReferenceNotes: Remarks(fakeNote),
          details: [
            OrderHistoryDetailsOrderItemDetails.empty(),
          ],
          tenderContractDetails:
              OrderHistoryDetailsOrderItemTenderContractDetails.empty(),
        ),
      );

      when(() => orderHistoryDetailsBloc.state).thenReturn(
          OrderHistoryDetailsState.initial().copyWith(isLoading: false));

      // act
      await tester.pumpWidget(
        getWUT(
          OrderItemCard(
            orderHistoryDetailsBonusAggregate:
                orderHistoryDetailsBonusAggregate,
          ),
        ),
      );
      final specialInstructionsText = find.text('Remarks'.tr());
      // assert
      expect(specialInstructionsText, findsOneWidget);

      // act
      final noteText = find.textContaining(fakeNote);
      // assert
      expect(noteText, findsOneWidget);
    });
  });
}

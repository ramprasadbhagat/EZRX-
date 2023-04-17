import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_details/order_history_details_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/bill_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_basic_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/history/history_tile.dart';
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

class AutoRouterMock extends Mock implements AppRouter {}

void main() {
  late OrderHistoryDetailsBloc orderHistoryDetailsBloc;
  late EligibilityBloc eligibilityBloc;
  late SalesOrgBloc salesOrgBloc;
  late AppRouter autoRouterMock;
  setUpAll(() async {
    setupLocator();
    TestWidgetsFlutterBinding.ensureInitialized();
    autoRouterMock = locator<AppRouter>();
  });

  setUp(() {
    orderHistoryDetailsBloc = MockOrderHistoryDetailsBloc();
    eligibilityBloc = MockEligibilityBloc();
    salesOrgBloc = MockSalesOrgBloc();
    when(() => orderHistoryDetailsBloc.state)
        .thenReturn(OrderHistoryDetailsState.initial());
    when(() => eligibilityBloc.state).thenReturn(EligibilityState.initial());
    when(() => salesOrgBloc.state).thenReturn(SalesOrgState.initial());
  });
  Widget getWUT(Widget widget) {
    return EasyLocalization(
      supportedLocales: const [
        Locale('en', 'SG'),
      ],
      path: 'assets/langs/langs.csv',
      startLocale: const Locale('en', 'SG'),
      fallbackLocale: const Locale('en', 'SG'),
      saveLocale: true,
      useOnlyLangCode: false,
      assetLoader: CsvAssetLoader(),
      child: WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<SalesOrgBloc>(create: (context) => salesOrgBloc),
          BlocProvider<EligibilityBloc>(create: (context) => eligibilityBloc),
          BlocProvider<OrderHistoryDetailsBloc>(
              create: (context) => orderHistoryDetailsBloc),
          BlocProvider<SalesOrgBloc>(create: (context) => salesOrgBloc),
        ],
        child: Material(child: widget),
      ),
    );
  }

  group('OrderHistoryListTile', () {
    testWidgets('OrderHistoryListTile displays delivery datetime correctly',
        (WidgetTester tester) async {
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
            salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
          disableDeliveryDate: false,
        )),
      );

      // Create a mock OrderHistoryItem with a delivery datetime
      const fakeDeliveryDate = '20230412';
      const fakeDeliveryTime = '182206';
      final fakeOrderHistoryItem = OrderHistoryItem.empty().copyWith(
        deliveryDate: DateTimeStringValue(fakeDeliveryDate),
        deliveryTime: fakeDeliveryTime,
      );

      // Build the OrderHistoryListTile widget with the mock data
      await tester.pumpWidget(
        getWUT(
          OrderHistoryListTile(
            orderHistoryItem: fakeOrderHistoryItem,
            currency: Currency(''),
            customerCodeInfo: CustomerCodeInfo.empty(),
            shipToInfo: ShipToInfo.empty(),
            orderHistoryBasicInfo: OrderHistoryBasicInfo.empty(),
            salesOrgConfigs: SalesOrganisationConfigs.empty(),
            billToInfo: BillToInfo.empty(),
          ),
        ),
      );

      // Assert that the delivery datetime is displayed correctly
      expect(
          find.textContaining(
              fakeOrderHistoryItem.deliveryDateTime.toValidDateTimeString),
          findsOneWidget);
    });

    testWidgets(
        'OrderHistoryListTile does not display delivery datetime if disabled',
        (WidgetTester tester) async {
      when(() => eligibilityBloc.state).thenReturn(
        EligibilityState.initial().copyWith(
            salesOrgConfigs: SalesOrganisationConfigs.empty().copyWith(
          disableDeliveryDate: true,
        )),
      );

      // Create a mock OrderHistoryItem with a delivery datetime
      const fakeDeliveryDate = '20230412';
      const fakeDeliveryTime = '182206';
      final fakeOrderHistoryItem = OrderHistoryItem.empty().copyWith(
        deliveryDate: DateTimeStringValue(fakeDeliveryDate),
        deliveryTime: fakeDeliveryTime,
      );

      // Build the OrderHistoryListTile widget with the mock data
      await tester.pumpWidget(
        getWUT(
          OrderHistoryListTile(
            orderHistoryItem: fakeOrderHistoryItem,
            currency: Currency(''),
            customerCodeInfo: CustomerCodeInfo.empty(),
            shipToInfo: ShipToInfo.empty(),
            orderHistoryBasicInfo: OrderHistoryBasicInfo.empty(),
            salesOrgConfigs: SalesOrganisationConfigs.empty(),
            billToInfo: BillToInfo.empty(),
          ),
        ),
      );

      // Assert that the delivery datetime is displayed correctly
      expect(
          find.textContaining(
              fakeOrderHistoryItem.deliveryDateTime.toValidDateTimeString),
          findsNothing);
    });
  });
}

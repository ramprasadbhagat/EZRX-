import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_details/order_history_details_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_header.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/history/detail/section/order_detail_section.dart';
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
        ],
        child: Material(child: widget),
      ),
    );
  }

  group('HistoryOrderDetailSection', () {
    testWidgets('should display special instructions',
        (WidgetTester tester) async {
      // arrange
      when(() => orderHistoryDetailsBloc.state).thenReturn(
          OrderHistoryDetailsState.initial().copyWith(isLoading: false));

      const fakeInstructions = 'Special instructions test';
      when(() => orderHistoryDetailsBloc.state).thenReturn(
          OrderHistoryDetailsState.initial().copyWith(
              orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
                  orderHistoryDetailsSpecialInstructions:
                      SpecialInstructions(fakeInstructions))));

      // act
      await tester.pumpWidget(
          getWUT(const HistoryOrderDetailSection(key: Key('test'))));
      final specialInstructionsText = find.text('Special Instructions'.tr());
      // assert
      expect(specialInstructionsText, findsOneWidget);

      // act
      final noteText = find.textContaining(fakeInstructions);
      // assert
      expect(noteText, findsOneWidget);
    });

    testWidgets('should display Reference Note', (WidgetTester tester) async {
      // arrange
      when(() => orderHistoryDetailsBloc.state).thenReturn(
          OrderHistoryDetailsState.initial().copyWith(isLoading: false));
      const fakeInstructions = 'Special instructions test';
      const fakeReferenceNote = 'Reference Note test';

      when(() => orderHistoryDetailsBloc.state).thenReturn(
          OrderHistoryDetailsState.initial().copyWith(
              orderHistoryDetails: OrderHistoryDetails.empty().copyWith(
                  orderHistoryDetailsOrderHeader:
                      OrderHistoryDetailsOrderHeader.empty()
                          .copyWith(referenceNotes: fakeReferenceNote),
                  orderHistoryDetailsSpecialInstructions:
                      SpecialInstructions(fakeInstructions))));

      // act
      await tester.pumpWidget(
          getWUT(const HistoryOrderDetailSection(key: Key('test'))));
      final specialInstructionsText = find.text('Special Instructions'.tr());
      // assert
      expect(specialInstructionsText, findsOneWidget);

      // act
      final noteText = find.textContaining(fakeInstructions);
      // assert
      expect(noteText, findsOneWidget);
      await tester.pumpWidget(
          getWUT(const HistoryOrderDetailSection(key: Key('test'))));
      final referenceNoteText = find.text('Reference Note'.tr());
      // assert
      expect(referenceNoteText, findsOneWidget);

      // act
      final referenceNote = find.textContaining(fakeReferenceNote);
      // assert
      expect(referenceNote, findsOneWidget);
    });
  });
}

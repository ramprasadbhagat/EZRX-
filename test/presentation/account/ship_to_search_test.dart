import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/presentation/account/ship_to_search.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/widget_utils.dart';

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class ShipToCodeBlocMock extends MockBloc<ShipToCodeEvent, ShipToCodeState>
    implements ShipToCodeBloc {}

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}


class AutoRouterMock extends Mock implements AppRouter {}

enum CustomerCodeVariant { onn, off }

enum ShipToCodeVariant { onn, off }

final shipToCodeVariants = ValueVariant({...ShipToCodeVariant.values});

final customerCodeVariants = ValueVariant({...CustomerCodeVariant.values});

final locator = GetIt.instance;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  late CustomerCodeBlocMock customerCodeBlocMock;
  late ShipToCodeBlocMock shipToCodeBlocMock;
  late AppRouter autoRouterMock;
  late CartBloc cartBlocMock;


  setUpAll(() {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
    locator.registerLazySingleton(() => AppRouter());
  });

  group('Ship To Search Screen', () {
    setUp(() {
      customerCodeBlocMock = CustomerCodeBlocMock();
      shipToCodeBlocMock = ShipToCodeBlocMock();
      autoRouterMock = locator<AppRouter>();
      cartBlocMock = CartBlocMock();
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => shipToCodeBlocMock.state)
          .thenReturn(ShipToCodeState.initial());
      when(() => cartBlocMock.state).thenReturn(CartState.initial());

    });

    StackRouterScope getScopedWidget() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<CustomerCodeBloc>(
              create: (context) => customerCodeBlocMock),
          BlocProvider<ShipToCodeBloc>(create: (context) => shipToCodeBlocMock),
          BlocProvider<CartBloc>(
              create: (context) => cartBlocMock), 
        ],
        child: const ShiptToSearchPage(),
      );
    }

    testWidgets('Load ship to Search Widget', (tester) async {
      await tester.pumpWidget(getScopedWidget());
      final customerSearchPage = find.byKey(const Key('shipToSearchPage'));
      expect(customerSearchPage, findsOneWidget);
    });

    testWidgets('Clear ship to Search', (tester) async {
      await tester.pumpWidget(getScopedWidget());
      final clearShipToSearch = find.byKey(const Key('clearShipToSearch'));
      expect(clearShipToSearch, findsOneWidget);
      await tester.tap(clearShipToSearch);
    });

     testWidgets('Field Submitted ship to Search', (tester) async {
      await tester.pumpWidget(getScopedWidget());
      await tester.enterText(find.byKey(const Key('shipToCodeSearchField')), 'a@b.c');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();
      expect(find.text('123'), findsNothing);
      expect(find.text('a@b.c'), findsOneWidget);
      final errorMessage = find.byKey(const Key('snackBarMessage'));
      expect(errorMessage, findsOneWidget);
    });

    testWidgets(
      'Test Ship To Code Selector tile and search',
      (tester) async {
        final expectedShipToCodeListStates = [
          ShipToCodeState.initial().copyWith(isSearching: true),
          ShipToCodeState.initial().copyWith(
            isSearching: false,
            shipToInfo:
                ShipToInfo.empty().copyWith(shipToCustomerCode: 'fake-123456'),
            shipToInfoList: [
              ShipToInfo.empty(),
            ],
          ),
        ];

        whenListen(shipToCodeBlocMock,
            Stream.fromIterable(expectedShipToCodeListStates));
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle(const Duration(seconds: 3));

        expect(find.byKey(const Key('shipToCodeSelect')), findsOneWidget);

        if (customerCodeVariants.currentValue == CustomerCodeVariant.onn) {
          final shipToCodeOption =
              find.byKey(const Key('shipToOptionfake-123456'));
          expect(shipToCodeOption, findsOneWidget);
          await tester.tap(shipToCodeOption);
          await tester.pump();
          expect(find.text('Please select a shipping address'.tr()),
              findsOneWidget);
        }
      },
      variant: shipToCodeVariants,
    );
  });
}

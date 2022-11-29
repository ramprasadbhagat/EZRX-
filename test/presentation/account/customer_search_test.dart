import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/customer_code_local.dart';
import 'package:ezrxmobile/presentation/account/customer_search.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/widget_utils.dart';

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

enum SalesOrgVariant { onn, off }

enum CustomerCodeVariant { onn, off }

final salesOrgVariants = ValueVariant({...SalesOrgVariant.values});

final customerCodeVariants = ValueVariant({...CustomerCodeVariant.values});

class AutoRouterMock extends Mock implements AppRouter {}

final locator = GetIt.instance;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  late UserBloc userBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late AppRouter autoRouterMock;
  late List<CustomerCodeInfo> customerCodeListMock;
  late CartBloc cartBlocMock;

  setUpAll(() {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
    locator.registerLazySingleton(() => AppRouter());
  });

  group('Customer Search Screen', () {
    setUp(() async {
      userBlocMock = UserBlocMock();
      salesOrgBlocMock = SalesOrgBlocMock();
      customerCodeBlocMock = CustomerCodeBlocMock();
      cartBlocMock = CartBlocMock();
      autoRouterMock = locator<AppRouter>();
      customerCodeListMock =
          await CustomerCodeLocalDataSource().getCustomerCodeList();
      when(() => userBlocMock.state).thenReturn(UserState.initial());
      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => cartBlocMock.state).thenReturn(CartState.initial());
    });

    StackRouterScope getScopedWidget() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<UserBloc>(create: (context) => userBlocMock),
          BlocProvider<SalesOrgBloc>(create: (context) => salesOrgBlocMock),
          BlocProvider<CustomerCodeBloc>(
              create: (context) => customerCodeBlocMock),
          BlocProvider<CartBloc>(create: (context) => cartBlocMock),
        ],
        child: const CustomerSearchPage(),
      );
    }

    testWidgets('Load customer Search Widget', (tester) async {
      await tester.pumpWidget(getScopedWidget());
      final customerSearchPage = find.byKey(const Key('customerSearchPage'));
      expect(customerSearchPage, findsOneWidget);
    });

    testWidgets(
      'Test Customer Code Selector tile and search',
      (tester) async {
        final expectedCustomerCodeListStates = [
          CustomerCodeState.initial().copyWith(isFetching: true),
          CustomerCodeState.initial().copyWith(
            isFetching: false,
            customerCodeInfo: CustomerCodeInfo.empty()
                .copyWith(customerCodeSoldTo: 'fake-123456'),
            customerCodeList: [
              CustomerCodeInfo.empty(),
            ],
          ),
        ];

        whenListen(customerCodeBlocMock,
            Stream.fromIterable(expectedCustomerCodeListStates));
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle(const Duration(seconds: 3));

        expect(find.byKey(const Key('customerCodeSelect')), findsOneWidget);
        expect(find.text('Please select a Customer Code'.tr()), findsOneWidget);

        if (salesOrgVariants.currentValue == SalesOrgVariant.onn) {
          final customerCodeOption =
              find.byKey(const Key('customerCodeOptionfake-123456'));
          expect(customerCodeOption, findsOneWidget);
          await tester.tap(customerCodeOption);
          await tester.pump();
        }
      },
      variant: customerCodeVariants,
    );

    testWidgets('Search input must be greater than 2 characters.',
        (tester) async {
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle(const Duration(seconds: 3));

      final txtForm = find.byKey(const Key('customerCodeSearchField'));
      await tester.enterText(txtForm, '1234');
      expect(
          find.text('123'), findsNothing); // 3 characters shouldn't be allowed
      expect(find.text('1234'), findsOneWidget);
    });

    testWidgets('Test have customer code list and emit load more state include',
        (tester) async {
      final expectedCustomerCodeListStates = [
        CustomerCodeState.initial().copyWith(
          isFetching: true,
        ),
      ];

      whenListen(customerCodeBlocMock,
          Stream.fromIterable(expectedCustomerCodeListStates),
          initialState: customerCodeBlocMock.state.copyWith(
            isFetching: false,
            canLoadMore: true,
            customerCodeInfo: customerCodeListMock.first,
            customerCodeList: customerCodeListMock,
          ));

      await tester.runAsync(() async {
        await tester.pumpWidget(getScopedWidget());
      });

      await tester.pump();

      final nocustomerFound = find.text('No Customer Code Found');
      final loadIndicator = find.byKey(const Key('loadIndicator'));

      final gesture = await tester
          .startGesture(const Offset(50, 100)); //Position of the scrollview
      await gesture.moveBy(const Offset(50, -2000)); //How much to scroll by
      await tester.pump(const Duration(seconds: 5));

      await tester.pump();
      expect(loadIndicator, findsOneWidget);
      expect(nocustomerFound, findsNothing);
    });

    testWidgets(
        'Test have customer code list and emit load more state include and found no data',
        (tester) async {
      final expectedCustomerCodeListStates = [
        CustomerCodeState.initial().copyWith(
          isFetching: false,
          customerCodeList: [],
        ),
      ];

      whenListen(customerCodeBlocMock,
          Stream.fromIterable(expectedCustomerCodeListStates),
          initialState: customerCodeBlocMock.state.copyWith(
            isFetching: true,
            canLoadMore: true,
            customerCodeInfo: customerCodeListMock.first,
            customerCodeList: customerCodeListMock,
          ));

      await tester.runAsync(() async {
        await tester.pumpWidget(getScopedWidget());
      });

      await tester.pump();

      final nocustomerFound = find.text('No Customer Code Found');
      final loadIndicator = find.byKey(const Key('loadIndicator'));

      final gesture = await tester
          .startGesture(const Offset(50, 100)); //Position of the scrollview
      await gesture.moveBy(const Offset(50, -2000)); //How much to scroll by
      await tester.pump(const Duration(seconds: 5));

      await tester.pump();
      expect(loadIndicator, findsNothing);
      expect(nocustomerFound, findsOneWidget);
    });

    testWidgets('Clear Customer code Search', (tester) async {
      final expectedCustomerCodeListStates = [
        CustomerCodeState.initial().copyWith(
          isFetching: false,
          customerCodeList: [],
        ),
      ];

      whenListen(customerCodeBlocMock,
          Stream.fromIterable(expectedCustomerCodeListStates),
          initialState: customerCodeBlocMock.state.copyWith(
            isFetching: true,
            canLoadMore: true,
            customerCodeInfo: customerCodeListMock.first,
            customerCodeList: customerCodeListMock,
          ));

      await tester.runAsync(() async {
        await tester.pumpWidget(getScopedWidget());
      });

      await tester.pump();
      final clearCusromerCodeSearch =
          find.byKey(const Key('clearCustomerCodeSearch'));
      expect(clearCusromerCodeSearch, findsOneWidget);
      await tester.tap(clearCusromerCodeSearch);
    });

    testWidgets('Field Submitted Customer code Search', (tester) async {
      final expectedCustomerCodeListStates = [
        CustomerCodeState.initial().copyWith(
          isFetching: false,
          customerCodeList: [],
        ),
      ];

      whenListen(customerCodeBlocMock,
          Stream.fromIterable(expectedCustomerCodeListStates),
          initialState: customerCodeBlocMock.state.copyWith(
            isFetching: true,
            canLoadMore: true,
            customerCodeInfo: customerCodeListMock.first,
            customerCodeList: customerCodeListMock,
          ));

      await tester.runAsync(() async {
        await tester.pumpWidget(getScopedWidget());
      });

      await tester.pump();
      await tester.enterText(
          find.byKey(const Key('customerCodeSearchField')), 'a@b.c');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();
      expect(find.text('123'), findsNothing);
      expect(find.text('a@b.c'), findsOneWidget);
      final errorMessage = find.byKey(const Key('snackBarMessage'));
      expect(errorMessage, findsOneWidget);
    });
  });
}

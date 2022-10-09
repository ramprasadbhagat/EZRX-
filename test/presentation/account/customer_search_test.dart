import 'package:auto_route/auto_route.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/core/search/search_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
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

class CustomerSearchBlocMock extends MockBloc<SearchEvent, SearchState>
    implements SearchBloc {}

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
  late SearchBloc searchBlocMock;
  late AppRouter autoRouterMock;

  setUpAll(() {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
    locator.registerLazySingleton(() => AppRouter());
  });

  group('Customer Search Screen', () {
    setUp(() {
      userBlocMock = UserBlocMock();
      salesOrgBlocMock = SalesOrgBlocMock();
      customerCodeBlocMock = CustomerCodeBlocMock();
      searchBlocMock = CustomerSearchBlocMock();
      autoRouterMock = locator<AppRouter>();
      when(() => userBlocMock.state).thenReturn(UserState.initial());
      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => searchBlocMock.state).thenReturn(SearchState.initial());
    });

    StackRouterScope getScopedWidget() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<UserBloc>(create: (context) => userBlocMock),
          BlocProvider<SalesOrgBloc>(create: (context) => salesOrgBlocMock),
          BlocProvider<SearchBloc>(create: (context) => searchBlocMock),
          BlocProvider<CustomerCodeBloc>(
              create: (context) => customerCodeBlocMock),
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
            customeCodeInfo: CustomerCodeInfo.empty()
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
  });
}

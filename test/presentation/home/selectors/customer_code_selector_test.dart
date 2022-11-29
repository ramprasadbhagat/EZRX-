import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/home/selector/customer_code_selector.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/material_frame_wrapper.dart';

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class ShipToCodeBlocMock extends MockBloc<ShipToCodeEvent, ShipToCodeState>
    implements ShipToCodeBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  late CustomerCodeBlocMock mockCustomerCodeBloc;
  late AuthBlocMock authBlocMock;
  late SalesOrgBlocMock salesOrgBlocMock;
  late EligibilityBlocMock eligibilityBlocMock;
  late ShipToCodeBlocMock shipToCodeBlocMock;
  late UserBlocMock userBlocMock;

  setUpAll(() async {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
    locator.registerLazySingleton(() => AppRouter());
  });

  final fakeCustomerInfo =
      CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: '00001234');

  final fakeCustomerInfo2 =
      CustomerCodeInfo.empty().copyWith(customerCodeSoldTo: '00001235');

  group('Customer Code Selector Test ', () {
    setUp(() {
      locator = GetIt.instance;
      mockCustomerCodeBloc = CustomerCodeBlocMock();
      authBlocMock = AuthBlocMock();
      salesOrgBlocMock = SalesOrgBlocMock();
      eligibilityBlocMock = EligibilityBlocMock();
      shipToCodeBlocMock = ShipToCodeBlocMock();
      userBlocMock = UserBlocMock();
      when(() => mockCustomerCodeBloc.state).thenReturn(
          CustomerCodeState.initial()
              .copyWith(customerCodeList: [fakeCustomerInfo]));
      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
      when(() => eligibilityBlocMock.state)
          .thenReturn(EligibilityState.initial());
      when(() => shipToCodeBlocMock.state)
          .thenReturn(ShipToCodeState.initial());
      when(() => userBlocMock.state).thenReturn(UserState.initial());
    });

    Future getWidget(tester) async {
      return await tester.pumpWidget(
        MaterialFrameWrapper(
          child: MultiBlocProvider(
            providers: [
              BlocProvider<CustomerCodeBloc>(
                  create: (context) => mockCustomerCodeBloc),
              BlocProvider<AuthBloc>(create: (context) => authBlocMock),
              BlocProvider<SalesOrgBloc>(create: (context) => salesOrgBlocMock),
              BlocProvider<EligibilityBloc>(
                  create: (context) => eligibilityBlocMock),
              BlocProvider<ShipToCodeBloc>(
                  create: (context) => shipToCodeBlocMock),
              BlocProvider<UserBloc>(create: (context) => userBlocMock),
            ],
            child: Material(
              child: Scaffold(
                body: Row(
                  children: const [
                    CustomerCodeSelector(),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

    testWidgets('When customerCodeInfo is empty', (tester) async {
      when(() => mockCustomerCodeBloc.state).thenReturn(
          CustomerCodeState.initial()
              .copyWith(customerCodeList: [CustomerCodeInfo.empty()]));
      await getWidget(tester);
      final customerCodeText = find.text('Customer Code');
      final selectedCustomerCodeText = find.text('NA');
      expect(customerCodeText, findsOneWidget);
      expect(selectedCustomerCodeText, findsOneWidget);
    });

    testWidgets('When customerCodeInfo is not empty', (tester) async {
      when(() => mockCustomerCodeBloc.state).thenReturn(
          CustomerCodeState.initial()
              .copyWith(customerCodeInfo: fakeCustomerInfo));

      await getWidget(tester);
      final customerCodeText = find.text('Customer Code');
      final selectedCustomerCodeText = find.text('00001234');
      expect(customerCodeText, findsOneWidget);
      expect(selectedCustomerCodeText, findsOneWidget);
    });

    testWidgets('When customerCodeInfo is getting fetched', (tester) async {
      when(() => mockCustomerCodeBloc.state)
          .thenReturn(CustomerCodeState.initial().copyWith(isFetching: true));
      await getWidget(tester);
      final customerCodeText = find.text('Customer Code');
      final shimmer = find.byType(Shimmer);
      expect(customerCodeText, findsOneWidget);
      expect(shimmer, findsOneWidget);
    });

    testWidgets('When there is an error', (tester) async {
      final expectedCustomerCodeListStates = [
        CustomerCodeState.initial().copyWith(isFetching: true),
        CustomerCodeState.initial().copyWith(
          isFetching: false,
          customerCodeInfo: fakeCustomerInfo,
          customerCodeList: [
            CustomerCodeInfo.empty(),
          ],
          apiFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('authentication failed'),
            ),
          ),
        ),
      ];
      whenListen(mockCustomerCodeBloc,
          Stream.fromIterable(expectedCustomerCodeListStates));

      await getWidget(tester);
      final selectedCustomerCodeText = find.text('00001234');
      expect(selectedCustomerCodeText, findsNothing);
    });

    testWidgets('When customerCodeInfo got changed', (tester) async {
      final expectedCustomerCodeListStates = [
        CustomerCodeState.initial().copyWith(isFetching: true),
        CustomerCodeState.initial().copyWith(
          isFetching: false,
          customerCodeInfo: fakeCustomerInfo2,
          customerCodeList: [
            CustomerCodeInfo.empty(),
          ],
        ),
      ];
      whenListen(mockCustomerCodeBloc,
          Stream.fromIterable(expectedCustomerCodeListStates));

      await getWidget(tester);

      await tester.pumpAndSettle(const Duration(seconds: 3));

      final selectedCustomerCodeText1 = find.text('00001235');
      expect(selectedCustomerCodeText1, findsOneWidget);
    });
  });
}

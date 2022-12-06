import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/sales_rep/sales_rep_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/aup_tc/aup_tc_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/payment_customer_information/payment_customer_information_bloc.dart';
import 'package:ezrxmobile/application/order/payment_term/payment_term_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/full_name.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/payment_customer_information.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/widget_utils.dart';

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class ShipToCodeBlocMock extends MockBloc<ShipToCodeEvent, ShipToCodeState>
    implements ShipToCodeBloc {}

class SalesRepBlocMock extends MockBloc<SalesRepEvent, SalesRepState>
    implements SalesRepBloc {}

class AupTcBlocMock extends MockBloc<AupTcEvent, AupTcState>
    implements AupTcBloc {}

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

class PaymentCustomerInformationBlocMock extends MockBloc<
        PaymentCustomerInformationEvent, PaymentCustomerInformationState>
    implements PaymentCustomerInformationBloc {}

class PaymentTermBlocMock extends MockBloc<PaymentTermEvent, PaymentTermState>
    implements PaymentTermBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  late AuthBloc authBlocMock;
  late UserBloc userBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late CustomerCodeBloc customerCodeBlocMock;
  late ShipToCodeBloc shipToCodeBLocMock;
  late SalesRepBloc salesRepBlocMock;
  late AupTcBloc aupTcBlocMock;
  late CartBloc cartBlocMock;
  late PaymentCustomerInformationBloc paymentCustomerInformationBlocMock;
  late PaymentTermBloc paymentTermBlocMock;
  late AppRouter autoRouterMock;

  final fakeSalesOrganisation =
      SalesOrganisation.empty().copyWith(salesOrg: SalesOrg('2601'));

  final fakeUser = User.empty().copyWith(
      id: 'fake-id',
      username: Username('fake-username'),
      fullName: const FullName(firstName: 'first name', lastName: 'last name'),
      userSalesOrganisations: [fakeSalesOrganisation],
      customerCode: CustomerCode('130046'),
      email: EmailAddress('a@abc.com'),
      role: Role.empty().copyWith(
        type: RoleType('internal_sales_rep'),
        id: 'fake-id',
        name: 'fake-name',
        description: 'fake-description',
      ));

  // late AppRouter router;
  setUpAll(() async {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
    locator.registerLazySingleton(() => AppRouter());
  });

  group('Splash Screen', () {
    setUp(() {
      locator = GetIt.instance;
      customerCodeBlocMock = CustomerCodeBlocMock();
      authBlocMock = AuthBlocMock();
      userBlocMock = UserBlocMock();
      salesOrgBlocMock = SalesOrgBlocMock();
      shipToCodeBLocMock = ShipToCodeBlocMock();
      salesRepBlocMock = SalesRepBlocMock();
      aupTcBlocMock = AupTcBlocMock();
      cartBlocMock = CartBlocMock();
      paymentCustomerInformationBlocMock = PaymentCustomerInformationBlocMock();
      paymentTermBlocMock = PaymentTermBlocMock();
      autoRouterMock = locator<AppRouter>();

      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
      when(() => authBlocMock.state).thenReturn(const AuthState.initial());
      when(() => userBlocMock.state).thenReturn(UserState.initial());
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => shipToCodeBLocMock.state)
          .thenReturn(ShipToCodeState.initial());
      when(() => salesRepBlocMock.state).thenReturn(SalesRepState.initial());
      when(() => aupTcBlocMock.state).thenReturn(AupTcState.initial());
      when(() => cartBlocMock.state).thenReturn(CartState.initial());
      when(() => paymentCustomerInformationBlocMock.state)
          .thenReturn(PaymentCustomerInformationState.initial());
      when(() => paymentTermBlocMock.state)
          .thenReturn(PaymentTermState.initial());
    });

    Future getWidget(tester) async {
      return await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          providers: [
            BlocProvider<CustomerCodeBloc>(
                create: (context) => customerCodeBlocMock),
            BlocProvider<AuthBloc>(create: (context) => authBlocMock),
            BlocProvider<SalesOrgBloc>(create: (context) => salesOrgBlocMock),
            BlocProvider<UserBloc>(create: (context) => userBlocMock),
            BlocProvider<ShipToCodeBloc>(
                create: (context) => shipToCodeBLocMock),
            BlocProvider<SalesRepBloc>(create: (context) => salesRepBlocMock),
            BlocProvider<AupTcBloc>(create: (context) => aupTcBlocMock),
            BlocProvider<CartBloc>(create: (context) => cartBlocMock),
            BlocProvider<PaymentCustomerInformationBloc>(
                create: (context) => paymentCustomerInformationBlocMock),
            BlocProvider<PaymentTermBloc>(
                create: (context) => paymentTermBlocMock),
          ],
          child: const SplashPage(),
        ),
      );
    }

    testWidgets('When Auth State is initialized', (tester) async {
      final expectedAuthListStates = [
        const AuthState.loading(),
        const AuthState.initial(),
      ];
      whenListen(authBlocMock, Stream.fromIterable(expectedAuthListStates));
      await getWidget(tester);
      await tester.pump();
      final splashLoadingIndicator =
          find.byKey(const Key('splashLoadingIndicator'), skipOffstage: false);
      expect(splashLoadingIndicator, findsNWidgets(2));
    });
    testWidgets('When Auth State is un-authenticated', (tester) async {
      final expectedAuthListStates = [
        const AuthState.loading(),
        const AuthState.unauthenticated()
      ];
      whenListen(authBlocMock, Stream.fromIterable(expectedAuthListStates));
      await getWidget(tester);
      await tester.pump();
      final splashLoadingIndicator =
          find.byKey(const Key('splashLoadingIndicator'), skipOffstage: false);
      expect(splashLoadingIndicator, findsNWidgets(1));
      verify(() => userBlocMock.add(const UserEvent.initialized())).called(1);
      expect(autoRouterMock.current.name, LoginPageRoute.name);
    });

    testWidgets('When Auth State is authenticated', (tester) async {
      final expectedAuthListStates = [
        const AuthState.authenticated(),
      ];
      whenListen(authBlocMock, Stream.fromIterable(expectedAuthListStates));
      await getWidget(tester);
      await tester.pump();
      verify(() => userBlocMock.add(const UserEvent.fetch())).called(1);
      expect(autoRouterMock.current.name, HomeNavigationTabbarRoute.name);
    });

    testWidgets('When user has state organization', (tester) async {
      final expectedUserListStates = [
        UserState.initial(),
        UserState.initial().copyWith(user: fakeUser),
      ];
      whenListen(userBlocMock, Stream.fromIterable(expectedUserListStates));
      await getWidget(tester);
      await tester.pump();

      verify(() => salesOrgBlocMock.add(SalesOrgEvent.loadSavedOrganisation(
          salesOrganisations: [fakeSalesOrganisation]))).called(1);
      verify(() => salesRepBlocMock.add(SalesRepEvent.fetch(user: fakeUser)))
          .called(1);

      verify(() => aupTcBlocMock
              .add(AupTcEvent.show(fakeUser, salesOrgBlocMock.state.salesOrg)))
          .called(1);

      verify(() => cartBlocMock.add(const CartEvent.initialized())).called(1);
    });

    testWidgets('When PaymentCustomerInformation bloc is listening',
        (tester) async {
      final expectedPaymentStates = [
        PaymentCustomerInformationState.initial(),
        PaymentCustomerInformationState.initial().copyWith(
          paymentCustomerInformation: const PaymentCustomerInformation(
            paymentTerm: 'paymentTerm',
            shipToInfoList: <ShipToInfo>[],
          ),
        )
      ];

      whenListen(paymentCustomerInformationBlocMock,
          Stream.fromIterable(expectedPaymentStates));
      await getWidget(tester);
      await tester.pump();

      verify(() => paymentTermBlocMock.add(PaymentTermEvent.fetch(
            customeCodeInfo: customerCodeBlocMock.state.customerCodeInfo,
            salesOrganisation: salesOrgBlocMock.state.salesOrganisation,
            salesOrganisationConfigs: salesOrgBlocMock.state.configs,
            salesRepresentativeInfo: salesRepBlocMock.state.salesRepInfo,
            paymentCustomerInformation:
                PaymentCustomerInformation.empty().copyWith(
              paymentTerm: 'paymentTerm',
              shipToInfoList: <ShipToInfo>[],
            ),
          ))).called(1);
    });

    testWidgets('When cart bloc has error', (tester) async {
      final expectedStates = [
        CartState.initial().copyWith(apiFailureOrSuccessOption: none()),
        CartState.initial().copyWith(
          apiFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('Fake-Error'),
            ),
          ),
          isFetching: true,
        ),
      ];
      whenListen(cartBlocMock, Stream.fromIterable(expectedStates));
      await getWidget(tester);
      await tester.pump();
      expect(find.text('Fake-Error'), findsOneWidget);
    });
  });
}

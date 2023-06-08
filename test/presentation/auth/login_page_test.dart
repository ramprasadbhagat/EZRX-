import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/auth/login/login_form_bloc.dart';
import 'package:ezrxmobile/application/deep_linking/deep_linking_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/application/order/payment_customer_information/payment_customer_information_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/auth/entities/login.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/presentation/auth/login_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/material_frame_wrapper.dart';
import '../../utils/widget_utils.dart';
import '../order_history/order_history_details_widget_test.dart';

class LoginFormBlocMock extends MockBloc<LoginFormEvent, LoginFormState>
    implements LoginFormBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

class SalesOrgBlocMock extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

class CartBlocMock extends MockBloc<CartEvent, CartState> implements CartBloc {}

class ShipToCodeBlocMock extends MockBloc<ShipToCodeEvent, ShipToCodeState>
    implements ShipToCodeBloc {}

class AnnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class PaymentCustomerInformationBlocMock extends MockBloc<
        PaymentCustomerInformationEvent, PaymentCustomerInformationState>
    implements PaymentCustomerInformationBloc {}

class OrderDocumentTypeMockBloc
    extends MockBloc<OrderDocumentTypeEvent, OrderDocumentTypeState>
    implements OrderDocumentTypeBloc {}

class DeepLinkingMockBloc extends MockBloc<DeepLinkingEvent, DeepLinkingState>
    implements DeepLinkingBloc {}

class AutoRouterMock extends Mock implements AppRouter {
  @override
  String currentPath = '';
}

void main() {
  late GetIt locator;
  late LoginFormBloc loginBlocMock;
  late AuthBloc authBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late DeepLinkingBloc deepLinkingBlocMock;
  final UserBloc userBlocMock = UserBlocMock();
  final SalesOrgBloc salesOrgBlocMock = SalesOrgBlocMock();
  final CustomerCodeBloc customerCodeBlocMock = CustomerCodeBlocMock();
  final ShipToCodeBloc shipToCodeBLocMock = ShipToCodeBlocMock();
  final CartBloc cartBlocMock = CartBlocMock();
  final eligibilityBlocMock = EligibilityBlocMock();
  late AutoRouterMock autoRouterMock;
  final PaymentCustomerInformationBloc paymentCustomerInformationBlocMock =
      PaymentCustomerInformationBlocMock();
  late OrderDocumentTypeBloc orderDocumentTypeBlocMock;

  setUpAll(() async {
    locator = GetIt.instance;
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => MixpanelService());
    locator<MixpanelService>().init(mixpanel: MixpanelMock());
  });

  group('Login Screen', () {
    setUp(() {
      WidgetsFlutterBinding.ensureInitialized();
      loginBlocMock = LoginFormBlocMock();
      autoRouterMock = AutoRouterMock();
      authBlocMock = AuthBlocMock();
      announcementBlocMock = AnnnouncementBlocMock();
      orderDocumentTypeBlocMock = OrderDocumentTypeMockBloc();
      deepLinkingBlocMock = DeepLinkingMockBloc();

      when(() => loginBlocMock.state).thenReturn(LoginFormState.initial());
      when(() => announcementBlocMock.state)
          .thenReturn(AnnouncementState.initial());
      when(() => userBlocMock.state).thenReturn(UserState.initial());
      when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
      when(() => customerCodeBlocMock.state)
          .thenReturn(CustomerCodeState.initial());
      when(() => shipToCodeBLocMock.state)
          .thenReturn(ShipToCodeState.initial());
      when(() => paymentCustomerInformationBlocMock.state)
          .thenReturn(PaymentCustomerInformationState.initial());
      when(() => cartBlocMock.state).thenReturn(CartState.initial());
      when(() => eligibilityBlocMock.state)
          .thenReturn(EligibilityState.initial());
      when(() => orderDocumentTypeBlocMock.state)
          .thenReturn(OrderDocumentTypeState.initial());
      when(() => authBlocMock.state).thenReturn(const AuthState.initial());
      when(() => deepLinkingBlocMock.state)
          .thenReturn(const DeepLinkingState.initial());
    });

    Widget loginTestPage() => WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          child: MultiBlocProvider(
            providers: [
              BlocProvider<LoginFormBloc>(
                create: (context) => loginBlocMock,
              ),
              BlocProvider<AnnouncementBloc>(
                create: (context) => announcementBlocMock,
              ),
              BlocProvider<PaymentCustomerInformationBloc>(
                create: (context) => paymentCustomerInformationBlocMock,
              ),
              BlocProvider<CartBloc>(
                create: (context) => CartBlocMock(),
              ),
              BlocProvider<UserBloc>(
                create: (context) => userBlocMock,
              ),
              BlocProvider<OrderDocumentTypeBloc>(
                create: (context) => orderDocumentTypeBlocMock,
              ),
              BlocProvider<AuthBloc>(
                create: (context) => authBlocMock,
              ),
            ],
            child: const LoginPage(),
          ),
        );

    testWidgets("Test don't have credential", (tester) async {
      await tester.pumpWidget(loginTestPage());
      // Create the Finders.
      final userNameTextField = find.byKey(const Key('loginUsernameField'));
      final passwordTextField = find.byKey(const Key('loginPasswordField'));
      final loginSubmitButton = find.byKey(const Key('loginSubmitButton'));
      final ssoLoginButton = find.byKey(const Key('ssoLoginButton'));
      final rememberPasswordCheckBox =
          find.byKey(const Key('loginRememberPasswordCheckbox'));

      expect(userNameTextField, findsOneWidget);
      expect(passwordTextField, findsOneWidget);
      expect(loginSubmitButton, findsOneWidget);
      expect(ssoLoginButton, findsOneWidget);
      expect(rememberPasswordCheckBox, findsOneWidget);
    });

    testWidgets('Test login error', (tester) async {
      final expectedStates = [
        LoginFormState.initial().copyWith(
          authFailureOrSuccessOption: optionOf(
            const Left(ApiFailure.other('fake-message')),
          ),
          showErrorMessages: true,
        ),
      ];

      whenListen(loginBlocMock, Stream.fromIterable(expectedStates));

      await tester.pumpWidget(loginTestPage());

      final errorMessage = find.byKey(const Key('snackBarMessage'));

      expect(errorMessage, findsNothing);
      await tester.pump();

      expect(errorMessage, findsOneWidget);
    });

    testWidgets('Test login success', (tester) async {
      final expectedStates = [
        LoginFormState.initial().copyWith(
          authFailureOrSuccessOption: optionOf(
            Right(Login(jwt: JWT('fake-success'))),
          ),
        ),
      ];

      when(() => authBlocMock.state)
          .thenReturn(const AuthState.authenticated());

      whenListen(loginBlocMock, Stream.fromIterable(expectedStates));

      await tester.pumpWidget(loginTestPage());

      await tester.pump();

      final rememberPasswordBox =
          find.byKey(const Key('loginRememberPasswordCheckbox'));

      expect(rememberPasswordBox, findsOneWidget);
      await tester.tap(rememberPasswordBox);
      await tester.pump();

      await tester.pumpWidget(MaterialFrameWrapper(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => authBlocMock,
            ),
            BlocProvider<UserBloc>(
              create: (context) => userBlocMock,
            ),
            BlocProvider<SalesOrgBloc>(
              create: (context) => salesOrgBlocMock,
            ),
            BlocProvider<CustomerCodeBloc>(
              create: (context) => customerCodeBlocMock,
            ),
            BlocProvider<ShipToCodeBloc>(
              create: (context) => shipToCodeBLocMock,
            ),
            BlocProvider<PaymentCustomerInformationBloc>(
              create: (context) => paymentCustomerInformationBlocMock,
            ),
            BlocProvider<CartBloc>(
              create: (context) => cartBlocMock,
            ),
            BlocProvider<EligibilityBloc>(
              create: (context) => eligibilityBlocMock,
            ),
            BlocProvider<OrderDocumentTypeBloc>(
              create: (context) => orderDocumentTypeBlocMock,
            ),
            BlocProvider<DeepLinkingBloc>(
              create: (context) => deepLinkingBlocMock,
            )
          ],
          child: const SplashPage(),
        ),
      ));

      // Create the Finders.
      final userNameTextField = find.byKey(const Key('loginUsernameField'));
      final passwordTextField = find.byKey(const Key('loginPasswordField'));
      final loginSubmitButton = find.byKey(const Key('loginSubmitButton'));
      // final ssoLoginButton = find.byKey(const Key('ssoLoginButton'));
      final rememberPasswordCheckBox =
          find.byKey(const Key('loginRememberPasswordCheckbox'));

      expect(userNameTextField, findsNothing);
      expect(passwordTextField, findsNothing);
      expect(loginSubmitButton, findsNothing);
      // expect(ssoLoginButton, findsNothing);
      expect(rememberPasswordCheckBox, findsNothing);
    });

    testWidgets(
      'test onWillPop',
      (tester) async {
        var willPopCalled = false;
        await tester.pumpWidget(loginTestPage());

        await tester.pump();
        final dynamic widgetsAppState = tester.state(find.byType(WidgetsApp));
        willPopCalled = await widgetsAppState.didPopRoute();
        await tester.pump();
        expect(willPopCalled, true);
      },
    );

    testWidgets(
      'SSOLogin Login',
      (tester) async {
        await tester.pumpWidget(loginTestPage());
        await tester.pump();
        // final ssoLoginButton = find.byKey(const Key('ssoLoginButton'));
        // expect(ssoLoginButton, findsOneWidget);
        // await tester.tap(ssoLoginButton);
        await tester.pump();
      },
    );

    testWidgets(
      'onChange Username',
      (tester) async {
        final expectedStates = [
          LoginFormState.initial(),
          LoginFormState.initial().copyWith(
            username: Username('ezrxtest05'),
          ),
        ];

        whenListen(loginBlocMock, Stream.fromIterable(expectedStates));
        await tester.pumpWidget(loginTestPage());
        await tester.pump();
        final userName = find.byKey(const Key('loginUsernameField'));
        expect(userName, findsOneWidget);
        await tester.enterText(userName, 'ezrxtest06');
        await tester.pump();
        final loginButton = find.byKey(const Key('loginSubmitButton'));
        expect(loginButton, findsOneWidget);
        await tester.tap(loginButton);
        await tester.pumpAndSettle();
      },
    );

    testWidgets('Username is Valid', (tester) async {
      final expectedStates = [
        LoginFormState.initial().copyWith(
          username: Username('1\n2'),
          showErrorMessages: true,
        ),
      ];
      when(() => loginBlocMock.state).thenReturn(
        LoginFormState.initial().copyWith(
          username: Username('1\n2'),
          showErrorMessages: true,
        ),
      );
      whenListen(loginBlocMock, Stream.fromIterable(expectedStates));

      await tester.pumpWidget(loginTestPage());
      await tester.enterText(
          find.byKey(const Key('loginUsernameField')), '1\n2');
      await tester.pump(const Duration(
        seconds: 2,
      ));
      expect(find.byKey(const Key('loginUsernameField')), findsOneWidget);
    });

    testWidgets('Password is orElse', (tester) async {
      final expectedStates = [
        LoginFormState.initial().copyWith(
          username: Username('ezrxtest05'),
          password: Password.reset('Staysafe01'),
          showErrorMessages: true,
        ),
      ];
      when(() => loginBlocMock.state).thenReturn(
        LoginFormState.initial().copyWith(
          username: Username('ezrxtest05'),
          password: Password.reset('Staysafe01'),
          showErrorMessages: true,
        ),
      );
      whenListen(loginBlocMock, Stream.fromIterable(expectedStates));

      await tester.pumpWidget(loginTestPage());
      await tester.enterText(
          find.byKey(const Key('loginPasswordField')), 'Staysafe01');
      await tester.pump(const Duration(
        seconds: 2,
      ));
      expect(find.byKey(const Key('loginPasswordField')), findsOneWidget);
    });

    testWidgets('Password is Valid', (tester) async {
      final expectedStates = [
        LoginFormState.initial().copyWith(
          username: Username('ezrxtest05'),
          password: Password.reset('St@ysafe01'),
          showErrorMessages: true,
        ),
      ];
      when(() => loginBlocMock.state).thenReturn(
        LoginFormState.initial().copyWith(
          username: Username('ezrxtest05'),
          password: Password.reset('St@ysafe01'),
          showErrorMessages: true,
        ),
      );
      whenListen(loginBlocMock, Stream.fromIterable(expectedStates));

      await tester.pumpWidget(loginTestPage());
      await tester.enterText(
          find.byKey(const Key('loginPasswordField')), 'St@ysafe01');
      await tester.pump(const Duration(
        seconds: 2,
      ));
      expect(find.byKey(const Key('loginPasswordField')), findsOneWidget);
    });

    testWidgets(
      'onChange Password',
      (tester) async {
        final expectedStates = [
          LoginFormState.initial(),
          LoginFormState.initial().copyWith(
            password: Password.login('password'),
          ),
        ];

        whenListen(loginBlocMock, Stream.fromIterable(expectedStates));
        await tester.pumpWidget(loginTestPage());
        await tester.pump();
        final password = find.byKey(const Key('loginPasswordField'));
        expect(password, findsOneWidget);
        await tester.enterText(password, 'password1');
        await tester.pump();

        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pump();
        final loginPasswordFieldSuffixIcon =
            find.byKey(const Key('loginPasswordFieldSuffixIcon'));
        expect(loginPasswordFieldSuffixIcon, findsOneWidget);
        await tester.tap(loginPasswordFieldSuffixIcon);
        await tester.pumpAndSettle();

        await tester.sendKeyEvent(LogicalKeyboardKey.enter);
        await tester.pumpAndSettle();
      },
    );

    testWidgets(
      'Login Validation - Username is empty and Password is filled, validation error message only for username',
      (tester) async {
        final expectedStates = [
          LoginFormState.initial(),
          LoginFormState.initial().copyWith(
            username: Username(''),
            password: Password.login('password'),
            isSubmitting: false,
            showErrorMessages: true,
          ),
        ];

        whenListen(loginBlocMock, Stream.fromIterable(expectedStates));
        await tester.pumpWidget(loginTestPage());
        await tester.pump();
        final password = find.byKey(const Key('loginPasswordField'));
        expect(password, findsOneWidget);

        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pump();

        final loginSubmitButton = find.byKey(const Key('loginSubmitButton'));
        expect(loginSubmitButton, findsOneWidget);
        await tester.tap(loginSubmitButton);
        await tester.pump();

        final usernameErrorText =
            find.textContaining('Username cannot be empty.'.tr());
        expect(usernameErrorText, findsOneWidget);
        final passwordErrorText =
            find.textContaining('Password cannot be empty.'.tr());
        expect(passwordErrorText, findsNothing);
      },
    );

    testWidgets(
      'Login Validation - Password is empty and username is filled, validation error message only for password',
      (tester) async {
        final expectedStates = [
          LoginFormState.initial(),
          LoginFormState.initial().copyWith(
            username: Username('username'),
            password: Password.login(''),
            isSubmitting: false,
            showErrorMessages: true,
          ),
        ];

        whenListen(loginBlocMock, Stream.fromIterable(expectedStates));
        await tester.pumpWidget(loginTestPage());
        await tester.pump();
        final password = find.byKey(const Key('loginPasswordField'));
        expect(password, findsOneWidget);

        await tester.testTextInput.receiveAction(TextInputAction.done);
        await tester.pump();

        final loginSubmitButton = find.byKey(const Key('loginSubmitButton'));
        expect(loginSubmitButton, findsOneWidget);
        await tester.tap(loginSubmitButton);
        await tester.pump();

        final usernameErrorText =
            find.textContaining('Username cannot be empty.'.tr());
        expect(usernameErrorText, findsNothing);
        final passwordErrorText =
            find.textContaining('Password cannot be empty.'.tr());
        expect(passwordErrorText, findsOneWidget);
      },
    );
  });
}

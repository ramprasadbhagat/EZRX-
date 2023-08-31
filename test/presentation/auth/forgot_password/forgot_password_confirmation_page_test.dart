import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:ezrxmobile/application/auth/forgot_password/forgot_password_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/auth/entities/forgot_password.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/auth/forgot_password/widgets/back_to_login_button.dart';
import 'package:ezrxmobile/presentation/auth/forgot_password/forgot_passoword_confirmation_page.dart';
import 'package:ezrxmobile/presentation/core/logo.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';

class ForgotPasswordBlocMock
    extends MockBloc<ForgotPasswordEvent, ForgotPasswordState>
    implements ForgotPasswordBloc {}

void main() {
  setUpAll(() async {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
  });
  group('ForgetPasswordPage', () {
    late ForgotPasswordBloc forgotPasswordBlocMock;
    late AppRouter autoRouterMock;

    setUp(() {
      autoRouterMock = locator<AppRouter>();
      forgotPasswordBlocMock = ForgotPasswordBlocMock();

      when(() => forgotPasswordBlocMock.state)
          .thenReturn(ForgotPasswordState.initial());
    });

    tearDown(() {
      forgotPasswordBlocMock.close();
    });

    Widget getWidget() {
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
          routeName: ForgetPasswordConfirmationPageRoute.name,
          providers: [
            BlocProvider<ForgotPasswordBloc>(
              create: (context) => forgotPasswordBlocMock,
            ),
          ],
          child: const ForgetPasswordConfirmationPage(),
        ),
      );
    }

    testWidgets(' -> renders UI elements', (WidgetTester tester) async {
      await tester.pumpWidget(getWidget());

      expect(find.byType(Logo), findsOneWidget);
      expect(find.byType(ListView), findsOneWidget);
      expect(find.text('Email sent to you!'), findsOneWidget);
      expect(find.byType(SvgPicture), findsWidgets);
      expect(find.byType(BackToLogin), findsOneWidget);
    });

    testWidgets(' -> displays correct email address',
        (WidgetTester tester) async {
      when(() => forgotPasswordBlocMock.state).thenReturn(
        ForgotPasswordState.initial().copyWith(
          username: Username('fake.username'),
          resetPasswordResponse: ForgotPassword.empty().copyWith(
            email: 'fake.username@email.com',
            success: true,
          ),
        ),
      );
      await tester.pumpWidget(getWidget());

      expect(
        find.textContaining(
          'fake.username@email.com',
          findRichText: true,
        ),
        findsOneWidget,
      );
    });
  });
}

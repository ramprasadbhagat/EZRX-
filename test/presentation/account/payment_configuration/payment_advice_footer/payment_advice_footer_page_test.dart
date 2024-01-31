import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/payment_configuration/payment_advice_footer/manage_payment_advice_footer_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/manage_payment_advice_footer_response.dart';
import 'package:ezrxmobile/domain/account/entities/payment_advice_footer.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/payment_advice_footer_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/account/payment_configuration/payment_advice_footer/payment_advice_footer_page.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/widget_utils.dart';

class ManagePaymentAdviceFooterBlocMock extends MockBloc<
    ManagePaymentAdviceFooterEvent,
    ManagePaymentAdviceFooterState> implements ManagePaymentAdviceFooterBloc {}

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

void main() {
  late AppRouter autoRouterMock;
  late ManagePaymentAdviceFooterBloc managePaymentAdviceFooterBlocMock;
  late AnnouncementBloc announcementBlocMock;
  late AuthBloc authBlocMock;
  late UserBloc userBlocMock;
  late List<PaymentAdviceFooter> paymentAdvices;

  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    paymentAdvices =
        await PaymentAdviceFooterLocalDataSource().getPaymentAdvice();
    locator.registerLazySingleton(() => AppRouter());
    locator.registerLazySingleton(() => managePaymentAdviceFooterBlocMock);
    locator.registerLazySingleton(() => announcementBlocMock);
    locator.registerLazySingleton(() => authBlocMock);
    locator.registerLazySingleton(() => userBlocMock);
    managePaymentAdviceFooterBlocMock = ManagePaymentAdviceFooterBlocMock();
    announcementBlocMock = AnnouncementBlocMock();
    authBlocMock = AuthBlocMock();
    userBlocMock = UserBlocMock();
    autoRouterMock = locator<AppRouter>();
    when(() => managePaymentAdviceFooterBlocMock.state)
        .thenReturn(ManagePaymentAdviceFooterState.initial());
    when(() => announcementBlocMock.state)
        .thenReturn(AnnouncementState.initial());
    when(() => authBlocMock.state).thenReturn(const AuthState.initial());
    when(() => userBlocMock.state).thenReturn(UserState.initial());
  });

  Widget getScopedWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      providers: [
        BlocProvider<ManagePaymentAdviceFooterBloc>(
          create: (context) => managePaymentAdviceFooterBlocMock,
        ),
        BlocProvider<AnnouncementBloc>(
          create: (context) => announcementBlocMock,
        ),
        BlocProvider<AuthBloc>(
          create: (context) => authBlocMock,
        ),
        BlocProvider<UserBloc>(
          create: (context) => userBlocMock,
        ),
      ],
      child: const Scaffold(
        body: PaymentAdviceFooterPage(),
      ),
    );
  }

  group('Payment Advice Footer Page Test', () {
    testWidgets('On Tap FAB', (tester) async {
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      await tester.tap(find.byType(FloatingActionButton));
      verify(
        () => managePaymentAdviceFooterBlocMock.add(
          ManagePaymentAdviceFooterEvent.setPaymentAdvice(
            paymentAdviceFooterData: PaymentAdviceFooter.empty(),
          ),
        ),
      ).called(1);
    });

    testWidgets('Show Error Toast When Submit Failure', (tester) async {
      final expectStates = [
        ManagePaymentAdviceFooterState.initial().copyWith(isSubmitting: true),
        ManagePaymentAdviceFooterState.initial().copyWith(
          failureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('fake-error'),
            ),
          ),
        ),
      ];
      whenListen(
        managePaymentAdviceFooterBlocMock,
        Stream.fromIterable(expectStates),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      expect(find.byKey(WidgetKeys.customSnackBar), findsOneWidget);
    });

    testWidgets('Show Success Toast When Submit Success', (tester) async {
      final expectStates = [
        ManagePaymentAdviceFooterState.initial().copyWith(isSubmitting: true),
        ManagePaymentAdviceFooterState.initial().copyWith(
          response: ManagePaymentAdviceFooterResponse.empty().copyWith(
            message: PaymentAdviceResponseMessage('fake-message'),
          ),
        ),
      ];
      whenListen(
        managePaymentAdviceFooterBlocMock,
        Stream.fromIterable(expectStates),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pumpAndSettle();
      expect(
        find.descendant(
          of: find.byKey(WidgetKeys.customSnackBar),
          matching: find.text('fake-message'.tr()),
        ),
        findsOneWidget,
      );
    });

    testWidgets('Pull To Refresh', (tester) async {
      when(
        () => managePaymentAdviceFooterBlocMock.state,
      ).thenReturn(
        ManagePaymentAdviceFooterState.initial().copyWith(
          paymentAdviceFooters: paymentAdvices,
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();

      final scrollList = find.byKey(WidgetKeys.scrollList);
      await tester.drag(scrollList, const Offset(0, 1000));
      await tester.pumpAndSettle();
      verify(
        () => managePaymentAdviceFooterBlocMock.add(
          const ManagePaymentAdviceFooterEvent.fetch(),
        ),
      ).called(1);
    });

    testWidgets('Display Item', (tester) async {
      WidgetsFlutterBinding.ensureInitialized();

      when(
        () => managePaymentAdviceFooterBlocMock.state,
      ).thenReturn(
        ManagePaymentAdviceFooterState.initial().copyWith(
          paymentAdviceFooters: [
            paymentAdvices.first.copyWith(
              paymentAdviceLogo: PaymentAdviceLogo.empty(),
            )
          ],
        ),
      );
      await tester.pumpWidget(getScopedWidget());
      await tester.pump();
      final firstTile =
          find.byKey(WidgetKeys.paymentAdviceFooter(paymentAdvices.first.key));
      expect(
        firstTile,
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: firstTile,
          matching: find.textContaining('Header'.tr()),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: firstTile,
          matching: find.textContaining('Sales Org'.tr()),
        ),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: firstTile,
          matching: find.textContaining('Sales District'.tr()),
        ),
        findsOneWidget,
      );
    });
  });
}

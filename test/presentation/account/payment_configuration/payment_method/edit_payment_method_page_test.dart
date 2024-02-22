import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/payment_configuration/payment_methods/add_payment_method/add_payment_method_bloc.dart';
import 'package:ezrxmobile/application/account/payment_configuration/payment_methods/manage_payment_method/manage_payment_methods_bloc.dart';
import 'package:ezrxmobile/application/account/payment_configuration/payment_methods/payment_methods_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/account/payment_configuration/payment_methods/edit_payment_method_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/widget_utils.dart';

class AnnouncementBlocMock
    extends MockBloc<AnnouncementEvent, AnnouncementState>
    implements AnnouncementBloc {}

class AuthBlocMock extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class PaymentMethodBlocMock
    extends MockBloc<PaymentMethodsEvent, PaymentMethodsState>
    implements PaymentMethodsBloc {}

class ManagePaymentMethodsBlocMock
    extends MockBloc<ManagePaymentMethodsEvent, ManagePaymentMethodsState>
    implements ManagePaymentMethodsBloc {}

class AddPaymentMethodBlocMock
    extends MockBloc<AddPaymentMethodEvent, AddPaymentMethodState>
    implements AddPaymentMethodBloc {}

void main() {
  late PaymentMethodsBloc paymentMethodsMock;
  late AnnouncementBloc announcementBlocMock;
  late AuthBloc authBlocMock;
  late ManagePaymentMethodsBloc managePaymentMethodsBlocMock;
  late AddPaymentMethodBloc addPaymentMethodBlocMock;
  late AppRouter autoRouterMock;

  setUpAll(
    () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      paymentMethodsMock = PaymentMethodBlocMock();
      announcementBlocMock = AnnouncementBlocMock();
      authBlocMock = AuthBlocMock();
      managePaymentMethodsBlocMock = ManagePaymentMethodsBlocMock();
      addPaymentMethodBlocMock = AddPaymentMethodBlocMock();
      locator.registerLazySingleton(() => AppRouter());
      autoRouterMock = locator<AppRouter>();
      when(() => announcementBlocMock.state).thenReturn(
        AnnouncementState.initial(),
      );
      when(() => authBlocMock.state).thenReturn(
        const AuthState.initial(),
      );
      when(() => paymentMethodsMock.state).thenReturn(
        PaymentMethodsState.initial(),
      );
      when(() => managePaymentMethodsBlocMock.state).thenReturn(
        ManagePaymentMethodsState.initial(),
      );
      when(() => addPaymentMethodBlocMock.state).thenReturn(
        AddPaymentMethodState.initial(),
      );
    },
  );

  Widget getPaymentMethodListPage() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
      usingLocalization: true,
      providers: [
        BlocProvider<PaymentMethodsBloc>(
          create: (context) => paymentMethodsMock,
        ),
        BlocProvider<AnnouncementBloc>(
          create: (context) => announcementBlocMock,
        ),
        BlocProvider<AuthBloc>(
          create: (context) => authBlocMock,
        ),
        BlocProvider<ManagePaymentMethodsBloc>(
          create: (context) => managePaymentMethodsBlocMock,
        ),
        BlocProvider<AddPaymentMethodBloc>(
          create: (context) => addPaymentMethodBlocMock,
        ),
      ],
      child: EditPaymentMethodsPage(
        salesOrg: SalesOrg('2900'),
        oldPaymentMethod: PaymentMethod(
          'QR Code',
        ),
      ),
    );
  }

  group(
    'Test Edit Payment method  Page => ',
    () {
      testWidgets(
        'Load Edit payment page',
        (tester) async {
          await tester.pumpWidget(getPaymentMethodListPage());
          await tester.pump();
          final appBarTitle = find.text('Edit Payment Method');
          final scaffold = find.byKey(const Key('editPaymentMethod'));
          expect(appBarTitle, findsAtLeastNWidgets(2));
          expect(scaffold, findsOneWidget);
        },
      );

      testWidgets(
        'Load Edit payment page tap on edit button without new payment button',
        (tester) async {
          final expectedStates = [
            ManagePaymentMethodsState.initial(),
            ManagePaymentMethodsState.initial().copyWith(
              showErrorMessages: true,
            ),
          ];

          whenListen(
            managePaymentMethodsBlocMock,
            Stream.fromIterable(expectedStates),
          );
          await tester.pumpWidget(getPaymentMethodListPage());
          await tester.pump();
          final appBarTitle = find.text('Edit Payment Method');
          final scaffold = find.byKey(const Key('editPaymentMethod'));
          expect(appBarTitle, findsAtLeastNWidgets(2));
          expect(scaffold, findsOneWidget);
          final editPaymentMethodButton = find.byKey(
            const Key('editPaymentMethodButton'),
          );
          expect(editPaymentMethodButton, findsOneWidget);
          await tester.tap(editPaymentMethodButton);
          await tester.pump();
          final errorMsg =
              find.textContaining('New payment method cannot be empty.');
          expect(errorMsg, findsOneWidget);
        },
      );

      testWidgets(
        'Load Edit payment page tap on edit button orElse validation',
        (tester) async {
          when(() => managePaymentMethodsBlocMock.state).thenReturn(
            ManagePaymentMethodsState.initial().copyWith(
              showErrorMessages: true,
              paymentMethod: PaymentMethod('h'),
            ),
          );
          await tester.pumpWidget(getPaymentMethodListPage());
          await tester.pump();
          final appBarTitle = find.text('Edit Payment Method');
          final scaffold = find.byKey(const Key('editPaymentMethod'));
          expect(appBarTitle, findsAtLeastNWidgets(2));
          expect(scaffold, findsOneWidget);
          final textField = find.byKey(const Key('newPaymentMethodField'));
          expect(textField, findsOneWidget);
          await tester.enterText(textField, 'h');
          await tester.pump();
          verify(
            () => managePaymentMethodsBlocMock.add(
              const ManagePaymentMethodsEvent.newPaymentMethodChanged(
                paymentMethod: 'h',
              ),
            ),
          ).called(1);
          final editPaymentMethodButton = find.byKey(
            const Key('editPaymentMethodButton'),
          );
          expect(editPaymentMethodButton, findsOneWidget);
          await tester.tap(editPaymentMethodButton);
          await tester.pump();
          final errorMsg =
              find.textContaining('New payment method cannot be empty.');
          expect(errorMsg, findsNothing);
        },
      );

      testWidgets(
        'Load Edit payment and Submit with success',
        (tester) async {
          final expectedState = Stream.fromIterable(
            [
              ManagePaymentMethodsState.initial().copyWith(
                deleteIndex: 0,
                isSubmitting: true,
              ),
              ManagePaymentMethodsState.initial().copyWith(
                deleteIndex: -1,
                isSubmitting: false,
              ),
            ],
          );
          whenListen(managePaymentMethodsBlocMock, expectedState);
          await tester.pumpWidget(getPaymentMethodListPage());
          await tester.pump();
          final appBarTitle = find.text('Edit Payment Method');
          final scaffold = find.byKey(const Key('editPaymentMethod'));
          expect(appBarTitle, findsAtLeastNWidgets(2));
          expect(scaffold, findsOneWidget);

          verify(
            () => paymentMethodsMock.add(
              const PaymentMethodsEvent.fetch(),
            ),
          ).called(1);
        },
      );

      testWidgets(
        'Load Edit payment and Submit with failure',
        (tester) async {
          final expectedState = Stream.fromIterable(
            [
              ManagePaymentMethodsState.initial().copyWith(
                deleteIndex: 0,
                isSubmitting: true,
              ),
              ManagePaymentMethodsState.initial().copyWith(
                deleteIndex: -1,
                isSubmitting: false,
                failureOrSuccessOption: optionOf(
                  const Left(
                    ApiFailure.other('Fake-Error'),
                  ),
                ),
              ),
            ],
          );
          whenListen(managePaymentMethodsBlocMock, expectedState);
          await tester.pumpWidget(getPaymentMethodListPage());
          await tester.pump();
          final appBarTitle = find.text('Edit Payment Method');
          final scaffold = find.byKey(const Key('editPaymentMethod'));
          expect(appBarTitle, findsAtLeastNWidgets(2));
          expect(scaffold, findsOneWidget);
        },
      );
    },
  );
}

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/payment_configuration/payment_methods/add_payment_method/add_payment_method_bloc.dart';
import 'package:ezrxmobile/application/account/payment_configuration/payment_methods/manage_payment_method/manage_payment_methods_bloc.dart';
import 'package:ezrxmobile/application/account/payment_configuration/payment_methods/payment_methods_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/account/payment_configuration/payment_methods/add_payment_method_page.dart';
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

class UserBlocMock extends MockBloc<UserEvent, UserState> implements UserBloc {}

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
  late UserBloc userBlocMock;
  late ManagePaymentMethodsBloc managePaymentMethodsBlocMock;
  late AddPaymentMethodBloc addPaymentMethodBlocMock;
  late AppRouter autoRouterMock;

  setUpAll(
    () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      paymentMethodsMock = PaymentMethodBlocMock();
      announcementBlocMock = AnnouncementBlocMock();
      authBlocMock = AuthBlocMock();
      userBlocMock = UserBlocMock();
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
      when(() => userBlocMock.state).thenReturn(
        UserState.initial().copyWith(
          user: User.empty().copyWith(
            userSalesOrganisations: [
              SalesOrganisation.empty().copyWith(
                salesOrg: SalesOrg('2900'),
              ),
            ],
          ),
        ),
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

  Widget getAddPaymentMethodPage() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: autoRouterMock,
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
        BlocProvider<UserBloc>(
          create: (context) => userBlocMock,
        ),
      ],
      child: const AddPaymentMethodsPage(),
    );
  }

  group(
    'Test Add Payment method  Page => ',
    () {
      testWidgets(
        'Load Add payment page',
        (tester) async {
          await tester.pumpWidget(getAddPaymentMethodPage());
          await tester.pump();
          final appBarTitle = find.text('Add Payment Method');
          final scaffold = find.byKey(const Key('addPaymentMethod'));
          expect(appBarTitle, findsAtLeastNWidgets(2));
          expect(scaffold, findsOneWidget);
        },
      );

      testWidgets(
        'Load Add payment page tap on Add button without new payment and sales Org',
        (tester) async {
          final expectedStates = [
            AddPaymentMethodState.initial(),
            AddPaymentMethodState.initial().copyWith(
              showErrorMessages: true,
            ),
          ];

          whenListen(
              addPaymentMethodBlocMock, Stream.fromIterable(expectedStates));
          await tester.pumpWidget(getAddPaymentMethodPage());
          await tester.pump();
          final appBarTitle = find.text('Add Payment Method');
          final scaffold = find.byKey(const Key('addPaymentMethod'));
          expect(appBarTitle, findsAtLeastNWidgets(2));
          expect(scaffold, findsOneWidget);
          final editPaymentMethodButton = find.byKey(
            const Key('addPaymentMethodButton'),
          );
          expect(editPaymentMethodButton, findsOneWidget);
          await tester.tap(editPaymentMethodButton);
          await tester.pump();
          final errorMsg1 = find.textContaining('Please Select Sales Org.');
          expect(errorMsg1, findsOneWidget);
          final errorMsg2 =
              find.textContaining('Payment method cannot be empty.');
          expect(errorMsg2, findsOneWidget);
        },
      );

      testWidgets(
        'Load Add payment page tap on edit button orElse validation',
        (tester) async {
          when(() => addPaymentMethodBlocMock.state).thenReturn(
            AddPaymentMethodState.initial().copyWith(
              showErrorMessages: true,
              paymentMethod: PaymentMethod('h'),
              salesOrg: SalesOrg('2900'),
            ),
          );
          await tester.pumpWidget(getAddPaymentMethodPage());
          await tester.pump();
          final appBarTitle = find.text('Add Payment Method');
          final scaffold = find.byKey(const Key('addPaymentMethod'));
          expect(appBarTitle, findsAtLeastNWidgets(2));
          expect(scaffold, findsOneWidget);
          final textField = find.byKey(const Key('newPaymentMethodField'));
          expect(textField, findsOneWidget);
          final dropDownField = find.byKey(const Key('salesOrgDropdownKey'));
          expect(dropDownField, findsOneWidget);
          await tester.enterText(textField, 'h');
          await tester.pump();
          await tester.tap(dropDownField, warnIfMissed: false);
          await tester.pump(const Duration(seconds: 1));
          await tester.tap(find.text('2900 - ZPTH').last, warnIfMissed: false);
          await tester.pump(const Duration(seconds: 1));
          verify(
            () => addPaymentMethodBlocMock.add(
              const AddPaymentMethodEvent.paymentMethodChanged(
                paymentMethod: 'h',
              ),
            ),
          ).called(1);
          verify(
            () => addPaymentMethodBlocMock.add(
              const AddPaymentMethodEvent.salesOrgChanged(
                salesOrg: '2900',
              ),
            ),
          ).called(1);
          final addPaymentMethodButton = find.byKey(
            const Key('addPaymentMethodButton'),
          );
          expect(addPaymentMethodButton, findsOneWidget);
          await tester.tap(addPaymentMethodButton);
          await tester.pump();
          final errorMsg1 =
              find.textContaining('Payment method cannot be empty.');
          expect(errorMsg1, findsNothing);
          final errorMsg2 = find.textContaining('Please Select Sales Org.');
          expect(errorMsg2, findsNothing);
        },
      );

      testWidgets(
        'Load Add payment and Submit with success',
        (tester) async {
          final expectedState = Stream.fromIterable(
            [
              AddPaymentMethodState.initial().copyWith(
                isSubmitting: true,
              ),
              AddPaymentMethodState.initial().copyWith(
                isSubmitting: false,
              ),
            ],
          );
          whenListen(addPaymentMethodBlocMock, expectedState);
          await tester.pumpWidget(getAddPaymentMethodPage());
          await tester.pump();
          final appBarTitle = find.text('Add Payment Method');
          final scaffold = find.byKey(const Key('addPaymentMethod'));
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
        'Load Add payment and State change',
        (tester) async {
          final expectedState = Stream.fromIterable(
            [
              ManagePaymentMethodsState.initial().copyWith(
                isSubmitting: true,
              ),
              ManagePaymentMethodsState.initial().copyWith(
                isSubmitting: false,
              ),
            ],
          );
          whenListen(managePaymentMethodsBlocMock, expectedState);
          await tester.pumpWidget(getAddPaymentMethodPage());
          await tester.pump();
          final appBarTitle = find.text('Add Payment Method');
          final scaffold = find.byKey(const Key('addPaymentMethod'));
          expect(appBarTitle, findsAtLeastNWidgets(2));
          expect(scaffold, findsOneWidget);
        },
      );

      testWidgets(
        'Load Add payment and Submit with failure',
        (tester) async {
          final expectedState = Stream.fromIterable(
            [
              AddPaymentMethodState.initial().copyWith(
                isSubmitting: true,
              ),
              AddPaymentMethodState.initial().copyWith(
                isSubmitting: false,
                failureOrSuccessOption: optionOf(
                  const Left(
                    ApiFailure.other('Fake-Error'),
                  ),
                ),
              ),
            ],
          );
          whenListen(addPaymentMethodBlocMock, expectedState);
          await tester.pumpWidget(getAddPaymentMethodPage());
          await tester.pump();
          final appBarTitle = find.text('Add Payment Method');
          final scaffold = find.byKey(const Key('addPaymentMethod'));
          expect(appBarTitle, findsAtLeastNWidgets(2));
          expect(scaffold, findsOneWidget);
        },
      );
    },
  );
}

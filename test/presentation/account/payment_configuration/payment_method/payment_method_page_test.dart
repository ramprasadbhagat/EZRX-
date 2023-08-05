import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/payment_configuration/payment_methods/add_payment_method/add_payment_method_bloc.dart';
import 'package:ezrxmobile/application/account/payment_configuration/payment_methods/manage_payment_method/manage_payment_methods_bloc.dart';
import 'package:ezrxmobile/application/account/payment_configuration/payment_methods/payment_methods_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/available_payment_method.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/payment_methods_local.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/account/payment_configuration/payment_methods/payment_methods_page.dart';
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
  late List<AvailablePaymentMethod> paymentMethodList;
  late AppRouter autoRouterMock;

  setUpAll(
    () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      paymentMethodsMock = PaymentMethodBlocMock();
      announcementBlocMock = AnnouncementBlocMock();
      authBlocMock = AuthBlocMock();
      managePaymentMethodsBlocMock = ManagePaymentMethodsBlocMock();
      addPaymentMethodBlocMock = AddPaymentMethodBlocMock();
      paymentMethodList =
          await PaymentMethodsLocalDataSource().getAvailablePaymentMethods();
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
      child: const PaymentMethodsPage(),
    );
  }

  group(
    'Test Payment method List Page => ',
    () {
      testWidgets(
        'Load Payment Methods with no data',
        (tester) async {
          await tester.pumpWidget(getPaymentMethodListPage());
          await tester.pump();
          final appBarTitle = find.text('Payment Methods Management');
          final noDataError = find.text('No payment method found');
          expect(appBarTitle, findsOneWidget);
          expect(noDataError, findsOneWidget);
        },
      );

      testWidgets(
        'Load Payment Methods with data loading',
        (tester) async {
          when(() => paymentMethodsMock.state).thenReturn(
            PaymentMethodsState.initial().copyWith(
              isFetching: true,
            ),
          );
          await tester.pumpWidget(getPaymentMethodListPage());
          await tester.pump();
          final appBarTitle = find.text('Payment Methods Management');
          final loaderImage = find.byKey(const Key('loaderImage'));
          expect(appBarTitle, findsOneWidget);
          expect(loaderImage, findsOneWidget);
        },
      );

      testWidgets(
        'Load Payment Methods with data',
        (tester) async {
          when(() => paymentMethodsMock.state).thenReturn(
            PaymentMethodsState.initial().copyWith(
              paymentMethodList: paymentMethodList,
            ),
          );
          await tester.pumpWidget(getPaymentMethodListPage());
          await tester.pump();
          final appBarTitle = find.text('Payment Methods Management');
          final noDataError = find.text('No payment method found');
          expect(appBarTitle, findsOneWidget);
          expect(noDataError, findsNothing);
        },
      );

      testWidgets(
        'Load Payment Methods with initially loading and then data shown',
        (tester) async {
          final expectedState = Stream.fromIterable(
            [
              PaymentMethodsState.initial().copyWith(isFetching: true),
              PaymentMethodsState.initial().copyWith(
                isFetching: false,
                paymentMethodList: paymentMethodList,
              ),
            ],
          );
          whenListen(paymentMethodsMock, expectedState);
          await tester.pumpWidget(getPaymentMethodListPage());
          await tester.pump();
          final appBarTitle = find.text('Payment Methods Management');
          final noDataError = find.text('No payment method found');
          expect(appBarTitle, findsOneWidget);
          expect(noDataError, findsNothing);
        },
      );

      testWidgets(
        'Load Payment Methods with data loaded then onRefresh',
        (tester) async {
          when(() => paymentMethodsMock.state).thenReturn(
            PaymentMethodsState.initial().copyWith(
              paymentMethodList: paymentMethodList,
            ),
          );
          final handle = tester.ensureSemantics();
          await tester.pumpWidget(getPaymentMethodListPage());
          await tester.pump();
          final appBarTitle = find.text('Payment Methods Management');
          final noDataError = find.text('No payment method found');
          expect(appBarTitle, findsOneWidget);
          expect(noDataError, findsNothing);

          await tester.drag(
            find.text('Payment Gateway').first,
            const Offset(0.0, 1000.0),
          );
          await tester.pump(const Duration(seconds: 1));

          expect(
            tester.getSemantics(find.byType(RefreshProgressIndicator)),
            matchesSemantics(
              label: 'Refresh',
            ),
          );

          await tester
              .pump(const Duration(seconds: 1)); // finish the scroll animation
          await tester.pump(
            const Duration(
              seconds: 1,
            ),
          ); // finish the indicator settle animation
          await tester.pump(const Duration(seconds: 1));
          verify(
            () => paymentMethodsMock.add(
              const PaymentMethodsEvent.fetch(),
            ),
          ).called(1);
          handle.dispose();
        },
      );

      testWidgets(
        'Load Payment Methods and scroll the list',
        (tester) async {
          when(() => paymentMethodsMock.state).thenReturn(
            PaymentMethodsState.initial().copyWith(
              paymentMethodList: paymentMethodList,
            ),
          );
          await tester.pumpWidget(getPaymentMethodListPage());
          await tester.pump();
          final appBarTitle = find.text('Payment Methods Management');
          final noDataError = find.text('No payment method found');
          expect(appBarTitle, findsOneWidget);
          expect(noDataError, findsNothing);
          await tester.drag(
            find.text('Payment Gateway').first,
            const Offset(0.0, -1000.0),
          );
          await tester.pump(const Duration(seconds: 1));
          final lastPaymentMethod = find.text('test');
          expect(lastPaymentMethod, findsOneWidget);
        },
      );

      testWidgets(
        'Load Payment Methods and delete by icon',
        (tester) async {
          when(() => paymentMethodsMock.state).thenReturn(
            PaymentMethodsState.initial().copyWith(
              paymentMethodList: paymentMethodList,
            ),
          );
          await tester.pumpWidget(getPaymentMethodListPage());
          await tester.pump();
          final appBarTitle = find.text('Payment Methods Management');
          final noDataError = find.text('No payment method found');
          expect(appBarTitle, findsOneWidget);
          expect(noDataError, findsNothing);
          final item = find.byKey(const Key('paymentMethod0'));
          expect(item, findsOneWidget);
          final deleteIcon = find.byKey(const Key('deleteIcon0'));
          expect(deleteIcon, findsOneWidget);
          await tester.tap(deleteIcon);
          await tester.pump();
          final deleteDialog = find.byKey(
            const ValueKey('confirmDialog'),
          );
          expect(deleteDialog, findsOneWidget);
          final deleteButton = find.byKey(const Key('Delete'));
          expect(deleteButton, findsOneWidget);
          await tester.tap(deleteButton);
          await tester.pump();
          verify(
            () => managePaymentMethodsBlocMock.add(
              ManagePaymentMethodsEvent.deletePaymentMethod(
                salesOrg: SalesOrg('2900'),
                paymentMethod: PaymentMethod('Payment Gateway'),
                deleteIndex: 0,
              ),
            ),
          ).called(1);
        },
      );

      testWidgets(
        'Load Payment Methods add button clicked',
        (tester) async {
          when(() => paymentMethodsMock.state).thenReturn(
            PaymentMethodsState.initial().copyWith(
              paymentMethodList: paymentMethodList,
            ),
          );
          await tester.pumpWidget(getPaymentMethodListPage());
          await tester.pump();
          final appBarTitle = find.text('Payment Methods Management');
          final noDataError = find.text('No payment method found');
          expect(appBarTitle, findsOneWidget);
          expect(noDataError, findsNothing);
          final addPaymentMethodKey =
              find.byKey(const Key('addPaymentMethodKey'));
          expect(addPaymentMethodKey, findsOneWidget);
          await tester.tap(addPaymentMethodKey);
          await tester.pump();
          verify(
            () => addPaymentMethodBlocMock.add(
              const AddPaymentMethodEvent.initialized(),
            ),
          ).called(1);

          expect(
            autoRouterMock.current.name == 'AddPaymentMethodsPageRoute',
            true,
          );
        },
      );

      testWidgets(
        'Load Payment Methods add tap tile',
        (tester) async {
          when(() => paymentMethodsMock.state).thenReturn(
            PaymentMethodsState.initial().copyWith(
              paymentMethodList: paymentMethodList,
            ),
          );
          await tester.pumpWidget(getPaymentMethodListPage());
          await tester.pump();
          final appBarTitle = find.text('Payment Methods Management');
          final noDataError = find.text('No payment method found');
          expect(appBarTitle, findsOneWidget);
          expect(noDataError, findsNothing);
          final paymentMethodTileKey = find.byKey(const Key('paymentMethod0'));
          expect(paymentMethodTileKey, findsOneWidget);
          await tester.tap(paymentMethodTileKey);
          await tester.pump();

          expect(
            autoRouterMock.current.name == 'EditPaymentMethodsPageRoute',
            true,
          );
        },
      );

      testWidgets(
        'Load Payment Methods Refresh through listener',
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
          when(() => paymentMethodsMock.state).thenReturn(
            PaymentMethodsState.initial().copyWith(
              paymentMethodList: [paymentMethodList.first],
            ),
          );
          await tester.pumpWidget(getPaymentMethodListPage());
          await tester.pumpAndSettle(const Duration(seconds: 3));
          final appBarTitle = find.text('Payment Methods Management');
          final noDataError = find.text('No payment method found');
          expect(appBarTitle, findsOneWidget);
          expect(noDataError, findsNothing);
          verify(
            () => paymentMethodsMock.add(
              const PaymentMethodsEvent.fetch(),
            ),
          ).called(1);
        },
      );

      testWidgets(
        'Load Payment Methods delete shimmer',
        (tester) async {
          final expectedState = Stream.fromIterable(
            [
              ManagePaymentMethodsState.initial().copyWith(
                deleteIndex: -1,
              ),
              ManagePaymentMethodsState.initial().copyWith(
                deleteIndex: 0,
              ),
            ],
          );
          whenListen(managePaymentMethodsBlocMock, expectedState);
          when(() => paymentMethodsMock.state).thenReturn(
            PaymentMethodsState.initial().copyWith(
              paymentMethodList: [paymentMethodList.first],
            ),
          );
          await tester.pumpWidget(getPaymentMethodListPage());
          await tester.pump();
          final appBarTitle = find.text('Payment Methods Management');
          final noDataError = find.text('No payment method found');
          expect(appBarTitle, findsOneWidget);
          expect(noDataError, findsNothing);
          final saleOrgShimmerKey = find.byKey(
            const Key('salesorg-loading'),
          );
          expect(saleOrgShimmerKey, findsOneWidget);
          final paymentMethodShimmerKey = find.byKey(
            const Key('paymentmethod-loading'),
          );
          expect(paymentMethodShimmerKey, findsOneWidget);
        },
      );

      testWidgets(
        'Load Payment Methods and delete by sliding',
        (tester) async {
          when(() => paymentMethodsMock.state).thenReturn(
            PaymentMethodsState.initial().copyWith(
              paymentMethodList: paymentMethodList,
            ),
          );
          await tester.pumpWidget(getPaymentMethodListPage());
          await tester.pump();
          final appBarTitle = find.text('Payment Methods Management');
          final noDataError = find.text('No payment method found');
          expect(appBarTitle, findsOneWidget);
          expect(noDataError, findsNothing);
          final item = find.byKey(const Key('paymentMethod0'));
          expect(item, findsOneWidget);

          await tester.drag(
            find.byKey(const Key('paymentMethod0')),
            const Offset(-300, 0.0),
          );
          await tester.pump();
          final deleteIcon = find.byIcon(Icons.delete_outline);
          expect(deleteIcon, findsOneWidget);
          await tester.tap(deleteIcon);
          await tester.pump();
          verify(
            () => managePaymentMethodsBlocMock.add(
              ManagePaymentMethodsEvent.deletePaymentMethod(
                salesOrg: SalesOrg('2900'),
                paymentMethod: PaymentMethod('Payment Gateway'),
                deleteIndex: 0,
              ),
            ),
          ).called(1);
        },
      );

      testWidgets(
        'Load Payment Methods list change',
        (tester) async {
          final expectedState = Stream.fromIterable(
            [
              PaymentMethodsState.initial().copyWith(
                paymentMethodList: [],
              ),
              PaymentMethodsState.initial().copyWith(
                paymentMethodList: [paymentMethodList.first],
              ),
            ],
          );
          whenListen(paymentMethodsMock, expectedState);
          await tester.pumpWidget(getPaymentMethodListPage());
          await tester.pump();
          final appBarTitle = find.text('Payment Methods Management');
          final noDataError = find.text('No payment method found');
          expect(appBarTitle, findsOneWidget);
          expect(noDataError, findsNothing);
        },
      );
    },
  );
}

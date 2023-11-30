import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_request/return_list_by_request_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_request/view_by_request_filter/view_by_request_return_filter_bloc.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/return_list/return_filter/return_by_request_filter_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/widget_utils.dart';

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class ReturnListByRequestBlocMock
    extends MockBloc<ReturnListByRequestEvent, ReturnListByRequestState>
    implements ReturnListByRequestBloc {}

class ViewByRequestReturnFilterBlocMock extends MockBloc<
    ViewByRequestReturnFilterEvent,
    ViewByRequestReturnFilterState> implements ViewByRequestReturnFilterBloc {}

void main() {
  late ReturnListByRequestBloc returnListByRequestBloc;
  late EligibilityBloc eligibilityBloc;
  late ViewByRequestReturnFilterBloc viewByRequestReturnFilterBloc;
  late AppRouter appRouter;
  final locator = GetIt.instance;
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerLazySingleton(() => AppRouter());
    returnListByRequestBloc = ReturnListByRequestBlocMock();
    eligibilityBloc = EligibilityBlocMock();
    viewByRequestReturnFilterBloc = ViewByRequestReturnFilterBlocMock();
    appRouter = locator<AppRouter>();
    when(() => eligibilityBloc.state).thenReturn(
      EligibilityState.initial(),
    );
    when(() => returnListByRequestBloc.state).thenReturn(
      ReturnListByRequestState.initial(),
    );
    when(() => viewByRequestReturnFilterBloc.state).thenReturn(
      ViewByRequestReturnFilterState.initial(),
    );
  });
  Widget getWidgetToTest() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: appRouter,
      usingLocalization: true,
      providers: [
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBloc,
        ),
        BlocProvider<ReturnListByRequestBloc>(
          create: (context) => returnListByRequestBloc,
        ),
        BlocProvider<ViewByRequestReturnFilterBloc>(
          create: (context) => viewByRequestReturnFilterBloc,
        ),
      ],
      child: const Scaffold(body: ReturnByRequestFilterPage()),
    );
  }

  group('Test Return By Request Filter Page', () {
    testWidgets(
        'Amount text input field should allow input only up to 2 decimal places',
        (tester) async {
      await tester.pumpWidget(getWidgetToTest());
      await tester.pump();
      final amountFromTextField = find.byKey(WidgetKeys.amountValueFrom);
      final amountToTextField = find.byKey(WidgetKeys.amountValueTo);
      expect(amountFromTextField, findsOneWidget);
      expect(amountToTextField, findsOneWidget);
      await tester.enterText(amountFromTextField, '100.9999');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.enterText(amountToTextField, '100.1234');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();
      expect(
        find.text('100.99'),
        findsOneWidget,
      );
      expect(
        find.text('100.12'),
        findsOneWidget,
      );
    });
  });
}

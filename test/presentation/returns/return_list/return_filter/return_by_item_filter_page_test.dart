import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_item/return_list_by_item_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_item/view_by_item_filter/view_by_item_return_filter_bloc.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/return_list/return_filter/return_by_item_filter_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/widget_utils.dart';

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class ReturnListByItemBlocMock
    extends MockBloc<ReturnListByItemEvent, ReturnListByItemState>
    implements ReturnListByItemBloc {}

class ViewByItemReturnFilterBlocMock
    extends MockBloc<ViewByItemReturnFilterEvent, ViewByItemReturnFilterState>
    implements ViewByItemReturnFilterBloc {}

void main() {
  late ReturnListByItemBloc returnListByItemBloc;
  late EligibilityBloc eligibilityBloc;
  late ViewByItemReturnFilterBloc viewByItemReturnFilterBloc;
  late AppRouter appRouter;
  final locator = GetIt.instance;
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerLazySingleton(() => AppRouter());
    returnListByItemBloc = ReturnListByItemBlocMock();
    eligibilityBloc = EligibilityBlocMock();
    viewByItemReturnFilterBloc = ViewByItemReturnFilterBlocMock();
    appRouter = locator<AppRouter>();
    when(() => eligibilityBloc.state).thenReturn(
      EligibilityState.initial(),
    );
    when(() => returnListByItemBloc.state).thenReturn(
      ReturnListByItemState.initial(),
    );
    when(() => viewByItemReturnFilterBloc.state).thenReturn(
      ViewByItemReturnFilterState.initial(),
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
        BlocProvider<ReturnListByItemBloc>(
          create: (context) => returnListByItemBloc,
        ),
        BlocProvider<ViewByItemReturnFilterBloc>(
          create: (context) => viewByItemReturnFilterBloc,
        ),
      ],
      child: const Scaffold(body: ReturnByItemFilterPage()),
    );
  }

  group('Test ReturnByItemFilterPage', () {
    testWidgets('Amount text input should allow only 2 digit', (tester) async {
      await tester.pumpWidget(getWidgetToTest());
      await tester.pump();
      final amountTextField = find.byKey(WidgetKeys.amountValueFrom);
      expect(amountTextField, findsOneWidget);
      await tester.enterText(amountTextField, '100.9999');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();
      expect(
        find.text('100.99'),
        findsOneWidget,
      );
    });
  });
}

import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/new_request_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/return_items/return_items_bloc.dart';
import 'package:ezrxmobile/application/returns/usage_code/usage_code_bloc.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_items_filter.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/returns/return_list/widgets/new_request_button.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/widget_utils.dart';

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class UsageCodeBlocMock extends MockBloc<UsageCodeEvent, UsageCodeState>
    implements UsageCodeBloc {}

class ReturnItemsBlocMock extends MockBloc<ReturnItemsEvent, ReturnItemsState>
    implements ReturnItemsBloc {}

class NewRequestBlocMock extends MockBloc<NewRequestEvent, NewRequestState>
    implements NewRequestBloc {}

class MixpanelServiceMock extends Mock implements MixpanelService {}

class AppRouterMock extends Mock implements AppRouter {}

void main() {
  late ScrollController scrollController;
  late AppRouter appRouter;
  late EligibilityBloc eligibilityBloc;
  late UsageCodeBloc usageCodeBloc;
  late ReturnItemsBloc returnItemsBloc;
  late NewRequestBloc newRequestBloc;

  setUpAll(() {
    locator.registerLazySingleton(() => AppRouterMock());
    locator.registerLazySingleton<MixpanelService>(() => MixpanelServiceMock());
    appRouter = locator<AppRouterMock>();
    scrollController = ScrollController();
    eligibilityBloc = EligibilityBlocMock();
    usageCodeBloc = UsageCodeBlocMock();
    returnItemsBloc = ReturnItemsBlocMock();
    newRequestBloc = NewRequestBlocMock();
    when(() => eligibilityBloc.state).thenReturn(
      EligibilityState.initial(),
    );
    when(() => usageCodeBloc.state).thenReturn(
      UsageCodeState.initial(),
    );
    when(() => returnItemsBloc.state).thenReturn(
      ReturnItemsState.initial(),
    );
    when(() => newRequestBloc.state).thenReturn(
      NewRequestState.initial(),
    );
  });

  Widget getWidget() {
    return WidgetUtils.getScopedWidget(
      autoRouterMock: appRouter,
      usingLocalization: true,
      providers: [
        BlocProvider<EligibilityBloc>(
          create: (context) => eligibilityBloc,
        ),
        BlocProvider<UsageCodeBloc>(
          create: (context) => usageCodeBloc,
        ),
        BlocProvider<ReturnItemsBloc>(
          create: (context) => returnItemsBloc,
        ),
        BlocProvider<NewRequestBloc>(
          create: (context) => newRequestBloc,
        ),
      ],
      child: Scaffold(
        body: NewRequestButton(
          controller: scrollController,
        ),
      ),
    );
  }

  testWidgets('New Request Button Test', (tester) async {
    when(() => appRouter.pushNamed('returns/new_request'))
        .thenAnswer((_) => Future.value());
    await tester.pumpWidget(getWidget());
    await tester.pump();
    final iconButton = find.byIcon(Icons.add);
    expect(iconButton, findsOneWidget);
    expect(find.text('New request'.tr()), findsOneWidget);
    await tester.tap(iconButton);
    verify(
      () => trackMixpanelEvent(
        TrackingEvents.newReturnRequestClicked,
        props: {
          TrackingProps.clickAt: ' Page',
        },
      ),
    ).called(1);
    verify(
      () => usageCodeBloc.add(
        UsageCodeEvent.fetch(
          salesOrg: SalesOrg(''),
        ),
      ),
    ).called(1);
    verify(
      () => returnItemsBloc.add(
        ReturnItemsEvent.fetch(
          appliedFilter: ReturnItemsFilter.init(),
          searchKey: SearchKey.searchFilter(''),
        ),
      ),
    ).called(1);
    verify(
      () => newRequestBloc.add(
        NewRequestEvent.initialized(
          salesOrg: SalesOrg(''),
        ),
      ),
    ).called(1);
    verify(
      () => appRouter.pushNamed('returns/new_request'),
    ).called(1);
  });
}

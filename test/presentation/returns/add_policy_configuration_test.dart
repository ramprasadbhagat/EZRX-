import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/returns/policy_configuration/policy_configuration_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/presentation/returns/policy_configuration/add_policy_configuration.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/widget_utils.dart';

class MockPolicyConfigurationListBloc
    extends MockBloc<PolicyConfigurationEvent, PolicyConfigurationState>
    implements PolicyConfigurationBloc {}

class MOckEligibilityBloc extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

void main() {
  late PolicyConfigurationBloc policyConfigurationListBlocMock;
  late EligibilityBloc eligibilityBlocMock;
  late AppRouter autoRouterMock;
  final locator = GetIt.instance;

  setUpAll(() async {
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
    locator.registerLazySingleton(() => AppRouter());
    locator
        .registerLazySingleton(() => CountlyService(config: locator<Config>()));
    autoRouterMock = locator<AppRouter>();
  });

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    policyConfigurationListBlocMock = MockPolicyConfigurationListBloc();
    eligibilityBlocMock = MOckEligibilityBloc();
    when(() => policyConfigurationListBlocMock.state)
        .thenReturn(PolicyConfigurationState.initial());
    when(() => eligibilityBlocMock.state)
        .thenReturn(EligibilityState.initial());
  });

  Future getWidget(tester) async {
    return tester.pumpWidget(
      WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<PolicyConfigurationBloc>(
            create: (context) => policyConfigurationListBlocMock,
          ),
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBlocMock,
          ),
        ],
        child: const AddPolicyConfiguration(),
      ),
    );
  }

  group('Add Policy Configuration Test', () {
    testWidgets('=> Test Add Policy Configuration screen', (tester) async {
      when(() => eligibilityBlocMock.state)
          .thenReturn(EligibilityState.initial().copyWith(
        salesOrganisation: SalesOrganisation.empty().copyWith(
          salesOrg: SalesOrg('2601'),
        ),
      ));

      when(() => policyConfigurationListBlocMock.state).thenReturn(
        PolicyConfigurationState.initial().copyWith(
          returnsAllowed: ReturnsAllowed(false),
        ),
      );

      final expectedState = [
        PolicyConfigurationState.initial().copyWith(
          returnsAllowed: ReturnsAllowed(true),
        ),
      ];

      whenListen(
          policyConfigurationListBlocMock, Stream.fromIterable(expectedState));

      await getWidget(tester);

      expect(find.text('Add Policy Configuration'), findsOneWidget);

      final findSwitchButton = find.byKey(const Key('flutterSwitch'));
      expect(findSwitchButton, findsOneWidget);
      await tester.tap(findSwitchButton);
      await tester.pump();

      final findSalesPrincipalCode = find.ancestor(
          of: find.text('Please assign a valid sales principal code'.tr()),
          matching: find.byType(TextFormField));
      expect(findSalesPrincipalCode, findsOneWidget);
      await tester.enterText(findSalesPrincipalCode, 'test');
      await tester.pump();
      await tester.enterText(findSalesPrincipalCode, '');
      await tester.pump();
      await tester.enterText(findSalesPrincipalCode, 'test');
      await tester.pump();

      final findMonthsBeforeExpiry = find.ancestor(
          of: find.text('Months Before Expiry'.tr()),
          matching: find.byType(TextFormField));
      expect(findMonthsBeforeExpiry, findsOneWidget);
      await tester.enterText(findMonthsBeforeExpiry, '123');
      await tester.pump();

      final findMonthsAfterExpiry = find.ancestor(
          of: find.text('Months After Expiry'.tr()),
          matching: find.byType(TextFormField));
      expect(findMonthsAfterExpiry, findsOneWidget);
      await tester.enterText(findMonthsAfterExpiry, '123');
      await tester.pump();

      final findSubmitButton = find.ancestor(
          of: find.text('Submit'.tr()), matching: find.byType(ElevatedButton));
      expect(findSubmitButton, findsOneWidget);
      await tester.tap(findSubmitButton);
      await tester.pump();
    });
  });
}

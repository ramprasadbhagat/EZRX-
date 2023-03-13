import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/returns/policy_configuration/policy_configuration_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/policy_configuration.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/policy_configuration_local.dart';
import 'package:ezrxmobile/presentation/returns/policy_configuration/policy_configuration.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

import 'package:mocktail/mocktail.dart';

import '../../utils/widget_utils.dart';
import '../order_history/order_history_details_widget_test.dart';

class MockPolicyConfigurationListBloc
    extends MockBloc<PolicyConfigurationEvent, PolicyConfigurationState>
    implements PolicyConfigurationBloc {}

class MockSalesOrgBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

void main() {
  late PolicyConfigurationBloc policyConfigurationListBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late AppRouter autoRouterMock;
  var policyConfigurationListMock = <PolicyConfiguration>[];
  final locator = GetIt.instance;

  setUpAll(() async {
    locator.registerLazySingleton(() => MixpanelService());
    locator<MixpanelService>().init(mixpanel: MixpanelMock());
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
    locator.registerLazySingleton(() => AppRouter());
    locator
        .registerLazySingleton(() => CountlyService(config: locator<Config>()));
    policyConfigurationListMock =
        await PolicyConfigurationLocalDataSource().getPolicyConfiguration();
    autoRouterMock = locator<AppRouter>();
  });

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    policyConfigurationListBlocMock = MockPolicyConfigurationListBloc();
    salesOrgBlocMock = MockSalesOrgBloc();
    when(() => policyConfigurationListBlocMock.state)
        .thenReturn(PolicyConfigurationState.initial());

    when(() => salesOrgBlocMock.state).thenReturn(SalesOrgState.initial());
  });

  Future getWidget(tester) async {
    return tester.pumpWidget(
      WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        providers: [
          BlocProvider<PolicyConfigurationBloc>(
            create: (context) => policyConfigurationListBlocMock,
          ),
          BlocProvider<SalesOrgBloc>(
            create: (context) => salesOrgBlocMock,
          ),
        ],
        child: const PolicyConfigurationPage(),
      ),
    );
  }

  group('Policy Configuration List Screen', () {
    testWidgets('=> Test when refresh page', (tester) async {
      await getWidget(tester);
      expect(find.text('No Policy Configurations found'), findsOneWidget);
      expect(find.byType(PolicyConfigurationListItem), findsNothing);
      await tester.fling(
          find.byType(CustomScrollView), const Offset(0, 300), 600);
      await tester.pumpAndSettle(const Duration(seconds: 2));
      verify(
        () => policyConfigurationListBlocMock.add(
          PolicyConfigurationEvent.fetch(
            salesOrganisation: salesOrgBlocMock.state.salesOrganisation,
            searchKey: '',
          ),
        ),
      ).called(1);
    });

    testWidgets('=> Test while state is fetching', (tester) async {
      when(() => policyConfigurationListBlocMock.state).thenReturn(
        PolicyConfigurationState.initial().copyWith(
          isLoading: false,
        ),
      );
      final expectedState = [
        PolicyConfigurationState.initial().copyWith(
          isLoading: true,
        ),
      ];
      whenListen(
          policyConfigurationListBlocMock, Stream.fromIterable(expectedState));
      await getWidget(tester);
      await tester.pump(const Duration(milliseconds: 100));
      final loaderImage = find.byKey(const Key('LoaderImage'));
      final policyConfigurationListItem =
          find.byType(PolicyConfigurationListItem);

      expect(loaderImage, findsOneWidget);
      expect(policyConfigurationListItem, findsNothing);
    });

    testWidgets('=> Test when policy configuration is fetched', (tester) async {
      when(() => policyConfigurationListBlocMock.state)
          .thenReturn(PolicyConfigurationState.initial().copyWith(
        isLoading: true,
      ));
      final expectedState = [
        PolicyConfigurationState.initial().copyWith(
          isLoading: false,
          policyConfigurationList: policyConfigurationListMock,
          failureOrSuccessOption: optionOf(const Right('success')),
        )
      ];
      whenListen(
          policyConfigurationListBlocMock, Stream.fromIterable(expectedState));
      await getWidget(tester);
      await tester.pump(const Duration(milliseconds: 100));
      final orderTemplateItem = find.byType(PolicyConfigurationListItem);
      expect(orderTemplateItem, findsAtLeastNWidgets(1));
      final findFloatingActionButton = find.byType(FloatingActionButton);
      expect(findFloatingActionButton, findsOneWidget);
      await tester.tap(findFloatingActionButton);
      final findListTile = find
          .ancestor(of: find.byType(Column), matching: find.byType(ListTile))
          .first;
      expect(findListTile, findsOneWidget);
      await tester.tap(findListTile);
      await tester.drag(
          find.byKey(const Key('slidable')).first, const Offset(-300, 0.0));
      await tester.pump();
      final removeWidget = tester.widget(find.byIcon(Icons.delete_outline));
      await tester.tap(find.byWidget(removeWidget));
      await tester.pump();
    });

    testWidgets('Test fetch fail', (tester) async {
      when(() => policyConfigurationListBlocMock.state).thenReturn(
        PolicyConfigurationState.initial().copyWith(
          isLoading: false,
          failureOrSuccessOption: none(),
        ),
      );
      whenListen(
          policyConfigurationListBlocMock,
          Stream.fromIterable([
            PolicyConfigurationState.initial().copyWith(
              isLoading: false,
              failureOrSuccessOption: optionOf(
                const Left(
                  ApiFailure.other('fake-error'),
                ),
              ),
            ),
          ]));
      await tester.runAsync(() async {
        await getWidget(tester);
      });
      final noPolicyConfiguration = find.text('No Policy Configurations found');
      final policyConfigurationListItem =
          find.byType(PolicyConfigurationListItem);
      expect(noPolicyConfiguration, findsOneWidget);
      expect(policyConfigurationListItem, findsNothing);
      await tester.pump();
      final errorMessage = find.byKey(const Key('snackBarMessage'));
      expect(errorMessage, findsOneWidget);
    });
  });
}

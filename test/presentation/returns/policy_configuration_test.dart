import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/returns/policy_configuration/policy_configuration_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/policy_configuration.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/returns/datasource/policy_configuration_local.dart';
import 'package:ezrxmobile/presentation/returns/policy_configuration.dart';
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

class MockSalesOrgBloc extends MockBloc<SalesOrgEvent, SalesOrgState>
    implements SalesOrgBloc {}

void main() {
  late PolicyConfigurationBloc policyConfigurationListBlocMock;
  late SalesOrgBloc salesOrgBlocMock;
  late AppRouter autoRouterMock;
  var policyConfigurationListMock = <PolicyConfiguration>[];
  final locator = GetIt.instance;

  setUpAll(() async {
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
      expect(find.text('Policy Configuration'), findsOneWidget);
      expect(find.text('No Policy Configurations found'), findsOneWidget);
      expect(find.byType(PolicyConfigurationListItem), findsNothing);
      await tester.fling(
          find.byType(CustomScrollView), const Offset(0, 300), 600);
      await tester.pumpAndSettle(const Duration(seconds: 2));
      verify(
        () => policyConfigurationListBlocMock.add(
          PolicyConfigurationEvent.fetch(
              salesOrganisation: salesOrgBlocMock.state.salesOrganisation),
        ),
      ).called(1);
    });

    testWidgets('=> Test while state is fetching', (tester) async {
      when(() => policyConfigurationListBlocMock.state).thenReturn(
        PolicyConfigurationState.initial().copyWith(
          isLoading: true,
        ),
      );
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
        isLoading: false,
        policyConfigurationList: policyConfigurationListMock,
      ));

      await getWidget(tester);
      await tester.pump(const Duration(milliseconds: 100));
      final orderTemplateItem = find.byType(PolicyConfigurationListItem);
      expect(orderTemplateItem, findsAtLeastNWidgets(1));
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

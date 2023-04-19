import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';

import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/orders/core/account_suspended_warning.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

void main() {
  late EligibilityBloc eligibilityBlocMock;
  late AppRouter autoRouterMock;
  setUpAll(
    () {
      locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
      locator.registerLazySingleton(() => AppRouter());
    },
  );
  setUp(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      eligibilityBlocMock = EligibilityBlocMock();
      autoRouterMock = locator<AppRouter>();
      when(() => eligibilityBlocMock.state).thenReturn(
        EligibilityState.initial(),
      );
    },
  );
  group(
    'AccountSuspendedBanner Widget',
    () {
      Widget getWidget() {
        return WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          providers: [
            BlocProvider<EligibilityBloc>(
              create: (context) => eligibilityBlocMock,
            ),
          ],
          child: const AccountSuspendedBanner(),
        );
      }

      testWidgets(
        'Customer code account suspended',
        (tester) async {
          final expectedStates = [
            EligibilityState.initial(),
            EligibilityState.initial().copyWith(
              customerCodeInfo: CustomerCodeInfo.empty().copyWith(
                status: Status('Z1'),
              ),
            ),
          ];

          whenListen(eligibilityBlocMock, Stream.fromIterable(expectedStates));
          await tester.pumpWidget(getWidget());
          await tester.pump();
          final accountSuspendedText = find.textContaining(
            'Customer is suspended, please contact ZP Admin for support'.tr(),
          );
          expect(accountSuspendedText, findsOneWidget);
        },
      );

      testWidgets(
        'Ship to code account suspended',
        (tester) async {
          when(() => eligibilityBlocMock.state).thenReturn(
            EligibilityState.initial().copyWith(
              shipToInfo: ShipToInfo.empty().copyWith(
                status: Status('Z1'),
              ),
            ),
          );
          await tester.pumpWidget(getWidget());
          await tester.pump();
          final accountSuspendedText = find.textContaining(
            'Customer is suspended, please contact ZP Admin for support'.tr(),
          );
          expect(accountSuspendedText, findsOneWidget);
        },
      );
    },
  );
}

import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/order/payment_customer_information/payment_customer_information_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/orders/core/order_license_info.dart';
import 'package:ezrxmobile/presentation/orders/core/order_ship_to_info.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';

class ShipToCodeBlocMock extends MockBloc<ShipToCodeEvent, ShipToCodeState>
    implements ShipToCodeBloc {}

class CountlyServiceMock extends Mock implements CountlyService {}

class MockPaymentCustomerInformationBloc extends MockBloc<
        PaymentCustomerInformationEvent, PaymentCustomerInformationState>
    implements PaymentCustomerInformationBloc {}

void main() {
  late AppRouter autoRouterMock;
  late CountlyService countlyService;
  late ShipToCodeBloc shipToCodeBlocMock;
  late PaymentCustomerInformationBloc paymentCustomerInformationBloc;

  setUpAll(
    () {
      locator.registerSingleton<Config>(Config()..appFlavor = Flavor.uat);
      locator.registerLazySingleton(() => AppRouter());
      countlyService = CountlyServiceMock();
      locator.registerLazySingleton(() => countlyService);
    },
  );
  setUp(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      paymentCustomerInformationBloc = MockPaymentCustomerInformationBloc();
      shipToCodeBlocMock = ShipToCodeBlocMock();

      autoRouterMock = locator<AppRouter>();

      when(() => shipToCodeBlocMock.state)
          .thenReturn(ShipToCodeState.initial());
      when(() => paymentCustomerInformationBloc.state)
          .thenReturn(PaymentCustomerInformationState.initial());
    },
  );
  group(
    'order ship to info Widget',
    () {
      Widget getWidget() {
        return WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          providers: [
            BlocProvider<ShipToCodeBloc>(
                create: (context) => shipToCodeBlocMock),
            BlocProvider<PaymentCustomerInformationBloc>(
                create: (context) => paymentCustomerInformationBloc),
          ],
          child: const ShipToAddressInfo(),
        );
      }

      testWidgets(
        'order ship to info licence check',
        (tester) async {
          when(
            () => countlyService
                .addCountlyEvent('view_license_info', segmentation: {
              'NumLicenseAttached': 0,
              'LicenseType': 'NA',
            }),
          ).thenAnswer((invocation) async => Future.value());
          await tester.pumpWidget(getWidget());
          await tester.pump();
          final shipToAddressInfoStepperKey =
              find.byKey(const Key('shipToAddressInfoStepperKey'));
          expect(shipToAddressInfoStepperKey, findsOneWidget);

          final shipToAddressInfoLicense =
              find.byKey(const Key('shipToAddressInfo_license'));
          expect(shipToAddressInfoLicense, findsOneWidget);
          await tester.tap(shipToAddressInfoLicense);
          verify(
            () => countlyService
                .addCountlyEvent('view_license_info', segmentation: {
              'NumLicenseAttached': 0,
              'LicenseType': 'NA',
            }),
          ).called(1);
          await tester.pump();
          final licenseModel = find.byType(LicenseModel);
          expect(licenseModel, findsOneWidget);
        },
      );
    },
  );
}

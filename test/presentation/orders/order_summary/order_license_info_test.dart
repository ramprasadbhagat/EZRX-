import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/payment_customer_information/payment_customer_information_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/license_info.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/orders/core/order_license_info.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/widget_utils.dart';

class MockPaymentCustomerInformationBloc extends MockBloc<
        PaymentCustomerInformationEvent, PaymentCustomerInformationState>
    implements PaymentCustomerInformationBloc {}

void main() {
  late PaymentCustomerInformationBloc paymentCustomerInformationBloc;
  late AppRouter autoRouterMock;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    locator.registerLazySingleton(() => AppRouter());
  });

  setUp(() {
    paymentCustomerInformationBloc = MockPaymentCustomerInformationBloc();
    autoRouterMock = locator<AppRouter>();
    when(() => paymentCustomerInformationBloc.state)
        .thenReturn(PaymentCustomerInformationState.initial());
  });

  group('Order License Info Widget Tests', () {
    Widget getTestWidget() {
      return WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          providers: [
            BlocProvider<PaymentCustomerInformationBloc>(
                create: (context) => paymentCustomerInformationBloc),
          ],
          child: const LicenseModel());
    }

    testWidgets('Order License Info Widget Test With Data',
        (widgetTester) async {
      final expectedStates = [
        PaymentCustomerInformationState.initial().copyWith(
          licenses: [
            const LicenseInfo(
                licenceType: 'R03',
                licenseDescription: 'ZP Customer Regulation',
                licenseNumber: '0000028321',
                validFrom: 'April 5,2013',
                validTo: 'Septempber 27,2014'),
            const LicenseInfo(
                licenceType: 'S3',
                licenseDescription: 'ZP Controlled Items',
                licenseNumber: '0000026025',
                validFrom: 'March 5,2011',
                validTo: 'March 23,2014'),
            const LicenseInfo(
                licenceType: 'S3',
                licenseDescription: 'ZP Controlled Items',
                licenseNumber: '0000035106',
                validFrom: 'january 1,2013',
                validTo: 'January 1,2017'),
          ],
        ),
      ];

      whenListen(
          paymentCustomerInformationBloc, Stream.fromIterable(expectedStates));

      await widgetTester.pumpWidget(getTestWidget());
      await widgetTester.pumpAndSettle();
      final appBarText = find.text('Licenses'.tr());
      expect(appBarText, findsOneWidget);

      final licenseNoText = find.text('License Number'.tr());
      final licenseTypeText = find.text('License Type'.tr());
      final licenseDescText = find.text('License Description'.tr());
      final licenseValidFromText = find.text('Valid From'.tr());
      final licenseValidToText = find.text('Valid To'.tr());

      expect(licenseNoText, findsNWidgets(3));
      expect(licenseTypeText, findsNWidgets(3));
      expect(licenseDescText, findsNWidgets(3));
      expect(licenseValidFromText, findsNWidgets(3));
      expect(licenseValidToText, findsNWidgets(3));
    });

    testWidgets('Order License Info Widget Tests Without Data',
        (widgetTester) async {
      final expectedStates = [
        PaymentCustomerInformationState.initial().copyWith(
          licenses: [],
        ),
      ];

      whenListen(
          paymentCustomerInformationBloc, Stream.fromIterable(expectedStates));

      await widgetTester.pumpWidget(getTestWidget());
      await widgetTester.pumpAndSettle();
      final appBarText = find.text('Licenses'.tr());
      final noDataText = find.text('No data found'.tr());
      expect(appBarText, findsOneWidget);
      expect(noDataText, findsOneWidget);
    });
  });
}

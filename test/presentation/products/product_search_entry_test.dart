import 'package:bloc_test/bloc_test.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/scan_material_info/scan_material_info_bloc.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/products/product_search_entry.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/widget_utils.dart';

class EligibilityBlocMock extends MockBloc<EligibilityEvent, EligibilityState>
    implements EligibilityBloc {}

class ScanMaterialInfoBlocMock
    extends MockBloc<ScanMaterialInfoEvent, ScanMaterialInfoState>
    implements ScanMaterialInfoBloc {}

class MixpanelServiceMock extends Mock implements MixpanelService {}

void main() {
  late ScanMaterialInfoBlocMock scanMaterialInfoBlocMock;
  late EligibilityBlocMock eligibilityBlocMock;
  late AppRouter autoRouterMock;

  setUpAll(() async {
    locator.registerFactory(() => AppRouter());
    autoRouterMock = locator<AppRouter>();
    locator.registerLazySingleton<MixpanelService>(
      () => MixpanelServiceMock(),
    );
  });

  group('Test "Product Search Entry Test"', () {
    setUp(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      locator = GetIt.instance;
      scanMaterialInfoBlocMock = ScanMaterialInfoBlocMock();
      eligibilityBlocMock = EligibilityBlocMock();
      when(() => scanMaterialInfoBlocMock.state)
          .thenReturn(ScanMaterialInfoState.initial());
      when(() => eligibilityBlocMock.state)
          .thenReturn(EligibilityState.initial());
    });

    Widget getScopedWidget() {
      return WidgetUtils.getScopedWidget(
        autoRouterMock: autoRouterMock,
        usingLocalization: true,
        providers: [
          BlocProvider<ScanMaterialInfoBloc>(
            create: (context) => scanMaterialInfoBlocMock,
          ),
          BlocProvider<EligibilityBloc>(
            create: (context) => eligibilityBlocMock,
          ),
        ],
        child: const Material(
          child: ProductSearchEntry(),
        ),
      );
    }

    testWidgets(
      '=> Test widget display',
      (tester) async {
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        final textFieldFinder = find.byType(TextFormField);
        expect(textFieldFinder, findsOneWidget);
        expect(
          find.byIcon(
            Icons.search,
          ),
          findsOneWidget,
        );
        final findSuffixIcon = find.byKey(
          WidgetKeys.productScanCameraKey,
        );
        expect(
          findSuffixIcon,
          findsOneWidget,
        );
        expect(
          find.text('Search by product name or code'.tr()),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      '=> Test on tap text field',
      (tester) async {
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        final textFieldFinder = find.byType(TextFormField);
        await tester.tap(textFieldFinder);
        await tester.pumpAndSettle();
        expect(autoRouterMock.current.path, 'product_suggestion_page');
      },
    );

    testWidgets(
      '=> Test tap on search button',
      (tester) async {
        await tester.pumpWidget(getScopedWidget());
        await tester.pumpAndSettle();
        final findSuffixIcon = find.byKey(
          WidgetKeys.productScanCameraKey,
        );
        await tester.tap(findSuffixIcon);
        await tester.pumpAndSettle();
        expect(autoRouterMock.current.path, 'orders/scan_material_info');
        verify(
          () => scanMaterialInfoBlocMock.add(
            const ScanMaterialInfoEvent.scanMaterialNumberFromCamera(),
          ),
        ).called(1);
      },
    );
  });
}

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/home/selector/customer_code_selector.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/widget_utils.dart';
import '../../order_history/order_history_details_widget_test.dart';

class CustomerCodeBlocMock
    extends MockBloc<CustomerCodeEvent, CustomerCodeState>
    implements CustomerCodeBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  late CustomerCodeBlocMock mockCustomerCodeBloc;

  setUpAll(() async {
    locator.registerLazySingleton(() => MixpanelService());
    locator<MixpanelService>().init(mixpanel: MixpanelMock());
    locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);
    locator.registerLazySingleton(() => AppRouter());
  });
  final fakeCustomerInfo = CustomerCodeInfo.empty()
      .copyWith(customerCodeSoldTo: '00001234', shipToInfos: [
    ShipToInfo.empty().copyWith(
      shipToCustomerCode: '00001234',
    )
  ]);

  final fakeCustomerInfo2 = CustomerCodeInfo.empty()
      .copyWith(customerCodeSoldTo: '00001235', shipToInfos: [
    ShipToInfo.empty().copyWith(
      shipToCustomerCode: '00001235',
    )
  ]);

  group('Customer Code Selector Test ', () {
    setUp(() {
      mockCustomerCodeBloc = CustomerCodeBlocMock();

      when(() => mockCustomerCodeBloc.state).thenReturn(
          CustomerCodeState.initial()
              .copyWith(customerCodeList: [fakeCustomerInfo]));
    });

    Future getWidget(tester) async {
      return await tester.pumpWidget(
        WidgetUtils.getScopedWidget(
          autoRouterMock: locator<AppRouter>(),
          child: MultiBlocProvider(
            providers: [
              BlocProvider<CustomerCodeBloc>(
                  create: (context) => mockCustomerCodeBloc),
            ],
            child: const Material(
              child: Scaffold(
                body: CustomerCodeSelector(),
              ),
            ),
          ),
        ),
      );
    }

    testWidgets('When customerCodeInfo is empty', (tester) async {
      when(() => mockCustomerCodeBloc.state).thenReturn(
          CustomerCodeState.initial().copyWith(
              isFetching: false, customerCodeList: [CustomerCodeInfo.empty()]));
      await getWidget(tester);
      final selectedCustomerCodeText = find.text('NA');
      expect(selectedCustomerCodeText, findsNWidgets(2));
    });

    testWidgets('When customerCodeInfo is not empty', (tester) async {
      when(() => mockCustomerCodeBloc.state)
          .thenReturn(CustomerCodeState.initial().copyWith(
        isFetching: false,
        customerCodeInfo: fakeCustomerInfo,
        shipToInfo: fakeCustomerInfo.shipToInfos.first,
      ));

      await getWidget(tester);
      final selectedCustomerCodeText =
          find.text(fakeCustomerInfo.shipToInfos.first.shipToCustomerCode);
      expect(selectedCustomerCodeText, findsOneWidget);
    });

    testWidgets('When customerCodeInfo is getting fetched', (tester) async {
      when(() => mockCustomerCodeBloc.state)
          .thenReturn(CustomerCodeState.initial());
      await getWidget(tester);
      final shimmer = find.byType(Shimmer);
      expect(shimmer, findsNWidgets(2));
    });

    testWidgets('When there is an error', (tester) async {
      final expectedCustomerCodeListStates = [
        CustomerCodeState.initial(),
        CustomerCodeState.initial().copyWith(
          isFetching: false,
          customerCodeInfo: fakeCustomerInfo,
          shipToInfo: fakeCustomerInfo.shipToInfos.first,
          customerCodeList: [
            CustomerCodeInfo.empty(),
          ],
          apiFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('authentication failed'),
            ),
          ),
        ),
      ];
      whenListen(mockCustomerCodeBloc,
          Stream.fromIterable(expectedCustomerCodeListStates));

      await getWidget(tester);
      final selectedCustomerCodeText = find.text('00001234');
      expect(selectedCustomerCodeText, findsNothing);
    });

    testWidgets('When customerCodeInfo got changed', (tester) async {
      final expectedCustomerCodeListStates = [
        CustomerCodeState.initial(),
        CustomerCodeState.initial().copyWith(
            isFetching: false,
            customerCodeInfo: fakeCustomerInfo2,
            customerCodeList: [
              fakeCustomerInfo2,
            ],
            shipToInfo: fakeCustomerInfo2.shipToInfos.first,
            apiFailureOrSuccessOption: optionOf(const Right(null))),
      ];
      whenListen(mockCustomerCodeBloc,
          Stream.fromIterable(expectedCustomerCodeListStates));

      await getWidget(tester);

      await tester.pumpAndSettle(const Duration(seconds: 3));

      final selectedCustomerCodeText1 = find.text('00001235');
      expect(selectedCustomerCodeText1, findsOneWidget);
    });

    testWidgets('When customerCodeInfo got changed from Previous error State',
        (tester) async {
      final expectedCustomerCodeListStates = [
        CustomerCodeState.initial().copyWith(
          apiFailureOrSuccessOption: optionOf(
            const Left(
              ApiFailure.other('authentication failed'),
            ),
          ),
        ),
        CustomerCodeState.initial().copyWith(
            isFetching: false,
            customerCodeInfo: fakeCustomerInfo2,
            customerCodeList: [
              CustomerCodeInfo.empty(),
            ],
            shipToInfo: fakeCustomerInfo2.shipToInfos.first,
            apiFailureOrSuccessOption: none()),
      ];
      whenListen(mockCustomerCodeBloc,
          Stream.fromIterable(expectedCustomerCodeListStates));

      await getWidget(tester);

      await tester.pumpAndSettle(const Duration(seconds: 3));

      final selectedCustomerCodeText1 = find.text('00001235');
      expect(selectedCustomerCodeText1, findsOneWidget);
      await tester.pump();
      final customerCodeSelect =
          find.byKey(const ValueKey('customerCodeSelect'));
      await tester.ensureVisible(customerCodeSelect.first);
      await tester.pumpAndSettle();
      await tester.tap(customerCodeSelect.first);
      expect(
        locator<AppRouter>().current.route.name,
        CustomerSearchPageRoute.name,
      );
    });
  });
}

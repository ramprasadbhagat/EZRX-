import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_bloc.dart';
import 'package:ezrxmobile/presentation/orders/create_order/quantity_input.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ezrxmobile/locator.dart';

import '../../../utils/widget_utils.dart';

class TenderContractMockBloc
    extends MockBloc<TenderContractEvent, TenderContractState>
    implements TenderContractBloc {}

class MockFunctionHolder extends Mock implements FunctionHolder {}

class FunctionHolder {
  void onFieldChange(int value) {}
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late TenderContractBloc tenderContractMockBloc;
  late AppRouter autoRouterMock;
  setUpAll(() async {
    locator.registerLazySingleton(() => AppRouter());
    autoRouterMock = locator<AppRouter>();
  });
  setUp(
    () {
      tenderContractMockBloc = TenderContractMockBloc();
      when(() => tenderContractMockBloc.state)
          .thenReturn(TenderContractState.initial());
    },
  );
  group(
    'Quantity Input Widget',
    () {
      Widget getTestWidget({
        required Function(int) onFieldChanged,
        bool returnZeroOnFieldEmpty = false,
      }) {
        return WidgetUtils.getScopedWidget(
          autoRouterMock: autoRouterMock,
          usingLocalization: true,
          providers: [
            BlocProvider<TenderContractBloc>(
              create: (context) => tenderContractMockBloc,
            ),
          ],
          child: Scaffold(
            body: QuantityInput(
              minusPressed: (_) {},
              addPressed: (_) {},
              controller: TextEditingController(),
              onFieldChange: onFieldChanged,
              quantityTextKey: const Key('text'),
              quantityAddKey: const Key('Add'),
              quantityDeleteKey: const Key('Delete'),
              isEnabled: true,
              returnZeroOnFieldEmpty: returnZeroOnFieldEmpty,
            ),
          ),
        );
      }

      testWidgets('default onFieldChange', (tester) async {
        final functionHolder = MockFunctionHolder();
        await tester.pumpWidget(
          getTestWidget(onFieldChanged: functionHolder.onFieldChange),
        );
        await tester.pump();

        await tester.enterText(find.byType(TextFormField), '12');
        verify(() => functionHolder.onFieldChange(12)).called(1);
        await tester.enterText(find.byType(TextFormField), '');
        verifyNever(() => functionHolder.onFieldChange(0));
      });

      testWidgets('onFieldChange when returnZeroOnFieldEmpty is true',
          (tester) async {
        final functionHolder = MockFunctionHolder();
        await tester.pumpWidget(
          getTestWidget(
            onFieldChanged: functionHolder.onFieldChange,
            returnZeroOnFieldEmpty: true,
          ),
        );
        await tester.pump();

        await tester.enterText(find.byType(TextFormField), '12');
        verify(() => functionHolder.onFieldChange(12)).called(1);
        await tester.enterText(find.byType(TextFormField), '');
        verify(() => functionHolder.onFieldChange(0)).called(1);
      });
    },
  );
}

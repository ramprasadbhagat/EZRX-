import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_bloc.dart';
import 'package:ezrxmobile/presentation/orders/create_order/quantity_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

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
        return BlocProvider<TenderContractBloc>(
          create: (context) => tenderContractMockBloc,
          child: MaterialApp(
            home: Scaffold(
              body: QuantityInput(
                minusPressed: (_) {},
                addPressed: (_) {},
                controller: TextEditingController(),
                quantityTextKey: const Key('text'),
                onFieldChange: onFieldChanged,
                quantityAddKey: const Key('Add'),
                quantityDeleteKey: const Key('Delete'),
                isEnabled: true,
                returnZeroOnFieldEmpty: returnZeroOnFieldEmpty,
              ),
            ),
          ),
        );
      }

      testWidgets('default onFieldChange', (tester) async {
        final functionHolder = MockFunctionHolder();
        await tester.pumpWidget(
          getTestWidget(onFieldChanged: functionHolder.onFieldChange),
        );

        await tester.enterText(find.byType(TextField), '12');
        verify(() => functionHolder.onFieldChange(12)).called(1);
        await tester.enterText(find.byType(TextField), '');
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

        await tester.enterText(find.byType(TextField), '12');
        verify(() => functionHolder.onFieldChange(12)).called(1);
        await tester.enterText(find.byType(TextField), '');
        verify(() => functionHolder.onFieldChange(0)).called(1);
      });
    },
  );
}

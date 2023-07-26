import 'package:bloc_test/bloc_test.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CustomerOpenItem customerOpenItem;

  setUpAll(() {
    customerOpenItem = CustomerOpenItem.empty().copyWith(
      amountInTransactionCurrency: 100,
    );
  });

  group(
    'New Payment Bloc Invoices ',
    () {
      blocTest(
        'Initialize',
        build: () => NewPaymentBloc(),
        act: (NewPaymentBloc bloc) =>
            bloc.add(const NewPaymentEvent.initialized()),
        expect: () => [NewPaymentState.initial()],
      );

      blocTest(
        'UpdateAllInvoices',
        build: () => NewPaymentBloc(),
        act: (NewPaymentBloc bloc) => bloc.add(
          NewPaymentEvent.updateAllInvoices(
            items: [
              CustomerOpenItem.empty(),
            ],
          ),
        ),
        expect: () => [
          NewPaymentState.initial().copyWith(
            selectedInvoices: [CustomerOpenItem.empty()],
          )
        ],
      );

      blocTest(
        'ToggleInvoice selected => deselect',
        build: () => NewPaymentBloc(),
        seed: () => NewPaymentState.initial().copyWith(
          selectedInvoices: [CustomerOpenItem.empty()],
        ),
        act: (NewPaymentBloc bloc) => bloc.add(
          NewPaymentEvent.toggleInvoice(
            item: CustomerOpenItem.empty(),
            selected: false,
          ),
        ),
        expect: () => [NewPaymentState.initial()],
      );

      blocTest(
        'ToggleInvoice deselect => select',
        build: () => NewPaymentBloc(),
        act: (NewPaymentBloc bloc) => bloc.add(
          NewPaymentEvent.toggleInvoice(
            item: CustomerOpenItem.empty(),
            selected: true,
          ),
        ),
        expect: () => [
          NewPaymentState.initial().copyWith(
            selectedInvoices: [CustomerOpenItem.empty()],
          )
        ],
      );
    },
  );

  group(
    'New Payment Bloc Credits',
    () {
      blocTest(
        'UpdateAllCredits',
        build: () => NewPaymentBloc(),
        act: (NewPaymentBloc bloc) => bloc.add(
          NewPaymentEvent.updateAllCredits(
            items: [
              CustomerOpenItem.empty(),
            ],
          ),
        ),
        expect: () => [
          NewPaymentState.initial().copyWith(
            selectedCredits: [CustomerOpenItem.empty()],
          )
        ],
      );

      blocTest(
        'ToggleCredit selected => deselect',
        build: () => NewPaymentBloc(),
        seed: () => NewPaymentState.initial().copyWith(
          selectedCredits: [CustomerOpenItem.empty()],
        ),
        act: (NewPaymentBloc bloc) => bloc.add(
          NewPaymentEvent.toggleCredit(
            item: CustomerOpenItem.empty(),
            selected: false,
          ),
        ),
        expect: () => [NewPaymentState.initial()],
      );

      blocTest(
        'ToggleCredit deselect => select',
        build: () => NewPaymentBloc(),
        seed: () => NewPaymentState.initial().copyWith(
          selectedInvoices: [
            customerOpenItem,
          ],
        ),
        act: (NewPaymentBloc bloc) => bloc.add(
          NewPaymentEvent.toggleCredit(
            item: customerOpenItem,
            selected: true,
          ),
        ),
        expect: () => [
          NewPaymentState.initial().copyWith(
            selectedInvoices: [
              customerOpenItem,
            ],
            selectedCredits: [
              customerOpenItem,
            ],
          ),
        ],
        verify: (NewPaymentBloc bloc) {
          expect(
            bloc.state.amountTotal,
            customerOpenItem.amountInTransactionCurrency * 2,
          );
        },
      );
    },
  );
}

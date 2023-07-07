import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_payment_event.dart';
part 'new_payment_state.dart';
part 'new_payment_bloc.freezed.dart';

class NewPaymentBloc extends Bloc<NewPaymentEvent, NewPaymentState> {
  NewPaymentBloc() : super(NewPaymentState.initial()) {
    on(_onEvent);
  }

  Future<void> _onEvent(
    NewPaymentEvent event,
    Emitter<NewPaymentState> emit,
  ) async {
    await event.map(
      initialized: (_) async => emit(NewPaymentState.initial()),
      updateAllInvoices: (_SelectAllInvoices e) async {
          emit(
            state.copyWith(
              selectedInvoices: e.items,
            ),
          );
      },
      toggleInvoice: (_ToggleInvoice e) async {
        if(e.selected) {
          emit(
            state.copyWith(
              selectedInvoices: List<CustomerOpenItem>.from(state.selectedInvoices)..add(e.item),
            ),
          );
        } else {
          emit(
            state.copyWith(
              selectedInvoices: List<CustomerOpenItem>.from(state.selectedInvoices)..remove(e.item),
            ),
          );
        }
      },
      updateAllCredits: (_SelectAllCredits e) async {
          emit(
            state.copyWith(
              selectedCredits: e.items,
            ),
          );
      },
      toggleCredit: (_ToggleCredit e) async {
        if(e.selected) {
          emit(
            state.copyWith(
              selectedCredits: List<CustomerOpenItem>.from(state.selectedCredits)..add(e.item),
            ),
          );
        } else {
          emit(
            state.copyWith(
              selectedCredits: List<CustomerOpenItem>.from(state.selectedCredits)..remove(e.item),
            ),
          );
        }
      },
    );
  }
}

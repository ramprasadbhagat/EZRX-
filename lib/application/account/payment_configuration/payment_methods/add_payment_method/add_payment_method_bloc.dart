import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/repository/i_payment_methods_repository.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_payment_method_event.dart';
part 'add_payment_method_state.dart';
part 'add_payment_method_bloc.freezed.dart';

class AddPaymentMethodBloc
    extends Bloc<AddPaymentMethodEvent, AddPaymentMethodState> {
  final IPaymentMethodsRepository paymentMethodsRepository;

  AddPaymentMethodBloc({required this.paymentMethodsRepository})
      : super(AddPaymentMethodState.initial()) {
    on<AddPaymentMethodEvent>(_onEvent);
  }

  Future<void> _onEvent(
    AddPaymentMethodEvent event,
    Emitter<AddPaymentMethodState> emit,
  ) async {
    await event.map(
      initialized: (_) async => emit(AddPaymentMethodState.initial()),
      addPaymentMethod: (e) async {
        emit(
          state.copyWith(
            showErrorMessages: false,
          ),
        );
        final isPaymentMethodValid = state.paymentMethod.isValid();
        final isSalesOrgValid = state.salesOrg.isValid();
        if (isPaymentMethodValid && isSalesOrgValid) {
          emit(
            state.copyWith(
              isSubmitting: true,
              failureOrSuccessOption: none(),
            ),
          );
          final failureOrSuccess =
              await paymentMethodsRepository.updatePaymentMethods(
            salesOrg: state.salesOrg,
            newPaymentMethod: state.paymentMethod,
            oldPaymentMethod: PaymentMethod(''),
          );
          failureOrSuccess.fold(
            (failure) {
              emit(
                state.copyWith(
                  isSubmitting: false,
                  failureOrSuccessOption: optionOf(failureOrSuccess),
                ),
              );
            },
            (addPaymentMethod) {
              emit(
                state.copyWith(
                  paymentMethod: PaymentMethod(''),
                  salesOrg: SalesOrg(''),
                  isSubmitting: false,
                ),
              );
            },
          );
        } else {
          emit(
            state.copyWith(showErrorMessages: true),
          );
        }
      },
      paymentMethodChanged: (e) {
        emit(
          state.copyWith(
            paymentMethod: PaymentMethod(e.paymentMethod),
            failureOrSuccessOption: none(),
          ),
        );
      },
      salesOrgChanged: (e) {
        emit(
          state.copyWith(
            salesOrg: SalesOrg(e.salesOrg),
            failureOrSuccessOption: none(),
          ),
        );
      },
    );
  }
}

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/available_payment_method.dart';
import 'package:ezrxmobile/domain/account/repository/i_payment_methods_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_methods_event.dart';
part 'payment_methods_state.dart';
part 'payment_methods_bloc.freezed.dart';

class PaymentMethodsBloc
    extends Bloc<PaymentMethodsEvent, PaymentMethodsState> {
  final IPaymentMethodsRepository paymentMethodsRepository;

  PaymentMethodsBloc({required this.paymentMethodsRepository})
      : super(PaymentMethodsState.initial()) {
    on<PaymentMethodsEvent>(_onEvent);
  }

  Future<void> _onEvent(
    PaymentMethodsEvent event,
    Emitter<PaymentMethodsState> emit,
  ) async {
    await event.map(
      initialized: (_) async => emit(PaymentMethodsState.initial()),
      fetch: (e) async {
        emit(
          state.copyWith(
            isFetching: true,
            failureOrSuccessOption: none(),
          ),
        );

        final failureOrSuccess =
            await paymentMethodsRepository.getAvailablePaymentMethods();

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
          (availablePaymentMethod) {
            emit(
              state.copyWith(
                paymentMethodList: availablePaymentMethod,
                failureOrSuccessOption: none(),
                isFetching: false,
              ),
            );
          },
        );
      },
    );
  }
}

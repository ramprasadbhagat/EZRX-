import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/account/entities/payment_advice_footer.dart';
import 'package:ezrxmobile/domain/account/repository/i_payment_advice_footer_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_advice_footer_event.dart';
part 'payment_advice_footer_state.dart';
part 'payment_advice_footer_bloc.freezed.dart';

class PaymentAdviceFooterBloc
    extends Bloc<PaymentAdviceFooterEvent, PaymentAdviceFooterState> {
  final IPaymentAdviceFooterRepository paymentAdviceFooterRepository;
  PaymentAdviceFooterBloc({
    required this.paymentAdviceFooterRepository,
  }) : super(PaymentAdviceFooterState.initial()) {
    on<PaymentAdviceFooterEvent>(_onEvent);
  }

  FutureOr<void> _onEvent(PaymentAdviceFooterEvent event,
    Emitter<PaymentAdviceFooterState> emit,
  ) async {
    await event.map(
      initialized: (_) async => emit(PaymentAdviceFooterState.initial()),
      fetch: (_Fetch e) async {
        emit(
          state.copyWith(
            paymentAdviceFooters: <PaymentAdviceFooter>[],
            failureOrSuccessOption: none(),
            isFetching: true,
          ),
        );

        final failureOrSuccess =
            await paymentAdviceFooterRepository.getPaymentAdvice();

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
          (paymentAdvices) {
            emit(
              state.copyWith(
                paymentAdviceFooters: paymentAdvices,
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

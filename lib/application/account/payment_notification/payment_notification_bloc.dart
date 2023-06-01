import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/core/error/api_failures.dart';

import 'package:ezrxmobile/domain/account/entities/payment_notification.dart';

import 'package:ezrxmobile/domain/account/repository/i_update_payment_notification_repository.dart';

import 'package:ezrxmobile/domain/account/entities/payment_advice_expiry_notification.dart';

part 'payment_notification_event.dart';
part 'payment_notification_state.dart';
part 'payment_notification_bloc.freezed.dart';

class PaymentNotificationBloc
    extends Bloc<PaymentNotificationEvent, PaymentNotificationState> {
  final IUpdatePaymentNotificationRepository
      updatePaymentNotificationRepository;
  PaymentNotificationBloc({required this.updatePaymentNotificationRepository})
      : super(PaymentNotificationState.initial()) {
    on<PaymentNotificationEvent>(_onEvent);
  }

  Future<void> _onEvent(
    PaymentNotificationEvent event,
    Emitter<PaymentNotificationState> emit,
  ) async {
    await event.map(
      updatePaymentNotification: (e) async {
        emit(
          state.copyWith(
            message: '',
            paymentNotification: PaymentNotification.empty(),
            failureOrSuccessOption: none(),
          ),
        );

        final updatedPaymentNotification = e.paymentNotification.copyWith(
          paymentAdviceExpiryNotificationList:
              _updatedPaymentAdvice(e.paymentNotification),
        );

        final failureOrSuccess =
            await updatePaymentNotificationRepository.updatePaymentNotification(
          paymentNotification: updatedPaymentNotification,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
          (updatePaymentNotificationResponse) {
            emit(
              state.copyWith(
                message: updatePaymentNotificationResponse.message,
                paymentNotification: updatedPaymentNotification,
                failureOrSuccessOption: none(),
              ),
            );
          },
        );
      },
      updateAdviceExpiryReminder: (e) async {
        emit(
          state.copyWith(
            message: '',
            paymentNotification: PaymentNotification.empty(),
            failureOrSuccessOption: none(),
          ),
        );

        final updatedPaymentNotification = e.paymentNotification.copyWith(
          paymentAdviceExpiryNotificationList:
              _updatedPaymentAdviceExpiryNotification(e),
        );
        final failureOrSuccess =
            await updatePaymentNotificationRepository.updatePaymentNotification(
          paymentNotification: updatedPaymentNotification,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
          (updatePaymentNotificationResponse) {
            emit(
              state.copyWith(
                message: updatePaymentNotificationResponse.message,
                paymentNotification: updatedPaymentNotification,
                failureOrSuccessOption: none(),
              ),
            );
          },
        );
      },
    );
  }

  List<PaymentAdviceExpiryNotification> _updatedPaymentAdviceExpiryNotification(
    _UpdateAdviceExpiryReminder event,
  ) {
    return event.paymentNotification.paymentAdviceExpiryNotificationList
        .map((element) {
      if (element.day == event.day) {
        return element.copyWith(disabled: event.updatedValue);
      }

      return element;
    }).toList();
  }

  List<PaymentAdviceExpiryNotification> _updatedPaymentAdvice(
    PaymentNotification paymentNotification,
  ) {
    return paymentNotification.paymentAdviceExpiryNotificationList
        .map(
          (element) => element.copyWith(
            disabled: paymentNotification.disablePaymentNotification,
          ),
        )
        .toList();
  }
}

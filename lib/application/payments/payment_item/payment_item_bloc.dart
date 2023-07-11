import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_item.dart';
import 'package:ezrxmobile/domain/payments/repository/i_payment_item_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_item_event.dart';
part 'payment_item_state.dart';
part 'payment_item_bloc.freezed.dart';

class PaymentItemBloc extends Bloc<PaymentItemEvent, PaymentItemState> {
  final IPaymentItemRepository paymentItemRepository;
  PaymentItemBloc({required this.paymentItemRepository})
      : super(PaymentItemState.initial()) {
    on<PaymentItemEvent>(_onEvent);
  }
  Future<void> _onEvent(
    PaymentItemEvent event,
    Emitter<PaymentItemState> emit,
  ) async {
    emit(state.copyWith(
      isFetching: true,
      failureOrSuccessOption: none(),
    ));

    final failureOrSuccess = await paymentItemRepository.fetchPaymentItemList(
      customerCodeInfo: event.customerCodeInfo,
      salesOrganization: event.salesOrganization,
      paymentID: event.paymentID,
      paymentBatchAdditionalInfo: event.paymentBatchAdditionalInfo,
      accountingDocExternalReference: event.accountingDocExternalReference,
    );
    failureOrSuccess.fold(
      (failure) {
        emit(state.copyWith(
          failureOrSuccessOption: optionOf(failureOrSuccess),
          isFetching: false,
        ));
      },
      (paymentItemList) => emit(state.copyWith(
        paymentItemList: paymentItemList,
        isFetching: false,
        failureOrSuccessOption: none(),
      )),
    );
  }
}

import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/sales_rep/sales_rep_bloc.dart';
import 'package:ezrxmobile/application/order/payment_customer_information/payment_customer_information_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/payment_customer_information.dart';
import 'package:ezrxmobile/domain/order/entities/payment_term.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/repository/i_payment_term_repository.dart';

part 'payment_term_bloc.freezed.dart';
part 'payment_term_event.dart';
part 'payment_term_state.dart';

class PaymentTermBloc extends Bloc<PaymentTermEvent, PaymentTermState> {
  final IPaymentTermsRepository paymentTermRepository;
  final SalesOrgBloc salesOrgBloc;
  final CustomerCodeBloc customerCodeBloc;
  final UserBloc userBloc;
  final SalesRepBloc salesRepBloc;
  final PaymentCustomerInformationBloc paymentCustomerInformationBloc;
  late final StreamSubscription _paymentCustomerInformationBlocBlocSubscription;
  PaymentTermBloc({
    required this.paymentTermRepository,
    required this.salesOrgBloc,
    required this.customerCodeBloc,
    required this.userBloc,
    required this.paymentCustomerInformationBloc,
    required this.salesRepBloc,
  }) : super(PaymentTermState.initial()) {
    on<PaymentTermEvent>(_onEvent);
    _paymentCustomerInformationBlocBlocSubscription =
        paymentCustomerInformationBloc.stream
            .listen((paymentCustomerInformationState) {
      if (paymentCustomerInformationState.paymentCustomerInformation !=
          PaymentCustomerInformation.empty()) {
        add(const PaymentTermEvent.fetch());
      }
    });
  }

  Future<void> _onEvent(
    PaymentTermEvent event,
    Emitter<PaymentTermState> emit,
  ) async {
    await event.map(
      initialized: (e) async => emit(PaymentTermState.initial()),
      fetch: (e) async {
        final failureOrSuccess = await paymentTermRepository.getPaymentTerms(
          salesOrg: salesOrgBloc.state.salesOrganisation.salesOrg,
          customerCodeInfo: customerCodeBloc.state.customeCodeInfo,
          paymentCustomerInfo:
              paymentCustomerInformationBloc.state.paymentCustomerInformation,
          salesOrgConfig: salesOrgBloc.state.configs,
          salesRepInfo: salesRepBloc.state.salesRepInfo,
        );
        failureOrSuccess.fold(
          (faliure) => emit(
            state.copyWith(
              paymentTermsFailureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (paymentTerms) => emit(
            state.copyWith(
              paymentTermsFailureOrSuccessOption: none(),
              paymentTerms: paymentTerms,
            ),
          ),
        );
      },
    );
  }

  @override
  Future<void> close() async {
    await _paymentCustomerInformationBlocBlocSubscription.cancel();

    return super.close();
  }

  @override
  void onChange(Change<PaymentTermState> change) {
    super.onChange(change);
  }
}

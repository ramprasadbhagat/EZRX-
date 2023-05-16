import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/repository/i_payment_configuration_repository.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'manage_payment_methods_event.dart';
part 'manage_payment_methods_state.dart';
part 'manage_payment_methods_bloc.freezed.dart';

class ManagePaymentMethodsBloc
    extends Bloc<ManagePaymentMethodsEvent, ManagePaymentMethodsState> {
  final IPaymentConfigurationRepository paymentConfigurationRepository;

  ManagePaymentMethodsBloc({required this.paymentConfigurationRepository})
      : super(ManagePaymentMethodsState.initial()) {
    on<ManagePaymentMethodsEvent>(_onEvent);
  }

  Future<void> _onEvent(
    ManagePaymentMethodsEvent event,
    Emitter<ManagePaymentMethodsState> emit,
  ) async {
    await event.map(
      newPaymentMethodChanged: (e) async => emit(
        state.copyWith(
          paymentMethod: PaymentMethod(e.paymentMethod),
          failureOrSuccessOption: none(),
        ),
      ),
      editPaymentMethod: (e) async {
        emit(
          state.copyWith(
            showErrorMessages: false,
          ),
        );
        final isPaymentMethodValid = state.paymentMethod.isValid();
        if (isPaymentMethodValid) {
          emit(
            state.copyWith(
              isSubmitting: true,
              failureOrSuccessOption: none(),
            ),
          );
          final failureOrSuccess =
              await paymentConfigurationRepository.updatePaymentMethods(
            salesOrg: e.salesOrg,
            oldPaymentMethod: e.oldPaymentMethod,
            newPaymentMethod: state.paymentMethod,
          );
          await failureOrSuccess.fold(
            (failure) {
              emit(
                state.copyWith(
                  isSubmitting: false,
                  failureOrSuccessOption: optionOf(failureOrSuccess),
                ),
              );
            },
            (editPaymentMethod) async {
              emit(
                state.copyWith(
                  paymentMethod: PaymentMethod(''),
                  isSubmitting: false,
                ),
              );
            },
          );
        } else {
          emit(state.copyWith(showErrorMessages: true));
        }
      },
      deletePaymentMethod: (e) async {
        emit(
          state.copyWith(
            isSubmitting: true,
            deleteIndex: e.deleteIndex,
            failureOrSuccessOption: none(),
          ),
        );

        final failureOrSuccess =
            await paymentConfigurationRepository.deletePaymentMethods(
          salesOrg: e.salesOrg,
          paymentMethod: e.paymentMethod,
        );
        await failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                isSubmitting: false,
                deleteIndex: -1,
                failureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
          (deletePaymentMethod) async {
            emit(
              state.copyWith(
                deleteIndex: -1,
                isSubmitting: false,
              ),
            );
          },
        );
      },
    );
  }
}

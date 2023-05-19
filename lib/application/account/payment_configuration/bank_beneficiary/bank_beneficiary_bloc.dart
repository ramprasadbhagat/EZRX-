import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/domain/account/entities/bank_benificiary.dart';
import 'package:ezrxmobile/domain/account/repository/i_bank_beneficiary_repository.dart';
part 'bank_beneficiary_event.dart';
part 'bank_beneficiary_state.dart';
part 'bank_beneficiary_bloc.freezed.dart';

class BankBeneficiaryBloc
    extends Bloc<BankBeneficiaryEvent, BankBeneficiaryState> {
  final IBankBeneficiaryRepository bankBeneficiaryRepository;
  BankBeneficiaryBloc({required this.bankBeneficiaryRepository})
      : super(BankBeneficiaryState.initial()) {
    on<BankBeneficiaryEvent>(_onEvent);
  }

  Future<void> _onEvent(
    BankBeneficiaryEvent event,
    Emitter<BankBeneficiaryState> emit,
  ) async {
    await event.map(
        initialized: (_) async => emit(BankBeneficiaryState.initial()),
        fetch: (e) async {
          emit(
            state.copyWith(
              isFetching: true,
            ),
          );
          final failureOrSuccess =
              await bankBeneficiaryRepository.getBankBeneficiaries();

          failureOrSuccess.fold((failure) {
            emit(state.copyWith(
              failureOrSuccessOption: optionOf(failureOrSuccess),
              isFetching: false,
            ));
          },
          (beneficiariesList) {
            emit(
              state.copyWith(
                manageBenificiaryList: beneficiariesList,
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

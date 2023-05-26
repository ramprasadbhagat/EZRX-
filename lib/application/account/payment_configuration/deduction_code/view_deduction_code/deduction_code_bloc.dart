import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/deduction_code.dart';
import 'package:ezrxmobile/domain/account/repository/i_deduction_code_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'deduction_code_event.dart';
part 'deduction_code_state.dart';
part 'deduction_code_bloc.freezed.dart';

class DeductionCodeBloc extends Bloc<DeductionCodeEvent, DeductionCodeState> {
  final IDeductionCodeRepository deductionCodeRepository;

  DeductionCodeBloc({required this.deductionCodeRepository})
      : super(DeductionCodeState.initial()) {
    on<DeductionCodeEvent>(_onEvent);
  }

  Future<void> _onEvent(
    DeductionCodeEvent event,
    Emitter<DeductionCodeState> emit,
  ) async {
    await event.map(
      initialized: (_) async => emit(DeductionCodeState.initial()),
      fetch: (e) async {
        emit(
          state.copyWith(
            isFetching: true,
            failureOrSuccessOption: none(),
            deductionCodeList: <DeductionCode>[],
          ),
        );

        final failureOrSuccess =
            await deductionCodeRepository.getDeductionCodes();

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
          (deductionCodes) {
            emit(
              state.copyWith(
                deductionCodeList: deductionCodes,
                isFetching: false,
              ),
            );
          },
        );
      },
    );
  }
}

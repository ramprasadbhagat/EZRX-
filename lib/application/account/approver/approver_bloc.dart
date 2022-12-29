import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/repository/i_approver_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'approver_bloc.freezed.dart';

part 'approver_event.dart';

part 'approver_state.dart';

class ApproverBloc extends Bloc<ApproverEvent, ApproverState> {
  final IApproverRepository approverRepository;

  ApproverBloc({
    required this.approverRepository,
  }) : super(ApproverState.initial()) {
    on<_Initialized>((event, emit) async {
      emit(ApproverState.initial());
    });
    on<_Fetch>((event, emit) async {
      final showReturns = approverRepository.getReturnsConfig();

      if (!showReturns) {
        emit(
          state.copyWith(
            isApprover: false,
          ),
        );

        return;
      }

      final failureOrSuccess =
          await approverRepository.getIsApprover(event.userInfo);
      failureOrSuccess.fold(
        (failure) {
          emit(
            state.copyWith(
              apiFailureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          );
        },
        (isApprover) {
          emit(
            state.copyWith(
              isApprover: isApprover,
            ),
          );
        },
      );
    });
  }
}

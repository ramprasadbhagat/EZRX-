import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/add_deduction_code.dart';
import 'package:ezrxmobile/domain/account/entities/add_deduction_code_data.dart';
import 'package:ezrxmobile/domain/account/repository/i_deduction_code_repository.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'manage_deduction_code_event.dart';
part 'manage_deduction_code_state.dart';
part 'manage_deduction_code_bloc.freezed.dart';

class ManageDeductionCodeBloc
    extends Bloc<ManageDeductionCodeEvent, ManageDeductionCodeState> {
  final IDeductionCodeRepository deductionCodeRepository;

  ManageDeductionCodeBloc({required this.deductionCodeRepository})
      : super(ManageDeductionCodeState.initial()) {
    on<ManageDeductionCodeEvent>(_onEvent);
  }

  Future<void> _onEvent(
    ManageDeductionCodeEvent event,
    Emitter<ManageDeductionCodeState> emit,
  ) async {
    await event.map(
      initialized: (_) async => emit(ManageDeductionCodeState.initial()),
      addDeductionCode: (value) async {
        emit(
          state.copyWith(
            showErrorMessages: false,
          ),
        );
        if (state.deductionCodeData.isValid) {
          emit(
            state.copyWith(
              isSubmitting: true,
              failureOrSuccessOption: none(),
            ),
          );
          final failureOrSuccess =
              await deductionCodeRepository.addDeductionCodes(
            deductionCode: state.deductionCodeData,
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
            (success) async {
              emit(
                state.copyWith(
                  deductionCodeData: AddDeductionCodeData.empty(),
                  isSubmitting: false,
                  response: success,
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
      onValueChange: (value) async => onValueChange(
        label: value.label,
        newValue: value.newValue,
        emit: emit,
      ),
    );
  }

  void onValueChange({
    required AddDeductionCodeLabel label,
    required String newValue,
    required Emitter<ManageDeductionCodeState> emit,
  }) {
    switch (label) {
      case AddDeductionCodeLabel.salesOrg:
        _emitAfterOnTextChange(
          emit: emit,
          deductionCodeData: state.deductionCodeData.copyWith(
            salesOrg: SalesOrg(newValue),
            salesDistrict: StringValue(''),
          ),
        );
        break;
      case AddDeductionCodeLabel.salesDistrict:
        _emitAfterOnTextChange(
          emit: emit,
          deductionCodeData: state.deductionCodeData.copyWith(
            salesDistrict: StringValue(newValue),
          ),
        );
        break;
      case AddDeductionCodeLabel.deductionCode:
        _emitAfterOnTextChange(
          emit: emit,
          deductionCodeData: state.deductionCodeData.copyWith(
            deductionCode: StringValue(newValue),
          ),
        );
        break;
      case AddDeductionCodeLabel.amountType:
        _emitAfterOnTextChange(
          emit: emit,
          deductionCodeData: state.deductionCodeData.copyWith(
            amountType: StringValue(newValue),
          ),
        );
        break;
      case AddDeductionCodeLabel.deductionDescription:
        _emitAfterOnTextChange(
          emit: emit,
          deductionCodeData: state.deductionCodeData.copyWith(
            deductionDescription: StringValue(newValue),
          ),
        );
        break;
    }
  }

  void _emitAfterOnTextChange({
    required Emitter<ManageDeductionCodeState> emit,
    required AddDeductionCodeData deductionCodeData,
  }) {
    emit(
      state.copyWith(
        deductionCodeData: deductionCodeData,
      ),
    );
  }
}

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/add_deduction_code.dart';
import 'package:ezrxmobile/domain/account/entities/deduction_code.dart';
import 'package:ezrxmobile/domain/account/repository/i_deduction_code_repository.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/deduction_code_dto.dart';
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
      addOrEditDeductionCode: (value) async {
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
              final modifiedList =
                  List<DeductionCode>.from(state.deductionCodeList);
              value.isEdit
                  ? modifiedList.removeWhere(
                      (element) =>
                          element.salesDistrict ==
                              state.deductionCodeData.salesDistrict &&
                          element.deductionCode ==
                              state.deductionCodeData.deductionCode &&
                          element.salesOrg == state.deductionCodeData.salesOrg,
                    )
                  : null;
              final item = DeductionCode.empty().copyWith(
                salesOrg: state.deductionCodeData.salesOrg,
                salesDistrict: state.deductionCodeData.salesDistrict,
                amountType: state.deductionCodeData.amountType,
                deductionCode: state.deductionCodeData.deductionCode,
                deductionDescription:
                    state.deductionCodeData.deductionDescription,
              );

              modifiedList.add(DeductionCodeDto.fromDomain(item).toDomain());
              emit(
                state.copyWith(
                  deductionCodeData: DeductionCode.empty(),
                  isSubmitting: false,
                  deductionCodeList: modifiedList,
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
      deleteDeductionCode: (value) async {
        final modifiedList = List<DeductionCode>.from(state.deductionCodeList);
        final editedList = modifiedList
            .map((element) => element.key == value.data.key
                ? element.copyWith(
                    isDeleteInProgress: true,
                  )
                : element)
            .toList();
        emit(
          state.copyWith(
            isSubmitting: true,
            deductionCodeList: editedList,
            failureOrSuccessOption: none(),
          ),
        );

        final failureOrSuccess = await deductionCodeRepository
            .deleteDeductionCode(deductionCode: value.data);
        await failureOrSuccess.fold(
          (failure) {
            final editedList = List<DeductionCode>.from(state.deductionCodeList)
                .map((element) => element.key == value.data.key
                    ? element.copyWith(
                        isDeleteInProgress: false,
                      )
                    : element)
                .toList();
            emit(
              state.copyWith(
                isSubmitting: false,
                deductionCodeList: editedList,
                failureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
          (deleteDeductionCodeResponse) async {
            final modifiedList =
                List<DeductionCode>.from(state.deductionCodeList);
            modifiedList
                .removeWhere((element) => element.key == value.data.key);
            emit(
              state.copyWith(
                isSubmitting: false,
                deductionCodeList: modifiedList,
                response: deleteDeductionCodeResponse,
              ),
            );
          },
        );
      },
      setDeductionCodeData: (value) {
        emit(
          state.copyWith(
            deductionCodeData: value.data,
            response: AddDeductionCode.empty(),
          ),
        );
      },
    );
  }

  void onValueChange({
    required DeductionCodeLabel label,
    required String newValue,
    required Emitter<ManageDeductionCodeState> emit,
  }) {
    switch (label) {
      case DeductionCodeLabel.salesOrg:
        _emitAfterOnTextChange(
          emit: emit,
          deductionCodeData: state.deductionCodeData.copyWith(
            salesOrg: SalesOrg(newValue),
            salesDistrict: StringValue(''),
          ),
        );
        break;
      case DeductionCodeLabel.salesDistrict:
        _emitAfterOnTextChange(
          emit: emit,
          deductionCodeData: state.deductionCodeData.copyWith(
            salesDistrict: StringValue(newValue),
          ),
        );
        break;
      case DeductionCodeLabel.deductionCode:
        _emitAfterOnTextChange(
          emit: emit,
          deductionCodeData: state.deductionCodeData.copyWith(
            deductionCode: StringValue(newValue),
          ),
        );
        break;
      case DeductionCodeLabel.amountType:
        _emitAfterOnTextChange(
          emit: emit,
          deductionCodeData: state.deductionCodeData.copyWith(
            amountType: StringValue(newValue),
          ),
        );
        break;
      case DeductionCodeLabel.deductionDescription:
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
    required DeductionCode deductionCodeData,
  }) {
    emit(
      state.copyWith(
        deductionCodeData: deductionCodeData,
      ),
    );
  }
}

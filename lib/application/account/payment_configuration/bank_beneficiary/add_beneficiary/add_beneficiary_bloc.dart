import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/bank_beneficiary.dart';
import 'package:ezrxmobile/domain/account/entities/sales_district.dart';
import 'package:ezrxmobile/domain/account/repository/i_bank_beneficiary_repository.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_beneficiary_event.dart';
part 'add_beneficiary_state.dart';
part 'add_beneficiary_bloc.freezed.dart';

class AddBeneficiaryBloc
    extends Bloc<AddBeneficiaryEvent, AddBeneficiaryState> {
  final IBankBeneficiaryRepository bankBeneficiaryRepository;
  AddBeneficiaryBloc({required this.bankBeneficiaryRepository})
      : super(AddBeneficiaryState.initial()) {
    on<AddBeneficiaryEvent>(_onEvent);
  }

  Future<void> _onEvent(
    AddBeneficiaryEvent event,
    Emitter<AddBeneficiaryState> emit,
  ) async {
    await event.map(
      initialized: (_) async => emit(AddBeneficiaryState.initial()),
      onValueChange: (e) async =>
          _onValueChanged(label: e.label, newValue: e.newValue, emit: emit),
      fetchSalesDistrict: (e) async {
        emit(
          state.copyWith(
            isFetching: true,
          ),
        );
        final failureOrSuccess = await bankBeneficiaryRepository
            .getSalesDistrict(salesOrg: e.salesOrg);
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                isFetching: false,
                failureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
          (salesDistrict) {
            emit(
              state.copyWith(
                salesDistrict: salesDistrict,
                addBeneficiaryData: state.addBeneficiaryData.copyWith(
                  salesDistrict: salesDistrict.isNotEmpty
                      ? salesDistrict
                          .first.salesDistrictInfo.first.salesDistrictHeader
                          .getValue()
                      : '',
                ),
                isFetching: false,
                failureOrSuccessOption: none(),
              ),
            );
          },
        );
      },
      addBankBeneficiary: (e) async {
        emit(
          state.copyWith(
            showErrorMessages: false,
          ),
        );
        final isSalesOrgValid = state.addBeneficiaryData.salesOrg.isValid();
        final isEmailIDNotEmpty =
            state.addBeneficiaryData.emailId.getValue().isNotEmpty;
        final isEmailValid = state.addBeneficiaryData.emailId.isValid();
          if (isEmailIDNotEmpty&&!isEmailValid) {
            emit(
              state.copyWith(
                showErrorMessages: true,
              ),
            );
            
            return;
          }
        if (isSalesOrgValid) {
          emit(
            state.copyWith(
              isSubmitting: true,
            ),
          );
          final failureOrSuccess =
              await bankBeneficiaryRepository.addOrUpdateBeneficiary(
            beneficiaryData: state.addBeneficiaryData,
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
            (addBeneficiary) async {
              emit(
                state.copyWith(
                  addBeneficiaryData: BankBeneficiary.empty(),
                  isSubmitting: false,
                  failureOrSuccessOption: none(),
                ),
              );
            },
          );
        } else {
          emit(
            state.copyWith(
              showErrorMessages: true,
            ),
          );
        }
      },
    );
  }

  void _emitAfterValueChange({
    required Emitter<AddBeneficiaryState> emit,
    required BankBeneficiary addBeneficiaryData,
  }) {
    emit(
      state.copyWith(addBeneficiaryData: addBeneficiaryData),
    );
  }

  void _onValueChanged({
    required AddBeneficiaryLabel label,
    required String newValue,
    required Emitter<AddBeneficiaryState> emit,
  }) {
    switch (label) {
      case AddBeneficiaryLabel.selectSalesOrg:
        _emitAfterValueChange(
          emit: emit,
          addBeneficiaryData: state.addBeneficiaryData.copyWith(
            salesOrg: SalesOrg(newValue),
            salesDistrict: '',
          ),
        );
        break;
      case AddBeneficiaryLabel.selectSalesDistrict:
        _emitAfterValueChange(
          emit: emit,
          addBeneficiaryData: state.addBeneficiaryData.copyWith(
            salesDistrict: newValue,
          ),
        );
        break;
      case AddBeneficiaryLabel.beneficiaryName:
        _emitAfterValueChange(
          emit: emit,
          addBeneficiaryData: state.addBeneficiaryData.copyWith(
            beneficiaryName: StringValue(newValue),
          ),
        );
        break;
      case AddBeneficiaryLabel.bankName:
        _emitAfterValueChange(
          emit: emit,
          addBeneficiaryData: state.addBeneficiaryData.copyWith(
            bankName: StringValue(newValue),
          ),
        );
        break;
      case AddBeneficiaryLabel.branch:
        _emitAfterValueChange(
          emit: emit,
          addBeneficiaryData: state.addBeneficiaryData.copyWith(
            branch: newValue,
          ),
        );
        break;
      case AddBeneficiaryLabel.bankCode:
        _emitAfterValueChange(
          emit: emit,
          addBeneficiaryData: state.addBeneficiaryData.copyWith(
            bankCode: newValue,
          ),
        );
        break;
      case AddBeneficiaryLabel.bankAccount:
        _emitAfterValueChange(
          emit: emit,
          addBeneficiaryData: state.addBeneficiaryData.copyWith(
            bankAccount: StringValue(newValue),
          ),
        );
        break;
      case AddBeneficiaryLabel.hdbcSwiftCode:
        _emitAfterValueChange(
          emit: emit,
          addBeneficiaryData: state.addBeneficiaryData.copyWith(
            hdbcSwiftCode: newValue,
          ),
        );
        break;
      case AddBeneficiaryLabel.bankAddress:
        _emitAfterValueChange(
          emit: emit,
          addBeneficiaryData: state.addBeneficiaryData.copyWith(
            bankAddress: newValue,
          ),
        );
        break;
      case AddBeneficiaryLabel.payNowUen:
        _emitAfterValueChange(
          emit: emit,
          addBeneficiaryData: state.addBeneficiaryData.copyWith(
            payNowUen: newValue,
          ),
        );
        break;
      case AddBeneficiaryLabel.emailId:
        _emitAfterValueChange(
          emit: emit,
          addBeneficiaryData: state.addBeneficiaryData.copyWith(
            emailId: EmailAddress(newValue),
          ),
        );
        break;
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/bank_beneficiary_response.dart';
import 'package:ezrxmobile/domain/account/entities/sales_district.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/auth/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/domain/account/entities/bank_beneficiary.dart';
import 'package:ezrxmobile/domain/account/repository/i_bank_beneficiary_repository.dart';
part 'manage_bank_beneficiary_event.dart';
part 'manage_bank_beneficiary_state.dart';
part 'manage_bank_beneficiary_bloc.freezed.dart';

class ManageBankBeneficiaryBloc
    extends Bloc<ManageBankBeneficiaryEvent, ManageBankBeneficiaryState> {
  final IBankBeneficiaryRepository bankBeneficiaryRepository;
  ManageBankBeneficiaryBloc({required this.bankBeneficiaryRepository})
      : super(ManageBankBeneficiaryState.initial()) {
    on<ManageBankBeneficiaryEvent>(_onEvent);
  }

  Future<void> _onEvent(
    ManageBankBeneficiaryEvent event,
    Emitter<ManageBankBeneficiaryState> emit,
  ) async {
    await event.map(
      fetch: (e) async {
        emit(
          state.copyWith(
            isFetching: true,
          ),
        );
        final failureOrSuccess =
            await bankBeneficiaryRepository.getBankBeneficiaries();

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
          (beneficiariesList) {
            emit(
              state.copyWith(
                beneficiaryList: beneficiariesList,
                failureOrSuccessOption: none(),
                isFetching: false,
              ),
            );
          },
        );
      },
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
                beneficiaryData: e.fromAdd
                    ? state.beneficiaryData.copyWith(
                        salesDistrict: salesDistrict.isNotEmpty
                            ? salesDistrict.first.salesDistrictInfo.first
                                .salesDistrictHeader
                                .getValue()
                            : '',
                      )
                    : state.beneficiaryData,
                isFetching: false,
                failureOrSuccessOption: none(),
              ),
            );
          },
        );
      },
      onValueChange: (e) async => _onValueChanged(
        emit: emit,
        label: e.label,
        newValue: e.newValue,
      ),
      setBeneficiary: (e) {
        emit(state.copyWith(beneficiaryData: e.beneficiary));
      },
      addOrUpdateBeneficiary: (e) async {
        emit(
          state.copyWith(
            showErrorMessages: false,
          ),
        );
        final isSalesOrgValid = state.beneficiaryData.salesOrg.isValid();
        final isEmailNotEmptyAndValid = state.beneficiaryData.emailId.isValid();
        if (isSalesOrgValid && isEmailNotEmptyAndValid) {
          emit(
            state.copyWith(
              isSubmitting: true,
            ),
          );
          final failureOrSuccess =
              await bankBeneficiaryRepository.addOrUpdateBeneficiary(
            beneficiaryData: state.beneficiaryData,
          );
          failureOrSuccess.fold(
            (failure) {
              emit(
                state.copyWith(
                  isSubmitting: false,
                  failureOrSuccessOption: optionOf(failureOrSuccess),
                ),
              );
            },
            (success) {
              final beneficiaryList =
                  List<BankBeneficiary>.from(state.beneficiaryList);
              e.isEdit
                  ? beneficiaryList.removeWhere(
                      (element) => element.key == state.beneficiaryData.key,
                    )
                  : null;
              final item = state.beneficiaryData;
              beneficiaryList.add(item);
              emit(
                state.copyWith(
                  beneficiaryData: BankBeneficiary.empty(),
                  isSubmitting: false,
                  beneficiaryList: beneficiaryList,
                  response: success,
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
      deleteBeneficiary: (e) async {
        final beneficiaryList = state.beneficiaryList;
        final editedList = state.beneficiaryList
            .map(
              (element) => element.key == e.beneficiary.key
                  ? element.copyWith(
                      isDeleteInProgress: true,
                    )
                  : element,
            )
            .toList();
        emit(
          state.copyWith(
            isSubmitting: true,
            beneficiaryList: editedList,
            failureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess =
            await bankBeneficiaryRepository.deleteBeneficiary(
          salesOrg: e.beneficiary.salesOrg,
          salesDistrict: e.beneficiary.salesDistrict,
        );
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                isSubmitting: false,
                failureOrSuccessOption: optionOf(failureOrSuccess),
                beneficiaryList: beneficiaryList,
              ),
            );
          },
          (deleteBeneficiary) {
            final modifiedList = List<BankBeneficiary>.from(beneficiaryList);
            modifiedList
                .removeWhere((element) => element.key == e.beneficiary.key);
            emit(
              state.copyWith(
                isSubmitting: false,
                beneficiaryList: modifiedList,
                response: deleteBeneficiary,
                failureOrSuccessOption: none(),
              ),
            );
          },
        );
      },
    );
  }

  void _emitAfterValueChange({
    required Emitter<ManageBankBeneficiaryState> emit,
    required BankBeneficiary addBeneficiaryData,
  }) {
    emit(
      state.copyWith(beneficiaryData: addBeneficiaryData),
    );
  }

  void _onValueChanged({
    required BeneficiaryLabel label,
    required String newValue,
    required Emitter<ManageBankBeneficiaryState> emit,
  }) {
    switch (label) {
      case BeneficiaryLabel.selectSalesOrg:
        _emitAfterValueChange(
          emit: emit,
          addBeneficiaryData: state.beneficiaryData.copyWith(
            salesOrg: SalesOrg(newValue),
            salesDistrict: '',
          ),
        );
        break;
      case BeneficiaryLabel.selectSalesDistrict:
        _emitAfterValueChange(
          emit: emit,
          addBeneficiaryData: state.beneficiaryData.copyWith(
            salesDistrict: newValue,
          ),
        );
        break;
      case BeneficiaryLabel.beneficiaryName:
        _emitAfterValueChange(
          emit: emit,
          addBeneficiaryData: state.beneficiaryData.copyWith(
            beneficiaryName: StringValue(newValue),
          ),
        );
        break;
      case BeneficiaryLabel.bankName:
        _emitAfterValueChange(
          emit: emit,
          addBeneficiaryData: state.beneficiaryData.copyWith(
            bankName: StringValue(newValue),
          ),
        );
        break;
      case BeneficiaryLabel.branch:
        _emitAfterValueChange(
          emit: emit,
          addBeneficiaryData: state.beneficiaryData.copyWith(
            branch: newValue,
          ),
        );
        break;
      case BeneficiaryLabel.bankCode:
        _emitAfterValueChange(
          emit: emit,
          addBeneficiaryData: state.beneficiaryData.copyWith(
            bankCode: newValue,
          ),
        );
        break;
      case BeneficiaryLabel.bankAccount:
        _emitAfterValueChange(
          emit: emit,
          addBeneficiaryData: state.beneficiaryData.copyWith(
            bankAccount: StringValue(newValue),
          ),
        );
        break;
      case BeneficiaryLabel.hdbcSwiftCode:
        _emitAfterValueChange(
          emit: emit,
          addBeneficiaryData: state.beneficiaryData.copyWith(
            hdbcSwiftCode: newValue,
          ),
        );
        break;
      case BeneficiaryLabel.bankAddress:
        _emitAfterValueChange(
          emit: emit,
          addBeneficiaryData: state.beneficiaryData.copyWith(
            bankAddress: newValue,
          ),
        );
        break;
      case BeneficiaryLabel.payNowUen:
        _emitAfterValueChange(
          emit: emit,
          addBeneficiaryData: state.beneficiaryData.copyWith(
            payNowUen: newValue,
          ),
        );
        break;
      case BeneficiaryLabel.emailId:
        _emitAfterValueChange(
          emit: emit,
          addBeneficiaryData: state.beneficiaryData.copyWith(
            emailId: EmailAddress.optional(newValue),
          ),
        );
        break;
    }
  }
}

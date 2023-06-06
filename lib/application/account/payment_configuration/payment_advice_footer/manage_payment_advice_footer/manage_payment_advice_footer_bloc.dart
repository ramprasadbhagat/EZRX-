import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/add_payment_advice_footer_response.dart';
import 'package:ezrxmobile/domain/account/entities/payment_advice_footer_data.dart';
import 'package:ezrxmobile/domain/account/entities/payment_advice_header_logo.dart';
import 'package:ezrxmobile/domain/account/entities/sales_district_info.dart';
import 'package:ezrxmobile/domain/account/repository/i_payment_advice_footer_repository.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'manage_payment_advice_footer_event.dart';
part 'manage_payment_advice_footer_state.dart';
part 'manage_payment_advice_footer_bloc.freezed.dart';

class ManagePaymentAdviceFooterBloc extends Bloc<ManagePaymentAdviceFooterEvent,
    ManagePaymentAdviceFooterState> {
  final IPaymentAdviceFooterRepository paymentAdviceFooterRepository;

  ManagePaymentAdviceFooterBloc({
    required this.paymentAdviceFooterRepository,
  }) : super(ManagePaymentAdviceFooterState.initial()) {
    on<ManagePaymentAdviceFooterEvent>(_onEvent);
  }

  FutureOr<void> _onEvent(
    ManagePaymentAdviceFooterEvent event,
    Emitter<ManagePaymentAdviceFooterState> emit,
  ) async {
    await event.map(
      initialized: (e) async => emit(ManagePaymentAdviceFooterState.initial()),
      addManagePaymentAdviceFooter: (e) async {
        emit(
          state.copyWith(
            showErrorMessages: false,
          ),
        );
        if (!state.paymentAdviceFooterData.isValid) {
          emit(
            state.copyWith(
              showErrorMessages: true,
            ),
          );

          return;
        }
        emit(
          state.copyWith(
            isSubmitting: true,
            failureOrSuccessOption: none(),
          ),
        );
        final headerLogo =
            await _uploadLogo(state.paymentAdviceFooterData.uploadFiles);
        final failureOrSuccess =
            await paymentAdviceFooterRepository.addPaymentAdvice(
          paymentAdviceFooterData: state.paymentAdviceFooterData,
          headerLogo: headerLogo,
        );
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              isSubmitting: false,
              failureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (success) => emit(
            state.copyWith(
              paymentAdviceFooterData: PaymentAdviceFooterData.empty(),
              isSubmitting: false,
              response: success,
            ),
          ),
        );
      },
      onValueChange: (_OnValueChange e) async => _onValueChange(
        label: e.label,
        newValue: e.newValue,
        emit: emit,
      ),
      headerTextToggle: (_HeaderTextToggle e) async {
        emit(
          state.copyWith(
            paymentAdviceFooterData: state.paymentAdviceFooterData.copyWith(
              headerTextActive: e.value,
              uploadFiles: <PlatformFile>[],
              header: StringValue(''),
            ),
          ),
        );
      },
      addFile: (_AddFile e) async {
        final failureOrSuccessPermission =
            await paymentAdviceFooterRepository.getPermission(
          pickFrom: e.pickFrom,
        );
        await failureOrSuccessPermission.fold(
          (failure) async => emit(
            state.copyWith(
              isSubmitting: false,
              failureOrSuccessOption: optionOf(failureOrSuccessPermission),
            ),
          ),
          (_) async {
            final pickFilesFailureOrSuccess =
                await paymentAdviceFooterRepository.pickFiles(
              pickFrom: e.pickFrom,
            );
            pickFilesFailureOrSuccess.fold(
              (failure) => emit(
                state.copyWith(
                  failureOrSuccessOption: optionOf(pickFilesFailureOrSuccess),
                ),
              ),
              (files) => emit(
                state.copyWith(
                  paymentAdviceFooterData:
                      state.paymentAdviceFooterData.copyWith(
                    uploadFiles: files,
                  ),
                ),
              ),
            );
          },
        );
      },
      removePickedFile: (_RemovePickedFile e) async => emit(
        state.copyWith(
          paymentAdviceFooterData: state.paymentAdviceFooterData.copyWith(
            uploadFiles: [],
          ),
        ),
      ),
      salesDistrictOnChange: (_SalesDistrictOnChange e) async => emit(
        state.copyWith(
          paymentAdviceFooterData: state.paymentAdviceFooterData.copyWith(
            salesDistrict: e.salesDistrictInfo,
          ),
        ),
      ),
      salesOrgOnChange: (_SalesOrgOnChange e) async => emit(
        state.copyWith(
          paymentAdviceFooterData: state.paymentAdviceFooterData.copyWith(
            salesOrg: e.salesOrg,
          ),
        ),
      ),
    );
  }

  void _onValueChange({
    required ManagePaymentAdviceFooterLabel label,
    required String newValue,
    required Emitter<ManagePaymentAdviceFooterState> emit,
  }) {
    switch (label) {
      case ManagePaymentAdviceFooterLabel.footer:
        _emitAfterOnTextChange(
          emit: emit,
          paymentAdviceFooterData: state.paymentAdviceFooterData.copyWith(
            footer: StringValue(newValue),
          ),
        );
        break;
      case ManagePaymentAdviceFooterLabel.note:
        _emitAfterOnTextChange(
          emit: emit,
          paymentAdviceFooterData: state.paymentAdviceFooterData.copyWith(
            note: StringValue(newValue),
          ),
        );
        break;
      case ManagePaymentAdviceFooterLabel.headerText:
        _emitAfterOnTextChange(
          emit: emit,
          paymentAdviceFooterData: state.paymentAdviceFooterData.copyWith(
            header: StringValue(newValue),
          ),
        );
        break;
    }
  }

  Future<PaymentAdviceHeaderLogo> _uploadLogo(List<PlatformFile> files) async {
    if (files.isEmpty) return PaymentAdviceHeaderLogo.empty();
    final failureOrSuccess =
        await paymentAdviceFooterRepository.uploadHeaderLogo(file: files.first);

    return failureOrSuccess.fold(
      (_) => PaymentAdviceHeaderLogo.empty(),
      (paymentAdviceHeaderLogo) => paymentAdviceHeaderLogo,
    );
  }

  void _emitAfterOnTextChange({
    required Emitter<ManagePaymentAdviceFooterState> emit,
    required PaymentAdviceFooterData paymentAdviceFooterData,
  }) {
    emit(
      state.copyWith(
        paymentAdviceFooterData: paymentAdviceFooterData,
      ),
    );
  }
}

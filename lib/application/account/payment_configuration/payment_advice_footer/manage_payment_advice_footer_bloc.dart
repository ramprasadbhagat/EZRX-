import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/manage_payment_advice_footer_response.dart';
import 'package:ezrxmobile/domain/account/entities/payment_advice_footer.dart';
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
      fetch: (_Fetch e) async {
        emit(
          state.copyWith(
            paymentAdviceFooters: <PaymentAdviceFooter>[],
            failureOrSuccessOption: none(),
            isFetching: true,
          ),
        );

        final failureOrSuccess =
            await paymentAdviceFooterRepository.getPaymentAdvice();

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
          (paymentAdvices) {
            emit(
              state.copyWith(
                paymentAdviceFooters: paymentAdvices,
                failureOrSuccessOption: none(),
                isFetching: false,
              ),
            );
          },
        );
      },
      addOrUpdate: (_AddOrUpdate e) async {
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
        final headerLogo = await _uploadLogo(
          state.paymentAdviceFooterData.paymentAdviceLogo.logoLocalFile,
        );

        final paymentAdviceFooter = state.paymentAdviceFooterData.copyWith(
          paymentAdviceLogo:
              state.paymentAdviceFooterData.paymentAdviceLogo.copyWith(
            logoNetworkFile: headerLogo,
          ),
        );
        final failureOrSuccess =
            await paymentAdviceFooterRepository.addPaymentAdvice(
          paymentAdviceFooterData: paymentAdviceFooter,
        );
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              isSubmitting: false,
              failureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (success) {
            final paymentAdviceList =
                List<PaymentAdviceFooter>.from(state.paymentAdviceFooters);
            success.message.isEdit
                ? paymentAdviceList.removeWhere(
                    (element) =>
                        element.salesOrg ==
                            state.paymentAdviceFooterData.salesOrg &&
                        element.salesDistrict.salesDistrictHeader ==
                            state.paymentAdviceFooterData.salesDistrict
                                .salesDistrictHeader,
                  )
                : null;
            paymentAdviceList.add(paymentAdviceFooter);
            emit(
              state.copyWith(
                paymentAdviceFooters: paymentAdviceList,
                paymentAdviceFooterData: PaymentAdviceFooter.empty(),
                isSubmitting: false,
                response: success,
              ),
            );
          },
        );
      },
      onValueChange: (_OnValueChange e) async => _onValueChange(
        label: e.label,
        newValue: e.newValue,
        emit: emit,
      ),
      headerTextToggle: (_HeaderTextToggle e) {
        emit(
          state.copyWith(
            paymentAdviceFooterData: state.paymentAdviceFooterData.copyWith(
              headerTextActive: e.value,
              paymentAdviceLogo: PaymentAdviceLogo.empty(),
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
                    paymentAdviceLogo: PaymentAdviceLogo.empty().copyWith(
                      logoLocalFile: files,
                    ),
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
            paymentAdviceLogo: PaymentAdviceLogo.empty(),
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
            salesDistrict: SalesDistrictInfo.empty(),
          ),
        ),
      ),
      delete: (_Delete e) async {
        final paymentAdviceFooterList =
            List<PaymentAdviceFooter>.from(state.paymentAdviceFooters);
        emit(
          state.copyWith(
            isSubmitting: true,
            paymentAdviceFooters: paymentAdviceFooterList
                .map(
                  (PaymentAdviceFooter element) => element.copyWith(
                    isDeleteInProgress:
                        element.key == e.paymentAdviceFooter.key,
                  ),
                )
                .toList(),
            failureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess =
            await paymentAdviceFooterRepository.deletePaymentAdvice(
          paymentAdviceFooter: e.paymentAdviceFooter,
        );
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              isSubmitting: false,
              paymentAdviceFooters: paymentAdviceFooterList,
              failureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (success) => emit(
            state.copyWith(
              isSubmitting: false,
              paymentAdviceFooters:
                  List<PaymentAdviceFooter>.from(state.paymentAdviceFooters)
                    ..removeWhere(
                      (PaymentAdviceFooter element) =>
                          element.isDeleteInProgress,
                    ),
              failureOrSuccessOption: none(),
              response: success,
            ),
          ),
        );
      },
      setPaymentAdvice: (_SetPaymentAdvice e) async => emit(
        state.copyWith(
          paymentAdviceFooterData: e.paymentAdviceFooterData,
          showErrorMessages: false,
          failureOrSuccessOption: none(),
          isSubmitting: false,
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
            pleaseNote: StringValue(newValue),
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

  Future<PaymentAdviceLogoNetworkFile> _uploadLogo(
    List<PlatformFile> localFile,
  ) async {
    if (localFile.isEmpty) return PaymentAdviceLogoNetworkFile.empty();
    final failureOrSuccess = await paymentAdviceFooterRepository
        .uploadHeaderLogo(file: localFile.first);

    return failureOrSuccess.fold(
      (_) => PaymentAdviceLogoNetworkFile.empty(),
      (paymentAdviceHeaderLogo) => paymentAdviceHeaderLogo,
    );
  }

  void _emitAfterOnTextChange({
    required Emitter<ManagePaymentAdviceFooterState> emit,
    required PaymentAdviceFooter paymentAdviceFooterData,
  }) {
    emit(
      state.copyWith(
        paymentAdviceFooterData: paymentAdviceFooterData,
      ),
    );
  }
}

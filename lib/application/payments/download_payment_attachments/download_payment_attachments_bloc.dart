import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/core/error/api_failures.dart';

import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';

import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';

import 'package:ezrxmobile/domain/payments/entities/all_invoices_filter.dart';

import 'package:ezrxmobile/domain/payments/entities/all_credits_filter.dart';

import 'package:ezrxmobile/domain/payments/entities/download_payment_attachments.dart';

import 'package:ezrxmobile/domain/payments/repository/i_download_payment_attachment_repository.dart';

part 'download_payment_attachments_event.dart';
part 'download_payment_attachments_state.dart';
part 'download_payment_attachments_bloc.freezed.dart';

class DownloadPaymentAttachmentsBloc extends Bloc<
    DownloadPaymentAttachmentEvent, DownloadPaymentAttachmentsState> {
  final IDownloadPaymentAttachmentRepository paymentAttachmentRepository;

  DownloadPaymentAttachmentsBloc({required this.paymentAttachmentRepository})
      : super(DownloadPaymentAttachmentsState.initial()) {
    on<DownloadPaymentAttachmentEvent>(_onEvent);
  }

  Future<void> _onEvent(
    DownloadPaymentAttachmentEvent event,
    Emitter<DownloadPaymentAttachmentsState> emit,
  ) async {
    await event.map(
      fetchAllInvoiceUrl: (e) async {
        emit(
          state.copyWith(
            isDownloadInProgress: true,
            failureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess =
            await paymentAttachmentRepository.fetchAllInvoiceUrl(
          salesOrganization: e.salesOrganization,
          customerCodeInfo: e.customerCodeInfo,
          queryObject: e.queryObject,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                isDownloadInProgress: false,
                failureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
          (paymentSummaryUrl) => add(
            DownloadPaymentAttachmentEvent.downloadPaymentAttachment(
              files: paymentSummaryUrl,
            ),
          ),
        );
      },
      fetchAllCreditUrl: (e) async {
        emit(
          state.copyWith(
            isDownloadInProgress: true,
            failureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess =
            await paymentAttachmentRepository.fetchAllCreditUrl(
          salesOrganization: e.salesOrganization,
          customerCodeInfo: e.customerCodeInfo,
          queryObject: e.queryObject,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                isDownloadInProgress: false,
                failureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
          (paymentSummaryUrl) => add(
            DownloadPaymentAttachmentEvent.downloadPaymentAttachment(
              files: paymentSummaryUrl,
            ),
          ),
        );
      },
      fetchPaymentSummaryUrl: (e) async {
        emit(
          state.copyWith(
            isDownloadInProgress: true,
            failureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess =
            await paymentAttachmentRepository.fetchPaymentSummaryUrl(
          salesOrganization: e.salesOrganization,
          customerCodeInfo: e.customerCodeInfo,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                isDownloadInProgress: false,
                failureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
          (paymentSummaryUrl) => add(
            DownloadPaymentAttachmentEvent.downloadPaymentAttachment(
              files: paymentSummaryUrl,
            ),
          ),
        );
      },
      downloadPaymentAttachment: (e) async {
        final failureOrSuccessPermission =
            await paymentAttachmentRepository.downloadPermission();

        await failureOrSuccessPermission.fold(
          (failure) async => emit(
            state.copyWith(
              isDownloadInProgress: false,
              failureOrSuccessOption: optionOf(failureOrSuccessPermission),
            ),
          ),
          (_) async {
            final failureOrSuccess =
                await paymentAttachmentRepository.downloadFiles(
              files: e.files,
            );
            failureOrSuccess.fold(
              (failure) => emit(
                state.copyWith(
                  isDownloadInProgress: false,
                  failureOrSuccessOption: optionOf(failureOrSuccess),
                ),
              ),
              (_) => emit(
                state.copyWith(
                  isDownloadInProgress: false,
                  failureOrSuccessOption: optionOf(failureOrSuccess),
                ),
              ),
            );
          },
        );
      },
      downloadSOA: (_DownloadSOA e) async {
        emit(
          state.copyWith(
            isDownloadInProgress: true,
            failureOrSuccessOption: none(),
            fileUrl: DownloadPaymentAttachment(
              url: e.soaData.getOrDefaultValue(''),
            ),
          ),
        );
        final failureOrSuccessPermission =
            await paymentAttachmentRepository.downloadPermission();

        await failureOrSuccessPermission.fold(
          (failure) async => emit(
            state.copyWith(
              isDownloadInProgress: false,
              failureOrSuccessOption: optionOf(failureOrSuccessPermission),
            ),
          ),
          (_) async {
            final failureOrSuccess =
                await paymentAttachmentRepository.soaDownload(
              soaData: e.soaData,
            );
            failureOrSuccess.fold(
              (failure) => emit(
                state.copyWith(
                  isDownloadInProgress: false,
                  failureOrSuccessOption: optionOf(failureOrSuccess),
                ),
              ),
              (_) => emit(
                state.copyWith(
                  isDownloadInProgress: false,
                  failureOrSuccessOption: optionOf(failureOrSuccess),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

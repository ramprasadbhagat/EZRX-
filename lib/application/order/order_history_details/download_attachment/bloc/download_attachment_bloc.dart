import 'dart:async';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_document_buffer.dart';
import 'package:ezrxmobile/domain/order/repository/i_order_history_details_po_document_download_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'download_attachment_event.dart';
part 'download_attachment_state.dart';
part 'download_attachment_bloc.freezed.dart';

class DownloadAttachmentBloc
    extends Bloc<DownloadAttachmentEvent, DownloadAttachmentState> {
  final IOrderHistoryDetailsPoDocumentRepository downloadAttachmentRepository;
  DownloadAttachmentBloc({
    required this.downloadAttachmentRepository,
  }) : super(DownloadAttachmentState.initial()) {
    on<DownloadAttachmentEvent>(_onEvent);
  }

  FutureOr<void> _onEvent(
    DownloadAttachmentEvent event,
    Emitter<DownloadAttachmentState> emit,
  ) async {
    await event.map(
      initialized: (e) async => emit(DownloadAttachmentState.initial()),
      downloadFile: (_DownloadFile e) async {
        emit(
          DownloadAttachmentState.initial()
              .copyWith(fileFetchMode: e.fetchMode),
        );
        final failureOrSuccess =
            await downloadAttachmentRepository.downloadFiles(e.files);
        failureOrSuccess.fold(
          (l) => emit(
            state.copyWith(
              failureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (r) => emit(
            state.copyWith(
              failureOrSuccessOption: optionOf(failureOrSuccess),
              fileData: r,
            ),
          ),
        );
      },
    );
  }
}

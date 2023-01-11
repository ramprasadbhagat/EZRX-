import 'dart:async';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_document_buffer.dart';
import 'package:ezrxmobile/domain/order/repository/i_po_attachment_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';

part 'po_attachment_event.dart';
part 'po_attachment_state.dart';
part 'po_attachment_bloc.freezed.dart';

class PoAttachmentBloc extends Bloc<PoAttachmentEvent, PoAttachmentState> {
  final IpoAttachmentRepository downloadAttachmentRepository;
  PoAttachmentBloc({
    required this.downloadAttachmentRepository,
  }) : super(PoAttachmentState.initial()) {
    on<PoAttachmentEvent>(_onEvent);
  }

  FutureOr<void> _onEvent(
    PoAttachmentEvent event,
    Emitter<PoAttachmentState> emit,
  ) async {
    await event.map(
      initialized: (e) async => emit(PoAttachmentState.initial()),
      downloadFile: (_DownloadFile e) async {
        emit(
          PoAttachmentState.initial().copyWith(fileFetchMode: e.fetchMode),
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
      uploadFile: (_UpLoadFile e) async {
        emit(
          PoAttachmentState.initial().copyWith(isFetching: true),
        );
        final failureOrSuccess = await downloadAttachmentRepository.uploadFiles(
          salesOrg: e.salesOrg,
          files: e.files,
          shipToInfo: e.shipToInfo,
          customerCodeInfo: e.customerCodeInfo,
          user: e.user,
          uploadedPODocument: e.uploadedPODocument,
        );
        failureOrSuccess.fold(
          (l) => emit(
            state.copyWith(
              failureOrSuccessOption: optionOf(failureOrSuccess),
              isFetching: false,
            ),
          ),
          (r) => emit(
            state.copyWith(
              failureOrSuccessOption: none(),
              fileUrl: r,
              isFetching: false,
            ),
          ),
        );
      },
    );
  }
}

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
          PoAttachmentState.initial().copyWith(
            fileOperationhMode: e.fetchMode,
            isFetching: true,
            fileUrl: e.files,
          ),
        );
        final failureOrSuccess =
            await downloadAttachmentRepository.downloadFiles(e.files);
        failureOrSuccess.fold(
          (l) => emit(
            state.copyWith(
              failureOrSuccessOption: optionOf(failureOrSuccess),
              isFetching: false,
              fileUrl: [],
            ),
          ),
          (r) => emit(
            state.copyWith(
              failureOrSuccessOption: optionOf(failureOrSuccess),
              fileData: r,
              fileUrl: [],
              isFetching: false,
            ),
          ),
        );
      },
      uploadFile: (_UpLoadFile e) async {
        final renamedFiles = e.files
            .map(
              (element) => PlatformFile(
                path: element.path,
                name:
                    '${e.user.username.getOrCrash()}_${e.customerCodeInfo.customerCodeSoldTo}_${e.shipToInfo.shipToCustomerCode}_${DateTime.now().toUtc().millisecondsSinceEpoch}_${element.name}',
                size: element.size,
                bytes: element.bytes,
                readStream: element.readStream,
                identifier: element.identifier,
              ),
            )
            .toList();
        emit(
          PoAttachmentState.initial().copyWith(
            isFetching: true,
            fileOperationhMode: FileOperationhMode.upload,
            fileUrl: renamedFiles
                .map(
                  (element) => PoDocuments.empty().copyWith(
                    name: element.name,
                  ),
                )
                .toList(),
          ),
        );
        final failureOrSuccess = await downloadAttachmentRepository.uploadFiles(
          salesOrg: e.salesOrg,
          files: renamedFiles,
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
              fileUrl: [],
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

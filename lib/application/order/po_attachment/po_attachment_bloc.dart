import 'dart:async';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/order/repository/i_po_attachment_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';

part 'po_attachment_event.dart';
part 'po_attachment_state.dart';
part 'po_attachment_bloc.freezed.dart';

class PoAttachmentBloc extends Bloc<PoAttachmentEvent, PoAttachmentState> {
  final IpoAttachmentRepository poAttachmentRepository;
  PoAttachmentBloc({
    required this.poAttachmentRepository,
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
          state.copyWith(
            isFetching: true,
            failureOrSuccessOption: none(),
            fileUrl: [],
            fileOperationMode: FileOperationMode.download,
          ),
        );
        final failureOrSuccessPermission =
            await poAttachmentRepository.downloadPermission();
        await failureOrSuccessPermission.fold(
          (failure) async => emit(
            state.copyWith(
              failureOrSuccessOption: optionOf(failureOrSuccessPermission),
              isFetching: false,
            ),
          ),
          (_) async {
        final failureOrSuccess = await poAttachmentRepository.downloadFiles(
          e.files,
          e.attachmentType,
        );
        failureOrSuccess.fold(
              (failure) => emit(
                state.copyWith(
                  failureOrSuccessOption: optionOf(failureOrSuccess),
                  isFetching: false,
                ),
              ),
              (_) => emit(
                state.copyWith(
                  failureOrSuccessOption: none(),
                  isFetching: false,
                ),
              ),
            );
          },
        );
      },
      openFile: (_OpenFile e) async {
        emit(
          state.copyWith(
            isFetching: true,
            failureOrSuccessOption: none(),
            fileUrl: [],
            fileOperationMode: FileOperationMode.view,
          ),
        );
        final failureOrSuccessPermission =
            await poAttachmentRepository.downloadPermission();
        await failureOrSuccessPermission.fold(
          (failure) async => emit(
            state.copyWith(
              failureOrSuccessOption: optionOf(failureOrSuccessPermission),
              isFetching: false,
            ),
          ),
          (_) async {
            final failureOrSuccess = await poAttachmentRepository.openFile(
              files: e.files,
              attachmentType: e.attachmentType,
            );
            failureOrSuccess.fold(
              (failure) => emit(
                state.copyWith(
                  failureOrSuccessOption: optionOf(failureOrSuccess),
                  isFetching: false,
                ),
              ),
              (_) => emit(
                state.copyWith(
                  failureOrSuccessOption: none(),
                  isFetching: false,
                ),
              ),
            );
          },
        );
      },
      uploadFile: (_UpLoadFile e) async {
        emit(
          state.copyWith(
            isFetching: true,
            failureOrSuccessOption: none(),
            fileUrl: [],
            fileOperationMode: FileOperationMode.upload,
          ),
        );
        final failureOrSuccessPermission =
            await poAttachmentRepository.getPermission(
          uploadOptionType: e.uploadOptionType,
        );
        await failureOrSuccessPermission.fold(
          (failure) async => emit(
            state.copyWith(
              failureOrSuccessOption: optionOf(failureOrSuccessPermission),
              isFetching: false,
            ),
          ),
          (_) async {
            final pickFilesFailureOrSuccess =
                await poAttachmentRepository.pickFiles(
              uploadOptionType: e.uploadOptionType,
              user: e.user,
              customerCodeInfo: e.customerCodeInfo,
              shipToInfo: e.shipToInfo,
            );
            await pickFilesFailureOrSuccess.fold(
              (failure) async => emit(
                state.copyWith(
                  failureOrSuccessOption: optionOf(pickFilesFailureOrSuccess),
                  isFetching: false,
                ),
              ),
              (files) async {
                if (files.isEmpty) {
                  emit(
                    state.copyWith(
                      isFetching: false,
                    ),
                  );

                  return;
                }
                emit(
                  state.copyWith(
                    fileUrl: files
                        .map(
                          (element) => PoDocuments.empty().copyWith(
                            name: element.name,
                          ),
                        )
                        .toList(),
                  ),
                );
                final uploadFilesFailureOrSuccess =
                    await poAttachmentRepository.uploadFiles(
                  salesOrg: e.salesOrg,
                  files: files,
                  shipToInfo: e.shipToInfo,
                  customerCodeInfo: e.customerCodeInfo,
                  user: e.user,
                  uploadedPODocument: e.uploadedPODocument,
                );
                uploadFilesFailureOrSuccess.fold(
                  (l) => emit(
                    state.copyWith(
                      failureOrSuccessOption:
                          optionOf(uploadFilesFailureOrSuccess),
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
          },
        );
      }, 
    );
  }
}

import 'package:universal_io/io.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_document_buffer.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/infrastructure/core/common/permission.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_file_safe/open_file_safe.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ezrxmobile/presentation/core/custom_expansion_tile.dart'
    as custom;
import 'package:permission_handler/permission_handler.dart';

class PoAttachment extends StatefulWidget {
  final PoAttachMentRenderMode poattachMentRenderMode;
  final List<PoDocuments> poDocuments;
  final List<PoDocuments> uploadingPocDocument;
  const PoAttachment({
    Key? key,
    required this.poDocuments,
    required this.poattachMentRenderMode,
    required this.uploadingPocDocument,
  }) : super(key: key);

  @override
  State<PoAttachment> createState() => _PoAttachmentState();
}

class _PoAttachmentState extends State<PoAttachment> {
  bool show = false;

  @override
  Widget build(BuildContext context) {
    final edit = widget.poattachMentRenderMode == PoAttachMentRenderMode.edit;

    if (widget.poDocuments.isEmpty &&
        !context.read<PoAttachmentBloc>().state.fileUploading) {
      return Container();
    }

    return custom.ExpansionTile(
      initiallyExpanded: true,
      key: const ValueKey('additionalComment'),
      title: Text(
        edit ? 'Uploaded Attachments'.tr() : 'Additional Comments'.tr(),
        style: const TextStyle(
          fontSize: 16.0,
          color: ZPColors.darkerGreen,
          fontWeight: FontWeight.w600,
        ),
      ),
      children: [
        BlocListener<PoAttachmentBloc, PoAttachmentState>(
          listenWhen: (previous, current) =>
              previous != current && current.fileDownloaing,
          listener: (context, state) async {
            state.failureOrSuccessOption.fold(
              () => {},
              (either) => either.fold(
                (failure) {
                  ErrorUtils.handleApiFailure(context, failure);
                },
                (r) async {
                  if (state.fileOperationhMode == FileOperationhMode.view) {
                    await openFile(
                      state.fileData.first,
                    );
                  } else {
                    await downloadAllFile(state.fileData);
                    
                  }
                },
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!edit)
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Uploaded Attachments'.tr(),
                      style: const TextStyle(
                        color: ZPColors.darkerGreen,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Column(children: [
                        ...widget.poDocuments
                            .sublist(0, listLength)
                            .map((poDocuments) {
                          return poDocuments.url.isEmpty
                              ? SizedBox(
                                  width: 40,
                                  child: LoadingShimmer.tile(),
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      key: Key(poDocuments.url),
                                      onTap: () async {
                                        context
                                            .read<PoAttachmentBloc>()
                                            .add(PoAttachmentEvent.downloadFile(
                                              files: [poDocuments],
                                              fetchMode:
                                                  FileOperationhMode.view,
                                            ));
                                      },
                                      child: _PoAttachmentWidget(
                                        key: ValueKey(poDocuments.name),
                                        poDocuments: poDocuments,
                                        edit: edit,
                                      ),
                                    ),
                                  ],
                                );
                        }).toList(),
                        ...context
                            .read<PoAttachmentBloc>()
                            .state
                            .uploadInProgressPoDocument
                            .map(
                              (e) => _PoAttachmentWidget(
                                key: ValueKey(
                                  'poAttachmentUploadInProgress ${e.name}',
                                ),
                                poDocuments: e,
                                edit: false,
                              ),
                            )
                            .toList(),
                      ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          widget.poDocuments.length > 2 && !show && !edit
                              ? InkWell(
                                  key: const Key('viewAll'),
                                  child: Text(
                                    'View All'.tr(),
                                    style: const TextStyle(
                                      color: ZPColors.darkerGreen,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      show = !show;
                                    });
                                  },
                                )
                              : const SizedBox.shrink(),
                          if (widget.poDocuments.isNotEmpty)
                            Column(
                              children: [
                                InkWell(
                                  key: const Key('downloadAll'),
                                  onTap: () async {
                                    if (defaultTargetPlatform ==
                                            TargetPlatform.android &&
                                        !(await locator<PermissionService>()
                                            .requeststoragePermission()
                                            .isGranted)) {
                                      showSnackBar(
                                        context: context,
                                        message:
                                            'Allow apps to access the storage'
                                                .tr(),
                                      );

                                      return;
                                    }
                                    if (!mounted) return;
                                    context.read<PoAttachmentBloc>().add(
                                          PoAttachmentEvent.downloadFile(
                                            files: widget.poDocuments,
                                            fetchMode:
                                                FileOperationhMode.download,
                                          ),
                                        );
                                  },
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.download,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Download All'.tr(),
                                        style: const TextStyle(
                                          color: ZPColors.darkerGreen,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (edit)
                                  const _PoUploadDeleteAll(
                                    key: ValueKey('deleteAll'),
                                  ),
                              ],
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> openFile(
    PoDocumentsBuffer orderHistoryDetailsPoDocumentsBuffer,
  ) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file =
        File('${appStorage.path}/${orderHistoryDetailsPoDocumentsBuffer.name}');
    await file.writeAsBytes(orderHistoryDetailsPoDocumentsBuffer.buffer);
    final result = await OpenFile.open(file.path);
    if (result.type != ResultType.done) {
      showSnackBar(
        context: context,
        message: result.message.tr(),
      );
    }
  }

  Future<String> getFilePath() async {
    if (Platform.isAndroid) {
      final directory = await getExternalStorageDirectory();

      return '${directory?.path.split('Android').first}Download';
    } else {
      final directory = await getApplicationDocumentsDirectory();
      
      return await directory.exists()
          ? directory.path
          : (await directory.create(recursive: true)).path;
    }
  }

  Future<void> downloadAllFile(
    List<PoDocumentsBuffer> orderHistoryDetailsPoDocumentsBuffers,
  ) async {
    try {
      for (final orderHistoryDetailsPoDocumentsBuffer
          in orderHistoryDetailsPoDocumentsBuffers) {
        final file = File(
          '${await getFilePath()}/${orderHistoryDetailsPoDocumentsBuffer.name}',
        );
        await file.writeAsBytes(orderHistoryDetailsPoDocumentsBuffer.buffer);
      }
      showSnackBar(
        context: context,
        message: 'All attachments downloaded successfully.'.tr(),
      );
    } catch (e) {
      showSnackBar(
        context: context,
        message: 'Some Thing Went Wrong'.tr(),
      );
    }
  }

  int get listLength {
    final listLen = widget.poDocuments.length;
    if (widget.poattachMentRenderMode == PoAttachMentRenderMode.edit) {
      return listLen;
    }

    return show
        ? listLen
        : listLen > 2
            ? 2
            : listLen;
  }
}

class _PoUploadDeleteIcon extends StatelessWidget {
  final PoDocuments poDocument;
  const _PoUploadDeleteIcon({
    Key? key,
    required this.poDocument,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: const ValueKey('poAttachementDeleteIcon'),
      onTap: () => context.read<AdditionalDetailsBloc>().add(
            AdditionalDetailsEvent.removePoDocument(
              poDocument: poDocument,
            ),
          ),
      child: const Icon(
        Icons.delete_outline_outlined,
        size: 18,
      ),
    );
  }
}

class _PoUploadDeleteAll extends StatelessWidget {
  const _PoUploadDeleteAll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<AdditionalDetailsBloc>().add(
              const AdditionalDetailsEvent.removeAllPoDocument(),
            );
      },
      child: Row(
        children: [
          const Icon(
            Icons.delete_outline,
            color: ZPColors.red,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            'Delete All'.tr(),
            style: const TextStyle(
              color: ZPColors.red,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}

enum PoAttachMentRenderMode { edit, view }

class PoAttachmentDownloadIndicator extends StatelessWidget {
  final PoDocuments poDocuments;

  const PoAttachmentDownloadIndicator({
    Key? key,
    required this.poDocuments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PoAttachmentBloc, PoAttachmentState>(
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching,
      builder: (context, state) {
        if (state.fileInOperation.any(
          (element) => element.name == poDocuments.name,
        )) {
          return Container(
            height: 8,
            width: 8,
            margin: const EdgeInsets.symmetric(
              horizontal: 6,
              vertical: 2,
            ),
            child: const CircularProgressIndicator(
              strokeWidth: 1,
            ),
          );
        }

        return Container(
          height: 8,
          width: 8,
          margin: const EdgeInsets.symmetric(
            horizontal: 6,
            vertical: 2,
          ),
          child: Transform.rotate(
            angle: -45,
            child: const Icon(
              Icons.attachment_outlined,
              size: 14,
            ),
          ),
        );
      },
    );
  }
}

class _PoAttachmentWidget extends StatelessWidget {
  final PoDocuments poDocuments;
  final bool edit;
  const _PoAttachmentWidget({
    Key? key,
    required this.poDocuments,
    required this.edit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 10.0,
        top: 2.0,
      ),
      child: RichText(
        text: TextSpan(
          children: [
            WidgetSpan(
              child: PoAttachmentDownloadIndicator(
                poDocuments: poDocuments,
              ),
            ),
            TextSpan(
              text: poDocuments.name,
              style: const TextStyle(
                color: ZPColors.darkerGreen,
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            if (edit)
              WidgetSpan(
                child: _PoUploadDeleteIcon(
                  poDocument: poDocuments,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

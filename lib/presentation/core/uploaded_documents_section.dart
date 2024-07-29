import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/domain/core/entities/po_documents.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UploadedDocumentsSection extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final Function(PoDocuments)? onDelete;
  final Function(PlatformFile)? onDeleteLocalFile;
  final bool isUploaded;
  const UploadedDocumentsSection._({
    required this.title,
    this.onDelete,
    this.onDeleteLocalFile,
    required this.isUploaded,
    this.titleStyle,
  });

  factory UploadedDocumentsSection.claim({
    required BuildContext context,
    Function(PlatformFile)? onDeleteLocalFile,
  }) {
    return UploadedDocumentsSection._(
      title: context.tr('Uploaded documents'),
      titleStyle: Theme.of(context)
          .textTheme
          .labelSmall
          ?.copyWith(fontWeight: FontWeight.w700),
      isUploaded: false,
      onDeleteLocalFile: onDeleteLocalFile,
    );
  }

  factory UploadedDocumentsSection.checkout({
    required BuildContext context,
    required Function(PoDocuments) onDelete,
  }) {
    return UploadedDocumentsSection._(
      title: '${context.tr('Attachments')}:',
      titleStyle: Theme.of(context).textTheme.bodyLarge,
      onDelete: onDelete,
      isUploaded: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PoAttachmentBloc, PoAttachmentState>(
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching ||
          (isUploaded && previous.fileUrl != current.fileUrl) ||
          (!isUploaded && previous.localFiles != current.localFiles),
      builder: (context, state) {
        if (isUploaded && state.fileUrl.isEmpty) return const SizedBox.shrink();
        if (!isUploaded && state.localFiles.isEmpty) {
          return const SizedBox.shrink();
        }

        return ListTile(
          key: WidgetKeys.attachmentsTileKey,
          contentPadding: EdgeInsets.zero,
          minVerticalPadding: 10,
          title: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              title,
              style: titleStyle,
            ),
          ),
          subtitle: state.isAttachmentUploaded
              ? LoadingShimmer.tile()
              : Column(
                  children: isUploaded
                      ? state.fileUrl
                          .map(
                            (e) => _UploadItem.remoteFile(
                              file: e,
                              onDelete: onDelete,
                            ),
                          )
                          .toList()
                      : state.localFiles
                          .map(
                            (e) => _UploadItem.localFile(
                              file: e,
                              onDeleteLocalFile: onDeleteLocalFile,
                            ),
                          )
                          .toList(),
                ),
        );
      },
    );
  }
}

class _UploadItem extends StatelessWidget {
  final PoDocuments? file;
  final PlatformFile? localFile;
  final Function(PoDocuments)? onDelete;
  final Function(PlatformFile)? onDeleteLocalFile;
  final bool isUploaded;

  const _UploadItem._({
    this.file,
    this.localFile,
    this.onDelete,
    this.onDeleteLocalFile,
    required this.isUploaded,
  });

  factory _UploadItem.remoteFile({
    required PoDocuments file,
    Function(PoDocuments)? onDelete,
  }) {
    return _UploadItem._(
      file: file,
      onDelete: onDelete,
      isUploaded: true,
    );
  }

  factory _UploadItem.localFile({
    required PlatformFile file,
    Function(PlatformFile)? onDeleteLocalFile,
  }) {
    return _UploadItem._(
      localFile: file,
      onDeleteLocalFile: onDeleteLocalFile,
      isUploaded: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      key: WidgetKeys.uploadDocumentItem,
      color: ZPColors.accentColor,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 2.0,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                (isUploaded ? file?.name : localFile?.name) ?? '',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.darkerGreen,
                    ),
              ),
            ),
            IconButton(
              key: WidgetKeys.uploadDocumentDeleteButton,
              icon: const Icon(
                Icons.delete_outline_outlined,
              ),
              padding: const EdgeInsets.all(0.0),
              onPressed: () {
                if (isUploaded && file != null) {
                  context.read<PoAttachmentBloc>().add(
                        PoAttachmentEvent.deleteFile(
                          file: file!,
                        ),
                      );
                  onDelete?.call(file!);
                }
                if (!isUploaded && localFile != null) {
                  context.read<PoAttachmentBloc>().add(
                        PoAttachmentEvent.deleteLocalFile(
                          file: localFile!,
                        ),
                      );
                  onDeleteLocalFile?.call(localFile!);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

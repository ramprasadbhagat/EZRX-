import 'package:flutter_svg/flutter_svg.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/presentation/core/custom_expansion_tile.dart'
    as custom;

import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';

import 'package:ezrxmobile/application/returns/request_return/request_return_bloc.dart';

class PoAttachment extends StatefulWidget {
  final PoAttachMentRenderMode poAttachMentRenderMode;
  final List<PoDocuments> poDocuments;
  final List<PoDocuments> uploadingPocDocument;
  final String uniqueId;
  const PoAttachment({
    Key? key,
    required this.poDocuments,
    required this.poAttachMentRenderMode,
    required this.uploadingPocDocument,
    this.uniqueId = '',
  }) : super(key: key);

  @override
  State<PoAttachment> createState() => _PoAttachmentState();
}

class _PoAttachmentState extends State<PoAttachment> {
  bool show = false;

  @override
  Widget build(BuildContext context) {
    final edit = widget.poAttachMentRenderMode == PoAttachMentRenderMode.edit;

    if (widget.poDocuments.isEmpty &&
        !context.read<PoAttachmentBloc>().state.fileUploading) {
      return const SizedBox.shrink();
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
              previous != current &&
              current.fileDownloading &&
              !current.isFetching,
          listener: (context, state) async {
            await state.failureOrSuccessOption.fold(
              () {
                if (state.isDownloadOperation) {
                  showSnackBar(
                    context: context,
                    message: 'All attachments downloaded successfully.'.tr(),
                  );
                }
              },
              (either) => either.fold(
                (failure) {
                  ErrorUtils.handleApiFailure(context, failure);
                },
                (_) async {},
              ),
            );
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!edit)
                Expanded(
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
                                          .add(PoAttachmentEvent.openFile(
                                            files: poDocuments,
                                          ));
                                    },
                                    child: _PoAttachmentWidget(
                                      key: ValueKey(poDocuments.name),
                                      poDocuments: poDocuments,
                                      edit: edit,
                                      uniqueId: widget.uniqueId,
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
                              uniqueId: widget.uniqueId,
                            ),
                          )
                          .toList(),
                    ]),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (!edit)
                          (widget.poDocuments.length > 2 && !show)
                              ? InkWell(
                                  key: const Key('viewAll'),
                                  child: Text(
                                    'View All'.tr(),
                                    style: const TextStyle(
                                      shadows: [
                                        Shadow(
                                          color: ZPColors.darkerGreen,
                                          offset: Offset(0, -2),
                                        ),
                                      ],
                                      color: Colors.transparent,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17.0,
                                      decoration: TextDecoration.underline,
                                      decorationColor: ZPColors.darkerGreen,
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      show = !show;
                                    });
                                  },
                                )
                              : const SizedBox.shrink(),
                        if (edit && widget.poDocuments.isNotEmpty)
                          _PoUploadDeleteAll(
                            key: const ValueKey('deleteAll'),
                            uniqueId: widget.uniqueId,
                          ),
                        if (widget.poDocuments.isNotEmpty)
                          InkWell(
                            key: const Key('downloadAll'),
                            onTap: () async {
                              context.read<PoAttachmentBloc>().add(
                                    PoAttachmentEvent.downloadFile(
                                      files: widget.poDocuments,
                                    ),
                                  );
                            },
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: SvgPicture.asset(
                                    'assets/svg/po_attachment_download.svg',
                                    height: 16,
                                    width: 16,
                                  ),
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  'Download All'.tr(),
                                  style: const TextStyle(
                                    shadows: [
                                      Shadow(
                                        color: ZPColors.darkerGreen,
                                        offset: Offset(0, -2),
                                      ),
                                    ],
                                    color: Colors.transparent,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0,
                                    decoration: TextDecoration.underline,
                                    decorationColor: ZPColors.darkerGreen,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  int get listLength {
    final listLen = widget.poDocuments.length;
    if (widget.poAttachMentRenderMode == PoAttachMentRenderMode.edit) {
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
  final String uniqueId;
  const _PoUploadDeleteIcon({
    Key? key,
    required this.poDocument,
    required this.uniqueId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: const ValueKey('poAttachementDeleteIcon'),
      onTap: () {
        if (uniqueId.isNotEmpty) {
          context
              .read<RequestReturnBloc>()
              .add(RequestReturnEvent.deleteAttachment(
                poDocuments: poDocument,
                uniqueId: uniqueId,
              ));
        } else {
          context
              .read<AdditionalDetailsBloc>()
              .add(AdditionalDetailsEvent.removePoDocument(
                poDocument: poDocument,
              ));
        }
      },
      child: const Icon(
        Icons.delete_outline_outlined,
        size: 18,
      ),
    );
  }
}

class _PoUploadDeleteAll extends StatelessWidget {
  final String uniqueId;
  const _PoUploadDeleteAll({
    Key? key,
    required this.uniqueId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (uniqueId.isNotEmpty) {
          context.read<RequestReturnBloc>().add(
                RequestReturnEvent.deleteAttachment(
                  poDocuments: PoDocuments.empty(),
                  uniqueId: uniqueId,
                ),
              );
        } else {
          context.read<AdditionalDetailsBloc>().add(
                const AdditionalDetailsEvent.removeAllPoDocument(),
              );
        }
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: SvgPicture.asset(
              'assets/svg/po_attachment_delete.svg',
              height: 16,
              width: 16,
            ),
          ),
          const SizedBox(
            width: 7,
          ),
          Text(
            'Delete All'.tr(),
            style: const TextStyle(
              shadows: [Shadow(color: ZPColors.red, offset: Offset(0, -2))],
              color: Colors.transparent,
              fontWeight: FontWeight.w600,
              fontSize: 16.0,
              decoration: TextDecoration.underline,
              decorationColor: ZPColors.red,
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
  final String uniqueId;
  const _PoAttachmentWidget({
    Key? key,
    required this.poDocuments,
    required this.edit,
    required this.uniqueId,
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
                  uniqueId: uniqueId,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

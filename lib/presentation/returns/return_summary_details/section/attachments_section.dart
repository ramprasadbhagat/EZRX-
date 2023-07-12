import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReturnSummaryDetailsAttachmentSection extends StatefulWidget {
  final List<PoDocuments> poDocuments;
  final AttachmentsUploadMode attachmentsUploadMode;
  final int keyFlex;
  final int valueFlex;

  const ReturnSummaryDetailsAttachmentSection({
    Key? key,
    this.keyFlex = 2,
    this.valueFlex = 3,
    required this.poDocuments,
    required this.attachmentsUploadMode,
  }) : super(key: key);

  @override
  State<ReturnSummaryDetailsAttachmentSection> createState() =>
      _ReturnSummaryDetailsAttachmentState();
}

class _ReturnSummaryDetailsAttachmentState
    extends State<ReturnSummaryDetailsAttachmentSection> {
  @override
  Widget build(BuildContext context) {
    if (widget.poDocuments.isEmpty) {
      return const SizedBox.shrink();
    }

    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        BlocListener<PoAttachmentBloc, PoAttachmentState>(
          listenWhen: (previous, current) =>
              previous != current &&
              current.fileDownloading &&
              !current.isFetching,
          listener: (context, state) {
            state.failureOrSuccessOption.fold(
              () => {},
              (either) => either.fold(
                (failure) {
                  ErrorUtils.handleApiFailure(context, failure);
                },
                (_) {},
              ),
            );
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: widget.keyFlex,
                child: Text(
                  widget.attachmentsUploadMode == AttachmentsUploadMode.user
                      ? 'Attachments '
                      : 'Attachments by approver ',
                  style: Theme.of(context).textTheme.titleSmall?.apply(
                        color: ZPColors.darkGray,
                      ),
                ).tr(),
              ),
              Expanded(
                flex: widget.valueFlex,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ': ',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          ...widget.poDocuments.map((poDocuments) {
                            return _ReturnSummaryAttachmentWidget(
                              poDocuments: poDocuments,
                            );
                          }).toList(),
                        ],
                      ),
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
}

class _ReturnSummaryAttachmentDownloadIndicator extends StatelessWidget {
  final PoDocuments poDocuments;

  const _ReturnSummaryAttachmentDownloadIndicator({
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

        return poDocuments.url.isNotEmpty
            ? Container(
                height: 8,
                width: 8,
                margin: const EdgeInsets.only(
                  right: 6,
                  top: 2,
                ),
                child: const Icon(
                  Icons.attach_file,
                  size: 14,
                  color: ZPColors.black,
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}

enum AttachmentsUploadMode { approver, user }

class _ReturnSummaryAttachmentWidget extends StatelessWidget {
  final PoDocuments poDocuments;

  const _ReturnSummaryAttachmentWidget({
    Key? key,
    required this.poDocuments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PoAttachmentBloc>().add(PoAttachmentEvent.openFile(
              files: poDocuments,
              attachmentType: AttachmentType.downloadAttachment,
            ));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ReturnSummaryAttachmentDownloadIndicator(
            poDocuments: poDocuments,
          ),
          Flexible(
            child: Text(
              poDocuments.name,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ],
      ),
    );
  }
}

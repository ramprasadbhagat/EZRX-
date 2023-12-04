import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';

import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';

import 'package:ezrxmobile/domain/utils/error_utils.dart';

import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';

class ViewByItemAttachmentSection extends StatelessWidget {
  const ViewByItemAttachmentSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            '${context.tr('Attachments')}:',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.white,
                ),
          ),
        ),
        Expanded(
          child: context
                  .read<ViewByItemDetailsBloc>()
                  .state
                  .orderHistoryItem
                  .orderHistoryItemPoAttachments
                  .isNotEmpty
              ? const _AttachmentsWithIcon()
              : Text(
                  context.tr('NA'),
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: ZPColors.white,
                      ),
                  key: WidgetKeys.viewByItemsOrderDetailsNoAttachments,
                ),
        ),
      ],
    );
  }
}

class _AttachmentsWithIcon extends StatelessWidget {
  const _AttachmentsWithIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<PoAttachmentBloc, PoAttachmentState>(
      listenWhen: (previous, current) =>
          previous != current && current.fileDownloading && !current.isFetching,
      listener: (context, state) {
        state.failureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              ErrorUtils.handleApiFailure(context, failure);
            },
            (_) => CustomSnackBar(
              messageText: 'Attachments downloaded successfully.',
            ).show(context),
          ),
        );
      },
      child: BlocBuilder<ViewByItemDetailsBloc, ViewByItemDetailsState>(
        buildWhen: (previous, current) =>
            previous.isExpanded != current.isExpanded,
        builder: (context, state) {
          return Column(
            children: [
              ...state.poDocumentsList
                  .map(
                    (e) => _AttachmentFile(document: e),
                  )
                  .toList(),
              if (state.displayShowMoreOrLess)
                InkWell(
                  key: WidgetKeys.viewByItemsOrderDetailsShowMoreAttachments,
                  onTap: () => context.read<ViewByItemDetailsBloc>().add(
                        ViewByItemDetailsEvent.updateIsExpanded(
                          isExpanded: !state.isExpanded,
                        ),
                      ),
                  child: Row(
                    children: [
                      Text(
                        state.isExpanded
                            ? context.tr('Show less')
                            : context.tr('Show more'),
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: ZPColors.attachmentColor,
                            ),
                      ),
                      Icon(
                        state.isExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: ZPColors.attachmentColor,
                      ),
                    ],
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _AttachmentFile extends StatelessWidget {
  final PoDocuments document;
  const _AttachmentFile({Key? key, required this.document}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: WidgetKeys.genericKey(key: '${document.name}DownloadButton'),
      onTap: () => context.read<PoAttachmentBloc>().add(
            PoAttachmentEvent.downloadFile(
              files: [document],
            ),
          ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5.0),
        child: Row(
          children: [
            Flexible(
              flex: 2,
              child: Text(
                document.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: ZPColors.white,
                    ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 5.0,
              ),
              child: Icon(
                Icons.cloud_download_outlined,
                color: ZPColors.attachmentColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

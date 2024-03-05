import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_request/details/return_details_by_request_bloc.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_attachment.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/widgets/return_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages

class RequestItemSection extends StatelessWidget {
  const RequestItemSection({
    Key? key,
    required this.returnDetailsByRequestState,
  }) : super(key: key);
  final ReturnDetailsByRequestState returnDetailsByRequestState;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReturnDetailsByRequestBloc,
        ReturnDetailsByRequestState>(
      listenWhen: (previous, current) =>
          previous.downloadedAttachment != current.downloadedAttachment &&
          current.downloadedAttachment != ReturnRequestAttachment.empty(),
      listener: (context, state) {
        state.downloadFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) => ErrorUtils.handleApiFailure(context, failure),
            (_) => CustomSnackBar(
              messageText: context.tr('The attachments downloaded successfully'),
            ).show(context),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: 16,
              ),
              child: Text(
                '${context.tr('Return items')} (${returnDetailsByRequestState.requestInformationHeader.totalItemCount})',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            ...returnDetailsByRequestState.requestInformation.mapIndexed(
              (index, item) => ReturnItemCard(
                key: WidgetKeys.returnRequestDetailMaterial(index),
                returnRequestInformation: item,
                downloadingAttachments:
                    returnDetailsByRequestState.downloadingAttachments,
                downloadAttachment: (attachment) =>
                    context.read<ReturnDetailsByRequestBloc>().add(
                          ReturnDetailsByRequestEvent.downloadFile(
                            file: attachment,
                          ),
                        ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

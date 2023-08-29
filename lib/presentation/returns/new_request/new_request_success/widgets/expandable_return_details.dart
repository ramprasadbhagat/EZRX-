part of 'package:ezrxmobile/presentation/returns/new_request/new_request_success/new_request_successful_page.dart';

class _ExpandableReturnDetail extends StatelessWidget {
  final ReturnItemDetails returnItemDetail;
  const _ExpandableReturnDetail({
    Key? key,
    required this.returnItemDetail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8.0),
        const Divider(
          indent: 0,
          thickness: 1,
          endIndent: 0,
          height: 1,
          color: ZPColors.extraLightGrey2,
        ),
        const SizedBox(height: 8.0),
        Text(
          'Return details'.tr(),
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
        ),
        const SizedBox(height: 8.0),
        BalanceTextRow(
          keyText: 'Reason'.tr(),
          keyFlex: 2,
          valueFlex: 3,
          valueText: context
              .read<UsageCodeBloc>()
              .state
              .getUsage(returnItemDetail.returnReason)
              .usageDescription,
          keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
          valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
        ),
        BalanceTextRow(
          keyText: 'Comments'.tr(),
          keyFlex: 2,
          valueFlex: 3,
          valueText: returnItemDetail.remarks.displayText,
          keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
          valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
        ),
        _UploadedFileList(uuid: returnItemDetail.uuid),
      ],
    );
  }
}

class _UploadedFileList extends StatelessWidget {
  const _UploadedFileList({
    Key? key,
    required this.uuid,
  }) : super(key: key);

  final String uuid;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewRequestBloc, NewRequestState>(
      buildWhen: (previous, current) =>
          previous.getReturnItemDetails(uuid).uploadedFiles !=
          current.getReturnItemDetails(uuid).uploadedFiles,
      builder: (context, state) {
        final uploadedFiles = state.getReturnItemDetails(uuid).uploadedFiles;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BalanceTextRow(
              keyText: 'Attachments'.tr(),
              keyFlex: 2,
              valueFlex: 3,
              valueText: uploadedFiles.isEmpty ? '-' : '',
              keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.neutralsBlack,
                  ),
              valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.neutralsBlack,
                  ),
            ),
            ...uploadedFiles
                .map(
                  (file) => BlocListener<ReturnRequestAttachmentBloc,
                      ReturnRequestAttachmentState>(
                    listenWhen: (previous, current) =>
                        previous != current && !current.isFetching,
                    listener: (context, state) =>
                        state.failureOrSuccessOption.fold(
                      () {},
                      (either) => either.fold(
                        (failure) =>
                            ErrorUtils.handleApiFailure(context, failure),
                        (success) => CustomSnackBar(
                          messageText:
                              'Attachments downloaded successfully.'.tr(),
                        ).show(context),
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(top: 8),
                      padding: const EdgeInsets.only(
                        left: 12,
                      ),
                      decoration: const BoxDecoration(
                        color: ZPColors.extraLightGray,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              '${file.name} - ${file.size.displayText}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: ZPColors.darkerGreen,
                                  ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.cloud_download_outlined),
                            padding: const EdgeInsets.all(0.0),
                            onPressed: () {
                              context.read<ReturnRequestAttachmentBloc>().add(
                                    ReturnRequestAttachmentEvent.downloadFile(
                                      file: file,
                                    ),
                                  );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ],
        );
      },
    );
  }
}

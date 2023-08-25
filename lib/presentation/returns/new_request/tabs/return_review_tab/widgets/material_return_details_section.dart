part of 'package:ezrxmobile/presentation/returns/new_request/tabs/return_review_tab/return_review_tab.dart';

class _MaterialReturnDetailsSection extends StatelessWidget {
  const _MaterialReturnDetailsSection({
    Key? key,
    required this.detail,
  }) : super(key: key);
  final ReturnItemDetails detail;

  @override
  Widget build(BuildContext context) {
    return ExpandableInfo(
      labelText: 'Return details'.tr(),
      child: Column(
        children: [
          BalanceTextRow(
            keyText: 'Reason'.tr(),
            keyTextStyle: Theme.of(context).textTheme.titleSmall,
            keyFlex: 2,
            valueFlex: 3,
            valueText: context
                .read<UsageCodeBloc>()
                .state
                .getUsage(detail.returnReason)
                .usageDescription,
          ),
          BalanceTextRow(
            keyText: 'Comments'.tr(),
            keyTextStyle: Theme.of(context).textTheme.titleSmall,
            keyFlex: 2,
            valueFlex: 3,
            valueText: detail.remarks.displayText,
          ),
          _UploadedFileList(
            uuid: detail.uuid,
          ),
        ],
      ),
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
              keyTextStyle: Theme.of(context).textTheme.titleSmall,
              keyFlex: 2,
              valueFlex: 3,
              valueText: uploadedFiles.isEmpty ? '-' : '',
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

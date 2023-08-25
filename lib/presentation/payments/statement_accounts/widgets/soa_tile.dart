part of '../statement_accounts.dart';

class _SoaTile extends StatelessWidget {
  const _SoaTile({
    Key? key,
    required this.soa,
  }) : super(key: key);
  final Soa soa;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DownloadPaymentAttachmentsBloc,
        DownloadPaymentAttachmentsState>(
      buildWhen: (previous, current) =>
          previous.isDownloadInProgress != current.isDownloadInProgress,
      builder: (context, state) {
        return Card(
          margin: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 5.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  soa.soaData.simpleDateString,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                TextButton.icon(
                  onPressed: state.isDownloadInProgress
                      ? null
                      : () =>
                          context.read<DownloadPaymentAttachmentsBloc>().add(
                                DownloadPaymentAttachmentEvent.downloadSOA(
                                  soaData: soa.soaData,
                                ),
                              ),
                  label: Text(
                    'Download'.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(color: ZPColors.extraDarkGreen),
                  ),
                  icon: state.isDownloadInProgress &&
                          SoaData(state.fileUrl.url) == soa.soaData
                      ? LoadingAnimationWidget.discreteCircle(
                          color: ZPColors.primary,
                          secondRingColor: ZPColors.secondary,
                          thirdRingColor: ZPColors.orange,
                          size: 18,
                        )
                      : const Icon(
                          Icons.cloud_download_outlined,
                          size: 20,
                          color: ZPColors.extraDarkGreen,
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

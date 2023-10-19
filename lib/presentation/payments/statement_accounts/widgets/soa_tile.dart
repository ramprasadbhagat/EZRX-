part of 'package:ezrxmobile/presentation/payments/statement_accounts/statement_accounts.dart';

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
                  key: WidgetKeys.soaItemTextKey,
                ),
                TextButton.icon(
                  key: WidgetKeys.genericKey(
                    key: 'soaDownloadButton#${soa.soaData.simpleDateString}',
                  ),
                  onPressed: state.isDownloadInProgress
                      ? null
                      : () {
                          trackMixpanelEvent(
                            MixpanelEvents.paymentDocumentViewed,
                          );
                          context.read<DownloadPaymentAttachmentsBloc>().add(
                                DownloadPaymentAttachmentEvent.downloadSOA(
                                  soaData: soa.soaData,
                                ),
                              );
                        },
                  label: Text(
                    context.tr('Download'),
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(color: ZPColors.extraDarkGreen),
                  ),
                  icon: state.isDownloadInProgress &&
                          SoaData(state.fileUrl.url) == soa.soaData
                      ? LoadingAnimationWidget.discreteCircle(
                          key: WidgetKeys.soaLoadingAnimationWidgetKey,
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

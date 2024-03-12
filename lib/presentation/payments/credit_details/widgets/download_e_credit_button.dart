part of 'package:ezrxmobile/presentation/payments/credit_details/credit_details.dart';

class _DownloadECreditButton extends StatelessWidget {
  final StringValue searchKey;
  const _DownloadECreditButton({required this.searchKey, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: BlocBuilder<DownloadPaymentAttachmentsBloc,
            DownloadPaymentAttachmentsState>(
          buildWhen: (previous, current) =>
              previous.isDownloadInProgress != current.isDownloadInProgress,
          builder: (context, state) {
            return OutlinedButton(
              key: WidgetKeys.downloadECreditButton,
              onPressed: state.isDownloadInProgress
                  ? null
                  : () => context.read<DownloadPaymentAttachmentsBloc>().add(
                        DownloadPaymentAttachmentEvent.downloadECredit(
                          eCredit: searchKey.getOrDefaultValue(''),
                        ),
                      ),
              child: state.isDownloadInProgress
                  ? LoadingAnimationWidget.discreteCircle(
                      key: WidgetKeys.downloadECreditLoadingAnimationWidget,
                      color: ZPColors.primary,
                      secondRingColor: ZPColors.secondary,
                      thirdRingColor: ZPColors.orange,
                      size: 18,
                    )
                  : Text(
                      context.tr('Download e-credit'),
                    ),
            );
          },
        ),
      ),
    );
  }
}

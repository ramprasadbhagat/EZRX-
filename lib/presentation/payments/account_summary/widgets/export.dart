part of 'package:ezrxmobile/presentation/payments/account_summary/account_summary_page.dart';

class _Export extends StatelessWidget {
  final bool isInvoiceTabActive;

  const _Export({
    Key? key,
    required this.isInvoiceTabActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<DownloadPaymentAttachmentsBloc,
        DownloadPaymentAttachmentsState>(
      listenWhen: (previous, current) =>
          previous.isDownloadInProgress != current.isDownloadInProgress,
      listener: (context, state) {
        state.failureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              ErrorUtils.handleApiFailure(context, failure);
            },
            (_) => CustomSnackBar(
              messageText: 'File downloaded successfully',
            ).show(context),
          ),
        );
      },
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: () => isInvoiceTabActive
            ? context.read<DownloadPaymentAttachmentsBloc>().add(
                  DownloadPaymentAttachmentEvent.fetchAllInvoiceUrl(
                    queryObject:
                        context.read<AllInvoicesBloc>().state.appliedFilter,
                  ),
                )
            : context.read<DownloadPaymentAttachmentsBloc>().add(
                  DownloadPaymentAttachmentEvent.fetchAllCreditUrl(
                    queryObject:
                        context.read<AllCreditsBloc>().state.appliedFilter,
                  ),
                ),
        color: ZPColors.primary,
        icon: const Icon(
          Icons.cloud_download_outlined,
        ),
      ),
    );
  }
}

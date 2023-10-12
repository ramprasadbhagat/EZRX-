part of '../payment_page.dart';

class _AccountStatement extends StatelessWidget {
  const _AccountStatement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<DownloadPaymentAttachmentsBloc,
        DownloadPaymentAttachmentsState>(
      listenWhen: (previous, current) =>
          previous.isDownloadInProgress != current.isDownloadInProgress &&
          !current.isDownloadInProgress,
      listener: (context, state) {
        state.failureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              ErrorUtils.handleApiFailure(context, failure);
            },
            (_) {
              CustomSnackBar(
                messageText: 'File downloaded successfully',
              ).show(context);
            },
          ),
        );
      },
      child: BlocBuilder<SoaBloc, SoaState>(
        buildWhen: (previous, current) => previous.soaList != current.soaList,
        builder: (context, state) {
          return Column(
            key: WidgetKeys.paymentHomeSoa,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTitle(
                title: 'Statement of accounts',
                onTapIconButton: () {
                  context
                      .read<SoaFilterBloc>()
                      .add(const SoaFilterEvent.initialized());
                  context.router.pushNamed('payments/statement_accounts');
                },
              ),
              state.soaList.isNotEmpty
                  ? Column(
                      children:
                          state.soaList.map((e) => _SoaCard(soa: e)).toList(),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        context.tr('No statements available'),
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: ZPColors.extraLightGrey4),
                      ),
                    ),
            ],
          );
        },
      ),
    );
  }
}

class _SoaCard extends StatelessWidget {
  final Soa soa;
  const _SoaCard({Key? key, required this.soa}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: WidgetKeys.itemStatementAccounts,
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      decoration: const BoxDecoration(
        color: ZPColors.accentColor,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(soa.soaData.simpleDateString),
          BlocBuilder<DownloadPaymentAttachmentsBloc,
              DownloadPaymentAttachmentsState>(
            buildWhen: (previous, current) =>
                previous.isDownloadInProgress != current.isDownloadInProgress,
            builder: (context, state) {
              return state.isDownloadInProgress &&
                      SoaData(state.fileUrl.url) == soa.soaData
                  ? LoadingAnimationWidget.discreteCircle(
                      color: ZPColors.primary,
                      secondRingColor: ZPColors.secondary,
                      thirdRingColor: ZPColors.orange,
                      size: 24,
                    )
                  : IconButton(
                      key: WidgetKeys.downloadStatementAccountIcon,
                      padding: const EdgeInsets.all(0),
                      constraints: const BoxConstraints(),
                      alignment: Alignment.centerRight,
                      color: ZPColors.primary,
                      icon: const Icon(
                        Icons.cloud_download_outlined,
                      ),
                      onPressed: () {
                        if (state.isDownloadInProgress) return;
                        context.read<DownloadPaymentAttachmentsBloc>().add(
                              DownloadPaymentAttachmentEvent.downloadSOA(
                                soaData: soa.soaData,
                              ),
                            );
                      },
                    );
            },
          ),
        ],
      ),
    );
  }
}

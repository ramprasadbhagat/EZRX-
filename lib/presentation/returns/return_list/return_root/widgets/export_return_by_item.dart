part of '../return_root.dart';

class _ExportReturnByItem extends StatelessWidget {
  const _ExportReturnByItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReturnListByItemBloc, ReturnListByItemState>(
      listenWhen: (previous, current) =>
          previous.isDownloadInProgress != current.isDownloadInProgress,
      listener: (context, state) => state.failureOrSuccessOption.fold(
        () {},
        (either) => either.fold(
          (failure) {
            ErrorUtils.handleApiFailure(context, failure);
          },
          (_) => CustomSnackBar(
            messageText: 'File downloaded successfully',
          ).show(context),
        ),
      ),
      buildWhen: (previous, current) =>
          previous.isDownloadInProgress != current.isDownloadInProgress,
      builder: (context, state) {
        return LoadingShimmer.withChild(
          enabled: state.isDownloadInProgress,
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () => context
                .read<ReturnListByItemBloc>()
                .add(const ReturnListByItemEvent.downloadFile()),
            color: ZPColors.primary,
            icon: const Icon(
              Icons.cloud_download_outlined,
            ),
          ),
        );
      },
    );
  }
}

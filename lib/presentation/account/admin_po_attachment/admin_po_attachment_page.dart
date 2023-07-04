import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/admin_po_attachment/admin_po_attachment_bloc.dart';
import 'package:ezrxmobile/application/admin_po_attachment/filter/admin_po_attachment_filter_bloc.dart';
import 'package:ezrxmobile/application/order/po_attachment/po_attachment_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/admin_po_attachment.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/account/admin_po_attachment/filter/admin_po_attachment_filter.dart';
import 'package:ezrxmobile/presentation/account/admin_po_attachment/admin_po_attachment_tile.dart';
import 'package:ezrxmobile/presentation/core/filter_icon.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminPoAttachmentPage extends StatelessWidget {
  AdminPoAttachmentPage({Key? key}) : super(key: key);
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('PO Attachments').tr(),
        toolbarHeight: kToolbarHeight + 2.0,
        actions: const <Widget>[SizedBox.shrink()],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder<AdminPoAttachmentBloc, AdminPoAttachmentState>(
                builder: (context, state) => _DownloadButton(state: state,),
              ),
              BlocBuilder<AdminPoAttachmentFilterBloc,
                  AdminPoAttachmentFilterState>(
                buildWhen: (previous, current) =>
                    previous.adminPoAttachmentFilter.appliedFilterCount !=
                    current.adminPoAttachmentFilter.appliedFilterCount,
                builder: (context, state) => FilterCountButton(
                  key: const Key('adminPoAttachmentFilterCount'),
                  filterCount: state.adminPoAttachmentFilter.appliedFilterCount,
                  onTap: () => scaffoldKey.currentState!.openEndDrawer(),
                ),
              ),
            ],
          ),
        ),
      ),
      endDrawer: const AdminPoAttachmentFilterDrawer(),
      body: BlocListener<AdminPoAttachmentFilterBloc,
          AdminPoAttachmentFilterState>(
        key: const Key('po_attachment_page'),
        listenWhen: (previous, current) =>
            previous.isSubmitting != current.isSubmitting &&
                current.isSubmitting ||
            !scaffoldKey.currentState!.isEndDrawerOpen,
        listener: (context, state) => context.read<AdminPoAttachmentBloc>().add(
              AdminPoAttachmentEvent.fetch(
                adminPoAttachmentFilter: state.adminPoAttachmentFilter,
              ),
            ),
        child: BlocConsumer<AdminPoAttachmentBloc, AdminPoAttachmentState>(
          listenWhen: (previous, current) =>
              previous.failureOrSuccessOption != current.failureOrSuccessOption,
          listener: (context, state) => state.failureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) {
                ErrorUtils.handleApiFailure(context, failure);
              },
              (_) {},
            ),
          ),
          buildWhen: (previous, current) =>
              previous.isFetching != current.isFetching ||
              previous.adminPoAttachmentList != current.adminPoAttachmentList,
          builder: (context, state) {
            return LoadingShimmer.withChild(
              enabled: state.isFetching && state.adminPoAttachmentList.isEmpty,
              child: BlocListener<PoAttachmentBloc, PoAttachmentState>(
                listenWhen: (previous, current) =>
                    previous != current &&
                    current.fileDownloading &&
                    !current.isFetching,
                listener: (context, state) => state.failureOrSuccessOption.fold(
                  () {
                    if (state.isDownloadOperation) {
                      showSnackBar(
                        context: context,
                        message: 'Attachments downloaded successfully.'.tr(),
                      );
                    }
                  },
                  (either) => either.fold(
                    (failure) {
                      ErrorUtils.handleApiFailure(context, failure);
                    },
                    (_) {},
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _HeaderMessage(),
                    _BodyContent(
                      state: state,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _DownloadButton extends StatelessWidget {
  const _DownloadButton({
    Key? key,
    required this.state,
  }) : super(key: key);
  final AdminPoAttachmentState state;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: state.canDownload
          ? () {
              final selectedPoDocuments =
                  state.selectedItems.map((e) => e.pooDocuments).toList();
              if (selectedPoDocuments.isEmpty) return;
              context.read<PoAttachmentBloc>().add(
                    PoAttachmentEvent.downloadFile(
                      files: selectedPoDocuments,
                    ),
                  );
            }
          : null,
      child: const Text('Download').tr(),
    );
  }
}

class _HeaderMessage extends StatelessWidget {
  const _HeaderMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.info_outline_rounded,
            color: ZPColors.darkerGreen,
            size: 18,
          ),
          Expanded(
            child: Text(
              'Only 15 items can be download at time'.tr(),
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BodyContent extends StatelessWidget {
  const _BodyContent({Key? key, required this.state}) : super(key: key);
  final AdminPoAttachmentState state;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ScrollList<AdminPoAttachment>(
        key: const Key('adminPoAttachment'),
        noRecordFoundWidget: const NoRecordFound(title: 'No Attachment found'),
        controller: ScrollController(),
        onRefresh: () {
          context.read<AdminPoAttachmentBloc>().add(
                AdminPoAttachmentEvent.fetch(
                  adminPoAttachmentFilter: context
                      .read<AdminPoAttachmentFilterBloc>()
                      .state
                      .adminPoAttachmentFilter,
                ),
              );
          context.read<AdminPoAttachmentFilterBloc>().add(
                const AdminPoAttachmentFilterEvent.initialized(),
              );
        },
        isLoading: state.isFetching,
        onLoadingMore: () => context.read<AdminPoAttachmentBloc>().add(
              AdminPoAttachmentEvent.loadMore(
                adminPoAttachmentFilter: context
                    .read<AdminPoAttachmentFilterBloc>()
                    .state
                    .adminPoAttachmentFilter,
              ),
            ),
        itemBuilder: (context, index, item) => AdminPoAttachmentTile(
          adminPoAttachment: item,
        ),
        items: state.adminPoAttachmentList,
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/returns/return_summary_details/return_summary_details_bloc.dart';
import 'package:ezrxmobile/domain/returns/entities/return_request_attachment.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/returns/return_summary_by_item_details/widgets/return_summary_details_section.dart';
import 'package:ezrxmobile/presentation/returns/widgets/return_item_card.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';

import 'package:ezrxmobile/presentation/core/widget_keys.dart';

class ReturnRequestSummaryByItemDetails extends StatelessWidget {
  const ReturnRequestSummaryByItemDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.commonAppBar(
        title: Text(
          context.tr('Return item details'),
        ),
        customerBlockedOrSuspended:
            context.read<EligibilityBloc>().state.customerBlockOrSuspended,
      ),
      body: BlocConsumer<ReturnSummaryDetailsBloc, ReturnSummaryDetailsState>(
        listenWhen: (previous, current) =>
            previous.isLoading != current.isLoading ||
            (previous.downloadedAttachment != current.downloadedAttachment &&
                current.downloadedAttachment !=
                    ReturnRequestAttachment.empty()),
        listener: (context, state) {
          state.failureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) {
                ErrorUtils.handleApiFailure(context, failure);
              },
              (_) {},
            ),
          );

          state.downloadFailureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) => ErrorUtils.handleApiFailure(context, failure),
              (_) => CustomSnackBar(
                messageText: 'The attachments downloaded successfully',
              ).show(context),
            ),
          );
        },
        buildWhen: (previous, current) =>
            previous.isLoading != current.isLoading ||
            previous.downloadingAttachments != current.downloadingAttachments,
        builder: (context, state) {
          return AnnouncementBanner(
            currentPath: context.router.currentPath,
            child: state.isLoading
                ? Align(
                    alignment: Alignment.center,
                    child: LoadingShimmer.logo(
                      key: WidgetKeys.loaderImage,
                    ),
                  )
                : ListView(
                    key: WidgetKeys.scrollList,
                    children: [
                      ReturnSummaryDetailsSection(
                        requestInformation: state.requestInformation,
                        requestInformationHeader:
                            state.requestInformationHeader,
                      ),
                      const Divider(
                        indent: 0,
                        height: 20,
                        endIndent: 0,
                        color: ZPColors.lightGray2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: ReturnItemCard(
                          returnRequestInformation: state.requestInformation,
                          downloadingAttachments: state.downloadingAttachments,
                          downloadAttachment: (attachment) =>
                              context.read<ReturnSummaryDetailsBloc>().add(
                                    ReturnSummaryDetailsEvent.downloadFile(
                                      file: attachment,
                                    ),
                                  ),
                        ),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}

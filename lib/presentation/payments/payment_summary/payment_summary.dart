//ignore_for_file: unused-code

//ignore_for_file: unused-class

//ignore_for_file: unused-files
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';

import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/payments/payment_summary/payment_summary_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/application/payments/payment_summary/payment_summary_bloc.dart';

import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';

import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';

import 'package:ezrxmobile/application/payments/download_payment_attachments/download_payment_attachments_bloc.dart';

import 'package:ezrxmobile/presentation/core/snackbar.dart';

import 'package:ezrxmobile/domain/payments/entities/payment_summary_group.dart';

import 'package:ezrxmobile/presentation/core/search_bar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:ezrxmobile/presentation/theme/colors.dart';

class PaymentSummaryPage extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  PaymentSummaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        key: const ValueKey('paymentSummaryAppBar'),
        title: const Text(
          'Payment Summary',
        ).tr(),
        actions: const [
          _PaymentSummaryActionWidget(),
        ],
      ),
      body: BlocConsumer<PaymentSummaryBloc, PaymentSummaryState>(
        listenWhen: (previous, current) =>
            previous.failureOrSuccessOption != current.failureOrSuccessOption,
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
        },
        buildWhen: (previous, current) =>
            previous.isFetching != current.isFetching,
        builder: (context, state) {
          return AnnouncementBanner(
            currentPath: context.router.currentPath,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: SearchBar(
                          onSearchChanged: (String value) {},
                          clearIconKey: WidgetKeys.clearIconKey,
                          controller: TextEditingController(),
                          onClear: () {},
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (_) {
                              return const SizedBox.shrink();
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.tune,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: _PaymentSummaryScrollList(
                    state: state,
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

class _PaymentSummaryActionWidget extends StatelessWidget {
  const _PaymentSummaryActionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DownloadPaymentAttachmentsBloc,
        DownloadPaymentAttachmentsState>(
      listenWhen: (previous, current) =>
          previous.failureOrSuccessOption != current.failureOrSuccessOption,
      buildWhen: (previous, current) =>
          previous.isDownloadInProgress != current.isDownloadInProgress,
      listener: (context, state) {
        state.failureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              ErrorUtils.handleApiFailure(context, failure);
            },
            (_) {
              showSnackBar(
                context: context,
                message: 'File downloaded successfully'.tr(),
              );
            },
          ),
        );
      },
      builder: (context, state) {
        return state.isDownloadInProgress
            ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: LoadingAnimationWidget.discreteCircle(
                  color: ZPColors.primary,
                  secondRingColor: ZPColors.secondary,
                  thirdRingColor: ZPColors.orange,
                  size: 20,
                ),
              )
            : IconButton(
                onPressed: state.isDownloadInProgress
                    ? null
                    : () {
                        final eligibilityState =
                            context.read<EligibilityBloc>().state;
                        context.read<DownloadPaymentAttachmentsBloc>().add(
                              DownloadPaymentAttachmentEvent
                                  .fetchPaymentSummaryUrl(
                                salesOrganization:
                                    eligibilityState.salesOrganisation,
                                customerCodeInfo:
                                    eligibilityState.customerCodeInfo,
                              ),
                            );
                      },
                icon: const Icon(Icons.download_outlined),
              );
      },
    );
  }
}

class _PaymentSummaryScrollList extends StatelessWidget {
  const _PaymentSummaryScrollList({
    Key? key,
    required this.state,
  }) : super(key: key);

  final PaymentSummaryState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ScrollList<PaymentSummaryGroup>(
            emptyMessage: 'No Payment Summary Found'.tr(),
            controller: ScrollController(),
            onRefresh: () => context.read<PaymentSummaryBloc>().add(
                  PaymentSummaryEvent.fetchPaymentSummaryList(
                    salesOrganization:
                        context.read<EligibilityBloc>().state.salesOrganisation,
                    customerCodeInfo:
                        context.read<EligibilityBloc>().state.customerCodeInfo,
                  ),
                ),
            onLoadingMore: () => context.read<PaymentSummaryBloc>().add(
                  PaymentSummaryEvent.loadMorePaymentSummary(
                    salesOrganization:
                        context.read<EligibilityBloc>().state.salesOrganisation,
                    customerCodeInfo:
                        context.read<EligibilityBloc>().state.customerCodeInfo,
                  ),
                ),
            isLoading: state.isFetching,
            itemBuilder: (context, index, itemInfo) {
              return PaymentSummaryGroupSection(
                paymentSummaryGroup: itemInfo,
                showDivider: index != 0,
              );
            },
            items: state.paymentSummaryList.getPaymentSummaryGroupList,
          ),
        ),
      ],
    );
  }
}

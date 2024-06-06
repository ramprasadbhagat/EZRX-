import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/returns/approver_actions/filter/return_approver_filter_bloc.dart';
import 'package:ezrxmobile/application/returns/approver_actions/return_approver_bloc.dart';
import 'package:ezrxmobile/domain/returns/entities/request_information.dart';
import 'package:ezrxmobile/domain/returns/entities/return_approver_filter.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';

import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/filter_icon.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/returns/approver_actions/filter_drawer.dart';
import 'package:ezrxmobile/presentation/returns/approver_actions/filter_status.dart';
import 'package:ezrxmobile/presentation/returns/approver_actions/return_request_tile.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApproverActions extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  ApproverActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        key: const ValueKey('actionApproverAppBar'),
        title: const Text(
          'Approver Actions',
        ).tr(),
        actions: const [SizedBox.shrink()],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30.0),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: BlocBuilder<EligibilityBloc, EligibilityState>(
              buildWhen: (previous, current) =>
                  previous.haveShipTo != current.haveShipTo,
              builder: (context, state) {
                return state.haveShipTo
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GestureDetector(
                            key: const Key('statusFilterButton'),
                            onTap: () {
                              if (context
                                  .read<ReturnApproverBloc>()
                                  .state
                                  .isFetching) return;
                              showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (_) {
                                  return const ApproverReturnStatusFilterBottomSheet();
                                },
                              );
                            },
                            child: BlocBuilder<ReturnApproverFilterBloc,
                                ReturnApproverFilterState>(
                              buildWhen: (previous, current) =>
                                  previous.activeSort != current.activeSort,
                              builder: (context, state) {
                                return Row(
                                  children: <Widget>[
                                    Text(
                                      "${context.tr('Status')} : ${state.activeSort.sortLabel.tr()}",
                                      key: const ValueKey('status'),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.apply(
                                            color: ZPColors.kPrimaryColor,
                                          ),
                                    ),
                                    const Icon(
                                      Icons.arrow_drop_down_outlined,
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          BlocBuilder<ReturnApproverFilterBloc,
                              ReturnApproverFilterState>(
                            buildWhen: (previous, current) =>
                                previous
                                    .approverReturnFilter.appliedFilterCount !=
                                current.approverReturnFilter.appliedFilterCount,
                            builder: (context, state) {
                              return FilterCountButton(
                                filterCount: state
                                    .approverReturnFilter.appliedFilterCount,
                                onTap: () {
                                  if (context
                                      .read<ReturnApproverBloc>()
                                      .state
                                      .isFetching) return;
                                  scaffoldKey.currentState!.openEndDrawer();
                                },
                              );
                            },
                          ),
                        ],
                      )
                    : const SizedBox.shrink();
              },
            ),
          ),
        ),
      ),
      endDrawer: const ApproverReturnFilterDrawer(),
      body: BlocListener<ReturnApproverFilterBloc, ReturnApproverFilterState>(
        listenWhen: (previous, current) =>
            (previous.isSubmitting != current.isSubmitting &&
                    current.anyFilterApplied ||
                !scaffoldKey.currentState!.isEndDrawerOpen) ||
            current.activeSort != previous.activeSort,
        listener: (context, state) {
          final eligibilityState = context.read<EligibilityBloc>().state;
          if (eligibilityState.haveCustomerCodeInfos &&
              eligibilityState.haveShipToInfos) {
            context.read<ReturnApproverBloc>().add(
                  ReturnApproverEvent.fetch(
                    user: eligibilityState.user,
                    approverReturnFilter: context
                        .read<ReturnApproverFilterBloc>()
                        .state
                        .approverReturnFilter,
                  ),
                );
          }
        },
        child: BlocConsumer<ReturnApproverBloc, ReturnApproverState>(
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
              child: _ApproverReturnRequestScrollList(
                state: state,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _ApproverReturnRequestScrollList extends StatelessWidget {
  const _ApproverReturnRequestScrollList({
    required this.state,
  });

  final ReturnApproverState state;

  @override
  Widget build(BuildContext context) {
    return ScrollList<RequestInformation>(
      noRecordFoundWidget: const NoRecordFound(title: 'No Return found'),
      controller: ScrollController(),
      onRefresh: () {
        if (!context.read<EligibilityBloc>().state.haveShipTo) {
          return;
        }
        final returnApproverFilterBloc =
            context.read<ReturnApproverFilterBloc>();
        returnApproverFilterBloc.add(
          const ReturnApproverFilterEvent.initialized(),
        );
        context.read<ReturnApproverBloc>().add(
              ReturnApproverEvent.fetch(
                user: context.read<EligibilityBloc>().state.user,
                approverReturnFilter: ReturnApproverFilter.empty().copyWith(
                  sortBy: returnApproverFilterBloc.state.activeSort,
                ),
              ),
            );
      },
      onLoadingMore: () {
        context.read<ReturnApproverBloc>().add(
              ReturnApproverEvent.loadMore(
                user: context.read<EligibilityBloc>().state.user,
                approverReturnFilter: context
                    .read<ReturnApproverFilterBloc>()
                    .state
                    .approverReturnFilter,
              ),
            );
      },
      isLoading: state.isFetching,
      itemBuilder: (context, index, itemInfo) {
        return ApproverReturnRequestTile(
          approverReturnRequest: itemInfo,
        );
      },
      items: state.approverReturnRequestList,
    );
  }
}

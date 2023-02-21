import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/returns/approver_actions/filter/return_approver_filter_bloc.dart';
import 'package:ezrxmobile/application/returns/approver_actions/return_approver_bloc.dart';
import 'package:ezrxmobile/domain/returns/entities/approver_return_request.dart';
import 'package:ezrxmobile/domain/returns/entities/return_approver_filter.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/returns/approver_actions/filter_drawer.dart';
import 'package:ezrxmobile/presentation/returns/approver_actions/filter_status.dart';
import 'package:ezrxmobile/presentation/returns/approver_actions/return_request_tile.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApproverActions extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  ApproverActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    locator<CountlyService>().recordCountlyView('approver_actions');
    const radius = 8.0;

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
            child: BlocBuilder<ShipToCodeBloc, ShipToCodeState>(
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
                                  return const ApproverReturnStatusFilterBottomShttet();
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
                                      "${'Status'.tr()} : ${state.activeSort.label.tr()}",
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
                          GestureDetector(
                            key: const Key('filterButton'),
                            onTap: () {
                              if (context
                                  .read<ReturnApproverBloc>()
                                  .state
                                  .isFetching) return;
                              scaffoldKey.currentState!.openEndDrawer();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  'Filter'.tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.apply(
                                        color: ZPColors.kPrimaryColor,
                                      ),
                                ).tr(),
                                Stack(
                                  children: <Widget>[
                                    const Icon(
                                      Icons.filter_alt_outlined,
                                      color: ZPColors.kPrimaryColor,
                                      size: 16,
                                    ),
                                    BlocBuilder<ReturnApproverFilterBloc,
                                        ReturnApproverFilterState>(
                                      buildWhen: (previous, current) =>
                                          previous.approverReturnFilter !=
                                          current.approverReturnFilter,
                                      builder: (context, state) {
                                        if (state.anyFilterApplied) {
                                          return Positioned(
                                            key: const ValueKey(
                                              'Filter_list_not_empty',
                                            ),
                                            right: 0,
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: ZPColors.kPrimaryColor,
                                              ),
                                              width: radius,
                                              height: radius,
                                            ),
                                          );
                                        }

                                        return const SizedBox.shrink();
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
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
          final hasCustomerCodeInfo = context
              .read<CustomerCodeBloc>()
              .state
              .customerCodeInfo
              .customerCodeSoldTo
              .isNotEmpty;
          final hasShipToInfo = context
              .read<ShipToCodeBloc>()
              .state
              .shipToInfo
              .shipToCustomerCode
              .isNotEmpty;
          if (hasCustomerCodeInfo && hasShipToInfo) {
            context.read<ReturnApproverBloc>().add(
                  ReturnApproverEvent.fetch(
                    user: context.read<EligibilityBloc>().state.user,
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
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: ScrollList<ApproverReturnRequest>(
                    emptyMessage: 'No Return found'.tr(),
                    onRefresh: () {
                      if (!context.read<ShipToCodeBloc>().state.haveShipTo) {
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
                              approverReturnFilter:
                                  ReturnApproverFilter.empty().copyWith(
                                sortBy:
                                    returnApproverFilterBloc.state.activeSort,
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
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

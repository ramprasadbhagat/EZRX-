import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/returns/policy_configuration/policy_configuration_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/policy_configuration.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';

import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/custom_search_bar.dart';
import 'package:ezrxmobile/presentation/core/custom_slidable.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';

import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';

import 'package:ezrxmobile/presentation/core/widget_keys.dart';

class PolicyConfigurationPage extends StatelessWidget {
  const PolicyConfigurationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.commonAppBar(
        title: const _PolicyConfigurationSearch(),
        customerBlockedOrSuspended:
            context.read<EligibilityBloc>().state.customerBlockOrSuspended,
      ),
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child: BlocConsumer<PolicyConfigurationBloc, PolicyConfigurationState>(
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
              previous.isLoading != current.isLoading,
          builder: (context, policyConfigurationState) {
            if (policyConfigurationState.isLoading &&
                policyConfigurationState.policyConfigurationList.isEmpty) {
              return LoadingShimmer.logo(
                key: WidgetKeys.policyConfigurationLoader,
              );
            }

            return _PolicyConfigurationScrollList(
              policyConfigurationState: policyConfigurationState,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.router.push(const AddPolicyConfigurationRoute());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _PolicyConfigurationScrollList extends StatelessWidget {
  const _PolicyConfigurationScrollList({
    Key? key,
    required this.policyConfigurationState,
  }) : super(key: key);

  final PolicyConfigurationState policyConfigurationState;

  @override
  Widget build(BuildContext context) {
    return ScrollList<PolicyConfiguration>(
      noRecordFoundWidget:
          const NoRecordFound(title: 'No Policy Configurations found'),
      controller: ScrollController(),
      onRefresh: () {
        context.read<PolicyConfigurationBloc>().add(
              PolicyConfigurationEvent.fetch(
                salesOrganisation:
                    context.read<EligibilityBloc>().state.salesOrganisation,
                searchKey: '',
              ),
            );
      },
      onLoadingMore: () => context.read<PolicyConfigurationBloc>().add(
            PolicyConfigurationEvent.loadMorePolicyConfigurations(
              salesOrganisation:
                  context.read<EligibilityBloc>().state.salesOrganisation,
            ),
          ),
      isLoading: policyConfigurationState.isLoading,
      itemBuilder: (context, index, item) => PolicyConfigurationListItem(
        policyConfigurationItem: item,
      ),
      items: policyConfigurationState.policyConfigurationList,
    );
  }
}

class PolicyConfigurationListItem extends StatelessWidget {
  const PolicyConfigurationListItem({
    Key? key,
    required this.policyConfigurationItem,
  }) : super(key: key);

  final PolicyConfiguration policyConfigurationItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: CustomSlidable(
        endActionPaneActions: [
          CustomSlidableAction(
            label: 'Delete'.tr(),
            icon: Icons.delete_outline,
            onPressed: (context) {
              context.read<PolicyConfigurationBloc>().add(
                    PolicyConfigurationEvent.delete(
                      policyConfigurationItem: policyConfigurationItem,
                    ),
                  );
            },
          ),
        ],
        borderRadius: 8,
        child: ListTile(
          onTap: () {},
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      '${'Sales Org'.tr()}: ${policyConfigurationItem.salesOrg.getOrCrash()}',
                      style: Theme.of(context).textTheme.titleSmall?.apply(
                            color: ZPColors.black,
                          ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: policyConfigurationItem.returnsAllowed.labelColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Text(
                      '${'Returns Allowed'.tr()}: ${policyConfigurationItem.returnsAllowed.display.tr()}',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              Text(
                '${'Principal Code'.tr()}: ${policyConfigurationItem.principalCode.getOrDefaultValue('')}',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(
                '${'Principal Name'.tr()}: ${policyConfigurationItem.principalName.name.tr()}',
                style: Theme.of(context).textTheme.titleSmall?.apply(
                      color: ZPColors.lightGray,
                    ),
              ),
              Text(
                '${'Months Before Expiry'.tr()}: ${policyConfigurationItem.getmonthsBeforeExpiryValue}',
                style: Theme.of(context).textTheme.titleSmall?.apply(
                      color: ZPColors.lightGray,
                    ),
              ),
              Text(
                '${'Months After Expiry'.tr()}: ${policyConfigurationItem.getmonthsAfterExpiryExpiryValue}',
                style: Theme.of(context).textTheme.titleSmall?.apply(
                      color: ZPColors.lightGray,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PolicyConfigurationSearch extends StatelessWidget {
  const _PolicyConfigurationSearch({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PolicyConfigurationBloc, PolicyConfigurationState>(
      key: WidgetKeys.policyConfigSearchBuilder,
      buildWhen: (previous, current) => previous.searchKey != current.searchKey,
      builder: (context, state) {
        return CustomSearchBar(
          key: WidgetKeys.policyConfigurationSearch(
            state.searchKey.searchValueOrEmpty,
          ),
          customValidator: (value) => SearchKey.searchFilter(value).isValid(),
          initialValue: state.searchKey.searchValueOrEmpty,
          enabled: !state.isLoading,
          onSearchChanged: (value) {
            final salesOrganisation =
                context.read<EligibilityBloc>().state.salesOrganisation;
            context.read<PolicyConfigurationBloc>().add(
                  PolicyConfigurationEvent.search(
                    salesOrganisation: salesOrganisation,
                    searchKey: value,
                  ),
                );
          },
          onSearchSubmitted: (value) =>
              context.read<PolicyConfigurationBloc>().add(
                    PolicyConfigurationEvent.search(
                      salesOrganisation: context
                          .read<EligibilityBloc>()
                          .state
                          .salesOrganisation,
                      searchKey: value,
                    ),
                  ),
          onClear: () => context.read<PolicyConfigurationBloc>().add(
                PolicyConfigurationEvent.search(
                  salesOrganisation:
                      context.read<EligibilityBloc>().state.salesOrganisation,
                  searchKey: '',
                ),
              ),
        );
      },
    );
  }
}

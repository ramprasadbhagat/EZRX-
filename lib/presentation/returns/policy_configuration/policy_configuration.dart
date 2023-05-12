import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/returns/policy_configuration/policy_configuration_bloc.dart';
import 'package:ezrxmobile/domain/returns/entities/policy_configuration.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';

import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/custom_slidable.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';

import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';

class PolicyConfigurationPage extends StatelessWidget {
  const PolicyConfigurationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: CustomAppBar(child: _PolicyConfigurationSearch()),
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
                key: const Key('LoaderImage'),
              );
            }

            return ScrollList<PolicyConfiguration>(
              emptyMessage: 'No Policy Configurations found'.tr(),
              onRefresh: () {
                context.read<PolicyConfigurationBloc>().add(
                      PolicyConfigurationEvent.fetch(
                        salesOrganisation: context
                            .read<SalesOrgBloc>()
                            .state
                            .salesOrganisation,
                        searchKey: '',
                      ),
                    );
              },
              onLoadingMore: () => context.read<PolicyConfigurationBloc>().add(
                    PolicyConfigurationEvent.loadMorePolicyConfigurations(
                      salesOrganisation:
                          context.read<SalesOrgBloc>().state.salesOrganisation,
                    ),
                  ),
              isLoading: policyConfigurationState.isLoading,
              itemBuilder: (context, index, item) =>
                  PolicyConfigurationListItem(
                policyConfigurationItem: item,
              ),
              items: policyConfigurationState.policyConfigurationList,
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

class _PolicyConfigurationSearch extends StatefulWidget {
  const _PolicyConfigurationSearch({Key? key}) : super(key: key);
  @override
  State<_PolicyConfigurationSearch> createState() =>
      _PolicyConfigurationSearchState();
}

class _PolicyConfigurationSearchState
    extends State<_PolicyConfigurationSearch> {
  final _policyConfigSearchController = TextEditingController();

  @override
  void dispose() {
    _policyConfigSearchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PolicyConfigurationBloc, PolicyConfigurationState>(
      key: const Key('policyConfigSearchBuilder'),
      buildWhen: (previous, current) => previous.searchKey != current.searchKey,
      builder: (context, state) {
        _policyConfigSearchController.text =
            state.searchKey.getOrDefaultValue('');

        return TextFormField(
          controller: _policyConfigSearchController,
          key: Key(
            'policyConfigurationSearch${state.searchKey.getOrDefaultValue('')}',
          ),
          onFieldSubmitted: (value) {
            context
                .read<PolicyConfigurationBloc>()
                .add(PolicyConfigurationEvent.fetch(
                  salesOrganisation:
                      context.read<SalesOrgBloc>().state.salesOrganisation,
                  searchKey: value,
                ));
          },
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            suffixIcon: IconButton(
              key: const Key('clearPolicyConfigurationSearch'),
              icon: const Icon(Icons.clear),
              onPressed: () {
                if (_policyConfigSearchController.text.isEmpty) return;
                _policyConfigSearchController.clear();
                context
                    .read<PolicyConfigurationBloc>()
                    .add(PolicyConfigurationEvent.fetch(
                      salesOrganisation:
                          context.read<SalesOrgBloc>().state.salesOrganisation,
                      searchKey: '',
                    ));
              },
            ),
            hintText: 'Search...'.tr(),
            border: InputBorder.none,
          ),
        );
      },
    );
  }
}

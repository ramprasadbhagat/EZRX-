import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/returns/policy_configuration/policy_configuration_bloc.dart';
import 'package:ezrxmobile/domain/returns/entities/policy_configuration.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/custom_slidable.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';

class PolicyConfigurationPage extends StatelessWidget {
  const PolicyConfigurationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    locator<CountlyService>().recordCountlyView('policy_configuration');

    return Scaffold(
      appBar: AppBar(title: const Text('Policy Configuration').tr()),
      body: BlocConsumer<PolicyConfigurationBloc,
          PolicyConfigurationState>(
        listenWhen: (previous, current) {
          return previous.failureOrSuccessOption !=
                  current.failureOrSuccessOption ||
              (previous.isLoading != current.isLoading);
        },
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
            previous.isLoading != current.isLoading ||
            previous.policyConfigurationList != current.policyConfigurationList,
        builder: (context, policyConfigurationState) {
          if (policyConfigurationState.isLoading) {
            return LoadingShimmer.logo(
              key: const Key('LoaderImage'),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ScrollList<PolicyConfiguration>(
                  emptyMessage: 'No Policy Configurations found',
                  onRefresh: () {
                    context.read<PolicyConfigurationBloc>().add(
                          PolicyConfigurationEvent.fetch(
                            salesOrganisation: context
                                .read<SalesOrgBloc>()
                                .state
                                .salesOrganisation,
                          ),
                        );
                  },
                  isLoading: policyConfigurationState.isLoading,
                  itemBuilder: (context, index, item) =>
                      PolicyConfigurationListItem(
                    policyConfigurationItem: item,
                  ),
                  items: policyConfigurationState.policyConfigurationList,
                ),
              ),
            ],
          );
        },
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
                  Expanded(
                    flex: 1,
                    child: Text(
                      '${'Sales Org'.tr()}: ${policyConfigurationItem.salesOrg}',
                      style: Theme.of(context).textTheme.subtitle2?.apply(
                            color: ZPColors.black,
                          ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 4,
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color:
                            policyConfigurationItem.returnsAllowed.labelColor,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: Text(
                        '${'Returns Alllowed'.tr()}: ${policyConfigurationItem.returnsAllowed.display.tr()}',
                        style: const TextStyle(
                          color: ZPColors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                '${'Principal Code'.tr()}: ${policyConfigurationItem.principalCode.getOrDefaultValue('')}',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                '${'Principal Name'.tr()}: ${policyConfigurationItem.principalName.name}',
                style: Theme.of(context).textTheme.subtitle2?.apply(
                      color: ZPColors.lightGray,
                    ),
              ),
              Text(
                '${'Months Before Expiry'.tr()}: ${policyConfigurationItem.monthsBeforeExpiry}',
                style: Theme.of(context).textTheme.bodyText1?.apply(
                      color: ZPColors.lightGray,
                    ),
              ),
              Text(
                '${'Months After Expiry'.tr()}: ${policyConfigurationItem.monthsAfterExpiry}',
                style: Theme.of(context).textTheme.bodyText1?.apply(
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

import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/returns/policy_configuration_list/policy_configuration_list_bloc.dart';
import 'package:ezrxmobile/domain/returns/entities/policy_configuration.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';

class PolicyConfiguration extends StatelessWidget {
  const PolicyConfiguration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    locator<CountlyService>().recordCountlyView('policy_configuration');

    return Scaffold(
      appBar: AppBar(title: const Text('Policy Configuration').tr()),
      body: BlocConsumer<PolicyConfigurationListBloc,
          PolicyConfigurationListState>(
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
                child: ScrollList<PolicyConfigurationList>(
                  emptyMessage: 'No Policy Configurations found',
                  onRefresh: () {
                    context.read<PolicyConfigurationListBloc>().add(
                          PolicyConfigurationListEvent.fetch(
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
                    policyConfigurationList: item,
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
    required this.policyConfigurationList,
  }) : super(key: key);

  final PolicyConfigurationList policyConfigurationList;

  @override
  Widget build(BuildContext context) {
    return Card(
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
                    '${'Sales Org'.tr()}: ${policyConfigurationList.salesOrg}',
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
                      color: policyConfigurationList.returnsAllowed
                          ? ZPColors.lightSecondary
                          : ZPColors.lightRed,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    child: Text(
                      '${'Returns Alllowed'.tr()}: ${policyConfigurationList.returnsAllowed ? 'Yes'.tr() : 'No'.tr()}',
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
              '${'Principal Code'.tr()}: ${policyConfigurationList.principalCode}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              '${'Principal Name'.tr()}: ${policyConfigurationList.principalName}',
              style: Theme.of(context).textTheme.subtitle2?.apply(
                    color: ZPColors.lightGray,
                  ),
            ),
            Text(
              '${'Months Before Expiry'.tr()}: ${policyConfigurationList.monthsBeforeExpiry}',
              style: Theme.of(context).textTheme.bodyText1?.apply(
                    color: ZPColors.lightGray,
                  ),
            ),
            Text(
              '${'Months After Expiry'.tr()}: ${policyConfigurationList.monthsAfterExpiry}',
              style: Theme.of(context).textTheme.bodyText1?.apply(
                    color: ZPColors.lightGray,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/presentation/core/custom_search_bar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SalesOrgSearch extends StatelessWidget {
  const SalesOrgSearch({
    Key? key,
    required this.avialableSalesOrgList,
  }) : super(key: key);
  final List<SalesOrganisation> avialableSalesOrgList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.tr('Select sales org'),
        ),
        centerTitle: false,
      ),
      body: BlocBuilder<SalesOrgBloc, SalesOrgState>(
        buildWhen: (previous, current) =>
            previous.isLoading != current.isLoading ||
            previous.salesOrgFailureOrSuccessOption !=
                current.salesOrgFailureOrSuccessOption ||
            previous.searchKey != current.searchKey,
        builder: (context, state) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: CustomSearchBar(
                  key: WidgetKeys.genericKey(
                    key: state.searchKey.searchValueOrEmpty,
                  ),
                  autofocus: true,
                  initialValue: state.searchKey.getOrDefaultValue(''),
                  enabled: !state.isLoading,
                  onSearchChanged: (value) => context.read<SalesOrgBloc>().add(
                        SalesOrgEvent.searchSalesOrg(
                          salesOrgList: avialableSalesOrgList,
                          searchKey: SearchKey.search(value),
                        ),
                      ),
                  onClear: () => context.read<SalesOrgBloc>().add(
                        SalesOrgEvent.searchSalesOrg(
                          salesOrgList: avialableSalesOrgList,
                          searchKey: SearchKey.search(''),
                        ),
                      ),
                  customValidator: (value) => true,
                  onSearchSubmitted: (value) {},
                  hintText: 'Search sales org name or code',
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  itemCount: state.availableSalesOrg.length,
                  itemBuilder: (
                    context,
                    index,
                  ) {
                    return _SalesOrgItem(
                      showDivider: index != 0,
                      salesOrganisation: state.availableSalesOrg[index],
                      key: WidgetKeys.genericKey(
                        key: state.availableSalesOrg[index].salesOrg
                            .getOrDefaultValue(''),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _SalesOrgItem extends StatelessWidget {
  const _SalesOrgItem({
    Key? key,
    required this.showDivider,
    required this.salesOrganisation,
  }) : super(key: key);
  final bool showDivider;
  final SalesOrganisation salesOrganisation;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (showDivider)
          const Divider(
            indent: 0,
            endIndent: 0,
            color: ZPColors.lightGray2,
          ),
        ListTile(
          key: WidgetKeys.salesOrgSearchOption(
            salesOrganisation.salesOrg.getOrDefaultValue(''),
          ),
          onTap: () {
            trackMixpanelEvent(
              TrackingEvents.salesOrgSave,
              props: {
                TrackingProps.salesOrg:
                    salesOrganisation.salesOrg.getOrDefaultValue(''),
              },
            );
            context.read<SalesOrgBloc>().add(
                  SalesOrgEvent.selected(
                    salesOrganisation: salesOrganisation,
                  ),
                );
            context.read<EligibilityBloc>().add(
                  EligibilityEvent.selectedCustomerCode(
                    customerCodeInfo: CustomerCodeInfo.empty(),
                    shipToInfo: ShipToInfo.empty(),
                  ),
                );
            context.router.pop();
          },
          contentPadding: EdgeInsets.zero,
          leading: ClipOval(
            child: SizedBox(
              height: 25.0,
              width: 25.0,
              child: SvgPicture.asset(
                salesOrganisation.salesOrg.countryFlag,
                fit: BoxFit.fill,
              ),
            ),
          ),
          title: Text(
            salesOrganisation.salesOrg.buName,
            style: Theme.of(context).textTheme.labelMedium,
          ).tr(),
          trailing: Text(
            salesOrganisation.salesOrg.getOrDefaultValue(''),
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: ZPColors.primary),
          ).tr(),
        ),
      ],
    );
  }
}

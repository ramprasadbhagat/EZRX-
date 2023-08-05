import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/presentation/core/search_bar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SalesOrgSearch extends StatelessWidget {
  SalesOrgSearch({
    Key? key,
    required this.avialableSalesOrgList,
  }) : super(key: key);
  final List<SalesOrganisation> avialableSalesOrgList;
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select sales org'.tr(),
        ),
        centerTitle: false,
      ),
      body: BlocBuilder<SalesOrgBloc, SalesOrgState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: SearchBar(
                  onSearchChanged: (String value) {
                    context.read<SalesOrgBloc>().add(
                          SalesOrgEvent.searchSalesOrg(
                            salesOrgList: avialableSalesOrgList,
                            keyWord: value,
                          ),
                        );
                  },
                  clearIconKey: WidgetKeys.salesOrgSearch,
                  controller: _searchController,
                  onClear: () {
                    _searchController.clear();
                    context.read<SalesOrgBloc>().add(
                          SalesOrgEvent.searchSalesOrg(
                            salesOrgList: avialableSalesOrgList,
                            keyWord: '',
                          ),
                        );
                  },
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
          onTap: () {
            context.read<SalesOrgBloc>().add(
                  SalesOrgEvent.selected(
                    salesOrganisation: salesOrganisation,
                  ),
                );
            context.router.pop();
          },
          contentPadding: EdgeInsets.zero,
          leading: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(25.0)),
            child: SizedBox(
              height: 25.0,
              width: 25.0,
              child: SvgPicture.asset(
                'assets/svg/flags/${salesOrganisation.salesOrg.country.toLowerCase()}.svg',
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

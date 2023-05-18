import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/covid_material_list/covid_material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';

import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/presentation/core/search_bar.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CovidMaterialListSearchBar extends StatefulWidget {
  const CovidMaterialListSearchBar({Key? key}) : super(key: key);

  @override
  State<CovidMaterialListSearchBar> createState() =>
      CovidMaterialListSearchBarState();
}

class CovidMaterialListSearchBarState
    extends State<CovidMaterialListSearchBar> {
  late TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      height: 50,
      color: ZPColors.white,
      child: BlocBuilder<CovidMaterialListBloc, CovidMaterialListState>(
        buildWhen: (previous, current) =>
            previous.searchKey != current.searchKey ||
            previous.isFetching != current.isFetching,
        builder: (context, state) {
          _searchController.text = state.searchKey.getOrDefaultValue('');

          return SearchBar(
            key: Key('covidMaterialSearchField${_searchController.text}'),
            controller: _searchController,
            enabled: !state.isFetching,
            onSearchSubmitted: (value) {
              context.read<CovidMaterialListBloc>().add(
                    CovidMaterialListEvent.searchMaterialList(
                      user: context.read<UserBloc>().state.user,
                      salesOrganisation:
                          context.read<SalesOrgBloc>().state.salesOrganisation,
                      configs: context.read<SalesOrgBloc>().state.configs,
                      customerCodeInfo: context
                          .read<CustomerCodeBloc>()
                          .state
                          .customerCodeInfo,
                      shipToInfo:
                          context.read<ShipToCodeBloc>().state.shipToInfo,
                      selectedMaterialFilter: context
                          .read<MaterialFilterBloc>()
                          .state
                          .selectedMaterialFilter,
                      pickAndPack: context
                          .read<EligibilityBloc>()
                          .state
                          .getPNPValueMaterial,
                    ),
                  );
              trackMixpanelEvent(
                MixpanelEvents.productSearch,
                props: {
                  MixpanelProps.searchKey: value,
                },
              );
            },
            suffixIconKey: const Key('clearSearch'),
            customValidator: () =>
                SearchKey.search(_searchController.text).isValid(),
            isDense: true,
            onClear: () {
              //To reset the filters
              context.read<MaterialFilterBloc>().add(
                    const MaterialFilterEvent.clearSelected(),
                  );

              context.read<CovidMaterialListBloc>().add(
                    const CovidMaterialListEvent.updateSearchKey(
                      searchKey: '',
                    ),
                  );
              // fetch code goes here
              context.read<CovidMaterialListBloc>().add(
                    CovidMaterialListEvent.fetch(
                      user: context.read<UserBloc>().state.user,
                      salesOrganisation:
                          context.read<SalesOrgBloc>().state.salesOrganisation,
                      configs: context.read<SalesOrgBloc>().state.configs,
                      customerCodeInfo: context
                          .read<CustomerCodeBloc>()
                          .state
                          .customerCodeInfo,
                      shipToInfo:
                          context.read<ShipToCodeBloc>().state.shipToInfo,
                      pickAndPack: context
                          .read<EligibilityBloc>()
                          .state
                          .getPNPValueMaterial,
                    ),
                  );
            },
          );
        },
      ),
    );
  }
}

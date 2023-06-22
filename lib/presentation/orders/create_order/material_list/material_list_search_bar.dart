import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/domain/banner/entities/banner.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';

import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/search_bar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialListSearchBar extends StatefulWidget {
  const MaterialListSearchBar({Key? key}) : super(key: key);

  @override
  State<MaterialListSearchBar> createState() => MaterialListSearchBarState();
}

class MaterialListSearchBarState extends State<MaterialListSearchBar> {
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
      child: BlocBuilder<MaterialListBloc, MaterialListState>(
        buildWhen: (previous, current) =>
            previous.searchKey != current.searchKey ||
            previous.isFetching != current.isFetching,
        builder: (context, state) {
          _searchController.text = state.searchKey.getOrDefaultValue('');

          return SearchBar(
            key: WidgetKeys.materialSearchField(_searchController.text),
            controller: _searchController,
            enabled: !state.isFetching,
            onSearchChanged: (value) {
              _resetMixpanelOrderFlow();
              // auto search code goes here
              context.read<MaterialListBloc>().add(
                    MaterialListEvent.autoSearchMaterialList(
                      user: context.read<UserBloc>().state.user,
                      salesOrganisation:
                          context.read<SalesOrgBloc>().state.salesOrganisation,
                      configs: context.read<SalesOrgBloc>().state.configs,
                      customerCodeInfo: context
                          .read<CustomerCodeBloc>()
                          .state
                          .customerCodeInfo,
                      shipToInfo:
                          context.read<CustomerCodeBloc>().state.shipToInfo,
                      selectedMaterialFilter: context
                          .read<MaterialFilterBloc>()
                          .state
                          .selectedMaterialFilter,
                      pickAndPack: context
                          .read<EligibilityBloc>()
                          .state
                          .getPNPValueMaterial,
                      searchKey: SearchKey(value),
                    ),
                  );
              trackMixpanelEvent(
                MixpanelEvents.productSearch,
                props: {
                  MixpanelProps.searchKey:
                      state.searchKey.getOrDefaultValue(''),
                },
              );
            },
            onSearchSubmitted: (value) {
              _resetMixpanelOrderFlow();
              // search code goes here
              context.read<MaterialListBloc>().add(
                    MaterialListEvent.searchMaterialList(
                      user: context.read<UserBloc>().state.user,
                      salesOrganisation:
                          context.read<SalesOrgBloc>().state.salesOrganisation,
                      configs: context.read<SalesOrgBloc>().state.configs,
                      customerCodeInfo: context
                          .read<CustomerCodeBloc>()
                          .state
                          .customerCodeInfo,
                      shipToInfo:
                          context.read<CustomerCodeBloc>().state.shipToInfo,
                      selectedMaterialFilter: context
                          .read<MaterialFilterBloc>()
                          .state
                          .selectedMaterialFilter,
                      pickAndPack: context
                          .read<EligibilityBloc>()
                          .state
                          .getPNPValueMaterial,
                      searchKey: SearchKey(value),
                    ),
                  );
              trackMixpanelEvent(
                MixpanelEvents.productSearch,
                props: {
                  MixpanelProps.searchKey:
                      state.searchKey.getOrDefaultValue(''),
                },
              );
            },
            isDense: true,
            customValidator: () =>
                SearchKey.search(_searchController.text).isValid(),
            clearIconKey: WidgetKeys.clearMaterialListSearchBar,
            onClear: () {
              _resetMixpanelOrderFlow();
              //To reset the filters
              context.read<MaterialFilterBloc>().add(
                    const MaterialFilterEvent.clearSelected(),
                  );
              if (_searchController.text.isEmpty) return;
              _searchController.clear();
              // fetch code goes here
              context
                  .read<MaterialListBloc>()
                  .add(MaterialListEvent.deletedSearchMaterialList(
                    user: context.read<UserBloc>().state.user,
                    salesOrganisation:
                        context.read<SalesOrgBloc>().state.salesOrganisation,
                    configs: context.read<SalesOrgBloc>().state.configs,
                    customerCodeInfo:
                        context.read<CustomerCodeBloc>().state.customerCodeInfo,
                    shipToInfo:
                        context.read<CustomerCodeBloc>().state.shipToInfo,
                    selectedMaterialFilter: context
                        .read<MaterialFilterBloc>()
                        .state
                        .getEmptyMaterialFilter(),
                    orderDocumentType: context
                        .read<OrderDocumentTypeBloc>()
                        .state
                        .selectedOrderType,
                    pickAndPack: context
                        .read<EligibilityBloc>()
                        .state
                        .getPNPValueMaterial,
                    searchKey: SearchKey(''),
                  ));
            },
          );
        },
      ),
    );
  }

  void _resetMixpanelOrderFlow() {
    final mixpanelService = locator<MixpanelService>();
    if (mixpanelService.banner != BannerItem.empty()) {
      mixpanelService.resetBannerOrderFlow();
    }
  }
}

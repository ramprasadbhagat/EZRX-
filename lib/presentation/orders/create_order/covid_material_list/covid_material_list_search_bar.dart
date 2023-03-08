import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/covid_material_list/covid_material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
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

          return Form(
            child: TextFormField(
              key: Key('covidMaterialSearchField${_searchController.text}'),
              autocorrect: false,
              controller: _searchController,
              enabled: !state.isFetching,
              onFieldSubmitted: (value) {
                if (value.length > 2) {
                  // search code goes here
                  context.read<CovidMaterialListBloc>().add(
                        CovidMaterialListEvent.searchMaterialList(
                          user: context.read<UserBloc>().state.user,
                          salesOrganisation: context
                              .read<SalesOrgBloc>()
                              .state
                              .salesOrganisation,
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
                  locator<CountlyService>().addCountlyEvent(
                    'Product Search',
                    segmentation: {
                      'searchKeyWord': value,
                      'numResults': state.materialList.length,
                      'selectedSalesOrg': context
                          .read<SalesOrgBloc>()
                          .state
                          .salesOrganisation
                          .salesOrg
                          .getOrDefaultValue(''),
                      'selectedCustomerCode': context
                          .read<CustomerCodeBloc>()
                          .state
                          .customerCodeInfo
                          .customerCodeSoldTo,
                      'selectedShipToAddress': context
                          .read<ShipToCodeBloc>()
                          .state
                          .shipToInfo
                          .shipToCustomerCode,
                    },
                  );
                } else {
                  showSnackBar(
                    context: context,
                    message:
                        'Search input must be greater than 2 characters.'.tr(),
                  );
                }
              },
              decoration: InputDecoration(
                isDense: true,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  key: const Key('clearSearch'),
                  icon: const Icon(Icons.clear),
                  onPressed: () {
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
                            salesOrganisation: context
                                .read<SalesOrgBloc>()
                                .state
                                .salesOrganisation,
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
                ),
                hintText: 'Search...'.tr(),
              ),
            ),
          );
        },
      ),
    );
  }
}

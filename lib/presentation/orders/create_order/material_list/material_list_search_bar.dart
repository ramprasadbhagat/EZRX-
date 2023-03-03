import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
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
    final searchText = context.read<MaterialListBloc>().state.searchKey;
    if (searchText.isValid()) {
      _searchController.value = TextEditingValue(
        text: searchText.getOrCrash(),
        selection: TextSelection.collapsed(
          offset: _searchController.selection.base.offset,
        ),
      );
      context.read<MaterialListBloc>().add(
            MaterialListEvent.searchMaterialList(
              user: context.read<UserBloc>().state.user,
              salesOrganisation:
                  context.read<SalesOrgBloc>().state.salesOrganisation,
              configs: context.read<SalesOrgBloc>().state.configs,
              customerCodeInfo:
                  context.read<CustomerCodeBloc>().state.customerCodeInfo,
              shipToInfo: context.read<ShipToCodeBloc>().state.shipToInfo,
              selectedMaterialFilter: context
                  .read<MaterialFilterBloc>()
                  .state
                  .selectedMaterialFilter,
              pickAndPack:
                  context.read<EligibilityBloc>().state.getPNPValueMaterial,
            ),
          );
    }
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
      child: BlocConsumer<MaterialListBloc, MaterialListState>(
        listenWhen: (previous, current) =>
            previous.searchKey != current.searchKey,
        listener: (context, state) {
          final searchText = state.searchKey.getValue();
          _searchController.value = TextEditingValue(
            text: searchText,
            selection: TextSelection.collapsed(
              offset: _searchController.selection.base.offset,
            ),
          );
        },
        buildWhen: (previous, current) =>
            previous.searchKey != current.searchKey ||
            previous.isFetching != current.isFetching,
        builder: (context, state) {
          return Form(
            child: TextFormField(
              key: const Key('materialSearchField'),
              autocorrect: false,
              controller: _searchController,
              enabled: !state.isFetching,
              onChanged: (value) {
                context.read<MaterialListBloc>().add(
                      MaterialListEvent.updateSearchKey(searchKey: value),
                    );
              },
              onFieldSubmitted: (value) {
                if (state.searchKey.isValid()) {
                  // search code goes here
                  context.read<MaterialListBloc>().add(
                        MaterialListEvent.searchMaterialList(
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
                      'searchKeyWord': state.searchKey.getOrCrash(),
                      'numResults': state.materialList.length,
                      'selectedSalesOrg': context
                          .read<SalesOrgBloc>()
                          .state
                          .salesOrganisation
                          .salesOrg
                          .getOrCrash(),
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
              validator: (_) => state.searchKey.value.fold(
                (f) => f.maybeMap(
                  subceedLength: (f) =>
                      'Search input must be greater than 2 characters.'.tr(),
                  orElse: () => null,
                ),
                (_) => null,
              ),
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

                    context.read<MaterialListBloc>().add(
                          const MaterialListEvent.updateSearchKey(
                            searchKey: '',
                          ),
                        );
                    // fetch code goes here
                    context
                        .read<MaterialListBloc>()
                        .add(MaterialListEvent.fetch(
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
                              .getEmptyMaterialFilter(),
                          orderDocumentType: context
                              .read<OrderDocumentTypeBloc>()
                              .state
                              .selectedOrderType,
                          pickAndPack: context
                              .read<EligibilityBloc>()
                              .state
                              .getPNPValueMaterial,
                        ));
                  },
                ),
                hintText: 'Search...'.tr(),
                // border: InputBorder.none,
              ),
            ),
          );
        },
      ),
    );
  }
}

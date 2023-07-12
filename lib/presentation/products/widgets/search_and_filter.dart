import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/presentation/products/material_filter_page.dart';
import 'package:ezrxmobile/presentation/products/product_search_entry.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchAndFilter extends StatefulWidget {
  const SearchAndFilter({Key? key}) : super(key: key);

  @override
  State<SearchAndFilter> createState() => _SearchAndFilterState();
}

class _SearchAndFilterState extends State<SearchAndFilter> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 24.0),
      child: Row(
        children: [
          const Expanded(
            child: ProductSearchEntry(),
          ),
          const SizedBox(
            width: 8,
          ),
          BlocBuilder<MaterialListBloc, MaterialListState>(
            buildWhen: (previous, current) =>
                previous.selectedMaterialFilter !=
                current.selectedMaterialFilter,
            builder: (context, state) {
              return IconButton(
                onPressed: () {
                  _showFilterPage();
                },
                icon: state.selectedMaterialFilter == MaterialFilter.empty()
                    ? const Icon(
                        Icons.tune_outlined,
                        color: ZPColors.primary,
                        size: 20,
                      )
                    : Stack(
                        children: [
                          const Icon(
                            Icons.tune_outlined,
                            color: ZPColors.primary,
                            size: 20,
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: ZPColors.orange,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _showFilterPage() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      isDismissible: false,
      useSafeArea: true,
      builder: (_) {
        return const MaterialFilterSheet();
      },
    ).then((value) {
      if (value != null) {
        if (value is MaterialFilter) {
          if (context
                      .read<MaterialListBloc>()
                      .state
                      .selectedMaterialFilter
                      .isFavourite !=
                  value.isFavourite ||
              context
                      .read<MaterialListBloc>()
                      .state
                      .selectedMaterialFilter
                      .bundleOffers !=
                  value.bundleOffers ||
              context
                      .read<MaterialListBloc>()
                      .state
                      .selectedMaterialFilter
                      .manufactureListSelected !=
                  value.manufactureListSelected ||
              context
                      .read<MaterialListBloc>()
                      .state
                      .selectedMaterialFilter
                      .countryListSelected !=
                  value.countryListSelected) {
            context.read<MaterialListBloc>().add(
                  MaterialListEvent.fetch(
                    salesOrganisation:
                        context.read<SalesOrgBloc>().state.salesOrganisation,
                    configs: context.read<SalesOrgBloc>().state.configs,
                    customerCodeInfo:
                        context.read<CustomerCodeBloc>().state.customerCodeInfo,
                    shipToInfo:
                        context.read<CustomerCodeBloc>().state.shipToInfo,
                    selectedMaterialFilter: value,
                  ),
                );
          }
        }
      }
    });
  }
}

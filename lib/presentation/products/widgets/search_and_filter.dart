import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/presentation/products/product_filter/product_filter_page.dart';
import 'package:ezrxmobile/presentation/products/product_search_entry.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchAndFilter extends StatelessWidget {
  const SearchAndFilter({Key? key}) : super(key: key);

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
                onPressed: () => _showFilterPage(context),
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

  void _showFilterPage(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      isDismissible: false,
      useSafeArea: true,
      builder: (_) => const ProductFilterPage(),
    ).then((value) {
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
                value.countryListSelected ||
            context
                    .read<MaterialListBloc>()
                    .state
                    .selectedMaterialFilter
                    .isProductOffer !=
                value.isProductOffer ||
            context
                    .read<MaterialListBloc>()
                    .state
                    .selectedMaterialFilter
                    .sortBy !=
                value.sortBy) {
          context.read<MaterialListBloc>().add(
                MaterialListEvent.fetch(
                  salesOrganisation:
                      context.read<EligibilityBloc>().state.salesOrganisation,
                  configs:
                      context.read<EligibilityBloc>().state.salesOrgConfigs,
                  customerCodeInfo:
                      context.read<EligibilityBloc>().state.customerCodeInfo,
                  shipToInfo: context.read<EligibilityBloc>().state.shipToInfo,
                  selectedMaterialFilter: value,
                ),
              );
        }
      }
    });
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/orders/create_order/material_filter_search.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialFilterPage extends StatelessWidget {
  final MaterialFilterType filterType;

  const MaterialFilterPage({
    Key? key,
    required this.filterType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MaterialFilterBloc, MaterialFilterState>(
      listenWhen: (previous, current) =>
          previous.apiFailureOrSuccessOption !=
          current.apiFailureOrSuccessOption,
      listener: (context, state) {
        state.apiFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              ErrorUtils.handleApiFailure(context, failure);
            },
            (_) {},
          ),
        );
      },
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async {
            context.read<MaterialListBloc>().state.searchKey.isValid()
                ? context.read<MaterialListBloc>().add(
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
                    )
                : context.read<MaterialListBloc>().state.selectedFilters !=
                        context
                            .read<MaterialFilterBloc>()
                            .state
                            .selectedMaterialFilter
                    ? context.read<MaterialListBloc>().add(
                          MaterialListEvent.fetch(
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
                            orderDocumentType: context
                                .read<OrderDocumentTypeBloc>()
                                .state
                                .selectedOrderType,
                            pickAndPack: context
                                .read<EligibilityBloc>()
                                .state
                                .getPNPValueMaterial,
                          ),
                        )
                    : true;

            return true;
          },
          child: Scaffold(
            key: const Key('materialFilterPage'),
            appBar: PreferredSize(
              preferredSize: const Size(double.infinity, 50),
              child: CustomAppBar(
                child: MaterialFilterSearch(
                  onSearchMethod: (String value) {
                    context.read<MaterialFilterBloc>().add(
                          MaterialFilterEvent.updateSearchKey(value),
                        );
                  },
                  searchText:
                      context.read<MaterialFilterBloc>().state.searchKey,
                ),
              ),
            ),
            body: _BodyContent(
              state: state,
              filterType: filterType,
            ),
          ),
        );
      },
    );
  }
}

class _BodyContent extends StatelessWidget {
  final MaterialFilterState state;
  final MaterialFilterType filterType;

  const _BodyContent({
    Key? key,
    required this.state,
    required this.filterType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filterList = state.getSearchedFilterList(filterType);

    return state.isFetching
        ? Center(
            child: LoadingShimmer.logo(
              key: const Key('loaderImage'),
            ),
          )
        : Stack(
            children: [
              ScrollList(
                emptyMessage: 'No filter option found',
                isLoading: state.isFetching,
                itemBuilder: (context, index, item) => ListTile(
                  key: Key('filterOption-${filterList[index]}'),
                  onTap: () {
                    BlocProvider.of<MaterialFilterBloc>(context).add(
                      MaterialFilterEvent.updateMaterialSelected(
                        filterType,
                        filterList[index],
                      ),
                    );
                  },
                  leading: Text(filterList[index]),
                  trailing: state.isSelected(filterType, filterList[index])
                      ? const Icon(Icons.check, color: ZPColors.secondary)
                      : const SizedBox.shrink(),
                ),
                key: const Key('filterOptionList'),
                items: filterList,
              ),

              // Positioned(
              //   bottom: 10,
              //   right: 8,
              //   child: Row(
              //     children: <Widget>[
              //       Container(
              //         margin: const EdgeInsets.symmetric(horizontal: 10.0),
              //         child: ElevatedButton(
              //           style: ButtonStyle(
              //             shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
              //               (states) => RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(30.0),
              //               ),
              //             ),
              //             backgroundColor: MaterialStateProperty.resolveWith<Color>(
              //               (states) => ZPColors.primary,
              //             ),
              //             padding:
              //                 MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
              //               (states) => const EdgeInsets.symmetric(
              //                 vertical: 10.0,
              //                 horizontal: 10.0,
              //               ),
              //             ),
              //           ),
              //           onPressed: () {
              //             context.read<MaterialListBloc>().add(
              //                   MaterialListEvent.fetch(
              //                     user: context.read<UserBloc>().state.user,
              //                     salesOrganisation: context
              //                         .read<SalesOrgBloc>()
              //                         .state
              //                         .salesOrganisation,
              //                     configs: context.read<SalesOrgBloc>().state.configs,
              //                     customerCodeInfo: context
              //                         .read<CustomerCodeBloc>()
              //                         .state
              //                         .customerCodeInfo,
              //                     shipToInfo:
              //                         context.read<ShipToCodeBloc>().state.shipToInfo,
              //                     selectedMaterialFilter: context
              //                         .read<MaterialFilterBloc>()
              //                         .state
              //                         .selectedMaterialFilter,
              //                   ),
              //                 );
              //             Navigator.pop(context);
              //           },
              //           child: const Text(
              //             'Apply',
              //             key: Key('materialFilterApply'),
              //             style: TextStyle(
              //               color: Colors.white,
              //               fontWeight: FontWeight.bold,
              //               fontSize: 19,
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          );
  }
}

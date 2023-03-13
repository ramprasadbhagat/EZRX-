import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/application/order/scan_material_info/scan_material_info_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/orders/cart/add_to_cart/cart_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/orders/core/account_suspended_warning.dart';
import 'package:ezrxmobile/presentation/orders/create_order/material_list/material_list_filters.dart';
import 'package:ezrxmobile/presentation/orders/create_order/material_list/material_list_item.dart';
import 'package:ezrxmobile/presentation/orders/create_order/material_list/material_list_scan_picker.dart';
import 'package:ezrxmobile/presentation/orders/create_order/material_list/material_list_search_bar.dart';
import 'package:ezrxmobile/presentation/orders/create_order/order_type_selector.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';

class MaterialListPage extends StatelessWidget {
  const MaterialListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    trackMixpanelEvent(
      MixpanelEvents.pageViewVisited,
      props: {
        MixpanelProps.pageViewName: runtimeType.toString(),
      },
    );

    return MultiBlocListener(
      listeners: [
        BlocListener<ScanMaterialInfoBloc, ScanMaterialInfoState>(
          listenWhen: (previous, current) =>
              previous.scannedData != current.scannedData ||
              previous.apiFailureOrSuccessOption !=
                  current.apiFailureOrSuccessOption,
          listener: (context, state) {
            final eligibilityBloc = context.read<EligibilityBloc>();
            state.apiFailureOrSuccessOption.fold(
              () {},
              (either) => either.fold(
                (failure) {
                  ErrorUtils.handleApiFailure(context, failure);
                },
                (_) {},
              ),
            );
            if (state.scannedData.isEmpty) return;
            context.read<MaterialListBloc>().add(
                  MaterialListEvent.searchMaterialList(
                    user: eligibilityBloc.state.user,
                    salesOrganisation: eligibilityBloc.state.salesOrganisation,
                    configs: eligibilityBloc.state.salesOrgConfigs,
                    customerCodeInfo: eligibilityBloc.state.customerCodeInfo,
                    shipToInfo: eligibilityBloc.state.shipToInfo,
                    selectedMaterialFilter: context
                        .read<MaterialFilterBloc>()
                        .state
                        .selectedMaterialFilter,
                    pickAndPack: eligibilityBloc.state.getPNPValueMaterial,
                    isScanSearch: true,
                    searchKey: SearchKey(state.scannedData),
                  ),
                );
          },
        ),
        BlocListener<OrderDocumentTypeBloc, OrderDocumentTypeState>(
          listenWhen: (previous, current) =>
              previous.selectedOrderType != current.selectedOrderType ||
              previous.isSubmitting != current.isSubmitting,
          listener: (context, orderDocumentTypeState) {
            orderDocumentTypeState.orderDocumentTypeListFailureOrSuccessOption
                .fold(
              () {},
              (either) => either.fold(
                (failure) {
                  showSnackBar(
                    context: context,
                    message: 'Unable to fetch Order Type',
                  );
                },
                (_) {},
              ),
            );
          },
        ),
        BlocListener<MaterialPriceBloc, MaterialPriceState>(
          listenWhen: (previous, current) =>
              previous.isFetching != current.isFetching && !current.isFetching,
          listener: (context, state) {
            final materialListState = context.read<MaterialListBloc>().state;

            if (materialListState.materialList.length == 1 &&
                materialListState.isScanFromBarcode) {
              _onFetchScannerResult(
                context: context,
                listState: materialListState,
                priceState: state,
              );
            }
          },
        ),
      ],
      child: Scaffold(
        key: const Key('materialListPage'),
        body: BlocConsumer<MaterialListBloc, MaterialListState>(
          listenWhen: (previous, current) =>
              previous.apiFailureOrSuccessOption !=
                  current.apiFailureOrSuccessOption ||
              previous.isFetching != current.isFetching,
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
          buildWhen: (previous, current) =>
              previous.isFetching != current.isFetching ||
              previous.materialList != current.materialList,
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    const Expanded(child: MaterialListSearchBar()),
                    Container(
                      color: ZPColors.white,
                      child: IconButton(
                        padding: const EdgeInsets.only(right: 10),
                        onPressed: () {
                          showPlatformDialog(
                            context: context,
                            barrierDismissible: true,
                            useRootNavigator: true,
                            builder: (_) => const MaterialListScanPicker(),
                          );
                        },
                        icon: const Icon(Icons.qr_code_scanner_outlined),
                      ),
                    ),
                  ],
                ),
                const AccountSuspendedBanner(),
                if (context.read<EligibilityBloc>().state.isOrderTypeEnable)
                  const OrderTypeSelector(hideReasonField: true),
                const MaterialListFilters(),
                Expanded(
                  child: state.isFetching && state.materialList.isEmpty
                      ? LoadingShimmer.logo(
                          key: const Key('loaderImage'),
                        )
                      : ScrollList<MaterialInfo>(
                          emptyMessage: 'No material found',
                          onRefresh: () => _onRefresh(context),
                          onLoadingMore: () => _onLoadingMore(context),
                          isLoading: state.isFetching,
                          itemBuilder: (context, index, item) {
                            final salesOrgConfigs = context
                                .read<EligibilityBloc>()
                                .state
                                .salesOrgConfigs;

                            return MaterialListItem(
                              salesOrgConfigs: salesOrgConfigs,
                              materialInfo: item,
                            );
                          },
                          items: state.materialList,
                        ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _onFetchScannerResult({
    required BuildContext context,
    required MaterialListState listState,
    required MaterialPriceState priceState,
  }) {
    final material = listState.materialList.first;
    final eligibilityBloc = context.read<EligibilityBloc>();
    final materialPrice = priceState.materialPrice[material.materialNumber];

    final comboDealInCart = context.read<CartBloc>().state.getComboDealCartItem(
          comboDealQuery: materialPrice!.comboDeal,
        );

    if (comboDealInCart.materials.isNotEmpty) {
      context.router.push(
        ComboDealDetailPageRoute(
          comboItems: comboDealInCart.materials,
          isEdit: true,
        ),
      );

      return;
    }

    if (material.hasValidTenderContract) {
      context.read<TenderContractBloc>().add(
            TenderContractEvent.fetch(
              customerCodeInfo: eligibilityBloc.state.customerCodeInfo,
              salesOrganisation: eligibilityBloc.state.salesOrganisation,
              shipToInfo: eligibilityBloc.state.shipToInfo,
              materialInfo: material,
              defaultSelectedTenderContract: TenderContract.empty(),
            ),
          );
    }
    CartBottomSheet.showAddToCartBottomSheet(
      priceAggregate: PriceAggregate(
        price: materialPrice,
        materialInfo: material,
        salesOrgConfig: eligibilityBloc.state.salesOrgConfigs,
        quantity: 1,
        bundle: Bundle.empty(),
        addedBonusList: [],
        stockInfo: StockInfo.empty().copyWith(
          materialNumber: material.materialNumber,
        ),
        tenderContract: TenderContract.empty(),
        comboDeal: ComboDeal.empty(),
      ),
      context: context,
    );
  }

  void _onRefresh(BuildContext context) {
    final eligibilityBloc = context.read<EligibilityBloc>();

    context.read<MaterialPriceBloc>().add(
          const MaterialPriceEvent.initialized(),
        );
    context.read<MaterialPriceDetailBloc>().add(
          const MaterialPriceDetailEvent.initialized(),
        );

    context.read<ComboDealListBloc>().add(
          const ComboDealListEvent.initialize(),
        );
    context.read<MaterialFilterBloc>().add(
          const MaterialFilterEvent.clearSelected(),
        );

    context.read<MaterialListBloc>().add(
          const MaterialListEvent.updateSearchKey(searchKey: ''),
        );
    context.read<MaterialListBloc>().add(
          MaterialListEvent.fetch(
            user: eligibilityBloc.state.user,
            salesOrganisation: eligibilityBloc.state.salesOrganisation,
            configs: eligibilityBloc.state.salesOrgConfigs,
            customerCodeInfo: eligibilityBloc.state.customerCodeInfo,
            shipToInfo: eligibilityBloc.state.shipToInfo,
            selectedMaterialFilter: context
                .read<MaterialFilterBloc>()
                .state
                .getEmptyMaterialFilter(),
            orderDocumentType:
                context.read<OrderDocumentTypeBloc>().state.selectedOrderType,
            pickAndPack: eligibilityBloc.state.getPNPValueMaterial,
          ),
        );
  }

  void _onLoadingMore(BuildContext context) {
    final eligibilityBloc = context.read<EligibilityBloc>();

    context.read<MaterialListBloc>().add(
          MaterialListEvent.loadMore(
            user: eligibilityBloc.state.user,
            salesOrganisation: eligibilityBloc.state.salesOrganisation,
            configs: eligibilityBloc.state.salesOrgConfigs,
            customerCodeInfo: eligibilityBloc.state.customerCodeInfo,
            shipToInfo: eligibilityBloc.state.shipToInfo,
            selectedMaterialFilter:
                context.read<MaterialFilterBloc>().state.selectedMaterialFilter,
            orderDocumentType:
                context.read<OrderDocumentTypeBloc>().state.selectedOrderType,
            pickAndPack: eligibilityBloc.state.getPNPValueMaterial,
          ),
        );
  }
}

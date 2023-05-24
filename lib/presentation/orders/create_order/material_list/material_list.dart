import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/locator.dart';
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
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
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
import 'package:ezrxmobile/presentation/theme/colors.dart';

class MaterialListPage extends StatelessWidget {
  const MaterialListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderDocumentTypeBloc, OrderDocumentTypeState>(
      listenWhen: (previous, current) =>
          previous.selectedOrderType != current.selectedOrderType ||
          previous.isSubmitting != current.isSubmitting,
      listener: (context, orderDocumentTypeState) {
        orderDocumentTypeState.orderDocumentTypeListFailureOrSuccessOption.fold(
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
                    locator<RemoteConfigService>().getScanToOrderConfig()
                        ? BlocListener<ScanMaterialInfoBloc,
                            ScanMaterialInfoState>(
                            listenWhen: (previous, current) =>
                                previous.isFetching != current.isFetching &&
                                !current.isFetching,
                            listener: (context, state) {
                              state.apiFailureOrSuccessOption.fold(
                                () => CartBottomSheet
                                    .showQuickAddToCartBottomSheet(
                                  context: context,
                                  materialNumber: state.material.materialNumber
                                      .getOrDefaultValue(''),
                                ),
                                (either) => either.fold(
                                  (failure) {
                                    ErrorUtils.handleApiFailure(
                                      context,
                                      failure,
                                    );
                                  },
                                  (_) {},
                                ),
                              );
                            },
                            child: Container(
                              color: ZPColors.white,
                              child: IconButton(
                                padding: const EdgeInsets.only(right: 10),
                                onPressed: () {
                                  trackMixpanelEvent(
                                    MixpanelEvents.scannerClicked,
                                  );
                                  showPlatformDialog(
                                    context: context,
                                    barrierDismissible: true,
                                    useRootNavigator: true,
                                    builder: (_) =>
                                        const MaterialListScanPicker(),
                                  );
                                },
                                icon: const Icon(
                                  Icons.qr_code_scanner_outlined,
                                ),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
                const AccountSuspendedBanner(),
                const MaterialListFilters(),
                Expanded(
                  child: state.isFetching && state.materialList.isEmpty
                      ? LoadingShimmer.logo(
                          key: const Key('loaderImage'),
                        )
                      : ScrollList<MaterialInfo>(
                          emptyMessage: 'No material found'.tr(),
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

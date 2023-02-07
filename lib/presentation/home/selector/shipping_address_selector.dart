import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/favourites/favourite_bloc.dart';
import 'package:ezrxmobile/application/order/material_bundle_list/material_bundle_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_filter/order_history_filter_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_filter_by_status/order_history_filter_by_status_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_list/order_history_list_bloc.dart';
import 'package:ezrxmobile/application/order/order_template_list/order_template_list_bloc.dart';
import 'package:ezrxmobile/application/order/payment_customer_information/payment_customer_information_bloc.dart';
import 'package:ezrxmobile/application/order/saved_order/saved_order_bloc.dart';
import 'package:ezrxmobile/application/returns/request_return/request_return_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_filter.dart';
import 'package:ezrxmobile/presentation/core/custom_selector.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShipCodeSelector extends StatelessWidget {
  const ShipCodeSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerCodeBloc, CustomerCodeState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, customerCodeState) {
        return BlocConsumer<ShipToCodeBloc, ShipToCodeState>(
          listenWhen: (previous, current) =>
              previous.shipToInfo != current.shipToInfo,
          listener: (context, state) {
            final salesOrgState = context.read<SalesOrgBloc>().state;

            context.read<MaterialFilterBloc>().add(
                  const MaterialFilterEvent.resetFilter(),
                );

            context.read<MaterialListBloc>().add(
                  const MaterialListEvent.updateSearchKey(
                    searchKey: '',
                  ),
                );

            context.read<MaterialPriceBloc>().add(
                  const MaterialPriceEvent.initialized(),
                );

            context.read<MaterialPriceDetailBloc>().add(
                  const MaterialPriceDetailEvent.initialized(),
                );

            if (state.haveShipTo) {
              context.read<EligibilityBloc>().add(
                    EligibilityEvent.update(
                      user: context.read<UserBloc>().state.user,
                      salesOrganisation: salesOrgState.salesOrganisation,
                      salesOrgConfigs: salesOrgState.configs,
                      customerCodeInfo: context
                          .read<CustomerCodeBloc>()
                          .state
                          .customerCodeInfo,
                      shipToInfo: state.shipToInfo,
                    ),
                  );

              if (context.read<UserBloc>().state.userCanCreateOrder) {
                context.read<MaterialBundleListBloc>().add(
                      MaterialBundleListEvent.fetch(
                        user: context.read<UserBloc>().state.user,
                        customerCode: context
                            .read<CustomerCodeBloc>()
                            .state
                            .customerCodeInfo,
                        salesOrganisation: context
                            .read<SalesOrgBloc>()
                            .state
                            .salesOrganisation,
                        shipToCode:
                            context.read<ShipToCodeBloc>().state.shipToInfo,
                      ),
                    );
              }

              context.read<SavedOrderListBloc>().add(
                    SavedOrderListEvent.fetch(
                      userInfo: context.read<UserBloc>().state.user,
                      selectedSalesOrganisation:
                          context.read<SalesOrgBloc>().state.salesOrganisation,
                      selectedCustomerCode: context
                          .read<CustomerCodeBloc>()
                          .state
                          .customerCodeInfo,
                      selectedShipTo: state.shipToInfo,
                    ),
                  );

              if (context.read<UserBloc>().state.userCanCreateOrder) {
                context.read<OrderHistoryListBloc>().add(
                      OrderHistoryListEvent.fetch(
                        salesOrgConfigs:
                            context.read<SalesOrgBloc>().state.configs,
                        shipToInfo: state.shipToInfo,
                        user: context.read<UserBloc>().state.user,
                        customerCodeInfo: context
                            .read<CustomerCodeBloc>()
                            .state
                            .customerCodeInfo,
                        orderHistoryFilter: OrderHistoryFilter.empty(),
                        sortDirection: 'desc',
                      ),
                    );
              }

              context.read<OrderTemplateListBloc>().add(
                    OrderTemplateListEvent.fetch(
                      context.read<UserBloc>().state.user,
                    ),
                  );

              context.read<FavouriteBloc>().add(
                    FavouriteEvent.fetch(
                      user: context.read<UserBloc>().state.user,
                    ),
                  );

              context
                  .read<PaymentCustomerInformationBloc>()
                  .add(PaymentCustomerInformationEvent.fetch(
                    customeCodeInfo:
                        context.read<CustomerCodeBloc>().state.customerCodeInfo,
                    salesOrganisation:
                        context.read<SalesOrgBloc>().state.salesOrganisation,
                    selectedShipToCode: context
                        .read<ShipToCodeBloc>()
                        .state
                        .shipToInfo
                        .shipToCustomerCode,
                  ));

              if (context
                  .read<UserBloc>()
                  .state
                  .user
                  .role
                  .type
                  .hasReturnsAdminAccess) {
                context.read<RequestReturnBloc>().add(
                      RequestReturnEvent.fetch(
                        salesOrg: context
                            .read<SalesOrgBloc>()
                            .state
                            .salesOrganisation,
                        customerCodeInfo: context
                            .read<CustomerCodeBloc>()
                            .state
                            .customerCodeInfo,
                        shipInfo:
                            context.read<ShipToCodeBloc>().state.shipToInfo,
                      ),
                    );
              }
            } else {
              context
                  .read<SavedOrderListBloc>()
                  .add(const SavedOrderListEvent.initialized());

              context
                  .read<OrderHistoryListBloc>()
                  .add(const OrderHistoryListEvent.initialized());

              context
                  .read<OrderTemplateListBloc>()
                  .add(const OrderTemplateListEvent.initialized());

              context
                  .read<FavouriteBloc>()
                  .add(const FavouriteEvent.initialized());
              context
                  .read<OrderHistoryFilterBloc>()
                  .add(const OrderHistoryFilterEvent.initialized());
              context
                  .read<OrderHistoryFilterByStatusBloc>()
                  .add(const OrderHistoryFilterByStatusEvent.initialized());
            }
          },
          buildWhen: (previous, current) =>
              previous.shipToInfo != current.shipToInfo,
          builder: (context, state) {
            return CustomSelector(
              key: const Key('shipToCodeSelect'),
              title: 'Shipping Address'.tr(),
              onTap: customerCodeState.isFetching
                  ? null
                  : () => context.router.pushNamed('ship_to_search_page'),
              child: customerCodeState.isFetching
                  ? LoadingShimmer.tile()
                  : FittedBox(
                      child: Text(
                        state.shipToInfo == ShipToInfo.empty()
                            ? 'NA'.tr()
                            : state.shipToInfo.shipToCustomerCode,
                        style: Theme.of(context).textTheme.titleSmall?.apply(
                              color: ZPColors.primary,
                            ),
                      ).tr(),
                    ),
            );
          },
        );
      },
    );
  }
}

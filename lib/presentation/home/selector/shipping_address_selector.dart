import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/application/order/covid_material_list/covid_material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/favourites/favourite_bloc.dart';
import 'package:ezrxmobile/application/order/material_bundle_list/material_bundle_list_bloc.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_filter/order_history_filter_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_list/order_history_list_bloc.dart';
import 'package:ezrxmobile/application/order/order_template_list/order_template_list_bloc.dart';
import 'package:ezrxmobile/application/order/payment_customer_information/payment_customer_information_bloc.dart';
import 'package:ezrxmobile/application/order/saved_order/saved_order_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_filter.dart';
import 'package:ezrxmobile/presentation/core/custom_selector.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer.dart';
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
            final enableBundles =
                !(context.read<SalesOrgBloc>().state.configs.disableBundles);
            final enableCovidMaterial = _canOrderCovidMaterial(
              customerCodeInfo:
                  context.read<CustomerCodeBloc>().state.customerCodeInfo,
              salesOrganisation:
                  context.read<SalesOrgBloc>().state.salesOrganisation,
              role: context.read<UserBloc>().state.user.role,
            );
            if (state.haveShipTo) {
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

              context.read<MaterialListBloc>().add(
                    MaterialListEvent.fetch(
                      user: context.read<UserBloc>().state.user,
                      salesOrganisation:
                          context.read<SalesOrgBloc>().state.salesOrganisation,
                      configs: context.read<SalesOrgBloc>().state.configs,
                      customerCodeInfo: context
                          .read<CustomerCodeBloc>()
                          .state
                          .customerCodeInfo,
                      shipToInfo: state.shipToInfo,
                      selectedMaterialFilter: context
                          .read<MaterialFilterBloc>()
                          .state
                          .selectedMaterialFilter,
                      orderDocumentType: context
                          .read<OrderDocumentTypeBloc>()
                          .state
                          .selectedOrderType,
                    ),
                  );
              if (enableCovidMaterial) {
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
                        shipToInfo: state.shipToInfo,
                      ),
                    );
              }
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
                    ),
                  );

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

              if (enableBundles) {
                context.read<MaterialBundleListBloc>().add(
                      MaterialBundleListEvent.fetch(
                        user: context.read<UserBloc>().state.user,
                        customerCode: context
                            .read<CustomerCodeBloc>()
                            .state
                            .customerCodeInfo,
                        shipToCode:
                            context.read<ShipToCodeBloc>().state.shipToInfo,
                        salesOrganisation: context
                            .read<SalesOrgBloc>()
                            .state
                            .salesOrganisation,
                      ),
                    );
              }
              context.read<CartBloc>().add(const CartEvent.fetch());
              context.read<MaterialFilterBloc>().add(MaterialFilterEvent.fetch(
                    salesOrganisation:
                        context.read<SalesOrgBloc>().state.salesOrganisation,
                    shipToInfo: context.read<ShipToCodeBloc>().state.shipToInfo,
                    customerCodeInfo:
                        context.read<CustomerCodeBloc>().state.customerCodeInfo,
                    user: context.read<UserBloc>().state.user,
                    salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
                  ));

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

              if (enableBundles) {
                context
                    .read<MaterialBundleListBloc>()
                    .add(const MaterialBundleListEvent.initialized());
              }

              if (enableCovidMaterial) {
                context
                    .read<CovidMaterialListBloc>()
                    .add(const CovidMaterialListEvent.initialized());
              }

              context
                  .read<OrderHistoryFilterBloc>()
                  .add(const OrderHistoryFilterEvent.initialized());
            }
          },
          buildWhen: (previous, current) =>
              previous.shipToInfo != current.shipToInfo,
          builder: (context, state) {
            return CustomSelector(
              key: const Key('shipToCodeSelect'),
              title: 'Shipping Address',
              onTap: customerCodeState.isFetching
                  ? null
                  : () => context.router.pushNamed('ship_to_search_page'),
              child: customerCodeState.isFetching
                  ? LoadingShimmer.tile()
                  : Text(
                      customerCodeState.apiSuccess
                          ? state.shipToInfo.shipToCustomerCode
                          : 'No Shipping',
                      style: Theme.of(context).textTheme.subtitle2?.apply(
                            color: ZPColors.primary,
                          ),
                    ).tr(),
            );
          },
        );
      },
    );
  }

  bool _canOrderCovidMaterial({
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganisation,
    required Role role,
  }) {
    return (customerCodeInfo.customerAttr7.isZEV &&
            role.type.isClient &&
            salesOrganisation.salesOrg.isSg) ||
        customerCodeInfo.customerGrp4.canOrderCovidMaterial ||
        (role.type.isSalesRep && salesOrganisation.salesOrg.isPH);
  }
}

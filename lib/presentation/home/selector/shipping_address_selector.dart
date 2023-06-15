import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/favourites/favourite_bloc.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/material_bundle_list/material_bundle_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_filter/order_history_filter_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_filter_by_status/order_history_filter_by_status_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_list/order_history_list_bloc.dart';
import 'package:ezrxmobile/application/order/order_template_list/order_template_list_bloc.dart';
import 'package:ezrxmobile/application/order/payment_customer_information/payment_customer_information_bloc.dart';
import 'package:ezrxmobile/application/order/saved_order/saved_order_bloc.dart';
import 'package:ezrxmobile/application/payments/account_summary/account_summary_bloc.dart';
import 'package:ezrxmobile/application/payments/all_credits/all_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/all_credits/all_credits_filter/all_credits_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/all_invoices/all_invoices_bloc.dart';
import 'package:ezrxmobile/application/payments/all_invoices/filter/all_invoices_filter_bloc.dart';
import 'package:ezrxmobile/application/returns/request_return/request_return_bloc.dart';
import 'package:ezrxmobile/application/returns/return_summary/return_summary_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/all_credits_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/all_invoices_filter.dart';
import 'package:ezrxmobile/domain/returns/entities/request_return_filter.dart';
import 'package:ezrxmobile/domain/returns/entities/return_summary_filter.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/custom_selector.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary/payment_summary_bloc.dart';

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
            final orderDocumentTypeState =
                context.read<OrderDocumentTypeBloc>().state;

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
              final user = context.read<UserBloc>().state.user;
              final customerCodeInfo =
                  context.read<CustomerCodeBloc>().state.customerCodeInfo;

              locator<MixpanelService>().registerSuperProps(
                username: user.username.getOrDefaultValue(''),
                salesOrg: salesOrgState.salesOrg.getOrDefaultValue(''),
                customerCode: customerCodeInfo.customerCodeSoldTo,
                shipToAddress: state.shipToInfo.shipToCustomerCode,
                userRole: user.role.type.getOrDefaultValue(''),
              );

              context.read<EligibilityBloc>().add(
                    EligibilityEvent.update(
                      user: user,
                      salesOrganisation: salesOrgState.salesOrganisation,
                      salesOrgConfigs: salesOrgState.configs,
                      customerCodeInfo: customerCodeInfo,
                      shipToInfo: state.shipToInfo,
                      selectedOrderType:
                          orderDocumentTypeState.selectedOrderType,
                    ),
                  );
              context.read<ReturnSummaryBloc>().add(
                    ReturnSummaryEvent.fetch(
                      user: context.read<UserBloc>().state.user,
                      customerCodeInfo: context
                          .read<CustomerCodeBloc>()
                          .state
                          .customerCodeInfo,
                      shipToInfo:
                          context.read<ShipToCodeBloc>().state.shipToInfo,
                      returnSummaryFilter: ReturnSummaryFilter.empty(),
                    ),
                  );
              if (context.read<UserBloc>().state.userCanCreateOrder) {
                context.read<MaterialBundleListBloc>().add(
                      MaterialBundleListEvent.fetch(
                        user: user,
                        customerCode: customerCodeInfo,
                        salesOrganisation: salesOrgState.salesOrganisation,
                        shipToCode:
                            context.read<ShipToCodeBloc>().state.shipToInfo,
                      ),
                    );
              }

              context.read<SavedOrderListBloc>().add(
                    SavedOrderListEvent.fetch(
                      userInfo: user,
                      selectedSalesOrganisation:
                          salesOrgState.salesOrganisation,
                      selectedCustomerCode: customerCodeInfo,
                      selectedShipTo: state.shipToInfo,
                    ),
                  );

              if (context.read<UserBloc>().state.userCanCreateOrder) {
                context.read<OrderHistoryListBloc>().add(
                      OrderHistoryListEvent.fetch(
                        salesOrgConfigs: salesOrgState.configs,
                        shipToInfo: state.shipToInfo,
                        user: user,
                        customerCodeInfo: customerCodeInfo,
                        orderHistoryFilter: OrderHistoryFilter.empty(),
                        sortDirection: 'desc',
                      ),
                    );
              }

              context.read<OrderTemplateListBloc>().add(
                    OrderTemplateListEvent.fetch(
                      user,
                    ),
                  );

              context.read<FavouriteBloc>().add(
                    FavouriteEvent.fetch(
                      user: user,
                    ),
                  );

              context
                  .read<PaymentCustomerInformationBloc>()
                  .add(PaymentCustomerInformationEvent.fetch(
                    customeCodeInfo: customerCodeInfo,
                    salesOrganisation: salesOrgState.salesOrganisation,
                    selectedShipToCode: context
                        .read<ShipToCodeBloc>()
                        .state
                        .shipToInfo
                        .shipToCustomerCode,
                  ));

              if (user.role.type.hasReturnsAdminAccess) {
                context.read<RequestReturnBloc>().add(
                      RequestReturnEvent.fetch(
                        salesOrg: salesOrgState.salesOrganisation,
                        customerCodeInfo: customerCodeInfo,
                        shipInfo:
                            context.read<ShipToCodeBloc>().state.shipToInfo,
                        requestReturnFilter: RequestReturnFilter.empty(),
                      ),
                    );
              }
              context.read<PaymentSummaryBloc>().add(
                    PaymentSummaryEvent.fetchPaymentSummaryList(
                      salesOrganization:
                          context.read<SalesOrgBloc>().state.salesOrganisation,
                      customerCodeInfo: customerCodeInfo,
                    ),
                  );

              context.read<AdditionalDetailsBloc>().add(
                    AdditionalDetailsEvent.initialized(
                      config: salesOrgState.configs,
                      customerCodeInfo: customerCodeInfo,
                    ),
                  );

              context.read<AllInvoicesFilterBloc>().add(
                    AllInvoicesFilterEvent.fetch(
                      salesOrganisation: salesOrgState.salesOrganisation,
                    ),
                  );
              context.read<AllInvoicesBloc>().add(
                    AllInvoicesEvent.fetch(
                      salesOrganisation: salesOrgState.salesOrganisation,
                      customerCodeInfo: context
                          .read<CustomerCodeBloc>()
                          .state
                          .customerCodeInfo,
                      filter: AllInvoicesFilter.empty(),
                    ),
                  );
              context.read<AllCreditsBloc>().add(
                    AllCreditsEvent.fetchAllCreditsList(
                      salesOrganisation:
                          context.read<SalesOrgBloc>().state.salesOrganisation,
                      customerCodeInfo: context
                          .read<CustomerCodeBloc>()
                          .state
                          .customerCodeInfo,
                      allCreditsFilter: AllCreditsFilter.empty(),
                    ),
                  );
              context.read<AllCreditsFilterBloc>().add(
                    AllCreditsFilterEvent.fetch(
                      salesOrganisation: salesOrgState.salesOrganisation,
                    ),
                  );

              context.read<AccountSummaryBloc>().add(
                    AccountSummaryEvent.fetchInvoiceSummary(
                      custCode: customerCodeInfo.customerCodeSoldTo,
                      salesOrg: context
                          .read<SalesOrgBloc>()
                          .state
                          .salesOrganisation
                          .salesOrg,
                    ),
                  );

              context.read<AccountSummaryBloc>().add(
                    AccountSummaryEvent.fetchCreditSummary(
                      custCode: customerCodeInfo.customerCodeSoldTo,
                      salesOrg: context
                          .read<SalesOrgBloc>()
                          .state
                          .salesOrganisation
                          .salesOrg,
                    ),
                  );
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
              context.read<AccountSummaryBloc>().add(
                    const AccountSummaryEvent.initialize(),
                  );
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
                  : () => context.router.pushNamed('ship_to_search'),
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

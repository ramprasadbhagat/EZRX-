import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_details/order_history_details_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/bill_to_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_basic_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

class OrderHistoryListTile extends StatelessWidget {
  final OrderHistoryItem orderHistoryItem;
  final Currency currency;
  final CustomerCodeInfo customerCodeInfo;
  final ShipToInfo shipToInfo;
  final OrderHistoryBasicInfo orderHistoryBasicInfo;
  final SalesOrganisationConfigs salesOrgConfigs;
  final BillToInfo billToInfo;
  const OrderHistoryListTile({
    Key? key,
    required this.orderHistoryItem,
    required this.currency,
    required this.customerCodeInfo,
    required this.shipToInfo,
    required this.orderHistoryBasicInfo,
    required this.salesOrgConfigs,
    required this.billToInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final enableOHPrice = context.read<EligibilityBloc>().state.enableOHPrice;
    final enableTaxDisplay =
        context.read<EligibilityBloc>().state.salesOrgConfigs.enableTaxDisplay;

    return InkWell(
      onTap: () {
        locator<CountlyService>()
            .addCountlyEvent('view Order Details', segmentation: {
          'order_id': orderHistoryItem.orderNumber,
          'createdDate': orderHistoryItem.createdDate,
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
        });
        context.read<MaterialPriceDetailBloc>().add(
              MaterialPriceDetailEvent.fetch(
                user: context.read<UserBloc>().state.user,
                customerCode: customerCodeInfo,
                salesOrganisation:
                    context.read<SalesOrgBloc>().state.salesOrganisation,
                salesOrganisationConfigs: salesOrgConfigs,
                shipToCode: shipToInfo,
                materialInfoList: [
                  MaterialQueryInfo.fromOrderHistory(
                    orderHistoryItem: orderHistoryItem,
                  ),
                ],
                skipFOCCheck: true,
                pickAndPack:
                    context.read<EligibilityBloc>().state.getPNPValueMaterial,
              ),
            );
        context.read<OrderHistoryDetailsBloc>().add(
              OrderHistoryDetailsEvent.fetch(
                user: context.read<UserBloc>().state.user,
                orderHistoryItem: orderHistoryItem,
              ),
            );

        context.router.push(HistoryDetailsRoute(
          orderHistoryItem: orderHistoryItem,
          billToInfo: billToInfo,
          customerCodeInfo: customerCodeInfo,
          orderHistoryBasicInfo: orderHistoryBasicInfo,
          salesOrgConfigs: salesOrgConfigs,
        ));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text(
                      '#${orderHistoryItem.orderNumber}',
                      softWrap: true,
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: ZPColors.kPrimaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  salesOrgConfigs.disableProcessingStatus
                      ? const SizedBox.shrink()
                      : Expanded(
                          flex: 1,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 4,
                            ),
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: ZPColors.secondary,
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                            child: Text(
                              orderHistoryItem.status.tr(),
                              style: const TextStyle(
                                color: ZPColors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                ],
              ),
              BalanceTextRow(
                key: const Key('orderTypeKey'),
                keyText: 'Order Type'.tr(),
                valueText: orderHistoryItem.orderType,
              ),
              BalanceTextRow(
                keyText: 'Material ID'.tr(),
                valueText: orderHistoryItem.materialNumber.displayMatNo,
              ),
              BalanceTextRow(
                keyText: 'Material Name'.tr(),
                valueText: orderHistoryItem.materialDescription,
              ),
              BalanceTextRow(
                keyText: 'Order Date'.tr(),
                valueText: orderHistoryItem.createdDate,
              ),
              BalanceTextRow(
                keyText: 'Delivery Date/Time'.tr(),
                valueText: orderHistoryItem.deliveryDate,
              ),
              BalanceTextRow(
                keyText: 'Quantity'.tr(),
                valueText: orderHistoryItem.qty.toString(),
              ),
              if (enableOHPrice)
                BalanceTextRow(
                  keyText: 'ZP Price'.tr(),
                  valueText: StringUtils.displayPrice(
                    salesOrgConfigs,
                    orderHistoryItem.unitPrice.zpPrice,
                  ),
                ),
              if (enableOHPrice)
                BalanceTextRow(
                  keyText: 'Total Price'.tr(),
                  valueText: StringUtils.displayPrice(
                    salesOrgConfigs,
                    orderHistoryItem.totalPrice.totalPrice,
                  ),
                ),
              if (enableTaxDisplay)
                BalanceTextRow(
                  keyText: 'Included Tax'.tr(),
                  valueText: orderHistoryItem.tax.toStringAsFixed(2),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

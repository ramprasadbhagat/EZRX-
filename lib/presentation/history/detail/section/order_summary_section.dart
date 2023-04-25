import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_details/order_history_details_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/history/detail/widget/order_item_bonus_card.dart';
import 'package:ezrxmobile/presentation/history/detail/widget/order_item_card.dart';
import 'package:ezrxmobile/presentation/history/detail/widget/order_tender_contract_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/core/custom_expansion_tile.dart'
    as custom;

class HistoryOrderSummarySection extends StatelessWidget {
  final SalesOrganisationConfigs salesOrgConfigs;

  const HistoryOrderSummarySection({
    Key? key,
    required this.salesOrgConfigs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderHistoryDetailsBloc, OrderHistoryDetailsState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        final elibilityBloc = context.read<EligibilityBloc>();

        return custom.ExpansionTile(
          initiallyExpanded: true,
          keepHeaderBorder: true,
          key: const ValueKey('Order Summary'),
          title: Text(
            'Order Summary'.tr(),
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          children: [
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                state.orderHistoryDetails.items.length,
                (index) {
                  final orderItem = state.orderHistoryDetails.items[index];
                  final priceAggregate =
                      state.materials[orderItem.orderItem.queryInfo] ??
                          PriceAggregate.empty();

                  return orderItem.bonusList.isNotEmpty
                      ? OrderItemBonusCard(
                          key: Key(
                            'orderItemBonusCard-${orderItem.orderItem.materialNumber.displayMatNo}-$index',
                          ),
                          orderHistoryDetailsBonusAggregate: orderItem,
                        )
                      : orderItem.orderItem.isTenderContractMaterial
                          ? BlocProvider(
                              lazy: false,
                              create: (context) => locator<TenderContractBloc>()
                                ..add(
                                  TenderContractEvent.fetch(
                                    customerCodeInfo:
                                        elibilityBloc.state.customerCodeInfo,
                                    salesOrganisation:
                                        elibilityBloc.state.salesOrganisation,
                                    shipToInfo: elibilityBloc.state.shipToInfo,
                                    materialInfo: priceAggregate.materialInfo,
                                    defaultSelectedTenderContract:
                                        priceAggregate.tenderContract,
                                  ),
                                ),
                              child: OrderTenderContractCard(
                                key: Key(
                                  'orderTenderContractCard-${orderItem.orderItem.materialNumber.displayMatNo}-$index',
                                ),
                                orderHistoryDetailsBonusAggregate: orderItem,
                                isLoading: state.isLoading,
                              ),
                            )
                          : OrderItemCard(
                              key: Key(
                                'orderItemCard-${orderItem.orderItem.materialNumber.displayMatNo}-$index',
                              ),
                              orderHistoryDetailsBonusAggregate: orderItem,
                            );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

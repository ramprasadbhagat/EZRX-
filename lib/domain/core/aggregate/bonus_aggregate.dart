import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_item_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items_details.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items_tender_contract_details.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'bonus_aggregate.freezed.dart';

@freezed
class OrderHistoryDetailsBonusAggregate
    with _$OrderHistoryDetailsBonusAggregate {
  const OrderHistoryDetailsBonusAggregate._();

  factory OrderHistoryDetailsBonusAggregate({
    required OrderHistoryDetailsOrderItem orderItem,
    required List<OrderHistoryDetailsOrderItemDetails> details,
    required OrderHistoryDetailsOrderItemTenderContractDetails
        tenderContractDetails,
    required List<OrderHistoryDetailsOrderItem> bonusList,
  }) = _OrderHistoryDetailsOrderItem;

  factory OrderHistoryDetailsBonusAggregate.empty() =>
      OrderHistoryDetailsBonusAggregate(
        orderItem: OrderHistoryDetailsOrderItem.empty(),
        details: <OrderHistoryDetailsOrderItemDetails>[],
        tenderContractDetails:
            OrderHistoryDetailsOrderItemTenderContractDetails.empty(),
        bonusList: <OrderHistoryDetailsOrderItem>[],
      );

  PriceAggregate get toPriceAggregate => PriceAggregate.empty().copyWith(
        price: Price.empty().copyWith(
          materialNumber: orderItem.materialNumber,
        ),
        materialInfo: MaterialInfo.empty().copyWith(
          materialNumber: orderItem.materialNumber,
          materialDescription: orderItem.materialDescription,
          defaultMaterialDescription: orderItem.materialDescription,
        ),
        quantity: orderItem.qty,
        addedBonusList: bonusList
            .map(
              (bonus) => MaterialItemBonus.empty().copyWith(
                materialInfo: MaterialInfo.empty().copyWith(
                  materialNumber: bonus.materialNumber,
                  materialDescription: bonus.materialDescription,
                  defaultMaterialDescription: bonus.materialDescription,
                ),
                qty: bonus.qty,
                materialDescription: bonus.materialDescription,
              ),
            )
            .toList(),
        tenderContract: TenderContract.empty().copyWith(
          contractNumber: TenderContractNumber.tenderContractNumber(
            tenderContractDetails.tenderContractNumber,
          ),
          contractReference: TenderContractInfo.tenderContractReference(
            tenderContractDetails.tenderContractReference,
          ),
          tenderPackageDescription: TenderContractInfo.packageDescription(
            tenderContractDetails.tenderPackageDescription,
          ),
        ),
      );
OrderHistoryDetailsBonusAggregate copyWithTaxCal({
    required SalesOrganisationConfigs salesOrganisationConfigs,
  }) =>
      copyWith(
        orderItem: orderItem.copyWithTaxCal(
          salesOrganisationConfigs: salesOrganisationConfigs,
        ),
      );
  
}

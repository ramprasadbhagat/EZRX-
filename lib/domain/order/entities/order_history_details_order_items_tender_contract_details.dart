import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_history_details_order_items_tender_contract_details.freezed.dart';

@freezed
class OrderHistoryDetailsOrderItemTenderContractDetails with _$OrderHistoryDetailsOrderItemTenderContractDetails {
  const OrderHistoryDetailsOrderItemTenderContractDetails._();
  factory OrderHistoryDetailsOrderItemTenderContractDetails({
    required  String tenderContractNumber,
    required String tenderContractReference,
    required String tenderPackageDescription,
  
  }) = _OrderHistoryDetailsOrderItemTenderContractDetails;

  factory OrderHistoryDetailsOrderItemTenderContractDetails.empty() => OrderHistoryDetailsOrderItemTenderContractDetails(
       tenderContractNumber: '',
       tenderContractReference: '',
       tenderPackageDescription: '',
      );
}

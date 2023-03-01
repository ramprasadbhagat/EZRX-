import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';
import 'package:ezrxmobile/domain/order/entities/submit_material_info.dart';
import 'package:ezrxmobile/domain/order/entities/submit_order_customer.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'submit_order.freezed.dart';

@freezed
class SubmitOrder with _$SubmitOrder {
  const SubmitOrder._();
  const factory SubmitOrder({
    required String userName,
    required CompanyName companyName,
    required SubmitOrderCustomer customer,
    required String poReference,
    required List<SubmitMaterialInfo> materials,
    required String poDate,
    required String requestedDeliveryDate,
    required String specialInstructions,
    required String purchaseOrderType,
    required String orderType,
    required String orderReason,
    required ShippingCondition shippingCondition,
    required String telephone,
    required String referenceNotes,
    required String paymentTerms,
    required String collectiveNumber,
    required bool subscribeStatusChange,
    required String trackingLevel,
    required bool blockOrder,
    required List<PoDocuments> poDocuments,
  }) = _SubmitOrderCustomer;

  factory SubmitOrder.empty() => SubmitOrder(
        userName: '',
        companyName: CompanyName(''),
        customer: SubmitOrderCustomer.empty(),
        poReference: '',
        materials: <SubmitMaterialInfo>[],
        poDate: '',
        requestedDeliveryDate: '',
        specialInstructions: '',
        purchaseOrderType: '',
        orderType: '',
        orderReason: '',
        shippingCondition: ShippingCondition(''),
        telephone: '',
        referenceNotes: '',
        paymentTerms: '',
        collectiveNumber: '',
        subscribeStatusChange: false,
        trackingLevel: '',
        blockOrder: false,
        poDocuments: [],
      );
}

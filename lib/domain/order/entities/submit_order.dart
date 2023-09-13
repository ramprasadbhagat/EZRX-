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
    required List<SubmitMaterialInfo> products,
    required String poDate,
    required String requestedDeliveryDate,
    required String specialInstructions,
    required double orderValue,
    required double totalTax,
    required String telephone,
    required String referenceNotes,
    required String paymentTerms,
    required String collectiveNumber,
    required String orderType,
    required bool blockOrder,
    required List<PoDocuments> poDocuments,
    required String language,
    required String paymentMethod,
  }) = _SubmitOrderCustomer;

  factory SubmitOrder.empty() => SubmitOrder(
        userName: '',
        companyName: CompanyName(''),
        customer: SubmitOrderCustomer.empty(),
        poReference: '',
        products: <SubmitMaterialInfo>[],
        poDate: '',
        requestedDeliveryDate: '',
        specialInstructions: '',
        telephone: '',
        referenceNotes: '',
        paymentTerms: '',
        collectiveNumber: '',
        blockOrder: false,
        poDocuments: [],
        language: '',
        orderType: '',
        paymentMethod: '',
        orderValue: 0,
        totalTax: 0,
      );
}

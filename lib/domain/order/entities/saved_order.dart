import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_item.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:collection/collection.dart';

part 'saved_order.freezed.dart';

@freezed
class SavedOrder with _$SavedOrder {
  const SavedOrder._();
  const factory SavedOrder({
    required String id,
    required List<MaterialItem> items,
    required bool isDraftOrder,
    required bool isSelected,
    required bool isDeleted,
    required String billingDocument,
    required String eZRxNumber,
    required SoldToParty soldToParty,
    required ShipToParty shipToParty,
    required CompanyName companyName,
    required double totalOrderValue,
    required String requestedDeliveryDate,
    required String deliveryDocument,
    required String salesOrganization,
    required String principal,
    required String processingStatus,
    required String country,
    required String postCode1,
    required String specialInstructions,
    required String poReference,
    required String payTerm,
    required String collectiveNo,
    required int quantity,
    required double unitPrice,
    required double totalPrice,
    required bool draftorder,
    required String address1,
    required String address2,
    required String city,
    required String fax,
    required String phonenumber,
    required String orderType,
    required String orderReason,
    required String shippingCondition,
    required String user,
    required String contactPerson,
    required String referenceNotes,
    required List<PoDocuments> poAttachent,
  }) = _SavedOrder;

  factory SavedOrder.empty() => SavedOrder(
        id: '',
        items: <MaterialItem>[],
        isDraftOrder: false,
        isSelected: false,
        isDeleted: false,
        billingDocument: '',
        eZRxNumber: '',
        soldToParty: SoldToParty(''),
        shipToParty: ShipToParty(''),
        companyName: CompanyName(''),
        totalOrderValue: 0.0,
        requestedDeliveryDate: '',
        address1: '',
        address2: '',
        city: '',
        collectiveNo: '',
        contactPerson: '',
        country: '',
        deliveryDocument: '',
        draftorder: false,
        fax: '',
        orderReason: '',
        orderType: '',
        payTerm: '',
        phonenumber: '',
        poReference: '',
        postCode1: '',
        principal: '',
        processingStatus: '',
        quantity: 0,
        referenceNotes: '',
        salesOrganization: '',
        shippingCondition: '',
        specialInstructions: '',
        totalPrice: 0.0,
        unitPrice: 0.0,
        user: '',
        poAttachent: [],
      );

  List<MaterialQueryInfo> get allMaterialQueryInfo => items
      .map(
        (item) {
          if (item.type.isBundle) {
            return item.materials.map((item) => item.queryInfo).toList();
          }

          return [item.queryInfo];
        },
      )
      .flattened
      .toList();
}

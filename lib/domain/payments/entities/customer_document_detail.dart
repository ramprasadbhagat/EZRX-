import 'package:collection/collection.dart';
import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_document_details_group.dart';

part 'customer_document_detail.freezed.dart';

@freezed
class CustomerDocumentDetail with _$CustomerDocumentDetail {
  const CustomerDocumentDetail._();

  const factory CustomerDocumentDetail({
    required String billingDocumentItem,
    required StringValue salesDocumentItemType,
    required MaterialNumber materialNumber,
    required String billingDocumentItemText,
    required IntegerValue billingQuantity,
    required String billingQuantityUnit,
    required String salesMeasureISOUnit,
    required String referenceSDDocument,
    required String referenceSDDocumentItem,
    required String referenceSDDocumentCategory,
    required double grossAmount,
    required double netAmount,
    required double taxAmount,
    required String transactionCurrency,
    required BatchNumber batchNumber,
    required DateTimeStringValue expiryDate,
    required PrincipalName principalName,
    required PrincipalCode principalCode,
    required ProductImages productImages,

  }) = _CustomerDocumentDetail;
  factory CustomerDocumentDetail.empty() => CustomerDocumentDetail(
        billingDocumentItem: '',
        salesDocumentItemType: StringValue(''),
        materialNumber: MaterialNumber(''),
        billingDocumentItemText: '',
        billingQuantity: IntegerValue('0'),
        billingQuantityUnit: '',
        salesMeasureISOUnit: '',
        referenceSDDocument: '',
        referenceSDDocumentItem: '',
        referenceSDDocumentCategory: '',
        grossAmount: 0.0,
        netAmount: 0.0,
        taxAmount: 0.0,
        transactionCurrency: '',
        batchNumber: BatchNumber(''),
        expiryDate: DateTimeStringValue(''),
        principalCode: PrincipalCode(''),
        principalName: PrincipalName(''),
        productImages: ProductImages.empty(),
      );
}

extension CustomerDocumentDetailExtension on List<CustomerDocumentDetail> {
  List<CustomerDocumentDetailGroup> get groupList {
    return List<CustomerDocumentDetail>.from(this)
        .groupListsBy((item) => item.principalName)
        .entries
        .map(
          (entry) => CustomerDocumentDetailGroup(
            principalName: entry.key,
            items: entry.value,
          ),
        )
        .toList();
  }
}

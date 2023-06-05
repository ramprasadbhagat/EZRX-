import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_document_detail.freezed.dart';

@freezed
class CustomerDocumentDetail with _$CustomerDocumentDetail {
  const CustomerDocumentDetail._();

  const factory CustomerDocumentDetail({
    required String billingDocumentItem,
    required StringValue salesDocumentItemType,
    required StringValue material,
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
  }) = _CustomerDocumentDetail;
  factory CustomerDocumentDetail.empty() => CustomerDocumentDetail(
        billingDocumentItem: '',
        salesDocumentItemType: StringValue(''),
        material: StringValue(''),
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
      );
}

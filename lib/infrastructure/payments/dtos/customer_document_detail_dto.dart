
import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_document_detail.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_document_detail_dto.freezed.dart';
part 'customer_document_detail_dto.g.dart';

@freezed
class CustomerDocumentDetailDto with _$CustomerDocumentDetailDto {
  const CustomerDocumentDetailDto._();
  factory CustomerDocumentDetailDto({
    @JsonKey(
      name: 'billingDocumentItem',
      defaultValue: '',
    )
        required String billingDocumentItem,
    @JsonKey(
      name: 'salesDocumentItemType',
      defaultValue: '',
    )
        required String salesDocumentItemType,
    @JsonKey(
      name: 'material',
      defaultValue: '',
    )
        required String materialNumber,
    @JsonKey(
      name: 'billingDocumentItemText',
      defaultValue: '',
    )
        required String billingDocumentItemText,
    @JsonKey(
      name: 'billingQuantity',
      defaultValue: '',
    )
        required String billingQuantity,
    @JsonKey(
      name: 'billingQuantityUnit',
      defaultValue: '',
    )
        required String billingQuantityUnit,
    @JsonKey(
      name: 'salesMeasureISOUnit',
      defaultValue: '',
    )
        required String salesMeasureISOUnit,
    @JsonKey(
      name: 'referenceSDDocument',
      defaultValue: '',
    )
        required String referenceSDDocument,
    @JsonKey(
      name: 'referenceSDDocumentItem',
      defaultValue: '',
    )
        required String referenceSDDocumentItem,
    @JsonKey(
      name: 'referenceSDDocumentCategory',
      defaultValue: '',
    )
        required String referenceSDDocumentCategory,
    @JsonKey(
      name: 'grossAmount',
      defaultValue: 0.0,
    )
        required double grossAmount,
    @JsonKey(
      name: 'netAmount',
      defaultValue: 0.0,
    )
        required double netAmount,
    @JsonKey(
      name: 'taxAmount',
      defaultValue: 0.0,
    )
        required double taxAmount,
    @JsonKey(
      name: 'transactionCurrency',
      defaultValue: '',
    )
        required String transactionCurrency,
    @JsonKey(
      name: 'batchNumber',
      defaultValue: '',
    )
        required String batchNumber,
    @JsonKey(
      name: 'expiryDate',
      defaultValue: '',
    )
        required String expiryDate,
    @JsonKey(
      name: 'principalName',
      defaultValue: '',
    )
        required String principalName,
    @JsonKey(
      name: 'principalCode',
      defaultValue: '',
    )
        required String principalCode,
  }) = _CustomerDocumentDetailDto;

  CustomerDocumentDetail toDomain() {
    return CustomerDocumentDetail(
      billingDocumentItem: billingDocumentItem,
      salesDocumentItemType: StringValue(salesDocumentItemType),
      materialNumber: MaterialNumber(materialNumber),
      billingDocumentItemText: billingDocumentItemText,
      billingQuantity: IntegerValue(billingQuantity),
      billingQuantityUnit: billingQuantityUnit,
      salesMeasureISOUnit: salesMeasureISOUnit,
      referenceSDDocument: referenceSDDocument,
      referenceSDDocumentItem: referenceSDDocumentItem,
      referenceSDDocumentCategory: referenceSDDocumentCategory,
      grossAmount: grossAmount,
      netAmount: netAmount,
      taxAmount: taxAmount,
      transactionCurrency: transactionCurrency,
      batchNumber: BatchNumber(batchNumber),
      expiryDate: DateTimeStringValue(expiryDate),
      principalName: PrincipalName(principalName),
      principalCode: PrincipalCode(principalCode),
      productImages: ProductImages.empty(),
    );
  }

  factory CustomerDocumentDetailDto.fromJson(Map<String, dynamic> json) =>
      _$CustomerDocumentDetailDtoFromJson(json);
}

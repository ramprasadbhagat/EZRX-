import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/core/value/value_objects.dart';

import 'package:ezrxmobile/domain/payments/entities/payment_item.dart';

part 'payment_item_dto.freezed.dart';
part 'payment_item_dto.g.dart';

@freezed
class PaymentItemDto with _$PaymentItemDto {
  const PaymentItemDto._();

  const factory PaymentItemDto({
    @JsonKey(name: 'accountingDocument', defaultValue: '')
        required String accountingDocument,
    @JsonKey(name: 'accountingDocumentItem', defaultValue: '')
        required String accountingDocumentItem,
    @JsonKey(
      name: 'netDueDate',
      defaultValue: '',
    )
        required String netDueDate,
    @JsonKey(
      name: 'postingDate',
      defaultValue: '',
    )
        required String postingDate,
    @JsonKey(
      name: 'documentDate',
      defaultValue: '',
    )
        required String documentDate,
    @JsonKey(name: 'paymentAmountInDisplayCrcy', defaultValue: 0)
        required double paymentAmountInDisplayCrcy,
    @JsonKey(name: 'postingKeyName', defaultValue: '')
        required String postingKeyName,
    @JsonKey(name: 'accountingDocumentType', defaultValue: '')
        required String accountingDocumentType,
  }) = _PaymentItemDto;

  PaymentItem toDomain() {
    return PaymentItem(
      accountingDocument: accountingDocument,
      accountingDocumentItem: accountingDocumentItem,
      netDueDate: DateTimeStringValue(netDueDate),
      postingDate: DateTimeStringValue(postingDate),
      documentDate: DateTimeStringValue(documentDate),
      paymentAmountInDisplayCrcy:
          double.parse(paymentAmountInDisplayCrcy.toString()),
      postingKeyName: postingKeyName,
      accountingDocumentType: AmountDocumentType(accountingDocumentType),
    );
  }

  factory PaymentItemDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentItemDtoFromJson(json);
}

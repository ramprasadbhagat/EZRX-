import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_open_item_dto.freezed.dart';
part 'customer_open_item_dto.g.dart';

@freezed
class CustomerOpenItemDto with _$CustomerOpenItemDto {
  const CustomerOpenItemDto._();
  factory CustomerOpenItemDto({
    @JsonKey(
      name: 'status',
      defaultValue: '',
    )
        required String status,
    @JsonKey(
      name: 'accountingDocument',
      defaultValue: '',
    )
        required String accountingDocument,
    @JsonKey(
      name: 'netDueDate',
      defaultValue: '',
    )
        required String netDueDate,
    @JsonKey(
      name: 'documentReferenceID',
      defaultValue: '',
    )
        required String documentReferenceID,
    @JsonKey(
      name: 'postingKeyName',
      defaultValue: '',
    )
        required String postingKeyName,
    @JsonKey(
      name: 'amountInTransactionCurrency',
      defaultValue: 0,
    )
        required double amountInTransactionCurrency,
  }) = _CustomerOpenItemDto;

  CustomerOpenItem toDomain() {
    return CustomerOpenItem(
      status: StatusType(status),
      amountInTransactionCurrency: amountInTransactionCurrency,
      accountingDocument: accountingDocument,
      postingKeyName: postingKeyName,
      netDueDate: DateTimeStringValue(netDueDate),
      documentReferenceID: documentReferenceID,
    );
  }

  factory CustomerOpenItemDto.fromJson(Map<String, dynamic> json) =>
      _$CustomerOpenItemDtoFromJson(json);
}

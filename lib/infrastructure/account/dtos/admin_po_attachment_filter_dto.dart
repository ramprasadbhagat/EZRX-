import 'package:ezrxmobile/domain/account/entities/admin_po_attachment_filter.dart';
import 'package:ezrxmobile/infrastructure/core/common/json_key_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_po_attachment_filter_dto.freezed.dart';
part 'admin_po_attachment_filter_dto.g.dart';

@freezed
class AdminPoAttachmentFilterDto with _$AdminPoAttachmentFilterDto {
  const AdminPoAttachmentFilterDto._();
  factory AdminPoAttachmentFilterDto({
    @JsonKey(
      name: 'orderNumber',
      defaultValue: '',
      toJson: valueOrNullToJson,
    )
    required String orderNumber,
    @JsonKey(
      name: 'exRxNo',
      defaultValue: '',
      toJson: valueOrNullToJson,
    )
    required String exRxNo,
    @JsonKey(
      name: 'salesOrg',
      defaultValue: '',
      toJson: valueOrNullToJson,
    )
    required String salesOrg,
    @JsonKey(
      name: 'soldTo',
      defaultValue: '',
      toJson: valueOrNullToJson,
    )
    required String soldTo,
    @JsonKey(
      name: 'toDate',
      defaultValue: '',
      toJson: valueOrNullToJson,
    )
    required String toDate,
    @JsonKey(
      name: 'fromDate',
      defaultValue: '',
      toJson: valueOrNullToJson,
    )
    required String fromDate,
  }) = _AdminPoAttachmentFilterDto;

  factory AdminPoAttachmentFilterDto.fromJson(Map<String, dynamic> json) =>
      _$AdminPoAttachmentFilterDtoFromJson(json);

  factory AdminPoAttachmentFilterDto.fromDomain(
    AdminPoAttachmentFilter adminPoAttachmentFilter,
  ) {
    return AdminPoAttachmentFilterDto(
      orderNumber: adminPoAttachmentFilter.orderNumber.searchValueOrEmpty,
      exRxNo: adminPoAttachmentFilter.exRxNo.searchValueOrEmpty,
      salesOrg: adminPoAttachmentFilter.salesOrg.getOrDefaultValue(''),
      soldTo: adminPoAttachmentFilter.soldTo.customerCodeSoldTo,
      toDate: adminPoAttachmentFilter.toDate.apiDateTimeString,
      fromDate: adminPoAttachmentFilter.fromDate.apiDateTimeString,
    );
  }
}

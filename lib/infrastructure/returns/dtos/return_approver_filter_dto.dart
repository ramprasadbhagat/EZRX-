import 'package:ezrxmobile/domain/returns/entities/return_approver_filter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_approver_filter_dto.freezed.dart';
part 'return_approver_filter_dto.g.dart';

@freezed
class ReturnApproverFilterDto with _$ReturnApproverFilterDto {
  factory ReturnApproverFilterDto({
    @JsonKey(
      name: 'returnId',
      defaultValue: '',
      includeIfNull: false,
      toJson: valueTojson,
    )
        required String returnId,
    @JsonKey(
      name: 'soldTo',
      defaultValue: '',
      includeIfNull: false,
      toJson: valueTojson,
    )
        required String soldTo,
    @JsonKey(
      name: 'shipTo',
      defaultValue: '',
      includeIfNull: false,
      toJson: valueTojson,
    )
        required String shipTo,
    @JsonKey(
      name: 'createdBy',
      defaultValue: '',
      includeIfNull: false,
      toJson: valueTojson,
    )
        required String createdBy,
    @JsonKey(
      name: 'dateTo',
      defaultValue: '',
      includeIfNull: false,
      toJson: valueTojson,
    )
        required String dateTo,
    @JsonKey(
      name: 'dateFrom',
      defaultValue: '',
      includeIfNull: false,
      toJson: valueTojson,
    )
        required String dateFrom,
    @JsonKey(
      name: 'status',
      defaultValue: '',
      includeIfNull: false,
      toJson: valueTojson,
    )
        required String status,
  }) = _ReturnApproverFilterDto;

  factory ReturnApproverFilterDto.fromDomain(
    ReturnApproverFilter returnApproverFilter,
  ) {
    return ReturnApproverFilterDto(
      returnId: returnApproverFilter.returnId.searchValueOrEmpty,
      createdBy: returnApproverFilter.createdBy.searchValueOrEmpty,
      soldTo: returnApproverFilter.soldTo.searchValueOrEmpty,
      shipTo: returnApproverFilter.shipTo.searchValueOrEmpty,
      dateTo:
          returnApproverFilter.toInvoiceDate.apiParameterValueOrEmpty,
      dateFrom:
          returnApproverFilter.fromInvoiceDate.apiParameterValueOrEmpty,
      status: returnApproverFilter.sortBy.apiSortValueOrEmpty,
    );
  }

  factory ReturnApproverFilterDto.fromJson(Map<String, dynamic> json) =>
      _$ReturnApproverFilterDtoFromJson(json);
}

dynamic valueTojson(String value) =>
    value.isNotEmpty ? value : null;


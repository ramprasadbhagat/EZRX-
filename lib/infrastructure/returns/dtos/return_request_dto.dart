import 'package:ezrxmobile/domain/returns/entities/return_request.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/material_basic_information_dto.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_item_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_request_dto.freezed.dart';
part 'return_request_dto.g.dart';

@freezed
class ReturnRequestDto with _$ReturnRequestDto {
  const ReturnRequestDto._();

  const factory ReturnRequestDto({
    @JsonKey(name: 'isSearchComplete', defaultValue: false)
        required bool isSearchComplete,
    @JsonKey(
      name: 'materialBasicInformation',
      defaultValue: <MaterialBasicInformationDto>[],
    )
        required List<MaterialBasicInformationDto> basicInformations,
    @JsonKey(
      name: 'materials',
      fromJson: _unmarshallMaterialItem,
      defaultValue: <ReturnItemDto>[],
    )
        required List<ReturnItemDto> items,
  }) = _ReturnRequestDto;

  factory ReturnRequestDto.fromDomain(
    ReturnRequest returnRequest,
  ) {
    return ReturnRequestDto(
      isSearchComplete: returnRequest.isSearchComplete,
      basicInformations: returnRequest.basicInformations
          .map((basicInfo) => MaterialBasicInformationDto.fromDomain(basicInfo))
          .toList(),
      items: returnRequest.items
          .map((item) => ReturnItemDto.fromDomain(item))
          .toList(),
    );
  }

  ReturnRequest toDomain() {
    return ReturnRequest(
      isSearchComplete: isSearchComplete,
      basicInformations:
          basicInformations.map((basicInfo) => basicInfo.toDomain()).toList(),
      items: items.map((item) => item.toDomain()).toList(),
    );
  }

  factory ReturnRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ReturnRequestDtoFromJson(json);
}

List<ReturnItemDto> _unmarshallMaterialItem(dynamic json) =>
    List<Map<String, dynamic>>.from(json)
        .map((e) => ReturnItemDto.fromJson(e['item']))
        .toList();

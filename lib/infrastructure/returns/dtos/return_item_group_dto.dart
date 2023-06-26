import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item_group.dart';
import 'package:ezrxmobile/infrastructure/returns/dtos/return_item_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'return_item_group_dto.freezed.dart';
part 'return_item_group_dto.g.dart';

@freezed
class ReturnItemGroupDto with _$ReturnItemGroupDto {
  const ReturnItemGroupDto._();

  const factory ReturnItemGroupDto({
    @JsonKey(name: 'requestDate', defaultValue: '') required String requestDate,
    @JsonKey(name: 'requestByItems', defaultValue: <ReturnItemDto>[])
        required List<ReturnItemDto> items,
  }) = _ReturnItemGroupDto;

  factory ReturnItemGroupDto.fromDomain(
    ReturnItemGroup returnItemGroup,
  ) {
    return ReturnItemGroupDto(
      requestDate: returnItemGroup.requestDate.getOrCrash(),
      items: returnItemGroup.items
          .map((e) => ReturnItemDto.fromDomain(e))
          .toList(),
    );
  }

  ReturnItemGroup toDomain() {
    return ReturnItemGroup(
      requestDate: DateTimeStringValue(requestDate),
      items: items.map((e) => e.toDomain()).toList(),
    );
  }

  factory ReturnItemGroupDto.fromJson(Map<String, dynamic> json) =>
      _$ReturnItemGroupDtoFromJson(json);
}

import 'package:ezrxmobile/domain/order/entities/create_draft_order.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_draft_order_dto.freezed.dart';
part 'create_draft_order_dto.g.dart';

@freezed
class CreateDraftOrderDto with _$CreateDraftOrderDto {
  const CreateDraftOrderDto._();
  const factory CreateDraftOrderDto({
    @JsonKey(name: 'draftOrder', defaultValue: false) required bool draftOrder,
  }) = _CreateDraftOrderDto;

  factory CreateDraftOrderDto.fromDomain(CreateDraftOrder draftOrder) {
    return CreateDraftOrderDto(
      draftOrder: draftOrder.draftOrder,
    );
  }

  CreateDraftOrder toDomain() {
    return CreateDraftOrder(
      draftOrder: draftOrder,
    );
  }

  factory CreateDraftOrderDto.fromJson(Map<String, dynamic> json) =>
      _$CreateDraftOrderDtoFromJson(json);
}

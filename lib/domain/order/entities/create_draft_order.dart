import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_draft_order.freezed.dart';

@freezed
class CreateDraftOrder with _$CreateDraftOrder {
  const CreateDraftOrder._();

  const factory CreateDraftOrder({
    required bool draftOrder,
  }) = _CreateDraftOrder;

  factory CreateDraftOrder.empty() => const CreateDraftOrder(
        draftOrder: false,
      );
}

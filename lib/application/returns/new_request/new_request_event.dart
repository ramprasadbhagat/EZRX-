part of 'new_request_bloc.dart';

@freezed
class NewRequestEvent with _$NewRequestEvent {
  const factory NewRequestEvent.initialized() = _initialized;

  const factory NewRequestEvent.toggleReturnItem({
    required SalesOrg salesOrg,
    required ReturnMaterial item,
    required bool selected,
  }) = _ToggleReturnItem;

  const factory NewRequestEvent.toggleBonusItem({
    required ReturnMaterial item,
    required bool included,
  }) = _ToggleBonusItem;

  const factory NewRequestEvent.additionInfoChanged({
    required ReturnItemDetails additionInfo,
  }) = _AdditionInfoChanged;

  const factory NewRequestEvent.toggleFiles({
    required String uuid,
    required List<ReturnRequestAttachment> files,
    required bool included,
  }) = _ToggleFiles;

  const factory NewRequestEvent.validateStep({
    required int step,
  }) = _ValidateStep;

  const factory NewRequestEvent.returnReferenceChanged(
    String returnReference,
  ) = _ReturnReferenceChanged;

  const factory NewRequestEvent.specialInstructionsChanged(
    String specialInstructions,
  ) = _SpecialInstructionsChanged;

  const factory NewRequestEvent.submit({
    required CustomerCodeInfo customerCodeInfo,
    required User user,
  }) = _Submit;
}

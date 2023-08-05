part of 'new_request_bloc.dart';

@freezed
class NewRequestEvent with _$NewRequestEvent {
  const factory NewRequestEvent.initialized() = _initialized;

  const factory NewRequestEvent.toggleReturnItem({
    required ReturnMaterial item,
    required bool selected,
  }) = _ToggleReturnItem;
}

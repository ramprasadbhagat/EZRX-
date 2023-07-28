part of 'new_request_bloc.dart';

@freezed
class NewRequestState with _$NewRequestState {
  const NewRequestState._();
  const factory NewRequestState({
    required List<ReturnMaterial> selectedItems,
  }) = _NewRequestState;

  factory NewRequestState.initial() => const NewRequestState(
        selectedItems: <ReturnMaterial>[],
      );
}

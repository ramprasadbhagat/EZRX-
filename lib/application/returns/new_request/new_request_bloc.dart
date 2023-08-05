import 'package:ezrxmobile/domain/returns/entities/return_material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_request_event.dart';
part 'new_request_state.dart';
part 'new_request_bloc.freezed.dart';

class NewRequestBloc extends Bloc<NewRequestEvent, NewRequestState> {
  NewRequestBloc() : super(NewRequestState.initial()) {
    on(_onEvent);
  }

  Future<void> _onEvent(
    NewRequestEvent event,
    Emitter<NewRequestState> emit,
  ) async {
    await event.map(
      initialized: (_) async => emit(NewRequestState.initial()),
      toggleReturnItem: (_ToggleReturnItem e) {
        if (e.selected) {
          emit(
            state.copyWith(
              selectedItems: List<ReturnMaterial>.from(state.selectedItems)
                ..add(e.item),
            ),
          );
        } else {
          emit(
            state.copyWith(
              selectedItems: List<ReturnMaterial>.from(state.selectedItems)
                ..remove(e.item),
            ),
          );
        }
      },
    );
  }
}

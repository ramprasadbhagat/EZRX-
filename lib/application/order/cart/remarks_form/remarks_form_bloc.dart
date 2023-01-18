import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'remarks_form_event.dart';
part 'remarks_form_state.dart';
part 'remarks_form_bloc.freezed.dart';

class RemarksFormBloc extends Bloc<RemarksFormEvent, RemarksFormState> {
  RemarksFormBloc() : super(RemarksFormState.initial()) {
    on<_RemarksChanged>((event, emit) {
      emit(
        state.copyWith(
          remarks: Remarks(event.message),
        ),
      );
    });
    on<_Submit>((event, emit) {
      emit(
        state.copyWith(
          showErrorMessages: false,
          isSubmitting: true,
        ),
      );
      if (state.remarks.isValid()) {
        emit(
          state.copyWith(
            isSubmitting: false,
          ),
        );
      } else {
        emit(
          state.copyWith(
            showErrorMessages: true,
            isSubmitting: false,
          ),
        );
      }
    });
  }
}

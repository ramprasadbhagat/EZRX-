import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/usage.dart';
import 'package:ezrxmobile/domain/returns/repository/i_usage_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/core/error/api_failures.dart';

part 'usage_code_bloc.freezed.dart';
part 'usage_code_event.dart';
part 'usage_code_state.dart';

class UsageCodeBloc extends Bloc<UsageCodeEvent, UsageCodeState> {
  final IUsageRepository usageRepository;

  UsageCodeBloc({required this.usageRepository})
      : super(UsageCodeState.initial()) {
    on<UsageCodeEvent>(_onEvent);
  }

  Future<void> _onEvent(
    UsageCodeEvent event,
    Emitter<UsageCodeState> emit,
  ) async {
    await event.map(
      initialized: (e) async => emit(UsageCodeState.initial()),
      fetch: (e) async {
        final failureOrSuccess = await usageRepository.getUsages(
          salesOrg: e.salesOrg,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(state.copyWith(
              usageFailureOrSuccessOption: optionOf(failureOrSuccess),
            ));
          },
          (usage) => emit(state.copyWith(
            usage: usage,
            usageFailureOrSuccessOption: none(),
          )),
        );
      },
    );
  }
}

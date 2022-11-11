import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/sales_representative_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/repository/i_sales_rep_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_rep_bloc.freezed.dart';
part 'sales_rep_event.dart';
part 'sales_rep_state.dart';

class SalesRepBloc extends Bloc<SalesRepEvent, SalesRepState> {
  final ISalesRepRepository salesRepRepository;
  SalesRepBloc({
    required this.salesRepRepository,
  }) : super(SalesRepState.initial()) {
    on<SalesRepEvent>(_onEvent);
  }

  Future<void> _onEvent(
    SalesRepEvent event,
    Emitter<SalesRepState> emit,
  ) async {
    await event.map(
      initialized: (e) async => emit(SalesRepState.initial()),
      fetch: (e) async {
        final failureOrSuccess = await salesRepRepository.getSalesRepInfo(
          user: e.user,
        );
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                salesRepFailureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
          (info) => emit(
            state.copyWith(
              salesRepInfo: info,
              salesRepFailureOrSuccessOption: none(),
            ),
          ),
        );
      },
    );
  }

  @override
  void onChange(Change<SalesRepState> change) {
    super.onChange(change);
  }
}

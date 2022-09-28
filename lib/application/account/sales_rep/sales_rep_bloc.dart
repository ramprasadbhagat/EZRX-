import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_representative_info.dart';
import 'package:ezrxmobile/domain/account/repository/i_sales_rep_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_rep_event.dart';
part 'sales_rep_state.dart';
part 'sales_rep_bloc.freezed.dart';

class SalesRepBloc extends Bloc<SalesRepEvent, SalesRepState> {
  final UserBloc userBloc;
  final ISalesRepRepository salesRepRepository;
  late final StreamSubscription _userBlocSubscription;
  SalesRepBloc({
    required this.userBloc,
    required this.salesRepRepository,
  }) : super(SalesRepState.initial()) {
    on<SalesRepEvent>(_onEvent);
    _userBlocSubscription = userBloc.stream.listen((userBlocState) {
      if (userBlocState.user.role.type.isSalesRep) {
        add(const SalesRepEvent.fetch());
      }
    });
  }

  Future<void> _onEvent(
    SalesRepEvent event,
    Emitter<SalesRepState> emit,
  ) async {
    await event.map(
      initialized: (e) async => emit(SalesRepState.initial()),
      fetch: (e) async {
        final failureOrSuccess = await salesRepRepository.getSalesRepInfo(
          userName: userBloc.state.user.username,
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
  Future<void> close() async {
    await _userBlocSubscription.cancel();

    return super.close();
  }

  @override
  void onChange(Change<SalesRepState> change) {
    super.onChange(change);
  }
}

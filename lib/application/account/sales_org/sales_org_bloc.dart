import 'dart:async';

import 'package:dartz/dartz.dart';

import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/repository/i_sales_org_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';

part 'sales_org_event.dart';
part 'sales_org_state.dart';
part 'sales_org_bloc.freezed.dart';

class SalesOrgBloc extends Bloc<SalesOrgEvent, SalesOrgState> {
  final ISalesOrgRepository salesOrgRepository;

  SalesOrgBloc({
    required this.salesOrgRepository,
  }) : super(SalesOrgState.initial()) {
    on<SalesOrgEvent>(_onEvent);
  }

  Future<void> _onEvent(
    SalesOrgEvent event,
    Emitter<SalesOrgState> emit,
  ) async {
    await event.map(
      initialized: (e) async => emit(SalesOrgState.initial()),
      selected: (e) async {
        emit(state.copyWith(salesOrganisation: e.salesOrganisation));
        final failureOrSuccess = await salesOrgRepository
            .getSalesOrganisationConfigs(e.salesOrganisation);
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                configs: SalesOrganisationConfigs.empty(),
                salesOrgFailureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
          (configs) => emit(
            state.copyWith(
              configs: configs,
              salesOrgFailureOrSuccessOption: none(),
            ),
          ),
        );
      },
    );
  }

  @override
  void onChange(Change<SalesOrgState> change) {
    super.onChange(change);
    // print(change);
  }
}

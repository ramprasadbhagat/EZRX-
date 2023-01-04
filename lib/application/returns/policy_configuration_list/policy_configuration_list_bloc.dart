import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/policy_configuration.dart';
import 'package:ezrxmobile/domain/returns/repository/i_poilcy_configuration_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'policy_configuration_list_event.dart';
part 'policy_configuration_list_state.dart';
part 'policy_configuration_list_bloc.freezed.dart';

class PolicyConfigurationListBloc
    extends Bloc<PolicyConfigurationListEvent, PolicyConfigurationListState> {
  final IPolicyConfigurationRepository policyConfigurationRepository;
  PolicyConfigurationListBloc({required this.policyConfigurationRepository})
      : super(PolicyConfigurationListState.initial()) {
    on(_onEvent);
  }

  Future<void> _onEvent(
    PolicyConfigurationListEvent event,
    Emitter<PolicyConfigurationListState> emit,
  ) async {
    await event.map(
      initialized: (_) async => emit(PolicyConfigurationListState.initial()),
      fetch: (e) async {
        emit(state.copyWith(failureOrSuccessOption: none(), isLoading: true));

        final failureOrSuccess = await policyConfigurationRepository
            .getPolicyConfigurationList(salesOrganisation: e.salesOrganisation);
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isLoading: false,
              ),
            );
          },
          (policyConfigurationList) {
            emit(
              state.copyWith(
                policyConfigurationList: policyConfigurationList,
                failureOrSuccessOption: none(),
                isLoading: false,
              ),
            );
          },
        );
      },
    );
  }
}

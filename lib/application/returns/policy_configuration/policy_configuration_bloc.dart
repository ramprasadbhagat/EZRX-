import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/policy_configuration.dart';
import 'package:ezrxmobile/domain/returns/repository/i_poilcy_configuration_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'policy_configuration_event.dart';
part 'policy_configuration_state.dart';
part 'policy_configuration_bloc.freezed.dart';

class PolicyConfigurationBloc
    extends Bloc<PolicyConfigurationEvent, PolicyConfigurationState> {
  final IPolicyConfigurationRepository policyConfigurationRepository;
  PolicyConfigurationBloc({required this.policyConfigurationRepository})
      : super(PolicyConfigurationState.initial()) {
    on(_onEvent);
  }

  Future<void> _onEvent(
    PolicyConfigurationEvent event,
    Emitter<PolicyConfigurationState> emit,
  ) async {
    await event.map(
      initialized: (_) async => emit(PolicyConfigurationState.initial()),
      fetch: (e) async {
        emit(
          state.copyWith(
            failureOrSuccessOption: none(),
            isLoading: true,
          ),
        );

        final failureOrSuccess = await policyConfigurationRepository
            .getPolicyConfiguration(salesOrganisation: e.salesOrganisation);
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
      delete: (e) async {
        emit(state.copyWith(
          failureOrSuccessOption: none(),
        ));

        final failureOrSuccess =
            await policyConfigurationRepository.getDeletePolicy(
          policyConfigurationItem: e.policyConfigurationItem,
          policyConfigurationList: state.policyConfigurationList,
        );
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
          (policyConfigurationList) {
            emit(
              state.copyWith(
                policyConfigurationList: policyConfigurationList,
                failureOrSuccessOption: none(),
              ),
            );
          },
        );
      },
      add: (e) async {
        emit(
          state.copyWith(
            failureOrSuccessOption: none(),
            isLoading: true,
          ),
        );

        final failureOrSuccess =
            await policyConfigurationRepository.getAddPolicy(
          policyConfigurationItems: e.policyConfigurationItems,
          policyConfigurationList: state.policyConfigurationList,
        );
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
      returnsAllowedSwitch: (e) async {
        emit(
          state.copyWith(
            returnsAllowed: ReturnsAllowed(
              !state.returnsAllowed.getOrCrash(),
            ),
          ),
        );
      },
    );
  }
}

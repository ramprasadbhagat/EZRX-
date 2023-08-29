import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/returns/entities/policy_configuration.dart';
import 'package:ezrxmobile/domain/returns/repository/i_policy_configuration_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
part 'policy_configuration_event.dart';
part 'policy_configuration_state.dart';
part 'policy_configuration_bloc.freezed.dart';

class PolicyConfigurationBloc
    extends Bloc<PolicyConfigurationEvent, PolicyConfigurationState> {
  final IPolicyConfigurationRepository policyConfigurationRepository;
  final Config config;
  PolicyConfigurationBloc({
    required this.policyConfigurationRepository,
    required this.config,
  }) : super(PolicyConfigurationState.initial()) {
    on<_Initialized>(
      (_, emit) async => emit(
        PolicyConfigurationState.initial(),
      ),
    );
    on<_Search>(
      (e, emit) {
        if (e.searchKey != state.searchKey.getValue()) {
          add(
            _Fetch(
              searchKey: e.searchKey,
              salesOrganisation: e.salesOrganisation,
            ),
          );
        }
      },
    );
    on<_Fetch>(
      (e, emit) async {
        emit(
          PolicyConfigurationState.initial().copyWith(
            isLoading: true,
            searchKey: SearchKey(e.searchKey),
          ),
        );

        final failureOrSuccess =
            await policyConfigurationRepository.getPolicyConfiguration(
          salesOrganisation: e.salesOrganisation,
          offset: state.policyConfigurationList.length,
          pageSize: config.pageSize,
          searchKey: SearchKey(e.searchKey),
        );
        failureOrSuccess.fold(
          (failure) {
            if (emit.isDone) return;
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isLoading: false,
                searchKey: SearchKey(e.searchKey),
              ),
            );
          },
          (policyConfigurationList) {
            if (emit.isDone) return;
            emit(
              state.copyWith(
                policyConfigurationList: policyConfigurationList,
                failureOrSuccessOption: none(),
                searchKey: SearchKey(e.searchKey),
                isLoading: false,
              ),
            );
          },
        );
      },
      transformer: restartable(),
    );
    on<_LoadMorePolicyConfigurations>(
      (e, emit) async {
        if (state.isLoading || !state.canLoadMorePolicyConfigurations) return;
        emit(
          state.copyWith(
            failureOrSuccessOption: none(),
            isLoading: true,
          ),
        );

        final failureOrSuccess =
            await policyConfigurationRepository.getPolicyConfiguration(
          salesOrganisation: e.salesOrganisation,
          offset: state.policyConfigurationList.length,
          pageSize: config.pageSize,
          searchKey: state.searchKey,
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
            final loadedPolicyConfigurations =
                List<PolicyConfiguration>.from(state.policyConfigurationList)
                  ..addAll(policyConfigurationList);
            emit(
              state.copyWith(
                policyConfigurationList: loadedPolicyConfigurations,
                failureOrSuccessOption: none(),
                isLoading: false,
                canLoadMorePolicyConfigurations:
                    policyConfigurationList.length >= config.pageSize,
              ),
            );
          },
        );
      },
    );
    on<_Delete>(
      (e, emit) async {
        emit(
          state.copyWith(
            failureOrSuccessOption: none(),
          ),
        );

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
    );
    on<_Add>(
      (e, emit) async {
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
    );
    on<_ReturnsAllowedSwitch>(
      (_, emit) => emit(
        state.copyWith(
          returnsAllowed: ReturnsAllowed(
            !state.returnsAllowed.getOrCrash(),
          ),
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/repository/i_tender_contract_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tender_contract_bloc.freezed.dart';

part 'tender_contract_event.dart';

part 'tender_contract_state.dart';

class TenderContractBloc
    extends Bloc<TenderContractEvent, TenderContractState> {
  ITenderContractRepository tenderContractRepository;

  TenderContractBloc({
    required this.tenderContractRepository,
  }) : super(TenderContractState.initial()) {
    on<TenderContractEvent>(_onEvent);
  }

  Future<void> _onEvent(event, emit) async {
    await event.map(
      initialized: (_) async => emit(TenderContractState.initial()),
      fetch: (e) async {
        emit(state.copyWith(
          isFetching: true,
          tenderContractList: [],
          apiFailureOrSuccessOption: none(),
        ));

        final failureOrSuccess =
            await tenderContractRepository.getTenderContractDetails(
          material: e.materialInfo,
          customerCodeInfo: e.customerCodeInfo,
          salesOrganisation: e.salesOrganisation,
          shipToInfo: e.shipToInfo,
        );

        failureOrSuccess.fold(
          (failure) => emit(state.copyWith(
            apiFailureOrSuccessOption: optionOf(failureOrSuccess),
            isFetching: false,
          )),
          (tenderContractList) {
            //If no 730 contract is present in the list, the first item must be a no contract item
            final notContainReason730 = !tenderContractList
                .any((element) => element.tenderOrderReason.is730);

            final newTenderContractList = notContainReason730
                ? (List<TenderContract>.from(tenderContractList)
                  ..insert(0, TenderContract.noContract()))
                : tenderContractList;

            //Select default if present else Select 730 contract if present, else select first item
            add(
              TenderContractEvent.selected(
                tenderContract:
                    e.defaultSelectedTenderContract != TenderContract.empty()
                        ? e.defaultSelectedTenderContract
                        : newTenderContractList.firstWhere(
                            (e) => e.tenderOrderReason.is730,
                            orElse: () => newTenderContractList.first,
                          ),
              ),
            );

            emit(state.copyWith(
              apiFailureOrSuccessOption: optionOf(failureOrSuccess),
              isFetching: false,
              tenderContractList: newTenderContractList,
            ));
          },
        );
      },
      selected: (e) {
        emit(
          state.copyWith(
            isFetching: false,
            selectedTenderContract: e.tenderContract,
          ),
        );
      },
      unselected: (e) {
        emit(
          state.copyWith(
            selectedTenderContract: TenderContract.empty(),
          ),
        );
      },
    );
  }
}

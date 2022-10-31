import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/repository/i_material_list_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'covid_material_list_event.dart';
part 'covid_material_list_state.dart';
part 'covid_material_list_bloc.freezed.dart';

const int _pageSize = 10;

class CovidMaterialListBloc
    extends Bloc<CovidMaterialListEvent, CovidMaterialListState> {
  final IMaterialListRepository materialListRepository;

  CovidMaterialListBloc({required this.materialListRepository})
      : super(CovidMaterialListState.initial()) {
    on<CovidMaterialListEvent>(_onEvent);
  }

  FutureOr<void> _onEvent(
    CovidMaterialListEvent event,
    Emitter<CovidMaterialListState> emit,
  ) async {
    await event.map(
      initialized: (e) async => emit(CovidMaterialListState.initial()),
      updateSearchKey: (e) async => emit(
        state.copyWith(
          searchKey: SearchKey.search(e.searchKey),
        ),
      ),
      fetch: (e) async {
        emit(
          state.copyWith(
            isFetching: true,
            materialList: <MaterialInfo>[],
            nextPageIndex: 0,
            apiFailureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess = await materialListRepository.getMaterialList(
          user: e.user,
          salesOrganisation: e.salesOrganisation,
          salesOrgConfig: e.configs,
          customerCodeInfo: e.customerCodeInfo,
          shipToInfo: e.shipToInfo,
          pageSize: _pageSize,
          offset: 0,
          orderBy: 'materialDescription_asc',
          searchKey: state.searchKey.getValue(),
          ispickandpackenabled: true,
          isForFoc: true,
          selectedMaterialFilter: MaterialFilter.empty(),
        );
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
          (materialList) {
            emit(
              state.copyWith(
                materialList: materialList,
                apiFailureOrSuccessOption: none(),
                isFetching: false,
                canLoadMore: materialList.length >= _pageSize,
                nextPageIndex: 1,
              ),
            );
          },
        );
      },
      loadMore: (e) async {
        if (state.isFetching || !state.canLoadMore) return;
        emit(
          state.copyWith(
            isFetching: true,
            apiFailureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess = await materialListRepository.getMaterialList(
          user: e.user,
          salesOrganisation: e.salesOrganisation,
          salesOrgConfig: e.configs,
          customerCodeInfo: e.customerCodeInfo,
          shipToInfo: e.shipToInfo,
          pageSize: _pageSize,
          offset: state.materialList.length,
          orderBy: 'materialDescription_asc',
          searchKey: state.searchKey.getValue(),
          ispickandpackenabled: true,
          isForFoc: true,
          selectedMaterialFilter: MaterialFilter.empty(),
        );

        await failureOrSuccess.fold(
          (failure) async {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
          (materialList) async {
            final newSavedOrders = List<MaterialInfo>.from(state.materialList)
              ..addAll(materialList);
            emit(
              state.copyWith(
                materialList: newSavedOrders,
                apiFailureOrSuccessOption: none(),
                isFetching: false,
                canLoadMore: materialList.length >= _pageSize,
                nextPageIndex: state.nextPageIndex + 1,
              ),
            );
          },
        );
      },
    );
  }
}

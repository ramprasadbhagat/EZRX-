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
import 'package:ezrxmobile/domain/order/entities/order_document_type.dart';
import 'package:ezrxmobile/domain/order/repository/i_material_list_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_list_bloc.freezed.dart';
part 'material_list_event.dart';
part 'material_list_state.dart';

int _pageSize = 10;

class MaterialListBloc extends Bloc<MaterialListEvent, MaterialListState> {
  final IMaterialListRepository materialListRepository;
  MaterialListBloc({
    required this.materialListRepository,
  }) : super(MaterialListState.initial()) {
    on<MaterialListEvent>(_onEvent);
  }

  Future<void> _onEvent(
    MaterialListEvent event,
    Emitter<MaterialListState> emit,
  ) async {
    await event.map(
      initialized: (e) async => emit(MaterialListState.initial()),
      updateSearchKey: (e) async {
        emit(
          state.copyWith(
            searchKey: SearchKey.search(e.searchKey),
          ),
        );
      },
      fetch: (e) async {
        // if (state.isFetching) return;
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
          selectedMaterialFilter: e.selectedMaterialFilter,
          orderDocumentType: e.orderDocumentType,
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
                selectedFilters: e.selectedMaterialFilter,
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
          selectedMaterialFilter: e.selectedMaterialFilter,
          orderDocumentType: e.orderDocumentType,
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
      searchMaterialList: (e) async {
        final failureOrSuccess =
            await materialListRepository.searchMaterialList(
          user: e.user,
          salesOrganisation: e.salesOrganisation,
          salesOrgConfig: e.configs,
          customerCodeInfo: e.customerCodeInfo,
          shipToInfo: e.shipToInfo,
          pageSize: _pageSize,
          offset: 0, //state.materialList.length,
          orderBy: 'materialDescription_asc',
          searchKey: state.searchKey.getValue(),
          selectedMaterialFilter: e.selectedMaterialFilter,
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
            emit(
              state.copyWith(
                materialList: materialList,
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

  @override
  void onChange(Change<MaterialListState> change) {
    super.onChange(change);
    // print(change);
  }
}

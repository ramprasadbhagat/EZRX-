import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_document_type.dart';
import 'package:ezrxmobile/domain/order/repository/i_material_list_repository.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_list_bloc.freezed.dart';
part 'material_list_event.dart';
part 'material_list_state.dart';

int _pageSize = 24;

class MaterialListBloc extends Bloc<MaterialListEvent, MaterialListState> {
  final IMaterialListRepository materialListRepository;

  MaterialListBloc({
    required this.materialListRepository,
  }) : super(MaterialListState.initial()) {
    on<_Initialized>((e, emit) async {
      emit(MaterialListState.initial());
    });
    on<_UpdateSearchKey>((e, emit) async {
      emit(
        state.copyWith(
          searchKey: SearchKey.search(e.searchKey),
        ),
      );
    });
    on<_Fetch>(
      (e, emit) async {
        emit(
          state.copyWith(
            isFetching: true,
            materialList: <MaterialInfo>[],
            nextPageIndex: 0,
            apiFailureOrSuccessOption: none(),
            isScanFromBarcode: false,
          ),
        );
        final failureOrSuccess = await materialListRepository.getMaterialList(
          salesOrganisation: e.salesOrganisation,
          salesOrgConfig: e.configs,
          customerCodeInfo: e.customerCodeInfo,
          shipToInfo: e.shipToInfo,
          pageSize: _pageSize,
          offset: 0,
          selectedMaterialFilter: e.selectedMaterialFilter,
          orderByName: 'asc',
        );
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              apiFailureOrSuccessOption: optionOf(failureOrSuccess),
              isFetching: false,
            ),
          ),
          (productResponse) {
            emit(
              state.copyWith(
                materialCount: productResponse.count,
                materialList: productResponse.products,
                apiFailureOrSuccessOption: none(),
                isFetching: false,
                canLoadMore: productResponse.products.length >= _pageSize,
                nextPageIndex: 1,
                selectedFilters: e.selectedMaterialFilter,
              ),
            );
          },
        );
      },
    );
    on<_LoadMore>((e, emit) async {
      if (state.isFetching || !state.canLoadMore) return;
      emit(
        state.copyWith(
          isFetching: true,
          apiFailureOrSuccessOption: none(),
          isScanFromBarcode: false,
        ),
      );
      final failureOrSuccess = await materialListRepository.getMaterialList(
        salesOrganisation: e.salesOrganisation,
        salesOrgConfig: e.configs,
        customerCodeInfo: e.customerCodeInfo,
        shipToInfo: e.shipToInfo,
        pageSize: _pageSize,
        offset: state.materialList.length,
        selectedMaterialFilter: e.selectedMaterialFilter,
        orderByName: 'asc',
      );
      failureOrSuccess.fold(
        (failure) => emit(
          state.copyWith(
            apiFailureOrSuccessOption: optionOf(failureOrSuccess),
            isFetching: false,
          ),
        ),
        (moreProduct) {
          final productList = List<MaterialInfo>.from(state.materialList)
            ..addAll(moreProduct.products);
          emit(
            state.copyWith(
              materialCount: moreProduct.count,
              materialList: productList,
              apiFailureOrSuccessOption: none(),
              isFetching: false,
              canLoadMore: productList.length >= _pageSize,
              nextPageIndex: state.nextPageIndex + 1,
              selectedFilters: e.selectedMaterialFilter,
            ),
          );
        },
      );
    });
    on<_AutoSearchMaterialList>(
      (e, emit) {
        if (e.searchKey != state.searchKey) {
          add(_SearchMaterialList(
            user: e.user,
            salesOrganisation: e.salesOrganisation,
            configs: e.configs,
            customerCodeInfo: e.customerCodeInfo,
            shipToInfo: e.shipToInfo,
            selectedMaterialFilter: e.selectedMaterialFilter,
            pickAndPack: e.pickAndPack,
            searchKey: e.searchKey,
          ));
        }
      },
    );
    on<_SearchMaterialList>(
      (e, emit) async {
        emit(
          state.copyWith(
            isFetching: true,
            searchKey: e.searchKey,
            materialList: <MaterialInfo>[],
            nextPageIndex: 0,
            apiFailureOrSuccessOption: none(),
            isScanFromBarcode: e.isScanSearch,
          ),
        );
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
          searchKey: state.searchKey.getOrDefaultValue(''),
          selectedMaterialFilter: e.selectedMaterialFilter,
          pickAndPack: e.pickAndPack,
        );
        await failureOrSuccess.fold(
          (failure) async {
            if (emit.isDone) return;
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
          (materialList) async {
            if (emit.isDone) return;
            emit(
              state.copyWith(
                materialList: materialList,
                apiFailureOrSuccessOption: none(),
                isFetching: false,
                canLoadMore: materialList.length >= _pageSize,
                nextPageIndex: state.nextPageIndex + 1,
                selectedFilters: e.selectedMaterialFilter,
              ),
            );
          },
        );
      },
      transformer: restartable(),
    );
    on<_DeletedSearchMaterialList>((e, emit) async {
      if (e.searchKey.getValue() != state.searchKey.getValue()) {
        add(const _UpdateSearchKey(searchKey: ''));
        add(_Fetch(
          salesOrganisation: e.salesOrganisation,
          configs: e.configs,
          customerCodeInfo: e.customerCodeInfo,
          shipToInfo: e.shipToInfo,
          selectedMaterialFilter: e.selectedMaterialFilter,
        ));
      }
    });
    on<_AddFavourite>(
      (e, emit) async {
        final failureOrSuccess = await materialListRepository.addFavourateData(
            materialNumber: e.item.materialNumber, materialList: state.materialList,);
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              apiFailureOrSuccessOption: optionOf(failureOrSuccess),
              isFetching: false,
            ),
          ),
          (favouriteResponse) {
            emit(
              state.copyWith(
                materialList: favouriteResponse,
                isFetching: false,
              ),
            );
          },
        );
      },
    );
    on<_DeleteFavourite>(
      ((e, emit) async {
        final failureOrSuccess =
            await materialListRepository.removeFavourateData(
          materialNumber: e.item.materialNumber,
          materialList: state.materialList,
          filter: state.selectedFilters.isFavourite,
        );
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              apiFailureOrSuccessOption: optionOf(failureOrSuccess),
              isFetching: false,
            ),
          ),
          (favouriteResponse) {
            emit(
              state.copyWith(
                materialList: favouriteResponse,
                isFetching: false,
              ),
            );
          },
        );
      }),
    );
  }

  @override
  void onChange(Change<MaterialListState> change) {
    super.onChange(change);
    // print(change);
  }
}

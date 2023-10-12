import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_filter.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/repository/i_favourites_repository.dart';
import 'package:ezrxmobile/domain/order/repository/i_material_list_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_list_bloc.freezed.dart';

part 'material_list_event.dart';

part 'material_list_state.dart';

class MaterialListBloc extends Bloc<MaterialListEvent, MaterialListState> {
  final IMaterialListRepository materialListRepository;
  final IFavouriteRepository favouriteRepository;
  final Config config;
  MaterialListBloc({
    required this.materialListRepository,
    required this.favouriteRepository,
    required this.config,
  }) : super(MaterialListState.initial()) {
    on<_Initialized>((e, emit) {
      emit(MaterialListState.initial());
    });
    on<_UpdateSearchKey>(
      (e, emit) {
        emit(
          state.copyWith(
            searchKey: SearchKey.search(e.searchKey),
          ),
        );
      },
    );
    on<_Fetch>(
      (e, emit) async {
        emit(
          state.copyWith(
            isFetching: true,
            materialList: <MaterialInfo>[],
            nextPageIndex: 0,
            apiFailureOrSuccessOption: none(),
            isScanFromBarcode: false,
            selectedMaterialFilter: state.selectedMaterialFilter.copyWith(
              isFavourite: e.selectedMaterialFilter.isFavourite,
              isFOCMaterial: e.selectedMaterialFilter.isFOCMaterial,
              bundleOffers: e.selectedMaterialFilter.bundleOffers,
              isProductOffer: e.selectedMaterialFilter.isProductOffer,
              sortBy: e.selectedMaterialFilter.sortBy,
              countryListSelected: e.selectedMaterialFilter.countryListSelected,
              brandList: e.selectedMaterialFilter.brandList,
              manufactureListSelected:
                  e.selectedMaterialFilter.manufactureListSelected,
              comboOffers: e.selectedMaterialFilter.comboOffers,
            ),
          ),
        );
        final failureOrSuccess = await materialListRepository.getMaterialList(
          salesOrganisation: e.salesOrganisation,
          salesOrgConfig: e.configs,
          customerCodeInfo: e.customerCodeInfo,
          shipToInfo: e.shipToInfo,
          pageSize: config.pageSize,
          offset: 0,
          selectedMaterialFilter: e.selectedMaterialFilter,
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
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
                canLoadMore: productResponse.products.length >= config.pageSize,
                nextPageIndex: 1,
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
        pageSize: config.pageSize,
        offset: state.materialList.length,
        selectedMaterialFilter: state.selectedMaterialFilter,
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
              canLoadMore: productList.length >= config.pageSize,
              nextPageIndex: state.nextPageIndex + 1,
            ),
          );
        },
      );
    });
    on<_AddFavourite>(
      (e, emit) async {
        final failureOrSuccess = await favouriteRepository.addToFavourites(
          materialNumber: e.item.materialNumber,
          list: state.materialList,
        );
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              apiFailureOrSuccessOption: optionOf(failureOrSuccess),
              isFetching: false,
            ),
          ),
          (updatedFavouritesList) {
            emit(
              state.copyWith(
                materialList: updatedFavouritesList
                    .map((e) => e as MaterialInfo)
                    .toList(),
                isFetching: false,
              ),
            );
          },
        );
      },
    );
    on<_DeleteFavourite>(
      ((e, emit) async {
        final failureOrSuccess = await favouriteRepository.removeFromFavourites(
          materialNumber: e.item.materialNumber,
          list: state.materialList,
        );
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              apiFailureOrSuccessOption: optionOf(failureOrSuccess),
              isFetching: false,
            ),
          ),
          (updatedFavouritesList) {
            emit(
              state.copyWith(
                materialList: updatedFavouritesList
                    .map((e) => e as MaterialInfo)
                    .toList(),
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
  }
}

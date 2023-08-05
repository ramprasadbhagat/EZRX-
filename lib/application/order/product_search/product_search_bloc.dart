import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/order/repository/i_product_search_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/order/entities/material_info.dart';

import 'package:ezrxmobile/domain/core/error/api_failures.dart';

import 'package:ezrxmobile/domain/core/value/value_objects.dart';

import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';

import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';

import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';

import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';

import 'package:ezrxmobile/domain/order/entities/product_suggestion_history.dart';

part 'product_search_event.dart';
part 'product_search_state.dart';
part 'product_search_bloc.freezed.dart';

const _pageSize = 24;

class ProductSearchBloc extends Bloc<ProductSearchEvent, ProductSearchState> {
  final IProductSearchRepository productSearchRepository;
  ProductSearchBloc({required this.productSearchRepository})
      : super(ProductSearchState.initial()) {
    on<_AutoSearchProduct>(
      (e, emit) {
        if (e.searchKey != state.searchKey.getValue()) {
          add(
            _SearchProduct(
              configs: e.configs,
              customerCodeInfo: e.customerCodeInfo,
              salesOrganization: e.salesOrganization,
              shipToInfo: e.shipToInfo,
              searchKey: e.searchKey,
            ),
          );
        }
      },
    );

    on<_SearchProduct>(
      (e, emit) async {
        emit(
          state.copyWith(
            searchKey: SearchKey(e.searchKey),
            suggestedProductList: <MaterialInfo>[],
            isSearching: true,
            canLoadMore: true,
            apiFailureOrSuccessOption: none(),
          ),
        );

        final failureOrSuccess =
            await productSearchRepository.searchProductList(
          salesOrganization: e.salesOrganization,
          salesOrgConfig: e.configs,
          customerCodeInfo: e.customerCodeInfo,
          shipToInfo: e.shipToInfo,
          searchKey: state.searchKey,
          pageSize: _pageSize,
          offset: state.suggestedProductList.length,
        );

        failureOrSuccess.fold(
          (failure) {
            if (emit.isDone) return;
            emit(
              state.copyWith(
                isSearching: false,
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
          (productResponse) {
            if (emit.isDone) return;
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                suggestedProductList: productResponse.products,
                isSearching: false,
              ),
            );
          },
        );
      },
      transformer: restartable(),
    );

    on<_LoadMoreProductList>(
      (e, emit) async {
        if (state.isSearching || !state.canLoadMore) return;
        emit(
          state.copyWith(
            isSearching: true,
          ),
        );

        final failureOrSuccess =
            await productSearchRepository.searchProductList(
          salesOrganization: e.salesOrganization,
          salesOrgConfig: e.configs,
          customerCodeInfo: e.customerCodeInfo,
          shipToInfo: e.shipToInfo,
          searchKey: state.searchKey,
          pageSize: _pageSize,
          offset: state.suggestedProductList.length,
        );

        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              isSearching: false,
              apiFailureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (productResponse) {
            final finalProductList =
                List<MaterialInfo>.from(state.suggestedProductList)
                  ..addAll(productResponse.products);
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                suggestedProductList: finalProductList,
                canLoadMore: productResponse.products.length >= _pageSize,
                isSearching: false,
              ),
            );
          },
        );
      },
    );

    on<_ClearSearch>(
      (e, emit) {
        emit(
          state.copyWith(
            searchKey: SearchKey(''),
            apiFailureOrSuccessOption: none(),
            canLoadMore: false,
            suggestedProductList: <MaterialInfo>[],
          ),
        );

        add(
          const ProductSearchEvent.fetchProductSearchSuggestionHistory(),
        );
      },
    );

    on<_FetchProductSearchSuggestionHistory>(
      (e, emit) async {
        final failureOrSuccess = await productSearchRepository.getSearchKeys();
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              apiFailureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (searchKeyList) => emit(
            state.copyWith(
              apiFailureOrSuccessOption: none(),
              productSuggestionHistory: searchKeyList,
            ),
          ),
        );
      },
    );

    on<_ClearProductSearchSuggestionHistory>(
      (e, emit) async {
        final failureOrSuccess =
            await productSearchRepository.clearSearchHistory();
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              apiFailureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (clearedHistory) => emit(
            state.copyWith(
              apiFailureOrSuccessOption: none(),
              productSuggestionHistory: ProductSuggestionHistory.empty(),
            ),
          ),
        );
      },
    );
  }
}

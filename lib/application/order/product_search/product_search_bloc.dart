import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/config.dart';
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
import 'package:rxdart/rxdart.dart';

part 'product_search_event.dart';
part 'product_search_state.dart';
part 'product_search_bloc.freezed.dart';

class ProductSearchBloc extends Bloc<ProductSearchEvent, ProductSearchState> {
  final IProductSearchRepository productSearchRepository;
  final Config config;
  ProductSearchBloc({
    required this.productSearchRepository,
    required this.config,
  }) : super(ProductSearchState.initial()) {
    on<_Initialized>((event, emit) async {
      emit(
        state.copyWith(
          salesOrganization: event.salesOrganization,
          configs: event.configs,
          customerCodeInfo: event.customerCodeInfo,
          shipToInfo: event.shipToInfo,
        ),
      );
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
    });
    on<_AutoSearchProduct>(
      (event, emit) {
        if (event.searchKey == state.searchKey) return;
        if (event.searchKey.isValid()) {
          add(
            _SearchProduct(
              searchKey: event.searchKey,
            ),
          );
        } else {
          emit(state.copyWith(searchKey: event.searchKey));
        }
      },
      transformer: (events, mapper) => events
          .debounceTime(
            Duration(milliseconds: config.autoSearchTimeout),
          )
          .asyncExpand(mapper),
    );

    on<_SearchProduct>(
      (event, emit) async {
        emit(
          state.copyWith(
            searchKey: event.searchKey,
            suggestedProductList: <MaterialInfo>[],
            isSearching: true,
            canLoadMore: true,
            apiFailureOrSuccessOption: none(),
          ),
        );

        final failureOrSuccess =
            await productSearchRepository.searchProductList(
          salesOrganization: state.salesOrganization,
          salesOrgConfig: state.configs,
          customerCodeInfo: state.customerCodeInfo,
          shipToInfo: state.shipToInfo,
          searchKey: event.searchKey,
          pageSize: config.pageSize,
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
      (event, emit) async {
        if (state.isSearching || !state.canLoadMore) return;
        emit(
          state.copyWith(
            isSearching: true,
          ),
        );

        final failureOrSuccess =
            await productSearchRepository.searchProductList(
          salesOrganization: state.salesOrganization,
          salesOrgConfig: state.configs,
          customerCodeInfo: state.customerCodeInfo,
          shipToInfo: state.shipToInfo,
          searchKey: state.searchKey,
          pageSize: config.pageSize,
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
                canLoadMore: productResponse.products.length >= config.pageSize,
                isSearching: false,
              ),
            );
          },
        );
      },
    );

    on<_ClearSearch>(
      (event, emit) {
        emit(
          state.copyWith(
            searchKey: SearchKey.search(''),
            apiFailureOrSuccessOption: none(),
            canLoadMore: false,
            suggestedProductList: <MaterialInfo>[],
          ),
        );
        add(
          ProductSearchEvent.initialized(
            salesOrganization: state.salesOrganization,
            configs: state.configs,
            customerCodeInfo: state.customerCodeInfo,
            shipToInfo: state.shipToInfo,
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

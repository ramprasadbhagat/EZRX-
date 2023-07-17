import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/aggregate/product_detail_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/product_images/repository/i_product_images_repository.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/repository/i_favourites_repository.dart';
import 'package:ezrxmobile/domain/order/repository/i_product_details_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';
part 'product_detail_bloc.freezed.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final IProductDetailRepository productDetailRepository;
  final IProductImagesRepository productImagesRepository;
  final IFavouriteRepository favouriteRepository;

  ProductDetailBloc({
    required this.productDetailRepository,
    required this.productImagesRepository,
    required this.favouriteRepository,
  }) : super(ProductDetailState.initial()) {
    on<ProductDetailEvent>(_onEvent);
  }

  FutureOr<void> _onEvent(
    ProductDetailEvent event,
    Emitter<ProductDetailState> emit,
  ) async {
    await event.map(
      initialized: (_Initialized e) async => emit(ProductDetailState.initial()),
      fetch: (_Fetch e) async {
        emit(
          state.copyWith(
            isFetching: true,
            productDetailAggregate: ProductDetailAggregate.empty(),
            selectedImageIndex: 0,
            failureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess = await productDetailRepository.getProductDetail(
          customerCodeInfo: e.customerCodeInfo,
          locale: e.locale,
          materialNumber: e.materialNumber,
          salesOrganisation: e.salesOrganisation,
          shipToInfo: e.shipToInfo,
          type: e.type,
        );
        await failureOrSuccess.fold(
          (failure) async => emit(
            state.copyWith(
              isFetching: false,
              failureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (materialInfo) async {
            emit(
              state.copyWith(
                isFetching: false,
                productDetailAggregate: state.productDetailAggregate.copyWith(
                  materialInfo: materialInfo,
                ),
              ),
            );
            if (e.type.typeBundle) return;
            add(
              _FetchStock(
                materialNumber:
                    state.productDetailAggregate.materialInfo.materialNumber,
                salesOrganisation: e.salesOrganisation,
                customerCodeInfo: e.customerCodeInfo,
                shipToInfo: e.shipToInfo,
                locale: e.locale,
              ),
            );
          },
        );
      },
      fetchStock: (_FetchStock e) async {
        emit(
          state.copyWith(
            isFetching: true,
            failureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess = await productDetailRepository.getStockInfo(
          materialNumber:
              state.productDetailAggregate.materialInfo.materialNumber,
          customerCodeInfo: e.customerCodeInfo,
          salesOrganisation: e.salesOrganisation,
        );

        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              isFetching: false,
              failureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (stock) => emit(
            state.copyWith(
              isFetching: false,
              productDetailAggregate: state.productDetailAggregate.copyWith(
                stockInfo: stock,
              ),
            ),
          ),
        );
        add(
          _FetchMetaData(
            salesOrganisation: e.salesOrganisation,
            customerCodeInfo: e.customerCodeInfo,
            shipToInfo: e.shipToInfo,
            locale: e.locale,
          ),
        );
      },
      fetchMetaData: (_FetchMetaData e) async {
        emit(
          state.copyWith(
            isFetching: true,
            failureOrSuccessOption: none(),
          ),
        );
        final metaDataFailureOrSuccess =
            await productDetailRepository.getItemProductMetaData(
          productDetailAggregate: state.productDetailAggregate,
        );
        metaDataFailureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              isFetching: false,
              failureOrSuccessOption: optionOf(metaDataFailureOrSuccess),
            ),
          ),
          (productDetailAggregate) => emit(
            state.copyWith(
              isFetching: false,
              productDetailAggregate: productDetailAggregate,
            ),
          ),
        );
        add(
          _FetchSimilarProduct(
            salesOrganisation: e.salesOrganisation,
            customerCodeInfo: e.customerCodeInfo,
            shipToInfo: e.shipToInfo,
            locale: e.locale,
          ),
        );
      },
      fetchSimilarProduct: (_FetchSimilarProduct e) async {
        emit(
          state.copyWith(
            isFetching: true,
            failureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess =
            await productDetailRepository.getSimilarProduct(
          customerCodeInfo: e.customerCodeInfo,
          locale: e.locale,
          materialNumber:
              state.productDetailAggregate.materialInfo.materialNumber,
          salesOrganisation: e.salesOrganisation,
          shipToInfo: e.shipToInfo,
          principalCode: state
              .productDetailAggregate.materialInfo.principalData.principalCode,
        );
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              isFetching: false,
              failureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (products) {
            emit(
              state.copyWith(
                isFetching: false,
                productDetailAggregate: state.productDetailAggregate.copyWith(
                  similarProduct: products,
                ),
              ),
            );
            add(
              _FetchProductImage(
                materialNumbers: state.productDetailAggregate.similarProduct
                    .map((e) => e.materialNumber)
                    .toList(),
              ),
            );
          },
        );
      },
      fetchProductImage: (_FetchProductImage e) async {
        emit(
          state.copyWith(
            isFetching: true,
            failureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess = await productImagesRepository.getProductImages(
          list: state.productDetailAggregate.similarProduct,
        );
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              isFetching: false,
              failureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (products) => emit(
            state.copyWith(
              isFetching: false,
              productDetailAggregate: state.productDetailAggregate.copyWith(
                similarProduct: products.map((e) => e as MaterialInfo).toList(),
              ),
            ),
          ),
        );
      },
      changeImage: (_ChangeImage e) async => emit(
        state.copyWith(selectedImageIndex: e.index),
      ),
      addFavourite: (_AddFavourite e) async {
        emit(
          state.copyWith(
            failureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess = await favouriteRepository.addToFavourites(
          materialNumber: e.materialNumber,
          list: e.isForSimilarProduct
              ? state.productDetailAggregate.similarProduct
              : [state.productDetailAggregate.materialInfo],
        );
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              failureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (updatedFavouritesList) {
            emit(
              state.copyWith(
                productDetailAggregate: state.productDetailAggregate.copyWith(
                  materialInfo: !e.isForSimilarProduct
                      ? updatedFavouritesList.first
                      : state.productDetailAggregate.materialInfo,
                  similarProduct: e.isForSimilarProduct
                      ? updatedFavouritesList
                          .map((e) => e as MaterialInfo)
                          .toList()
                      : state.productDetailAggregate.similarProduct,
                ),
              ),
            );
          },
        );
      },
      deleteFavourite: (_DeleteFavourite e) async {
        emit(
          state.copyWith(
            failureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess = await favouriteRepository.removeFromFavourites(
          materialNumber: e.materialNumber,
          list: e.isForSimilarProduct
              ? state.productDetailAggregate.similarProduct
              : [state.productDetailAggregate.materialInfo],
        );
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              failureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (updatedFavouritesList) {
            emit(
              state.copyWith(
                productDetailAggregate: state.productDetailAggregate.copyWith(
                  materialInfo: !e.isForSimilarProduct
                      ? updatedFavouritesList.first
                      : state.productDetailAggregate.materialInfo,
                  similarProduct: e.isForSimilarProduct
                      ? updatedFavouritesList
                          .map((e) => e as MaterialInfo)
                          .toList()
                      : state.productDetailAggregate.similarProduct,
                ),
              ),
            );
          },
        );
      },
    );
  }
}

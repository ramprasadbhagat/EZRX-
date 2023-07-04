import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/aggregate/product_detail_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/domain/core/product_images/repository/i_product_images_repository.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/product_meta_data.dart';
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

  ProductDetailBloc({
    required this.productDetailRepository,
    required this.productImagesRepository,
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
        );
        await failureOrSuccess.fold(
          (failure) async => emit(
            state.copyWith(
              isFetching: false,
              failureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (productDetail) async => emit(
            state.copyWith(
              isFetching: false,
              productDetailAggregate: state.productDetailAggregate.copyWith(
                productDetail: productDetail,
              ),
            ),
          ),
        );
        add(
          _FetchStock(
            materialNumber: state.productDetailAggregate.materialNumber,
            salesOrganisation: e.salesOrganisation,
            customerCodeInfo: e.customerCodeInfo,
            shipToInfo: e.shipToInfo,
            locale: e.locale,
          ),
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
          materialNumber: state.productDetailAggregate.materialNumber,
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
          materialNumbers: [
            state.productDetailAggregate.materialNumber,
          ],
        );
        metaDataFailureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(isFetching: false),
          ),
          (metaData) => emit(
            state.copyWith(
              isFetching: false,
              productDetailAggregate: state.productDetailAggregate.copyWith(
                productImages: metaData.productImages.isNotEmpty
                    ? metaData.productImages.first
                    : ProductImages.empty(),
                productItem: metaData.items.isNotEmpty
                    ? metaData.items.first
                    : ProductItem.empty(),
              ),
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
          materialNumber: state.productDetailAggregate.materialNumber,
          salesOrganisation: e.salesOrganisation,
          shipToInfo: e.shipToInfo,
          principalCode: state
              .productDetailAggregate.productDetail.principalData.principalCode,
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
                  similarProduct:
                      products.map((e) => e as MaterialInfo).toList(),
              ),
            ),
          ),
        );
      },
      changeImage: (_ChangeImage e) async => emit(
        state.copyWith(selectedImageIndex: e.index),
      ),
    );
  }
}

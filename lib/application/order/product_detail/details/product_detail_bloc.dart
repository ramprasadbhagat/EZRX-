import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/aggregate/product_detail_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/product_meta_data.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/repository/i_favourites_repository.dart';
import 'package:ezrxmobile/domain/order/repository/i_product_details_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';
part 'product_detail_bloc.freezed.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  final IProductDetailRepository productDetailRepository;
  final IFavouriteRepository favouriteRepository;

  ProductDetailBloc({
    required this.productDetailRepository,
    required this.favouriteRepository,
  }) : super(ProductDetailState.initial()) {
    on<_Initialized>(
      (e, emit) async => emit(
        ProductDetailState.initial().copyWith(
          customerCodeInfo: e.customerCodeInfo,
          salesOrganisation: e.salesOrganisation,
          shipToInfo: e.shipToInfo,
          configs: e.configs,
        ),
      ),
    );
    on<_Fetch>(
      (e, emit) async {
        emit(
          state.copyWith(
            isDetailFetching: true,
            productDetailAggregate: ProductDetailAggregate.empty(),
            selectedImageIndex: 0,
            failureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess = await productDetailRepository.getProductDetail(
          customerCodeInfo: state.customerCodeInfo,
          language: state.configs.languageValue,
          materialNumber: e.materialInfo.materialNumber,
          salesOrganisation: state.salesOrganisation,
          shipToInfo: state.shipToInfo,
          type: e.materialInfo.type,
        );
        await failureOrSuccess.fold(
          (failure) async => emit(
            state.copyWith(
              isDetailFetching: false,
              failureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (materialInfo) {
            emit(
              state.copyWith(
                isDetailFetching: false,
                isStockFetching: true,
                productDetailAggregate: state.productDetailAggregate.copyWith(
                  materialInfo: materialInfo,
                ),
              ),
            );
            if (e.materialInfo.type.typeBundle) {
              add(
                _FetchStockForBundle(
                  materials: materialInfo.bundle.materials,
                ),
              );
            } else {
              add(
                _FetchStock(
                  materialNumber:
                      state.productDetailAggregate.materialInfo.materialNumber,
                ),
              );
              add(
                _FetchSimilarProduct(),
              );
            }
            add(
              _FetchMetaData(),
            );
          },
        );
      },
      transformer: restartable(),
    );
    on<_FetchStockForBundle>(
      ((e, emit) async {
        emit(
          state.copyWith(
            isStockFetching: true,
            failureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess = await productDetailRepository.getStockInfoList(
          materials: e.materials,
          customerCodeInfo: state.customerCodeInfo,
          salesOrganisation: state.salesOrganisation,
        );

        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              isStockFetching: false,
              failureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (stocks) {
            final materialInfoList =
                List<MaterialInfo>.from(e.materials).map((material) {
              final stock = stocks.firstWhere(
                (element) => element.materialNumber == material.materialNumber,
                orElse: () => MaterialStockInfo.empty(),
              );

              return material.copyWithStock(stockInfos: stock.stockInfos);
            }).toList();
            emit(
              state.copyWith(
                isStockFetching: false,
                productDetailAggregate: state.productDetailAggregate.copyWith(
                  materialInfo:
                      state.productDetailAggregate.materialInfo.copyWith(
                    bundle: state.productDetailAggregate.materialInfo.bundle
                        .copyWith(
                      materials: materialInfoList,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }),
      transformer: restartable(),
    );

    on<_FetchStock>(
      (e, emit) async {
        emit(
          state.copyWith(
            isStockFetching: true,
            failureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess = await productDetailRepository.getStockInfo(
          materialNumber:
              state.productDetailAggregate.materialInfo.materialNumber,
          customerCodeInfo: state.customerCodeInfo,
          salesOrganisation: state.salesOrganisation,
        );

        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              isStockFetching: false,
              failureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (stock) => emit(
            state.copyWith(
              isStockFetching: false,
              productDetailAggregate: state.productDetailAggregate.copyWith(
                stockInfo: stock,
              ),
            ),
          ),
        );
      },
      transformer: restartable(),
    );
    on<_FetchMetaData>(
      (e, emit) async {
        emit(
          state.copyWith(
            failureOrSuccessOption: none(),
            isMetadataFetching: true,
          ),
        );
        final metaDataFailureOrSuccess =
            await productDetailRepository.getItemProductMetaData(
          productDetailAggregate: state.productDetailAggregate,
        );
        metaDataFailureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              failureOrSuccessOption: optionOf(metaDataFailureOrSuccess),
              isMetadataFetching: false,
            ),
          ),
          (metadata) {
            final updatedProductDetailAggregate =
                state.productDetailAggregate.copyWith(
              materialInfo: state.productDetailAggregate.materialInfo.copyWith(
                productImages: metadata.productImages.isNotEmpty
                    ? metadata.productImages.first
                    : ProductImages.empty(),
              ),
              productItem: metadata.items.isNotEmpty
                  ? metadata.items.first
                  : ProductItem.empty(),
            );
            emit(
              state.copyWith(
                productDetailAggregate: updatedProductDetailAggregate,
                isMetadataFetching: false,
              ),
            );
          },
        );
      },
      transformer: restartable(),
    );
    on<_FetchSimilarProduct>(
      (e, emit) async {
        emit(
          state.copyWith(
            isRelatedProductsFetching: true,
            failureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess =
            await productDetailRepository.getSimilarProduct(
          customerCodeInfo: state.customerCodeInfo,
          language: state.configs.languageValue,
          materialNumber:
              state.productDetailAggregate.materialInfo.materialNumber,
          salesOrganisation: state.salesOrganisation,
          shipToInfo: state.shipToInfo,
          principalCode: state
              .productDetailAggregate.materialInfo.principalData.principalCode,
        );
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              isRelatedProductsFetching: false,
              failureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (products) {
            emit(
              state.copyWith(
                isRelatedProductsFetching: false,
                productDetailAggregate: state.productDetailAggregate.copyWith(
                  similarProduct: products,
                ),
                failureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
        );
      },
      transformer: restartable(),
    );
    on<_ChangeImage>(
      (e, emit) async => emit(
        state.copyWith(selectedImageIndex: e.index),
      ),
    );
    on<_FetchItemQuantityForZdp5Discount>(
      (e, emit) async => emit(
        state.copyWith(
          productDetailAggregate: state.productDetailAggregate.copyWith(
            materialInfo: state.productDetailAggregate.materialInfo
                .copyWith(quantity: MaterialQty(e.quantity)),
          ),
        ),
      ),
    );
    on<_SetExceedQty>(
      (e, emit) async => emit(
        state.copyWith(
          productDetailAggregate: state.productDetailAggregate.copyWith(
            exeedQty: e.exceedQty,
          ),
        ),
      ),
    );
    on<_AddFavourite>(
      (e, emit) async {
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
    );
    on<_DeleteFavourite>(
      (e, emit) async {
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
    on<_UpdateQty>((e, emit) {
      emit(state.copyWith(inputQty: e.qty));
    });
  }
}

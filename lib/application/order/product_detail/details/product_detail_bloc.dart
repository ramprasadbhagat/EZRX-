import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/aggregate/product_detail_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
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
  final IFavouriteRepository favouriteRepository;

  ProductDetailBloc({
    required this.productDetailRepository,
    required this.favouriteRepository,
  }) : super(ProductDetailState.initial()) {
    on<_Initialized>((e, emit) async => emit(ProductDetailState.initial()));
    on<_Fetch>(
      (e, emit) async {
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
          (materialInfo) {
            emit(
              state.copyWith(
                productDetailAggregate: state.productDetailAggregate.copyWith(
                  materialInfo: materialInfo,
                ),
              ),
            );
            e.type.typeBundle
                ? add(
                    _FetchStockForBundle(
                      materials: materialInfo.bundle.materials,
                      salesOrganisation: e.salesOrganisation,
                      customerCodeInfo: e.customerCodeInfo,
                      shipToInfo: e.shipToInfo,
                      locale: e.locale,
                    ),
                  )
                : add(
                    _FetchStock(
                      materialNumber: state
                          .productDetailAggregate.materialInfo.materialNumber,
                      salesOrganisation: e.salesOrganisation,
                      customerCodeInfo: e.customerCodeInfo,
                      shipToInfo: e.shipToInfo,
                      locale: e.locale,
                    ),
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
            isFetching: true,
            failureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess = await productDetailRepository.getStockInfoList(
          materials: e.materials,
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
                isFetching: false,
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

        add(
          _FetchMetaData(
            salesOrganisation: e.salesOrganisation,
            customerCodeInfo: e.customerCodeInfo,
            shipToInfo: e.shipToInfo,
            locale: e.locale,
            isForBundle: true,
          ),
        );
      }),
      transformer: restartable(),
    );

    on<_FetchStock>(
      (e, emit) async {
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
            isForBundle: false,
          ),
        );
      },
      transformer: restartable(),
    );
    on<_FetchMetaData>(
      (e, emit) async {
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
        if (!e.isForBundle) {
          add(
            _FetchSimilarProduct(
              salesOrganisation: e.salesOrganisation,
              customerCodeInfo: e.customerCodeInfo,
              shipToInfo: e.shipToInfo,
              locale: e.locale,
            ),
          );
        }
      },
      transformer: restartable(),
    );
    on<_FetchSimilarProduct>(
      (e, emit) async {
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
  }
}

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/material_item_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/order_document_type.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/infrastructure/order/repository/cart_repository.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';

part 'cart_bloc.freezed.dart';
part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository repository;
  CartBloc(this.repository) : super(CartState.initial()) {
    on<_Initialized>((e, emit) async {
      emit(CartState.initial());
    });
    on<_Fetch>((e, emit) async {
      emit(state.copyWith(
        isFetching: true,
        apiFailureOrSuccessOption: none(),
        cartItems: [],
      ));
      final failureOrSuccess = repository.fetchCart();
      await failureOrSuccess.fold(
        (failure) async {
          emit(
            state.copyWith(
              apiFailureOrSuccessOption: optionOf(failureOrSuccess),
              isFetching: false,
            ),
          );
        },
        (cartItemList) async {
          final result = await repository.saveToCartWithUpdatedStockInfo(
            cartItem: cartItemList,
            customerCodeInfo: e.customerCodeInfo,
            salesOrganisationConfigs: e.salesOrganisationConfigs,
            salesOrganisation: e.salesOrganisation,
            shipToInfo: e.shipToInfo,
          );
          final cartWithStockInfo = result.getOrElse(() => <CartItem>[]);

          if (cartWithStockInfo.allOutOfStock(
            allowOutOfStock: !e.doNotAllowOutOfStockMaterials,
          )) {
            emit(
              state.copyWith(
                isFetching: false,
              ),
            );

            return;
          }

          emit(
            state.copyWith(
              cartItems: repository.updateDiscountQty(
                items: cartWithStockInfo,
              ),
              apiFailureOrSuccessOption: none(),
              isFetching: false,
            ),
          );
        },
      );
    });
    on<_AddMaterialToCart>((e, emit) async {
      emit(
        state.copyWith(
          apiFailureOrSuccessOption: none(),
          isFetching: true,
        ),
      );

      final result = await repository.getStockInfo(
        material: e.item.materialInfo,
        customerCodeInfo: e.customerCodeInfo,
        salesOrganisationConfigs: e.salesOrganisationConfigs,
        salesOrganisation: e.salesOrganisation,
        shipToInfo: e.shipToInfo,
      );
      final stockInfo = result.getOrElse(() => StockInfo.empty());
      if (!stockInfo.inStock.isMaterialInStock &&
          e.doNotallowOutOfStockMaterial) {
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('Product Not Available'),
              ),
            ),
            isFetching: false,
          ),
        );

        return;
      }
      final failureOrSuccess = await repository.addItemToCart(
        cartItem: CartItem.material(
          e.item.copyWith(
            stockInfo: stockInfo,
          ),
        ),
        override: e.overrideQty,
      );

      await failureOrSuccess.fold(
        (failure) {
          emit(
            state.copyWith(
              apiFailureOrSuccessOption: optionOf(failureOrSuccess),
              isFetching: false,
            ),
          );
        },
        (cartItemList) async {
          emit(
            state.copyWith(
              cartItems: repository.updateDiscountQty(
                items: cartItemList,
              ),
              apiFailureOrSuccessOption: none(),
              isFetching: false,
            ),
          );
          add(
            _VerifyMaterialDealBonus(
              item: e.item,
              salesOrganisationConfigs: e.salesOrganisationConfigs,
              salesOrganisation: e.salesOrganisation,
              customerCodeInfo: e.customerCodeInfo,
              shipToInfo: e.shipToInfo,
            ),
          );
        },
      );
    });
    on<_VerifyMaterialDealBonus>((e, emit) async {
      final cartItem = state.getMaterialCartItem(material: e.item);
      final material = cartItem.materials.first;

      if (!material.refreshAddedBonus) {
        return;
      }
      emit(
        state.copyWith(
          apiFailureOrSuccessOption: none(),
          isFetching: true,
        ),
      );
      final failureOrSuccess = await repository.updateMaterialDealBonus(
        material: material,
        customerCodeInfo: e.customerCodeInfo,
        salesOrganisationConfigs: e.salesOrganisationConfigs,
        salesOrganisation: e.salesOrganisation,
        shipToInfo: e.shipToInfo,
      );

      await failureOrSuccess.fold(
        (failure) {
          emit(
            state.copyWith(
              apiFailureOrSuccessOption: optionOf(failureOrSuccess),
              isFetching: false,
            ),
          );
        },
        (cartItemList) async {
          emit(
            state.copyWith(
              cartItems: cartItemList,
              apiFailureOrSuccessOption: none(),
              isFetching: false,
            ),
          );
        },
      );
    });
    on<_AddBundleToCart>((e, emit) async {
      emit(
        state.copyWith(
          apiFailureOrSuccessOption: none(),
          isFetching: true,
        ),
      );

      final result = await repository.getStockInfoList(
        items: e.bundleItems.map((e) => e.materialInfo).toList(),
        customerCodeInfo: e.customerCodeInfo,
        salesOrganisationConfigs: e.salesOrganisationConfigs,
        salesOrganisation: e.salesOrganisation,
        shipToInfo: e.shipToInfo,
      );
      final stockInfoMap = result.getOrElse(() => {});
      final bundleWithStock = CartItem.bundle(e.bundleItems).copyWithStockInfo(
        stockInfoMap: stockInfoMap,
      );
      if ([bundleWithStock].allOutOfStock(
            allowOutOfStock: !e.doNotallowOutOfStockMaterial,
          ) ||
          stockInfoMap.isEmpty) {
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('Product Not Available'),
              ),
            ),
            isFetching: false,
          ),
        );

        return;
      }

      final failureOrSuccess = await repository.addItemToCart(
        cartItem: bundleWithStock,
        override: false,
      );

      await failureOrSuccess.fold(
        (failure) {
          emit(
            state.copyWith(
              apiFailureOrSuccessOption: optionOf(failureOrSuccess),
              isFetching: false,
            ),
          );
        },
        (cartItemList) async {
          emit(
            state.copyWith(
              cartItems: cartItemList,
              apiFailureOrSuccessOption: none(),
              isFetching: false,
            ),
          );
        },
      );
    });
    on<_UpdateBundleItemQty>((e, emit) async {
      emit(
        state.copyWith(
          apiFailureOrSuccessOption: none(),
          isFetching: true,
        ),
      );

      final result = await repository.getStockInfo(
        material: e.updatedQtyItem.materialInfo,
        customerCodeInfo: e.customerCodeInfo,
        salesOrganisationConfigs: e.salesOrganisationConfigs,
        salesOrganisation: e.salesOrganisation,
        shipToInfo: e.shipToInfo,
      );
      final stockInfo = result.getOrElse(() => StockInfo.empty());
      if (!stockInfo.inStock.isMaterialInStock &&
          e.doNotallowOutOfStockMaterial) {
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('Product Not Available'),
              ),
            ),
            isFetching: false,
          ),
        );

        return;
      }
      final updatedBundle = e.currentBundle.copyWith(
        materials: e.currentBundle.materials.map((item) {
          if (item.getMaterialNumber == e.updatedQtyItem.getMaterialNumber) {
            return item.copyWith(
              quantity: e.updatedQtyItem.quantity,
              stockInfo: stockInfo,
            );
          }

          return item;
        }).toList(),
      );

      final failureOrSuccess = await repository.addItemToCart(
        cartItem: updatedBundle,
        override: true,
      );

      await failureOrSuccess.fold(
        (failure) {
          emit(
            state.copyWith(
              apiFailureOrSuccessOption: optionOf(failureOrSuccess),
              isFetching: false,
            ),
          );
        },
        (cartItemList) async {
          emit(
            state.copyWith(
              cartItems: cartItemList,
              apiFailureOrSuccessOption: none(),
              isFetching: false,
            ),
          );
        },
      );
    });
    on<_RemoveFromCart>((e, emit) async {
      emit(state.copyWith(
        isFetching: true,
        apiFailureOrSuccessOption: none(),
      ));

      final failureOrSuccess = await repository.deleteFromCart(
        item: e.item,
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
        (cartItemList) {
          emit(
            state.copyWith(
              cartItems: repository.updateDiscountQty(items: cartItemList),
              apiFailureOrSuccessOption: none(),
              isFetching: false,
            ),
          );
        },
      );
    });
    on<_AddRemarkToCartItem>((e, emit) async {
      emit(state.copyWith(
        isFetching: true,
        apiFailureOrSuccessOption: none(),
      ));

      final failureOrSuccess = await repository.addRemarkToCartItem(
        remarkMessage: e.message,
        item: e.item,
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
        (cartItemList) {
          emit(
            state.copyWith(
              cartItems: cartItemList,
              apiFailureOrSuccessOption: none(),
              isFetching: false,
            ),
          );
        },
      );
    });
    on<_AddBonusToCartItem>((e, emit) async {
      emit(
        state.copyWith(
          apiFailureOrSuccessOption: none(),
          isFetching: true,
        ),
      );

      final result = await repository.getStockInfo(
        material: e.bonusItem.materialInfo,
        customerCodeInfo: e.customerCodeInfo,
        salesOrganisationConfigs: e.salesOrganisationConfigs,
        salesOrganisation: e.salesOrganisation,
        shipToInfo: e.shipToInfo,
      );
      final stockInfo = result.getOrElse(() => StockInfo.empty());
      if (!stockInfo.inStock.isMaterialInStock &&
          e.doNotallowOutOfStockMaterial) {
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('Product Not Available'),
              ),
            ),
            isFetching: false,
          ),
        );

        return;
      }
      final failureOrSuccess = await repository.addBonusToCartItem(
        item: e.item,
        newBonus: e.bonusItem.copyWith(
          inStock: stockInfo.inStock.getOrCrash(),
        ),
        overrideQty: e.overrideQty,
      );

      await failureOrSuccess.fold(
        (failure) {
          emit(
            state.copyWith(
              apiFailureOrSuccessOption: optionOf(failureOrSuccess),
              isFetching: false,
            ),
          );
        },
        (cartItemList) async {
          emit(
            state.copyWith(
              cartItems: cartItemList,
              apiFailureOrSuccessOption: none(),
              isFetching: false,
            ),
          );
        },
      );
    });
    on<_RemoveBonusFromCartItem>((e, emit) async {
      emit(state.copyWith(
        isFetching: true,
        apiFailureOrSuccessOption: none(),
      ));

      final failureOrSuccess = await repository.deleteBonusFromCartItem(
        item: e.item,
        deletedBonus: e.bonusItem,
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
        (cartItemList) {
          emit(
            state.copyWith(
              cartItems: cartItemList,
              apiFailureOrSuccessOption: none(),
              isFetching: false,
            ),
          );
        },
      );
    });
    on<_AddRemarkToBonusItem>((e, emit) async {
      emit(state.copyWith(
        isFetching: true,
        apiFailureOrSuccessOption: none(),
      ));

      final failureOrSuccess = await repository.addRemarkToBonusItem(
        remarkMessage: e.message,
        item: e.item,
        bonus: e.bonusItem,
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
        (cartItemList) {
          emit(
            state.copyWith(
              cartItems: cartItemList,
              apiFailureOrSuccessOption: none(),
              isFetching: false,
            ),
          );
        },
      );
    });
    on<_OverrideCartItemPrice>((e, emit) async {
      emit(state.copyWith(
        isFetching: true,
        apiFailureOrSuccessOption: none(),
      ));

      final failureOrSuccess = await repository.overrideCartItemPrice(
        item: e.cartItem,
        overridePriceList: e.overridenPrice,
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
        (cartItemList) {
          emit(
            state.copyWith(
              cartItems: cartItemList,
              apiFailureOrSuccessOption: none(),
              isFetching: false,
            ),
          );
        },
      );
    });
    on<_SelectButtonTapped>((e, emit) async {
      emit(state.copyWith(
        isFetching: true,
        apiFailureOrSuccessOption: none(),
      ));

      final failureOrSuccess = await repository.updateSelectionInCart(
        updatedItem: e.cartItem,
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
        (cartItemList) {
          emit(
            state.copyWith(
              cartItems: cartItemList,
              apiFailureOrSuccessOption: none(),
              isFetching: false,
            ),
          );
        },
      );
    });
    on<_SelectAllButtonTapped>((e, emit) async {
      emit(state.copyWith(
        isFetching: true,
        apiFailureOrSuccessOption: none(),
      ));

      final failureOrSuccess = await repository.updateAllSelectionInCart(
        currentCart: state.cartItems,
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
        (cartItemList) {
          emit(
            state.copyWith(
              cartItems: cartItemList,
              apiFailureOrSuccessOption: none(),
              isFetching: false,
            ),
          );
        },
      );
    });
    on<_ClearCart>((e, emit) async {
      emit(
        state.copyWith(
          apiFailureOrSuccessOption: none(),
          isClearing: true,
        ),
      );

      final failureOrSuccess = await repository.clearCart();
      await failureOrSuccess.fold(
        (failure) async {
          emit(
            state.copyWith(
              isClearing: false,
              apiFailureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          );
        },
        (cartItemList) async {
          emit(
            CartState.initial(),
          );
        },
      );
    });
    on<_ReplaceWithOrderItems>((e, emit) async {
      emit(
        state.copyWith(
          apiFailureOrSuccessOption: none(),
          isFetching: true,
        ),
      );

      final result = await repository.getStockInfoList(
        items: e.items.allMaterials.map((e) => e.materialInfo).toList(),
        customerCodeInfo: e.customerCodeInfo,
        salesOrganisationConfigs: e.salesOrganisationConfigs,
        salesOrganisation: e.salesOrganisation,
        shipToInfo: e.shipToInfo,
      );
      final stockInfoMap = result.getOrElse(
        () => {},
      );
      final itemsWithStockInfo = e.items
          .map(
            (item) => item.copyWithStockInfo(
              stockInfoMap: stockInfoMap,
            ),
          )
          .toList();

      if (itemsWithStockInfo.allOutOfStock(
        allowOutOfStock: !e.doNotallowOutOfStockMaterial,
      )) {
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: optionOf(
              const Left(
                ApiFailure.other('Product Not Available'),
              ),
            ),
            isFetching: false,
          ),
        );

        return;
      }

      final failureOrSuccess = await repository.replaceCartWithItems(
        items: itemsWithStockInfo,
      );

      await failureOrSuccess.fold(
        (failure) {
          emit(
            state.copyWith(
              apiFailureOrSuccessOption: optionOf(failureOrSuccess),
              isFetching: false,
            ),
          );
        },
        (cartItemList) async {
          emit(
            state.copyWith(
              cartItems: repository.updateDiscountQty(items: cartItemList),
              apiFailureOrSuccessOption: none(),
              isFetching: false,
            ),
          );
        },
      );
    });
  }
}

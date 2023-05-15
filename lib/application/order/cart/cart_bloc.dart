import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/material_item_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/order_document_type.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/price_combo_deal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/infrastructure/order/repository/cart_repository.dart';

part 'cart_bloc.freezed.dart';
part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository repository;
  CartBloc(this.repository) : super(CartState.initial()) {
    on<CartEvent>(_onEvent);
  }
  
  Future<void> _onEvent(CartEvent event, Emitter<CartState> emit) async {
    await event.map(
      initialized: (e) async => emit(CartState.initial()),
      fetch: (e) async {
        emit(
          state.copyWith(
            isFetching: true,
            apiFailureOrSuccessOption: none(),
            cartItems: [],
          ),
        );

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
              add(const _ClearCart());

              return;
            }

            if (!e.comboDealEligible) {
              emit(
                state.copyWith(
                  isFetching: false,
                ),
              );

              final comboDealCartItemIds = cartWithStockInfo
                  .where((item) => item.itemType == CartItemType.comboDeal)
                  .map((item) => item.id)
                  .toList();

              add(
                _ClearSelectedItemsFromCart(
                  selectedItemIds: comboDealCartItemIds,
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
      },
      addMaterialToCart: (e) async {
        final comboDeal = e.item.price.comboDeal;
        final inCartComboDeal = state.getComboDealCartItem(
          comboDealQuery: comboDeal,
        );
        if (inCartComboDeal.materials.isNotEmpty) {
          add(
            _UpdateMaterialQtyInCartItem(
              updatedQtyItem: e.item,
              currentItem: inCartComboDeal,
              salesOrganisationConfigs: e.salesOrganisationConfigs,
              salesOrganisation: e.salesOrganisation,
              customerCodeInfo: e.customerCodeInfo,
              shipToInfo: e.shipToInfo,
              doNotallowOutOfStockMaterial: e.doNotallowOutOfStockMaterial,
              overrideQty: false,
            ),
          );

          return;
        }
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            isFetching: true,
          ),
        );

        final failureOrSuccess = await repository.addItemToCart(
          cartItem: CartItem.material(
            e.item.copyWith(
              isSpecialOrderType: e.isSpecialOrderType,
            ),
          ),
          override: e.overrideQty,
          customerCodeInfo: e.customerCodeInfo,
          salesOrganisationConfigs: e.salesOrganisationConfigs,
          salesOrganisation: e.salesOrganisation,
          shipToInfo: e.shipToInfo,
          doNotAllowOutOfStockMaterials: e.doNotallowOutOfStockMaterial,
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
            if (e.isSpecialOrderType) return;
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
      },
      discountOverride: (e) async {
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            isFetching: true,
          ),
        );

        final failureOrSuccess = await repository.discountOverride(
          cartItem: CartItem.material(e.item),
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
      },
      verifyMaterialDealBonus: (e) async {
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
      },
      addBundleToCart: (e) async {
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            isFetching: true,
          ),
        );

        final failureOrSuccess = await repository.addItemToCart(
          cartItem: CartItem.bundle(e.bundleItems),
          override: false,
          customerCodeInfo: e.customerCodeInfo,
          salesOrganisationConfigs: e.salesOrganisationConfigs,
          salesOrganisation: e.salesOrganisation,
          shipToInfo: e.shipToInfo,
          doNotAllowOutOfStockMaterials: e.doNotallowOutOfStockMaterial,
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
      },
      updateMaterialQtyInCartItem: (e) async {
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            isFetching: true,
          ),
        );

        final failureOrSuccess = await repository.updateMaterialQtyInCartItem(
          cartItem: e.currentItem,
          updatedQtyItem: e.updatedQtyItem,
          customerCodeInfo: e.customerCodeInfo,
          salesOrganisationConfigs: e.salesOrganisationConfigs,
          salesOrganisation: e.salesOrganisation,
          shipToInfo: e.shipToInfo,
          doNotAllowOutOfStockMaterials: e.doNotallowOutOfStockMaterial,
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
                cartItems: cartItemList,
                apiFailureOrSuccessOption: none(),
                isFetching: false,
              ),
            );
          },
        );
      },
      removeFromCart: (e) async {
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
      },
      addRemarkToCartItem: (e) async {
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
      },
      addBonusToCartItem: (e) async {
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            isFetchingBonus: true,
          ),
        );

        final failureOrSuccess = await repository.addBonusToCartItem(
          item: e.item,
          newBonus: e.bonusItem,
          overrideQty: e.overrideQty,
          customerCodeInfo: e.customerCodeInfo,
          salesOrganisationConfigs: e.salesOrganisationConfigs,
          salesOrganisation: e.salesOrganisation,
          shipToInfo: e.shipToInfo,
          doNotAllowOutOfStockMaterials: e.doNotallowOutOfStockMaterial,
        );

        await failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isFetchingBonus: false,
              ),
            );
          },
          (cartItemList) async {
            emit(
              state.copyWith(
                cartItems: cartItemList,
                apiFailureOrSuccessOption: none(),
                isFetchingBonus: false,
              ),
            );
          },
        );
      },
      removeBonusFromCartItem: (e) async {
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
      },
      addRemarkToBonusItem: (e) async {
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
      },
      overrideCartItemPrice: (e) async {
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
      },
      selectButtonTapped: (e) async {
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
      },
      selectAllButtonTapped: (e) async {
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
      },
      clearCart: (e) async {
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
      },
      clearSelectedItemsFromCart: (e) async {
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            isClearing: true,
          ),
        );

        final failureOrSuccess = await repository.clearCartOnlySelectedItems(
          selectedItemIds: e.selectedItemIds,
        );
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
              state.copyWith(
                isClearing: false,
                cartItems: cartItemList,
              ),
            );
          },
        );
      },
      replaceWithOrderItems: (e) async {
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            isFetching: true,
          ),
        );

        final failureOrSuccess = await repository.replaceCartWithItems(
          items: e.items,
          customerCodeInfo: e.customerCodeInfo,
          salesOrganisationConfigs: e.salesOrganisationConfigs,
          salesOrganisation: e.salesOrganisation,
          shipToInfo: e.shipToInfo,
          doNotAllowOutOfStockMaterials: e.doNotallowOutOfStockMaterial,
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

            if (state.isBonusRestricted) return;

            for (final material in state.getCartItemMaterialList) {
              final failureOrSuccess = await repository.updateMaterialDealBonus(
                material: material.materials.first,
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
                  if (material == state.getCartItemMaterialList.last) {
                    emit(
                      state.copyWith(
                        cartItems: cartItemList,
                        apiFailureOrSuccessOption: none(),
                        isFetching: false,
                      ),
                    );
                  }
                },
              );
            }
          },
        );
      },
      addComboDealToCart: (e) async {
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            isFetching: true,
          ),
        );

        final comboDealItems = e.comboDealItems.map((item) {
          final currentMaterialInCart =
              state.getMaterialCartItem(material: item);

          return currentMaterialInCart == CartItem.materialEmpty()
              ? item
              : item.copyWithIncreasedQty(qty: currentMaterialInCart.totalQty);
        }).toList();

        await Future.wait(
          comboDealItems.map(
            (item) => repository.deleteFromCart(
              item: CartItem.material(item),
            ),
          ),
        );

        final failureOrSuccess = await repository.addItemToCart(
          cartItem: CartItem.comboDeal(comboDealItems),
          override: e.overrideQty,
          customerCodeInfo: e.customerCodeInfo,
          salesOrganisation: e.salesOrganisation,
          salesOrganisationConfigs: e.salesOrganisationConfigs,
          shipToInfo: e.shipToInfo,
          doNotAllowOutOfStockMaterials: e.doNotallowOutOfStockMaterial,
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
      },
      updateBatchInCartItem: (e) async {
        emit(state.copyWith(
          isFetching: true,
          apiFailureOrSuccessOption: none(),
        ));

        final failureOrSuccess = await repository.updatedBatchInCartItem(
          item: e.item,
          stockInfo: e.stockInfo,
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
      },
    );
  }
}

import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/bundle_info.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_item_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/order_document_type.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/price_combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/product_meta_data.dart';
import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/repository/i_cart_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_bloc.freezed.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final ICartRepository repository;

  CartBloc(this.repository) : super(CartState.initial()) {
    on<CartEvent>(_onEvent);
  }

  Future<void> _onEvent(CartEvent event, Emitter<CartState> emit) async {
    await event.map(
      initialized: (e) async => emit(
        CartState.initial().copyWith(
          salesOrganisation: e.salesOrganisation,
          config: e.salesOrganisationConfigs,
          customerCodeInfo: e.customerCodeInfo,
          shipToInfo: e.shipToInfo,
        ),
      ),
      verifyMaterialDealBonus: (e) async {
        final material = e.item;
        if (material != PriceAggregate.empty()) {
          if (!material.refreshAddedBonus) {
            emit(
              state.copyWith(
                cartProducts: e.items,
                apiFailureOrSuccessOption: none(),
              ),
            );

            return;
          }
        }
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            isFetching: true,
          ),
        );
        final failureOrSuccess = await repository.updateMaterialDealBonus(
          materials: e.items,
          customerCodeInfo: state.customerCodeInfo,
          salesOrganisationConfigs: state.config,
          salesOrganisation: state.salesOrganisation,
          shipToInfo: state.shipToInfo,
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
                cartProducts: cartItemList
                    .map(
                      (e) => e.copyWith(
                        salesOrgConfig: e.salesOrgConfig,
                      ),
                    )
                    .toList(),
                apiFailureOrSuccessOption: none(),
                isFetching: false,
              ),
            );
          },
        );
      },
      addRemarkToCartItem: (e) {
        emit(
          state.copyWith(
            isFetching: true,
            apiFailureOrSuccessOption: none(),
          ),
        );

        /*final failureOrSuccess = await repository.addRemarkToCartItem(
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
        );*/
      },
      addBonusToCartItem: (e) async {
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            upsertBonusItemInProgressHashCode:
                List.from(state.upsertBonusItemInProgressHashCode)
                  ..add(e.bonusMaterial.hashCode),
            isUpserting: true,
          ),
        );

        final failureOrSuccess = await repository.upsertCart(
          customerCodeInfo: state.customerCodeInfo,
          salesOrganisation: state.salesOrganisation,
          salesOrganisationConfig: state.config,
          shipToInfo: state.shipToInfo,
          materialInfo: e.bonusMaterial,
          quantity: e.bonusMaterial.quantity,
          language: e.user.settings.languagePreference.languageCode,
          counterOfferDetails: e.counterOfferDetails,
          itemId: e.bonusItemId.getValue(),
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                upsertBonusItemInProgressHashCode:
                    List.from(state.upsertBonusItemInProgressHashCode)
                      ..remove(e.bonusMaterial.hashCode),
                isUpserting: false,
              ),
            );
          },
          (cartProductList) {
            final cartProductListTemp = List<PriceAggregate>.from(
              cartProductList,
            );
            for (var i = 0; i < cartProductListTemp.length; i++) {
              final priceAggregate = state.cartProducts.firstWhere(
                (element) =>
                    element.materialInfo.materialNumber ==
                    cartProductList[i].materialInfo.materialNumber,
                orElse: () => PriceAggregate.empty(),
              );
              cartProductListTemp[i] = cartProductListTemp[i].copyWith(
                price: priceAggregate.price,
                addedBonusList: priceAggregate.addedBonusList,
                bundle: priceAggregate.bundle,
                salesOrgConfig: state.config,
              );
            }
            add(
              _VerifyMaterialDealBonus(
                item: cartProductListTemp
                        .where((element) {
                          return element.materialInfo.materialNumber ==
                              e.bonusMaterial.materialNumber;
                        })
                        .toList()
                        .firstOrNull ??
                    PriceAggregate.empty(),
                items: cartProductListTemp,
              ),
            );
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: none(),
                isUpserting: false,
                upsertBonusItemInProgressHashCode:
                    List.from(state.upsertBonusItemInProgressHashCode)
                      ..remove(e.bonusMaterial.hashCode),
              ),
            );
          },
        );
      },
      removeBonusFromCartItem: (e) {
        emit(
          state.copyWith(
            isFetching: true,
            apiFailureOrSuccessOption: none(),
          ),
        );

        /*final failureOrSuccess = await repository.deleteBonusFromCartItem(
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
        );*/
      },
      addRemarkToBonusItem: (e) {
        emit(
          state.copyWith(
            isFetching: true,
            apiFailureOrSuccessOption: none(),
          ),
        );

        /*final failureOrSuccess = await repository.addRemarkToBonusItem(
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
        );*/
      },
      overrideCartItemPrice: (e) {
        emit(
          state.copyWith(
            isFetching: true,
            apiFailureOrSuccessOption: none(),
          ),
        );

        /*final failureOrSuccess = await repository.overrideCartItemPrice(
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
        );*/
      },
      clearCart: (e) async {
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            isClearing: true,
          ),
        );

        final failureOrSuccess = await repository.clearCart();
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                isClearing: false,
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
          (_) => emit(
            CartState.initial().copyWith(
              config: state.config,
              shipToInfo: state.shipToInfo,
              salesOrganisation: state.salesOrganisation,
              customerCodeInfo: state.customerCodeInfo,
            ),
          ),
        );
      },
      replaceWithOrderItems: (e) {
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            isFetching: true,
          ),
        );

        /*final failureOrSuccess = await repository.replaceCartWithItems(
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
                // material: material.materials.first,
                materials: material.materials,
                customerCodeInfo: e.customerCodeInfo,
                salesOrganisationConfigs: e.salesOrganisationConfigs,
                salesOrganisation: e.salesOrganisation,
                shipToInfo: e.shipToInfo,
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
                  if (material == state.getCartItemMaterialList.last) {
                    emit(
                      state.copyWith(
                        cartProducts: cartItemList,
                        apiFailureOrSuccessOption: none(),
                        isFetching: false,
                      ),
                    );
                  }
                },
              );
            }
          },
        );*/
      },
      addComboDealToCart: (e) {
        /*emit(
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

        final failureOrSuccess = await repository.addItemToCart(
          cartItem: CartItem.comboDeal(comboDealItems),
          override: e.overrideQty,
          customerCodeInfo: e.customerCodeInfo,
          salesOrganisation: e.salesOrganisation,
          salesOrganisationConfigs: e.salesOrganisationConfigs,
          shipToInfo: e.shipToInfo,
          doNotAllowOutOfStockMaterials: e.doNotallowOutOfStockMaterial,
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
        );*/
      },
      updateBatchInCartItem: (e) {
        emit(
          state.copyWith(
            isFetching: true,
            apiFailureOrSuccessOption: none(),
          ),
        );

        /*final failureOrSuccess = await repository.updatedBatchInCartItem(
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
        );*/
      },
      fetchProductsAddedToCart: (e) async {
        if (state.isFetching) return;

        emit(
          state.copyWith(
            isFetching: true,
            apiFailureOrSuccessOption: none(),
            cartProducts: <PriceAggregate>[],
          ),
        );

        final failureOrSuccess = await repository.getAddedToCartProductList();

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
          (productAddedToCartList) {
            final priceAggregateAddedToCartList = productAddedToCartList
                .map(
                  (element) => !element.materialInfo.type.typeBundle
                      ? PriceAggregate.empty().copyWith(
                          materialInfo: element.materialInfo,
                          quantity: element.materialInfo.quantity,
                          salesOrgConfig: element.salesOrgConfig,
                          bonusSampleItems: element.bonusSampleItems,
                        )
                      : PriceAggregate.empty().copyWith(
                          materialInfo: element.materialInfo,
                          bundle: element.bundle,
                          salesOrgConfig: element.salesOrgConfig,
                        ),
                )
                .toList();

            emit(
              state.copyWith(
                cartProducts: priceAggregateAddedToCartList,
                apiFailureOrSuccessOption: none(),
                isFetching: false,
              ),
            );
            if (priceAggregateAddedToCartList.isNotEmpty) {
              add(
                _GetDetailsProductsAddedToCart(
                  cartProducts: priceAggregateAddedToCartList,
                ),
              );
            }
          },
        );
      },
      upsertCart: (e) async {
        final index = state.cartProducts.indexWhere(
          (element) =>
              element.materialInfo.materialNumber ==
              e.priceAggregate.materialInfo.materialNumber,
        );
        final isCounterOfferRequested =
            e.priceAggregate.materialInfo.counterOfferDetails !=
                RequestCounterOfferDetails.empty();
        if (index != -1) {
          final previousQuantity = state.cartProducts.elementAtOrNull(index);
          if (previousQuantity?.quantity == e.quantity &&
              !isCounterOfferRequested) {
            return;
          }
        }
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            isUpserting: true,
          ),
        );

        final failureOrSuccess = await repository.upsertCart(
          customerCodeInfo: state.customerCodeInfo,
          salesOrganisation: state.salesOrganisation,
          salesOrganisationConfig: state.config,
          shipToInfo: state.shipToInfo,
          materialInfo: e.priceAggregate.materialInfo,
          quantity: e.quantity,
          language: 'EN',
          counterOfferDetails:
              e.priceAggregate.materialInfo.counterOfferDetails.copyWith(
            counterOfferCurrency: state.config.currency,
          ),
          itemId: '',
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isUpserting: false,
              ),
            );
          },
          (cartProductList) {
            final newCartProductList = _mappingPreviousInfo(
              previousCartProducts: state.cartProducts,
              currentCartProducts: cartProductList,
              salesOrganisationConfigs: state.config,
            );
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: none(),
                cartProducts: newCartProductList,
                isUpserting: false,
              ),
            );
            add(
              _VerifyMaterialDealBonus(
                item: newCartProductList.firstWhere(
                  (element) =>
                      element.materialInfo.materialNumber ==
                      e.priceAggregate.materialInfo.materialNumber,
                  orElse: () => PriceAggregate.empty(),
                ),
                items: newCartProductList,
              ),
            );
          },
        );
      },
      addHistoryItemsToCart: (e) async {
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            isUpserting: true,
          ),
        );

        final failureOrSuccess = await repository.addHistoryItemsToCart(
          customerCodeInfo: state.customerCodeInfo,
          salesOrganisation: state.salesOrganisation,
          salesOrganisationConfig: state.config,
          shipToInfo: state.shipToInfo,
          materialInfo: e.priceAggregate.map((e) => e.materialInfo).toList(),
          quantity: e.quantity,
          language: e.user.settings.languagePreference.languageCode,
          counterOfferDetails: e.counterOfferDetails,
          itemId: '',
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isUpserting: false,
              ),
            );
          },
          (cartProductList) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: none(),
                isUpserting: false,
                cartProducts: _mappingPreviousInfo(
                  previousCartProducts: state.cartProducts,
                  currentCartProducts: cartProductList,
                  salesOrganisationConfigs: state.config,
                ),
              ),
            );
          },
        );
      },
      upsertCartItems: (e) async {
        final index = state.cartProducts.indexWhere(
          (element) =>
              element.materialInfo.materialNumber ==
              e.priceAggregate.materialInfo.materialNumber,
        );
        if (index != -1) {
          final cartItem = state.cartProducts.elementAt(index);
          var noDifference = true;
          for (final bundleItem in cartItem.bundle.materials) {
            final item = e.priceAggregate.bundle.materials
                .where(
                  (element) =>
                      element.materialNumber == bundleItem.materialNumber,
                )
                .firstOrNull;
            if (item != null) {
              noDifference = item.quantity == bundleItem.quantity;
            }
            if (!noDifference) break;
          }
          if (noDifference) return;
        }
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            isUpserting: true,
          ),
        );

        final failureOrSuccess = await repository.upsertCartItems(
          customerCodeInfo: state.customerCodeInfo,
          salesOrganisation: state.salesOrganisation,
          shipToInfo: state.shipToInfo,
          product: e.priceAggregate,
          language: 'EN',
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isUpserting: false,
              ),
            );
          },
          (cartProductList) {
            final cartProductListTemp =
                List<PriceAggregate>.from(cartProductList);
            for (var i = 0; i < cartProductListTemp.length; i++) {
              final priceAggregate = state.cartProducts
                      .where(
                        (element) =>
                            element.materialInfo.materialNumber ==
                            cartProductList[i].materialInfo.materialNumber,
                      )
                      .toList()
                      .firstOrNull ??
                  PriceAggregate.empty();
              cartProductListTemp[i] = cartProductListTemp[i].copyWith(
                price: priceAggregate.price,
                addedBonusList: priceAggregate.addedBonusList,
                salesOrgConfig: state.config,
              );
            }
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: none(),
                isUpserting: false,
                cartProducts: cartProductListTemp,
              ),
            );
          },
        );
      },
      getDetailsProductsAddedToCart: (e) async {
        if (state.isFetchingCartProductDetail) return;

        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            config: state.config,
            isFetchingCartProductDetail: true,
          ),
        );

        final materialNumberList = <MaterialNumber>[
          ...e.cartProducts
              .where((element) => !element.materialInfo.type.typeBundle)
              .map((e) => e.materialInfo.materialNumber)
              .toList(),
        ];

        for (final element in e.cartProducts) {
          materialNumberList
              .addAll(element.bonusSampleItems.map((e) => e.materialNumber));
        }

        final bundleList = e.cartProducts
            .where((element) => element.materialInfo.type.typeBundle)
            .map((e) => e.bundle.materials)
            .toList();
        for (final element in bundleList) {
          materialNumberList.addAll(element.map((e) => e.materialNumber));
        }

        final failureOrSuccess = await repository.getProducts(
          materialNumbers: materialNumberList,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isFetchingCartProductDetail: false,
              ),
            );
          },
          (cartProductList) {
            final newProductInfoMap = Map<MaterialNumber, ProductMetaData>.from(
              state.additionInfo,
            )..addAll(cartProductList);

            emit(
              state.copyWith(
                additionInfo: newProductInfoMap,
                apiFailureOrSuccessOption: none(),
                isFetchingCartProductDetail: false,
              ),
            );

            add(
              _UpdateProductStock(
                products: state.cartProducts,
              ),
            );
          },
        );
      },
      updatePriceProduct: (e) {
        emit(
          state.copyWith(
            isMappingPrice: true,
          ),
        );

        final cartProductList = state.cartProducts.map((element) {
          final updatedPrice = element.materialInfo.materialNumber ==
                  e.overriddenProductPrice.materialNumber
              ? e.overriddenProductPrice
              : (e.priceProducts[element.materialInfo.materialNumber] ??
                  Price.empty());

          final productPrice = !element.price.isPriceOverride ||
                  !element.price.isDiscountOverride
              ? updatedPrice
              : element.price;

          element = element.copyWith(
            salesOrgConfig: state.config,
            price: productPrice,
          );

          return element;
        }).toList();

        emit(
          state.copyWith(
            isMappingPrice: false,
            cartProducts: cartProductList,
          ),
        );

        add(
          _VerifyMaterialDealBonus(
            item: PriceAggregate.empty(),
            items: cartProductList,
          ),
        );
      },
      updateProductStock: (e) async {
        emit(
          state.copyWith(
            isUpdatingStock: true,
          ),
        );

        final failureOrSuccess = await repository.getStockInfoList(
          items: state.cartProducts
              .map(
                (element) => !element.materialInfo.type.typeBundle
                    ? [element.materialInfo]
                    : element.bundle.materials,
              )
              .expand((element) => element)
              .toList(),
          customerCodeInfo: state.customerCodeInfo,
          salesOrganisationConfigs: state.config,
          salesOrganisation: state.salesOrganisation,
          shipToInfo: state.shipToInfo,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isUpdatingStock: false,
              ),
            );
          },
          (newStockFetched) {
            final updatedCartStockList = state.cartProducts.map((cartProduct) {
              if (!cartProduct.materialInfo.type.typeBundle) {
                return cartProduct.copyWith(
                  stockInfoList: newStockFetched[
                          cartProduct.materialInfo.materialNumber] ??
                      <StockInfo>[],
                  salesOrgConfig: state.config,
                );
              } else {
                final materialInfoList =
                    List<MaterialInfo>.from(cartProduct.bundle.materials);
                final updatedMaterialInfoList = materialInfoList.map((info) {
                  return info.copyWithStock(
                    stockInfos:
                        newStockFetched[info.materialNumber] ?? <StockInfo>[],
                  );
                }).toList();

                return cartProduct.copyWith(
                  bundle: cartProduct.bundle.copyWith(
                    materials: updatedMaterialInfoList,
                  ),
                );
              }
            }).toList();
            emit(
              state.copyWith(
                cartProducts: updatedCartStockList,
                apiFailureOrSuccessOption: none(),
                isUpdatingStock: false,
              ),
            );
          },
        );
      },
    );
  }

  List<PriceAggregate> _mappingPreviousInfo({
    required List<PriceAggregate> previousCartProducts,
    required List<PriceAggregate> currentCartProducts,
    required SalesOrganisationConfigs salesOrganisationConfigs,
  }) {
    return currentCartProducts.map((cartProduct) {
      final priceAggregate = previousCartProducts.firstWhere(
        (element) =>
            element.materialInfo.materialNumber ==
            cartProduct.materialInfo.materialNumber,
        orElse: () => PriceAggregate.empty(),
      );

      return cartProduct.copyWith(
        price: priceAggregate.price,
        addedBonusList: priceAggregate.addedBonusList,
        bundle: priceAggregate.bundle,
        salesOrgConfig: salesOrganisationConfigs,
      );
    }).toList();
  }
}

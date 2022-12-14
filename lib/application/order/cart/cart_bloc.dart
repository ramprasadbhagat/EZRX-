import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/order/cart/cart_view_model.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/material_item_bonus.dart';
import 'package:ezrxmobile/domain/order/entities/order_document_type.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/repository/i_cart_repository.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_bloc.freezed.dart';
part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final ICartRepository cartRepository;
  CartBloc({
    required this.cartRepository,
  }) : super(CartState.initial()) {
    on<CartEvent>(_onEvent);
  }

  Future<void> _onEvent(
    CartEvent event,
    Emitter<CartState> emit,
  ) async {
    await event.map(
      initialized: (e) async => emit(CartState.initial()),
      fetch: (e) async {
        emit(
          state.copyWith(
            isFetching: true,
            apiFailureOrSuccessOption: none(),
            cartItemList: <PriceAggregate>[],
          ),
        );
        final failureOrSuccess = await cartRepository.fetchCartItems();
        await failureOrSuccess.fold(
          (failure) async {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                // isFetching: false,
              ),
            );
          },
          (cartItemList) async {
            final stockInformationList =
                await cartRepository.getStockInfoMaterialList(
              materialList: cartItemList
                  .where((element) => element.price.isValidMaterial)
                  .toList(),
              customerCodeInfo: e.customerCodeInfo,
              salesOrganisationConfigs: e.salesOrganisationConfigs,
              salesOrganisation: e.salesOrganisation,
              shipToInfo: e.shipToInfo,
            );

            final validatedStockInfoMaterialList = stockInformationList.fold(
              (faliure) => <PriceAggregate>[],
              (stockInfo) {
                return stockInfo
                    .where((element) =>
                        element.stockInfo.inStock.isMaterialInStock ||
                        !e.doNotAllowOutOfStockMaterials)
                    .toList();
              },
            );

            if (validatedStockInfoMaterialList.isEmpty) {
              emit(state.copyWith(isFetching: false));
            }
            emit(
              state.copyWith(
                cartItemList: cartItemList,
                apiFailureOrSuccessOption: none(),
                isFetching: false,
              ),
            );
            emit(
              state.copyWith(
                cartItemList: cartItemList
                    .map(
                      (element) => element.copyWith(
                        discountedMaterialCount:
                            state.onAddCartDiscountMaterialCount(element),
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
      addToCart: (e) async {
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            // isFetching: true,
          ),
        );

        final getStockInfo = await cartRepository.getStockInfo(
          material: e.item.materialInfo,
          customerCodeInfo: e.customerCodeInfo,
          salesOrganisationConfigs: e.salesOrganisationConfigs,
          salesOrganisation: e.salesOrganisation,
          shipToInfo: e.shipToInfo,
        );

        final stockInformation = getStockInfo.fold(
          (failure) => StockInfo.empty(),
          (stockInfo) => stockInfo,
        );

        if (!stockInformation.inStock.isMaterialInStock &&
            e.doNotallowOutOfStockMaterial) {
          emit(state.copyWith(
            apiFailureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('Product Not Available'))),
          ));

          return;
        }
        final failureOrSuccess = await cartRepository.addToCart(
          cartItem: e.item.copyWith(
            stockInfo: stockInformation,
          ),
        );

        await failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
              ),
            );
          },
          (cartItemList) async {
            final updatedMaterialList = cartRepository.getUpdatedMaterialList(
              cartItemList: state.cartItemList,
              selectedItemsMaterialNumber: state.selectedItemsMaterialNumber,
              items: [e.item],
            );

            emit(
              state.copyWith(
                selectedItemsMaterialNumber: updatedMaterialList,
                cartItemList: cartItemList,
                apiFailureOrSuccessOption: none(),
                // isFetching:  false,
              ),
            );
            if (e.item.price.isDiscountEligible) {
              emit(
                state.copyWith(
                  cartItemList: cartItemList
                      .map(
                        (PriceAggregate element) => element.copyWith(
                          discountedMaterialCount:
                              state.onAddCartDiscountMaterialCount(element),
                        ),
                      )
                      .toList(),
                  apiFailureOrSuccessOption: none(),
                  // isFetching: false,
                ),
              );
            }
            final addedItem = _getItemFromCart(e.item);
            if (addedItem.isEligibleForBonus && addedItem.refreshAddedBonus) {
              await _updateBonus(
                item: addedItem,
                emit: emit,
                customerCodeInfo: e.customerCodeInfo,
                salesOrganisation: e.salesOrganisation,
                salesOrganisationConfigs: e.salesOrganisationConfigs,
                shipToInfo: e.shipToInfo,
              );
            }
            if (!addedItem.isEligibleForBonus && addedItem.isDealBounsAdded) {
              await _deleteBonus(
                e.item,
                MaterialItemBonus.empty()
                    .copyWith(materialInfo: e.item.materialInfo),
                emit,
              );
            }
          },
        );
      },
      updateCartItem: (e) async {
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            isFetching: true,
          ),
        );

        final getStockInfo = await cartRepository.getStockInfo(
          material: e.item.materialInfo,
          customerCodeInfo: e.customerCodeInfo,
          salesOrganisationConfigs: e.salesOrganisationConfigs,
          salesOrganisation: e.salesOrganisation,
          shipToInfo: e.shipToInfo,
        );

        final stockInformation = getStockInfo.fold(
          (failure) => StockInfo.empty(),
          (stockInfo) => stockInfo,
        );

        if (!stockInformation.inStock.isMaterialInStock &&
            e.doNotallowOutOfStockMaterial) {
          emit(state.copyWith(
            apiFailureOrSuccessOption:
                optionOf(const Left(ApiFailure.other('Product Not Available'))),
            isFetching: false,
          ));

          return;
        }

        final failureOrSuccess = await cartRepository.updateCartItem(
          cartItem: e.item.copyWith(
            stockInfo: stockInformation,
          ),
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
                cartItemList: cartItemList,
                apiFailureOrSuccessOption: none(),
                isFetching: false,
              ),
            );
            if (e.item.price.isDiscountEligible) {
              emit(
                state.copyWith(
                  cartItemList: cartItemList
                      .map(
                        (PriceAggregate element) => element.copyWith(
                          discountedMaterialCount:
                              state.onAddCartDiscountMaterialCount(element),
                        ),
                      )
                      .toList(),
                  apiFailureOrSuccessOption: none(),
                  isFetching: false,
                ),
              );
            }
            final addedItem = _getItemFromCart(e.item);
            if (addedItem.isEligibleForBonus && addedItem.refreshAddedBonus) {
              await _updateBonus(
                item: addedItem,
                emit: emit,
                customerCodeInfo: e.customerCodeInfo,
                salesOrganisation: e.salesOrganisation,
                salesOrganisationConfigs: e.salesOrganisationConfigs,
                shipToInfo: e.shipToInfo,
              );
            }
            if (!addedItem.isEligibleForBonus && addedItem.isDealBounsAdded) {
              await _deleteBonus(
                e.item,
                MaterialItemBonus.empty()
                    .copyWith(materialInfo: e.item.materialInfo),
                emit,
              );
            }
          },
        );
      },
      removeFromCart: (e) async {
        final failureOrSuccess = await cartRepository.deleteFromCart(
          cartItem: e.item,
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
                cartItemList: cartItemList,
                apiFailureOrSuccessOption: none(),
                isFetching: false,
              ),
            );
            if (e.item.price.isDiscountEligible) {
              emit(
                state.copyWith(
                  cartItemList: cartItemList
                      .map(
                        (PriceAggregate element) => element.copyWith(
                          discountedMaterialCount:
                              state.onAddCartDiscountMaterialCount(element),
                        ),
                      )
                      .toList(),
                  apiFailureOrSuccessOption: none(),
                  isFetching: false,
                ),
              );
            }
          },
        );
      },
      updateCart: (_UpdateCart e) async {
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            isFetching: true,
          ),
        );

        final failureOrSuccess = await cartRepository.updateCart(
          cartItem: e.item,
          materialNumber: e.materialNumber,
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
                cartItemList: cartItemList,
                apiFailureOrSuccessOption: none(),
                isFetching: false,
              ),
            );
          },
        );
      },
      clearCart: (_ClearCart value) async {
        await cartRepository.clear();
        emit(CartState.initial());
      },
      addToCartFromList: (e) async {
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            isFetching: true,
          ),
        );

        final stockInformationList =
            await cartRepository.getStockInfoMaterialList(
          materialList: e.items
              .where((element) => element.price.isValidMaterial)
              .toList(),
          customerCodeInfo: e.customerCodeInfo,
          salesOrganisationConfigs: e.salesOrganisationConfigs,
          salesOrganisation: e.salesOrganisation,
          shipToInfo: e.shipToInfo,
        );

        final validatedStockInfoMaterialList = stockInformationList.fold(
          (faliure) => <PriceAggregate>[],
          (stockInfo) {
            return stockInfo
                .where((element) =>
                    element.stockInfo.inStock.isMaterialInStock ||
                    !e.doNotAllowOutOfStockMaterials)
                .toList();
          },
        );

        if (validatedStockInfoMaterialList.isEmpty) {
          emit(state.copyWith(isFetching: false));

          return;
        }

        final failureOrSuccess = await cartRepository.addToCartList(
          items: validatedStockInfoMaterialList,
        );
        failureOrSuccess.fold(
          (apiFailure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isFetching: false,
              ),
            );
          },
          (cartItemList) {
            final updatedMaterialList = cartRepository.getUpdatedMaterialList(
              cartItemList: state.cartItemList,
              selectedItemsMaterialNumber: state.selectedItemsMaterialNumber,
              items: e.items,
            );

            emit(
              state.copyWith(
                selectedItemsMaterialNumber: updatedMaterialList,
                cartItemList: cartItemList,
                apiFailureOrSuccessOption: none(),
                isFetching: false,
              ),
            );
          },
        );
      },
      updateSelectedItem: (e) {
        emit(
          state.copyWith(
            selectedItemsMaterialNumber: cartRepository.updateSelectedItem(
              cartItem: e.item,
              selectedMaterialList: state.selectedItemsMaterialNumber,
            ),
          ),
        );
      },
      updateSelectAllItems: (e) {
        emit(
          state.copyWith(
            selectedItemsMaterialNumber:
                state.selectedItemsMaterialNumber.length ==
                        state.cartItemList.length
                    ? []
                    : cartRepository.updateSelectAll(
                        cartItemList: state.cartItemList,
                      ),
          ),
        );
      },
      updateBonusItem: (_updateBonusItem e) async {
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            isFetching: true,
          ),
        );

        final failureOrSuccess = await cartRepository.updateBonusItem(
          bonusItem: e.bonusItem,
          quantity: e.bonusItemCount,
          cartItem: e.cartItem,
          isUpdatedFromCart: e.isUpdateFromCart,
        );
        failureOrSuccess.fold(
          (apiFailure) {
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
                cartItemList: cartItemList,
                apiFailureOrSuccessOption: none(),
                isFetching: false,
              ),
            );
          },
        );
      },
      deleteBonusItem: (e) async {
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            isFetching: true,
          ),
        );

        final failureOrSuccess = await cartRepository.deleteBonusItem(
          bonusItem: e.bonusItem,
          cartItem: e.cartItem,
          isUpdateFromCart: e.isUpdateFromCart,
        );
        failureOrSuccess.fold(
          (apiFailure) {
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
                cartItemList: cartItemList,
                apiFailureOrSuccessOption: none(),
                isFetching: false,
              ),
            );
          },
        );
      },
      remarksChanged: (e) {
        emit(
          state.copyWith(
            remarks: Remarks(e.remarks),
          ),
        );
      },
      addRemarksToCartItem: (e) async {
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            isRemarksAdding: true,
            showErrorMessages: false,
            isFetching: true,
          ),
        );
        final isRemarksValid = state.remarks.isValid();
        if (isRemarksValid || e.isDelete) {
          final updatedCartItem = e.item.copyWith(
            materialInfo: e.item.materialInfo.copyWith(
              remarks: state.remarks.getValue(),
            ),
          );

          final failureOrSuccess = await cartRepository.updateCartItem(
            cartItem: updatedCartItem,
          );

          failureOrSuccess.fold(
            (failure) {
              emit(
                state.copyWith(
                  apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                  isFetching: false,
                  isRemarksAdding: false,
                ),
              );
            },
            (cartItemList) {
              emit(
                state.copyWith(
                  cartItemList: cartItemList,
                  isFetching: false,
                  remarks: Remarks(''),
                  isRemarksAdding: false,
                ),
              );
            },
          );
        } else {
          emit(
            state.copyWith(
              isFetching: false,
              isRemarksAdding: false,
              showErrorMessages: true,
            ),
          );
        }
      },
      addRemarksToBonusItem: (e) async {
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            isRemarksAdding: true,
            showErrorMessages: false,
            isFetching: true,
          ),
        );
        final isRemarksValid = state.remarks.isValid();
        if (isRemarksValid || e.isDelete) {
          final materialInfo = e.bonusItem.copyWith(
            remarks: state.remarks.getValue(),
          );
          final updatedBonusItem = e.item.addedBonusList.firstWhere(
            (element) =>
                element.materialInfo.materialNumber ==
                e.bonusItem.materialNumber,
            orElse: () => MaterialItemBonus.empty(),
          );
          final failureOrSuccess = await cartRepository.updateBonusItem(
            cartItem: e.item,
            bonusItem: updatedBonusItem.copyWith(
              materialInfo: materialInfo,
              comment: state.remarks.getValue(),
            ),
            quantity: updatedBonusItem.qty,
            isUpdatedFromCart: true,
          );

          failureOrSuccess.fold(
            (failure) {
              emit(
                state.copyWith(
                  apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                  isFetching: false,
                  isRemarksAdding: false,
                ),
              );
            },
            (cartItemList) {
              emit(
                state.copyWith(
                  cartItemList: cartItemList,
                  isFetching: false,
                  remarks: Remarks(''),
                  isRemarksAdding: false,
                ),
              );
            },
          );
        } else {
          emit(
            state.copyWith(
              isFetching: false,
              isRemarksAdding: false,
              showErrorMessages: true,
            ),
          );
        }
      },
      updateStockInfo: (e) async {
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            isFetching: true,
          ),
        );
        final failureOrSuccess = await cartRepository.updateStockInfo(
          customerCodeInfo: e.customerCodeInfo,
          salesOrganisation: e.salesOrganisation,
          salesOrganisationConfigs: e.salesOrganisationConfigs,
          shipToInfo: e.shipToInfo,
          user: e.user,
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
                cartItemList: cartItemList,
                apiFailureOrSuccessOption: none(),
                isFetching: false,
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _updateBonus({
    required PriceAggregate item,
    required Emitter<CartState> emit,
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisationConfigs salesOrganisationConfigs,
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
  }) async {
    emit(
      state.copyWith(
        apiFailureOrSuccessOption: none(),
        isFetching: true,
      ),
    );
    final materialItemBonus = item.getMaterialItemBonus;

    final stockInfo = await cartRepository.getStockInfo(
      material: item.materialInfo,
      customerCodeInfo: customerCodeInfo,
      salesOrganisation: salesOrganisation,
      salesOrganisationConfigs: salesOrganisationConfigs,
      shipToInfo: shipToInfo,
    );

    stockInfo.fold(
      (l) => null,
      (StockInfo stockinfo) => materialItemBonus.copyWith(
        expiryDate: stockinfo.expiryDate,
        inStock: stockinfo.inStock.getOrDefaultValue(''),
      ),
    );

    final failureOrSuccess = await cartRepository.updateBonusItem(
      bonusItem: item.getMaterialItemBonus,
      quantity: item.getMaterialItemBonus.qty,
      cartItem: item,
      isUpdatedFromCart: true,
    );
    failureOrSuccess.fold(
      (apiFailure) {
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
            cartItemList: cartItemList,
            apiFailureOrSuccessOption: none(),
            isFetching: false,
          ),
        );
      },
    );
  }

  Future<void> _deleteBonus(
    PriceAggregate item,
    MaterialItemBonus bonusItem,
    Emitter<CartState> emit,
  ) async {
    emit(
      state.copyWith(
        apiFailureOrSuccessOption: none(),
        isFetching: true,
      ),
    );

    final failureOrSuccess = await cartRepository.deleteBonusItem(
      bonusItem: bonusItem,
      cartItem: item,
      isUpdateFromCart: true,
    );
    failureOrSuccess.fold(
      (apiFailure) {
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
            cartItemList: cartItemList,
            apiFailureOrSuccessOption: none(),
            isFetching: false,
          ),
        );
      },
    );
  }

  PriceAggregate _getItemFromCart(PriceAggregate item) =>
      state.cartItemList.firstWhere(
        (element) => element.getMaterialNumber == item.getMaterialNumber,
        orElse: () => PriceAggregate.empty(),
      );
}

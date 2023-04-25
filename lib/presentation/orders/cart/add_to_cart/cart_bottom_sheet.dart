import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/add_to_cart/add_to_cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/orders/cart/add_to_cart/update_cart.dart';
import 'package:ezrxmobile/presentation/orders/cart/bonus/choose_bonus_sheet.dart';
import 'package:ezrxmobile/presentation/orders/cart/add_to_cart/add_to_cart.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBottomSheet {
  static void showAddToCartBottomSheet({
    required BuildContext context,
    required PriceAggregate priceAggregate,
    bool isCovid19Tab = false,
  }) {
    final cartBloc = context.read<CartBloc>();
    final currentCartItem = cartBloc.state
        .getMaterialCartItem(material: priceAggregate)
        .materials
        .first;
    final isPresentInCart = currentCartItem != PriceAggregate.empty();
    if (isPresentInCart) {
      showUpdateCartBottomSheet(context: context, cartItem: currentCartItem);
    } else {
      final addToCartItem = priceAggregate.copyWith(
        isSpecialOrderType:
            context.read<OrderDocumentTypeBloc>().state.isSpecialOrderType,
      );

      showModalBottomSheet(
        barrierColor: ZPColors.white,
        context: context,
        enableDrag: false,
        isScrollControlled: true,
        useSafeArea: true,
        builder: (_) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<TenderContractBloc>(
                create: (context) {
                  final bloc = locator<TenderContractBloc>();
                  final eligibilityBloc = context.read<EligibilityBloc>();
                  if (priceAggregate.materialInfo.hasValidTenderContract) {
                    bloc.add(
                      TenderContractEvent.fetch(
                        customerCodeInfo:
                            eligibilityBloc.state.customerCodeInfo,
                        salesOrganisation:
                            eligibilityBloc.state.salesOrganisation,
                        shipToInfo: eligibilityBloc.state.shipToInfo,
                        materialInfo: priceAggregate.materialInfo,
                        defaultSelectedTenderContract: TenderContract.empty(),
                      ),
                    );
                  }

                  return bloc;
                },
              ),
              BlocProvider<AddToCartBloc>(
                create: (context) => locator<AddToCartBloc>()
                  ..add(
                    AddToCartEvent.setCartItem(addToCartItem),
                  )
                  ..add(
                    AddToCartEvent.updateQuantity(
                      1,
                      cartBloc.state.zmgMaterialWithoutMaterial(addToCartItem),
                    ),
                  ),
              ),
            ],
            child: AddToCart(isCovid19Tab: isCovid19Tab),
          );
        },
      );
    }
  }

  static void showUpdateCartBottomSheet({
    required BuildContext context,
    required PriceAggregate cartItem,
  }) {
    final cartBloc = context.read<CartBloc>();
    final addToCartItem = cartItem.copyWith(
      isSpecialOrderType:
          context.read<OrderDocumentTypeBloc>().state.isSpecialOrderType,
    );
    showModalBottomSheet(
      barrierColor: ZPColors.white,
      context: context,
      enableDrag: false,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<AddToCartBloc>(
              create: (context) => locator<AddToCartBloc>()
                ..add(
                  AddToCartEvent.setCartItem(addToCartItem),
                )
                ..add(
                  AddToCartEvent.updateQuantity(
                    addToCartItem.quantity,
                    cartBloc.state.zmgMaterialWithoutMaterial(addToCartItem),
                  ),
                ),
            ),
            BlocProvider<TenderContractBloc>(
              create: (context) {
                final bloc = locator<TenderContractBloc>();
                final eligibilityBloc = context.read<EligibilityBloc>();
                if (cartItem.materialInfo.hasValidTenderContract) {
                  bloc.add(
                    TenderContractEvent.fetch(
                      customerCodeInfo: eligibilityBloc.state.customerCodeInfo,
                      salesOrganisation:
                          eligibilityBloc.state.salesOrganisation,
                      shipToInfo: eligibilityBloc.state.shipToInfo,
                      materialInfo: cartItem.materialInfo,
                      defaultSelectedTenderContract: cartItem.tenderContract,
                    ),
                  );
                }

                return bloc;
              },
            ),
          ],
          child: const UpdateCart(),
        );
      },
    );
  }

  static void showUpdateCartBonusBottomSheet({
    required BuildContext context,
    required MaterialInfo item,
    required CartItem cartItem,
    required bool isUpdateFromCart,
  }) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      context: context,
      builder: (_) {
        return UpdateBonus(
          materialInfo: item,
          cartItem: cartItem,
          isUpdateFromCart: isUpdateFromCart,
        );
      },
    );
  }
}

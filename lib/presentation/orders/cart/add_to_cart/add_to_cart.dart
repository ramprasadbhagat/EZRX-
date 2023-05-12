import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/add_to_cart/add_to_cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/orders/cart/add_to_cart/add_to_cart_button.dart';
import 'package:ezrxmobile/presentation/orders/cart/add_to_cart/cart_bottom_sheet_shimmer.dart';
import 'package:ezrxmobile/presentation/orders/create_order/cart_item_detail_widget.dart';
import 'package:ezrxmobile/presentation/orders/create_order/favorite_button.dart';
import 'package:ezrxmobile/presentation/orders/create_order/select_contract.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter_svg/svg.dart';

class AddToCart extends StatelessWidget implements AutoRouteWrapper {
  final bool isCovid19Tab;
  final PriceAggregate material;
  final bool isShortcutAccess;

  const AddToCart({
    Key? key,
    required this.isCovid19Tab,
    required this.material,
    this.isShortcutAccess = false,
  }) : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;
    final cartState = context.read<CartBloc>().state;
    final isSpecialOrderType =
        context.read<OrderDocumentTypeBloc>().state.isSpecialOrderType;
    final addToCartItem = material.copyWith(
      isSpecialOrderType: isSpecialOrderType,
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider<TenderContractBloc>(
          create: (context) => locator<TenderContractBloc>(),
        ),
        BlocProvider<AddToCartBloc>(
          create: (context) {
            final bloc = locator<AddToCartBloc>();
            if (isShortcutAccess) {
              bloc.add(
                AddToCartEvent.fetch(
                  customerCode: eligibilityState.customerCodeInfo,
                  salesOrganisation: eligibilityState.salesOrganisation,
                  salesOrganisationConfigs: eligibilityState.salesOrgConfigs,
                  shipToCode: eligibilityState.shipToInfo,
                  materialNumber: addToCartItem.getMaterialNumber,
                  cartZmgQtyExcludeCurrent:
                      cartState.zmgMaterialWithoutMaterial(addToCartItem),
                  isSpecialOrderType: isSpecialOrderType,
                ),
              );
            } else {
              bloc
                ..add(
                  AddToCartEvent.setCartItem(addToCartItem),
                )
                ..add(
                  AddToCartEvent.updateQuantity(
                    1,
                    cartState.zmgMaterialWithoutMaterial(addToCartItem),
                  ),
                );
            }

            return bloc;
          },
        ),
      ],
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final addToCartBloc = context.read<AddToCartBloc>();
    final cartBloc = context.read<CartBloc>();

    return MultiBlocListener(
      listeners: [
        BlocListener<AddToCartBloc, AddToCartState>(
          listenWhen: (previous, current) =>
              previous.isFetching != current.isFetching && !current.isFetching,
          listener: (context, state) {
            if (state.cartItem.materialInfo.hasValidTenderContract) {
              final bloc = context.read<TenderContractBloc>();
              final eligibilityBloc = context.read<EligibilityBloc>();
              bloc.add(
                TenderContractEvent.fetch(
                  customerCodeInfo: eligibilityBloc.state.customerCodeInfo,
                  salesOrganisation: eligibilityBloc.state.salesOrganisation,
                  shipToInfo: eligibilityBloc.state.shipToInfo,
                  materialInfo: state.cartItem.materialInfo,
                  defaultSelectedTenderContract: TenderContract.empty(),
                ),
              );
            }
          },
        ),
        BlocListener<AddToCartBloc, AddToCartState>(
          listenWhen: (previous, current) =>
              previous.apiFailureOrSuccessOption !=
              current.apiFailureOrSuccessOption,
          listener: (context, state) {
            state.apiFailureOrSuccessOption.fold(
              () {},
              (either) => either.fold(
                (failure) {
                  ErrorUtils.handleApiFailure(context, failure);
                },
                (_) {},
              ),
            );
          },
        ),
      ],
      child: Scaffold(
        key: const Key('materialDetailsPage'),
        backgroundColor: ZPColors.white,
        appBar: AppBar(
          title: const Text('Material Detail').tr(),
          actions: [
            BlocBuilder<AddToCartBloc, AddToCartState>(
              buildWhen: (previous, current) =>
                  previous.cartItem.materialInfo !=
                  current.cartItem.materialInfo,
              builder: (context, state) {
                return FavoriteButton(
                  materialInfo: state.cartItem.materialInfo,
                );
              },
            ),
          ],
        ),
        body: AnnouncementBanner(
          currentPath: context.router.currentPath,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: BlocBuilder<AddToCartBloc, AddToCartState>(
              buildWhen: (previous, current) => previous != current,
              builder: (context, state) {
                if (state.isFetching) {
                  return const CartBottomSheetShimmer(
                    isEdit: false,
                  );
                }

                return Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: SvgPicture.asset(
                              'assets/svg/default_product_image.svg',
                              key: const ValueKey('addToCartProductImage'),
                              height: 80,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          CartItemDetailWidget(
                            cartItem: state.cartItem,
                            onQuantityChanged: (int value) {
                              final cartItem = state.cartItem;
                              final discountedMaterialCount = cartBloc.state
                                  .zmgMaterialWithoutMaterial(cartItem);
                              addToCartBloc.add(
                                AddToCartEvent.updateQuantity(
                                  value,
                                  discountedMaterialCount,
                                ),
                              );
                            },
                          ),
                          if (state
                              .cartItem.materialInfo.hasValidTenderContract)
                            const SelectContract(),
                        ],
                      ),
                    ),
                    BlocBuilder<TenderContractBloc, TenderContractState>(
                      buildWhen: (previous, current) =>
                          previous.selectedTenderContract !=
                          current.selectedTenderContract,
                      builder: (context, tenderContractState) {
                        final selectedContract =
                            tenderContractState.selectedTenderContract;
                        final eligibilityState =
                            context.read<EligibilityBloc>().state;

                        return AddToCartButton(
                          isAddToCartAllowed: _isAddToCartAllowed(
                            cartItem: state.cartItem,
                            materialWithoutPrice: eligibilityState
                                .salesOrgConfigs.materialWithoutPrice,
                            isOrderTypeEnableAndSpecialOrderType:
                                eligibilityState
                                    .isOrderTypeEnableAndSpecialOrderType,
                          ),
                          cartItem: selectedContract ==
                                      TenderContract.empty() ||
                                  selectedContract ==
                                      TenderContract.noContract()
                              ? state.cartItem
                              : state.cartItem.copyWith(
                                  tenderContract: selectedContract,
                                  price: state.cartItem.price.copyWith(
                                    finalPrice: MaterialPrice(
                                      selectedContract.tenderPrice.tenderPrice,
                                    ),
                                  ),
                                ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  bool _isAddToCartAllowed({
    required PriceAggregate cartItem,
    required bool isOrderTypeEnableAndSpecialOrderType,
    required bool materialWithoutPrice,
  }) {
    return !(!materialWithoutPrice &&
        cartItem.price.finalPrice.isEmpty &&
        (isOrderTypeEnableAndSpecialOrderType &&
            !cartItem.isSpecialOrderTypeNotTH &&
            cartItem.isSpecialMaterial) &&
        !isCovid19Tab);
  }
}

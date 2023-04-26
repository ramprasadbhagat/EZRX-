import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/add_to_cart/add_to_cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';

import 'package:ezrxmobile/application/order/tender_contract/tender_contract_bloc.dart';
import 'package:ezrxmobile/domain/announcement/entities/announcement.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/orders/cart/add_to_cart/add_to_cart_button.dart';
import 'package:ezrxmobile/presentation/orders/create_order/cart_item_detail_widget.dart';
import 'package:ezrxmobile/presentation/orders/create_order/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/orders/create_order/select_contract.dart';
import 'package:flutter_svg/svg.dart';

class AddToCart extends StatelessWidget {
  final bool isCovid19Tab;

  const AddToCart({
    Key? key,
    required this.isCovid19Tab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addToCartBloc = context.read<AddToCartBloc>();
    final cartBloc = context.read<CartBloc>();

    trackMixpanelEvent(
      MixpanelEvents.pageViewVisited,
      props: {
        MixpanelProps.pageViewName: '${runtimeType.toString()}Page',
      },
    );

    return Scaffold(
      key: const Key('materialDetailsPage'),
      backgroundColor: ZPColors.white,
      appBar: AppBar(
        title: const Text('Material Detail').tr(),
        actions: [
          FavoriteButton(
            materialInfo: addToCartBloc.state.cartItem.materialInfo,
          ),
        ],
      ),
      body: AnnouncementBanner(
        appModule: AppModule.orders,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: BlocBuilder<AddToCartBloc, AddToCartState>(
            buildWhen: (previous, current) => previous != current,
            builder: (context, state) {
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
                        state.cartItem.materialInfo.hasValidTenderContract
                            ? SelectContract(
                                materialInfo: state.cartItem.materialInfo,
                              )
                            : const SizedBox.shrink(),
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
                          isOrderTypeEnableAndSpecialOrderType: eligibilityState
                              .isOrderTypeEnableAndSpecialOrderType,
                        ),
                        cartItem: selectedContract == TenderContract.empty() ||
                                selectedContract == TenderContract.noContract()
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

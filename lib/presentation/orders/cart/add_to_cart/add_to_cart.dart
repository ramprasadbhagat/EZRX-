import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/cart/add_to_cart/add_to_cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';

import 'package:ezrxmobile/application/order/tender_contract/tender_contract_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/presentation/orders/cart/add_to_cart/add_to_cart_button.dart';
import 'package:ezrxmobile/presentation/orders/create_order/cart_item_detail_widget.dart';
import 'package:ezrxmobile/presentation/orders/create_order/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/orders/create_order/select_contract.dart';

class AddToCart extends StatefulWidget {
  final bool isCovid19Tab;

  const AddToCart({
    Key? key,
    required this.isCovid19Tab,
  }) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  late SalesOrgBloc salesOrgBloc;
  late AddToCartBloc addToCartBloc;
  late TenderContractBloc tenderContractBloc;
  late CartBloc cartBloc;

  @override
  void initState() {
    salesOrgBloc = context.read<SalesOrgBloc>();
    addToCartBloc = context.read<AddToCartBloc>();
    tenderContractBloc = context.read<TenderContractBloc>();
    cartBloc = context.read<CartBloc>();
    final cartItem = addToCartBloc.state.cartItem;
    addToCartBloc.add(
      AddToCartEvent.updateQuantity(
        1,
        cartBloc.state.zmgMaterialWithoutMaterial(cartItem),
      ),
    );
    tenderContractBloc.add(const TenderContractEvent.unselected());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool get _isAddToCartAllowed {
    return !(!salesOrgBloc.state.configs.materialWithoutPrice &&
        addToCartBloc.state.cartItem.price.finalPrice.isEmpty &&
        (!context.read<EligibilityBloc>().state.isOrderTypeEnable &&
            !addToCartBloc.state.cartItem.isSpecialOrderTypeNotTH &&
            addToCartBloc.state.cartItem.isSpecialMaterial) &&
        !widget.isCovid19Tab);
  }

  TenderContract get selectedTenderContract =>
      context.read<TenderContractBloc>().state.selectedTenderContract;

  @override
  Widget build(BuildContext context) {
    trackMixpanelEvent(
      MixpanelEvents.pageViewVisited,
      props: {
        MixpanelProps.pageViewName: '${runtimeType.toString()}Page',
      },
    );

    return WillPopScope(
      onWillPop: () {
        tenderContractBloc.add(const TenderContractEvent.unselected());

        return Future.value(true);
      },
      child: Scaffold(
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
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: BlocBuilder<AddToCartBloc, AddToCartState>(
            buildWhen: (previous, current) => previous != current,
            builder: (context, state) {
              return Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        CartItemDetailWidget(
                          cartItem: state.cartItem,
                          onQuantityChanged: (int value) {
                            final cartItem = addToCartBloc.state.cartItem;
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
                  AddToCartButton(
                    isAddToCartAllowed: _isAddToCartAllowed,
                    cartItem: selectedTenderContract ==
                                TenderContract.empty() ||
                            selectedTenderContract ==
                                TenderContract.noContract()
                        ? state.cartItem
                        : state.cartItem.copyWith(
                            tenderContract: selectedTenderContract,
                            price: state.cartItem.price.copyWith(
                              finalPrice: MaterialPrice(
                                selectedTenderContract.tenderPrice.tenderPrice,
                              ),
                            ),
                          ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

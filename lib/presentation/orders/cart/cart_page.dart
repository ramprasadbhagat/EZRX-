import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/combo_deal/combo_deal_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price_combo_deal.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/presentation/home/widgets/customer_blocked_banner.dart';
import 'package:ezrxmobile/presentation/core/address_info_section.dart';
import 'package:ezrxmobile/presentation/core/bullet_widget.dart';
import 'package:ezrxmobile/presentation/core/info_label.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/item/cart_product_bonus_offer_tile.dart';
import 'package:ezrxmobile/presentation/orders/cart/item/cart_product_bundle.dart';
import 'package:ezrxmobile/presentation/orders/cart/item/cart_product_combo.dart';
import 'package:ezrxmobile/presentation/orders/cart/item/cart_product_tile.dart';
import 'package:ezrxmobile/presentation/orders/cart/item/cart_product_tile_bonus.dart';
import 'package:ezrxmobile/presentation/orders/cart/pre_order_modal/pre_order_modal.dart';
import 'package:ezrxmobile/presentation/orders/cart/price_summary/price_summary_tile.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/application/order/cart/price_override/price_override_bloc.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/orders/widgets/account_suspended_warning.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

part 'package:ezrxmobile/presentation/orders/cart/widget/minimum_order_value_message.dart';
part 'package:ezrxmobile/presentation/orders/cart/widget/cart_page_cart_scroll_list.dart';
part 'package:ezrxmobile/presentation/orders/cart/widget/cart_page_cart_scroll_list_item.dart';
part 'package:ezrxmobile/presentation/orders/cart/widget/cart_page_checkout_section.dart';
part 'package:ezrxmobile/presentation/orders/cart/widget/cart_page_invalid_items_banner.dart';
part 'package:ezrxmobile/presentation/orders/cart/widget/cart_page_price_message.dart';
part 'package:ezrxmobile/presentation/orders/cart/widget/stock_invalid_id_message.dart';
part 'package:ezrxmobile/presentation/orders/cart/widget/cart_page_invalid_items_message.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    final eligibilityState = context.read<EligibilityBloc>().state;
    final cartProducts = context.read<CartBloc>().state.cartProducts;
    if (cartProducts.isNotEmpty) {
      context.read<CartBloc>().add(
            CartEvent.getDetailsProductsAddedToCart(
              cartProducts: cartProducts,
            ),
          );

      for (final cartProduct in cartProducts) {
        if (cartProduct.materialInfo.type.typeCombo) {
          final priceComboDeal =
              cartProduct.comboMaterials.firstOrNull?.comboDeals ??
                  PriceComboDeal.empty();

          if (priceComboDeal.category.type.isMaterialNumber) {
            context.read<ComboDealListBloc>().add(
                  ComboDealListEvent.fetchMaterialDeal(
                    salesOrganisation: eligibilityState.salesOrganisation,
                    customerCodeInfo: eligibilityState.customerCodeInfo,
                    priceComboDeal: priceComboDeal,
                  ),
                );
          } else {
            context.read<ComboDealListBloc>().add(
                  ComboDealListEvent.fetchPrincipleGroupDeal(
                    salesOrganisation: eligibilityState.salesOrganisation,
                    customerCodeInfo: eligibilityState.customerCodeInfo,
                    priceComboDeal: priceComboDeal,
                  ),
                );
          }
        }
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CartBloc, CartState>(
          listenWhen: (previous, current) =>
              previous.isUpdatingStock != current.isUpdatingStock &&
              !current.isUpdatingStock,
          listener: (context, state) {
            context.read<MaterialPriceBloc>().add(
                  MaterialPriceEvent.fetchPriceCartProduct(
                    comboDealEligible:
                        context.read<EligibilityBloc>().state.comboDealEligible,
                    products: state.cartProducts
                        .where(
                          (element) => element.materialInfo.type.typeMaterial,
                        )
                        .map((e) => e.materialInfo)
                        .toList(),
                  ),
                );

            final zdp5MaterialList = state.cartProducts
                .where((element) => element.hasZdp5Validation);
            for (final e in zdp5MaterialList) {
              context.read<MaterialPriceBloc>().add(
                    MaterialPriceEvent.fetchPriceForZDP5Materials(
                      materialInfo: e.materialInfo,
                    ),
                  );
            }
          },
        ),
        BlocListener<MaterialPriceBloc, MaterialPriceState>(
          listenWhen: (previous, current) =>
              previous.isFetching != current.isFetching,
          listener: (context, state) {
            if (!state.isFetching) {
              context.read<CartBloc>().add(
                    CartEvent.updatePriceProduct(
                      priceProducts: state.materialPrice,
                    ),
                  );
              context.read<CartBloc>().add(
                    const CartEvent.fetchGrandTotalPriceForIdMarket(),
                  );
            }
          },
        ),
        BlocListener<CartBloc, CartState>(
          listenWhen: (previous, current) =>
              previous.subTotalHidePriceMaterial !=
                      current.subTotalHidePriceMaterial &&
                  !current.isFetchingCartProductDetail ||
              previous.isMappingPrice != current.isMappingPrice &&
                  !current.isMappingPrice ||
              (previous.isUpserting != current.isUpserting ||
                  previous.isClearing != current.isClearing ||
                  previous.isUpdatingStock != current.isUpdatingStock),
          listener: (context, state) {
            context.read<OrderEligibilityBloc>().add(
                  OrderEligibilityEvent.update(
                    cartItems: state.cartProducts,
                    grandTotal: state.grandTotalSubmit,
                    orderType: context
                        .read<EligibilityBloc>()
                        .state
                        .selectedOrderType
                        .documentType
                        .getOrDefaultValue(''),
                    subTotal: state.subTotalSubmit,
                  ),
                );

            context.read<OrderEligibilityBloc>().add(
                  const OrderEligibilityEvent.validateOrderEligibility(),
                );
          },
        ),
        BlocListener<CartBloc, CartState>(
          listenWhen: (previous, current) =>
              previous.isBuyAgain != current.isBuyAgain && !current.isBuyAgain,
          listener: (context, state) {
            if (context.router.current.path == 'orders/cart') {
              state.apiFailureOrSuccessOption.fold(
                () {
                  CustomSnackBar(
                    key: WidgetKeys.materialDetailsAddToCartSnackBar,
                    messageText: context.tr('Available item(s) added to cart'),
                  ).show(context);
                },
                (_) {},
              );
            }
          },
        ),
      ],
      child: BlocConsumer<CartBloc, CartState>(
        listenWhen: (previous, current) =>
            previous.cartProducts.length != current.cartProducts.length &&
            (previous.isUpserting != current.isUpserting ||
                previous.isClearing != current.isClearing),
        listener: (context, state) {
          if (state.cartProducts.isEmpty) {
            context.read<AdditionalDetailsBloc>().add(
                  AdditionalDetailsEvent.initialized(
                    config:
                        context.read<EligibilityBloc>().state.salesOrgConfigs,
                    customerCodeInfo:
                        context.read<EligibilityBloc>().state.customerCodeInfo,
                  ),
                );
          }

          if ((!state.isUpserting || !state.isClearing) &&
              context.router.current.path == 'orders/cart') {
            CustomSnackBar(
              messageText: context.tr('Cart has been emptied.'),
            ).show(context);
          }
        },
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          return GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Scaffold(
              key: WidgetKeys.cartPage,
              appBar: AppBar(
                title: Text(
                  '${'Cart'.tr()} (${state.cartProducts.length})',
                  key: WidgetKeys.cartPageAppBarTitle,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                centerTitle: false,
                titleSpacing: 0,
                leading: IconButton(
                  key: WidgetKeys.closeButton,
                  icon: const Icon(
                    Icons.close,
                  ),
                  onPressed: () => context.router.pop(),
                ),
                actions: state.cartProducts.isNotEmpty
                    ? [
                        state.isClearing
                            ? Align(
                                alignment: Alignment.center,
                                child: LoadingAnimationWidget
                                    .horizontalRotatingDots(
                                  key: WidgetKeys.soaLoadingAnimationWidgetKey,
                                  color: ZPColors.red,
                                  size: 24,
                                ),
                              )
                            : IconButton(
                                key: WidgetKeys.cartClearButton,
                                icon: const Icon(
                                  Icons.delete_outlined,
                                  color: ZPColors.red,
                                ),
                                onPressed: () {
                                  context.read<CartBloc>().add(
                                        const CartEvent.clearCart(),
                                      );
                                  context.read<PriceOverrideBloc>().add(
                                        const PriceOverrideEvent.initialized(),
                                      );
                                },
                              ),
                      ]
                    : null,
              ),
              body: Column(
                children: [
                  AnnouncementWidget(
                    currentPath: context.router.currentPath,
                  ),
                  const AccountSuspendedBanner(),
                  const CustomerBlockedBanner(),
                  if (!state.priceUnderLoadingShimmer)
                    const _CartPageInvalidItemsBanner(),
                  const _CartPageCartScrollList(),
                  if (state.cartProducts.isNotEmpty)
                    const _CartPageCheckoutSection(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

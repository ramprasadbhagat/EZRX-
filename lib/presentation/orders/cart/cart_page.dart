import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/presentation/core/address_info_section.dart';
import 'package:ezrxmobile/presentation/core/bullet_widget.dart';
import 'package:ezrxmobile/presentation/core/info_label.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/item/cart_product_bonus_offer_tile.dart';
import 'package:ezrxmobile/presentation/orders/cart/item/cart_product_bundle.dart';
import 'package:ezrxmobile/presentation/orders/cart/item/cart_product_tile.dart';
import 'package:ezrxmobile/presentation/orders/cart/item/cart_product_tile_bonus.dart';
import 'package:ezrxmobile/presentation/orders/cart/pre_order_modal/pre_order_modal.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/application/order/cart/price_override/price_override_bloc.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/orders/core/account_suspended_warning.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

part 'package:ezrxmobile/presentation/orders/cart/widget/minimum_order_value_message.dart';
part 'package:ezrxmobile/presentation/orders/cart/widget/cart_page_cart_scroll_list.dart';
part 'package:ezrxmobile/presentation/orders/cart/widget/cart_page_cart_scroll_list_item.dart';
part 'package:ezrxmobile/presentation/orders/cart/widget/cart_page_checkout_section.dart';
part 'package:ezrxmobile/presentation/orders/cart/widget/cart_page_invalid_items_banner.dart';
part 'package:ezrxmobile/presentation/orders/cart/widget/cart_page_price_message.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    if (context.read<CartBloc>().state.cartProducts.isNotEmpty) {
      context.read<CartBloc>().add(
            CartEvent.getDetailsProductsAddedToCart(
              cartProducts: context.read<CartBloc>().state.cartProducts,
            ),
          );
      context.read<MaterialPriceBloc>().add(
            MaterialPriceEvent.fetchPriceCartProduct(
              salesOrganisation:
                  context.read<EligibilityBloc>().state.salesOrganisation,
              salesConfigs:
                  context.read<EligibilityBloc>().state.salesOrgConfigs,
              customerCodeInfo:
                  context.read<EligibilityBloc>().state.customerCodeInfo,
              shipToInfo: context.read<EligibilityBloc>().state.shipToInfo,
              comboDealEligible:
                  context.read<EligibilityBloc>().state.comboDealEligible,
              products: context
                  .read<CartBloc>()
                  .state
                  .cartProducts
                  .where((element) => !element.materialInfo.type.typeBundle)
                  .map((e) => e.materialInfo)
                  .toList(),
            ),
          );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<MaterialPriceBloc, MaterialPriceState>(
          listenWhen: (previous, current) =>
              previous.isFetching != current.isFetching,
          listener: (context, state) {
            if (!state.isFetching) {
              context.read<CartBloc>().add(
                    CartEvent.updatePriceProduct(
                      priceProducts: state.materialPrice,
                      overriddenProductPrice:
                          context.read<PriceOverrideBloc>().state.item.price,
                    ),
                  );
            }
          },
        ),
        BlocListener<CartBloc, CartState>(
          listenWhen: (previous, current) =>
              previous.totalPriceWithTax != current.totalPriceWithTax &&
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
                    grandTotal: state.totalPriceWithTax,
                    orderType: context
                        .read<EligibilityBloc>()
                        .state
                        .selectedOrderType
                        .documentType
                        .getOrDefaultValue(''),
                    subTotal: state.subTotal,
                  ),
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
                    messageText: context.tr('Item has been added to cart'),
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
              messageText: 'Item has been removed from cart.',
            ).show(context);
          }
        },
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          final taxCode =
              context.read<EligibilityBloc>().state.salesOrg.taxCode;

          return GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Scaffold(
              key: WidgetKeys.cartPage,
              appBar: AppBar(
                title: Text(
                  '${'Cart'.tr()} (${state.cartProducts.length})',
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
                  if (!state.priceUnderLoadingShimmer)
                    const _CartPageInvalidItemsBanner(),
                  _CartPageCartScrollList(state: state, taxCode: taxCode),
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

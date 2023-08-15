import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/price_override/price_override_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/orders/cart/item/cart_product_bundle.dart';
import 'package:ezrxmobile/presentation/orders/cart/item/cart_product_tile.dart';
import 'package:ezrxmobile/presentation/orders/cart/item/cart_product_tile_bonus.dart';
import 'package:ezrxmobile/presentation/orders/cart/pre_order_modal/pre_order_modal.dart';
import 'package:ezrxmobile/presentation/orders/core/account_suspended_warning.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';

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
                  context.read<SalesOrgBloc>().state.salesOrganisation,
              salesConfigs: context.read<SalesOrgBloc>().state.configs,
              customerCodeInfo:
                  context.read<CustomerCodeBloc>().state.customerCodeInfo,
              shipToInfo: context.read<CustomerCodeBloc>().state.shipToInfo,
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
      context.read<CartBloc>().add(
            CartEvent.updateProductStock(
              products: context.read<CartBloc>().state.cartProducts,
              salesOrganisation:
                  context.read<SalesOrgBloc>().state.salesOrganisation,
              customerCodeInfo:
                  context.read<CustomerCodeBloc>().state.customerCodeInfo,
              shipToInfo: context.read<CustomerCodeBloc>().state.shipToInfo,
              salesOrganisationConfigs:
                  context.read<SalesOrgBloc>().state.configs,
            ),
          );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MaterialPriceBloc, MaterialPriceState>(
      listenWhen: (previous, current) =>
          previous.isFetching != current.isFetching,
      listener: (context, state) {
        if (!state.isFetching) {
          context.read<CartBloc>().add(
                CartEvent.updatePriceProduct(
                  priceProducts: state.materialPrice,
                  overriddenProductPrice: context
                      .read<PriceOverrideBloc>()
                      .state
                      .overriddenMaterialPrice,
                  salesOrganisation:
                      context.read<SalesOrgBloc>().state.salesOrganisation,
                  customerCodeInfo:
                      context.read<CustomerCodeBloc>().state.customerCodeInfo,
                  shipToInfo: context.read<CustomerCodeBloc>().state.shipToInfo,
                  salesOrganisationConfigs:
                      context.read<SalesOrgBloc>().state.configs,
                ),
              );
        }
      },
      child: BlocConsumer<CartBloc, CartState>(
        listenWhen: (previous, current) =>
            previous.cartProducts.length != current.cartProducts.length &&
            (previous.isUpserting != current.isUpserting ||
                previous.isClearing != current.isClearing),
        listener: (context, state) {
          if (state.cartProducts.isEmpty) {
            context.read<AdditionalDetailsBloc>().add(
                  AdditionalDetailsEvent.initialized(
                    config: context.read<SalesOrgBloc>().state.configs,
                    customerCodeInfo:
                        context.read<CustomerCodeBloc>().state.customerCodeInfo,
                  ),
                );
          }
          state.apiFailureOrSuccessOption.fold(
            () {
              if ((!state.isUpserting || !state.isClearing) &&
                  context.router.current.path == 'orders/cart') {
                CustomSnackBar(
                  messageText: 'Item has been removed from cart.'.tr(),
                ).show(context);
              }
            },
            (either) => {},
          );
        },
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          final taxCode = context.read<SalesOrgBloc>().state.salesOrg.taxCode;

          return GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
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
                  icon: const Icon(
                    Icons.close,
                  ),
                  onPressed: () {
                    context.router.pop();
                  },
                ),
                actions: state.cartProducts.isNotEmpty
                    ? [
                        IconButton(
                          icon: const Icon(
                            Icons.delete_outlined,
                            color: ZPColors.red,
                          ),
                          onPressed: () {
                            context.read<CartBloc>().add(
                                  const CartEvent.clearCart(),
                                );
                            context
                                .read<PriceOverrideBloc>()
                                .add(const PriceOverrideEvent.initialized());
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
                  _CartScrollList(state: state, taxCode: taxCode),
                  state.cartProducts.isNotEmpty
                      ? const _CheckoutSection()
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CartScrollList extends StatelessWidget {
  const _CartScrollList({
    Key? key,
    required this.state,
    required this.taxCode,
  }) : super(key: key);

  final CartState state;
  final String taxCode;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listenWhen: (previous, current) =>
          previous.cartProducts.length != current.cartProducts.length,
      listener: (context, state) {
        state.apiFailureOrSuccessOption.fold(
          () {
            if (!state.isFetching) {
              if (context.read<CartBloc>().state.cartProducts.isNotEmpty) {
                context.read<MaterialPriceBloc>().add(
                      MaterialPriceEvent.fetchPriceCartProduct(
                        salesOrganisation: context
                            .read<SalesOrgBloc>()
                            .state
                            .salesOrganisation,
                        salesConfigs:
                            context.read<SalesOrgBloc>().state.configs,
                        customerCodeInfo: context
                            .read<CustomerCodeBloc>()
                            .state
                            .customerCodeInfo,
                        shipToInfo:
                            context.read<CustomerCodeBloc>().state.shipToInfo,
                        comboDealEligible: context
                            .read<EligibilityBloc>()
                            .state
                            .comboDealEligible,
                        products: context
                            .read<CartBloc>()
                            .state
                            .cartProducts
                            .where(
                              (element) =>
                                  !element.materialInfo.type.typeBundle,
                            )
                            .map((e) => e.materialInfo)
                            .toList(),
                      ),
                    );
              }
            }
          },
          (either) => {},
        );
      },
      buildWhen: (previous, current) =>
          previous.cartProducts.length != current.cartProducts.length ||
          previous.isFetching != current.isFetching,
      builder: (context, state) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: state.isFetching && state.cartProducts.isEmpty
                ? LoadingShimmer.logo(
                    key: WidgetKeys.loaderImage,
                  )
                : ScrollList<PriceAggregate>(
                    noRecordFoundWidget: NoRecordFound(
                      title: 'Your cart is empty'.tr(),
                      subTitle:
                          'Looks like you haven’t added anything to your cart yet.'
                              .tr(),
                      actionButton: ElevatedButton(
                        key: WidgetKeys.startBrowsingProducts,
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(
                            double.maxFinite,
                            50,
                          ),
                        ),
                        onPressed: () {
                          context.router.popUntilRouteWithPath('main');
                          context.router.pushNamed('main/products');
                        },
                        child: const Text('Start browsing').tr(),
                      ),
                      svgImage: SvgImage.shoppingCart,
                    ),
                    controller: ScrollController(),
                    onRefresh: () => context.read<CartBloc>().add(
                          CartEvent.fetchProductsAddedToCart(
                            salesOrg: context
                                .read<SalesOrgBloc>()
                                .state
                                .salesOrganisation,
                            config: context.read<SalesOrgBloc>().state.configs,
                            customerCodeInfo: context
                                .read<CustomerCodeBloc>()
                                .state
                                .customerCodeInfo,
                            shipToInfo: context
                                .read<CustomerCodeBloc>()
                                .state
                                .shipToInfo,
                            comboDealEligible: context
                                .read<EligibilityBloc>()
                                .state
                                .comboDealEligible,
                          ),
                        ),
                    isLoading: state.isFetching && state.cartProducts.isEmpty ||
                        state.isClearing,
                    itemBuilder: (context, index, item) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          state.showManufacturerName(index)
                              ? _ManufacturerName(
                                  cartProduct: item.materialInfo,
                                )
                              : const SizedBox(),
                          item.materialInfo.type.typeBundle
                              ? CartProductBundle(
                                  cartItem: item,
                                )
                              : CartProductTile(
                                  cartItem: item,
                                ),
                          state.cartProducts[index].addedBonusList.isNotEmpty
                              ? CartProductTileBonus(
                                  cartItem: item,
                                  index: index,
                                )
                              : const SizedBox.shrink(),
                        ],
                      );
                    },
                    items: state.cartProducts,
                  ),
          ),
        );
      },
    );
  }
}

class _ManufacturerName extends StatelessWidget {
  final MaterialInfo cartProduct;
  const _ManufacturerName({
    Key? key,
    required this.cartProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Text(
        cartProduct.principalData.principalName.getValue(),
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: ZPColors.neutralsBlack,
            ),
      ),
    );
  }
}

class _CheckoutSection extends StatelessWidget {
  const _CheckoutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      buildWhen: (previous, current) =>
          previous.cartProducts != current.cartProducts ||
          previous.isUpdatingStock != current.isUpdatingStock ||
          previous.isUpserting != current.isUpserting,
      builder: (context, state) {
        return Column(
          children: [
            const Divider(
              color: ZPColors.lightGray2,
              indent: 0,
              endIndent: 0,
              height: 15,
            ),
            ListTile(
              onTap: () => _showSumaryInfo(context),
              dense: true,
              visualDensity: VisualDensity.compact,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
              title: Text(
                'Order for ${context.read<CustomerCodeBloc>().state.customerCodeInfo.customerName}',
                style: Theme.of(context).textTheme.labelSmall,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 20,
              ),
            ),
            ListTile(
              dense: true,
              visualDensity: VisualDensity.compact,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
              title: Text(
                '${state.cartProducts.length} items',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              trailing: PriceComponent(
                salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
                price: state.totalPrice.toString(),
                title: 'Grand total: '.tr(),
                priceLabelStyle:
                    Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: ZPColors.extraLightGrey4,
                        ),
                currencyCodeTextStyle:
                    Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: ZPColors.primary,
                        ),
                priceTextStyle:
                    Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: ZPColors.primary,
                        ),
              ),
            ),
            SafeArea(
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: ElevatedButton(
                  key: WidgetKeys.checkoutButton,
                  onPressed: state.isUpdatingStock || state.isUpserting
                      ? null
                      : () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          state.cartProducts.preOrderItemPresentOnCart
                              ? _showPreOrderModal(context: context)
                              : context.router
                                  .pushNamed('orders/cart/checkout');
                        },
                  child: const Text('Check out').tr(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showPreOrderModal({required BuildContext context}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: context
              .read<CartBloc>()
              .state
              .cartProducts
              .where((e) => e.isPreOrder)
              .toList()
              .length >
          1,
      enableDrag: false,
      isDismissible: false,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (_) {
        return const PreOrderModal();
      },
    ).then(
      (value) {
        if (value == null) return;
        context.router.pushNamed('orders/cart/checkout');
      },
    );
  }

  void _showSumaryInfo(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      useSafeArea: true,
      builder: (_) {
        return Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.all(
                20,
              ),
              child: Column(
                children: [
                  const _SummaryInfo(),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        context.router.pop();
                      },
                      child: Text(
                        'Close'.tr(),
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  color: ZPColors.white,
                                ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _SummaryInfo extends StatelessWidget {
  const _SummaryInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Order for ${context.read<CustomerCodeBloc>().state.customerCodeInfo.customerName}',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        Text(
          'Customer code: ${context.read<CustomerCodeBloc>().state.customerCodeInfo.customerCodeSoldTo}',
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text(
          context
              .read<CustomerCodeBloc>()
              .state
              .customerCodeInfo
              .fullCustomerAddress,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        Text(
          'Deliver to: ${context.read<CustomerCodeBloc>().state.shipToInfo.shipToCustomerCode}',
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text(
          context.read<CustomerCodeBloc>().state.shipToInfo.deliveryAddress,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
        ),
      ],
    );
  }
}

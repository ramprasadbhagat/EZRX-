// ignore_for_file: unused_element

//ignore_for_file: unused-code
//ignore_for_file: unused-class

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';

import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/orders/cart/item/cart_product_tile_bonus.dart';
import 'package:ezrxmobile/presentation/orders/core/account_suspended_warning.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';

import 'package:ezrxmobile/domain/account/entities/bill_to_info.dart';

import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';

import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';

import 'package:ezrxmobile/presentation/core/widget_keys.dart';

import 'package:ezrxmobile/presentation/orders/cart/item/cart_product_tile.dart';

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
                  .map((e) => e.materialInfo)
                  .toList(),
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
            previous.apiFailureOrSuccessOption !=
                current.apiFailureOrSuccessOption ||
            previous.cartProducts != current.cartProducts,
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

  void _goToOrderSummary(BuildContext context) {
    final isMYMarketSalesRep =
        context.read<EligibilityBloc>().state.isMYMarketSalesRep;
    final config = context.read<SalesOrgBloc>().state.configs;
    final customerCodeInfo =
        context.read<CustomerCodeBloc>().state.customerCodeInfo;
    final billToInfo = customerCodeInfo.billToInfos.isNotEmpty
        ? customerCodeInfo.billToInfos.first
        : BillToInfo.empty();
    var maxStep = 4;
    var additionDetailsStep = 3;
    if (config.enableBillTo &&
        billToInfo.billToCustomerCode.isNotEmpty &&
        customerCodeInfo.customerCodeSoldTo != billToInfo.billToCustomerCode) {
      maxStep = 5;
      additionDetailsStep = 4;
    }
    context.read<OrderSummaryBloc>().add(OrderSummaryEvent.initialized(
          additionalDetailsStep: additionDetailsStep,
          maxSteps: maxStep,
          step: 0,
          config: config,
        ));

    context.read<OrderEligibilityBloc>().add(
          OrderEligibilityEvent.initialized(
            cartItems:
                context.read<CartBloc>().state.selectedCartItems.allMaterials,
            configs: config,
            customerCodeInfo: customerCodeInfo,
            grandTotal: context.read<CartBloc>().state.grandTotal(
                  isMYMarketSalesRep: isMYMarketSalesRep,
                ),
            orderType: context
                .read<OrderDocumentTypeBloc>()
                .state
                .selectedOrderType
                .documentType
                .getOrDefaultValue(''),
            salesOrg: context.read<SalesOrgBloc>().state.salesOrganisation,
            shipInfo: context.read<CustomerCodeBloc>().state.shipToInfo,
            user: context.read<UserBloc>().state.user,
            subTotal: context.read<CartBloc>().state.subTotal(
                  isMYMarketSalesRep: isMYMarketSalesRep,
                ),
          ),
        );
    context.router.pushNamed('orders/order_summary');
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
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ScrollList<PriceAggregate>(
          noRecordFoundWidget: NoRecordFound(
            title: 'Your cart is empty'.tr(),
            subTitle:
                'Looks like you haven’t added anything to your cart yet.'.tr(),
            actionButton: ElevatedButton(
              key: WidgetKeys.startBrowsingProducts,
              onPressed: () {
                context.router.popUntilRouteWithPath('main');
                context.router.pushNamed('main/products');
              },
              child: const Text('Start browsing').tr(),
            ),
            svgImage: SvgImage.shoppingCart,
          ),
          controller: ScrollController(),
          onRefresh: () {},
          isLoading: state.isFetching && state.cartProducts.isEmpty ||
              state.isClearing,
          itemBuilder: (context, index, item) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                index == 0 ||
                        state.cartProducts[index].materialInfo.principalData
                                .principalName
                                .getValue() !=
                            state.cartProducts[index - 1].materialInfo
                                .principalData.principalName
                                .getValue()
                    ? _ManufacturerName(
                        cartProduct: item.materialInfo,
                      )
                    : const SizedBox(),
                CartProductTile(
                  cartItem: item,
                  index: index,
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

//TODO: To be removed when add to cart flow is implemented
class _SelectAllButton extends StatelessWidget {
  const _SelectAllButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return Expanded(
          key: WidgetKeys.selectAllButton,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Radio(
                key: WidgetKeys.selectAllRadioButton,
                value: state.selectedCartItems.length,
                groupValue: state.cartItems.length,
                toggleable: true,
                onChanged: (value) {
                  context.read<CartBloc>().add(
                        const CartEvent.selectAllButtonTapped(),
                      );
                },
              ),
              Flexible(
                child: Text(
                  'Select All'.tr(),
                  style: TextStyle(
                    color:
                        state.selectedCartItems.length == state.cartItems.length
                            ? ZPColors.primary
                            : ZPColors.black,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

//TODO: To be removed when add to cart flow is implemented
class _TotalSection extends StatelessWidget {
  const _TotalSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vatInPercentage = context.read<EligibilityBloc>().state;

    return BlocBuilder<CartBloc, CartState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        final salesOrgConfig = context.read<SalesOrgBloc>().state.configs;
        final taxCode = context.read<SalesOrgBloc>().state.salesOrg.taxCode;

        return _TotalPriceSection(
          salesOrgConfig: salesOrgConfig,
          cartState: state,
          vatInPercentage: vatInPercentage,
          taxCode: taxCode,
        );
      },
    );
  }
}

//TODO: To be removed when add to cart flow is implemented
class _TotalPriceSection extends StatelessWidget {
  final SalesOrganisationConfigs salesOrgConfig;
  final CartState cartState;
  final EligibilityState vatInPercentage;
  final String taxCode;
  const _TotalPriceSection({
    required this.salesOrgConfig,
    required this.cartState,
    required this.vatInPercentage,
    required this.taxCode,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderDocumentTypeBloc, OrderDocumentTypeState>(
      buildWhen: (previous, current) =>
          previous.selectedOrderType != current.selectedOrderType,
      builder: (context, state) {
        final isMYMarketSalesRep = context.select<EligibilityBloc, bool>(
          (bloc) => bloc.state.isMYMarketSalesRep,
        );

        return Expanded(
          flex: 2,
          key: WidgetKeys.totalSection,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BalanceTextRow(
                keyText: 'Subtotal'.tr(),
                valueText: StringUtils.displayPrice(
                  salesOrgConfig,
                  cartState.subTotal(
                    isMYMarketSalesRep: isMYMarketSalesRep,
                  ),
                ),
                valueFlex: 1,
              ),
              if (vatInPercentage.salesOrgConfigs.shouldDisplayVATInPercentage)
                BalanceTextRow(
                  key: WidgetKeys.taxCodeInPercentageKey,
                  keyText: '$taxCode in %'.tr(),
                  valueText: '${salesOrgConfig.vatValue}%',
                  valueFlex: 1,
                ),
              if (salesOrgConfig.shouldShowTax)
                BalanceTextRow(
                  key: WidgetKeys.totalTaxKey,
                  keyText: taxCode.tr(),
                  valueText: StringUtils.displayPrice(
                    salesOrgConfig,
                    cartState.vatTotalOnOrderType(
                      isMYMarketSalesRep: isMYMarketSalesRep,
                    ),
                  ),
                  valueFlex: 1,
                ),
              BalanceTextRow(
                key: WidgetKeys.grandTotalKey,
                keyText: 'Grand Total'.tr(),
                valueText: StringUtils.displayPrice(
                  salesOrgConfig,
                  cartState.grandTotal(
                    isMYMarketSalesRep: isMYMarketSalesRep,
                  ),
                ),
                valueFlex: 1,
              ),
            ],
          ),
        );
      },
    );
  }
}

//TODO: Static data to be removed once add to cart flow is implemented
class _CheckoutSection extends StatelessWidget {
  const _CheckoutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      buildWhen: (previous, current) =>
          previous.cartProducts != current.cartProducts,
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
              trailing: RichText(
                text: TextSpan(
                  text: 'Grand total: ',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: ZPColors.extraLightGrey4,
                      ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'MYR ',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: ZPColors.primary,
                          ),
                    ),
                    TextSpan(
                      text: state.totalPrice.toStringAsFixed(2),
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: ZPColors.primary,
                          ),
                    ),
                  ],
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
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    context.router.pushNamed('orders/cart/checkout');
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

  void _showSumaryInfo(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      useSafeArea: true,
      builder: (_) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: Padding(
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
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: ZPColors.white,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
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

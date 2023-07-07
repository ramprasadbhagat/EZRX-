import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/additional_details/additional_details_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/presentation/core/text_field_with_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/checkout/widgets/product_item.dart';
import 'package:ezrxmobile/presentation/orders/cart/checkout/widgets/request_delivery_date.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: WidgetKeys.checkoutPage,
      appBar: AppBar(
        title: Text(
          'Checkout'.tr(),
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
      ),
      body: const CustomScrollView(
        slivers: [
          _SummaryInfo(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 32.0,
            ),
          ),
          _DeliveryInfo(),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 24.0,
            ),
          ),
          SliverToBoxAdapter(
            child: Divider(
              indent: 0,
              thickness: 1,
              endIndent: 0,
              height: 1,
              color: ZPColors.extraLightGrey2,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 32.0,
            ),
          ),
          _TitleScrollList(),
          _ManufactureScrollList(),
          SliverToBoxAdapter(
            child: Divider(
              indent: 0,
              thickness: 1,
              endIndent: 0,
              height: 1,
              color: ZPColors.extraLightGrey2,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 32.0,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            sliver: SliverToBoxAdapter(
              child: _OrderSummary(),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 8.0,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(
            indent: 0,
            thickness: 1,
            endIndent: 0,
            height: 1,
            color: ZPColors.extraLightGrey2,
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return ListTile(
                onTap: () {
                  _showOrderSumary(context);
                },
                dense: true,
                visualDensity: VisualDensity.compact,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                title: Text(
                  '${state.cartProducts.length} items',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Grand total: ',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: ZPColors.extraLightGrey4,
                            ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'MYR ',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: ZPColors.primary,
                                ),
                          ),
                          TextSpan(
                            text: (state.totalPrice + state.totalPrice * 0.07).toStringAsFixed(2),
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: ZPColors.primary,
                                ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 16,
                      color: ZPColors.neutralsBlack,
                    ),
                  ],
                ),
              );
            },
          ),
          SafeArea(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: ElevatedButton(
                key: WidgetKeys.checkoutButton,
                onPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: const Text('Place order').tr(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showOrderSumary(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      useSafeArea: true,
      builder: (_) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Padding(
              padding: const EdgeInsets.all(20,), child: Column(
                children: [
                  const _OrderSummary(),
                  const SizedBox(height: 16,),
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
              ),),
        );
      },
    );
  }
}

class _SummaryInfo extends StatelessWidget {
  const _SummaryInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
        color: ZPColors.primary,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'RSD Hospitals SDN BHD',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: ZPColors.white,
                  ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Text(
              'Customer code: ${context.read<CustomerCodeBloc>().state.customerCodeInfo.customerCodeSoldTo}',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: ZPColors.white,
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
                    color: ZPColors.white,
                  ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Text(
              'Deliver to: ${context.read<CustomerCodeBloc>().state.shipToInfo.shipToCustomerCode}',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: ZPColors.white,
                  ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              context.read<CustomerCodeBloc>().state.shipToInfo.deliveryAddress,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: ZPColors.white,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DeliveryInfo extends StatelessWidget {
  const _DeliveryInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      sliver: BlocBuilder<AdditionalDetailsBloc, AdditionalDetailsState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          return SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Delivery information'.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(color: ZPColors.neutralsBlack),
                    ),
                    IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.expand_less_outlined,
                        ),
                        splashRadius: 24,),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFieldWithLabel(
                  fieldKey: WidgetKeys.showDeliveryInfo,
                  labelText: 'PO reference'.tr(),
                  controller: TextEditingController(),
                  validator: (value) {},
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    hintText: 'Enter your PO reference'.tr(),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                RequestDeliveryDate(
                  futureDeliveryDay: context
                      .read<SalesOrgBloc>()
                      .state
                      .configs
                      .futureDeliveryDay
                      .validatedFutureDeliveryDate,
                  deliveryInfoData: state.deliveryInfoData,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFieldWithLabel(
                  fieldKey: WidgetKeys.showDeliveryInfo,
                  labelText: 'Reference note'.tr(),
                  controller: TextEditingController(),
                  validator: (value) {},
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    hintText: 'Enter reference note'.tr(),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFieldWithLabel(
                  fieldKey: WidgetKeys.showDeliveryInfo,
                  labelText: 'Payment term'.tr(),
                  controller: TextEditingController(),
                  validator: (value) {},
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    hintText: 'Select one'.tr(),
                    suffixIconConstraints:
                        const BoxConstraints(maxHeight: 22, minHeight: 22),
                    suffixIcon: IconButton(
                      splashRadius: 22,
                      padding: EdgeInsets.zero,
                      key: WidgetKeys.loginPasswordFieldSuffixIcon,
                      icon: const Icon(
                        Icons.expand_more_outlined,
                        size: 22,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFieldWithLabel(
                  fieldKey: WidgetKeys.showDeliveryInfo,
                  labelText: 'Contact person'.tr(),
                  controller: TextEditingController(),
                  validator: (value) {},
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    hintText: 'Enter contact person name'.tr(),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                // TextFieldWithLabel(
                //   fieldKey: WidgetKeys.showDeliveryInfo,
                //   labelText: 'Mobile number'.tr(),
                //   controller: TextEditingController(),
                //   validator: (value) {},
                //   onChanged: (value) {},
                //   decoration: InputDecoration(
                //     hintText: 'Enter contact person number'.tr(),
                //     prefixIconConstraints: const BoxConstraints(
                //       maxWidth: 100,
                //     ),
                //     prefixIcon: InkWell(
                //       onTap: () {},
                //       child: Container(
                //         decoration: const BoxDecoration(
                //           color: ZPColors.inputBorderColor,
                //           borderRadius: BorderRadius.horizontal(
                //             left: Radius.circular(8),
                //           ),
                //         ),
                //         padding: const EdgeInsets.symmetric(vertical: 12),
                //         child: Row(
                //           children: [
                //             Text('+65'),
                //             Icon(
                //               Icons.expand_more_outlined,
                //             )
                //           ],
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Mobile number'.tr(), style: Theme.of(context).textTheme.labelSmall,),
                    const SizedBox(height: 8,),
                    InternationalPhoneNumberInput(
                      countries: const ['MY'],
                      initialValue: PhoneNumber(isoCode: 'MY'),
                      onInputValidated: (bool value) {},
                      autoValidateMode: AutovalidateMode.disabled,
                      ignoreBlank: false,
                      onInputChanged: (value) {},
                      cursorColor: Colors.black,
                      formatInput: false,
                      selectorConfig: const SelectorConfig(
                        selectorType: PhoneInputSelectorType.DROPDOWN,
                        showFlags: true,
                      ),
                      inputDecoration: InputDecoration(
                        hintText: 'Enter contact person number'.tr(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFieldWithLabel(
                  fieldKey: WidgetKeys.showDeliveryInfo,
                  labelText: 'Delivery instructions'.tr(),
                  controller: TextEditingController(),
                  maxLines: 3,
                  validator: (value) {},
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    hintText: 'Enter delivery instructions'.tr(),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: Theme.of(context)
                        .elevatedButtonTheme
                        .style
                        ?.copyWith(
                          backgroundColor:
                              const MaterialStatePropertyAll(ZPColors.white),
                          shape: const MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                              side: BorderSide(color: ZPColors.primary),
                            ),
                          ),
                        ),
                    child: Text(
                      'Upload Attachment'.tr(),
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: ZPColors.primary,
                          ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Attachments:',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: ZPColors.neutralsBlack),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ManufactureScrollList extends StatelessWidget {
  const _ManufactureScrollList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return CheckoutProductItem(cartItem: state.cartProducts[index]);
            },
            childCount: state.cartProducts.length, // 1000 list items
          ),
        );
      },
    );
  }
}

class _TitleScrollList extends StatelessWidget {
  const _TitleScrollList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      sliver: SliverToBoxAdapter(
        child: Text(
          'Manufacturer name'.tr(),
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
        ),
      ),
    );
  }
}

class _OrderSummary extends StatelessWidget {
  const _OrderSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        final tax = state.totalPrice * 0.07;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order summary'.tr(),
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: ZPColors.neutralsBlack,
                  ),
            ),
            const SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtotal (excl.tax):'.tr(),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: ZPColors.neutralsBlack,
                      ),
                ),
                Text(
                  'MRY ${state.totalPrice.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: ZPColors.neutralsBlack,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tax at 7%'.tr(),
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: ZPColors.neutralsBlack,
                          ),
                    ),
                    Text(
                      'MYR ${tax.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: ZPColors.neutralsBlack,
                          ),
                    ),
                  ],
                ),
                // Text(
                //   'Applies to materials with full tax'.tr(),
                //   style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                //         color: ZPColors.neutralsBlack,
                //         fontSize: 10,
                //       ),
                // )
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Stamp duty:'.tr(),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: ZPColors.neutralsBlack,
                      ),
                ),
                Text(
                  'MYR 0'.tr(),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: ZPColors.neutralsBlack,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Small order fee'.tr(),
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: ZPColors.neutralsBlack,
                          ),
                    ),
                    ///ToDo: hard code
                    Text(
                      'MYR 0',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: ZPColors.neutralsBlack,
                          ),
                    ),
                  ],
                ),
                // Text(
                //   'Applies to orders less than MYR 2,000,000.00'.tr(),
                //   style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                //         color: ZPColors.neutralsBlack,
                //         fontSize: 10,
                //       ),
                // ),
              ],
            ),
            const SizedBox(height: 4.0),
            const Divider(
              thickness: 1,
              color: ZPColors.extraLightGrey3,
              indent: 0,
              endIndent: 0,
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Grand total: ',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: ZPColors.neutralsBlack,
                      ),
                ),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'MYR ',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: ZPColors.neutralsBlack,
                                ),
                      ),
                      TextSpan(
                        text: (state.totalPrice + tax).toStringAsFixed(2),
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  color: ZPColors.neutralsBlack,
                                ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total savings:'.tr(),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: ZPColors.neutralsBlack,
                      ),
                ),
                Text(
                  'MYR 0'.tr(),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: ZPColors.neutralsBlack,
                      ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

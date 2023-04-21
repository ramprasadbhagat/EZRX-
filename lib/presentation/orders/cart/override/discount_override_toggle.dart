import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/cart/discount_override/discount_override_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';

import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';

class DiscountOverrideToggle extends StatelessWidget {
  final PriceAggregate cartItem;

  const DiscountOverrideToggle({Key? key, required this.cartItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DiscountOverrideBloc, DiscountOverrideState>(
      listenWhen: (previous, current) => current != previous,
      buildWhen: (previous, current) => current != previous,
      listener: (context, state) {
        state.apiFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              ErrorUtils.handleApiFailure(context, failure);

              return;
            },
            (_) {},
          ),
        );

        context.read<CartBloc>().add(
              CartEvent.discountOverride(
                item: cartItem.copyWith(
                  price: state.materialPrice,
                ),
              ),
            );
      },
      builder: ((context, state) {
        return Column(
          key: const Key('discountOverride'),
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              'Discount Override',
              style:
                  Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 8),
            ).tr(),
            CupertinoSwitch(
              key: const Key('discountOverrideToggle'),
              value: state.isDiscountOverride,
              activeColor: ZPColors.kPrimaryColor,
              onChanged: (bool val) {
                if (val) {
                  DiscountOverrideDialog.show(
                    context: context,
                    cartItem: cartItem,
                  );
                } else {
                  context.read<DiscountOverrideBloc>().add(
                        DiscountOverrideEvent.fetch(
                          salesOrganisation: context
                              .read<SalesOrgBloc>()
                              .state
                              .salesOrganisation,
                          customerCode: context
                              .read<CustomerCodeBloc>()
                              .state
                              .customerCodeInfo,
                          material: cartItem.materialInfo,
                          materialNumber: cartItem.getMaterialNumber,
                          price: cartItem.price.copyWith(
                            zdp8Override: Zdp8OverrideValue(
                              0,
                            ),
                          ),
                          shipToInfo: context.read<ShipToCodeBloc>().state.shipToInfo,
                        ),
                      );
                }
              },
            ),
            Visibility(
              visible: state.isDiscountOverride,
              maintainState: true,
              maintainAnimation: true,
              maintainSize: true,
              child: TextButton(
                onPressed: () => DiscountOverrideDialog.show(
                  context: context,
                  cartItem: cartItem,
                ),
                child: Text(
                  '${'Discount : '.tr()}${cartItem.price.zdp8Override.getOrDefaultValue(0)}',
                  key: Key('discountOverridePercentage${cartItem.price.zdp8Override.getOrDefaultValue(0)}'),
                  style: Theme.of(context).textTheme.labelSmall?.apply(
                        color: state.isDiscountOverride
                            ? ZPColors.red
                            : ZPColors.black,
                        decoration: TextDecoration.underline,
                      ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

class DiscountOverrideDialog {
  static void show({
    required BuildContext context,
    required PriceAggregate cartItem,
  }) {
    showPlatformDialog(
      context: context,
      barrierDismissible: false,
      useRootNavigator: true,
      builder: (_) {
        final controller = TextEditingController(
          text: '${cartItem.price.zdp8Override.getOrDefaultValue(10)}',
        );
        context.read<DiscountOverrideBloc>().add(
              DiscountOverrideEvent.update(
                price: cartItem.price,
                showErrorMessages: false,
              ),
            );

        return _getDialog(
          cartItem: cartItem,
          controller: controller,
          context: context,
        );
      },
    );
  }

  static Widget _getDialog({
    required TextEditingController controller,
    required PriceAggregate cartItem,
    required BuildContext context,
  }) {
    return PlatformAlertDialog(
      key: const Key('discountOverridsDialog'),
      title: const Text('Discount Override').tr(),
      content: BlocProvider.value(
        value: context.read<DiscountOverrideBloc>(),
        child: DiscountOverrideForm(controller: controller),
      ),
      actions: [
        PlatformDialogAction(
          key: const Key('cancel'),
          child: const Text('Cancel').tr(),
          onPressed: () {
            context.router.pop();
          },
        ),
        PlatformDialogAction(
          key: const Key('Submit'),
          onPressed: () {
            if (controller.text.isEmpty) {
              context.read<DiscountOverrideBloc>().add(
                    DiscountOverrideEvent.update(
                      price: cartItem.price,
                      showErrorMessages: true,
                    ),
                  );

              return;
            }
            context.read<DiscountOverrideBloc>().add(
                  DiscountOverrideEvent.fetch(
                    salesOrganisation:
                        context.read<SalesOrgBloc>().state.salesOrganisation,
                    customerCode:
                        context.read<CustomerCodeBloc>().state.customerCodeInfo,
                    material: cartItem.materialInfo,
                    materialNumber: cartItem.getMaterialNumber,
                    price: cartItem.price.copyWith(
                      zdp8Override: Zdp8OverrideValue(
                        double.parse(controller.text),
                      ),
                    ),
                    shipToInfo: context.read<ShipToCodeBloc>().state.shipToInfo,
                  ),
                );
            context.router.pop();
          },
          child: const Text('Submit').tr(),
        ),
      ],
    );
  }
}

class DiscountOverrideForm extends StatelessWidget {
  final TextEditingController controller;
  const DiscountOverrideForm({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscountOverrideBloc, DiscountOverrideState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return Form(
          autovalidateMode:
              context.read<DiscountOverrideBloc>().state.showErrorMessages
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
          child: Material(
            child: TextFormField(
              controller: controller,
              key: const Key('discountOvverrideField'),
              keyboardType: const TextInputType.numberWithOptions(
                signed: false,
                decimal: true,
              ),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(
                  RegExp(r'^(?=.*[1-9])\d{0,2}(?:\.\d{0,2})?'),
                ),
              ],
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ZPColors.primary, width: 1.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1.0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                suffixIcon: Icon(
                  Icons.percent,
                  color: ZPColors.black,
                  size: 18,
                ),
              ),
              validator: (String? value) => value?.isEmpty ?? false
                  ? 'Override cannot be empty.'.tr()
                  : null,
            ),
          ),
        );
      },
    );
  }
}

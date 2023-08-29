import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/price_override/price_override_bloc.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/text_field_with_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestCounterOfferSheet extends StatelessWidget {
  final PriceAggregate cartItem;
  const RequestCounterOfferSheet({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartBloc, CartState>(
      listenWhen: (previous, current) =>
          previous.isUpserting != current.isUpserting,
      listener: (context, state) {
        context.read<PriceOverrideBloc>().add(
              PriceOverrideEvent.fetch(
                item: cartItem,
                salesOrganisation:
                    context.read<SalesOrgBloc>().state.salesOrganisation,
                customerCodeInfo:
                    context.read<CustomerCodeBloc>().state.customerCodeInfo,
              ),
            );
        context.router.pop();
      },
      child: BlocBuilder<PriceOverrideBloc, PriceOverrideState>(
        buildWhen: (previous, current) =>
            previous.showErrorMessages != current.showErrorMessages,
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              autovalidateMode:
                  context.read<PriceOverrideBloc>().state.showErrorMessages
                      ? AutovalidateMode.always
                      : AutovalidateMode.disabled,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Request counter offer'.tr(),
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  BalanceTextRow(
                    keyText: 'List price'.tr(),
                    valueText:
                        'MYR ${cartItem.price.lastPrice.getOrDefaultValue(0).toString()}',
                    keyTextStyle:
                        Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: ZPColors.darkGray,
                            ),
                    valueTextStyle:
                        Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: ZPColors.darkGray,
                              decoration: TextDecoration.lineThrough,
                            ),
                    valueFlex: 5,
                  ),
                  BalanceTextRow(
                    keyText: 'Offer price'.tr(),
                    valueText:
                        'MYR ${cartItem.price.finalPrice.getOrDefaultValue(0).toString()}',
                    keyTextStyle:
                        Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: ZPColors.darkGray,
                            ),
                    valueTextStyle:
                        Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: ZPColors.darkGray,
                            ),
                    valueFlex: 4,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _CounterOfferPriceTextField(
                    counterOfferPrice: cartItem.materialInfo.counterOfferDetails
                        .counterOfferPrice.counterOfferValue,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _CounterOfferRemarksTextField(
                    remarks: cartItem.materialInfo.counterOfferDetails.comment
                        .getOrDefaultValue(''),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  _CounterOfferButtons(
                    cartItem: cartItem,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CounterOfferPriceTextField extends StatefulWidget {
  final double counterOfferPrice;
  const _CounterOfferPriceTextField({Key? key, required this.counterOfferPrice})
      : super(key: key);

  @override
  State<_CounterOfferPriceTextField> createState() =>
      __CounterOfferPriceTextFieldState();
}

class __CounterOfferPriceTextFieldState
    extends State<_CounterOfferPriceTextField> {
  late TextEditingController _priceController;

  @override
  void initState() {
    _priceController = TextEditingController.fromValue(
      TextEditingValue(
        text: _counterOfferPriceText,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PriceOverrideBloc, PriceOverrideState>(
      buildWhen: (previous, current) =>
          previous.showErrorMessages != current.showErrorMessages,
      builder: (context, state) {
        return TextFieldWithLabel(
          fieldKey: WidgetKeys.counterOfferPriceField,
          labelText: 'Counter offer price (MYR)'.tr(),
          decoration: InputDecoration(
            hintText: 'Enter counter offer price'.tr(),
          ),
          keyboardType: TextInputType.number,
          controller: _priceController,
          onChanged: (value) {
            context.read<PriceOverrideBloc>().add(
                  PriceOverrideEvent.onPriceValueChange(newPrice: value),
                );
          },
          onTapOutside: (event) {
            context.read<PriceOverrideBloc>().add(
                  PriceOverrideEvent.onPriceValueChange(
                    newPrice: _priceController.text,
                  ),
                );
          },
          validator: (value) {
            return context
                .read<PriceOverrideBloc>()
                .state
                .counterOfferDetails
                .counterOfferPrice
                .value
                .fold(
                  (f) => f.maybeMap(
                    empty: (_) => 'Please enter counter offer price'.tr(),
                    numberMustBiggerThanZero: (_) =>
                        'Counter offer price cannot be zero'.tr(),
                    orElse: () => null,
                  ),
                  (_) => null,
                );
          },
        );
      },
    );
  }

  String get _counterOfferPriceText {
    return widget.counterOfferPrice == 0.0
        ? ''
        : widget.counterOfferPrice.toString();
  }
}

class _CounterOfferRemarksTextField extends StatefulWidget {
  final String remarks;
  const _CounterOfferRemarksTextField({Key? key, required this.remarks})
      : super(key: key);

  @override
  State<_CounterOfferRemarksTextField> createState() =>
      __CounterOfferRemarksTextFieldState();
}

class __CounterOfferRemarksTextFieldState
    extends State<_CounterOfferRemarksTextField> {
  late TextEditingController _remarksController;

  @override
  void initState() {
    _remarksController = TextEditingController.fromValue(
      TextEditingValue(
        text: widget.remarks,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _remarksController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldWithLabel(
      fieldKey: WidgetKeys.counterOfferRemarksField,
      labelText: 'Remarks'.tr(),
      decoration: InputDecoration(
        hintText: 'Enter remarks (Optional)'.tr(),
        helperText: 'Maximum: 132 characters'.tr(),
      ),
      controller: _remarksController,
      onChanged: (value) {
        context.read<PriceOverrideBloc>().add(
              PriceOverrideEvent.onRemarksValueChange(
                newRemarks: value,
              ),
            );
      },
      onTapOutside: (event) {
        context.read<PriceOverrideBloc>().add(
              PriceOverrideEvent.onRemarksValueChange(
                newRemarks: _remarksController.text,
              ),
            );
      },
      maxLines: 3,
      maxLength: 132,
    );
  }
}

class _CounterOfferButtons extends StatelessWidget {
  final PriceAggregate cartItem;
  const _CounterOfferButtons({Key? key, required this.cartItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PriceOverrideBloc, PriceOverrideState>(
      buildWhen: (previous, current) =>
          previous.showErrorMessages != current.showErrorMessages,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  context.router.pop();
                },
                child: Text('Cancel'.tr()),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  if (state.showErrorMessages) return;
                  context.read<CartBloc>().add(
                        CartEvent.upsertCart(
                          priceAggregate: cartItem,
                          quantity: cartItem.quantity,
                          counterOfferDetails: context
                              .read<PriceOverrideBloc>()
                              .state
                              .counterOfferDetails
                              .copyWith(
                                counterOfferCurrency: Currency('MYR'),
                              ),
                        ),
                      );
                },
                child: Text('Confirm'.tr()),
              ),
            ),
          ],
        );
      },
    );
  }
}

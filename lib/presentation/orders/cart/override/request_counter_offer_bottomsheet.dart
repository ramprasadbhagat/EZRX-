import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/price_override/price_override_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/text_field_with_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'request_counter_offer_widgets/discount_override_section.dart';
part 'request_counter_offer_widgets/price_override_section.dart';
part 'request_counter_offer_widgets/counter_offer_buttons.dart';
part 'request_counter_offer_widgets/remarks_section.dart';
part 'request_counter_offer_widgets/discounted_price_section.dart';

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
        state.apiFailureOrSuccessOption.fold(
          () {
            context.read<PriceOverrideBloc>().add(
                  PriceOverrideEvent.fetch(
                    salesOrganisation:
                        context.read<SalesOrgBloc>().state.salesOrganisation,
                    customerCodeInfo:
                        context.read<CustomerCodeBloc>().state.customerCodeInfo,
                  ),
                );
          },
          (either) => either.fold(
            (failure) {
              ErrorUtils.handleApiFailure(context, failure);
            },
            (_) {},
          ),
        );
      },
      child: BlocConsumer<PriceOverrideBloc, PriceOverrideState>(
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
              (_) {
                context.read<CartBloc>().add(
                      CartEvent.updatePriceProduct(
                        priceProducts: context
                            .read<MaterialPriceBloc>()
                            .state
                            .materialPrice,
                        overriddenProductPrice: state.item.price,
                      ),
                    );
                context.router.pop();
              },
            ),
          );
        },
        buildWhen: (previous, current) =>
            previous.showErrorMessages != current.showErrorMessages,
        builder: (context, state) {
          final currency = context.read<SalesOrgBloc>().state.configs.currency;
          final isDiscountOverrideEnable =
              context.read<EligibilityBloc>().state.isZDP8Override;
          final isPriceOverrideEnable =
              context.read<EligibilityBloc>().state.isPriceOverrideEnable;

          return Padding(
            key: WidgetKeys.counterOfferBottomSheet,
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: ListView(
              shrinkWrap: true,
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
                      '${currency.code} ${cartItem.price.lastPrice.getOrDefaultValue(0).toString()}',
                  keyTextStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
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
                      '${currency.code} ${cartItem.price.finalPrice.getOrDefaultValue(0).toString()}',
                  keyTextStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ZPColors.darkGray,
                      ),
                  valueTextStyle:
                      Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: ZPColors.darkGray,
                          ),
                  valueFlex: 4,
                ),
                if (isPriceOverrideEnable)
                  _CounterOfferPriceTextField(
                    isDiscountOverrideEnable: isDiscountOverrideEnable,
                    cartItem: cartItem,
                  ),
                if (isDiscountOverrideEnable)
                  _CounterOfferDiscountTextField(
                    cartItem: cartItem,
                  ),
                const _DiscountedPriceField(),
                const Divider(
                  indent: 0,
                  endIndent: 0,
                  color: ZPColors.extraLightGrey3,
                ),
                _CounterOfferRemarksTextField(
                  remarks: cartItem.materialInfo.counterOfferDetails.comment
                      .getOrDefaultValue(''),
                ),
                if (state.showErrorMessages &&
                    isPriceOverrideEnable &&
                    isDiscountOverrideEnable)
                  const _CounterOfferEmptyFieldsErrorMessage(
                    key: WidgetKeys.counterOfferEmptyFieldErrorMessage,
                  ),
                _CounterOfferButtons(
                  cartItem: cartItem,
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CounterOfferEmptyFieldsErrorMessage extends StatelessWidget {
  const _CounterOfferEmptyFieldsErrorMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: ZPColors.lightRedStatusColor,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Text(
        'Please input value for Counter offer price (MYR) or Discount counter offer (%) to proceed.'
            .tr(),
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}

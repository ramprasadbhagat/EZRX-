import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/price_override/price_override_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/text_field_with_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'request_counter_offer_widgets/counter_offer_discount_text_field.dart';
part 'request_counter_offer_widgets/counter_offer_price_text_field.dart';
part 'request_counter_offer_widgets/counter_offer_buttons.dart';
part 'request_counter_offer_widgets/counter_offer_remarks_text_field.dart';
part 'request_counter_offer_widgets/counter_offer_discounted_price_field.dart';

class RequestCounterOfferBottomSheet extends StatelessWidget {
  final PriceAggregate cartItem;
  const RequestCounterOfferBottomSheet({
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
                        context.read<EligibilityBloc>().state.salesOrganisation,
                    customerCodeInfo:
                        context.read<EligibilityBloc>().state.customerCodeInfo,
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
                  context.tr('Request counter offer'),
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(
                  height: 5,
                ),
                PriceComponent(
                  key: WidgetKeys.counterOfferListPriceWidget,
                  title: '${context.tr('List price')} : ',
                  salesOrgConfig:
                      context.read<EligibilityBloc>().state.salesOrgConfigs,
                  price: cartItem.display(PriceType.listPrice),
                  priceLabelStyle:
                      Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: ZPColors.darkGray,
                          ),
                  type: PriceStyle.counterOfferPrice,
                ),
                PriceComponent(
                  key: WidgetKeys.counterOfferPriceWidget,
                  title: '${context.tr('Offer price')} : ',
                  salesOrgConfig:
                      context.read<EligibilityBloc>().state.salesOrgConfigs,
                  price: cartItem.display(PriceType.finalPrice),
                  priceLabelStyle:
                      Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: ZPColors.darkGray,
                          ),
                ),
                if (isPriceOverrideEnable)
                  _CounterOfferPriceTextField(
                    isDiscountOverrideEnable: isDiscountOverrideEnable,
                    cartItem: state.item,
                  ),
                if (isDiscountOverrideEnable) ...[
                  _CounterOfferDiscountTextField(
                    cartItem: state.item,
                    isPriceOverrideEnable: isPriceOverrideEnable,
                  ),
                  const _CounterOfferDiscountedPriceField(),
                  const Divider(
                    indent: 0,
                    endIndent: 0,
                    color: ZPColors.extraLightGrey3,
                  ),
                ],
                _CounterOfferRemarksTextField(
                  remarks: state.item.materialInfo.counterOfferDetails.comment
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
        context.tr(
          'Please input value for Counter offer price (MYR) or Discount counter offer (%) to proceed.',
        ),
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}

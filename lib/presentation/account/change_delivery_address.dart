import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';

import 'package:ezrxmobile/presentation/theme/colors.dart';

import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';

import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';

import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';

import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';

import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';

import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChangeDeliveryAddress extends StatelessWidget {
  final ShipToInfo shipToInfo;
  final CustomerCodeInfo customerCodeInfo;
  const ChangeDeliveryAddress({
    required this.shipToInfo,
    required this.customerCodeInfo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              SvgImage.alert,
              alignment: Alignment.center,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            context.tr('Change delivery address?'),
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: ZPColors.primary,
                ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            context.tr('Any existing items in your cart will be cleared.'),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: ZPColors.extraLightGrey4,
                ),
          ),
          const SizedBox(
            height: 35,
          ),
          _ConfirmChangeDeliveryAddressSection(
            shipToInfo: shipToInfo,
            customerCodeInfo: customerCodeInfo,
          ),
        ],
      ),
    );
  }
}

class _ConfirmChangeDeliveryAddressSection extends StatelessWidget {
  final ShipToInfo shipToInfo;
  final CustomerCodeInfo customerCodeInfo;
  const _ConfirmChangeDeliveryAddressSection({
    required this.shipToInfo,
    required this.customerCodeInfo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              key: WidgetKeys.cancelButton,
              onPressed: () async {
                await context.router.pop();
              },
              child: Text(
                'Cancel'.tr(),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: ElevatedButton(
              key: WidgetKeys.confirmButton,
              onPressed: () {
                context.router
                    .popUntilRouteWithName(HomeNavigationTabbarRoute.name);

                trackMixpanelEvent(
                  MixpanelEvents.shipToAddressSave,
                  props: {
                    MixpanelProps.shipToAddress: shipToInfo.shipToCustomerCode,
                  },
                );
                context.read<CustomerCodeBloc>().add(
                      CustomerCodeEvent.selected(
                        shipToInfo: shipToInfo,
                        customerCodeInfo: customerCodeInfo,
                      ),
                    );
                context.read<CartBloc>().add(
                      const CartEvent.clearCart(),
                    );
                trackMixpanelEvent(
                  MixpanelEvents.customerCodeSave,
                  props: {
                    MixpanelProps.customerCode:
                        customerCodeInfo.customerCodeSoldTo,
                  },
                );
              },
              child: Text(
                context.tr('Change address'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

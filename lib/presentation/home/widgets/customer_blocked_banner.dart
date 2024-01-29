import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/presentation/core/color_container.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerBlockedBanner extends StatelessWidget {
  const CustomerBlockedBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EligibilityBloc, EligibilityState>(
      buildWhen: (previous, current) =>
          previous.shipToInfo.customerBlock != current.shipToInfo.customerBlock,
      builder: (context, state) {
        return state.shipToInfo.customerBlock.isCustomerBlocked
            ? ColorContainer(
                key: WidgetKeys.customerBlockedBanner,
                color: ZPColors.customerBlockedBannerColor,
                margin: const EdgeInsets.all(0),
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 18,
                ),
                circularRadius: 0,
                children: [
                  Text(
                    context.tr('Your account is blocked.'),
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    context.tr(
                      'To continue using eZRx+, please contact your system administrator.',
                    ),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              )
            : const SizedBox.shrink();
      },
    );
  }
}

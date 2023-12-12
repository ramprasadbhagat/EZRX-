import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/presentation/core/scale_button.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/utils/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';

class NewPaymentButton extends StatelessWidget {
  final ScrollController? scrollController;

  factory NewPaymentButton.scale({required ScrollController controller}) =>
      NewPaymentButton._(controller);

  factory NewPaymentButton.elevated() => const NewPaymentButton._(null);

  const NewPaymentButton._(this.scrollController, {Key? key}) : super(key: key);

  final title = 'New Payment';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewPaymentBloc, NewPaymentState>(
      buildWhen: (previous, current) =>
          previous.isFetchingPrincipalCutoffs !=
          current.isFetchingPrincipalCutoffs,
      builder: (context, state) => scrollController == null
          ? ElevatedButton(
              key: WidgetKeys.newPaymentButton,
              onPressed: state.isFetchingPrincipalCutoffs
                  ? null
                  : () => _toNewPayment(context),
              child: Text(context.tr(title)),
            )
          : ScaleButton(
              key: WidgetKeys.newPaymentButton,
              icon: Icons.add,
              label: title,
              onPress: state.isFetchingPrincipalCutoffs
                  ? null
                  : () => _toNewPayment(context),
              scrollController: scrollController!,
            ),
    );
  }

  void _toNewPayment(BuildContext context) {
    trackMixpanelEvent(
      MixpanelEvents.newPaymentClicked,
      props: {
        MixpanelProps.clickAt:
            RouterUtils.buildRouteTrackingName(context.routeData.path),
      },
    );

    context.read<NewPaymentBloc>()
      ..add(
        NewPaymentEvent.initialized(
          user: context.read<EligibilityBloc>().state.user,
          customerCodeInfo:
              context.read<EligibilityBloc>().state.customerCodeInfo,
          salesOrganisation:
              context.read<EligibilityBloc>().state.salesOrganisation,
          shipToInfo: context.read<EligibilityBloc>().state.shipToInfo,
        ),
      )
      ..add(const NewPaymentEvent.getPrincipalCutoffs());
  }
}

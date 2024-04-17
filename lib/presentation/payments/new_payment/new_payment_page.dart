import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/available_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/outstanding_invoices/outstanding_invoices_bloc.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/info_label.dart';
import 'package:ezrxmobile/presentation/core/confirm_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/extension.dart';
import 'package:ezrxmobile/presentation/payments/widgets/payment_module.dart';
import 'package:ezrxmobile/presentation/payments/widgets/price_text.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'package:ezrxmobile/presentation/payments/new_payment/widgets/warning_label_virtual_bank.dart';

part 'package:ezrxmobile/presentation/payments/new_payment/widgets/total_section.dart';

part 'package:ezrxmobile/presentation/payments/new_payment/widgets/new_payment_body.dart';

part 'package:ezrxmobile/presentation/payments/new_payment/widgets/new_payment_footer.dart';

part 'package:ezrxmobile/presentation/payments/new_payment/widgets/select_all_section.dart';

class NewPaymentPage extends StatelessWidget {
  final bool isMarketPlace;
  const NewPaymentPage({
    Key? key,
    required this.isMarketPlace,
  }) : super(key: key);

  List<PageRouteInfo<void>> _getTabs({
    bool isID = false,
  }) {
    return [
      const OutstandingInvoicesTabRoute(),
      if (!isID) const AvailableCreditsTabRoute(),
      const PaymentMethodTabRoute(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final isID = context.read<EligibilityBloc>().state.salesOrg.isID;

    final tabs = _getTabs(isID: isID);

    return PaymentModule(
      isMarketPlace: isMarketPlace,
      child: AutoTabsRouter.tabBar(
        routes: tabs,
        physics: const NeverScrollableScrollPhysics(),
        builder: (context, child, tabController) {
          final step = tabController.index + 1;

          return Scaffold(
            key: WidgetKeys.newPaymentPage,
            appBar: CustomAppBar.commonAppBar(
              title: Text(
                context.tr('New payment'),
              ),
              customerBlockedOrSuspended: context
                  .read<EligibilityBloc>()
                  .state
                  .customerBlockOrSuspended,
              leadingWidget: _PreviousButton(
                tabController: tabController,
                step: step,
              ),
            ),
            body: AnnouncementBanner(
              currentPath: context.router.currentPath,
              child: Column(
                children: [
                  _NewPaymentBody(
                    currentStep: step,
                    totalTabs: tabs.length,
                    child: child,
                  ),
                  _NewPaymentFooter(
                    currentStep: step,
                    tabController: tabController,
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

class _PreviousButton extends StatelessWidget {
  final TabController tabController;
  final int step;

  const _PreviousButton({
    Key? key,
    required this.tabController,
    required this.step,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return step == 1
        ? IconButton(
            key: WidgetKeys.closeButton,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close),
          )
        : IconButton(
            key: WidgetKeys.backButton,
            onPressed: () {
              tabController.animateTo(
                tabController.index - 1,
              );
            },
            icon: const Icon(Icons.chevron_left),
          );
  }
}

class _NextButtonID extends StatelessWidget {
  final VoidCallback onTab;

  const _NextButtonID({
    Key? key,
    required this.onTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewPaymentBloc, NewPaymentState>(
      buildWhen: (previous, current) =>
          previous.isCreatingVirtualAccount !=
              current.isCreatingVirtualAccount ||
          previous.selectedPaymentMethod.options !=
              current.selectedPaymentMethod.options,
      builder: (context, state) {
        return LoadingShimmer.withChild(
          enabled: state.isCreatingVirtualAccount,
          child: ElevatedButton(
            key: WidgetKeys.nextButtonID,
            onPressed: state.enableCreateVirtualAccount ? onTab : null,
            child: Text(
              context.tr('Next'),
              style: const TextStyle(
                color: ZPColors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _NextButton extends StatelessWidget {
  final TabController tabController;
  final bool enabled;

  const _NextButton({
    Key? key,
    required this.tabController,
    required this.enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: WidgetKeys.nextButton,
      onPressed: enabled
          ? () {
              final step = tabController.index + 1;
              _trackProceedToNextStep(context, step);
              tabController.animateTo(step);
            }
          : null,
      child: Text(
        context.tr('Next'),
        style: const TextStyle(
          color: ZPColors.white,
        ),
      ),
    );
  }
}

void _trackProceedToNextStep(BuildContext context, int step) =>
    trackMixpanelEvent(
      TrackingEvents.paymentStep,
      props: {
        TrackingProps.step: step,
        TrackingProps.stepName: _stepTitle(context, step),
      },
    );

String _stepTitle(BuildContext context, int step) {
  final salesOrg = context.read<EligibilityBloc>().state.salesOrg;
  final stepTitles = <String>[
    'Select invoice(s) for payment',
    if (!salesOrg.isID) 'Select credit (Optional)',
    'Select payment method',
  ];

  return context.tr(stepTitles[step - 1]);
}

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
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/info_label.dart';
import 'package:ezrxmobile/presentation/core/confirm_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/widgets/price_text.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewPaymentPage extends StatelessWidget {
  const NewPaymentPage({Key? key}) : super(key: key);
  final _tabs = const [
    OutstandingInvoicesTabRoute(),
    AvailableCreditsTabRoute(),
    PaymentMethodTabRoute(),
  ];

  static const paymentErrorMessage =
      'At least one of the selected invoices/credit notes have already been used to create another Payment Advice. Please check your payment summary or select other invoices/credit notes for this payment.';

  Future<bool?> _showConfirmBottomSheet(BuildContext context) {
    return showModalBottomSheet<bool>(
      context: context,
      enableDrag: false,
      builder: (_) => ConfirmBottomSheet(
        key: WidgetKeys.confirmBottomSheet,
        title: 'Error creating payment advice',
        content: paymentErrorMessage,
        confirmButtonText: 'Payment summary',
        iconWidget: SvgPicture.asset(
          SvgImage.alert,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      routes: _tabs,
      physics: const NeverScrollableScrollPhysics(),
      builder: (context, child, tabController) {
        final step = tabController.index + 1;
        final title = context.tr(_stepTitle(step));

        return Scaffold(
          key: WidgetKeys.newPaymentPage,
          appBar: AppBar(
            centerTitle: false,
            title: Text(context.tr('New payment')),
            leading: _PreviousButton(
              tabController: tabController,
              step: step,
            ),
          ),
          body: AnnouncementBanner(
            currentPath: context.router.currentPath,
            child: BlocConsumer<NewPaymentBloc, NewPaymentState>(
              listenWhen: (previous, current) =>
                  previous.isLoading != current.isLoading,
              listener: (context, state) {
                if (!state.isLoading) {
                  state.failureOrSuccessOption.fold(
                    () {
                      context.read<NewPaymentBloc>().add(
                            const NewPaymentEvent.fetchInvoiceInfoPdf(),
                          );
                      context.router.pushAndPopUntil(
                        const PaymentAdviceCreatedPageRoute(),
                        predicate: (Route route) =>
                            route.settings.name == PaymentPageRoute.name,
                      );
                    },
                    (either) => either.fold(
                      (failure) async {
                        trackMixpanelEvent(
                          MixpanelEvents.paymentFailure,
                          props: {
                            MixpanelProps.errorMessage: paymentErrorMessage,
                            MixpanelProps.paymentMethod: state
                                .selectedPaymentMethod
                                .getOrDefaultValue(''),
                            MixpanelProps.paymentDocumentCount:
                                state.allSelectedItems.length,
                          },
                        );
                        final confirmed =
                            await _showConfirmBottomSheet(context);
                        if ((confirmed ?? false) && context.mounted) {
                          unawaited(
                            context.router.pushAndPopUntil(
                              const PaymentSummaryPageRoute(),
                              predicate: (Route route) =>
                                  route.settings.name == PaymentPageRoute.name,
                            ),
                          );
                        }
                      },
                      (_) {},
                    ),
                  );
                }
              },
              buildWhen: (previous, current) =>
                  previous.selectedInvoices != current.selectedInvoices ||
                  previous.selectedCredits != current.selectedCredits ||
                  previous.isLoading != current.isLoading,
              builder: (context, state) {
                final configs =
                    context.read<EligibilityBloc>().state.salesOrgConfigs;

                return Column(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 8.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8.0,
                                  ),
                                  child: Text(
                                    'Step $step of ${_tabs.length}: $title',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          color: ZPColors.primary,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                                LinearProgressIndicator(
                                  value: step / _tabs.length,
                                  backgroundColor: ZPColors.accentColor,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: child,
                          ),
                        ],
                      ),
                    ),
                    SafeArea(
                      top: false,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: ZPColors.lightGray2,
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            if (step == 1)
                              _CheckAllInvoicesWidget(
                                selectedInvoices: state.selectedInvoices,
                              ),
                            if (step == 2)
                              _CheckAllCreditsWidget(
                                selectedCredits: state.selectedCredits,
                              ),
                            Row(
                              children: [
                                PriceText(
                                  data: StringUtils.displayNumber(
                                    state.selectedInvoices.amountTotal,
                                  ),
                                  title: 'Amount payable',
                                  salesOrgConfig: configs,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ),
                                  child: Text(
                                    '-',
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                  ),
                                ),
                                PriceText(
                                  data: '(${StringUtils.displayNumber(
                                    state.selectedCredits.amountTotal.abs(),
                                  )})',
                                  title: 'Credit applied',
                                  salesOrgConfig: configs,
                                  isNegativeColorDisplay:
                                      state.negativeAmountPayable,
                                ),
                              ],
                            ),
                            if (state.negativeAmountPayable)
                              const InfoLabel(
                                textValue:
                                    'Total credit amount cannot exceed invoice amount.',
                              ),
                            Row(
                              children: [
                                Text(
                                  context.tr('Total: '),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        color: ZPColors.darkGray,
                                      ),
                                ),
                                PriceComponent(
                                  salesOrgConfig: context
                                      .read<SalesOrgBloc>()
                                      .state
                                      .configs,
                                  price: state.amountTotal.abs().toString(),
                                  type: state.negativeAmountPayable
                                      ? PriceStyle.negativePrice
                                      : PriceStyle.commonPrice,
                                ),
                                const Spacer(),
                                if (step == 1)
                                  _NextButton(
                                    tabController: tabController,
                                    enabled: state.selectedInvoices.isNotEmpty,
                                  ),
                                if (step == 2)
                                  _NextButton(
                                    tabController: tabController,
                                    enabled: !state.negativeAmountPayable,
                                  ),
                              ],
                            ),
                            if (step == 3)
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: ElevatedButton(
                                  key: WidgetKeys.generatePaymentAdvice,
                                  onPressed: state.isLoading
                                      ? null
                                      : () {
                                          _trackProceedToNextStep(step);
                                          context.read<NewPaymentBloc>().add(
                                                const NewPaymentEvent.pay(),
                                              );
                                        },
                                  child: LoadingShimmer.withChild(
                                    enabled: state.isLoading,
                                    child: Text(
                                      context.tr('Generate payment advice'),
                                      style: const TextStyle(
                                        color: ZPColors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            const SizedBox(
                              height: 8,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
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
              _trackProceedToNextStep(step);
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

class _CheckAllCreditsWidget extends StatelessWidget {
  final List<CustomerOpenItem> selectedCredits;

  const _CheckAllCreditsWidget({
    Key? key,
    required this.selectedCredits,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AvailableCreditsBloc, AvailableCreditsState>(
      buildWhen: (previous, current) => previous.items != current.items,
      builder: (context, state) {
        return _CheckAllWidget(
          value: selectedCredits.isNotEmpty &&
              state.items.isEqual(selectedCredits),
          onChanged: (value) => context.read<NewPaymentBloc>().add(
                NewPaymentEvent.updateAllCredits(
                  items: (value ?? false) ? state.items : <CustomerOpenItem>[],
                ),
              ),
        );
      },
    );
  }
}

class _CheckAllInvoicesWidget extends StatelessWidget {
  final List<CustomerOpenItem> selectedInvoices;

  const _CheckAllInvoicesWidget({
    Key? key,
    required this.selectedInvoices,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OutstandingInvoicesBloc, OutstandingInvoicesState>(
      buildWhen: (previous, current) => previous.items != current.items,
      builder: (context, state) {
        return _CheckAllWidget(
          value: selectedInvoices.isNotEmpty &&
              state.items.isEqual(selectedInvoices),
          onChanged: (value) => context.read<NewPaymentBloc>().add(
                NewPaymentEvent.updateAllInvoices(
                  items: (value ?? false) ? state.items : <CustomerOpenItem>[],
                ),
              ),
        );
      },
    );
  }
}

class _CheckAllWidget extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const _CheckAllWidget({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(
          key: WidgetKeys.checkAllWidget,
          contentPadding: EdgeInsets.zero,
          title: Text(
            context.tr('All'),
            style: Theme.of(context).textTheme.titleSmall,
          ),
          controlAffinity: ListTileControlAffinity.leading,
          dense: true,
          visualDensity: VisualDensity.compact,
          onChanged: onChanged,
          value: value,
        ),
        const Divider(
          indent: 0,
          endIndent: 0,
          color: ZPColors.lightGray2,
        ),
      ],
    );
  }
}

void _trackProceedToNextStep(int step) => trackMixpanelEvent(
      MixpanelEvents.paymentStep,
      props: {
        MixpanelProps.step: step,
        MixpanelProps.stepName: _stepTitle(step),
      },
    );

String _stepTitle(int step) {
  switch (step) {
    case 1:
      return 'Select invoice(s) for payment';
    case 2:
      return 'Select credit (Optional)';
    default:
      return 'Select payment method';
  }
}

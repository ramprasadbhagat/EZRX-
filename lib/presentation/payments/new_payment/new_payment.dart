import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/available_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/outstanding_invoices/outstanding_invoices_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewPaymentPage extends StatelessWidget {
  const NewPaymentPage({Key? key}) : super(key: key);
  final _tabs = const [
    OutstandingInvoicesTabRoute(),
    AvailableCreditsTabRoute(),
    PaymentMethodTabRoute(),
  ];

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      routes: _tabs,
      physics: const NeverScrollableScrollPhysics(),
      builder: (context, child, tabController) {
        final step = tabController.index + 1;
        var title = '';
        switch (step) {
          case 1:
            title = 'Select invoice(s) for payment'.tr();
            break;
          case 2:
            title = 'Select credit (Optional)'.tr();
            break;
          default:
            title = 'Select payment method'.tr();
        }

        return Scaffold(
          key: WidgetKeys.newPaymentPage,
          appBar: AppBar(
            centerTitle: false,
            title: const Text('New payment').tr(),
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
                    () async => state
                            .salesOrganisation.salesOrg.isPaymentNeedOpenWebView
                        ? await context.router
                            .pushNamed('payments/payments_webview')
                            .then((uri) {
                            /// * Document: https://zuelligpharma.atlassian.net/wiki/spaces/EZRX/pages/293306636/MB+-+UPDATE+PAYMENT+GATEWAY+LOGIC
                            /// If payment is successful (Received redirect url with
                            /// path payment/thank-you): Update payment gateway,
                            /// back to the payment overview page and navigate to
                            /// the payment advice created page
                            if (uri != null) {
                              context.read<NewPaymentBloc>().add(
                                    NewPaymentEvent.updatePaymentGateway(
                                      paymentUrl: uri as Uri,
                                    ),
                                  );
                              context.router.pushAndPopUntil(
                                const PaymentAdviceCreatedPageRoute(),
                                predicate: (Route route) =>
                                    route.settings.name ==
                                    PaymentPageRoute.name,
                              );
                            } else {
                              /// If payment is fails (No received redirect url with
                              /// path payment/thank-you):
                              /// * If on TH market: Back to the payment overview
                              /// page and navigate to the payment advice created page
                              /// * If on other market: Back to the payment overview page
                              context.read<SalesOrgBloc>().state.salesOrg.isTH
                                  ? context.router.pushAndPopUntil(
                                      const PaymentAdviceCreatedPageRoute(),
                                      predicate: (Route route) =>
                                          route.settings.name ==
                                          PaymentPageRoute.name,
                                    )
                                  : context.router
                                      .popUntilRouteWithPath('payments');
                            }
                          })
                        : await context.router.pushAndPopUntil(
                            const PaymentAdviceCreatedPageRoute(),
                            predicate: (Route route) =>
                                route.settings.name == PaymentPageRoute.name,
                          ),
                    (either) => either.fold(
                      (failure) {
                        ErrorUtils.handleApiFailure(context, failure);
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
                final configs = context.read<SalesOrgBloc>().state.configs;

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
                                _PriceText(
                                  data: StringUtils.displayNumber(
                                    state.selectedInvoices.amountTotal,
                                  ),
                                  title: 'Amount payable'.tr(),
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
                                _PriceText(
                                  data: '(${StringUtils.displayNumber(
                                    state.selectedCredits.amountTotal,
                                  )})',
                                  title: 'Credit applied'.tr(),
                                  salesOrgConfig: configs,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Total: '.tr(),
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
                                  price: state.amountTotal.toString(),
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
                                    enabled: true,
                                  ),
                                if (step == 3)
                                  ElevatedButton(
                                    key: WidgetKeys.payButton,
                                    onPressed: state.isLoading
                                        ? null
                                        : () =>
                                            context.read<NewPaymentBloc>().add(
                                                  const NewPaymentEvent.pay(),
                                                ),
                                    child: LoadingShimmer.withChild(
                                      enabled: state.isLoading,
                                      child: Text(
                                        'Pay now'.tr(),
                                        style: const TextStyle(
                                          color: ZPColors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
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
              tabController.animateTo(
                tabController.index + 1,
              );
            }
          : null,
      child: Text(
        'Next'.tr(),
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
          contentPadding: EdgeInsets.zero,
          title: Text(
            'All'.tr(),
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

class _PriceText extends StatelessWidget {
  final String data;
  final String title;
  final SalesOrganisationConfigs salesOrgConfig;

  const _PriceText({
    Key? key,
    required this.data,
    required this.title,
    required this.salesOrgConfig,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              data,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: ZPColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              '$title (${salesOrgConfig.currency.code})',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: ZPColors.darkGray,
                    fontSize: 11,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

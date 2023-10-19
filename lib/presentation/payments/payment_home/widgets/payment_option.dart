part of '../payment_page.dart';

class _PaymentOptionMenu extends StatelessWidget {
  const _PaymentOptionMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      key: WidgetKeys.paymentHomeOptionMenu,
      alignment: Responsive.isMobile(context)
          ? WrapAlignment.spaceBetween
          : WrapAlignment.start,
      runSpacing: MediaQuery.of(context).size.height * 0.02,
      spacing: Responsive.isMobile(context) ? 0 : 10,
      children: _getPaymentOptionItems(context)
          .map(
            (paymentOptionData) => _PaymentOption(
              paymentOptionData: paymentOptionData,
            ),
          )
          .toList(),
    );
  }
}

class _PaymentOption extends StatelessWidget {
  final _PaymentOptionData paymentOptionData;
  const _PaymentOption({
    Key? key,
    required this.paymentOptionData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Responsive.isMobile(context)
          ? context.read<EligibilityBloc>().state.salesOrg.isPaymentClaimEnabled
              ? MediaQuery.of(context).size.width * 0.45
              : MediaQuery.of(context).size.width * 0.28
          : MediaQuery.of(context).size.width * 0.22,
      child: GestureDetector(
        key: paymentOptionData.key,
        onTap: () {
          trackMixpanelEvent(
            MixpanelEvents.paymentQuickAccessClicked,
            props: {
              MixpanelProps.quickAccess: paymentOptionData.label,
            },
          );
          paymentOptionData.onTap.call();
        },
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            CustomCard(
              margin: const EdgeInsets.all(0),
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
              ),
              child: Container(
                alignment: Alignment.bottomCenter,
                height: 35,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: Text(
                  context.tr(paymentOptionData.label),
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: ZPColors.darkTeal,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              height: 90,
              child: SvgPicture.asset(
                'assets/svg/${paymentOptionData.icon}',
                height: kToolbarHeight * 0.75,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PaymentOptionData {
  final Key key;
  final String icon;
  final String label;
  final VoidCallback onTap;
  const _PaymentOptionData({
    required this.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });
}

List<_PaymentOptionData> _getPaymentOptionItems(BuildContext context) {
  final accountSummary = _PaymentOptionData(
    key: WidgetKeys.accountSummaryMenu,
    icon: 'account_summary.svg',
    label: 'Account Summary',
    onTap: () => context.router.pushNamed('payments/invoice_credit'),
  );

  final paymentSummary = _PaymentOptionData(
    key: WidgetKeys.paymentSummaryMenu,
    icon: 'payment_summary.svg',
    label: 'Payment Summary',
    onTap: () => context.router.pushNamed('payments/payment_summary'),
  );

  final accountStateMent = _PaymentOptionData(
    key: WidgetKeys.statementOfAccountsMenu,
    icon: 'statement_accounts.svg',
    label: 'Statement of accounts',
    onTap: () {
      context.read<SoaFilterBloc>().add(const SoaFilterEvent.initialized());
      context.router.pushNamed('payments/statement_accounts');
    },
  );

  final claim = _PaymentOptionData(
    key: WidgetKeys.claimsMenu,
    icon: 'claims.svg',
    label: 'Claims',
    onTap: () => {},
  );

  return [
    accountSummary,
    paymentSummary,
    accountStateMent,
    if (context.read<EligibilityBloc>().state.salesOrg.isPaymentClaimEnabled)
      claim,
  ];
}

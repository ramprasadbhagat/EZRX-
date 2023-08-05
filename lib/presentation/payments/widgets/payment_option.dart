import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/responsive.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentOptionMenu extends StatelessWidget {
  const PaymentOptionMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final paymentOptionData = _getPaymentOptionItems(context);

    final isClaimActive = paymentOptionData.any(
      (element) => element.label == 'Claims',
    );

    return Wrap(
      alignment: Responsive.isMobile(context)
          ? WrapAlignment.spaceBetween
          : WrapAlignment.start,
      runSpacing: MediaQuery.of(context).size.height * 0.02,
      spacing: Responsive.isMobile(context) ? 0 : 10,
      children: paymentOptionData
          .map(
            (paymentOptionData) => _PaymentOption(
              paymentOptionData: paymentOptionData,
              isClaimActive: isClaimActive,
            ),
          )
          .toList(),
    );
  }
}

class _PaymentOption extends StatelessWidget {
  final _PaymentOptionData paymentOptionData;
  final bool isClaimActive;
  const _PaymentOption({
    Key? key,
    required this.paymentOptionData,
    required this.isClaimActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Responsive.isMobile(context)
          ? isClaimActive
              ? MediaQuery.of(context).size.width * 0.45
              : MediaQuery.of(context).size.width * 0.28
          : MediaQuery.of(context).size.width * 0.22,
      child: GestureDetector(
        key: paymentOptionData.key,
        onTap: paymentOptionData.onTap,
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
                  paymentOptionData.label,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: ZPColors.darkTeal,
                      ),
                  textAlign: TextAlign.center,
                ).tr(),
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
    onTap: () {},
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
    if (context.read<SalesOrgBloc>().state.salesOrg.isPaymentClaimEnabled)
      claim,
  ];
}

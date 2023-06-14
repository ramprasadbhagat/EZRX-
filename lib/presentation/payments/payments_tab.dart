import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/tab_view.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/payment_overview/account_summary.dart';
import 'package:ezrxmobile/presentation/payments/payment_overview/payments_summary.dart';
import 'package:ezrxmobile/presentation/payments/payment_overview/statement_summary.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';

class PaymentsTab extends StatelessWidget {
  const PaymentsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: WidgetKeys.paymentsTabPage,
      appBar: AppBar(
        title: const Text('Payments').tr(),
        automaticallyImplyLeading: false,
        centerTitle: false,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnnouncementWidget(currentPath: context.router.currentPath),
          Expanded(
            child: AutoTabsRouter.tabBar(
              routes: const [
                StatementSummaryPageRoute(),
                PaymentsSummaryPageRoute(),
                AccountSummaryPageRoute(),
              ],
              builder: (context, child, tabController) => TabViewPage(
                tabController: tabController,
                tabHeaderText: [
                  'Account'.tr(),
                  'Payment'.tr(),
                  'Statement'.tr(),
                ],
                tabWidgets: const [
                  AccountSummaryPage(),
                  PaymentsSummaryPage(),
                  StatementSummaryPage(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

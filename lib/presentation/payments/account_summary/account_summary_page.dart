import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/custom_search_bar.dart';
import 'package:ezrxmobile/domain/payments/entities/all_credits_filter.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/domain/payments/entities/all_invoices_filter.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/application/payments/all_credits/all_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/all_invoices/all_invoices_bloc.dart';
import 'package:ezrxmobile/presentation/payments/all_credits/filter_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/payments/all_invoices/filter_bottom_sheet.dart';
import 'package:ezrxmobile/application/payments/all_credits/filter/all_credits_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/all_invoices/filter/all_invoices_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/download_payment_attachments/download_payment_attachments_bloc.dart';

part 'package:ezrxmobile/presentation/payments/account_summary/widgets/export.dart';
part 'package:ezrxmobile/presentation/payments/account_summary/widgets/search_bar.dart';
part 'package:ezrxmobile/presentation/payments/account_summary/widgets/filter_tune_icon.dart';

class AccountSummary extends StatelessWidget {
  const AccountSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.tr('Account Summary'),
          style: Theme.of(context).textTheme.labelLarge,
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          AnnouncementWidget(
            currentPath: context.router.currentPath,
          ),
          const SizedBox(height: 20),
          Expanded(
            child: AutoTabsRouter.tabBar(
              routes: const [
                AllInvoicesPageRoute(),
                AllCreditsPageRoute(),
              ],
              builder: (context, child, tabController) => Column(
                children: [
                  TabBar(
                    controller: tabController,
                    tabs: [
                      Tab(
                        key: WidgetKeys.invoiceTab,
                        text: context.tr('Invoices'),
                      ),
                      Tab(
                        key: WidgetKeys.creditsTab,
                        text: context.tr('Credits'),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      20.0,
                      20.0,
                      20.0,
                      0.0,
                    ),
                    child: Row(
                      children: [
                        _SearchBar(
                          isInvoiceTabActive: context.tabsRouter.current.name ==
                              AllInvoicesPageRoute.name,
                        ),
                        _FilterTuneIcon(
                          isInvoiceTabActive: context.tabsRouter.current.name ==
                              AllInvoicesPageRoute.name,
                        ),
                        _Export(
                          isInvoiceTabActive: context.tabsRouter.current.name ==
                              AllInvoicesPageRoute.name,
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: child),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

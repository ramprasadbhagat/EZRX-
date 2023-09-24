import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/presentation/core/scale_button.dart';
import 'package:ezrxmobile/presentation/core/custom_search_bar.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/domain/payments/entities/available_credit_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/outstanding_invoice_filter.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/available_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/outstanding_invoices/outstanding_invoices_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/payments/download_payment_attachments/download_payment_attachments_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_item/payment_item_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary/payment_summary_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_group.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';

part 'package:ezrxmobile/presentation/payments/payment_summary/widgets/payment_summary_download_button.dart';
part 'package:ezrxmobile/presentation/payments/payment_summary/widgets/payment_summary_group_item.dart';
part 'package:ezrxmobile/presentation/payments/payment_summary/widgets/payment_summary_group_list.dart';

class PaymentSummaryPage extends StatefulWidget {
  const PaymentSummaryPage({Key? key}) : super(key: key);

  @override
  State<PaymentSummaryPage> createState() => _PaymentSummaryPageState();
}

class _PaymentSummaryPageState extends State<PaymentSummaryPage> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: WidgetKeys.paymentSummaryPage,
      appBar: AppBar(
        key: WidgetKeys.paymentSummaryAppBar,
        title: Text(
          context.tr('Payment Summary'),
          style: Theme.of(context).textTheme.labelLarge,
        ),
        centerTitle: false,
        actions: const [_PaymentSummaryDownloadButton()],
      ),
      floatingActionButton: ScaleButton(
        icon: Icons.add,
        label: 'New payment',
        onPress: () => _toNewPayment(context),
        scrollController: _scrollController,
      ),
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
              child: Row(
                children: [
                  Expanded(
                    child: CustomSearchBar(
                      enabled: true,
                      onSearchChanged: (String value) {},
                      onClear: () {},
                      hintText: 'Search by payment advice / voucher no.',
                      customValidator: (text) => true,
                      onSearchSubmitted: (text) {},
                      initialValue: '',
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.tune),
                  ),
                ],
              ),
            ),
            Expanded(
              child: _PaymentSummaryGroupList(
                scrollController: _scrollController,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _toNewPayment(BuildContext context) {
    context.read<OutstandingInvoicesBloc>().add(
          OutstandingInvoicesEvent.fetch(
            salesOrganisation:
                context.read<SalesOrgBloc>().state.salesOrganisation,
            customerCodeInfo:
                context.read<CustomerCodeBloc>().state.customerCodeInfo,
            appliedFilter: OutstandingInvoiceFilter.empty(),
            searchKey: SearchKey.search(''),
          ),
        );
    context.read<AvailableCreditsBloc>().add(
          AvailableCreditsEvent.fetch(
            salesOrganisation:
                context.read<SalesOrgBloc>().state.salesOrganisation,
            customerCodeInfo:
                context.read<CustomerCodeBloc>().state.customerCodeInfo,
            appliedFilter: AvailableCreditFilter.empty(),
            searchKey: SearchKey.search(''),
          ),
        );
    context.read<NewPaymentBloc>().add(
          NewPaymentEvent.initialized(
            user: context.read<UserBloc>().state.user,
            customerCodeInfo:
                context.read<CustomerCodeBloc>().state.customerCodeInfo,
            salesOrganisation:
                context.read<SalesOrgBloc>().state.salesOrganisation,
          ),
        );
    context.router.pushNamed('payments/new_payment');
  }
}

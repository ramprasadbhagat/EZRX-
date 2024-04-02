import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/payments/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/payments/account_summary/account_summary_bloc.dart';
import 'package:ezrxmobile/application/payments/download_payment_attachments/download_payment_attachments_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/available_credits_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/available_credits/filter/available_credit_filter_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/outstanding_invoices/outstanding_invoices_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_in_progress/payment_in_progress_bloc.dart';
import 'package:ezrxmobile/application/payments/soa/soa_bloc.dart';
import 'package:ezrxmobile/application/payments/soa/soa_filter/soa_filter_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/available_credit_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/outstanding_invoice_filter.dart';
import 'package:ezrxmobile/domain/payments/entities/soa.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/banner_storage.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/confirm_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/responsive.dart';
import 'package:ezrxmobile/presentation/core/section_tile.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/widgets/new_payment_button.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/widgets/announcement_bottomsheet.dart';

part 'widgets/account_statement.dart';
part 'widgets/payment_option.dart';
part 'widgets/payment_summary.dart';
part 'widgets/payment_total_credit.dart';
part 'widgets/payment_total_invoice.dart';
part 'widgets/payment_item_card.dart';

class PaymentPage extends StatelessWidget {
  final bool isMarketPlace;

  const PaymentPage({
    Key? key,
    required this.isMarketPlace,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // This code will run after the build is finished
      // You can perform any tasks here that require the build to be complete
      if (context.read<AnnouncementBloc>().state.canShowSheetPayment) {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          enableDrag: false,
          isDismissible: false,
          builder: (_) => AnnouncementBottomSheet(
            maintenanceItem:
                context.read<AnnouncementBloc>().state.maintenanceItem,
            storageType: StorageType.payment,
          ),
        );
      }
    });

    final salesOrgConfig =
        context.read<EligibilityBloc>().state.salesOrgConfigs;

    return Scaffold(
      key: WidgetKeys.paymentsTabPage,
      appBar: CustomAppBar.commonAppBar(
        key: WidgetKeys.paymentHomeAppBar,
        title: Text(
          context.tr(isMarketPlace ? 'MP Payments' : 'Payments'),
        ),
        customerBlockedOrSuspended:
            context.read<EligibilityBloc>().state.customerBlockOrSuspended,
      ),
      bottomNavigationBar: const _NewPaymentButton(),
      body: RefreshIndicator(
        onRefresh: () async => _refreshPayment(context),
        child: ListView(
          key: WidgetKeys.scrollList,
          padding: const EdgeInsets.all(16.0),
          children: [
            AnnouncementWidget(currentPath: context.router.currentPath),
            _PaymentOptionMenu(isMarketPlace: isMarketPlace),
            const SizedBox(height: 20),
            _PaymentTotalInvoice(isMarketPlace: isMarketPlace),
            if (!salesOrgConfig.hideCredit) ...[
              const SizedBox(height: 20),
              _PaymentTotalCredit(isMarketPlace: isMarketPlace),
            ],
            const SizedBox(height: 20),
            _PaymentSummary(isMarketPlace: isMarketPlace),
            if (salesOrgConfig.statementOfAccountEnabled) ...[
              const SizedBox(height: 20),
              _AccountStatement(isMarketPlace: isMarketPlace),
            ],
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _refreshPayment(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    context.paymentInProgressBloc(isMarketPlace).add(
          PaymentInProgressEvent.fetch(
            salesOrganization: eligibilityState.salesOrganisation,
            customerCodeInfo: eligibilityState.customerCodeInfo,
          ),
        );
    context.accountSummaryBloc(isMarketPlace).add(
          AccountSummaryEvent.fetchInvoiceSummary(
            custCode: eligibilityState.customerCodeInfo.customerCodeSoldTo,
            salesOrg: eligibilityState.salesOrganisation.salesOrg,
          ),
        );

    context.accountSummaryBloc(isMarketPlace).add(
          AccountSummaryEvent.fetchCreditSummary(
            custCode: eligibilityState.customerCodeInfo.customerCodeSoldTo,
            salesOrg: eligibilityState.salesOrganisation.salesOrg,
          ),
        );
    context.soaBloc(isMarketPlace).add(
          SoaEvent.fetch(
            customerCodeInfo: eligibilityState.customerCodeInfo,
            salesOrg: eligibilityState.salesOrg,
          ),
        );
  }
}

class _NewPaymentButton extends StatelessWidget {
  const _NewPaymentButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<NewPaymentBloc, NewPaymentState>(
      listenWhen: (previous, current) =>
          previous.isFetchingPrincipalCutoffs !=
              current.isFetchingPrincipalCutoffs &&
          !current.isFetchingPrincipalCutoffs,
      listener: (context, state) {
        state.failureOrSuccessOption.fold(
          () {},
          (option) => option.fold(
            (failure) {
              ErrorUtils.handleApiFailure(context, failure);
            },
            (_) {},
          ),
        );

        if (!state.salesOrganisation.salesOrg.isID ||
            state.principalCutoffs.canMakePayment) {
          context.read<OutstandingInvoicesBloc>().add(
                OutstandingInvoicesEvent.fetch(
                  appliedFilter: OutstandingInvoiceFilter.defaultFilter(),
                  searchKey: SearchKey.search(''),
                ),
              );
          context.read<AvailableCreditsBloc>().add(
                AvailableCreditsEvent.fetch(
                  appliedFilter: AvailableCreditFilter.defaultFilter(),
                  searchKey: SearchKey.searchFilter(''),
                ),
              );
          context.read<AvailableCreditFilterBloc>().add(
                const AvailableCreditFilterEvent.initialize(),
              );
          context.router.push(const NewPaymentPageRoute());
        } else {
          _showConfirmBottomSheet(context);
        }
      },
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              spreadRadius: 2,
              color: ZPColors.boxShadowGray,
            ),
          ],
          color: ZPColors.white,
        ),
        padding:
            const EdgeInsets.only(right: 16, left: 16, top: 16, bottom: 30),
        child: SafeArea(
          child: NewPaymentButton.elevated(),
        ),
      ),
    );
  }

  Future<bool?> _showConfirmBottomSheet(BuildContext context) {
    return showModalBottomSheet<bool>(
      context: context,
      enableDrag: false,
      builder: (_) => ConfirmBottomSheet(
        key: WidgetKeys.confirmBottomSheet,
        title: 'We are closed for payment',
        content:
            "We are unable to proceed with the payment during the month's end. Please try again the following month. Thank you",
        confirmButtonText: 'Close',
        displayCancelButton: false,
      ),
    );
  }
}

import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary/payment_summary_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary_details/payment_summary_details_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_filter.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/presentation/core/bullet_widget.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/payment_advice_created/widgets/create_payment_invoice_pdf.dart';
import 'package:ezrxmobile/presentation/payments/payment_summary_details/payment_summary_details_screen.dart';
import 'package:ezrxmobile/presentation/payments/widgets/attention_section.dart';
import 'package:ezrxmobile/presentation/payments/widgets/bank_account_section.dart';
import 'package:ezrxmobile/presentation/payments/widgets/price_text.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/presentation/payments/widgets/transfer_methods_section.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

part 'package:ezrxmobile/presentation/payments/payment_advice_created/widgets/payment_invoice_pdf.dart';

part 'package:ezrxmobile/presentation/payments/payment_advice_created/widgets/payment_save_pdf_button.dart';

part 'package:ezrxmobile/presentation/payments/payment_advice_created/widgets/payment_advice_next_step.dart';

part 'package:ezrxmobile/presentation/payments/payment_advice_created/widgets/payments_advice_message.dart';

part 'package:ezrxmobile/presentation/payments/payment_advice_created/widgets/payment_summary_section.dart';

part 'package:ezrxmobile/presentation/payments/payment_advice_created/widgets/payment_advice_please_note.dart';

part 'package:ezrxmobile/presentation/payments/payment_advice_created/widgets/payment_advice_buttons.dart';

part 'package:ezrxmobile/presentation/payments/payment_advice_created/widgets/payment_advice_footer_section.dart';

part 'package:ezrxmobile/presentation/payments/payment_advice_created/widgets/payment_advice_body_section.dart';

part 'package:ezrxmobile/presentation/payments/payment_advice_created/widgets/payment_advice_body_apl_section.dart';

part 'package:ezrxmobile/presentation/payments/payment_advice_created/widgets/payment_cancel_advice_button.dart';

part 'package:ezrxmobile/presentation/payments/payment_advice_created/widgets/payment_va_failed.dart';

class PaymentAdviceCreatedPage extends StatelessWidget {
  const PaymentAdviceCreatedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewPaymentBloc, NewPaymentState>(
      listenWhen: (previous, current) =>
          previous.isFetchingInvoiceInfoPdf !=
              current.isFetchingInvoiceInfoPdf ||
          (previous.isCreatingVirtualAccount !=
                  current.isCreatingVirtualAccount &&
              !current.isCreatingVirtualAccount),
      listener: (context, state) {
        if (!state.isCreatingVirtualAccount) {
          state.failureOrSuccessOption.fold(
            () {
              context.read<PaymentSummaryDetailsBloc>().add(
                    PaymentSummaryDetailsEvent.fetchPaymentSummaryDetailsInfo(
                      details: PaymentSummaryDetails.fromCreateVirtualAccount(
                        state.createVirtualAccount,
                      ),
                    ),
                  );
              trackMixpanelEvent(
                MixpanelEvents.paymentSuccess,
                props: {
                  MixpanelProps.paymentAmount: state.amountTotal,
                  MixpanelProps.paymentMethod: state
                      .selectedPaymentMethod.paymentMethod
                      .getOrDefaultValue(''),
                  MixpanelProps.paymentDocumentCount:
                      state.allSelectedItems.length,
                  MixpanelProps.paymentAdviseId: state.createVirtualAccount.id,
                },
              );
            },
            (either) => either.fold(
              (failure) {
                trackMixpanelEvent(
                  MixpanelEvents.paymentFailure,
                  props: {
                    MixpanelProps.errorMessage:
                        'Creating Virtual Account for payment advise failure with error message: ${failure.failureMessage}',
                    MixpanelProps.paymentMethod: state
                        .selectedPaymentMethod.paymentMethod
                        .getOrDefaultValue(''),
                    MixpanelProps.paymentDocumentCount:
                        state.allSelectedItems.length,
                  },
                );
              },
              (_) {},
            ),
          );
        }

        if (!state.isFetchingInvoiceInfoPdf) {
          state.failureOrSuccessOption.fold(
            () {},
            (option) => option.fold(
              (failure) {
                trackMixpanelEvent(
                  MixpanelEvents.paymentFailure,
                  props: {
                    MixpanelProps.errorMessage:
                        'Generating payment advise failure with error message: ${failure.failureMessage}',
                    MixpanelProps.paymentMethod: state
                        .selectedPaymentMethod.paymentMethod
                        .getOrDefaultValue(''),
                    MixpanelProps.paymentDocumentCount:
                        state.allSelectedItems.length,
                  },
                );
                ErrorUtils.handleApiFailure(context, failure);
              },
              (r) {},
            ),
          );
        }
      },
      buildWhen: (previous, current) =>
          previous.isFetchingInvoiceInfoPdf !=
              current.isFetchingInvoiceInfoPdf ||
          previous.isCreatingVirtualAccount !=
              current.isCreatingVirtualAccount ||
          previous.createVirtualAccountFailed !=
              current.createVirtualAccountFailed,
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async {
            _onClosePressed(context);

            return false;
          },
          child: Scaffold(
            appBar: CustomAppBar.commonAppBar(
              automaticallyImplyLeading: false,
              leadingWidth: state.canDisplayCrossButton ? null : 5,
              title: Text(
                state.isFetchingInvoiceInfoPdf || state.isCreatingVirtualAccount
                    ? context.tr('Generating payment advice...')
                    : context.tr('Payment advice generated'),
              ),
              leadingWidget: state.canDisplayCrossButton
                  ? IconButton(
                      key: WidgetKeys.closeButton,
                      onPressed: () => _onClosePressed(context),
                      icon: const CircleAvatar(
                        maxRadius: 16,
                        backgroundColor: ZPColors.transparent,
                        child: Icon(
                          Icons.close,
                          color: ZPColors.neutralsBlack,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              customerBlocked: context
                  .read<EligibilityBloc>()
                  .state
                  .shipToInfo
                  .customerBlock,
            ),
            body:
                state.isFetchingInvoiceInfoPdf || state.isCreatingVirtualAccount
                    ? Center(
                        child: LoadingShimmer.logo(
                          key: WidgetKeys.paymentAdviceScreenLoader,
                        ),
                      )
                    : state.createVirtualAccountFailed
                        ? _PaymentVirtualAccountFailed()
                        : Column(
                            children: const [
                              Expanded(
                                child: _PaymentAdviceBodySection(),
                              ),
                              _PaymentAdviceFooterSection(),
                            ],
                          ),
          ),
        );
      },
    );
  }

  void _onClosePressed(BuildContext context) {
    context.read<PaymentSummaryBloc>().add(
          PaymentSummaryEvent.fetch(
            appliedFilter: PaymentSummaryFilter.empty(),
            searchKey: SearchKey.searchFilter(''),
          ),
        );
    Navigator.pop(context);
  }
}

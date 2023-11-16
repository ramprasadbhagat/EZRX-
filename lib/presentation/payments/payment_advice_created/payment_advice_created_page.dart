import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary_details/payment_summary_details_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/presentation/core/bullet_widget.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/payment_advice_created/widgets/create_payment_invoice_pdf.dart';
import 'package:ezrxmobile/presentation/payments/payment_summary_details/payment_summary_details_screen.dart';
import 'package:ezrxmobile/presentation/payments/widgets/price_text.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
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

class PaymentAdviceCreatedPage extends StatelessWidget {
  const PaymentAdviceCreatedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        backgroundColor: ZPColors.white,
        title: BlocBuilder<NewPaymentBloc, NewPaymentState>(
          buildWhen: (previous, current) =>
              previous.isFetchingInvoiceInfoPdf !=
              current.isFetchingInvoiceInfoPdf,
          builder: (context, state) {
            return Text(
              state.isFetchingInvoiceInfoPdf
                  ? context.tr('Generating payment advice...')
                  : context.tr('Payment advice generated'),
            );
          },
        ),
        leading: IconButton(
          key: WidgetKeys.closeButton,
          onPressed: () => Navigator.pop(context),
          icon: const CircleAvatar(
            maxRadius: 16,
            backgroundColor: ZPColors.transparent,
            child: Icon(
              Icons.close,
              color: ZPColors.neutralsBlack,
            ),
          ),
        ),
      ),
      body: const _BodyContent(),
    );
  }
}

class _BodyContent extends StatelessWidget {
  const _BodyContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewPaymentBloc, NewPaymentState>(
      listenWhen: (previous, current) =>
          previous.isFetchingInvoiceInfoPdf != current.isFetchingInvoiceInfoPdf,
      listener: (context, state) {
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
                    MixpanelProps.paymentMethod:
                        state.selectedPaymentMethod.getOrDefaultValue(''),
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
          previous.isFetchingInvoiceInfoPdf != current.isFetchingInvoiceInfoPdf,
      builder: (context, state) {
        return state.isFetchingInvoiceInfoPdf
            ? Center(child: LoadingShimmer.logo())
            : Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        state.selectedPaymentMethod.isBankIn
                            ? const _PaymentBankInAdviceMessage()
                            : const _PaymentGatewayAdviceMessage(),
                        state.needOpenWebViewAndNotBankIn
                            ? const _PaymentAdviceNextStep()
                            : const _PaymentAdvicePleaseNote(),
                        const _PaymentInvoicePdf(),
                        if (!state.selectedPaymentMethod.isBankIn)
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: PaymentSavePdfButton(),
                          ),
                      ],
                    ),
                  ),
                  state.needOpenWebViewAndNotBankIn
                      ? const _PaymentSummarySection()
                      : const _PaymentAdviceButtons(),
                ],
              );
      },
    );
  }
}

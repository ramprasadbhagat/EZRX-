import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/payments/new_payment/new_payment_bloc.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/core/bullet_widget.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/payment_advice_created/widgets/create_payment_invoice_pdf.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

part 'widgets/payment_invoice_pdf.dart';
part 'widgets/payment_save_pdf_button.dart';
part 'widgets/payment_success_please_note.dart';
part 'widgets/payments_success_message.dart';

class PaymentAdviceCreatedPage extends StatelessWidget {
  const PaymentAdviceCreatedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 16,
        automaticallyImplyLeading: false,
        backgroundColor: ZPColors.white,
        title: Text(context.tr('Payment advice created')),
        leading: IconButton(
          key: WidgetKeys.paymentAdviceCreatedPageBack,
          onPressed: () => Navigator.pop(context),
          icon: const CircleAvatar(
            maxRadius: 16,
            backgroundColor: ZPColors.transparent,
            child: Icon(
              Icons.chevron_left,
              color: ZPColors.neutralsBlack,
            ),
          ),
        ),
      ),
      body: const _BodyContent(),
      bottomNavigationBar: const PaymentSavePdfButton(),
    );
  }
}

class _BodyContent extends StatelessWidget {
  const _BodyContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          _PaymentSuccessMessage(),
          SizedBox(height: 8),
          _PaymentSuccessPleaseNote(),
          _PaymentInvoicePdf(),
        ],
      ),
    );
  }
}

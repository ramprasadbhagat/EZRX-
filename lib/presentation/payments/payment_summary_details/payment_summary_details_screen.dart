import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary/payment_summary_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary_details/payment_summary_details_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_invoice_info_pdf.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_item.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_filter.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/address_info_section.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
part 'package:ezrxmobile/presentation/payments/payment_summary_details/widgets/payment_advice_button.dart';
part 'package:ezrxmobile/presentation/payments/payment_summary_details/widgets/payment_summary_section.dart';
part 'package:ezrxmobile/presentation/payments/payment_summary_details/widgets/payment_details_section.dart';
part 'package:ezrxmobile/presentation/payments/payment_summary_details/widgets/payment_item_section.dart';
part 'package:ezrxmobile/presentation/payments/payment_summary_details/widgets/delete_advice_bottom_sheet.dart';

class PaymentSummaryDetailsPage extends StatelessWidget {
  const PaymentSummaryDetailsPage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocListener<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      listenWhen: (previous, current) =>
          previous.failureOrSuccessOption != current.failureOrSuccessOption ||
          previous.isDeletingPayment != current.isDeletingPayment,
      listener: (context, state) => state.failureOrSuccessOption.fold(
        () {
          if (!state.isDeletingPayment) {
            context.read<PaymentSummaryBloc>().add(
                  PaymentSummaryEvent.fetch(
                    appliedFilter: PaymentSummaryFilter.empty(),
                    searchKey: SearchKey.searchFilter(''),
                  ),
                );
            context.router.popForced();
            CustomSnackBar(
              messageText:
                  '${context.read<EligibilityBloc>().state.salesOrg.paymentIdPretext} #${state.paymentSummaryDetails.zzAdvice.displayDashIfEmpty} has been deleted',
            ).show(context);
          }
        },
        (either) => either.fold(
          (failure) {
            ErrorUtils.handleApiFailure(context, failure);
          },
          (_) {},
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Payment details'.tr(),
            style: Theme.of(context).textTheme.labelLarge,
          ),
          centerTitle: false,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_sharp),
            onPressed: () => context.router.pop(),
          ),
        ),
        bottomNavigationBar: const _PaymentAdviceButton(),
        body: AnnouncementBanner(
          currentPath: context.router.currentPath,
          child: ListView(
            children: const [
              _PaymentDetails(),
              _PaymentSummarySection(),
              _PaymentItemSection(),
            ],
          ),
        ),
      ),
    );
  }
}

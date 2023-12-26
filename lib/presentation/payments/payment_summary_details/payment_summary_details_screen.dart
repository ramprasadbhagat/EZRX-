import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary/payment_summary_bloc.dart';
import 'package:ezrxmobile/application/payments/payment_summary_details/payment_summary_details_bloc.dart';
import 'package:ezrxmobile/domain/core/value/constants.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_item.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_filter.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/address_info_section.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/payments/widgets/attention_section.dart';
import 'package:ezrxmobile/presentation/payments/widgets/bank_account_section.dart';
import 'package:ezrxmobile/presentation/payments/widgets/bank_info.dart';
import 'package:ezrxmobile/presentation/payments/widgets/detail_info_section.dart';
import 'package:ezrxmobile/presentation/payments/widgets/transfer_methods_section.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';

part 'package:ezrxmobile/presentation/payments/payment_summary_details/widgets/payment_advice_button.dart';
part 'package:ezrxmobile/presentation/payments/payment_summary_details/widgets/payment_summary_section.dart';
part 'package:ezrxmobile/presentation/payments/payment_summary_details/widgets/payment_details_section.dart';
part 'package:ezrxmobile/presentation/payments/payment_summary_details/widgets/payment_item_section.dart';
part 'package:ezrxmobile/presentation/payments/payment_summary_details/widgets/invoices_and_credits_total_section.dart';
part 'package:ezrxmobile/presentation/payments/payment_summary_details/widgets/price_widget.dart';
part 'package:ezrxmobile/presentation/payments/payment_summary_details/widgets/payment_basic_info_section.dart';
part 'package:ezrxmobile/presentation/payments/payment_summary_details/widgets/delete_cancel_advice_bottom_sheet.dart';
part 'package:ezrxmobile/presentation/payments/payment_summary_details/widgets/payment_transfer_via_section.dart';
part 'package:ezrxmobile/presentation/payments/payment_summary_details/widgets/qr_code_transfer_section.dart';

class PaymentSummaryDetailsPage extends StatelessWidget {
  const PaymentSummaryDetailsPage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocListener<PaymentSummaryDetailsBloc, PaymentSummaryDetailsState>(
      listenWhen: (previous, current) =>
          previous.isLoading != current.isLoading &&
          previous.failureOrSuccessOption != current.failureOrSuccessOption,
      listener: (context, state) => state.failureOrSuccessOption.fold(
        () {},
        (either) => either.fold(
          (failure) {
            ErrorUtils.handleApiFailure(context, failure);
          },
          (_) {},
        ),
      ),
      child: Scaffold(
        appBar: CustomAppBar.commonAppBar(
          title: Text(
            context.tr('Payment details'),
            style: Theme.of(context).textTheme.labelLarge,
          ),
          customerBlocked:
              context.read<EligibilityBloc>().state.shipToInfo.customerBlock,
          leadingWidget: IconButton(
            icon: const Icon(Icons.arrow_back_ios_sharp),
            onPressed: () => context.router.pop(),
          ),
        ),
        bottomNavigationBar: const _PaymentAdviceButton(),
        body: AnnouncementBanner(
          currentPath: context.router.currentPath,
          child: ListView(
            children: const [
              _PaymentDetailsSection(),
              _PaymentSummarySection(),
              _PaymentItemSection(),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

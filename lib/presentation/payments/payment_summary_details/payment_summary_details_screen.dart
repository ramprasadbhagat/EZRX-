import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/payments/payment_item/payment_item_bloc.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/payments/payment_summary_details/sections/payment_details_section.dart';
import 'package:ezrxmobile/presentation/payments/payment_summary_details/sections/payment_item_section.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';

class PaymentSummaryDetailsPage extends StatefulWidget {
  const PaymentSummaryDetailsPage({
    Key? key,
    required this.paymentSummaryDetails,
  }) : super(key: key);
  final PaymentSummaryDetails paymentSummaryDetails;
  @override
  State<PaymentSummaryDetailsPage> createState() =>
      _PaymentSummaryDetailsPageState();
}

class _PaymentSummaryDetailsPageState extends State<PaymentSummaryDetailsPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(
          context.tr('Payment details'),
          style: Theme.of(context).textTheme.labelLarge,
        ),
        centerTitle: false,
      ),
      bottomNavigationBar: BlocBuilder<PaymentItemBloc, PaymentItemState>(
        builder: (context, state) {
          return state.isFetching || state.paymentItemList.isEmpty
              ? const SizedBox.shrink()
              : Container(
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
                  padding: const EdgeInsets.only(
                    right: 16,
                    left: 16,
                    top: 16,
                    bottom: 30,
                  ),
                  child: Row(
                    key: WidgetKeys.buttonRowKey,
                    children: [
                      if (!widget.paymentSummaryDetails.status
                          .getIsSuccessfulOrProcessed)
                        Expanded(
                          child: OutlinedButton(
                            key: WidgetKeys.deleteAdviceButtonKey,
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                color: ZPColors.red,
                              ),
                            ),
                            child: Text(
                              context.tr('Delete advice'),
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(color: ZPColors.red),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      if (!widget.paymentSummaryDetails.status
                          .getIsSuccessfulOrProcessed)
                        const SizedBox(
                          width: 16,
                        ),
                      Expanded(
                        child: OutlinedButton(
                          key: WidgetKeys.downloadAdviceButtonKey,
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: ZPColors.primary,
                            ),
                          ),
                          child: Text(
                            context.tr('Download advice'),
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(color: ZPColors.primary),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                );
        },
      ),
      body: BlocConsumer<PaymentItemBloc, PaymentItemState>(
        listenWhen: (previous, current) =>
            previous.failureOrSuccessOption != current.failureOrSuccessOption,
        listener: (context, state) {
          state.failureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) {
                ErrorUtils.handleApiFailure(context, failure);
              },
              (_) {},
            ),
          );
        },
        buildWhen: (previous, current) =>
            previous.isFetching != current.isFetching,
        builder: (context, state) {
          return AnnouncementBanner(
            currentPath: context.router.currentPath,
            child: state.isFetching
                ? Align(
                    alignment: Alignment.center,
                    child: LoadingShimmer.logo(
                      key: WidgetKeys.loaderImage,
                    ),
                  )
                : state.paymentItemList.isEmpty
                    ? const NoRecordFound(
                        title: 'No Payment Details Found',
                      )
                    : ListView(
                        children: [
                          PaymentDetails(
                            paymentItemState: state,
                            paymentSummaryDetails: widget.paymentSummaryDetails,
                          ),
                          PaymentItemSection(
                            paymentItemState: state,
                            isSuccessful: widget.paymentSummaryDetails.status
                                .getIsSuccessfulOrProcessed,
                          ),
                        ],
                      ),
          );
        },
      ),
    );
  }
}

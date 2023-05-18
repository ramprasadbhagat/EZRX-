import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';

import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/payments/payment_summary_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/application/payments/paymant_summary/payment_summary_bloc.dart';

import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';

import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';

class PaymentSummaryPage extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  PaymentSummaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        key: const ValueKey('paymentSummaryAppBar'),
        title: const Text(
          'Payment Summary',
        ).tr(),
      ),
      body: BlocConsumer<PaymentSummaryBloc, PaymentSummaryState>(
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
          final eligibilityState = context.read<EligibilityBloc>().state;
          
          return AnnouncementBanner(
            currentPath: context.router.currentPath,
            child: ScrollList<PaymentSummaryDetails>(
              emptyMessage: 'No Payment Summary Found'.tr(),
              onRefresh: () => context.read<PaymentSummaryBloc>().add(
                    PaymentSummaryEvent.fetchPaymentSummaryList(
                      salesOrganization: eligibilityState.salesOrganisation,
                      customerCodeInfo: eligibilityState.customerCodeInfo,
                    ),
                  ),
              onLoadingMore: () => context.read<PaymentSummaryBloc>().add(
                    PaymentSummaryEvent.loadMorePaymentSummary(
                      salesOrganization: eligibilityState.salesOrganisation,
                      customerCodeInfo: eligibilityState.customerCodeInfo,
                    ),
                  ),
              isLoading: state.isFetching,
              itemBuilder: (context, index, itemInfo) {
                return PaymentSummaryTile(
                  paymentSummaryDetails: itemInfo,
                );
              },
              items: state.paymentSummaryList,
            ),
          );
        },
      ),
    );
  }
}

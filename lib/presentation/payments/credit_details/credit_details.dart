import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/payments/credit_and_invoice_details/credit_and_invoice_details_bloc.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_document_detail.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/credit_details/section/credit_details_section.dart';
import 'package:ezrxmobile/presentation/payments/credit_details/section/credit_items_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreditDetailsPage extends StatelessWidget {
  const CreditDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: WidgetKeys.creditDetailsPage,
      appBar: CustomAppBar.commonAppBar(
        title: Text(
          context.tr('Credit Details'),
        ),
        customerBlocked:
            context.read<EligibilityBloc>().state.shipToInfo.customerBlock,
      ),
      body: BlocBuilder<CreditAndInvoiceDetailsBloc,
          CreditAndInvoiceDetailsState>(
        buildWhen: (previous, current) =>
            previous.isLoading != current.isLoading,
        builder: (context, state) {
          if (state.isLoading) {
            return LoadingShimmer.logo(
              key: WidgetKeys.loaderImage,
            );
          }

          return ListView(
            key: WidgetKeys.creditDetailsPageListView,
            children: [
              CreditDetailsSection(
                creditItem: state.basicInfo,
                creditItems: state.itemsInfo,
              ),
              CreditItemsSection(creditItems: state.itemsInfo.groupList),
            ],
          );
        },
      ),
    );
  }
}

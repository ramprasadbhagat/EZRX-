import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/payments/credit_and_invoice_details/credit_and_invoice_details_bloc.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_document_detail.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/payments/credit_details/section/credit_details_section.dart';
import 'package:ezrxmobile/presentation/payments/credit_details/section/credit_items_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreditDetailsPage extends StatelessWidget {
  final CreditAndInvoiceItem creditItem;
  const CreditDetailsPage({
    Key? key,
    required this.creditItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        title: const Text('Credit Details').tr(),
      ),
      body: BlocBuilder<CreditAndInvoiceDetailsBloc,
          CreditAndInvoiceDetailsState>(
        buildWhen: (previous, current) => previous.details != current.details,
        builder: (context, state) {
          if (state.isLoading) {
            return LoadingShimmer.logo(
              key: const Key('LoaderImage'),
            );
          }

          return ListView(
            children: [
              CreditDetailsSection(creditItem: creditItem),
              CreditItemsSection(creditItems: state.details.groupList),
            ],
          );
        },
      ),
    );
  }
}

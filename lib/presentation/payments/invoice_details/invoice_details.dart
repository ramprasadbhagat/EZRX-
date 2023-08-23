import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/payments/credit_and_invoice_details/credit_and_invoice_details_bloc.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/item_address_section.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/invoice_details/section/invoice_details_section.dart';
import 'package:ezrxmobile/presentation/payments/invoice_details/section/invoice_items_section.dart';
import 'package:ezrxmobile/presentation/payments/invoice_details/section/summary.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'widgets/order_item_count.dart';
class InvoiceDetailsPage extends StatelessWidget {
  final CreditAndInvoiceItem invoiceItem;
  const InvoiceDetailsPage({
    Key? key,
    required this.invoiceItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Invoice details').tr(),
      ),
      bottomNavigationBar: BlocBuilder<CreditAndInvoiceDetailsBloc,
          CreditAndInvoiceDetailsState>(
        buildWhen: (previous, current) =>
            previous.isLoading != current.isLoading,
        builder: (context, state) {
          return state.isLoading || state.details.isEmpty
              ? const SizedBox.shrink()
              : SafeArea(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: ZPColors.boxShadowGray,
                          blurRadius: 2.0,
                          offset: Offset(0.1, -2.75),
                        ),
                      ],
                      color: ZPColors.white,
                    ),
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text('Download e-invoice').tr(),
                    ),
                  ),
                );
        },
      ),
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child: BlocBuilder<CreditAndInvoiceDetailsBloc,
            CreditAndInvoiceDetailsState>(
          buildWhen: (previous, current) =>
              previous.isLoading != current.isLoading,
          builder: (context, state) {
            return state.isLoading
                ? LoadingShimmer.logo(
                    key: WidgetKeys.loaderImage,
                  )
                : ListView(
                    key: WidgetKeys.invoiceDetailsPageListView,
                    children: <Widget>[
                      InvoiceDetailsSection(
                        invoiceItem: invoiceItem,
                      ),
                      const ItemAddressSection(),
                      const Divider(
                        endIndent: 0,
                        indent: 0,
                        color: ZPColors.lightGray2,
                        height: 16,
                      ),
                      InvoiceSummary(
                        invoiceItem: invoiceItem,
                      ),
                      const Divider(
                        endIndent: 0,
                        indent: 0,
                        color: ZPColors.lightGray2,
                        height: 16,
                      ),
                      const _OrderItemCount(),
                      InvoiceItemsSection(
                        customerDocumentDetail: state.details,
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}

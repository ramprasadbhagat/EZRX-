import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/payments/common_section/basic_information_section.dart';
import 'package:ezrxmobile/presentation/payments/invoice_details/section/invoice_details_section.dart';
import 'package:ezrxmobile/presentation/payments/invoice_details/section/invoice_items_section.dart';
import 'package:flutter/material.dart';

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
        title: Text('#${invoiceItem.accountingDocument}'),
      ),
      body: AnnouncementBanner(
        currentPath: context.router.currentPath,
        child: ListView(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            bottom: 20,
          ),
          children: <Widget>[
            const BasicInformationSection(),
            InvoiceDetailsSection(
              invoiceItem: invoiceItem,
            ),
            InvoiceItemsSection(
              invoiceItem: invoiceItem,
            ),
          ],
        ),
      ),
    );
  }
}

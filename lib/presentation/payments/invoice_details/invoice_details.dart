import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/payments/credit_and_invoice_details/credit_and_invoice_details_bloc.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/address_info_section.dart';
import 'package:ezrxmobile/presentation/core/custom_app_bar.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/invoice_details/section/invoice_details_section.dart';
import 'package:ezrxmobile/presentation/payments/invoice_details/section/invoice_items_section.dart';
import 'package:ezrxmobile/presentation/payments/invoice_details/section/summary.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'package:ezrxmobile/presentation/payments/invoice_details/widgets/order_item_count.dart';

class InvoiceDetailsPage extends StatelessWidget {
  const InvoiceDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.commonAppBar(
        title: Text(
          context.tr('Invoice details'),
        ),
        customerBlocked:
            context.read<EligibilityBloc>().state.shipToInfo.customerBlock,
      ),
      bottomNavigationBar:
          !context.read<EligibilityBloc>().state.salesOrganisation.salesOrg.isID
              ? BlocBuilder<CreditAndInvoiceDetailsBloc,
                  CreditAndInvoiceDetailsState>(
                  buildWhen: (previous, current) =>
                      previous.isLoading != current.isLoading,
                  builder: (context, state) {
                    return state.isLoading || state.itemsInfo.isEmpty
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
                                key: WidgetKeys.downloadEInvoiceButton,
                                onPressed: () {},
                                child: Text(context.tr('Download e-invoice')),
                              ),
                            ),
                          );
                  },
                )
              : const SizedBox.shrink(),
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
                        invoiceItem: state.basicInfo,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 16.0,
                        ),
                        child: AddressInfoSection.order(),
                      ),
                      const Divider(
                        endIndent: 0,
                        indent: 0,
                        color: ZPColors.lightGray2,
                        height: 16,
                      ),
                      InvoiceSummary(
                        invoiceItem: state.basicInfo,
                      ),
                      const Divider(
                        endIndent: 0,
                        indent: 0,
                        color: ZPColors.lightGray2,
                        height: 16,
                      ),
                      const _OrderItemCount(),
                      InvoiceItemsSection(
                        customerDocumentDetail: state.itemsInfo,
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }
}

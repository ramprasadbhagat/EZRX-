import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_details/order_history_details_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/bill_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_basic_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/orders/core/order_sold_to_info.dart';
import 'package:ezrxmobile/presentation/orders/core/order_ship_to_info.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/presentation/history/widgets/history_details_expanion_tile.dart';

class HistoryDetails extends StatelessWidget {
  final OrderHistoryItem orderHistoryItem;
  final BillToInfo billToInfo;
  final CustomerCodeInfo customerCodeInfo;
  final OrderHistoryBasicInfo orderHistoryBasicInfo;
  const HistoryDetails({
    Key? key,
    required this.orderHistoryItem,
    required this.billToInfo,
    required this.customerCodeInfo,
    required this.orderHistoryBasicInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('#${orderHistoryItem.orderNumber}'.tr()),
        actions: <Widget>[
          TextButton(
            child: Text(
              'Reorder'.tr(),
              style: const TextStyle(
                color: ZPColors.kPrimaryColor,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocBuilder<OrderHistoryDetailsBloc, OrderHistoryDetailsState>(
        buildWhen: (previous, current) =>
            previous.isLoading != current.isLoading,
        builder: (context, state) {
          final orderDetails =
              context.read<OrderHistoryDetailsBloc>().state.orderHistoryDetails;
          if (state.showErrorMessage) {
            Center(
              child: Text(
                'Unable to Get Order History'.tr(),
                style: const TextStyle(
                  color: ZPColors.darkerGreen,
                  fontSize: 16,
                ),
              ),
            );
          }

          return Container(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
              bottom: 20,
            ),
            child: SingleChildScrollView(
              child: Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (state.orderHistoryDetails.orderHistoryDetailsMessages
                        .isNotEmpty)
                      _SystemMessage(
                        orderDetails: orderDetails,
                      ),
                    _OrderDetails(
                      orderDetails: orderDetails,
                      customerCodeInfo: customerCodeInfo,
                    ),
                    const _SoldToAddress(),
                    const _ShipToAddress(),
                    context.read<EligibilityBloc>().state.isBillToenable &&
                            orderHistoryBasicInfo.soldTo !=
                                billToInfo.billToCustomerCode
                        ? _BillToAddress(
                            billToInfo: billToInfo,
                          )
                        : const SizedBox.shrink(),
                    _AdditionalComments(
                      orderDetails: orderDetails,
                    ),
                    _Invoices(
                      orderDetails: orderDetails,
                    ),
                    Text(
                      'Order Summary'.tr(),
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: ZPColors.darkerGreen,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: state
                          .orderHistoryDetails.orderHistoryDetailsOrderItem
                          .map((orderItem) {
                        return const Card();
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SystemMessage extends StatelessWidget {
  final OrderHistoryDetails orderDetails;
  const _SystemMessage({Key? key, required this.orderDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ZPColors.systrmMessageColor,
      margin: const EdgeInsets.only(
        left: 5.0,
        right: 5.0,
      ),
      child: ListTile(
        leading: const Icon(
          Icons.error,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'System Message:'.tr(),
              style: const TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: orderDetails.orderHistoryDetailsMessages.map((e) {
                return e.message.isEmpty
                    ? SizedBox(
                        width: 40,
                        child: LoadingShimmer.tile(),
                      )
                    : Text(
                        e.message,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrderDetails extends StatelessWidget {
  final OrderHistoryDetails orderDetails;
  final CustomerCodeInfo customerCodeInfo;
  const _OrderDetails({
    Key? key,
    required this.orderDetails,
    required this.customerCodeInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderHistoryDetailsBloc, OrderHistoryDetailsState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        return CustomExpansionTile(
          titleText: 'Order Details'.tr(),
          items: [
            BalanceTextRow(
              keyText: 'Total sub value'.tr(),
              valueText: orderDetails.orderHistoryDetailsOrderHeader.orderValue
                  .toString(),
              valueTextLoading: state.isLoading,
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'Grand Total'.tr(),
              valueText: _displayPrice(
                context.read<SalesOrgBloc>().state.configs,
                context.read<CartBloc>().state.grandTotal,
              ),
              keyFlex: 1,
              valueFlex: 1,
              valueTextLoading: state.isLoading,
            ),
            BalanceTextRow(
              keyText: 'Total Tax'.tr(),
              valueText: double.parse(orderDetails
                      .orderHistoryDetailsOrderHeader.totalTax
                      .toString())
                  .toStringAsFixed(2),
              valueTextLoading: state.isLoading,
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'Type'.tr(),
              valueText: orderDetails.orderHistoryDetailsOrderHeader.type,
              valueTextLoading: state.isLoading,
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'Customer Name'.tr(),
              valueText: customerCodeInfo.customerName.toString(),
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'Created Date'.tr(),
              valueText:
                  orderDetails.orderHistoryDetailsOrderHeader.createdDate,
              valueTextLoading: state.isLoading,
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'EZRX No.'.tr(),
              valueText: orderDetails.orderHistoryDetailsOrderHeader.eZRXNumber,
              valueTextLoading: state.isLoading,
              keyFlex: 1,
              valueFlex: 1,
            ),
            !context.read<EligibilityBloc>().state.isRequestedDeliveryDate
                ? BalanceTextRow(
                    keyText: 'Requested Delivery Date'.tr(),
                    valueText: orderDetails
                        .orderHistoryDetailsOrderHeader.requestedDeliveryDate,
                    valueTextLoading: state.isLoading,
                    keyFlex: 1,
                    valueFlex: 1,
                  )
                : const SizedBox.shrink(),
            !context.read<EligibilityBloc>().state.isSpecialInstructions
                ? BalanceTextRow(
                    keyText: 'Special Instructions'.tr(),
                    valueText:
                        orderDetails.orderHistoryDetailsSpecialInstructions,
                    valueTextLoading: state.isLoading,
                    keyFlex: 1,
                    valueFlex: 1,
                  )
                : const SizedBox.shrink(),
            BalanceTextRow(
              keyText: 'PO No.'.tr(),
              valueText:
                  orderDetails.orderHistoryDetailsOrderHeader.pOReference,
              valueTextLoading: state.isLoading,
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'Contact Person'.tr(),
              valueText: orderDetails.orderHistoryDetailsOrderHeader.orderBy,
              valueTextLoading: state.isLoading,
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'Contact Number'.tr(),
              valueText:
                  orderDetails.orderHistoryDetailsOrderHeader.telephoneNumber,
              valueTextLoading: state.isLoading,
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'Customer Classification'.tr(),
              valueText: customerCodeInfo.customerClassification,
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'Customer Local Group'.tr(),
              valueText: customerCodeInfo.customerLocalGroup,
              keyFlex: 1,
              valueFlex: 1,
            ),
            context.read<EligibilityBloc>().state.isPaymentTermEnable
                ? BalanceTextRow(
                    keyText: 'Payment Term '.tr(),
                    valueText: orderDetails
                        .orderHistoryDetailsPaymentTerm.paymentTermCode,
                    valueTextLoading: state.isLoading,
                    keyFlex: 1,
                    valueFlex: 1,
                  )
                : const SizedBox.shrink(),
            context.read<EligibilityBloc>().state.isPaymentTermDescriptionEnable
                ? BalanceTextRow(
                    keyText: 'Payment Term Description'.tr(),
                    valueText: orderDetails
                        .orderHistoryDetailsPaymentTerm.paymentTermDescription,
                    valueTextLoading: state.isLoading,
                    keyFlex: 1,
                    valueFlex: 1,
                  )
                : const SizedBox.shrink(),
          ],
        );
      },
    );
  }

  String _displayPrice(SalesOrganisationConfigs salesOrgConfig, double price) {
    if (salesOrgConfig.currency.isVN) {
      return '${price.toStringAsFixed(2)} ${salesOrgConfig.currency.code}';
    }

    return '${salesOrgConfig.currency.code} ${price.toStringAsFixed(2)}';
  }
}

class _SoldToAddress extends StatelessWidget {
  const _SoldToAddress({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomExpansionTile(
      titleText: 'Sold to Address'.tr(),
      items: const [
        SoldToAddressInfo(),
      ],
    );
  }
}

class _ShipToAddress extends StatelessWidget {
  const _ShipToAddress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomExpansionTile(
      titleText: 'Ship to Address'.tr(),
      items: const [
        ShipToAddressInfo(),
      ],
    );
  }
}

class _BillToAddress extends StatelessWidget {
  final BillToInfo billToInfo;
  const _BillToAddress({Key? key, required this.billToInfo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomExpansionTile(
      titleText: 'Bill to Address'.tr(),
      items: [
        BalanceTextRow(
          keyText: 'Bill To Customer Code'.tr(),
          valueText: billToInfo.billToCustomerCode,
          keyFlex: 1,
          valueFlex: 1,
        ),
        BalanceTextRow(
          keyText: 'Email'.tr(),
          valueText: billToInfo.emailAddresses.join(','),
          keyFlex: 1,
          valueFlex: 1,
        ),
        BalanceTextRow(
          keyText: 'Tax Number'.tr(),
          valueText: billToInfo.taxNumber,
          keyFlex: 1,
          valueFlex: 1,
        ),
        BalanceTextRow(
          keyText: 'Address'.tr(),
          valueText: billToInfo.billToAddress.toString(),
          keyFlex: 1,
          valueFlex: 1,
        ),
        BalanceTextRow(
          keyText: 'Postal Code'.tr(),
          valueText: billToInfo.postalCode,
          keyFlex: 1,
          valueFlex: 1,
        ),
        BalanceTextRow(
          keyText: 'Country'.tr(),
          valueText: billToInfo.country,
          keyFlex: 1,
          valueFlex: 1,
        ),
        BalanceTextRow(
          keyText: 'Phone'.tr(),
          valueText: billToInfo.telephoneNumber,
          keyFlex: 1,
          valueFlex: 1,
        ),
      ],
    );
  }
}

class _AdditionalComments extends StatelessWidget {
  final OrderHistoryDetails orderDetails;
  const _AdditionalComments({Key? key, required this.orderDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomExpansionTile(
      titleText: 'Additional Comments'.tr(),
      items: <Widget>[
        orderDetails.orderHistoryDetailsPoDocuments.isNotEmpty
            ? Container(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Uploaded Attachments'.tr(),
                        style: const TextStyle(
                          color: ZPColors.darkerGreen,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Column(
                            children: orderDetails
                                .orderHistoryDetailsPoDocuments
                                .map((pODocuments) {
                              return pODocuments.url.isEmpty
                                  ? SizedBox(
                                      width: 40,
                                      child: LoadingShimmer.tile(),
                                    )
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          onTap: () async {},
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              bottom: 10.0,
                                              top: 2.0,
                                            ),
                                            child: Column(
                                              children: [
                                                RichText(
                                                  text: TextSpan(
                                                    children: [
                                                      WidgetSpan(
                                                        child: Transform.rotate(
                                                          angle: -45,
                                                          child: const Icon(
                                                            Icons
                                                                .attachment_outlined,
                                                            size: 14,
                                                          ),
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: pODocuments.name,
                                                        style: const TextStyle(
                                                          color: ZPColors
                                                              .darkerGreen,
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                            }).toList(),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              orderDetails.orderHistoryDetailsPoDocuments
                                          .length >
                                      2
                                  ? InkWell(
                                      child: Text(
                                        'View All'.tr(),
                                        style: const TextStyle(
                                          color: ZPColors.darkerGreen,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                      onTap: () {},
                                    )
                                  : const SizedBox(),
                              InkWell(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.download,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Download All'.tr(),
                                      style: const TextStyle(
                                        color: ZPColors.darkerGreen,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}

class _Invoices extends StatelessWidget {
  final OrderHistoryDetails orderDetails;
  const _Invoices({Key? key, required this.orderDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomExpansionTile(
      titleText: 'Invoices'.tr(),
      items: <Widget>[
        Container(
          padding: const EdgeInsets.only(
            top: 0.0,
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: orderDetails
                      .orderHistoryDetailsShippingInformation.invoices
                      .map((invoice) {
                    return Card(
                      elevation: 0,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 5,
                              left: 5,
                              right: 5,
                            ),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    'Invoice Number'.tr(),
                                    style: const TextStyle(
                                      color: ZPColors.darkerGreen,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    invoice.invoiceNumber,
                                    style: const TextStyle(
                                      color: ZPColors.darkerGreen,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 2,
                              left: 5,
                              right: 5,
                            ),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    'Invoice Date'.tr(),
                                    style: const TextStyle(
                                      color: ZPColors.darkerGreen,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    invoice.invoiceDate,
                                    style: const TextStyle(
                                      color: ZPColors.darkerGreen,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 2,
                              left: 5,
                              right: 5,
                            ),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    'Invoice Price'.tr(),
                                    style: const TextStyle(
                                      color: ZPColors.darkerGreen,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: invoice.invoicePrice,
                                          style: const TextStyle(
                                            color: ZPColors.darkerGreen,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

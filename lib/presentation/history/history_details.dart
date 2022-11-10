import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_details/order_history_details_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_list/order_history_list_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/bill_to_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/presentation/history/widgets/history_details_expanion_tile.dart';

class HistoryDetails extends StatelessWidget {
  final OrderHistoryItem orderHistoryItem;
  final BillToInfo billToInfo;
  const HistoryDetails({
    Key? key,
    required this.orderHistoryItem,
    required this.billToInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Order#${orderHistoryItem.orderNumber}',
          style: const TextStyle(
            color: ZPColors.kPrimaryColor,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'Reorder',
              style: TextStyle(
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
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.showErrorMessage) {
            const Center(
              child: Text(
                'Unable to Get Order History',
                style: TextStyle(
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
                      const _SystemMessage(),
                    _OrderDetails(orderDetails: orderDetails),
                    _SoldToAddress(orderDetails: orderDetails),
                    _ShipToAddress(orderDetails: orderDetails),
                    context.read<OrderHistoryListBloc>()
                                .state
                                .orderHistoryList
                                .orderBasicInformation
                                .soldTo !=
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
                    const Text(
                      'Order Summary',
                      style: TextStyle(
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
                        return const Card(); ///// need to implement bonusList
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
  const _SystemMessage({Key? key}) : super(key: key);

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
            const Text(
              'System Message:',
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: context
                  .read<OrderHistoryDetailsBloc>()
                  .state
                  .orderHistoryDetails
                  .orderHistoryDetailsMessages
                  .map((e) {
                return Text(
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
  const _OrderDetails({Key? key, required this.orderDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomExpansionTile(
      titleText: 'Order Details',
      items: [
        BalanceTextRow(
          keyText: 'Total sub value',
          valueText:
              orderDetails.orderHistoryDetailsOrderHeader.orderValue.toString(),
        ),
        const BalanceTextRow(
          keyText: 'Grand Total',
          valueText: '',
        ),
        BalanceTextRow(
          keyText: 'Total Tax',
          valueText: double.parse(orderDetails
                  .orderHistoryDetailsOrderHeader.totalTax
                  .toString())
              .toStringAsFixed(2),
          // state.orderDetails.orderHeader.totalTax.getOrCrash(), /// need create value object for that
        ),
        BalanceTextRow(
          keyText: 'Type',
          valueText: orderDetails.orderHistoryDetailsOrderHeader.type,
        ),
        BalanceTextRow(
          keyText: 'Customer Name',
          valueText: context
              .read<CustomerCodeBloc>()
              .state
              .customerCodeInfo
              .customerName
              .toString(),
        ),
        BalanceTextRow(
          keyText: 'Created Date',
          valueText: orderDetails.orderHistoryDetailsOrderHeader.createdDate,
        ),
        BalanceTextRow(
          keyText: 'EZRX No.',
          valueText: orderDetails.orderHistoryDetailsOrderHeader.eZRXNumber,
        ),
        BalanceTextRow(
          keyText: 'Requested Delivery Date',
          valueText:
              orderDetails.orderHistoryDetailsOrderHeader.requestedDeliveryDate,
        ),
        const BalanceTextRow(
          keyText: 'Special Instructions',
          valueText: '',
        ),
        BalanceTextRow(
          keyText: 'PO No.',
          valueText: orderDetails.orderHistoryDetailsOrderHeader.pOReference,
        ),
        BalanceTextRow(
          keyText: 'Contact Person',
          valueText: orderDetails.orderHistoryDetailsOrderHeader.orderBy,
        ),
        BalanceTextRow(
          keyText: 'Contact Number',
          valueText:
              orderDetails.orderHistoryDetailsOrderHeader.telephoneNumber,
        ),
        BalanceTextRow(
          keyText: 'Customer Classification',
          valueText: context
              .read<CustomerCodeBloc>()
              .state
              .customerCodeInfo
              .customerClassification,
        ),
        BalanceTextRow(
          keyText: 'Customer Local Group',
          valueText: context
              .read<CustomerCodeBloc>()
              .state
              .customerCodeInfo
              .customerLocalGroup,
        ),
        BalanceTextRow(
          keyText: 'Payment Term Description',
          valueText: orderDetails
              .orderHistoryDetailsPaymentTerm.paymentTermDescription,
        ),
      ],
    );
  }
}

class _SoldToAddress extends StatelessWidget {
  final OrderHistoryDetails orderDetails;
  const _SoldToAddress({Key? key, required this.orderDetails})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomExpansionTile(
      titleText: 'Sold to Address',
      items: [
        BalanceTextRow(
          keyText: 'Sold to ID',
          valueText: context
              .read<OrderHistoryListBloc>()
              .state
              .orderHistoryList
              .orderBasicInformation
              .soldTo,
        ),
        BalanceTextRow(
          keyText: 'Sold to Customer Name',
          valueText: context
              .read<OrderHistoryListBloc>()
              .state
              .orderHistoryList
              .orderBasicInformation
              .companyName
              .name,
        ),
        BalanceTextRow(
          keyText: 'Address',
          valueText: context
              .read<CustomerCodeBloc>()
              .state
              .customerCodeInfo
              .customerAddress
              .toString(),
        ),
        BalanceTextRow(
          keyText: 'Postal Code',
          valueText: context
              .read<CustomerCodeBloc>()
              .state
              .customerCodeInfo
              .postalCode,
        ),
        const BalanceTextRow(
          keyText: 'Country',
          valueText: '',
        ),
        BalanceTextRow(
          keyText: 'Phone',
          valueText:
              orderDetails.orderHistoryDetailsOrderHeader.telephoneNumber,
        ),
      ],
    );
  }
}

class _ShipToAddress extends StatelessWidget {
  final OrderHistoryDetails orderDetails;
  const _ShipToAddress({Key? key, required this.orderDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomExpansionTile(titleText: 'Ship to Address', items: [
      BalanceTextRow(
        keyText: 'Ship to ID',
        valueText: context
            .read<OrderHistoryListBloc>()
            .state
            .orderHistoryList
            .orderBasicInformation
            .shipTo,
      ),
      BalanceTextRow(
        keyText: 'Address',
        valueText: orderDetails.orderHistoryDetailsShippingInformation.address,
      ),
      BalanceTextRow(
        keyText: 'Postal Code',
        valueText:
            orderDetails.orderHistoryDetailsShippingInformation.postalCode,
      ),
      BalanceTextRow(
        keyText: 'Country',
        valueText: orderDetails.orderHistoryDetailsShippingInformation.country,
      ),
      BalanceTextRow(
        keyText: 'Phone',
        valueText: orderDetails.orderHistoryDetailsShippingInformation.phone,
      ),
      const BalanceTextRow(
        keyText: 'License',
        valueText: '',
      ),
    ]);
  }
}

class _BillToAddress extends StatelessWidget {
  final BillToInfo billToInfo;
  const _BillToAddress({Key? key, required this.billToInfo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomExpansionTile(
      titleText: 'Bill to Address',
      items: [
        BalanceTextRow(
          keyText: 'Bill To Customer Code',
          valueText: billToInfo.billToCustomerCode,
        ),
        BalanceTextRow(
          keyText: 'Email',
          valueText: billToInfo.emailAddresses.join(','),
        ),
        BalanceTextRow(
          keyText: 'Tax Number',
          valueText: billToInfo.taxNumber,
        ),
        BalanceTextRow(
          keyText: 'Address',
          valueText: billToInfo.billToAddress.toString(),
        ),
        BalanceTextRow(
          keyText: 'Postal Code',
          valueText: billToInfo.postalCode,
        ),
        BalanceTextRow(
          keyText: 'Country',
          valueText: billToInfo.country,
        ),
        BalanceTextRow(
          keyText: 'Phone',
          valueText: billToInfo.telephoneNumber,
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
      titleText: 'Additional Comments',
      items: <Widget>[
        orderDetails.orderHistoryDetailsPoDocuments.isNotEmpty
            ? Container(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Text(
                        'Uploaded Attachments',
                        style: TextStyle(
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
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                                      Icons.attachment_outlined,
                                                      size: 14,
                                                    ),
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: pODocuments.name,
                                                  style: const TextStyle(
                                                    color: ZPColors.darkerGreen,
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w400,
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
                                      child: const Text(
                                        'View All',
                                        style: TextStyle(
                                          color: ZPColors.darkerGreen,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                      onTap: () {},
                                    )
                                  : const SizedBox(),
                              InkWell(
                                onTap: () {
                                  ////
                                },
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.download,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Download All',
                                      style: TextStyle(
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
      titleText: 'Invoices',
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
                                const Expanded(
                                  child: Text(
                                    'Invoice Number',
                                    style: TextStyle(
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
                                const Expanded(
                                  child: Text(
                                    'Invoice Date',
                                    style: TextStyle(
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
                                const Expanded(
                                  child: Text(
                                    'Invoice Price',
                                    style: TextStyle(
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

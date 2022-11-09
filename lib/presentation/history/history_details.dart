
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';

import 'package:ezrxmobile/presentation/core/balance_text_row.dart';

import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';

import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';

import 'package:ezrxmobile/domain/order/entities/order_history_basic_info.dart';

class HistoryDetails extends StatelessWidget {
  final OrderHistoryItem orderHistoryItem;
  final CustomerCodeInfo customerCodeInfo;
  final ShipToInfo shipToInfo;
  final OrderHistoryBasicInfo orderHistoryBasicInfo;

  const HistoryDetails({
    Key? key,
    required this.orderHistoryItem,
    required this.customerCodeInfo,
    required this.shipToInfo,
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
      body: Container(
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
          bottom: 20,
        ),
        child: SingleChildScrollView(
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ExpansionTile(
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  tilePadding: EdgeInsets.zero,
                  initiallyExpanded: true,
                  iconColor: ZPColors.darkerGreen,
                  title: const  Text(
                     'Order Details',
                     style: TextStyle(
                       fontSize: 16.0,
                         color: ZPColors.darkerGreen,
                       fontWeight: FontWeight.w600,
                     ),
                   ),
                  children: [
                    const BalanceTextRow(
                      keyText: 'Total sub value',
                      valueText: '',
                    ),
                    const BalanceTextRow(
                      keyText: 'Grand Total',
                      valueText: '',
                    ),
                    const BalanceTextRow(
                      keyText: 'Total Tax',
                      valueText: '',
                    ),
                    const BalanceTextRow(
                      keyText: 'Type',
                      valueText: '',
                    ),
                    BalanceTextRow(
                      keyText: 'Customer Name',
                      valueText: customerCodeInfo.customerName.toString(),
                    ),
                    BalanceTextRow(
                      keyText: 'Customer Email',
                      valueText: customerCodeInfo.customerEmailAddress,
                    ),
                    BalanceTextRow(
                      keyText: 'Created Date',
                      valueText: orderHistoryItem.createdDate,
                    ),
                    BalanceTextRow(
                      keyText: 'EZRX No.',
                      valueText: orderHistoryItem.ezrxNumber,
                    ),
                    const BalanceTextRow(
                      keyText: 'Requested Delivery Date',
                      valueText: '',
                    ),
                    const BalanceTextRow(
                      keyText: 'Special Instructions',
                      valueText: '',
                    ),
                    const BalanceTextRow(
                      keyText: 'PO No.',
                      valueText: '',
                    ),
                    const BalanceTextRow(
                      keyText: 'Contact Person',
                      valueText: '',
                    ),
                    BalanceTextRow(
                      keyText: 'Contact Number',
                      valueText: shipToInfo.telephoneNumber,
                    ),
                    BalanceTextRow(
                      keyText: 'Customer Classification',
                      valueText: customerCodeInfo.customerClassification,
                    ),
                    BalanceTextRow(
                      keyText: 'Customer Local Group',
                      valueText: customerCodeInfo.customerLocalGroup,
                    ),
                    BalanceTextRow(
                      keyText: 'Payment Term Description',
                      valueText: customerCodeInfo.paymentTermDescription,
                    ),
                  ],
                ),
                ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  initiallyExpanded: true,
                  iconColor: ZPColors.darkerGreen,
                  title: const Text(
                    'Sold to Address',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: ZPColors.darkerGreen,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  children: [
                    BalanceTextRow(
                      keyText: 'Sold to ID',
                      valueText: orderHistoryBasicInfo.soldTo,
                    ),
                    BalanceTextRow(
                      keyText: 'Sold to Customer Name',
                      valueText: orderHistoryBasicInfo.companyName.name,
                    ),
                    BalanceTextRow(
                      keyText: 'Address',
                      valueText: customerCodeInfo.customerAddress.toString(),
                    ),
                    BalanceTextRow(
                      keyText: 'Postal Code',
                      valueText: customerCodeInfo.postalCode,
                    ),
                    const BalanceTextRow(
                      keyText: 'Country',
                      valueText: '',
                    ),
                    BalanceTextRow(
                      keyText: 'Phone',
                      valueText: shipToInfo.telephoneNumber,
                    ),
                  ],
                ),
                ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  initiallyExpanded: true,
                  iconColor: ZPColors.darkerGreen,
                  title: const Text(
                    'Ship to Address',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: ZPColors.darkerGreen,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  children: [
                    const BalanceTextRow(
                      keyText: 'Ship to ID',
                      valueText: '',
                    ),
                    BalanceTextRow(
                      keyText: 'Address',
                      valueText: shipToInfo.shipToAddress.toString(),
                    ),
                    BalanceTextRow(
                      keyText: 'Postal Code',
                      valueText: shipToInfo.postalCode,
                    ),
                    const BalanceTextRow(
                      keyText: 'Country',

                      /// coming from orderDetail
                      valueText: '',
                    ),
                    BalanceTextRow(
                      keyText: 'Phone',
                      valueText: shipToInfo.telephoneNumber,
                    ),
                    const BalanceTextRow(
                      keyText: 'License',
                      valueText: '',
                    ),
                  ],
                ),
                ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  initiallyExpanded: true,
                  iconColor: ZPColors.darkerGreen,
                  title: const Text(
                    'Invoices',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: ZPColors.darkerGreen,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  children: <Widget>[
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
                              children: [
                                Card(
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
                                          children: const <Widget>[
                                            Expanded(
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
                                                'invoice.invoiceNumber',
                                                style: TextStyle(
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
                                          children: const <Widget>[
                                            Expanded(
                                              child: Text(
                                                ' Invoice Date',
                                                style: TextStyle(
                                                  color: ZPColors.darkerGreen,
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                '',
                                                style: TextStyle(
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
                                                ' Invoice Price',
                                                style: TextStyle(
                                                  color: ZPColors.darkerGreen,
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: RichText(
                                                text: const TextSpan(
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text: '',
                                                      style: TextStyle(
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
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  initiallyExpanded: true,
                  iconColor: ZPColors.darkerGreen,
                  title: Text(
                    'Additional Comments',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: ZPColors.darkerGreen,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  children: <Widget>[],
                ),
                const Text(
                    'Order Summary',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: ZPColors.darkerGreen,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}

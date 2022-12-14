import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_document_buffer.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/core/text_button_shimmer.dart';
import 'package:ezrxmobile/presentation/core/widget_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_file_safe/open_file_safe.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ezrxmobile/application/order/order_history_details/download_attachment/bloc/download_attachment_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_details/order_history_details_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/bill_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_basic_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/history/widgets/history_details_expanion_tile.dart';
import 'package:ezrxmobile/presentation/orders/core/order_ship_to_info.dart';
import 'package:ezrxmobile/presentation/orders/core/order_sold_to_info.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/history/widgets/history_details_order_summary_order_bonus_card.dart';
import 'package:ezrxmobile/presentation/history/widgets/history_details_order_summary_order_item_card.dart';
import 'package:ezrxmobile/presentation/history/widgets/history_details_order_summary_order_tender_contract_card.dart';

class HistoryDetails extends StatelessWidget {
  final OrderHistoryItem orderHistoryItem;
  final BillToInfo billToInfo;
  final CustomerCodeInfo customerCodeInfo;
  final OrderHistoryBasicInfo orderHistoryBasicInfo;
  final SalesOrganisationConfigs salesOrgConfigs;

  const HistoryDetails({
    Key? key,
    required this.orderHistoryItem,
    required this.billToInfo,
    required this.customerCodeInfo,
    required this.orderHistoryBasicInfo,
    required this.salesOrgConfigs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final disableCreateOrder =
        context.read<UserBloc>().state.user.disableCreateOrder;

    return Scaffold(
      key: const ValueKey('orderHistoryDetailsPage'),
      appBar: AppBar(
        leading: IconButton(
          key: const ValueKey('backToOrderHistoryDetailsPage'),
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('#${orderHistoryItem.orderNumber}'.tr()),
        actions: disableCreateOrder
            ? <Widget>[]
            : <Widget>[
                BlocBuilder<MaterialPriceDetailBloc, MaterialPriceDetailState>(
                  buildWhen: (previous, current) =>
                      previous.isValidating != current.isValidating ||
                      previous.isFetching != current.isFetching,
                  builder: (context, state) {
                    if (state.isValidating || state.isFetching) {
                      return TextButtonShimmer(
                        key: const ValueKey('reorder'),
                        title: 'Reorder'.tr(),
                      );
                    }

                    return TextButton(
                      key: const ValueKey('addToCartPressed'),
                      onPressed: () => _addToCartPressed(
                        context,
                        state,
                        orderHistoryItem,
                      ),
                      child: Text(
                        'Reorder'.tr(),
                        style: const TextStyle(
                          color: ZPColors.kPrimaryColor,
                        ),
                      ),
                    );
                  },
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
                key: const Key('unable'),
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
                    context.read<EligibilityBloc>().state.isBillToEnable &&
                            orderHistoryBasicInfo.soldTo !=
                                billToInfo.billToCustomerCode
                        ? _BillToAddress(
                            billToInfo: billToInfo,
                          )
                        : const SizedBox.shrink(),
                    if (context
                            .read<EligibilityBloc>()
                            .state
                            .isShowPOAttachmentEnable &&
                        orderDetails.poDocumentsAvailable)
                      _AdditionalComments(
                        orderDetails: orderDetails,
                      ),
                    _Invoices(
                      orderDetails: orderDetails,
                    ),
                    _OrderSummary(
                      orderDetails: orderDetails,
                      salesOrgConfigs: salesOrgConfigs,
                      orderHistoryItem: orderHistoryItem,
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

void _addToCartPressed(
  BuildContext context,
  MaterialPriceDetailState state,
  OrderHistoryItem orderHistoryItem,
) {
  final cartBloc = context.read<CartBloc>();
  final queryInfo = MaterialQueryInfo.fromOrderHistory(
    orderHistoryItem: orderHistoryItem,
  );
  final itemInfo = state.materialDetails[queryInfo];
  if (itemInfo != null) {
    final priceAggregate = PriceAggregate(
      price: itemInfo.price,
      materialInfo: itemInfo.info,
      salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
      quantity: queryInfo.qty.getOrCrash(),
      discountedMaterialCount: cartBloc.state.zmgMaterialCount,
      bundle: Bundle.empty(),
      addedBonusList: [],
      stockInfo: StockInfo.empty().copyWith(
        materialNumber: itemInfo.info.materialNumber,
      ),
      tenderContract: TenderContract.empty(),
    );
    cartBloc.add(CartEvent.addToCart(
      item: priceAggregate,
      customerCodeInfo: context.read<CustomerCodeBloc>().state.customerCodeInfo,
      salesOrganisationConfigs: context.read<SalesOrgBloc>().state.configs,
      shipToInfo: context.read<ShipToCodeBloc>().state.shipToInfo,
      doNotallowOutOfStockMaterial:
          context.read<EligibilityBloc>().state.doNotAllowOutOfStockMaterials,
      salesOrganisation: context.read<SalesOrgBloc>().state.salesOrganisation,
    ));

    //TODO: Revisit later
    context.router.pushNamed('cart_page');
  }
}

class _SystemMessage extends StatelessWidget {
  final OrderHistoryDetails orderDetails;

  const _SystemMessage({Key? key, required this.orderDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const ValueKey('systemMessage'),
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
                        key: const ValueKey('messageEmpty'),
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
    final enableOHPrice = context.read<EligibilityBloc>().state.enableOHPrice;
    final enableTaxDisplay =
        context.read<SalesOrgBloc>().state.configs.enableTaxDisplay;
    final enableTaxAtTotalLevelOnly =
        context.read<SalesOrgBloc>().state.configs.enableTaxAtTotalLevelOnly;

    return BlocBuilder<OrderHistoryDetailsBloc, OrderHistoryDetailsState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        return CustomExpansionTile(
          key: const ValueKey('orderDetails'),
          titleText: 'Order Details'.tr(),
          items: [
            if (enableOHPrice)
              BalanceTextRow(
                keyText: 'Total sub value'.tr(),
                valueText: StringUtils.displayPrice(
                  context.read<SalesOrgBloc>().state.configs,
                  orderDetails.orderHistoryDetailsOrderHeader.orderValue,
                ),
                valueTextLoading: state.isLoading,
                keyFlex: 1,
                valueFlex: 1,
              ),
            if (enableTaxDisplay || enableTaxAtTotalLevelOnly)
              BalanceTextRow(
                keyText: context.read<SalesOrgBloc>().state.salesOrg.isSg
                    ? 'GST'
                    : 'Total Tax'.tr(),
                valueText: StringUtils.displayPrice(
                  context.read<SalesOrgBloc>().state.configs,
                  orderDetails.orderHistoryDetailsOrderHeader.totalTax,
                ),
                valueTextLoading: state.isLoading,
                keyFlex: 1,
                valueFlex: 1,
              ),
            if (enableOHPrice)
              BalanceTextRow(
                keyText: 'Grand Total'.tr(),
                valueText: StringUtils.displayPrice(
                  context.read<SalesOrgBloc>().state.configs,
                  orderDetails.orderHistoryDetailsOrderHeader.grandTotal,
                ),
                keyFlex: 1,
                valueFlex: 1,
                valueTextLoading: state.isLoading,
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
                    key: const ValueKey('paymentTerm'),
                    keyText: 'Payment Term'.tr(),
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
}

class _SoldToAddress extends StatelessWidget {
  const _SoldToAddress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomExpansionTile(
      key: const ValueKey('soldToAddress'),
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
      key: const ValueKey('shipToAddress'),
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
      key: const ValueKey('billToAddress'),
      titleText: 'Bill to Address'.tr(),
      items: WidgetHelper.getBillToCustomerDetails(billToInfo),
    );
  }
}

class _AdditionalComments extends StatefulWidget {
  final OrderHistoryDetails orderDetails;

  const _AdditionalComments({Key? key, required this.orderDetails})
      : super(key: key);

  @override
  State<_AdditionalComments> createState() => _AdditionalCommentsState();
}

class _AdditionalCommentsState extends State<_AdditionalComments> {
  bool show = false;

  @override
  Widget build(BuildContext context) {
    final overlay = LoadingOverlay.of(context);

    return CustomExpansionTile(
      key: const ValueKey('additionalComment'),
      titleText: 'Additional Comments'.tr(),
      items: <Widget>[
        BlocListener<DownloadAttachmentBloc, DownloadAttachmentState>(
          listenWhen: (previous, current) => previous != current,
          listener: (context, state) async {
            state.failureOrSuccessOption.fold(
              () => {},
              (either) => either.fold(
                (failure) {
                  overlay.hide();

                  ErrorUtils.handleApiFailure(context, failure);
                },
                (r) async {
                  overlay.hide();
                  if (state.fileFetchMode == FileFetchMode.view) {
                    await openFile(
                      state.fileData.first,
                    );
                  } else {
                    await downloadAllFile(state.fileData);
                    showSnackBar(
                      context: context,
                      message: 'All attachments downloaded successfully.'.tr(),
                    );
                  }
                },
              ),
            );
          },
          child: Container(
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
                        children: widget
                            .orderDetails.orderHistoryDetailsPoDocuments
                            .sublist(0, listLength)
                            .map((pODocuments) {
                          return pODocuments.url.isEmpty
                              ? SizedBox(
                                  key: const ValueKey('pODocumentsUrl'),
                                  width: 40,
                                  child: LoadingShimmer.tile(),
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        context
                                            .read<DownloadAttachmentBloc>()
                                            .add(DownloadAttachmentEvent
                                                .downloadFile(
                                              files:
                                                  pODocuments.getNameUrlAsMap,
                                              fetchMode: FileFetchMode.view,
                                            ));
                                        overlay.show();
                                      },
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
                                                      color:
                                                          ZPColors.darkerGreen,
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
                          widget.orderDetails.orderHistoryDetailsPoDocuments
                                          .length >
                                      2 &&
                                  !show
                              ? InkWell(
                                  child: Text(
                                    'View All'.tr(),
                                    style: const TextStyle(
                                      color: ZPColors.darkerGreen,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      show = !show;
                                    });
                                  },
                                )
                              : const SizedBox(),
                          InkWell(
                            onTap: () {
                              context.read<DownloadAttachmentBloc>().add(
                                    DownloadAttachmentEvent.downloadFile(
                                      files: widget.orderDetails.getAllPoAsMap,
                                      fetchMode: FileFetchMode.download,
                                    ),
                                  );
                              overlay.show();
                            },
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
          ),
        ),
      ],
    );
  }

  Future<void> openFile(
    OrderHistoryDetailsPoDocumentsBuffer orderHistoryDetailsPoDocumentsBuffer,
  ) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file =
        File('${appStorage.path}/${orderHistoryDetailsPoDocumentsBuffer.name}');
    await file.writeAsBytes(orderHistoryDetailsPoDocumentsBuffer.buffer);
    final result = await OpenFile.open(file.path);
    if (result.type != ResultType.done) {
      showSnackBar(
        context: context,
        message: result.message.tr(),
      );
    }
  }

  Future<void> downloadAllFile(
    List<OrderHistoryDetailsPoDocumentsBuffer>
        orderHistoryDetailsPoDocumentsBuffers,
  ) async {
    try {
      for (final orderHistoryDetailsPoDocumentsBuffer
          in orderHistoryDetailsPoDocumentsBuffers) {
        final appStorage = await getTemporaryDirectory();
        final file = File(
          '${appStorage.path}/${orderHistoryDetailsPoDocumentsBuffer.name}',
        );
        await file.writeAsBytes(orderHistoryDetailsPoDocumentsBuffer.buffer);
      }
    } catch (e) {
      showSnackBar(
        context: context,
        message: 'Some Thing Went Wrong'.tr(),
      );
    }
  }

  int get listLength {
    final listLen = widget.orderDetails.orderHistoryDetailsPoDocuments.length;

    return show
        ? listLen
        : listLen > 2
            ? 2
            : listLen;
  }
}

class _Invoices extends StatelessWidget {
  final OrderHistoryDetails orderDetails;

  const _Invoices({Key? key, required this.orderDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderHistoryDetailsBloc, OrderHistoryDetailsState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        return CustomExpansionTile(
          key: const ValueKey('invoices'),
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
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                BalanceTextRow(
                                  keyText: 'Invoice Number'.tr(),
                                  valueText: invoice.invoiceNumber,
                                  valueTextLoading: state.isLoading,
                                  keyFlex: 1,
                                  valueFlex: 1,
                                ),
                                BalanceTextRow(
                                  keyText: 'Invoice Date'.tr(),
                                  valueText: invoice.invoiceDate,
                                  valueTextLoading: state.isLoading,
                                  keyFlex: 1,
                                  valueFlex: 1,
                                ),
                                BalanceTextRow(
                                  keyText: 'Invoice Price'.tr(),
                                  valueText: invoice.invoicePrice,
                                  valueTextLoading: state.isLoading,
                                  keyFlex: 1,
                                  valueFlex: 1,
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                              ],
                            ),
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
      },
    );
  }
}

class LoadingOverlay {
  BuildContext _context;

  void hide() {
    Navigator.of(_context).pop();
  }

  void show() {
    showDialog(
      context: _context,
      barrierDismissible: false,
      builder: (ctx) => LoadingShimmer.logo(key: const Key('loaderImage')),
    );
  }

  Future<T> during<T>(Future<T> future) {
    show();

    return future.whenComplete(() => hide());
  }

  LoadingOverlay._create(this._context);

  factory LoadingOverlay.of(BuildContext context) {
    return LoadingOverlay._create(context);
  }
}

class _OrderSummary extends StatelessWidget {
  final OrderHistoryDetails orderDetails;
  final SalesOrganisationConfigs salesOrgConfigs;
  final OrderHistoryItem orderHistoryItem;

  const _OrderSummary({
    Key? key,
    required this.orderDetails,
    required this.salesOrgConfigs,
    required this.orderHistoryItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderHistoryDetailsBloc, OrderHistoryDetailsState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Order Summary'.tr(),
                style: const TextStyle(
                  fontSize: 16.0,
                  color: ZPColors.darkerGreen,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: state.bonusItem.map((orderItem) {
                  return orderItem.bonusList.isNotEmpty
                      ? OrderItemBonusCard(
                          key: Key(
                            'orderItemBonusCard-${orderItem.orderItem.materialNumber.displayMatNo}',
                          ),
                          orderHistoryDetailsBonusAggregate: orderItem,
                        )
                      : orderItem.orderItem.isTenderContractMaterial
                          ? OrderTenderContractCard(
                              key: Key(
                                'orderTenderContractCard-${orderItem.orderItem.materialNumber.displayMatNo}',
                              ),
                              orderHistoryDetailsBonusAggregate: orderItem,
                            )
                          : OrderItemCard(
                              key: Key(
                                'orderItemCard-${orderItem.orderItem.materialNumber.displayMatNo}',
                              ),
                              orderHistoryDetailsBonusAggregate: orderItem,
                            );
                }).toList(),
              ),
              BlocBuilder<UserBloc, UserState>(
                buildWhen: (previous, current) =>
                    previous.user.disableCreateOrder !=
                    current.user.disableCreateOrder,
                builder: (context, state) {
                  return state.user.disableCreateOrder
                      ? const SizedBox.shrink()
                      : Center(
                          child: Container(
                            width: 160,
                            padding: const EdgeInsets.all(16.0),
                            child: ElevatedButton(
                              key: const ValueKey('reOrderButton'),
                              // style: ButtonStyle(
                              //   backgroundColor: MaterialStateProperty.resolveWith(
                              //     (states) => ZPColors.white,
                              //   ),
                              //   side: MaterialStateProperty.resolveWith(
                              //     (states) => const BorderSide(color: ZPColors.primary),
                              //   ),
                              // ),
                              onPressed: () => _addToCartPressed(
                                context,
                                context.read<MaterialPriceDetailBloc>().state,
                                orderHistoryItem,
                              ),
                              child: Text(
                                'Re-order'.tr(),
                                // style: const TextStyle(color: ZPColors.darkerGreen),
                              ),
                            ),
                          ),
                        );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

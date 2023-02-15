import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_details/order_history_details_bloc.dart';
import 'package:ezrxmobile/application/order/tender_contract/tender_contract_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/bill_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/core/aggregate/bonus_aggregate.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_price_detail.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_basic_info.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/custom_expansion_tile.dart'
    as custom;
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/po_attachment.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/core/text_button_shimmer.dart';
import 'package:ezrxmobile/presentation/core/widget_helper.dart';
import 'package:ezrxmobile/presentation/history/widgets/history_details_order_summary_order_bonus_card.dart';
import 'package:ezrxmobile/presentation/history/widgets/history_details_order_summary_order_item_card.dart';
import 'package:ezrxmobile/presentation/history/widgets/history_details_order_summary_order_tender_contract_card.dart';
import 'package:ezrxmobile/presentation/orders/core/order_ship_to_info.dart';
import 'package:ezrxmobile/presentation/orders/core/order_sold_to_info.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    final customerCodeInfo =
        context.read<EligibilityBloc>().state.customerCodeInfo;

    return BlocListener<OrderHistoryDetailsBloc, OrderHistoryDetailsState>(
      listenWhen: (previous, current) =>
          previous.orderHistoryDetails.orderHistoryDetailsOrderItem !=
          current.orderHistoryDetails.orderHistoryDetailsOrderItem,
      listener: (context, state) {
        final eligibilityState = context.read<EligibilityBloc>().state;
        context.read<MaterialPriceDetailBloc>().add(
              MaterialPriceDetailEvent.fetch(
                user: eligibilityState.user,
                customerCode: eligibilityState.customerCodeInfo,
                salesOrganisation: eligibilityState.salesOrganisation,
                salesOrganisationConfigs: eligibilityState.salesOrgConfigs,
                shipToCode: eligibilityState.shipToInfo,
                materialInfoList: state.orderHistoryDetails
                    .allOrderHistoryDetailsOrderItemQueryInfo,
                skipFOCCheck: true,
                pickAndPack:
                    context.read<EligibilityBloc>().state.getPNPValueMaterial,
              ),
            );
      },
      child: Scaffold(
        key: const ValueKey('orderHistoryDetailsPage'),
        appBar: AppBar(
          leading: IconButton(
            key: const ValueKey('backToOrderHistoryDetailsPage'),
            icon: const Icon(Icons.arrow_back_ios_new_sharp),
            onPressed: () => context.router.pop(),
          ),
          title: Text('#${orderHistoryItem.orderNumber.getOrCrash()}'.tr()),
          actions: disableCreateOrder
              ? <Widget>[]
              : <Widget>[
                  BlocBuilder<MaterialPriceDetailBloc,
                      MaterialPriceDetailState>(
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

                      return _ReOrder(
                        fromTopMenu: true,
                        orderHistoryItem: orderHistoryItem,
                      );
                    },
                  ),
                ],
        ),
        body: BlocConsumer<OrderHistoryDetailsBloc, OrderHistoryDetailsState>(
          listenWhen: (previous, current) =>
              previous.failureOrSuccessOption != current.failureOrSuccessOption,
          listener: (context, state) {
            state.failureOrSuccessOption.fold(
              () {},
              (either) => either.fold(
                (failure) {
                  final failureMessage = failure.failureMessage;
                  showSnackBar(
                    context: context,
                    message: failureMessage.tr(),
                  );
                },
                (success) {},
              ),
            );
          },
          buildWhen: (previous, current) =>
              previous.isLoading != current.isLoading,
          builder: (context, state) {
            final orderDetails = context
                .read<OrderHistoryDetailsBloc>()
                .state
                .orderHistoryDetails;

            return SingleChildScrollView(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                bottom: 20,
              ),
              key: const Key('scrollHistoryDetail'),
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
                  const _SoldToAddress(
                    key: Key('soldToAddressWidget'),
                  ),
                  const _ShipToAddress(
                    key: Key('shipToAddressWidget'),
                  ),
                  if (context.read<EligibilityBloc>().state.isBillToInfo)
                    _BillToAddress(
                      billToInfo: billToInfo,
                    ),
                  if (context
                          .read<EligibilityBloc>()
                          .state
                          .salesOrgConfigs
                          .showPOAttachment &&
                      orderDetails.poDocumentsAvailable)
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: PoAttachment(
                            poDocuments:
                                orderDetails.orderHistoryDetailsPoDocuments,
                            poattachMentRenderMode: PoAttachMentRenderMode.view,
                            uploadingPocDocument: const <PoDocuments>[],
                          ),
                        ),
                        const Divider(
                          color: ZPColors.lightGray,
                          endIndent: 0,
                          indent: 0,
                        ),
                      ],
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
            );
          },
        ),
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
      key: const ValueKey('systemMessage'),
      color: ZPColors.systrmMessageColor,
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
    final enableOHPrice =
        context.read<EligibilityBloc>().state.salesOrgConfigs.enableOHPrice;
    final enableTaxDisplay =
        context.read<SalesOrgBloc>().state.configs.enableTaxDisplay;
    final enableTaxAtTotalLevelOnly =
        context.read<SalesOrgBloc>().state.configs.enableTaxAtTotalLevelOnly;

    return BlocBuilder<OrderHistoryDetailsBloc, OrderHistoryDetailsState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        return custom.ExpansionTile(
          initiallyExpanded: true,
          keepHeaderBorder: true,
          key: const ValueKey('orderDetails'),
          title: Text(
            'Order Details'.tr(),
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          children: [
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
                key: const Key('taxDisplay'),
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
              valueText: orderDetails.orderHistoryDetailsOrderHeader.createdDate
                  .displayHumanReadableDate,
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
            !context
                    .read<EligibilityBloc>()
                    .state
                    .salesOrgConfigs
                    .disableDeliveryDate
                ? BalanceTextRow(
                    keyText: 'Requested Delivery Date'.tr(),
                    valueText: orderDetails
                        .orderHistoryDetailsOrderHeader.requestedDeliveryDate,
                    valueTextLoading: state.isLoading,
                    keyFlex: 1,
                    valueFlex: 1,
                  )
                : const SizedBox.shrink(),
            !context
                    .read<EligibilityBloc>()
                    .state
                    .salesOrgConfigs
                    .enableSpecialInstructions
                ? BalanceTextRow(
                    keyText: 'Special Instructions'.tr(),
                    valueText: orderDetails
                        .orderHistoryDetailsSpecialInstructions
                        .displaySpecialInstructions,
                    valueTextLoading: state.isLoading,
                    keyFlex: 1,
                    valueFlex: 1,
                  )
                : const SizedBox.shrink(),
            BalanceTextRow(
              keyText: 'PO No.'.tr(),
              valueText: orderDetails.orderHistoryDetailsOrderHeader.pOReference
                  .displayPOReference,
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
              valueText: orderDetails.orderHistoryDetailsOrderHeader
                  .telephoneNumber.displayTelephoneNumber,
              valueTextLoading: state.isLoading,
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'Customer Classification'.tr(),
              valueText: customerCodeInfo
                  .customerClassification.displayCustomerClassification,
              keyFlex: 1,
              valueFlex: 1,
            ),
            BalanceTextRow(
              keyText: 'Customer Local Group'.tr(),
              valueText: customerCodeInfo.customerLocalGroup,
              keyFlex: 1,
              valueFlex: 1,
            ),
            context
                    .read<EligibilityBloc>()
                    .state
                    .salesOrgConfigs
                    .enablePaymentTerms
                ? BalanceTextRow(
                    key: const ValueKey('paymentTerm'),
                    keyText: 'Payment Term'.tr(),
                    valueText: orderDetails.orderHistoryDetailsPaymentTerm
                        .paymentTermCode.displayPaymentTermCode,
                    valueTextLoading: state.isLoading,
                    keyFlex: 1,
                    valueFlex: 1,
                  )
                : const SizedBox.shrink(),
            context.read<EligibilityBloc>().state.isPaymentTermDescriptionEnable
                ? BalanceTextRow(
                    keyText: 'Payment Term Description'.tr(),
                    valueText: orderDetails.orderHistoryDetailsPaymentTerm
                        .paymentTermDescription.displayPaymentTermDescription,
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
    return custom.ExpansionTile(
      initiallyExpanded: true,
      keepHeaderBorder: true,
      key: const ValueKey('soldToAddress'),
      title: Text(
        'Sold to Address'.tr(),
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(fontWeight: FontWeight.w600),
      ),
      children: const [
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
    return custom.ExpansionTile(
      initiallyExpanded: true,
      keepHeaderBorder: true,
      key: const ValueKey('shipToAddress'),
      title: Text(
        'Ship to Address'.tr(),
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(fontWeight: FontWeight.w600),
      ),
      children: const [
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
    return custom.ExpansionTile(
      initiallyExpanded: true,
      keepHeaderBorder: true,
      key: const ValueKey('billToAddress'),
      title: Text(
        'Bill to Address'.tr(),
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(fontWeight: FontWeight.w600),
      ),
      children: WidgetHelper.getBillToCustomerDetails(billToInfo),
    );
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
        return custom.ExpansionTile(
          initiallyExpanded: true,
          keepHeaderBorder: true,
          key: const ValueKey('invoices'),
          title: Text(
            'Invoices'.tr(),
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          children: [
            Column(
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
          ],
        );
      },
    );
  }
}

class LoadingOverlay {
  BuildContext _context;

  void hide() {
    _context.router.pop();
  }

  void show() {
    showDialog(
      context: _context,
      barrierDismissible: false,
      builder: (ctx) => LoadingShimmer.logo(key: const Key('loaderImage')),
    );
  }

  LoadingOverlay._create(this._context);

  factory LoadingOverlay.of(BuildContext context) {
    return LoadingOverlay._create(context);
  }
}

class _ReOrder extends StatelessWidget {
  final bool fromTopMenu;
  final OrderHistoryItem orderHistoryItem;

  const _ReOrder({
    Key? key,
    required this.fromTopMenu,
    required this.orderHistoryItem,
  }) : super(key: key);

  PriceAggregate _addToCart({
    required BuildContext context,
    required MaterialPriceDetail itemInfo,
    required MaterialQueryInfo queryInfo,
  }) {
    final priceAggregate = PriceAggregate(
      price: itemInfo.price,
      materialInfo: itemInfo.info,
      salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
      quantity: queryInfo.qty.getOrCrash(),
      bundle: Bundle.empty(),
      addedBonusList: [],
      stockInfo: StockInfo.empty().copyWith(
        materialNumber: itemInfo.info.materialNumber,
      ),
      tenderContract: queryInfo.tenderContract,
    );

    return priceAggregate;
  }

  TenderContract _getSelectedTenderContract(
    BuildContext context,
    MaterialNumber matNo,
  ) {
    final orderHistoryDetailsState =
        context.read<OrderHistoryDetailsBloc>().state;
    final orderHistoryDetailsBonusAggregate =
        orderHistoryDetailsState.bonusItem.firstWhere(
      (bonusItem) =>
          bonusItem.bonusList.isEmpty &&
          bonusItem.orderItem.isTenderContractMaterial &&
          bonusItem.orderItem.materialNumber == matNo,
      orElse: () => OrderHistoryDetailsBonusAggregate.empty(),
    );

    return orderHistoryDetailsBonusAggregate ==
            OrderHistoryDetailsBonusAggregate.empty()
        ? TenderContract.empty()
        : TenderContract.empty().copyWith(
            contractNumber: TenderContractNumber.tenderContractNumber(
              orderHistoryDetailsBonusAggregate
                  .tenderContractDetails.tenderContractNumber,
            ),
          );
  }

  void _addToCartPressed(
    BuildContext context,
    MaterialPriceDetailState state,
    OrderHistoryItem orderHistoryItem,
  ) {
    final eligibilityState = context.read<EligibilityBloc>().state;
    final orderHistoryDetails =
        context.read<OrderHistoryDetailsBloc>().state.orderHistoryDetails;

    orderHistoryDetails.allOrderHistoryDetailsOrderItemQueryInfo
        .map((queryInfo) {
      final itemInfo = state.materialDetails[queryInfo];
      if (itemInfo != null) {
        if (itemInfo.info.hasValidTenderContract) {
          context
              .read<TenderContractBloc>()
              .add(const TenderContractEvent.unselected());
          context.read<TenderContractBloc>().add(
                TenderContractEvent.fetch(
                  salesOrganisation:
                      context.read<SalesOrgBloc>().state.salesOrganisation,
                  customerCodeInfo:
                      context.read<CustomerCodeBloc>().state.customerCodeInfo,
                  shipToInfo: context.read<ShipToCodeBloc>().state.shipToInfo,
                  materialInfo: itemInfo.info,
                  defaultSelectedTenderContract: _getSelectedTenderContract(
                    context,
                    itemInfo.info.materialNumber,
                  ),
                ),
              );
        }
      }
    });

    final items = orderHistoryDetails.allOrderHistoryDetailsOrderItemQueryInfo
        .map<PriceAggregate>((queryInfo) {
      final itemInfo = state.materialDetails[queryInfo];
      if (itemInfo != null) {
        return _addToCart(
          context: context,
          itemInfo: itemInfo,
          queryInfo: queryInfo,
        );
      }

      return PriceAggregate.empty();
    }).toList();

    context.read<CartBloc>().add(CartEvent.replaceWithOrderItems(
          items: items.map((e) => CartItem.material(e)).toList(),
          customerCodeInfo: eligibilityState.customerCodeInfo,
          salesOrganisationConfigs: eligibilityState.salesOrgConfigs,
          salesOrganisation: eligibilityState.salesOrganisation,
          shipToInfo: context.read<ShipToCodeBloc>().state.shipToInfo,
          doNotallowOutOfStockMaterial:
              eligibilityState.doNotAllowOutOfStockMaterials,
        ));

    context.router.pushNamed('cart_page');
  }

  @override
  Widget build(BuildContext context) {
    if (!context.read<UserBloc>().state.userCanCreateOrder) {
      return const SizedBox.shrink();
    }

    return BlocBuilder<TenderContractBloc, TenderContractState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return fromTopMenu
            ? state.isFetching
                ? TextButtonShimmer(
                    key: const ValueKey('reorder'),
                    title: 'Reorder'.tr(),
                  )
                : TextButton(
                    key: const ValueKey('addToCartPressed'),
                    onPressed: () => _addToCartPressed(
                      context,
                      context.read<MaterialPriceDetailBloc>().state,
                      orderHistoryItem,
                    ),
                    child: Text(
                      'Reorder'.tr(),
                      style: const TextStyle(
                        color: ZPColors.kPrimaryColor,
                      ),
                    ),
                  )
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  key: const ValueKey('reOrderButton'),
                  onPressed: () => _addToCartPressed(
                    context,
                    context.read<MaterialPriceDetailBloc>().state,
                    orderHistoryItem,
                  ),
                  child: LoadingShimmer.withChild(
                    enabled: state.isFetching,
                    child: const Text('Re-order').tr(),
                  ),
                ),
              );
      },
    );
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
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Order Summary'.tr(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w600),
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
                      : _ReOrder(
                          fromTopMenu: false,
                          orderHistoryItem: orderHistoryItem,
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

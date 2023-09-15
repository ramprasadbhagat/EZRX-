//ignore_for_file: unused-code
//ignore_for_file: unused-class
//ignore_for_file: unused-files
import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/order_document_type.dart';
import 'package:ezrxmobile/presentation/core/confirm_clear_cart_dialog.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class OrderTypeSelector extends StatelessWidget {
  final bool hideReasonField;
  const OrderTypeSelector({
    Key? key,
    this.hideReasonField = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const Key('orderTypeSelector'),
      decoration: const BoxDecoration(
        color: ZPColors.secondaryBGColor,
      ),
      child: BlocBuilder<OrderDocumentTypeBloc, OrderDocumentTypeState>(
        buildWhen: (previous, current) =>
            previous.selectedOrderType != current.selectedOrderType ||
            previous.selectedReason != current.selectedReason,
        builder: (context, state) {
          if (state.uniqueOrderTypeList.isEmpty) {
            return const SizedBox.shrink();
          }

          return Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              _OrderTypeSelectorField(
                itemList: state.uniqueOrderTypeList,
                leadingText: 'Order Type',
                initialDropdownText: 'Please Select Order Type',
                dropDownTitle: 'Please select order type',
                orderDocumentTypeState: state,
                orderHistoryDetailsState:
                    context.read<ViewByOrderDetailsBloc>().state,
              ),
              if (!hideReasonField && state.isReasonFieldEnable)
                Container(
                  key: const Key('reasonField'),
                  margin: const EdgeInsets.only(top: 12),
                  child: _OrderTypeSelectorField(
                    itemList: state.reasonList,
                    leadingText: 'Reason',
                    initialDropdownText: 'Please Select Reason',
                    dropDownTitle: 'Please select order reason',
                    isReason: true,
                    orderDocumentTypeState: state,
                    orderHistoryDetailsState:
                        context.read<ViewByOrderDetailsBloc>().state,
                  ),
                ),
              const SizedBox(
                height: 8,
              ),
            ],
          );
        },
      ),
    );
  }
}

class _OrderTypeSelectorField extends StatelessWidget {
  final List<OrderDocumentType> itemList;
  final String leadingText;
  final String initialDropdownText;
  final String dropDownTitle;
  final OrderDocumentTypeState orderDocumentTypeState;
  final ViewByOrderDetailsState orderHistoryDetailsState;
  final bool isReason;
  const _OrderTypeSelectorField({
    Key? key,
    required this.itemList,
    required this.leadingText,
    this.initialDropdownText = '',
    required this.dropDownTitle,
    required this.orderDocumentTypeState,
    this.isReason = false,
    required this.orderHistoryDetailsState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FittedBox(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                leadingText,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: LoadingShimmer.withChild(
              enabled: orderDocumentTypeState.isSubmitting,
              child: Container(
                margin: const EdgeInsets.only(
                  left: 10,
                  right: 20,
                ),
                padding: const EdgeInsets.only(
                  left: 11,
                  right: 2,
                  top: 4,
                  bottom: 6,
                ),
                decoration: const BoxDecoration(
                  color: ZPColors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                child: InkWell(
                  key: const Key('orderDocumentTypedialog'),
                  onTap: () async => orderDocumentTypeState.isSubmitting
                      ? null
                      : await showOrderDocumentTypedialog(context: context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          displayItemText,
                          key: const Key('displayItemText'),
                          style: const TextStyle(
                            color: ZPColors.black,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Noto Sans',
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: ZPColors.lightGray,
                        size: 17,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String get displayItemText => isReason
      ? orderDocumentTypeState.isReasonSelected
          ? orderDocumentTypeState.selectedReason.displayReasonText
          : displayReasonText
      : orderDocumentTypeState.isOrderTypeSelected
          ? orderDocumentTypeState.selectedOrderType.documentType
              .getOrDefaultValue('')
          : initialDropdownText;

  String get displayReasonText {
    final orderReason = orderHistoryDetailsState
        .orderHistoryDetails.orderReason;
    final reasonList = orderDocumentTypeState.reasonList.firstWhere(
      (element) => element.orderReason == orderReason,
      orElse: () => orderDocumentTypeState.reasonList.first,
    );

    return '${reasonList.orderReason} : ${reasonList.description}';
  }

  void onOrderTypeSelected(
    BuildContext context,
    BuildContext childContext,
    OrderDocumentType type,
  ) {
    childContext.router.pop();
    final validationText = getValidationText(
      orderDocumentTypeState.selectedOrderType,
      type,
      context.read<CartBloc>().state,
    );
    if (orderDocumentTypeState.selectedOrderType.description !=
        type.description) {
      context.read<MaterialListBloc>().add(
            const MaterialListEvent.updateSearchKey(searchKey: ''),
          );
    }
    if ((context.read<CartBloc>().state.cartProducts.isEmpty ||
        validationText.isEmpty)) {
      context.read<OrderDocumentTypeBloc>().add(
            OrderDocumentTypeEvent.selectedOrderType(
              selectedOrderType: type,
              isReasonSelected: isReason,
            ),
          );
      _commercialToSpecialItem(context: context);
    } else {
      ConfirmClearDialog.show(
        context: context,
        title: validationText.first,
        description: validationText.last,
        onCancel: () {
          context.router.pop();
        },
        onConfirmed: () {
          _onConfirm(context: context, isReason: isReason, i: type);
        },
      );
    }
  }

  Future<void> showOrderDocumentTypedialog({
    required BuildContext context,
  }) async {
    await showDialog<void>(
      context: context,
      builder: (BuildContext ctx) {
        return PlatformAlertDialog(
          key: const ValueKey('orderDocumentTypeSectorDialog'),
          title: Text(dropDownTitle),
          actions: itemList.map<CupertinoActionSheetAction>((i) {
            final displayText = isReason
                ? i.displayReasonText
                : i.documentType.getOrDefaultValue('');

            final key = isReason
                ? i.displayReasonText
                : i.documentType.documentTypeCode;

            return CupertinoActionSheetAction(
              key: Key(displayText),
              child: Text(
                displayText,
                key: ValueKey('orderType$key'),
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              onPressed: () => onOrderTypeSelected(context, ctx, i),
            );
          }).toList(),
        );
      },
    );
  }

  //TODO : revisit and simplify
  void _commercialToSpecialItem({
    required BuildContext context,
  }) {
    final cartBloc = context.read<CartBloc>();
    if (cartBloc.state.cartProducts.isEmpty) return;

    // cartBloc.add(
    //   CartEvent.replaceWithOrderItems(
    //     items: specialItem,
    //     doNotallowOutOfStockMaterial:
    //         eligibilityState.doNotAllowOutOfStockMaterials,
    //   ),
    // );
  }
}

void _onConfirm({
  required BuildContext context,
  required bool isReason,
  required OrderDocumentType i,
}) {
  context.read<OrderDocumentTypeBloc>().add(
        OrderDocumentTypeEvent.selectedOrderType(
          selectedOrderType: i,
          isReasonSelected: isReason,
        ),
      );
}

List<String> getValidationText(
  OrderDocumentType initial,
  OrderDocumentType selected,
  CartState cartState,
) {
  final list = <String>[];
  final dialogContent = cartState.dialogContent(selected);
  if (initial != selected &&
      cartState.showDialog(selected) &&
      dialogContent.isNotEmpty) {
    list.add('Changing order type to ${selected.documentType.getOrCrash()}!');
    list.add(
      'Your cart includes $dialogContent materials, changing the order type will clear all items in your cart. Please confirm if you want to proceed',
    );
  }

  return list;
}

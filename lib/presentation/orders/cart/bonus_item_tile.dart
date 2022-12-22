import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/material_item_bonus.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/remarks_tile.dart';
import 'package:ezrxmobile/presentation/orders/cart/add_remark_dialog.dart';
import 'package:ezrxmobile/presentation/orders/cart/add_remarks_button.dart';
import 'package:ezrxmobile/presentation/orders/cart/edit_delete_dialog.dart';
import 'package:ezrxmobile/presentation/orders/create_order/quantity_input.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BonusItemTile extends StatefulWidget {
  const BonusItemTile({
    Key? key,
    required this.cartItem,
    required this.bonusItem,
    required this.isBonusOverrideEnable,
  }) : super(key: key);

  final bool isBonusOverrideEnable;
  final PriceAggregate cartItem;
  final MaterialItemBonus bonusItem;

  @override
  State<BonusItemTile> createState() => _BonusItemTileState();
}

class _BonusItemTileState extends State<BonusItemTile> {
  late TextEditingController quantityController;

  @override
  void initState() {
    super.initState();
    quantityController = TextEditingController(
      text: widget.bonusItem.qty.toString(),
    );
  }

  @override
  void dispose() {
    quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          margin: const EdgeInsets.all(6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(6),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              widget.bonusItem.materialDescription,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        ],
                      ),
                      // Text(
                      //   '${'Material type : '.tr()}Bonus',
                      //   style: Theme.of(context).textTheme.bodyText1?.apply(
                      //         color: ZPColors.lightGray,
                      //       ),
                      // ),
                      Text(
                        '${'Mat No : '.tr()}${widget.bonusItem.materialInfo.materialNumber.displayMatNo}',
                        style: Theme.of(context).textTheme.bodyText1?.apply(
                              color: ZPColors.lightGray,
                            ),
                      ),
                      // Text(
                      //   '${'Quantity: '.tr()}${widget.bonusItem.qty}',
                      //   style: Theme.of(context).textTheme.bodyText1?.apply(
                      //         color: ZPColors.lightGray,
                      //       ),
                      // ),
                      if (widget.cartItem.salesOrgConfig.expiryDateDisplay)
                        Text(
                          '${'Expiry Date : '.tr()}${widget.bonusItem.expiryDate.getExpiryDate}',
                          style: Theme.of(context).textTheme.bodyText1?.apply(
                                color: ZPColors.lightGray,
                              ),
                        ),
                      if (!widget.cartItem.salesOrgConfig.hideStockDisplay)
                        Text(
                          '${'In Stock : '.tr()}${widget.bonusItem.inStock}',
                          style: Theme.of(context).textTheme.bodyText1?.apply(
                                color: ZPColors.lightGray,
                              ),
                        ),
                      if (context
                          .read<SalesOrgBloc>()
                          .state
                          .configs
                          .enableRemarks)
                        widget.bonusItem.materialInfo.remarks.isNotEmpty
                            ? RemarksMessage(
                                message:
                                    '${'Remarks: '.tr()}${widget.bonusItem.materialInfo.remarks}',
                                showEditDeleteDialog: EditDeleteDialog(
                                  cartItem: widget.cartItem,
                                  bonusItem: widget.bonusItem.materialInfo,
                                  isBonus: true,
                                ),
                              )
                            : AddRemarksButton(
                                key: const Key('addRemarksBonus'),
                                onPressed: () {
                                  AddRemarkDialog.show(
                                    context: context,
                                    cartItem: widget.cartItem,
                                    isEdit: false,
                                    isBonus: true,
                                    bonusItem: widget.bonusItem.materialInfo,
                                  );
                                },
                              ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: QuantityInput(
                  isEnabled: widget.isBonusOverrideEnable,
                  quantityAddKey: const Key('addBonusFromCart'),
                  quantityDeleteKey: const Key('removeBonusFromCart'),
                  quantityTextKey: Key(
                    'itemCount${widget.bonusItem.qty}',
                  ),
                  controller: quantityController,
                  onFieldChange: (value) {
                    locator<CountlyService>().addCountlyEvent(
                      'changed_quantity',
                      segmentation: {
                        'materialNum': widget
                            .bonusItem.materialInfo.materialNumber
                            .getOrCrash(),
                      },
                    );
                    context.read<CartBloc>().add(
                          CartEvent.updateBonusItem(
                            bonusItemCount: value,
                            cartItem: widget.cartItem,
                            bonusItem: widget.bonusItem,
                            isUpdateFromCart: true,
                          ),
                        );
                  },
                  minusPressed: (value) {
                    locator<CountlyService>().addCountlyEvent(
                      'deduct_quantity',
                      segmentation: {
                        'materialNum':
                            widget.cartItem.getMaterialNumber.getOrCrash(),
                        'listPrice': widget.cartItem.listPrice,
                        'price': widget.cartItem.price.finalPrice.getOrCrash(),
                      },
                    );
                    context.read<CartBloc>().add(
                          CartEvent.updateBonusItem(
                            bonusItemCount: value,
                            cartItem: widget.cartItem,
                            bonusItem: widget.bonusItem,
                            isUpdateFromCart: true,
                          ),
                        );
                  },
                  addPressed: (value) {
                    locator<CountlyService>().addCountlyEvent(
                      'add_quantity',
                      segmentation: {
                        'materialNum':
                            widget.cartItem.getMaterialNumber.getOrCrash(),
                        'listPrice': widget.cartItem.listPrice,
                        'price': widget.cartItem.price.finalPrice.getOrCrash(),
                      },
                    );
                    context.read<CartBloc>().add(
                          CartEvent.updateBonusItem(
                            bonusItemCount: value,
                            cartItem: widget.cartItem,
                            bonusItem: widget.bonusItem,
                            isUpdateFromCart: true,
                          ),
                        );
                  },
                ),
              ),
            ],
          ),
        ),
        if (widget.isBonusOverrideEnable)
          Positioned(
            right: 0,
            top: -15,
            child: IconButton(
              key: const Key('deleteBonusFromCart'),
              onPressed: () {
                context.read<CartBloc>().add(
                      CartEvent.deleteBonusItem(
                        cartItem: widget.cartItem,
                        bonusItem: widget.bonusItem,
                        isUpdateFromCart: true,
                      ),
                    );
              },
              icon: const Icon(Icons.delete),
            ),
          ),
      ],
    );
  }
}

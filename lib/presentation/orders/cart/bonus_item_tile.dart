import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/material_item_bonus.dart';
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
    required this.bonusItem,
    required this.cartItem,
  }) : super(key: key);

  final MaterialItemBonus bonusItem;
  final PriceAggregate cartItem;

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
                      Text(
                        'Expiry Data :-'.tr(),
                        style: const TextStyle(
                          color: ZPColors.lightGray,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'In Stock :'.tr(),
                        style: const TextStyle(
                          color: ZPColors.lightGray,
                          fontSize: 12,
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
                  quantityAddKey: const Key('addBonusFromCart'),
                  quantityDeleteKey: const Key('removeBonusFromCart'),
                  quantityTextKey: Key(
                    'itemCount${widget.bonusItem.qty}',
                  ),
                  controller: quantityController,
                  onFieldChange: (value) {
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

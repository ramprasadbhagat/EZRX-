import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_item_bonus.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/orders/cart/remark/add_remark_button.dart';
import 'package:ezrxmobile/presentation/orders/cart/remark/add_remark_dialog.dart';
import 'package:ezrxmobile/presentation/orders/cart/remark/cart_item_remark.dart';
import 'package:ezrxmobile/presentation/orders/cart/remark/update_remark_dialog.dart';
import 'package:ezrxmobile/presentation/orders/create_order/quantity_input.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BonusItemTile extends StatefulWidget {
  const BonusItemTile({
    Key? key,
    required this.material,
    required this.bonusItem,
    required this.isBonusOverrideEnable,
    required this.cartItem,
  }) : super(key: key);

  final bool isBonusOverrideEnable;
  final PriceAggregate material;
  final CartItem cartItem;
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
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                        ],
                      ),
                      // Text(
                      //   '${'Material type : '.tr()}Bonus',
                      //   style: Theme.of(context).textTheme.titleSmall?.apply(
                      //         color: ZPColors.lightGray,
                      //       ),
                      // ),
                      Text(
                        '${'Mat No : '.tr()}${widget.bonusItem.materialInfo.materialNumber.displayMatNo}',
                        style: Theme.of(context).textTheme.titleSmall?.apply(
                              color: ZPColors.lightGray,
                            ),
                      ),
                      // Text(
                      //   '${'Quantity: '.tr()}${widget.bonusItem.qty}',
                      //   style: Theme.of(context).textTheme.titleSmall?.apply(
                      //         color: ZPColors.lightGray,
                      //       ),
                      // ),
                      if (widget.material.salesOrgConfig.expiryDateDisplay)
                        Text(
                          '${'Expiry Date : '.tr()}${widget.bonusItem.expiryDate.naIfEmptyDateTime}',
                          style: Theme.of(context).textTheme.titleSmall?.apply(
                                color: ZPColors.lightGray,
                              ),
                        ),
                      if (!widget.material.salesOrgConfig.hideStockDisplay)
                        Text(
                          '${'In Stock : '.tr()}${widget.bonusItem.inStock}',
                          style: Theme.of(context).textTheme.titleSmall?.apply(
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
                                  onDelete: () {
                                    context.read<CartBloc>().add(
                                          CartEvent.addRemarkToBonusItem(
                                            bonusItem: widget.bonusItem,
                                            item: widget.cartItem,
                                            message: '',
                                          ),
                                        );
                                  },
                                  onEdit: () {
                                    AddRemarkDialog.bonusItem(
                                      context: context,
                                      cartItem: widget.cartItem,
                                      bonusItem: widget.bonusItem,
                                      isEdit: true,
                                    );
                                  },
                                ),
                              )
                            : AddRemarksButton(
                                key: const Key('addRemarksBonus'),
                                onPressed: () {
                                  AddRemarkDialog.bonusItem(
                                    context: context,
                                    cartItem: widget.cartItem,
                                    bonusItem: widget.bonusItem,
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
                          CartEvent.addBonusToCartItem(
                            item: widget.cartItem,
                            overrideQty: true,
                            bonusItem: widget.bonusItem.copyWith(qty: value),
                            customerCodeInfo: context
                                .read<CustomerCodeBloc>()
                                .state
                                .customerCodeInfo,
                            doNotallowOutOfStockMaterial: context
                                .read<EligibilityBloc>()
                                .state
                                .doNotAllowOutOfStockMaterials,
                            salesOrganisation: context
                                .read<SalesOrgBloc>()
                                .state
                                .salesOrganisation,
                            salesOrganisationConfigs:
                                context.read<SalesOrgBloc>().state.configs,
                            shipToInfo:
                                context.read<ShipToCodeBloc>().state.shipToInfo,
                          ),
                        );
                  },
                  minusPressed: (value) {
                    locator<CountlyService>().addCountlyEvent(
                      'deduct_quantity',
                      segmentation: {
                        'materialNum':
                            widget.material.getMaterialNumber.getOrCrash(),
                        'listPrice': widget.material.listPrice,
                        'price': widget.material.price.finalPrice.getOrCrash(),
                      },
                    );
                    context.read<CartBloc>().add(
                          CartEvent.addBonusToCartItem(
                            item: widget.cartItem,
                            bonusItem: widget.bonusItem.copyWith(qty: -1),
                            customerCodeInfo: context
                                .read<CustomerCodeBloc>()
                                .state
                                .customerCodeInfo,
                            doNotallowOutOfStockMaterial: context
                                .read<EligibilityBloc>()
                                .state
                                .doNotAllowOutOfStockMaterials,
                            salesOrganisation: context
                                .read<SalesOrgBloc>()
                                .state
                                .salesOrganisation,
                            salesOrganisationConfigs:
                                context.read<SalesOrgBloc>().state.configs,
                            shipToInfo:
                                context.read<ShipToCodeBloc>().state.shipToInfo,
                          ),
                        );
                  },
                  addPressed: (value) {
                    locator<CountlyService>().addCountlyEvent(
                      'add_quantity',
                      segmentation: {
                        'materialNum':
                            widget.material.getMaterialNumber.getOrCrash(),
                        'listPrice': widget.material.listPrice,
                        'price': widget.material.price.finalPrice.getOrCrash(),
                      },
                    );

                    context.read<CartBloc>().add(
                          CartEvent.addBonusToCartItem(
                            item: widget.cartItem,
                            bonusItem: widget.bonusItem.copyWith(qty: 1),
                            customerCodeInfo: context
                                .read<CustomerCodeBloc>()
                                .state
                                .customerCodeInfo,
                            doNotallowOutOfStockMaterial: context
                                .read<EligibilityBloc>()
                                .state
                                .doNotAllowOutOfStockMaterials,
                            salesOrganisation: context
                                .read<SalesOrgBloc>()
                                .state
                                .salesOrganisation,
                            salesOrganisationConfigs:
                                context.read<SalesOrgBloc>().state.configs,
                            shipToInfo:
                                context.read<ShipToCodeBloc>().state.shipToInfo,
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
                      CartEvent.removeBonusFromCartItem(
                        item: widget.cartItem,
                        bonusItem: widget.bonusItem,
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

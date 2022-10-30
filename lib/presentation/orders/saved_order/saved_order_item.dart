import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/application/order/saved_order/saved_order_bloc.dart';
import 'package:ezrxmobile/application/order/valid_customer_material/valid_customer_material_bloc.dart';
import 'package:ezrxmobile/application/order/valid_customer_material/valid_customer_material_view_model.dart';
import 'package:ezrxmobile/domain/order/entities/material_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/domain/order/entities/saved_order.dart';
import 'package:ezrxmobile/presentation/orders/saved_order/saved_order_material_item.dart';
import 'package:ezrxmobile/presentation/orders/saved_order/saved_order_material_item_shimmer.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedOrderItem extends StatelessWidget {
  const SavedOrderItem({
    Key? key,
    required this.order,
  }) : super(key: key);

  final SavedOrder order;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ValidCustomerMaterialBloc, ValidCustomerMaterialState>(
      listenWhen: (previous, current) =>
          previous.validatingStatusById(order.id) !=
              current.validatingStatusById(order.id) &&
          current.validatingStatusById(order.id) != ValidatingStatus.loading,
      listener: (context, state) async {
        if (state.validatingStatusById(order.id) == ValidatingStatus.success) {
          context.read<MaterialPriceDetailBloc>().add(
                MaterialPriceDetailEvent.fetch(
                  customerCode:
                      context.read<CustomerCodeBloc>().state.customerCodeInfo,
                  salesOrganisation:
                      context.read<SalesOrgBloc>().state.salesOrganisation,
                  salesOrganisationConfigs:
                      context.read<SalesOrgBloc>().state.configs,
                  shipToCode: context.read<ShipToCodeBloc>().state.shipToInfo,
                  materialInfos: order
                      .validMaterialItems(
                        state.validMaterialNumberById(
                          order.id,
                        ),
                      )
                      .map(
                        (item) => MaterialQueryInfo.fromSavedOrder(
                          orderMaterial: item,
                        ),
                      )
                      .toList(),
                ),
              );
          final invalidMaterialNumbers = state.filterInvalidMaterialNumber(
            order.itemMaterialNumbers,
          );
          if (invalidMaterialNumbers.isNotEmpty) {
            await invalidItemAlert(
              context,
              invalidMaterialNumbers,
            );
          }
        } else {
          //TODO: Show SnackBar when calling API failure
        }
      },
      child: Card(
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            onExpansionChanged: (isExpanded) {
              if (isExpanded) {
                final materialList = <MaterialItem>[...order.items];
                materialList.retainWhere(
                  (element) => !element.materialGroup4.isFOC,
                );
                final focMaterialList = <MaterialItem>[...order.items];
                focMaterialList.retainWhere(
                  (element) => element.materialGroup4.isFOC,
                );
                context.read<ValidCustomerMaterialBloc>().add(
                      ValidCustomerMaterialEvent.validate(
                        validateId: order.id,
                        materialList: materialList
                            .map((MaterialItem e) => e.materialNumber)
                            .toList(),
                        focMaterialList: focMaterialList
                            .map((MaterialItem e) => e.materialNumber)
                            .toList(),
                        user: context.read<UserBloc>().state.user,
                        customerCodeInfo: context
                            .read<CustomerCodeBloc>()
                            .state
                            .customerCodeInfo,
                        salesOrganisation: context
                            .read<SalesOrgBloc>()
                            .state
                            .salesOrganisation,
                        shipToInfo:
                            context.read<ShipToCodeBloc>().state.shipToInfo,
                      ),
                    );
              }
            },
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            title: Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // 'Company Name: ${order.companyName.name}',
                      order.companyName.name,
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: ZPColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Order No: ${order.id}',
                      style: const TextStyle(
                        color: ZPColors.lightGray,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 15.0,
                      ),
                      maxLines: 1,
                    ),
                    Text(
                      'Sold To IDs: ${order.soldToParty.name}',
                      style: const TextStyle(
                        color: ZPColors.lightGray,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 15.0,
                      ),
                      maxLines: 1,
                    ),
                    Text(
                      'Ship To IDs: ${order.shipToParty.name}',
                      style: const TextStyle(
                        color: ZPColors.lightGray,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 15.0,
                      ),
                      maxLines: 1,
                    ),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          const TextSpan(
                            text: 'Order Value: ',
                            style: TextStyle(
                              color: ZPColors.lightGray,
                              fontSize: 15.0,
                            ),
                          ),
                          TextSpan(
                            text:
                                '${context.read<SalesOrgBloc>().state.configs.currency.code} ${order.totalOrderValue}',
                            style: const TextStyle(
                              color: ZPColors.darkerGreen,
                              fontSize: 13.0,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            childrenPadding: const EdgeInsets.only(left: 20, bottom: 15),
            children: [
              BlocBuilder<ValidCustomerMaterialBloc,
                  ValidCustomerMaterialState>(
                buildWhen: (previous, current) =>
                    previous.validatingStatusById(order.id) !=
                    current.validatingStatusById(order.id),
                builder: (context, state) {
                  switch (state.validatingStatusById(order.id)) {
                    case ValidatingStatus.success:
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...order
                              .validMaterialItems(
                                state.validMaterialNumberById(
                                  order.id,
                                ),
                              )
                              .map(
                                (item) => SavedOrderMaterialItem(
                                  material: item,
                                ),
                              )
                              .toList(),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  //TODO: Implement Add to cart
                                },
                                child: const Text('Add to Cart').tr(),
                              ),
                              const SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () {
                                  context.read<SavedOrderListBloc>().add(
                                        SavedOrderListEvent.delete(
                                          order: order,
                                          user: context
                                              .read<UserBloc>()
                                              .state
                                              .user,
                                        ),
                                      );
                                  // showPlatformDialog(
                                  //   context: context,
                                  //   barrierDismissible: true,
                                  //   builder: (context) => PlatformAlertDialog(
                                  //     title: const Text('Info').tr(),
                                  //     content: SingleChildScrollView(
                                  //       child: ListBody(
                                  //         children: <Widget>[
                                  //           const Text(
                                  //             'This action will delete the item from your saved orders.',
                                  //           ).tr(),
                                  //           const Text(
                                  //             'Do you want to proceed?',
                                  //           ).tr(),
                                  //         ],
                                  //       ),
                                  //     ),
                                  //     actions: [
                                  //       PlatformDialogAction(
                                  //         child: const Text('Cancel').tr(),
                                  //         onPressed: () {
                                  //           context.router.pop();
                                  //         },
                                  //       ),
                                  //       PlatformDialogAction(
                                  //         child: const Text('Confirm').tr(),
                                  //         onPressed: () {
                                  //           context.router.pop();
                                  //           context
                                  //               .read<SavedOrderListBloc>()
                                  //               .add(
                                  //                 SavedOrderListEvent.delete(
                                  //                   order: order,
                                  //                   user: context
                                  //                       .read<UserBloc>()
                                  //                       .state
                                  //                       .user,
                                  //                 ),
                                  //               );
                                  //         },
                                  //       ),
                                  //     ],
                                  //   ),
                                  // );
                                },
                                child: const Text('Delete').tr(),
                              ),
                            ],
                          ),
                        ],
                      );
                    case ValidatingStatus.failure:
                      //TODO: Create a retry button to call Valid API again
                      return const Text('Some error happens');

                    case ValidatingStatus.loading:
                      return const MaterialItemShimmer();

                    default:
                      return const SizedBox();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> invalidItemAlert(
    BuildContext context,
    List<String> allInValidMaterial,
  ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Info').tr(),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Text('These invalid items cannot be added to cart.').tr(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    allInValidMaterial.length,
                    (index) => Text(
                      allInValidMaterial.elementAt(index).substring(10),
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: ZPColors.darkGreen,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Confirm').tr(),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

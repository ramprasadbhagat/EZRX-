import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/valid_customer_material/valid_customer_material_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/domain/order/entities/saved_order.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';

class OrderTemplateItem extends StatelessWidget {
  const OrderTemplateItem({
    Key? key,
    required this.order,
  }) : super(key: key);

  final SavedOrder order;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ValidCustomerMaterialBloc, ValidCustomerMaterialState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) async {
        final allInValidMaterail =
            state.allInValidMaterail(order.allSavedOrderMaterialNumbers);
        if (allInValidMaterail.isNotEmpty) {
          await invalidItemAlert(context, allInValidMaterail);
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 5),
        child: Card(
          elevation: 1.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              10.0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(
              10.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${'Company Name'.tr()} : ${order.companyName.name}',
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
                  '${'Order No'.tr()} : ${order.id}',
                  style: const TextStyle(
                    color: ZPColors.lightGray,
                    overflow: TextOverflow.ellipsis,
                    fontSize: 15.0,
                  ),
                  maxLines: 1,
                ),
                Text(
                  '${'Sold to ID'.tr()} : ${order.soldToParty.name}',
                  style: const TextStyle(
                    color: ZPColors.lightGray,
                    overflow: TextOverflow.ellipsis,
                    fontSize: 15.0,
                  ),
                  maxLines: 1,
                ),
                Text(
                  '${'Ship to ID'.tr()} : ${order.shipToParty.name}',
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
                      TextSpan(
                        text: '${'Order Value'.tr()} : ',
                        style: const TextStyle(
                          color: ZPColors.lightGray,
                          fontSize: 15.0,
                        ),
                      ),
                      const TextSpan(
                        text: '\$',
                        style: TextStyle(
                          color: ZPColors.darkerGreen,
                          fontSize: 15.0,
                        ),
                      ),
                      TextSpan(
                        text: '${order.totalOrderValue}',
                        style: const TextStyle(
                          color: ZPColors.darkerGreen,
                          fontSize: 13.0,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(double.minPositive),
                    textStyle: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  onPressed: () {
                    final materialList = <MaterialItem>[...order.items];
                    materialList.retainWhere(
                      (element) => !element.materialGroup4.isFOC,
                    );
                    final focMaterialList = <MaterialItem>[...order.items];
                    focMaterialList.retainWhere(
                      (element) => element.materialGroup4.isFOC,
                    );
                    context
                        .read<ValidCustomerMaterialBloc>()
                        .add(ValidCustomerMaterialEvent.validate(
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
                        ));
                  },
                  child: const Text('Add to Cart').tr(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> invalidItemAlert(
    BuildContext context,
    List<String> allInValidMaterail,
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
                    allInValidMaterail.length,
                    (index) => Text(
                      allInValidMaterail.elementAt(index).substring(10),
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

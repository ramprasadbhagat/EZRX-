import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/order_template.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderTemplateDetailPage extends StatelessWidget {
  final OrderTemplate orderTemplateInfo;
  const OrderTemplateDetailPage({Key? key, required this.orderTemplateInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('OrderTemplateDetailPage'),
      backgroundColor: ZPColors.white,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60),
        child: AppBar(
          title: Text(orderTemplateInfo.templateName),
        ),
      ),
      body: ListView.builder(
        itemCount: orderTemplateInfo.cartItems.length,
        itemBuilder: (context, index) {
          final salesOrgConfigs = context.read<SalesOrgBloc>().state.configs;
          final defaultMaterialDescription = orderTemplateInfo
              .cartItems[index].materialInfo.defaultMaterialDescription;
          if (salesOrgConfigs.enableDefaultMD &&
              defaultMaterialDescription.isNotEmpty) {
            return Text(defaultMaterialDescription);
          }

          return Container();
        },
      ),
    );
  }
}

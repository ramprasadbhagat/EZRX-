part of 'package:ezrxmobile/presentation/account/customer_search/customer_search.dart';

class _DeliveryAddressItem extends StatelessWidget {
  final CustomerCodeInfo customerCodeInfo;

  const _DeliveryAddressItem({Key? key, required this.customerCodeInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return custom.ExpansionTile(
      initiallyExpanded: true,
      trailingWidgetPadding: 20,
      iconColor: ZPColors.textButtonColor,
      title: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: _TitleSection(
          prefixText: customerCodeInfo.customerCodeSoldTo,
          suffixText: customerCodeInfo.customerName.name1,
          titleColor: ZPColors.textButtonColor,
        ),
      ),
      children: [
        Column(
          children: customerCodeInfo.shipToInfos
              .map(
                (e) => _ShipToAddressSection(
                  shipToInfo: e,
                  customerCodeInfo: customerCodeInfo,
                ),
              )
              .toList(),
        ),
        const Divider(
          indent: 0,
          endIndent: 0,
          color: ZPColors.extraLightGrey2,
        ),
      ],
    );
  }
}

import 'package:ezrxmobile/domain/order/entities/saved_order.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class OrderTemplateItem extends StatelessWidget {
  const OrderTemplateItem({
    Key? key,
    required this.order,
  }) : super(key: key);

  final SavedOrder order;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                'Company Name: ${order.companyName.name}',
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
            ],
          ),
        ),
      ),
    );
  }
}

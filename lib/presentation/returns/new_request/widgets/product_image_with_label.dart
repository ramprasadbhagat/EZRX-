
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/icon_label.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class ProductImageWithLabel extends StatelessWidget {
  const ProductImageWithLabel({
    Key? key,
    required this.materialNumber,
  }) : super(key: key);

  final MaterialNumber materialNumber;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: ZPColors.lightGray2, width: 1.5),
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          child: ProductImage(
            width: MediaQuery.of(context).size.height * 0.1,
            height: MediaQuery.of(context).size.height * 0.1,
            fit: BoxFit.fitHeight,
            materialNumber: materialNumber,
            errorWidgetColor: ZPColors.white,
            errorWidgetPadding: const EdgeInsets.all(16),
          ),
        ),
        const IconLabel(
          icon: Icons.local_offer_outlined,
          backgroundColor: ZPColors.darkYellow,
          labelText: '',
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.fromLTRB(6, 2, 2, 2),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16.0),
            bottomRight: Radius.circular(16.0),
            topLeft: Radius.circular(8.0),
          ),
        ),
      ],
    );
  }
}

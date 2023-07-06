import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

class MaterialDescription extends StatefulWidget {
  const MaterialDescription({Key? key}) : super(key: key);

  @override
  State<MaterialDescription> createState() => _MaterialDescriptionState();
}

class _MaterialDescriptionState extends State<MaterialDescription> {
  bool seeMore = true;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      buildWhen: (previous, current) =>
          previous.productDetailAggregate.productItem !=
          current.productDetailAggregate.productItem,
      builder: (context, state) {
        if (!state.productDetailAggregate.productItem.promotionMaterial
            .isValid()) {
          return const SizedBox.shrink();
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Material description',
                style: Theme.of(context).textTheme.labelSmall,
              ).tr(),
              const SizedBox(height: 8.0),
              seeMore
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        child: Html(
                          key: WidgetKeys.materialDetailsPromoShort,
                          data: state.productDetailAggregate.productItem
                                .promotionMaterial
                              .getOrDefaultValue(''),
                        ),
                      ),
                    )
                  : Html(
                      key: WidgetKeys.materialDetailsPromo,
                      data: state
                          .productDetailAggregate.productItem.promotionMaterial
                          .getOrDefaultValue(''),
                    ),
              Row(
                key: WidgetKeys.materialDetailsPromoSeeMore,
                children: [
                  Expanded(
                    child: TextButton.icon(
                      onPressed: () => setState(() => seeMore = !seeMore),
                      label:
                          Icon(seeMore ? Icons.expand_more : Icons.expand_less),
                      icon: Text(
                        seeMore ? 'See more' : 'See less',
                      ).tr(),
                      style: TextButton.styleFrom(
                        visualDensity: VisualDensity.compact,
                        iconColor: ZPColors.extraDarkGreen,
                        foregroundColor: ZPColors.extraDarkGreen,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

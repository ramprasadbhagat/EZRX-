import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/product_detail_aggregate.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

class MaterialDetailsToggle extends StatefulWidget {
  const MaterialDetailsToggle({Key? key}) : super(key: key);

  @override
  State<MaterialDetailsToggle> createState() => _MaterialDetailsToggleState();
}

class _MaterialDetailsToggleState extends State<MaterialDetailsToggle> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      buildWhen: (previous, current) =>
          previous.productDetailAggregate.productItem !=
          current.productDetailAggregate.productItem,
      builder: (context, state) {
        if (!state.productDetailAggregate.productDetailsAvailable) {
          return const SizedBox.shrink();
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedCrossFade(
                firstChild: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        ZPColors.white.withOpacity(1.0),
                        ZPColors.white.withOpacity(0.0),
                      ],
                      stops: const [0.5, 1.0],
                    ).createShader(bounds);
                  },
                  blendMode: BlendMode.dstIn,
                  child: SizedBox(
                    height: 100,
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: _MaterialDetails(
                        productDetailAggregate: state.productDetailAggregate,
                      ),
                    ),
                  ),
                ),
                secondChild: _MaterialDetails(
                  productDetailAggregate: state.productDetailAggregate,
                ),
                crossFadeState: expanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 100),
              ),
              Row(
                key: WidgetKeys.materialDetailsPromoSeeMore,
                children: [
                  Expanded(
                    child: TextButton.icon(
                      onPressed: () => setState(() => expanded = !expanded),
                      label: Icon(
                        expanded ? Icons.expand_less : Icons.expand_more,
                      ),
                      icon: Text(
                        expanded ? 'See less' : 'See more',
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

class _MaterialDetails extends StatelessWidget {
  final ProductDetailAggregate productDetailAggregate;
  const _MaterialDetails({
    Key? key,
    required this.productDetailAggregate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productItemXp = productDetailAggregate.productItem.productItemXp;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _HtmlContent(
          title: 'Material description',
          data: productDetailAggregate.materialInfo.productImages.description,
        ),
        _MaterialMetaData(
          title: 'Dosage',
          content: productItemXp.dosage,
        ),
        _MaterialMetaData(
          title: 'How to use',
          content: productItemXp.howToUse,
        ),
        _MaterialMetaData(
          title: 'Composition',
          content: productItemXp.composition,
        ),
        _MaterialMetaData(
          title: 'Delivery instructions',
          content: productItemXp.deliveryInstructions,
        ),
        _HtmlContent(
          key: WidgetKeys.materialDetailsPromo,
          title: '',
          data: productDetailAggregate.productItem.promotionMaterial,
        ),
      ],
    );
  }
}

class _MaterialMetaData extends StatelessWidget {
  final String title;
  final StringValue content;
  const _MaterialMetaData({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return content.isValid()
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title.tr(),
                style: Theme.of(context).textTheme.labelSmall,
              ).tr(),
              const SizedBox(height: 8.0),
              Text(
                content.getOrDefaultValue(''),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: ZPColors.extraLightGrey4,
                    ),
              ),
              const SizedBox(height: 16),
            ],
          )
        : const SizedBox.shrink();
  }
}

class _HtmlContent extends StatelessWidget {
  final String title;
  final StringValue data;
  const _HtmlContent({
    Key? key,
    required this.title,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => data.isValid()
      ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title.tr(),
              style: Theme.of(context).textTheme.labelSmall,
            ).tr(),
            Html(
              key: WidgetKeys.materialDetailsPromo,
              data: data.getOrDefaultValue(''),
            ),
            const SizedBox(height: 16),
          ],
        )
      : const SizedBox.shrink();
}

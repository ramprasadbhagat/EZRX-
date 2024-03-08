import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductStockInfo extends StatelessWidget {
  final MaterialNumber materialNumber;
  const ProductStockInfo({
    Key? key,
    required this.materialNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      buildWhen: (previous, current) =>
          current.productDetailAggregate.stockInfo !=
              previous.productDetailAggregate.stockInfo ||
          current.isDetailAndStockFetching != previous.isDetailAndStockFetching,
      builder: (context, state) {
        final eligibilityState = context.read<EligibilityBloc>().state;

        if (state.isDetailAndStockFetching) {
          return SizedBox(
            width: 100,
            child: LoadingShimmer.tile(),
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: RichText(
            key: WidgetKeys.materialDetailsStock,
            text: TextSpan(
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: ZPColors.darkGray),
              children: [
                if (eligibilityState.salesOrg.showBatchNumber)
                  TextSpan(
                    text:
                        '${context.tr('Batch')}: ${state.displayBatchNumber} ',
                  ),
                if (eligibilityState.salesOrgConfigs.expiryDateDisplay) ...[
                  TextSpan(
                    text: '(${context.tr('EXP')}: ${state.displayExpiryDate})',
                  ),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: IconButton(
                      key: WidgetKeys.expiryDateInfoIcon,
                      splashRadius: 15,
                      constraints: const BoxConstraints(),
                      padding: EdgeInsets.zero,
                      onPressed: () => showModalBottomSheet(
                        context: context,
                        builder: (context) => const _ExpiryDateInstruction(),
                      ),
                      icon: const Icon(Icons.info, size: 18),
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ExpiryDateInstruction extends StatelessWidget {
  const _ExpiryDateInstruction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          key: WidgetKeys.expiryDateInstructionSheet,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              context.tr('Expiry date'),
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: ZPColors.primary,
                    fontSize: 20,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              '${context.tr('Expiry date displayed is for reference, actual product may vary')}.',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: ZPColors.neutralsGrey1,
                  ),
            ),
            const SizedBox(height: 35),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                key: WidgetKeys.closeButton,
                onPressed: () => context.router.pop(),
                child: Text(context.tr('Got it')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StockInfoWidget extends StatelessWidget {
  final StockInfo stockInfo;
  final MaterialInfo materialInfo;
  const StockInfoWidget({
    required this.stockInfo,
    required this.materialInfo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;
    final enableBatchNumber =
        eligibilityState.salesOrgConfigs.enableBatchNumber;
    if (eligibilityState.salesOrgConfigs.displayStockInfo) {
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
              if (enableBatchNumber)
                TextSpan(
                  text:
                      '${context.tr('Batch')}: ${stockInfo.displayBatchNumber(isMarketPlace: materialInfo.isMarketPlace)}',
                ),
              if (eligibilityState.salesOrgConfigs.expiryDateDisplay) ...[
                if (enableBatchNumber) const TextSpan(text: ' - '),
                TextSpan(
                  text: '${context.tr('EXP')}: ${stockInfo.displayExpiryDate(
                    isMarketPlace: materialInfo.isMarketPlace,
                    isPhMdi: eligibilityState.salesOrg.isPhMdi,
                    isAbbotPrincipalCode:
                        materialInfo.principalData.principalCode.isAbbot,
                  )}',
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
    }

    return const SizedBox.shrink();
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

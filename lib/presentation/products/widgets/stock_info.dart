import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/presentation/core/info_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/core/info_icon.dart';
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
                  child: InfoIcon(
                    key: WidgetKeys.expiryDateInfoIcon,
                    onTap: () => showModalBottomSheet(
                      context: context,
                      builder: (context) => InfoBottomSheet(
                        key: WidgetKeys.expiryDateInstructionSheet,
                        title: context.tr('Expiry date'),
                        description:
                            '${context.tr('Expiry date displayed is for reference, actual product may vary')}.',
                        buttonTitle: context.tr('Got it'),
                      ),
                    ),
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

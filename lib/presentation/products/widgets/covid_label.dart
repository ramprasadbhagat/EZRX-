import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CovidLabel extends StatelessWidget {
  final MaterialInfo materialInfo;
  final BorderRadius? borderRadius;
  final EdgeInsets padding;

  const CovidLabel({
    required this.materialInfo,
    this.borderRadius,
    this.padding = const EdgeInsets.all(5),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.read<EligibilityBloc>().state.isCovidMaterialEnable &&
            materialInfo.isFOCMaterial
        ? Container(
            padding: padding,
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: ZPColors.invoiceStatusBlue,
              borderRadius: borderRadius,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  SvgImage.coronavirus,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'Covid-19'.tr(),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: ZPColors.skyBlueColor,
                      ),
                ),
              ],
            ),
          )
        : const SizedBox.shrink();
  }
}

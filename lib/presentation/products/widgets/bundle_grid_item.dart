import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BundleGridItem extends StatelessWidget {
  final MaterialInfo materialInfo;

  const BundleGridItem({
    required this.materialInfo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _bundleOnTap(context, materialInfo),
      child: CustomCard(
        key: WidgetKeys.materialListBundleCard,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            Container(
              color: ZPColors.blueTagColor,
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 10.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    materialInfo.materialNumber.displayMatNo,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: ZPColors.darkGray,
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      materialInfo.displayDescription,
                      style: Theme.of(context).textTheme.labelSmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    materialInfo.manufactured,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: ZPColors.darkGray,
                          fontSize: 10,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Column(
              children: materialInfo.listingVisibleMaterial
                  .map((e) => _BundleMaterial(materialData: e))
                  .toList(),
            ),
            materialInfo.isMaterialHiddenOnListing
                ? Text(
                    '+ ${materialInfo.data.skip(5).length} materials',
                    style: Theme.of(context).textTheme.bodySmall,
                    maxLines: 1,
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  void _bundleOnTap(BuildContext context, MaterialInfo materialInfo) {
    final eligibilityBlocState = context.read<EligibilityBloc>().state;
    context.read<ProductDetailBloc>().add(
          ProductDetailEvent.fetch(
            materialNumber: materialInfo.materialNumber,
            salesOrganisation: eligibilityBlocState.salesOrganisation,
            customerCodeInfo: eligibilityBlocState.customerCodeInfo,
            shipToInfo: eligibilityBlocState.shipToInfo,
            locale: context.locale,
            type: materialInfo.type,
          ),
        );
    context.router.pushNamed('orders/bundle_detail_page');
  }
}

class _BundleMaterial extends StatelessWidget {
  final MaterialData materialData;

  const _BundleMaterial({
    required this.materialData,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      key: WidgetKeys.materialListBundleMaterial(
        materialData.code.getOrDefaultValue(''),
      ),
      children: [
        CustomCard(
          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
          showShadow: false,
          showBorder: true,
            child: ProductImage(
            materialNumber: materialData.code,
            height: MediaQuery.of(context).size.height * 0.03,
            width: MediaQuery.of(context).size.height * 0.03,
            fit: BoxFit.contain,
          ),
        ),
        Expanded(
          child: Text(
            materialData.displayDescription,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}

part of 'package:ezrxmobile/presentation/products/products_tab.dart';

class _BundleGridItem extends StatelessWidget {
  final MaterialInfo materialInfo;

  const _BundleGridItem({
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
            ColoredBox(
              color: ZPColors.blueTagColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _BundleLabel(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 5.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          materialInfo.materialNumber.displayMatNo,
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: ZPColors.darkGray,
                                  ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          materialInfo.displayDescription,
                          style: Theme.of(context).textTheme.labelSmall,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 3),
                        Text(
                          materialInfo.manufactured,
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: ZPColors.darkGray,
                                    fontSize: 10,
                                  ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 3),
                      ],
                    ),
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
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      '+ ${materialInfo.data.skip(4).length} materials',
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 1,
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  void _bundleOnTap(BuildContext context, MaterialInfo materialInfo) {
    context.read<ProductDetailBloc>().add(
          ProductDetailEvent.fetch(
            materialNumber: materialInfo.materialNumber,
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
      crossAxisAlignment: CrossAxisAlignment.start,
      key: WidgetKeys.materialListBundleMaterial(
        materialData.materialNumber.getOrDefaultValue(''),
      ),
      children: [
        CustomCard(
          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
          showShadow: false,
          showBorder: true,
          child: ProductImage(
            materialNumber: materialData.materialNumber,
            height: MediaQuery.of(context).size.height * 0.03,
            width: MediaQuery.of(context).size.height * 0.03,
            fit: BoxFit.contain,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Text(
              materialData.displayDescription,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style:
                  Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 10),
            ),
          ),
        ),
      ],
    );
  }
}

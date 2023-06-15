import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class LoadingShimmerGridItem extends StatelessWidget {
  const LoadingShimmerGridItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      children: List.generate(
        8,
        (index) => const _MaterialLoading(),
      ),
    );
  }
}

class _MaterialLoading extends StatelessWidget {
  const _MaterialLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      key: WidgetKeys.materialListMaterialCard,
      margin: const EdgeInsets.all(10),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.45,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LoadingShimmer.withChild(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8.0),
                    topLeft: Radius.circular(8.0),
                  ),
                  color: ZPColors.white,
                ),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LoadingShimmer.withChild(
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.02,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: ZPColors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  LoadingShimmer.withChild(
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.06,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: ZPColors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  LoadingShimmer.withChild(
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.01,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: ZPColors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  LoadingShimmer.withChild(
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.02,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: ZPColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

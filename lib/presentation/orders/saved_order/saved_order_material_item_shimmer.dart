import 'package:ezrxmobile/presentation/core/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class MaterialItemShimmer extends StatelessWidget {
  const MaterialItemShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: const Key('material-item-shimmer'),
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: ZPColors.darkGray,
                  width: 2.0,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LoadingShimmer.tile(),
                SizedBox(
                  width: 200,
                  child: LoadingShimmer.tile(),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 120,
                      child: LoadingShimmer.tile(),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 100,
                      child: LoadingShimmer.tile(),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 90,
                      child: LoadingShimmer.tile(),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 100,
                      child: LoadingShimmer.tile(),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 10,
                      child: LoadingShimmer.tile(),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 60,
                      child: LoadingShimmer.tile(),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              LoadingShimmer.withChild(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const SizedBox(),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              LoadingShimmer.withChild(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const SizedBox(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

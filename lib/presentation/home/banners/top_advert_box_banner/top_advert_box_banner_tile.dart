import 'package:cached_network_image/cached_network_image.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:flutter/material.dart';

class TopAdvertBoxBannerTile extends StatelessWidget {
  final String imageUrl;
  const TopAdvertBoxBannerTile({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 3),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          placeholder: (context, url) => LoadingShimmer.logo(),
          errorWidget: (context, url, error) =>
              url.isEmpty ? LoadingShimmer.logo() : const Icon(Icons.error),
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }
}

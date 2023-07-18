import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class FavouriteIcon extends StatelessWidget {
  final bool isFavourite;
  final VisualDensity? visualDensity;
  final VoidCallback onTap;
  final BoxConstraints? constraints;
  const FavouriteIcon({
    Key? key,
    required this.isFavourite,
    this.visualDensity,
    required this.onTap,
    this.constraints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      visualDensity: visualDensity,
      padding: EdgeInsets.zero,
      constraints: constraints,
      icon: Icon(
        isFavourite ? Icons.favorite : Icons.favorite_border_outlined,
        color: ZPColors.darkYellow,
      ),
    );
  }
}

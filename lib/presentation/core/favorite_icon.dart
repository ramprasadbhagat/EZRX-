import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class FavouriteIcon extends StatelessWidget {
  final bool isFavourite;
  final VoidCallback onTap;
  const FavouriteIcon({
    Key? key,
    required this.isFavourite,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        isFavourite
            ? Icons.favorite
            : Icons.favorite_border_outlined,
        color: ZPColors.darkYellow,
      ),
    );
  }
}

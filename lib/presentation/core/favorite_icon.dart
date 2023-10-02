import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class FavouriteIcon extends StatelessWidget {
  final bool isFavourite;
  final VisualDensity? visualDensity;
  final VoidCallback onTap;
  final BoxConstraints? constraints;
  final bool enable;
  const FavouriteIcon({
    Key? key,
    required this.isFavourite,
    this.visualDensity,
    required this.onTap,
    this.constraints,
    this.enable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: enable ? ZPColors.transparent : ZPColors.lightGray,
      onPressed: enable ? null : onTap,
      visualDensity: visualDensity,
      padding: EdgeInsets.zero,
      constraints: constraints,
      key: WidgetKeys.favoritesIcon,
      icon: Icon(
        isFavourite ? Icons.favorite : Icons.favorite_border_outlined,
        color: ZPColors.darkYellow,
        key: WidgetKeys.statusFavoriteIcon(isFavourite),
      ),
    );
  }
}

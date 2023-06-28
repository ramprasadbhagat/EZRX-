import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as bd;

class CustomBadge extends StatelessWidget {
  final int count;
  final Color badgeColor;
  final IconData iconData;
  final VoidCallback onPressed;
  const CustomBadge(
    this.iconData, {
    Key? key,
    required this.badgeColor,
    required this.count,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bd.Badge(
      badgeContent: Text(
        count.toString(),
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontSize: 10,
              color: ZPColors.white,
            ),
      ),
      badgeColor: ZPColors.orange,
      showBadge: count > 0,
      elevation: 0,
      position: bd.BadgePosition.topEnd(top: 0, end: 0),
      animationType: bd.BadgeAnimationType.fade,
      child: IconButton(
        visualDensity: VisualDensity.compact,
        icon: Icon(
          iconData,
        ),
        onPressed: onPressed,
      ),
    );
  }
}

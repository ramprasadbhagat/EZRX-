import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class FavouriteIcon extends StatelessWidget {
  const FavouriteIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: const Padding(
        padding: EdgeInsets.all(5.0),
        child: Icon(
          Icons.favorite_border,
          color: ZPColors.darkYellow,
        ),
      ),
    );
  }
}

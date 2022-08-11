import 'package:flutter/material.dart';

class BannerTile extends StatelessWidget {
  const BannerTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.asset(
          'assets/images/5570586.jpg',
          repeat: ImageRepeat.noRepeat,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
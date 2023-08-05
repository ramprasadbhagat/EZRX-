import 'package:flutter/material.dart';

class KRBannerTile extends StatelessWidget {
  final String image;
  final bool fullWidth;
  const KRBannerTile({
    Key? key,
    required this.image,
    this.fullWidth = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: fullWidth
          ? const EdgeInsets.only(top: 20)
          : const EdgeInsets.symmetric(horizontal: 16.0, vertical: 3),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }
}

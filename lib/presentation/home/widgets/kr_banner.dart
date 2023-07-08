import 'package:flutter/material.dart';

class KRBanners extends StatelessWidget {
  const KRBanners({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(height: 25),
        _KRAds(
          image: 'assets/images/kr_ad_1.png',
        ),
        _KRAds(
          image: 'assets/images/kr_ad_2.png',
        ),
        _KRAds(
          image: 'assets/images/kr_ad_3.png',
        ),
        SizedBox(height: 20),
        _KRAds(
          image: 'assets/images/kr_ad_4.png',
          fullWidth: true,
        ),
        SizedBox(height: 25),
      ],
    );
  }
}

class _KRAds extends StatelessWidget {
  final String image;
  final bool fullWidth;
  const _KRAds({
    Key? key,
    required this.image,
    this.fullWidth = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: fullWidth
          ? EdgeInsets.zero
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

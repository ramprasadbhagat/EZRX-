import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class FavoritesTab extends StatelessWidget {
  const FavoritesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: const Text('Favorites').tr()),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProductsTab extends StatelessWidget {
  const ProductsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: const Key('productsPage'),
        title: const Text('Products').tr(),
        automaticallyImplyLeading: false,
      ),
      body: Container(),
    );
  }
}

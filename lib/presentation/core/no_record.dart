import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class NoRecordFound {
  static Widget showMessage({
    String message = 'No customer found',
    IconData iconData = Icons.search_off_outlined,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(iconData, size: 80),
        Text(message).tr(),
      ],
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class InvalidMaterialNumberDialog {
  static Future show({
    required BuildContext context,
    required List<String> invalidMaterialNumbers,
  }) async =>
      showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Info').tr(),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  const Text('These invalid items cannot be added to cart.')
                      .tr(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      invalidMaterialNumbers.length,
                      (index) => Text(
                        invalidMaterialNumbers.elementAt(index).substring(10),
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: ZPColors.darkGreen,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Confirm').tr(),
                onPressed: () {
                  context.router.pop();
                },
              ),
            ],
          );
        },
      );
}

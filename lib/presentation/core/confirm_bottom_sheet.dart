import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class ConfirmBottomSheet extends StatelessWidget {
  final String title;
  final String content;
  final String cancelButtonText;
  final String confirmButtonText;
  const ConfirmBottomSheet({
    Key? key,
    required this.title,
    required this.content,
    this.cancelButtonText = 'Cancel',
    this.confirmButtonText = 'Confirm',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(
          20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title.tr(),
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: ZPColors.primary, fontSize: 20),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              content.tr(),
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.extraLightGrey4,
                  ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    style:
                        Theme.of(context).elevatedButtonTheme.style!.copyWith(
                              backgroundColor: const MaterialStatePropertyAll(
                                ZPColors.white,
                              ),
                              shape: const MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  side: BorderSide(color: ZPColors.primary),
                                ),
                              ),
                            ),
                    child: Text(
                      cancelButtonText.tr(),
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: ZPColors.primary,
                          ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16.0,
                ),
                Expanded(
                  child: ElevatedButton(
                    key: WidgetKeys.confirmBottomSheetConfirmButton,
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    style:
                        Theme.of(context).elevatedButtonTheme.style!.copyWith(
                              backgroundColor: const MaterialStatePropertyAll(
                                ZPColors.primary,
                              ),
                              shape: const MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  side: BorderSide(color: ZPColors.primary),
                                ),
                              ),
                            ),
                    child: Text(
                      confirmButtonText.tr(),
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: ZPColors.white,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

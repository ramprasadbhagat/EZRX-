import 'package:ezrxmobile/presentation/core/uuid_description_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class QueueNumberInfoIcon extends StatelessWidget {
  final Color iconColor;
  const QueueNumberInfoIcon({Key? key, this.iconColor = ZPColors.primary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      constraints: const BoxConstraints(),
      padding: const EdgeInsets.only(left: 4),
      onPressed: () => showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: false,
        builder: (_) => const UuidDescriptionBottomSheet(),
      ),
      color: iconColor,
      icon: const Icon(Icons.info, size: 20),
    );
  }
}

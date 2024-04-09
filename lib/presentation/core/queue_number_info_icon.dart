import 'package:ezrxmobile/presentation/core/uuid_description_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class QueueNumberInfoIcon extends StatelessWidget {
  final Color iconColor;
  const QueueNumberInfoIcon({Key? key, this.iconColor = ZPColors.primary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          isDismissible: false,
          builder: (_) => const UuidDescriptionBottomSheet(),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Icon(Icons.info, size: 20, color: iconColor),
        ),
      ),
    );
  }
}

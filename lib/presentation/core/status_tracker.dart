import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class StatusTrackerSection extends StatelessWidget {
  const StatusTrackerSection({
    Key? key,
    required this.title,
    required this.status,
    required this.createDateTime,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final String status;
  final DateTimeStringValue createDateTime;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      key: WidgetKeys.statusTracker(status),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          title: Text(
            title,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 15,
          ),
          onTap: onTap,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 10),
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.circle,
                    size: 15,
                    color: ZPColors.extraDarkGreen,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    context.tr(status),
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(color: ZPColors.extraDarkGreen),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 7),
                    color: ZPColors.lightGray,
                    width: 1,
                    height: 20,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    createDateTime.dateTimeWithTimeZone,
                    textAlign: TextAlign.end,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: ZPColors.darkGray),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

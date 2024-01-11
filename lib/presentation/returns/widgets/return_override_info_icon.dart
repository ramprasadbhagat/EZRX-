import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class ReturnOverrideInfoIcon extends StatelessWidget {
  final String header;
  final String content;
  final String subContent;

  const ReturnOverrideInfoIcon._({
    Key? key,
    required this.header,
    required this.content,
    required this.subContent,
  }) : super(key: key);

  factory ReturnOverrideInfoIcon.quantity({required int initialQuantity}) =>
      ReturnOverrideInfoIcon._(
        header: 'Return quantity changed',
        content: '${'Request Return quantity :'} <$initialQuantity>',
        subContent: 'Approver updated the QTY',
      );

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          enableDrag: false,
          isDismissible: false,
          isScrollControlled: true,
          builder: (_) {
            return _ReturnInfoBottomSheet(
              header: header,
              content: content,
              subContent: subContent,
            );
          },
        );
      },
      icon: const Icon(
        Icons.info,
        size: 18,
      ),
    );
  }
}

class _ReturnInfoBottomSheet extends StatelessWidget {
  final String header;
  final String content;
  final String subContent;
  const _ReturnInfoBottomSheet({
    Key? key,
    required this.header,
    required this.content,
    required this.subContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: 60,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            context.tr(header),
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: ZPColors.primary,
                ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            context.tr(content),
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: ZPColors.extraLightGrey4,
                ),
          ),
          Text(
            context.tr(subContent),
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: ZPColors.extraLightGrey4,
                ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              context.router.pop();
            },
            child: Text(
              context.tr('Got it'),
            ),
          ),
        ],
      ),
    );
  }
}

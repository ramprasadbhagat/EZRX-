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

  factory ReturnOverrideInfoIcon.quantity({
    required BuildContext context,
    required int initialQuantity,
  }) =>
      ReturnOverrideInfoIcon._(
        header: context.tr('Return quantity changed'),
        content:
            '${context.tr('Request Return quantity :')} <$initialQuantity>',
        subContent: context.tr('Approver updated the QTY'),
      );

  factory ReturnOverrideInfoIcon.price({
    required BuildContext context,
    required String price,
    required bool displaySubContent,
  }) =>
      ReturnOverrideInfoIcon._(
        header: context.tr('Return value changed'),
        content: '${context.tr('Request counter offer :')} <$price>',
        subContent:
            displaySubContent ? context.tr('Approver updated the value') : '',
      );

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
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
            header,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: ZPColors.primary,
                ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            content,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: ZPColors.extraLightGrey4,
                ),
          ),
          if (subContent.isNotEmpty)
            Text(
              subContent,
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

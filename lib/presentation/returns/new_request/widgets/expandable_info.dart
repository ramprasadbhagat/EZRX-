import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class ExpandableInfo extends StatefulWidget {
  const ExpandableInfo({
    Key? key,
    required this.labelText,
    required this.child,
    this.expandable = false,
  }) : super(key: key);
  final Widget child;
  final String labelText;
  final bool expandable;

  @override
  State<ExpandableInfo> createState() => _ExpandableInfoState();
}

class _ExpandableInfoState extends State<ExpandableInfo> {
  bool _isExpanded = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(
          indent: 0,
          height: 12,
          endIndent: 0,
          color: ZPColors.lightGray2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                widget.labelText,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            if (widget.expandable)
              IconButton(
                visualDensity: const VisualDensity(vertical: -4),
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                icon: const Icon(
                  Icons.keyboard_arrow_down_outlined,
                ),
              ),
          ],
        ),
        if (_isExpanded) widget.child,
      ],
    );
  }
}

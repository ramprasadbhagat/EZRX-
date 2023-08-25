import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class ExpandableSection extends StatefulWidget {
  final List<Widget> children;
  final bool expanded;
  const ExpandableSection({
    Key? key,
    required this.children,
    required this.expanded,
  }) : super(key: key);

  @override
  State<ExpandableSection> createState() => _ExpandableSectionState();
}

class _ExpandableSectionState extends State<ExpandableSection> {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.expanded;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _isExpanded ? 'Hide details'.tr() : 'Show details'.tr(),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ZPColors.extraDarkGreen,
                      fontWeight: FontWeight.w800,
                    ),
              ),
              const SizedBox(
                width: 10,
              ),
              Icon(
                _isExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                color: ZPColors.extraDarkGreen,
              ),
            ],
          ),
        ),
        if (_isExpanded)
          Column(
            children: widget.children,
          ),
      ],
    );
  }
}

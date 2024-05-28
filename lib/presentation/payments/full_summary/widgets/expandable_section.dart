part of 'package:ezrxmobile/presentation/payments/full_summary/full_summary.dart';

class _ExpandableSection extends StatefulWidget {
  final Widget child;
  const _ExpandableSection({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<_ExpandableSection> createState() => _ExpandableSectionState();
}

class _ExpandableSectionState extends State<_ExpandableSection> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: InkWell(
            key: WidgetKeys.summaryExpandableSection,
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _isExpanded
                      ? context.tr('Hide Debit/Credit Ref. Number(s)')
                      : context.tr('Show Debit/Credit Ref. Number(s)'),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: ZPColors.extraDarkGreen,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(
                  width: 8,
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
        ),
        const Divider(
          height: 1,
          indent: 0,
          endIndent: 0,
          color: ZPColors.lightGray2,
        ),
        _isExpanded ? widget.child : const SizedBox.shrink(),
      ],
    );
  }
}

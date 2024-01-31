part of 'package:ezrxmobile/presentation/returns/return_summary_request_details/widgets/request_item_section.dart';

class _ExpandableDetailSection extends StatefulWidget {
  const _ExpandableDetailSection({
    Key? key,
    required this.isExpandable,
    required this.expandWidget,
  }) : super(key: key);
  final bool isExpandable;
  final Widget expandWidget;

  @override
  State<_ExpandableDetailSection> createState() =>
      __ExpandableDetailSectionState();
}

class __ExpandableDetailSectionState extends State<_ExpandableDetailSection> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.isExpandable)
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: InkWell(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: Row(
                key: WidgetKeys.returnDetailShowDetailButton,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    isExpanded
                        ? context.tr('Hide details')
                        : context.tr('Show details'),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: ZPColors.extraDarkGreen,
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: ZPColors.extraDarkGreen,
                  ),
                ],
              ),
            ),
          ),
        if (isExpanded)
          const Divider(
            indent: 0,
            height: 20,
            endIndent: 0,
            color: ZPColors.lightGray2,
          ),
        if (widget.isExpandable ? isExpanded : true) widget.expandWidget,
      ],
    );
  }
}

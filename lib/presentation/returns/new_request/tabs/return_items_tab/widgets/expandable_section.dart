part of 'package:ezrxmobile/presentation/returns/new_request/tabs/return_items_tab/return_items_tab.dart';

class _ExpandableSection extends StatefulWidget {
  final List<Widget> children;
  const _ExpandableSection({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  State<_ExpandableSection> createState() => _ExpandableSectionState();
}

class _ExpandableSectionState extends State<_ExpandableSection> {
  bool _isExpanded = false;
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
        _isExpanded
            ? Column(
                children: widget.children,
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}

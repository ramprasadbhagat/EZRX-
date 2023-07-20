//ignore_for_file: unused-code
//ignore_for_file: unused-class
//ignore_for_file: unused-files
import 'package:flutter/material.dart';

class SelectableExpansionTileList extends StatefulWidget {
  final List<SelectableExpansionTile> expansionTileList;

  SelectableExpansionTileList({
    Key? key,
    required this.expansionTileList,
  })  : assert(
            expansionTileList.isNotEmpty, 'expansionTileList cannot be empty'),
        assert(
          expansionTileList.where((element) => element.expanded).length < 2,
          'single SelectableExpansionTile can Be selected initially',
        ),
        super(key: key);

  @override
  State<SelectableExpansionTileList> createState() =>
      _SelectableExpansionTileListState();
}

class _SelectableExpansionTileListState
    extends State<SelectableExpansionTileList> {
  final ValueNotifier<int> expanded = ValueNotifier(0);

  @override
  void initState() {
    expanded.value = widget.expansionTileList
        .indexWhere((SelectableExpansionTile e) => e.expanded);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: expanded,
      builder: (BuildContext context, int value, _) {
        return Column(
          children: List.generate(widget.expansionTileList.length, (index) {
            final expansionTile = widget.expansionTileList.elementAt(index);

            return SelectableExpansionTile(
              header: expansionTile.header,
              body: expansionTile.body,
              expanded: value == index,
              onPress: () {
                expanded.value = index;
                expansionTile.onPress();
              },
            );
          }),
        );
      },
    );
  }
}

class SelectableExpansionTile extends StatelessWidget {
  final Widget header;
  final Widget body;
  final VoidCallback onPress;
  final bool expanded;
  const SelectableExpansionTile({
    Key? key,
    required this.header,
    required this.body,
    required this.onPress,
    this.expanded = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: GestureDetector(
        onTap: () => onPress(),
        child: header,
      ),
      secondChild: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          header,
          body,
        ],
      ),
      crossFadeState:
          expanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: const Duration(milliseconds: 300),
    );
  }
}

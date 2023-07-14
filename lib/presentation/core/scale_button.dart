import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class ScaleButton extends StatefulWidget {
  final GestureTapCallback onPress;
  final IconData icon;
  final String label;
  final ScrollController scrollController;

  const ScaleButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onPress,
    required this.scrollController,
  }) : super(key: key);

  @override
  State<ScaleButton> createState() => _ScaleButtonState();
}

class _ScaleButtonState extends State<ScaleButton> {
  bool isExpanded = true;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    if (widget.scrollController.hasClients) {
      widget.scrollController.removeListener(_scrollListener);
      widget.scrollController.dispose();
    }
    super.dispose();
  }

  void _scrollListener() {
    setState(() => isExpanded = widget.scrollController.position.pixels == 0);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton.extended(
          extendedPadding: const EdgeInsets.only(left: 12, right: 12),
          onPressed: widget.onPress,
          label: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(
                opacity: animation,
                child: SizeTransition(
                  sizeFactor: animation,
                  axis: Axis.horizontal,
                  child: child,
                ),
              );
            },
            child: isExpanded
                ? Row(
                    children: [
                      Icon(widget.icon),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(widget.label),
                      ),
                    ],
                  )
                : Icon(widget.icon),
          ),
        ),
        isExpanded
            ? const SizedBox.shrink()
            : FloatingActionButton.small(
                backgroundColor: ZPColors.lightYellow,
                onPressed: () {
                  widget.scrollController.position.animateTo(
                    widget.scrollController.position.minScrollExtent,
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                  );
                },
                child: const Icon(
                  Icons.expand_less_outlined,
                  color: ZPColors.black,
                ),
              ),
      ],
    );
  }
}

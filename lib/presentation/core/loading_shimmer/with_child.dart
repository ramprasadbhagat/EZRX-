part of 'loading_shimmer.dart';

class _WithChild extends StatelessWidget {
  const _WithChild({
    Key? key,
    required this.child,
    required this.enabled,
    this.center = true,
  }) : super(key: key);
  final Widget child;
  final bool enabled;
  final bool center;

  @override
  Widget build(BuildContext context) {
    final widget = !enabled
        ? child
        : Shimmer.fromColors(
            baseColor: ZPColors.lightGray,
            highlightColor: ZPColors.white,
            enabled: true,
            child: child,
          );

    return center ? Center(child: widget) : widget;
  }
}

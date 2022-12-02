part of 'loading_shimmer.dart';

class _WithChild extends StatelessWidget {
  const _WithChild({
    Key? key,
    required this.child,
    required this.enabled,
  }) : super(key: key);
  final Widget child;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    if (!enabled) return Center(child: child);

    return Center(
      child: Shimmer.fromColors(
        baseColor: ZPColors.lightGray,
        highlightColor: ZPColors.white,
        enabled: true,
        child: child,
      ),
    );
  }
}

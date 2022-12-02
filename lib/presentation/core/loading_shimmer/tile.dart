part of 'loading_shimmer.dart';

class _Tile extends StatelessWidget {
  const _Tile({
    Key? key,
    required this.enabled,
    required this.line,
  }) : super(key: key);
  final int line;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Shimmer.fromColors(
        baseColor: ZPColors.lightGray,
        highlightColor: ZPColors.white,
        enabled: enabled,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List<Widget>.filled(
            line,
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 8.0,
                  color: ZPColors.white,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

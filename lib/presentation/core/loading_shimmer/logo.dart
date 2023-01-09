part of 'loading_shimmer.dart';

class _Logo extends StatelessWidget {
  const _Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _WithChild(
      enabled: true,
      child: SvgPicture.asset(
        'assets/svg/ezrxlogo.svg',
        width: 80,
        height: 80,
      ),
    );
  }
}
